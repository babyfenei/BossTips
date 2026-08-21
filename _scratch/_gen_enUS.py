# -*- coding: utf-8 -*-
"""Generate enUS translation files for all native dungeon + raid versions.

Reads:
  _enUS_data.NAME_MAP  : zh name -> en name   (instances + bosses)
  _enUS_data.TIP_MAP   : zh tip string -> en tip string (final-format English)
Only entities present in the maps are emitted; others gracefully fall back to
the zhCN source at runtime (addon's designed behavior).

Output: Guides/Dungeons/vX.Y_enUS.lua -> translations.enUS.native["X.Y"]
        Guides/Raids/vX.Y_enUS.lua    -> translations.enUS.raids["X.Y"]
"""
import os, lupa, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from _enUS_data import NAME_MAP, TIP_MAP

# MT cache (zh tip text -> en tip text) built by _build_mt_cache.py via MyMemory.
_MT_CACHE_PATH = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_enUS_mt_cache.json")
MT_CACHE = {}
if os.path.exists(_MT_CACHE_PATH):
    try:
        MT_CACHE = json.load(open(_MT_CACHE_PATH, encoding="utf-8"))
    except Exception:
        MT_CACHE = {}

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
RAID_VERS = ["%d.0" % i for i in range(1, 13)] + ["12.1"]

def load_guidedata():
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon = {}")
    def load(rel):
        p = os.path.join(BASE, rel)
        if not os.path.exists(p): return
        c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(c)
    for v in NATIVE_VERS: load("Guides/Dungeons/v%s.lua" % v)
    for v in RAID_VERS: load("Guides/Raids/v%s.lua" % v)
    return lua.globals()["BossTipsAddon"]["GuideData"]

def qstr(s):
    s = s if isinstance(s, str) else str(s)
    s = s.replace("\\", "\\\\").replace('"', '\\"')
    return '"%s"' % s

def esc_key(k):
    k = k.replace("\\", "\\\\").replace('"', '\\"')
    return '["%s"]' % k

def g(t, k):
    """Safe Lua-table index (lupa tables have no .get())."""
    try:
        v = t[k]
        return v
    except Exception:
        return None

def translate_tip(name_key, diff, zh):
    """English tip: hand TIP_MAP (by boss+diff) wins, else MT cache (by zh text).
    Returns None when neither is available (caller falls back to zhCN source)."""
    if not zh:
        return None
    hand = TIP_MAP.get((name_key, diff))
    if hand:
        return hand
    return MT_CACHE.get(zh)

def boss_block_en(name_key, b):
    en_name = NAME_MAP.get(name_key)
    btype = b["type"] or "BOSS"
    if btype == "MOB":
        en_tip = translate_tip(name_key, "mob", b["tips"])
        if not en_name and not en_tip:
            return None
        parts = ["        %s = {" % esc_key(name_key)]
        parts.append('            type = "MOB",')
        if en_name:
            parts.append("            name = %s," % qstr(en_name))
        if en_tip:
            parts.append("            tips = %s," % qstr(en_tip))
        parts.append("        },")
        return "\n".join(parts)
    # BOSS
    COMBAT_DIFFS = ("lfr", "normal", "heroic", "mythic", "mythicplus")
    tbd = b["tipsByDifficulty"]
    flat = {}
    if tbd:
        for dk in COMBAT_DIFFS:
            zh = g(tbd, dk)
            en = translate_tip(name_key, dk, zh) if zh else None
            if en:
                flat[dk] = en
    else:
        for k in ("lfr", "normal", "heroic", "mythic"):
            zh = g(b, k)
            en = translate_tip(name_key, k, zh) if zh else None
            if en:
                flat[k] = en
    # Guide text is shared across difficulties in the source; fill any absent
    # combat-difficulty slots from an available English base so every view is EN.
    if flat:
        base = flat.get("lfr") or flat.get("normal") or next(iter(flat.values()))
        for dk in COMBAT_DIFFS:
            if dk not in flat:
                flat[dk] = base
    has_tip = any(flat.values())
    if not en_name and not has_tip:
        return None
    parts = ["        %s = {" % esc_key(name_key)]
    parts.append('            type = "BOSS",')
    if en_name:
        parts.append("            name = %s," % qstr(en_name))
    if tbd:
        inner = "\n".join("                %s = %s," % (esc_key(k), qstr(v)) for k, v in flat.items())
        if inner:
            parts.append("            tipsByDifficulty = {")
            parts.append(inner)
            parts.append("            },")
    else:
        inner = "\n".join("            %s = %s," % (esc_key(k), qstr(v)) for k, v in flat.items())
        if inner:
            parts.append(inner)
    parts.append("        },")
    return "\n".join(parts)

def gen_category(GD, cat, vers, outdir, outcat):
    written = []
    sec = GD[cat]
    for ver in vers:
        src = sec[ver] if sec else None
        if not src:
            continue
        lines = []
        lines.append("-- ============================================================================")
        lines.append("-- BossTips %s 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）" % ver)
        lines.append("-- ============================================================================")
        lines.append("local _, addon = ...")
        lines.append("addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }")
        lines.append("addon.GuideData.translations = addon.GuideData.translations or {}")
        lines.append("addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}")
        lines.append("addon.GuideData.translations.enUS.%s = addon.GuideData.translations.enUS.%s or {}" % (outcat, outcat))
        lines.append("addon.GuideData.translations.enUS.%s%s = {" % (outcat, esc_key(ver)))
        inst_count = 0; boss_count = 0
        for inst_key, bosses in src.items():
            if not hasattr(bosses, "items"):
                continue
            en_inst = NAME_MAP.get(inst_key)
            blocks = []
            for bk, b in bosses.items():
                if not hasattr(b, "items"):
                    continue
                blk = boss_block_en(bk, b)
                if blk:
                    blocks.append(blk)
                    boss_count += 1
            # Emit the instance if it has an English name OR any localized boss
            # blocks. Instances with only a name still localize the navigation
            # tree / title; bosses without a mapping fall back to zhCN at runtime.
            if not blocks and not en_inst:
                continue
            inst_count += 1
            lines.append("    %s = {" % esc_key(inst_key))
            if en_inst:
                lines.append("        name = %s," % qstr(en_inst))
            lines.extend(blocks)
            lines.append("    },")
        lines.append("}")
        out = "\n".join(lines) + "\n"
        fn = os.path.join(outdir, "v%s_enUS.lua" % ver)
        with open(fn, "w", encoding="utf-8") as f:
            f.write(out)
        written.append((ver, fn, inst_count, boss_count))
    return written

def main():
    GD = load_guidedata()
    dout = os.path.join(BASE, "Guides", "Dungeons")
    rout = os.path.join(BASE, "Guides", "Raids")
    w1 = gen_category(GD, "versions", NATIVE_VERS, dout, "native")
    w2 = gen_category(GD, "raids", RAID_VERS, rout, "raids")
    print("=== enUS native dungeons ===")
    for ver, fn, i, b in w1:
        print("  v%s : %d instances, %d bosses -> %s" % (ver, i, b, os.path.basename(fn)))
    print("=== enUS raids ===")
    for ver, fn, i, b in w2:
        print("  v%s : %d instances, %d bosses -> %s" % (ver, i, b, os.path.basename(fn)))
    print("Total files:", len(w1) + len(w2))

if __name__ == "__main__":
    main()
