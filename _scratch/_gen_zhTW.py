# -*- coding: utf-8 -*-
"""
Generate zhTW translation files for ALL native dungeon versions (1.0-12.0)
and raid versions (1.0-12.1) via opencc s2t conversion of instance/boss names + tips.

Output:
  Guides/Dungeons/vX.Y_zhTW.lua   -> translations.zhTW.native["X.Y"]
  Guides/Raids/vX.Y_zhTW.lua      -> translations.zhTW.raids["X.Y"]
(M+ Current_zhTW.lua already exists; skipped.)

Format mirrors source:
  native BOSS -> type+name+tipsByDifficulty{lfr} ; MOB -> type+name+tips
  raid   BOSS -> type+name+flat lfr/normal/heroic/mythic ; MOB -> type+name+tips
"""
import os, lupa, opencc

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
cc = opencc.OpenCC("s2t")

NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]   # 1.0 .. 12.0
RAID_VERS = ["%d.0" % i for i in range(1, 13)] + ["12.1"]

def load_guidedata():
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon = {}")
    def load(rel):
        p = os.path.join(BASE, rel)
        if not os.path.exists(p):
            return
        code = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(code)
    for v in NATIVE_VERS:
        load("Guides/Dungeons/v%s.lua" % v)
    for v in RAID_VERS:
        load("Guides/Raids/v%s.lua" % v)
    return lua.globals()["BossTipsAddon"]["GuideData"]

def safe_long(s):
    """Return a Lua string literal safe for any content (quoted + escaped).
    Long strings are avoided because a tip ending in ']' collides with the
    closing ']]' delimiter at the boundary."""
    s = s if isinstance(s, str) else str(s)
    s = s.replace("\\", "\\\\").replace('"', '\\"')
    return '"%s"' % s

def t(s):
    if not isinstance(s, str):
        return s
    return cc.convert(s)

def esc_key(k):
    # quoted key with escaping (handles embedded quotes like "船长"曲奇)
    k = k.replace("\\", "\\\\").replace('"', '\\"')
    return '["%s"]' % k

def boss_block_zhTW(name_key, b):
    """Produce the translated boss/MOB block (zhTW)."""
    btype = b["type"] or "BOSS"
    disp = t(b["name"] or name_key)
    if btype == "MOB":
        tip = t(b["tips"] or "")
        return "        %s = {\n            type = \"MOB\",\n            name = %s,\n            tips = %s,\n        }," % (
            esc_key(name_key), safe_long(disp), safe_long(tip))
    # BOSS
    tbd = b["tipsByDifficulty"]
    if tbd:
        keys = [k for k in ("lfr", "normal", "heroic", "mythic", "mythicplus") if tbd[k]]
        inner = "\n".join("                %s = %s," % (esc_key(k), safe_long(t(tbd[k]))) for k in keys)
        return "        %s = {\n            type = \"BOSS\",\n            name = %s,\n            tipsByDifficulty = {\n%s\n            },\n        }," % (esc_key(name_key), safe_long(disp), inner)
    # flat difficulty keys (raids)
    flat = {}
    for k in ("lfr", "normal", "heroic", "mythic", "mythicplus"):
        v = b[k]
        if isinstance(v, str) and v != "":
            flat[k] = v
    if flat:
        inner = "\n".join("            %s = %s," % (esc_key(k), safe_long(t(v))) for k, v in flat.items())
        return "        %s = {\n            type = \"BOSS\",\n            name = %s,\n%s\n        }," % (esc_key(name_key), safe_long(disp), inner)
    return None

def gen_category(GD, cat, vers, outdir, outcat):
    written = []
    sec = GD[cat]
    for ver in vers:
        src = sec[ver] if sec else None
        if not src:
            continue
        lines = []
        lines.append("-- ============================================================================")
        lines.append("-- BossTips %s 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）" % ver)
        lines.append("-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。")
        lines.append("-- ============================================================================")
        lines.append("local _, addon = ...")
        lines.append("addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }")
        lines.append("addon.GuideData.translations = addon.GuideData.translations or {}")
        lines.append("addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}")
        lines.append("addon.GuideData.translations.zhTW.%s = addon.GuideData.translations.zhTW.%s or {}" % (outcat, outcat))
        lines.append("addon.GuideData.translations.zhTW.%s%s = {" % (outcat, esc_key(ver)))
        inst_count = 0
        boss_count = 0
        for inst_key, bosses in src.items():
            if not hasattr(bosses, "items"):
                continue
            inst_count += 1
            blocks = []
            for bk, b in bosses.items():
                if not hasattr(b, "items"):
                    continue
                blk = boss_block_zhTW(bk, b)
                if blk:
                    blocks.append(blk)
                    boss_count += 1
            if not blocks:
                continue
            lines.append("    %s = {" % esc_key(inst_key))
            lines.append("        name = %s," % safe_long(t(inst_key)))
            lines.extend(blocks)
            lines.append("    },")
        lines.append("}")
        out = "\n".join(lines) + "\n"
        fn = os.path.join(outdir, "v%s_zhTW.lua" % ver)
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
    print("=== zhTW native dungeons ===")
    for ver, fn, i, b in w1:
        print("  v%s : %d instances, %d bosses -> %s" % (ver, i, b, os.path.basename(fn)))
    print("=== zhTW raids ===")
    for ver, fn, i, b in w2:
        print("  v%s : %d instances, %d bosses -> %s" % (ver, i, b, os.path.basename(fn)))
    print("Total files:", len(w1) + len(w2))

if __name__ == "__main__":
    main()
