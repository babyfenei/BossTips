# -*- coding: utf-8 -*-
"""Dump all unique guide-body tip strings (zh) to _unique_tips.txt, one per line.
Order: native dungeons (1.0..12.0) then raids (1.0..12.1); stable across runs.
The enUS generator will map these back by exact string match.
"""
import os, lupa

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
OUT = os.path.join(BASE, "_scratch", "_unique_tips.txt")
NATIVE_VERS = ["%d.0" % i for i in range(1, 13)]
RAID_VERS = NATIVE_VERS[:-1] + ["12.1"]

def g(t, k):
    try:
        return t[k]
    except Exception:
        return None

lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute("BossTipsAddon={}")
for v in NATIVE_VERS:
    p = "Guides/Dungeons/v%s.lua" % v
    if os.path.exists(p):
        c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(c)
for v in RAID_VERS:
    p = "Guides/Raids/v%s.lua" % v
    if os.path.exists(p):
        c = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
        lua.execute(c)
GD = lua.globals()["BossTipsAddon"]["GuideData"]

def collect_tips(b, seen, tips):
    """Extract every unique tip body from a boss/MOB entry, regardless of
    whether it stores them in tipsByDifficulty, flat lfr/normal/heroic/mythic,
    or a bare tips string (MOB)."""
    t = g(b, "type")
    if t == "MOB":
        tt = g(b, "tips")
        if tt and tt not in seen:
            seen.add(tt); tips.append(tt)
        return
    # BOSS: try tipsByDifficulty (any difficulty present)
    td = g(b, "tipsByDifficulty")
    if td is not None and hasattr(td, "items"):
        for dk, dv in td.items():
            if dv and dv not in seen:
                seen.add(dv); tips.append(dv)
        return
    # Otherwise flat per-difficulty keys
    for d in ("lfr", "normal", "heroic", "mythic"):
        tt = g(b, d)
        if tt and tt not in seen:
            seen.add(tt); tips.append(tt)

tips = []
seen = set()
for v in NATIVE_VERS:
    src = GD["versions"][v]
    for inst, bosses in src.items():
        if not hasattr(bosses, "items"): continue
        for bk, b in bosses.items():
            if not hasattr(b, "items"): continue
            collect_tips(b, seen, tips)
for v in RAID_VERS:
    src = GD["raids"][v]
    for inst, bosses in src.items():
        if not hasattr(bosses, "items"): continue
        for bk, b in bosses.items():
            if not hasattr(b, "items"): continue
            collect_tips(b, seen, tips)

with open(OUT, "w", encoding="utf-8") as f:
    for t in tips:
        f.write(t.replace("\n", " ") + "\n")
print("Wrote %d unique tips to %s" % (len(tips), OUT))
