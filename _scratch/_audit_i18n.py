# -*- coding: utf-8 -*-
"""全量 i18n 审计：提取代码中所有 L["..."] 键，检测 enUS / zhTW 模式下是否泄漏简中。"""
import os, re
from lupa import LuaRuntime

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
TOC = os.path.join(ADDON, "BossTips.toc")
FILES = ["Window.lua", "Settings.lua", "Editor.lua", "Core.lua", "Data.lua"]

keys = set()
for fn in FILES:
    p = os.path.join(ADDON, fn)
    if not os.path.exists(p): continue
    txt = open(p, encoding="utf-8").read()
    for m in re.findall(r'L\["((?:[^"\\]|\\.)*)"\]', txt):
        keys.add(m)
print(f"提取到唯一键数: {len(keys)}")

BOOTSTRAP = r"""
local _frame_mt = {
    __index = function(t, k)
        if k == "IsShown" then return function() return false end end
        if k == "GetWidth" then return function() return 360 end end
        if k == "GetHeight" then return function() return 400 end end
        if k == "GetLeft" then return function() return 100 end end
        if k == "GetTop" then return function() return 600 end end
        if k == "GetStringHeight" then return function() return 20 end end
        if k == "GetFont" then return function() return "Fonts\\ARHei.ttf", 14, "" end end
        if k == "GetPoint" then return function() return "TOPLEFT", nil, "TOPLEFT", 20, -50 end end
        if k == "GetText" then return function() return "" end end
        if k == "GetNormalFontObject" then return function() return nil end end
        if k == "GetFontString" then return function() return t end end
        if k == "CreateFontString" or k == "CreateTexture" or k == "CreateLine"
           or k == "CreateAnimationGroup" or k == "CreateMaskTexture" then
            return function() return _NewFrame() end
        end
        return function() return _NewFrame() end
    end,
}
function _NewFrame()
    local f = {}
    setmetatable(f, _frame_mt)
    return f
end
"""

def load_with(lang):
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute(BOOTSTRAP)
    gsetup = f"""
GameFontNormal = _NewFrame()
STANDARD_TEXT_FONT = "Fonts\\\\ARHei.ttf"
BossTipsGlobalDB = {{ lang = "{lang}", disabledNative={{}}, disabledMPlus={{}}, disabledRaids={{}}, hiddenDungeons={{}}, guides={{}}, customDungeons={{}}, encounterOverrides={{}}, dungeonOverrides={{}} }}
function CreateFrame(...) return _NewFrame() end
function GetInstanceInfo() return "暴风城", nil, 0, nil, nil, nil, nil, 0 end
function GetLocale() return "zhCN" end
function GetCursorPosition() return 0, 0 end
function GetNumGroupMembers() return 1 end
function InCombatLockdown() return false end
function SendChatMessage(...) end
function print(...) end
function EJ_GetEncounterInfo(...) return nil end
function UnitName(...) return nil end
function UnitExists(...) return false end
C_Timer = {{ After = function(d, f) end }}
SlashCmdList = {{}}; GameTooltip = _NewFrame(); UIParent = _NewFrame(); StaticPopupDialogs = {{}}
local fakeLib = setmetatable({{}}, {{ __index = function(t,k) return function(...) return fakeLib end end }})
function LibStub(name, silent) return fakeLib end
function pcall(f, ...) return true, f(...) end
function IsModifiedClick(...) return false end
function GetMouseFocus() return nil end
"""
    lua.execute(gsetup)
    lua.execute("__BTAddon = {}")
    lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")
    def fix(src): return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)
    order = [l.strip() for l in open(TOC, encoding="utf-8") if l.strip().endswith(".lua") and not l.strip().startswith("#")]
    for rel in order:
        p = os.path.join(ADDON, rel)
        if os.path.exists(p):
            lua.execute(fix(open(p, encoding="utf-8").read()), name=rel)
    return lua.eval("_G.__BTAddon")

CJK = re.compile(r'[\u4e00-\u9fff\u3400-\u4dbf]')
SIMPLIFIED_ONLY = set("国关东车电时间题体来热几刘杨灭华网图图书画")

def audit(lang):
    a = load_with(lang)
    L = a["L"]
    leaks, missing = [], []
    for k in sorted(keys):
        try:
            v = L[k]
        except Exception:
            v = None
        if v is None or v == "":
            missing.append(k); continue
        if lang == "enUS":
            # 英文模式：任何 CJK 即泄漏
            if CJK.search(str(v)):
                leaks.append((k, str(v)[:45]))
        else:  # zhTW：仅"简中特有字"才算未转繁体（普通繁体 CJK 是正确）
            if any(c in SIMPLIFIED_ONLY for c in str(v)):
                leaks.append((k, str(v)[:45]))
    return missing, leaks

for lang in ["enUS", "zhTW"]:
    missing, leaks = audit(lang)
    print(f"\n===== 模式 {lang} =====")
    print(f"  缺失(返回 nil/空): {len(missing)}")
    for k in missing[:40]: print("    MISS:", k)
    print(f"  泄漏: {len(leaks)}")
    for k, v in leaks[:80]: print(f"    LEAK: {k!r} -> {v!r}")
