#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Verify a regenerated raid file:
  * instanceId / encId values identical to the ORIGINAL skeleton (git HEAD)
  * every boss tip non-empty
  * raids keys == meta keys (consistency)
"""
import sys, os, json, subprocess
from lupa import LuaRuntime

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
VER = sys.argv[1]
rel = f"Guides/Raids/v{VER}.lua"
new_path = os.path.join(ROOT, rel)
old_text = subprocess.check_output(["git", "show", f"HEAD:{rel}"], cwd=ROOT, text=True)
keymap = json.load(open(os.path.join(ROOT, "tools", f"_keymap_{VER}.json"), encoding="utf-8"))

def load(text):
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BT_addon = {}")
    t = text.replace("local _, addon = ...", "local addon = _G.BT_addon", 1)
    lua.execute(t)
    return lua.eval("_G.BT_addon.GuideData")

old = load(old_text)
new = load(open(new_path, encoding="utf-8").read())

errs = []
old_raids = old["raids"][VER]
new_raids = new["raids"][VER]
old_meta = old["meta"]
new_meta = new["meta"]

for inst, bt in old_raids.items():
    o = old_meta[inst]; n = new_meta[inst]
    if o["instanceId"] != n["instanceId"]:
        errs.append(f"{inst}: instanceId {o['instanceId']} -> {n['instanceId']}")
    oenc = o["encounterIds"]; nenc = n["encounterIds"]
    for ok, eid in oenc.items():
        cn = keymap.get(inst, {}).get(ok, ok)
        if cn not in nenc:
            errs.append(f"{inst}: missing new key {cn} (from {ok})")
        elif nenc[cn] != eid:
            errs.append(f"{inst}: encId {ok}->{cn} {eid} -> {nenc[cn]}")
    if set(nenc.keys()) != set(new_raids[inst].keys()):
        errs.append(f"{inst}: raids/meta key mismatch")

# non-empty tips
for inst, bt in new_raids.items():
    for k, v in bt.items():
        if not v["tips"]:
            errs.append(f"{inst}/{k}: empty tips")

if errs:
    print("VERIFY FAILED:")
    for e in errs:
        print("  -", e)
    raise SystemExit(1)

ninstances = len(list(old_raids.keys()))
nbosses = sum(len(list(bt.keys())) for inst, bt in new_raids.items())
if ninstances == 0 or nbosses == 0:
    raise SystemExit(f"VERIFY FAILED: loaded tables empty (old_inst={ninstances} new_boss={nbosses})")
print(f"VERIFY OK: {VER}  instances={ninstances} bosses={nbosses}")
