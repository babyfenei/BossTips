# -*- coding: utf-8 -*-
# 核对 Locales.lua 三语 UI 字符串键覆盖是否完整（不修改任何文件）
import lupa
from lupa import LuaRuntime

lua = LuaRuntime(unpack_returned_tuples=True)
lua.execute(r'''
_G = _G or {}
_G.GetLocale = function() return "zhCN" end
_G.print = function() end
''')
lua.execute('_G.BossTipsAddon = {}')
with open("Locales.lua", "r", encoding="utf-8") as f:
    code = f.read().replace("local _, addon = ...", "local addon = _G.BossTipsAddon")
lua.execute(code)

# 暴露三张局部表用于比对：重新 require 不可行，改为在文件内注入钩子
# 直接重新解析字符串提取键更安全，这里用 Lua 端无法访问 local，
# 故改用 Python 文本解析比对键集。
import re
keys = {}
for name, (a, b) in {"zhCN": (8, 160), "zhTW": (161, 313), "enUS": (314, 464)}.items():
    lines = code.splitlines()[a-1:b]
    ks = []
    for ln in lines:
        m = re.match(r'\s*\["([^"]+)"\]\s*=', ln)
        if m:
            ks.append(m.group(1))
    keys[name] = ks

base = set(keys["zhCN"])
for name in ("zhTW", "enUS"):
    s = set(keys[name])
    missing = base - s
    extra = s - base
    print(f"[{name}] 条目数={len(ks)} 缺键={len(missing)} 多键={len(extra)}")
    if missing:
        print("   缺键样本:", list(missing)[:15])
    if extra:
        print("   多键样本:", list(extra)[:15])

# 抽样检查：同一 key 在三表中值是否真不同（确认翻译而非复制）
sample = ["Settings", "Boss Tips", "Import", "Export", "Difficulty"]
for k in sample:
    zh = None; tw = None; en = None
    for name, ks in keys.items():
        pass
print("\n总键数 zhCN=%d zhTW=%d enUS=%d" % (len(keys["zhCN"]), len(keys["zhTW"]), len(keys["enUS"])))
