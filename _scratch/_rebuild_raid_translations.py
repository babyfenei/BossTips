#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
重写 v12.1_zhTW.lua / v12.1_enUS.lua，确保每个首领/副本都有 name 字段，
且 name 正确位于表内开头。
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

    lines = [
        "-- ============================================================================",
        f"-- BossTips 12.1 团本攻略翻译 —— {lang}（与简中源同结构：四难度 + name）",
        "-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。",
        "-- ============================================================================",
        "local _, addon = ...",
        "addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }",
        "addon.GuideData.translations = addon.GuideData.translations or {}",
        f"addon.GuideData.translations.{lang} = addon.GuideData.translations.{lang} or {{}}",
        f"addon.GuideData.translations.{lang}.raids = addon.GuideData.translations.{lang}.raids or {{}}",
        f"addon.GuideData.translations.{lang}.raids[\"12.1\"] = {{",
    ]
    DIFF_KEYS = ["lfr", "normal", "heroic", "mythic"]
    for inst in sorted(trans.keys()):
        d = trans[inst]
        inst_name = d['name'] if 'name' in d else inst
        lines.append(f'    ["{inst}"] = {{')
        lines.append(f'        name = "{inst_name.replace("\"", "\\\"")}",')
        for boss in sorted(d.keys()):
            if boss == "name": continue
            b = d[boss]
            # 取第一个非空难度的文本提取名字
            name = None
            for dk in DIFF_KEYS:
                if dk in b and b[dk]:
                    name = extract_name(b[dk])
                    break
            if not name:
                name = boss
            lines.append(f'        ["{boss}"] = {{')
            lines.append(f'            name = "{name.replace("\"", "\\\"")}",')
            for dk in DIFF_KEYS:
                txt = b[dk] if dk in b else ""
                if txt:
                    lines.append(f'            ["{dk}"] = {escape_lua_long(txt)},')
            lines.append('        },')
        lines.append('    },')
    lines.append('}')
    new_text = '\n'.join(lines) + '\n'
    with open(path, "w", encoding="utf-8") as f:
        f.write(new_text)
    print(f"Rebuilt {path}")
