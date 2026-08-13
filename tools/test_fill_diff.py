#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Regression test for per-difficulty raid-tips emission (fill_raid.fmt_boss).

Replicates the exact Lua line that fill_raid.py emits for a boss, loads it via
lupa, and asserts:
  * general `tips` is preserved
  * each provided difficulty lands in tipsByDifficulty[diff]
  * a boss with no per-difficulty tips emits an empty tipsByDifficulty {}
"""
import os, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from lupa import LuaRuntime
from fill_raid import fmt_boss

lua = LuaRuntime(unpack_returned_tuples=True)
lua.execute("BT_addon = {}")

# Build a fake guide table using the SAME emission fmt_boss produces.
sample = (
    'local addon = _G.BT_addon\n'
    'addon.GuideData = addon.GuideData or { raids = {} }\n'
    'addon.GuideData.raids["99"] = addon.GuideData.raids["99"] or {}\n'
    'addon.GuideData.raids["99"]["测试本"] = {\n'
    + fmt_boss("首领A", 1, "通用攻略",
               {"normal": "普通难度机制", "heroic": "英雄难度机制", "mythic": "史诗难度机制"}) + "\n"
    + fmt_boss("首领B", 2, "只有通用攻略", {}) + "\n"
    + '}\n'
)
lua.execute(sample)
GD = lua.eval("_G.BT_addon.GuideData")
inst = GD["raids"]["99"]["测试本"]

a = inst["首领A"]
assert a["tips"] == "通用攻略", a["tips"]
assert a["tipsByDifficulty"]["normal"] == "普通难度机制", a["tipsByDifficulty"]
assert a["tipsByDifficulty"]["heroic"] == "英雄难度机制", a["tipsByDifficulty"]
assert a["tipsByDifficulty"]["mythic"] == "史诗难度机制", a["tipsByDifficulty"]
# lfr / mythicplus not provided -> absent (runtime falls back to general tips)
assert "lfr" not in a["tipsByDifficulty"], a["tipsByDifficulty"]
assert "mythicplus" not in a["tipsByDifficulty"], a["tipsByDifficulty"]

b = inst["首领B"]
assert b["tips"] == "只有通用攻略", b["tips"]
# lupa loads Lua `{}` as a LuaTable object (not a Python dict); check emptiness via keys
assert len(list(b["tipsByDifficulty"].keys())) == 0, b["tipsByDifficulty"]

print("PER-DIFF FILL OK")
