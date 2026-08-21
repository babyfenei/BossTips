#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
修复 M+ 英文翻译文件 (Current_enUS.lua) 中被损坏的 boss name 字段。

损坏形式： name = "<Lua table at 0x...>"  (tostring(table) 垃圾)
根因：旧版生成脚本把已损坏的 name 直接复制，导致永久传播。

修复策略（按优先级取权威英文名）：
  1) 原生副本英文翻译 Guides/Dungeons/v*_enUS.lua 的 boss tips 头 {rt8}EnglishName{rt8}
     （最权威、格式正确，覆盖全部原生 BOSS）
  2) M+ 文件自身 tips 头 {rt8}EnglishName{rt8}（覆盖 MOB 及原生未收录项）
  3) 回退中文键（仅极端兜底）

脚本仅替换每个 boss 块的 name 行，其余内容（tips / 结构 / 实例 name）原样保留。
"""
import re, os, glob

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
ENUS = os.path.join(BASE, "Guides/MPlus/Current_enUS.lua")

RT8 = re.compile(r'\{rt8\}(.*?)\{rt8\}', re.DOTALL)

def first_rt8(s):
    if not s:
        return None
    m = RT8.search(s)
    return m.group(1).strip() if m else None

# ---------- 1) 原生 enUS boss 名（来自 tips 头） ----------
native_map = {}
for fp in glob.glob(os.path.join(BASE, "Guides/Dungeons/*_enUS.lua")):
    try:
        txt = open(fp, encoding="utf-8").read()
    except Exception:
        continue
    for m in re.finditer(
        r'\["(?P<key>(?:[^"\\]|\\.)+)"\]\s*=\s*\{\s*\n'
        r'\s*type\s*=\s*"(?:BOSS|MOB)"\s*,\s*\n'
        r'(?P<body>.*?)\n\s*\},',
        txt, re.DOTALL):
        key = m.group("key")
        nm = first_rt8(m.group("body"))
        if key and nm and key not in (None,) and key not in native_map:
            native_map[key] = nm

# ---------- 2) M+ 文件自身 tips 头（MOB / 原生未收录兜底） ----------
enus_txt = open(ENUS, encoding="utf-8").read()
tips_map = {}
boss_block = re.compile(
    r'\["(?P<key>(?:[^"\\]|\\.)+)"\]\s*=\s*\{\s*\n'
    r'\s*type\s*=\s*"(?:BOSS|MOB)"\s*,\s*\n'
    r'\s*name\s*=\s*"(?P<name>(?:[^"\\]|\\.)*)"\s*,\s*\n'
    r'(?P<body>.*?)\n\s*\},',
    re.DOTALL)
for m in boss_block.finditer(enus_txt):
    key = m.group("key")
    nm = first_rt8(m.group("body"))
    if key and nm and key not in tips_map:
        tips_map[key] = nm

def resolve(key):
    if key in native_map:
        return native_map[key]
    if key in tips_map:
        return tips_map[key]
    return None

# ---------- 3) 替换每个 boss 块的 name 行 ----------
total = 0
resolved_native = 0
resolved_tips = 0
unresolved = []
out = []
last = 0
for m in boss_block.finditer(ENUS and enus_txt):
    out.append(enus_txt[last:m.start()])
    key = m.group("key")
    total += 1
    is_boss = 'type = "BOSS"' in m.group(0)
    name = resolve(key)
    if name is None:
        unresolved.append(key)
        new_name = key
    elif key in native_map:
        resolved_native += 1
        new_name = native_map[key]
    else:
        resolved_tips += 1
        new_name = tips_map[key]
    new_name = new_name.replace('"', '\\"')
    body = m.group("body")
    block = ('        ["%s"] = {\n'
             '            type = %s,\n'
             '            name = "%s",\n'
             '%s\n        },' % (key, 'BOSS' if is_boss else 'MOB', new_name, body))
    out.append(block)
    last = m.end()
out.append(enus_txt[last:])
new_txt = "".join(out)

print("=== 统计 ===")
print("M+ boss 总数:", total)
print("  原生 enUS tips 命中:", resolved_native)
print("  M+ 自身 tips 命中:", resolved_tips)
print("  未解析(回退中文):", len(unresolved))
if unresolved:
    print("未解析列表:", unresolved)

if unresolved:
    print("!! 存在未解析项，暂不写文件（避免回退中文键）")
else:
    with open(ENUS, "w", encoding="utf-8") as f:
        f.write(new_txt)
    print("已写入修复后的", ENUS)
