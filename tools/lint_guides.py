# -*- coding: utf-8 -*-
"""校验所有攻略文件格式一致性（lupa 加载后程序化校验）。"""
import os, glob, lupa

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
lua = lupa.LuaRuntime(unpack_returned_tuples=True)
g = lua.globals()
g.addon = lua.eval("{}")
g.BossTipsGlobalDB = lua.eval('{ guides={}, disabledNative={}, disabledMPlus={}, disabledCustomVersions={}, disabledRaids={}, dungeonOverrides={}, encounterOverrides={}, customDungeons={} }')

def load(p):
    with open(os.path.join(BASE, p), encoding="utf-8") as f:
        g.load(f.read())(None, g.addon)

for p in ["Data.lua", "BigWigsIdDB.lua", "FallbackIdDB.lua"]:
    load(p)
for p in sorted(glob.glob(os.path.join(BASE, "Guides", "v*.lua"))):
    with open(p, encoding="utf-8") as f:
        g.load(f.read())(None, g.addon)
for p in sorted(glob.glob(os.path.join(BASE, "Guides", "Raids", "v*.lua"))):
    with open(p, encoding="utf-8") as f:
        g.load(f.read())(None, g.addon)

GD = g.addon.GuideData
problems = []

def check_entry(inst, boss, e, where):
    if e.order is None:
        problems.append(f"[{where}] {inst}/{boss}: 缺 order")
    typ = e.type
    if typ not in ("BOSS", "MOB"):
        problems.append(f"[{where}] {inst}/{boss}: type={typ} 非法(应为 BOSS/MOB)")
    if not isinstance(e.tips, str):
        problems.append(f"[{where}] {inst}/{boss}: tips 非字符串")
    if e.tipsByDifficulty is None:
        problems.append(f"[{where}] {inst}/{boss}: 缺 tipsByDifficulty")

for ns in ("versions", "mplus"):
    src = getattr(GD, ns) or {}
    for ver, insts in src.items():
        if insts is None: continue
        for inst, bosses in insts.items():
            if bosses is None: continue
            for boss, e in bosses.items():
                check_entry(inst, boss, e, f"{ns}[{ver}]")

raids = getattr(GD, "raids") or {}
for ver, insts in raids.items():
    for inst, bosses in insts.items():
        if bosses is None: continue
        for boss, e in bosses.items():
            check_entry(inst, boss, e, f"raids[{ver}]")
        meta = (GD.meta[inst] if GD.meta is not None else None)
        if meta and meta.encounterIds:
            for boss in bosses:
                if boss not in meta.encounterIds:
                    problems.append(f"[raids[{ver}]] {inst}: boss '{boss}' 不在 meta.encounterIds")
            for boss in meta.encounterIds:
                if boss not in bosses:
                    problems.append(f"[raids[{ver}]] {inst}: meta.encounterIds '{boss}' 无对应 boss 条目")
        if meta:
            if not meta.isRaid:
                problems.append(f"raids[{ver}] {inst}: meta.isRaid 缺失/假")
            if meta.instanceId is None:
                problems.append(f"raids[{ver}] {inst}: meta.instanceId 缺失")

print("校验完成。问题数:", len(problems))
for p in problems[:80]:
    print("  -", p)
