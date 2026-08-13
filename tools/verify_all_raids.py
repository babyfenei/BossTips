#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Combined load sim: mimic the real addon loading all raid files into one
shared GuideData, then sanity-check: every boss has tips, and within each
instance no two bosses share an encId (which would break encId auto-expand)."""
import os, glob
from lupa import LuaRuntime

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
files = sorted(glob.glob(os.path.join(ROOT, "Guides", "Raids", "v*.lua")))

lua = LuaRuntime(unpack_returned_tuples=True)
lua.execute("BT_addon = {}")
for f in files:
    t = open(f, encoding="utf-8").read().replace("local _, addon = ...", "local addon = _G.BT_addon", 1)
    lua.execute(t)
GD = lua.eval("_G.BT_addon.GuideData")

total = 0
empty = 0
dup_instances = []
for ver, rv in GD["raids"].items():
    for inst, bt in rv.items():
        seen = {}
        for k, v in bt.items():
            total += 1
            if not v["tips"]:
                empty += 1
                print("  EMPTY TIPS:", ver, inst, k)
        meta = GD["meta"][inst] if inst in GD["meta"] else None
        if meta:
            vals = list(meta["encounterIds"].values())
            dups = {x for x in vals if vals.count(x) > 1}
            if dups:
                dup_instances.append((ver, inst, dups))

print(f"loaded versions={len(list(GD['raids'].keys()))}  total_bosses={total}  empty_tips={empty}")
if dup_instances:
    print("WITHIN-INSTANCE DUPLICATE encId (auto-expand may be ambiguous):")
    for ver, inst, dups in dup_instances:
        print(f"  {ver} / {inst}: {sorted(dups)}")
else:
    print("no within-instance duplicate encId")
