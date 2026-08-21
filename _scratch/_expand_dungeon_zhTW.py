# -*- coding: utf-8 -*-
"""Expand the existing zhTW native-dungeon translation files so every BOSS has
all five combat difficulties (lfr/normal/heroic/mythic/mythicplus) filled with
the already-present Traditional Chinese text.

Root cause: GetGuideText(entry, diff) resolves `b.tipsByDifficulty[diff]` using
the *current display difficulty* (5-man dungeons default to mythicplus). The
existing zhTW native files only populated `lfr` (opencc s2t from the zhCN
source, which itself only carries `lfr`), so every non-lfr view fell back to
the zhCN source -> Traditional Chinese mode showed Simplified Chinese.

The source dungeon guides only carry `lfr` content (identical across
difficulties), so mirroring that Traditional Chinese into all 5 difficulties is
correct. This script reads the EXISTING zhTW file (which already holds good
Traditional Chinese) and only adds missing difficulty keys -- never re-translates.
"""
import os, lupa, shutil

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
COMBAT_DIFFS = ("lfr", "normal", "heroic", "mythic", "mythicplus")

def g(t, k):
    try:
        return t[k]
    except Exception:
        return None

def load(rel):
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon = {}")
    c = open(os.path.join(BASE, rel), encoding="utf-8").read().replace(
        "local _, addon = ...", "local addon = BossTipsAddon")
    lua.execute(c)
    return lua.globals()["BossTipsAddon"]["GuideData"]

def qstr(s):
    s = s if isinstance(s, str) else str(s)
    s = s.replace("\\", "\\\\").replace('"', '\\"')
    return '"%s"' % s

def esc_key(k):
    k = k.replace("\\", "\\\\").replace('"', '\\"')
    return '["%s"]' % k

def boss_block(bk, b):
    btype = g(b, "type") or "BOSS"
    tw_name = g(b, "name")
    if btype == "MOB":
        tw_tip = g(b, "tips")
        if not tw_name and not tw_tip:
            return None
        parts = ["        %s = {" % esc_key(bk)]
        parts.append('            type = "MOB",')
        if tw_name:
            parts.append("            name = %s," % qstr(tw_name))
        if tw_tip:
            parts.append("            tips = %s," % qstr(tw_tip))
        parts.append("        },")
        return "\n".join(parts)
    # BOSS: gather a Traditional Chinese base from whatever is already present
    base = None
    td = g(b, "tipsByDifficulty")
    if td:
        for dk in COMBAT_DIFFS:
            v = g(td, dk)
            if v:
                base = v
                break
    if not base:
        for dk in COMBAT_DIFFS:
            v = g(b, dk)
            if v:
                base = v
                break
    if not base:
        return None  # nothing to mirror; leave out (will fall back to zhCN)
    flat = {dk: base for dk in COMBAT_DIFFS}
    parts = ["        %s = {" % esc_key(bk)]
    parts.append('            type = "BOSS",')
    if tw_name:
        parts.append("            name = %s," % qstr(tw_name))
    inner = "\n".join("                %s = %s," % (esc_key(dk), qstr(txt))
                      for dk, txt in flat.items())
    parts.append("            tipsByDifficulty = {")
    parts.append(inner)
    parts.append("            },")
    parts.append("        },")
    return "\n".join(parts)

def main():
    for v in NATIVE_VERS:
        rel = "Guides/Dungeons/v%s_zhTW.lua" % v
        path = os.path.join(BASE, rel)
        if not os.path.exists(path):
            print("v%s: zhTW file missing, skip" % v)
            continue
        GD = load(rel)
        T = g(g(g(GD, "translations"), "zhTW"), "native")
        sec = g(T, v)
        if not sec:
            print("v%s: no zhTW native section, skip" % v)
            continue
        lines = []
        lines.append("-- ============================================================================")
        lines.append("-- BossTips %s 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）" % v)
        lines.append("-- 原生 5 人本仅源 lfr 一档；按 enUS 同策略镜像 lfr 到 5 难度，避免非 lfr 难度回退简中。")
        lines.append("-- ============================================================================")
        lines.append("local _, addon = ...")
        lines.append("addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }")
        lines.append("addon.GuideData.translations = addon.GuideData.translations or {}")
        lines.append("addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}")
        lines.append("addon.GuideData.translations.zhTW.native = addon.GuideData.translations.zhTW.native or {}")
        lines.append("addon.GuideData.translations.zhTW.native%s = {" % esc_key(v))
        inst_count = 0
        entry_count = 0
        for inst_key, bosses in sec.items():
            if not hasattr(bosses, "items"):
                continue
            tw_inst = g(bosses, "name")
            blocks = []
            for bk, b in bosses.items():
                if not hasattr(b, "items"):
                    continue
                blk = boss_block(bk, b)
                if blk:
                    blocks.append(blk)
                    entry_count += 1
            if not blocks and not tw_inst:
                continue
            inst_count += 1
            lines.append("    %s = {" % esc_key(inst_key))
            if tw_inst:
                lines.append("        name = %s," % qstr(tw_inst))
            lines.extend(blocks)
            lines.append("    },")
        lines.append("}")
        out = "\n".join(lines) + "\n"
        bak = path + ".bak"
        if not os.path.exists(bak):
            shutil.copy2(path, bak)
        with open(path, "w", encoding="utf-8") as f:
            f.write(out)
        print("v%s: %d instances, %d boss/mob entries written" % (v, inst_count, entry_count))

if __name__ == "__main__":
    main()
