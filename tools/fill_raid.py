#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Safe raid-tips filler.

Loads the SOURCE Guides/Raids/v<ver>.lua via lupa so that instanceId and
encounterIds are copied VERBATIM from the live tables (zero transcription risk),
then re-emits the file with:
  * unchanged instanceId / encounterIds (only keys may be renamed via keymap)
  * authored `tips` injected per boss (keyed by CN name)
  * boss keys renamed per keymap (English -> 国服名)

Inputs (in tools/):
  _tips_<ver>.json     { instance: { cn_boss_name: tips_string } }
  _keymap_<ver>.json    { instance: { orig_key: cn_boss_name } }   (can be {})
  _instorder_<ver>.json [ instance1, instance2, ... ]

Output: Guides/Raids/v<ver>.lua  (overwritten)
"""
import sys, os, json
from lupa import LuaRuntime

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
        if cn not in tips.get(inst, {}):
            missing.append(f"{inst}/{cn}")
            t = ""
        else:
            t = tips[inst][cn]
        out.append(f'    ["{cn}"] = {{ order = {v["order"]}, type = "BOSS", tips = [=[{t}]=], tipsByDifficulty = {{}} }},')
    out.append('}')
    out.append(f'addon.GuideData.meta["{inst}"] = {{ isRaid = true, instanceId = {inst_id}, encounterIds = {{')
    enc = mtab["encounterIds"]
    enc_items = [(k, e) for k, e in enc.items()]
    # emit in boss order for readability
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
