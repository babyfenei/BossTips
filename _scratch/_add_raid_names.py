#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
为 v12.1_zhTW.lua / v12.1_enUS.lua 的每个首领增加 name 字段（从攻略文本首段提取 {rt8}Name{rt8}）。
"""
import re, os
import lupa

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
LANGUAGES = ["zhTW", "enUS"]

def extract_name(text):
    m = re.match(r'\{rt\d+\}(.+?)\{rt\d+\}', text)
    if m:
        return m.group(1)
    return None

def escape_lua_long(s):
    level = 0
    while True:
        close = ']' + ']' + ('=' * level) + ']'
        if close not in s:
            break
        level += 1
    open_ = '[' + ('=' * level) + '['
    close = ']' + ('=' * level) + ']'
    return open_ + s + close

for lang in LANGUAGES:
    path = os.path.join(BASE, f"Guides/Raids/v12.1_{lang}.lua")
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute(r'''
_G = _G or {}
_G.GetLocale = function() return "%s" end
_G.print = function() end
''' % lang)
    lua.execute('_G.BossTipsAddon = {}')
    code = open(path, encoding="utf-8").read().replace("local _, addon = ...", "local addon = _G.BossTipsAddon")
    lua.execute(code)
    trans = lua.globals()['_G']['BossTipsAddon']['GuideData']['translations'][lang]['raids']['12.1']

    # 读取原始文件内容，用正则替换每个首领表开头为 name + 原内容
    with open(path, encoding="utf-8") as f:
        text = f.read()

    # 方法：按行扫描，找到每个 "[boss] = {" 的行，在其后插入 name = "..."
    lines = text.splitlines()
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]
        new_lines.append(line)
        m = re.match(r'^(\s*\["([^"]+)"\]\s*=\s*\{)(?!\s*name\s*=)', line)
        if m:
            indent = len(m.group(1)) - len(m.group(1).lstrip()) + 4
            boss = m.group(2)
            # 定位该首领的文本（找第一个 lfr/normal/heroic/mythic 值）
            name = None
            # 从 trans 表里找
            for inst in trans.keys():
                d = trans[inst]
                if boss in d:
                    b = d[boss]
                    for dk in ("lfr","normal","heroic","mythic"):
                        if dk in b and b[dk]:
                            name = extract_name(b[dk])
                            break
                if name: break
            if not name:
                name = boss
            # 转义
            name = name.replace('"', '\\"')
            new_lines.append(' ' * indent + f'name = "{name}",')
        i += 1
    new_text = '\n'.join(new_lines)
    if text.endswith('\n') and not new_text.endswith('\n'):
        new_text += '\n'
    with open(path, "w", encoding="utf-8") as f:
        f.write(new_text)
    print(f"Updated {path}")
