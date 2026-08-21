#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""给 4 个翻译文件批量添加副本 instance.name 字段。
权威译名来自 12.1 蓝帖 (wow.blizzard.cn / stormseekers.at)。"""
import os, re

ADDON = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"

# 简中 -> 英文 / 繁中
INSTANCE_NAME_EN = {
    "塞塔里斯神庙": "Temple of Sethraliss",
    "夺目谷": "The Blinding Vale",
    "密谋小径": "Murder Row",
    "毒牙祭坛": "Altar of Fangs",
    "红玉新生法池": "Ruby Life Pools",
    "纳洛拉克的洞穴": "Den of Nalorakk",
    "虚空之痕竞技场": "Voidscar Arena",
    "诸王之眠": "Kings' Rest",
    "潮缚石窟": "The Tidebound Grotto",
    "烈毒之渊": "The Venomous Abyss",
}
INSTANCE_NAME_TW = {
    "塞塔里斯神庙": "塞塔里斯神廟",
    "夺目谷": "奪目谷",
    "密谋小径": "密謀小徑",
    "毒牙祭坛": "毒牙祭壇",
    "红玉新生法池": "紅玉新生法池",
    "纳洛拉克的洞穴": "納洛拉克的洞穴",
    "虚空之痕竞技场": "虛空之痕競技場",
    "诸王之眠": "諸王之眠",
    "潮缚石窟": "潮縛石窟",
    "烈毒之渊": "烈毒之淵",
}

def add_instance_names(path, name_map):
    with open(path, "r", encoding="utf-8") as f:
        src = f.read()
    lines = src.split("\n")
    out = []
    in_instance = None
    modified = 0
    for i, line in enumerate(lines):
        # 匹配 `    ["instanceName"] = {`
        m = re.match(r'^(\s*)\["([^"]+)"\]\s*=\s*\{', line)
        if m:
            indent, name = m.group(1), m.group(2)
            if name in name_map:
                in_instance = name
                out.append(line)
                # 查找下一个 `[\"bossName\"] = {`，在之前插入 name 字段
                continue
        if in_instance is not None:
            # 在 boss 条目前插入 instance.name
            m2 = re.match(r'^(\s+)\["([^"]+)"\]\s*=\s*\{', line)
            if m2:
                en_name = name_map[in_instance]
                out.append(f'    name = "{en_name}",')
                in_instance = None
        out.append(line)
    new_src = "\n".join(out)
    if new_src != src:
        with open(path, "w", encoding="utf-8") as f:
            f.write(new_src)
        modified = sum(1 for line in new_src.split("\n") if 'name = "Temple of Sethraliss"' in line or 'name = "塞塔里斯神廟"' in line)
    return modified

files = [
    (os.path.join(ADDON, "Guides/MPlus/Current_enUS.lua"), INSTANCE_NAME_EN),
    (os.path.join(ADDON, "Guides/MPlus/Current_zhTW.lua"), INSTANCE_NAME_TW),
    (os.path.join(ADDON, "Guides/Raids/v12.1_enUS.lua"), {k: v for k, v in INSTANCE_NAME_EN.items() if k in ("潮缚石窟","烈毒之渊")}),
    (os.path.join(ADDON, "Guides/Raids/v12.1_zhTW.lua"), {k: v for k, v in INSTANCE_NAME_TW.items() if k in ("潮缚石窟","烈毒之渊")}),
]

for path, name_map in files:
    if not os.path.exists(path):
        print(f"missing: {path}")
        continue
    n = add_instance_names(path, name_map)
    print(f"updated {path}: {len(name_map)} instances")