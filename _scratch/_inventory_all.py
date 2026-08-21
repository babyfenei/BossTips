# -*- coding: utf-8 -*-
"""统计所有版本（副本+团本）仍需翻译的条目与 tips 数量。"""
import os, re
import lupa

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"

lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute(r'''
BossTipsAddon = {}
GetLocale = function() return "zhCN" end
print = function() end
''')

def load(path):
    code = open(path, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
    lua.execute(code)

for f in [
    "Guides/Dungeons/v1.0.lua","Guides/Dungeons/v2.0.lua","Guides/Dungeons/v3.0.lua",
    "Guides/Dungeons/v4.0.lua","Guides/Dungeons/v5.0.lua","Guides/Dungeons/v6.0.lua",
    "Guides/Dungeons/v7.0.lua","Guides/Dungeons/v8.0.lua","Guides/Dungeons/v9.0.lua",
    "Guides/Dungeons/v10.0.lua","Guides/Dungeons/v11.0.lua","Guides/Dungeons/v12.0.lua",
    "Guides/Raids/v1.0.lua","Guides/Raids/v2.0.lua","Guides/Raids/v3.0.lua",
    "Guides/Raids/v4.0.lua","Guides/Raids/v5.0.lua","Guides/Raids/v6.0.lua",
    "Guides/Raids/v7.0.lua","Guides/Raids/v8.0.lua","Guides/Raids/v9.0.lua",
    "Guides/Raids/v10.0.lua","Guides/Raids/v11.0.lua","Guides/Raids/v12.0.lua",
    "Guides/Raids/v12.1.lua","Guides/MPlus/Current.lua",
]:
    load(os.path.join(BASE, f))

GD = lua.globals()['BossTipsAddon']['GuideData']
print("GD top keys:", list(GD.keys()))

def count_section(section, label):
    total_inst=0; total_entries=0; total_tips=0
    for ver, insts in section.items():
        if not isinstance(insts, dict): continue
        for inst, bosses in insts.items():
            if not isinstance(bosses, dict): continue
            total_inst += 1
            for bn, b in bosses.items():
                if not isinstance(b, dict): continue
                total_entries += 1
                if "tipsByDifficulty" in b and isinstance(b["tipsByDifficulty"], dict):
                    total_tips += len([k for k in b["tipsByDifficulty"] if b["tipsByDifficulty"][k]])
                elif "tips" in b and b["tips"]:
                    total_tips += 1
                for dk in ("lfr","normal","heroic","mythic","mythicplus"):
                    if dk in b and isinstance(b[dk], str) and b[dk]:
                        total_tips += 1
    print(f"[{label}] 副本数={total_inst} 条目={total_entries} 需翻译tips={total_tips}")

count_section(GD["versions"], "原生副本 versions")
count_section(GD["raids"], "团本 raids")
mplus = GD["mplus"]
ti=0;te=0;tt=0
for ver, insts in mplus.items():
    if not isinstance(insts, dict): continue
    for inst, bosses in insts.items():
        if not isinstance(bosses, dict): continue
        ti+=1
        for bn,b in bosses.items():
            if not isinstance(b,dict): continue
            te+=1
            if "tipsByDifficulty" in b and isinstance(b["tipsByDifficulty"], dict):
                tt += len([k for k in b["tipsByDifficulty"] if b["tipsByDifficulty"][k]])
            elif "tips" in b and b["tips"]:
                tt+=1
print(f"[大秘境 mplus] 副本数={ti} 条目={te} 需翻译tips={tt}  (verse keys={list(mplus.keys())})")
