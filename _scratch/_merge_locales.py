#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import re, os, json

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
LOCALES_PATH = os.path.join(BASE, "Locales.lua")

# 读取现有 Locales.lua，提取三个表之间的内容
with open(LOCALES_PATH, encoding="utf-8") as f:
    lines = f.readlines()

# 找到 L_zhCN / L_zhTW / L_enUS 表的起止（第一个 { 与配对的 }）
def find_table_bounds(lines, varname):
    start = None
    brace_open = None
    for i, line in enumerate(lines, 1):
        if re.search(rf"local\s+{varname}\s*=\s*\{{", line):
            start = i
            brace_open = line.find('{')
            break
    if not start:
        return None, None
    depth = 1
    for i in range(start, len(lines)):
        for ch in lines[i]:
            if ch == '{':
                depth += 1
            elif ch == '}':
                depth -= 1
                if depth == 0:
                    return start, i + 1
    return None, None

# 读取现有表中的键
existing_keys = {"zhCN": set(), "zhTW": set(), "enUS": set()}
table_bounds = {}
for lang, var in (("zhCN","L_zhCN"), ("zhTW","L_zhTW"), ("enUS","L_enUS")):
    s, e = find_table_bounds(lines, var)
    table_bounds[lang] = (s, e)
    block = ''.join(lines[s-1:e])
    for m in re.findall(r'\[\s*"([^"]+)"\s*\]\s*=', block):
        existing_keys[lang].add(m)

# 读取映射
mapping = json.load(open(os.path.join(BASE, "_scratch", "_ui_mapping.json"), encoding="utf-8"))

# 修正映射中的键名问题
key_fixes = {
    "|r, auto-saved)": "Text Notes Suffix",
    "LFR_1": None,  # 删除
}

# 按语言追加
new_entries = {"zhCN": [], "zhTW": [], "enUS": []}
seen = {}
for item in mapping:
    key = item["key"]
    if key == "LFR_1":
        continue
    if key == "|r, auto-saved)":
        key = "Text Notes Suffix"
    if key in seen:
        continue
    seen[key] = True
    for lang in ("zhCN", "zhTW", "enUS"):
        if key not in existing_keys[lang]:
            val = item["zhCN"] if lang == "zhCN" else (item["zhTW"] if lang == "zhTW" else item["enUS"])
            if key == "Text Notes Suffix":
                val = item["zhCN"] if lang == "zhCN" else (item["zhTW"] if lang == "zhTW" else "|r, auto-saved)")
            # 转义双引号
            val = val.replace('"', '\\"')
            new_entries[lang].append(f'    ["{key}"] = "{val}",')

# 插入到各表末尾（闭合 } 前）
for lang, var in (("zhCN","L_zhCN"), ("zhTW","L_zhTW"), ("enUS","L_enUS")):
    s, e = table_bounds[lang]
    if new_entries[lang]:
        insert_lines = ["\n    -- 自动提取的 UI 条目\n"] + [x + "\n" for x in new_entries[lang]]
        # 插入到 e-1 行（即闭合 } 所在行）之前
        lines = lines[:e-1] + insert_lines + lines[e-1:]
        # 更新后续表的位置
        added = len(insert_lines)
        for other in table_bounds:
            os_, oe_ = table_bounds[other]
            if os_ > e:
                table_bounds[other] = (os_ + added, oe_ + added)

with open(LOCALES_PATH, "w", encoding="utf-8") as f:
    f.writelines(lines)

print(f"Merged {len(seen)} new keys into Locales.lua")
