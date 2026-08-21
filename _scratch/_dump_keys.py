# -*- coding: utf-8 -*-
"""Dump all instance + boss keys per version (so the enUS name map uses exact keys)."""
import os, lupa, json
BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
RAID_VERS = ["%d.0" % i for i in range(1, 13)] + ["12.1"]
lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute("BossTipsAddon = {}")
def load(rel):
    p = os.path.join(BASE, rel)
    if not os.path.exists(p): return
    c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
    lua.execute(c)
for v in NATIVE_VERS: load("Guides/Dungeons/v%s.lua" % v)
for v in RAID_VERS: load("Guides/Raids/v%s.lua" % v)
GD = lua.globals()["BossTipsAddon"]["GuideData"]
out = {"native": {}, "raids": {}}
for cat, vers, key in (("versions", NATIVE_VERS, "native"), ("raids", RAID_VERS, "raids")):
    sec = GD[cat]
    for ver in vers:
        src = sec[ver]
        if not src: continue
        out[key][ver] = {}
        for inst, bosses in src.items():
            if not hasattr(bosses, "items"): continue
            bl = []
            for bk, b in bosses.items():
                if not hasattr(b, "items"): continue
                bl.append(bk)
            out[key][ver][inst] = bl
with open(os.path.join(BASE, "_scratch", "_keys.json"), "w", encoding="utf-8") as f:
    json.dump(out, f, ensure_ascii=False, indent=1)
print("dumped. native versions:", len(out["native"]), "raid versions:", len(out["raids"]))
# print instance + boss counts
ni = sum(len(v) for v in out["native"].values()); nb = sum(len(b) for v in out["native"].values() for b in v.values())
ri = sum(len(v) for v in out["raids"].values()); rb = sum(len(b) for v in out["raids"].values() for b in v.values())
print("native instances=%d bosses=%d ; raids instances=%d bosses=%d" % (ni, nb, ri, rb))
