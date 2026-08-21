# -*- coding: utf-8 -*-
"""诊断：中文客户端(GetLocale=zhCN) + BossTipsGlobalDB.lang=enUS 实战条件下
UI 取词(L[...]) 与 攻略取文(GetGuideText) 的实际返回值。"""
import os, re
from lupa import LuaRuntime

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
TOC = os.path.join(ADDON, "BossTips.toc")
lua = LuaRuntime(unpack_returned_tuples=True)

bootstrap = r"""
local _frame_mt = { __index = function(t, k)
    if k == "IsShown" then return function() return false end end
    if k == "CreateFontString" or k == "CreateTexture" or k == "CreateLine"
       or k == "CreateAnimationGroup" or k == "CreateMaskTexture" then
        return function() return _NewFrame() end end
    return function() return _NewFrame() end end }
function _NewFrame() local f = {}; setmetatable(f, _frame_mt); return f end
"""
gsetup = r"""
GameFontNormal = _NewFrame(); STANDARD_TEXT_FONT = "Fonts\\ARHei.ttf"
-- 模拟实战：中文客户端，且已把语言设为英文并持久化
BossTipsGlobalDB = { lang = "enUS", disabledNative={}, disabledMPlus={}, disabledRaids={}, hiddenDungeons={}, guides={}, customDungeons={}, encounterOverrides={}, dungeonOverrides={} }
function CreateFrame(...) return _NewFrame() end
function GetInstanceInfo() return "暴风城", nil, 0 end
function GetLocale() return "zhCN" end
function GetCursorPosition() return 0, 0 end
function GetNumGroupMembers() return 1 end
function InCombatLockdown() return false end
function SendChatMessage(...) end
function print(...) end
function EJ_GetEncounterInfo(...) return nil end
function UnitName(...) return nil end
function UnitExists(...) return false end
C_Timer = { After = function(d, f) end }
SlashCmdList = {}; GameTooltip = _NewFrame(); UIParent = _NewFrame(); StaticPopupDialogs = {}
local fakeLib = setmetatable({}, { __index = function(t,k) return function(...) return fakeLib end end })
function LibStub(name, silent) return fakeLib end
function pcall(f, ...) return true, f(...) end
function IsModifiedClick(...) return false end
function GetMouseFocus() return nil end
"""
lua.execute(bootstrap)
lua.execute(gsetup)
lua.execute("__BTAddon = {}")
lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")

def fix_first_line(src):
    return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)

order = [l.strip() for l in open(TOC, encoding="utf-8") if l.strip().endswith(".lua") and not l.strip().startswith("#")]
for rel in order:
    p = os.path.join(ADDON, rel)
    if os.path.exists(p):
        lua.execute(fix_first_line(open(p, encoding="utf-8").read()), name=rel)

a = lua.eval("_G.__BTAddon")
print("addon.LOCALE =", a["LOCALE"])

# 抽样 UI 取词（含英文键 与 中文键两类）
sample_keys = ["Settings", "Hide Guide", "Show Guide", "Behavior & Interaction",
               "Display Mode", "Enable Smart Expand", "Chat Output", "Send Guide",
               "Difficulty: ", "Language", "简体中文", "繁體中文", "跟随系统",
               "Dungeons", "Raid", "New Target", "Export Code", "Button Mode"]
L = a["L"]
print("\n--- UI 取词 (enUS 模式) ---")
leak = 0
for k in sample_keys:
    v = L[k]
    is_cjk = bool(re.search(r'[\u4e00-\u9fff]', v))
    flag = " <-- 简中泄漏!" if is_cjk else ""
    if is_cjk: leak += 1
    print(f"  L[{k!r}] = {v!r}{flag}")
print(f"\nUI 简中泄漏计数: {leak}/{len(sample_keys)}")

# 攻略取文
print("\n--- 攻略取文 (enUS 模式) ---")
lua.execute("__BTAddon.BuildActiveGuides()")
code = """
local a = _G.__BTAddon
local out = {}
for inst, bosses in pairs(a.ActiveGuides) do
    for bname, entry in pairs(bosses) do
        if entry._src and entry._src.type == "mplus" then
            table.insert(out, entry); if #out>=2 then break end
        end
    end
    if #out>=2 then break end
end
return out
"""
samples = lua.execute(code)
getgt = lua.eval("function(e,d) return _G.__BTAddon.GetGuideText(e,d) end")
for i in range(1, len(samples)+1):
    e = samples[i]
    txt = getgt(e, "mythicplus")
    is_cjk = bool(re.search(r'[\u4e00-\u9fff]', txt or ""))
    print(f"  [{'CJK!' if is_cjk else 'OK'}] {txt[:50]!r}")
