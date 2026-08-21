#!/usr/bin/env python3
# 调试：模拟游戏内 enUS 设置 + zhCN 客户端，检查 addon.L 实际返回值
from lupa import LuaRuntime
import re

lua = LuaRuntime(unpack_returned_tuples=True)

# 模拟 WoW API
lua.execute('''
function GetLocale() return "zhCN" end
_G.BossTipsGlobalDB = { lang = "enUS" }
''')

# 加载 Locales.lua（与 .toc 一致的方式：local _, addon = ...）
with open('E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Locales.lua', 'r', encoding='utf-8') as f:
    code = f.read()

# 包装成 dofile 形式，传入 addon 表
lua.execute('''
local addon = {}
local fn, err = loadfile("E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/Locales.lua", "t", setmetatable({}, {__index=_G}))
if not fn then error(err) end
fn("BossTips", addon)
_G.__BTAddon = addon
''')

a = lua.globals().__BTAddon
L = a["L"]

print(f"addon.LOCALE = {a['LOCALE']}")
print(f"BossTipsGlobalDB.lang = {lua.globals()['BossTipsGlobalDB']['lang']}")

keys = [
    "Settings", "Profiles", "Guide Options", "Behavior & Interaction",
    "Display Mode", "Button Mode", "Enable Smart Expand", "Lock Window",
    "Only allow one expanded item at a time", "Show Mob Entries",
    "Difficulty Display", "LFR", "Normal", "Heroic", "Mythic",
    "Language", "Close",
]
CJK = re.compile(r'[\u4e00-\u9fff]')
for k in keys:
    v = L[k]
    leak = "<-- 简中!" if CJK.search(str(v)) else "OK"
    print(f"  L[{k!r}] = {v!r}  {leak}")
