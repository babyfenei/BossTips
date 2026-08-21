# -*- coding: utf-8 -*-
"""
Validate that generated translation files cover every source entry.
Usage: python _validate_translations.py <locale> <cat> <ver>
  locale: zhTW | enUS
  cat:    native | raids | mplus
  ver:    e.g. 1.0 / 12.1 / Current
Loads source GuideData + the translation file, then checks every source boss
has a translated name and a non-empty tip for the relevant difficulty.
"""
import os, sys, lupa

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
RAID_VERS = ["%d.0" % i for i in range(1, 13)] + ["12.1"]

def setup():
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon = {}")
    def load(rel):
        p = os.path.join(BASE, rel)
        if not os.path.exists(p):
            return False
        code = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(code)
        return True
    for v in NATIVE_VERS:
        load("Guides/Dungeons/v%s.lua" % v)
    for v in RAID_VERS:
        load("Guides/Raids/v%s.lua" % v)
    load("Guides/MPlus/Current.lua")
    return lua.globals()["BossTipsAddon"]

def main():
    locale = sys.argv[1]
    cat = sys.argv[2]
    ver = sys.argv[3]
    GD = setup()
    # load the translation file
    if cat == "native":
        tf = "Guides/Dungeons/v%s_%s.lua" % (ver, locale)
    elif cat == "raids":
        tf = "Guides/Raids/v%s_%s.lua" % (ver, locale)
    else:
        tf = "Guides/MPlus/Current_%s.lua" % locale
    if not os.path.exists(os.path.join(BASE, tf)):
        print("MISSING translation file:", tf)
        sys.exit(1)
    code = open(os.path.join(BASE, tf), encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
    try:
        chk = lupa.LuaRuntime(unpack_returned_tuples=True)
        chk.execute("BossTipsAddon = {}")
        chk.execute(code)
    except Exception as e:
        print("SYNTAX/RUNTIME ERROR in", tf, ":", repr(e))
        sys.exit(1)
    # reload into same runtime
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BossTipsAddon = {}")
    def load(rel):
        p = os.path.join(BASE, rel)
        c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(c)
    for v in NATIVE_VERS:
        load("Guides/Dungeons/v%s.lua" % v)
    for v in RAID_VERS:
        load("Guides/Raids/v%s.lua" % v)
    load(tf)
    GD2 = lua.globals()["BossTipsAddon"]["GuideData"]
    trans = GD2["translations"][locale]
    if not trans:
        print("No translations table for", locale); sys.exit(1)
    catT = trans[cat] if cat != "mplus" else trans["mplus"]
    verT = catT[ver] if catT else None
    if not verT:
        print("No translation for cat=%s ver=%s" % (cat, ver)); sys.exit(1)
    # iterate source (native dungeons live under GD.versions, raids under GD.raids)
    src_cat = "versions" if cat == "native" else ("raids" if cat == "raids" else "mplus")
    src = GD2[src_cat][ver]
    miss_name = 0; miss_tip = 0; total = 0; bad = []
    for inst_key, bosses in src.items():
        if not hasattr(bosses, "items"):
            continue
        tinst = verT[inst_key]
        for bk, b in bosses.items():
            if not hasattr(b, "items"):
                continue
            total += 1
            tb = tinst[bk] if tinst else None
            if not tb or not tb["name"]:
                miss_name += 1
                bad.append("name:%s/%s" % (inst_key, bk))
                continue
            # tip check
            has = False
            if b["type"] == "MOB":
                has = bool(tb["tips"])
            else:
                tbd = b["tipsByDifficulty"]
                if tbd:
                    for k in ("lfr","normal","heroic","mythic","mythicplus"):
                        if tbd[k] and tb["tipsByDifficulty"] and tb["tipsByDifficulty"][k]:
                            has = True; break
                else:
                    for k in ("lfr","normal","heroic","mythic","mythicplus"):
                        if isinstance(b[k], str) and b[k] != "" and isinstance(tb[k], str) and tb[k] != "":
                            has = True; break
            if not has:
                miss_tip += 1
                bad.append("tip:%s/%s" % (inst_key, bk))
    print("locale=%s cat=%s ver=%s -> total=%d miss_name=%d miss_tip=%d" % (locale, cat, ver, total, miss_name, miss_tip))
    if bad:
        print("  examples:", "; ".join(bad[:8]))
    if miss_name == 0 and miss_tip == 0:
        print("  OK: full coverage")
    else:
        sys.exit(2)

if __name__ == "__main__":
    main()
