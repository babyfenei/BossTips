# -*- coding: utf-8 -*-
"""校验某版本的翻译文件：键是否齐全、name/tips 是否填写。
用法: python _validate_translation.py <cat> <ver> <lang>
  cat = dungeons | raids
  ver = 1.0 ...
  lang = enUS | zhTW
"""
import sys, os, lupa
BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
cat, ver, lang = sys.argv[1], sys.argv[2], sys.argv[3]

lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute('BossTipsAddon = {}')

def load_as(path, varname):
    c = open(path, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BossTipsAddon")
    lua.execute(c)

# 源
src_path = os.path.join(BASE, f"Guides/{cat}/v{ver}.lua")
load_as(src_path, "src")
if cat == "dungeons":
    src_sec = lua.globals()['BossTipsAddon']['GuideData']['versions'][ver]
    catkey = "versions"
else:
    src_sec = lua.globals()['BossTipsAddon']['GuideData']['raids'][ver]
    catkey = "raids"

# 译
trans_path = os.path.join(BASE, f"Guides/{cat}/v{ver}_{lang}.lua")
if not os.path.exists(trans_path):
    print(f"[FAIL] 翻译文件不存在: {trans_path}")
    sys.exit(1)
load_as(trans_path, "trans")
trans_sec = lua.globals()['BossTipsAddon']['GuideData']['translations'][lang][catkey][ver]

problems = []
src_insts = set(src_sec.keys())
trans_insts = set(trans_sec.keys())
for inst in src_insts - trans_insts:
    problems.append(f"缺副本译文: {inst}")
for inst in trans_insts - src_insts:
    problems.append(f"多余副本(源无): {inst}")

for inst in src_insts & trans_insts:
    sb = src_sec[inst]
    tb = trans_sec[inst]
    if not isinstance(tb, dict) or "name" not in tb or not tb["name"]:
        problems.append(f"[{inst}] 缺 instance.name")
    for bn, b in sb.items():
        if not isinstance(b, dict): continue
        if bn not in tb:
            problems.append(f"[{inst}] 缺首领译文: {bn}")
            continue
        t = tb[bn]
        if "name" not in t or not t["name"]:
            problems.append(f"[{inst}/{bn}] 缺 name")
        # 找源里存在的难度键
        diffs = set()
        if "tipsByDifficulty" in b and isinstance(b["tipsByDifficulty"], dict):
            diffs = set(b["tipsByDifficulty"].keys())
        elif "tips" in b and b["tips"]:
            diffs = {"__mob_tips"}
        for dk in ("lfr","normal","heroic","mythic","mythicplus"):
            if dk in b and isinstance(b[dk], str) and b[dk]:
                diffs.add(dk)
        for d in diffs:
            if d == "__mob_tips":
                if not (t.get("tips") if isinstance(t, dict) else None):
                    problems.append(f"[{inst}/{bn}] 缺 tips(MOB)")
            else:
                # 译文件可能用 tipsByDifficulty 包裹或扁平键
                val = None
                if isinstance(t, dict):
                    if "tipsByDifficulty" in t and isinstance(t["tipsByDifficulty"], dict):
                        val = t["tipsByDifficulty"].get(d)
                    else:
                        val = t.get(d)
                if not val:
                    problems.append(f"[{inst}/{bn}] 缺难度译文: {d}")

if problems:
    print(f"=== {cat} v{ver} {lang}: {len(problems)} 个问题 ===")
    for p in problems[:200]:
        print("  -", p)
else:
    print(f"=== {cat} v{ver} {lang}: OK 全部 {len(src_insts)} 副本、{sum(len(v) for v in src_sec.values() if isinstance(v,dict))} 首领 已覆盖 ===")
