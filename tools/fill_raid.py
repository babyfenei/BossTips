#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Safe raid-tips filler.

Loads the SOURCE Guides/Raids/v<ver>.lua via lupa so that instanceId and
encounterIds are copied VERBATIM from the live tables (zero transcription risk),
then re-emits the file with:
  * unchanged instanceId / encounterIds (only keys may be renamed via keymap)
  * authored `tips` injected per boss (keyed by CN name)
  * optional per-difficulty tips injected into `tipsByDifficulty`

Inputs (in tools/):
  _tips_<ver>.json     { instance: { cn_boss_name: tips_string
                                     | { "tips": str,
                                         "tipsByDifficulty": { normal: str, heroic: str, mythic: str, lfr: str, mythicplus: str } } } }
  _keymap_<ver>.json    { instance: { orig_key: cn_boss_name } }   (can be {})
  _instorder_<ver>.json [ instance1, instance2, ... ]

Output: Guides/Raids/v<ver>.lua  (overwritten)

Per-difficulty semantics: any difficulty key present in `tipsByDifficulty` is
emitted; missing difficulties fall back to the general `tips` at runtime
(BuildActiveGuides). `DIFF_ORDER` lists the canonical 5 keys.
"""
import sys, os, json
from lupa import LuaRuntime

DIFF_ORDER = ("lfr", "normal", "heroic", "mythic", "mythicplus")


def fmt_boss(cn, order, general, diffs):
    """Emit one boss table line. `diffs` is a dict of difficulty -> tips string."""
    diff_str = ""
    if diffs:
        parts = []
        for dk in DIFF_ORDER:
            dv = diffs.get(dk)
            if dv:
                parts.append(f'{dk} = [=[{dv}]=]')
        if parts:
            diff_str = ", ".join(parts)
    return (f'    ["{cn}"] = {{ order = {order}, type = "BOSS", '
            f'tips = [=[{general}]=], tipsByDifficulty = {{{diff_str}}} }},')


def _normalize_tips(raw):
    """Return (general, diffs) from a bare string or per-difficulty dict."""
    if isinstance(raw, str):
        return raw, {}
    if isinstance(raw, dict):
        general = raw.get("tips", "") or ""
        diffs = raw.get("tipsByDifficulty", {}) or {}
        return general, diffs
    return "", {}


def main():
    ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    VER = sys.argv[1]

    src_path = os.path.join(ROOT, "Guides", "Raids", f"v{VER}.lua")
    tips = json.load(open(os.path.join(ROOT, "tools", f"_tips_{VER}.json"), encoding="utf-8"))
    keymap = json.load(open(os.path.join(ROOT, "tools", f"_keymap_{VER}.json"), encoding="utf-8"))
    inst_order = json.load(open(os.path.join(ROOT, "tools", f"_instorder_{VER}.json"), encoding="utf-8"))

    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BT_addon = {}")
    content = open(src_path, encoding="utf-8").read()
    content = content.replace("local _, addon = ...", "local addon = _G.BT_addon", 1)
    lua.execute(content)
    GD = lua.eval("_G.BT_addon.GuideData")

    raids = GD["raids"][VER]
    meta = GD["meta"]

    out = []
    out.append("-- ============================================================================")
    out.append(f"-- BossTips Raid Guide Data —— 版本 {VER} 团本攻略")
    out.append("-- 实例 key 为国服名；首领 key 为国服名；encounterId 取自 BigWigs/DBM（原样保留）。")
    out.append("-- 攻略格式：{rt8}名字{rt8}||[机制]描述||{rt1}必断/速杀：…{rt1}||坦：…治疗：…输出：…")
    out.append("-- 分难度：tipsByDifficulty 支持 lfr/normal/heroic/mythic/mythicplus（缺档位进游戏时回退通用 tips）。")
    out.append("-- ============================================================================")
    out.append('local _, addon = ...')
    out.append('addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }')
    out.append('addon.GuideData.raids = addon.GuideData.raids or {}')
    out.append(f'addon.GuideData.raids["{VER}"] = addon.GuideData.raids["{VER}"] or {{}}')
    out.append('addon.GuideData.meta = addon.GuideData.meta or {}')
    out.append('')

    missing = []
    for inst in inst_order:
        assert inst in raids, f"instance {inst} missing in source raids"
        btab = raids[inst]
        mtab = meta[inst]
        inst_id = mtab["instanceId"]
        out.append(f'-- ===================== {inst} (instanceId {inst_id}) =====================')
        out.append(f'addon.GuideData.raids["{VER}"]["{inst}"] = {{')
        bosses = [(k, v) for k, v in btab.items()]
        bosses.sort(key=lambda kv: kv[1]["order"])
        for k, v in bosses:
            cn = keymap.get(inst, {}).get(k, k)
            inst_tips = tips.get(inst, {})
            if cn not in inst_tips:
                missing.append(f"{inst}/{cn}")
                general, diffs = "", {}
            else:
                general, diffs = _normalize_tips(inst_tips[cn])
            out.append(fmt_boss(cn, v["order"], general, diffs))
        out.append('}')
        out.append(f'addon.GuideData.meta["{inst}"] = {{ isRaid = true, instanceId = {inst_id}, encounterIds = {{')
        enc = mtab["encounterIds"]
        enc_items = [(k, e) for k, e in enc.items()]
        enc_items.sort(key=lambda kv: btab[kv[0]]["order"] if kv[0] in btab else 0)
        for k, e in enc_items:
            cn = keymap.get(inst, {}).get(k, k)
            out.append(f'    ["{cn}"] = {e},')
        out.append('} }')
        out.append('')

    if missing:
        raise SystemExit("MISSING TIPS for: " + "; ".join(missing))

    with open(src_path, "w", encoding="utf-8") as f:
        f.write("\n".join(out) + "\n")

    print(f"wrote {src_path}  instances={len(inst_order)}")


if __name__ == "__main__":
    main()
