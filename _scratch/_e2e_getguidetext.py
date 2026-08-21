# -*- coding: utf-8 -*-
"""端到端核验 GetGuideText：强制 LOCALE 后取 M+ 攻略，确认返回译文而非简中回退。"""
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
BossTipsGlobalDB = { disabledNative={}, disabledMPlus={}, disabledRaids={}, hiddenDungeons={}, guides={}, customDungeons={}, encounterOverrides={}, dungeonOverrides={} }
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

order = []
for line in open(TOC, encoding="utf-8"):
    line = line.strip()
    if line.endswith(".lua") and not line.startswith("#"):
        order.append(line)

for rel in order:
    p = os.path.join(ADDON, rel)
    if not os.path.exists(p):
        continue
    lua.execute(fix_first_line(open(p, encoding="utf-8").read()), name=rel)

CJK = re.compile(r'[\u4e00-\u9fff\u3400-\u4dbf]')
SIMP = set("国关东车电时间题体来热几刘杨")

for locale in ["enUS", "zhTW"]:
    lua.execute(f'__BTAddon.LOCALE = "{locale}"')
    lua.execute("__BTAddon.BuildActiveGuides()")
    # 取一个 M+ 实例的 BOSS 做抽样
    code = """
    local a = _G.__BTAddon
    local out = {}
    for inst, bosses in pairs(a.ActiveGuides) do
        for bname, entry in pairs(bosses) do
            if entry._src and entry._src.type == "mplus" then
                table.insert(out, { inst=inst, bname=bname, entry=entry })
                if #out >= 3 then break end
            end
        end
        if #out >= 3 then break end
    end
    return out
    """
    samples = lua.execute(code)
    print(f"\n===== LOCALE={locale} M+ 抽样 GetGuideText(mythicplus) =====")
    n = len(samples)
    for i in range(1, n + 1):
        s = samples[i]
        entry = s["entry"]
        txt = lua.eval("function(e,d) return _G.__BTAddon.GetGuideText(e,d) end")(entry, "mythicplus")
        has_cjk = bool(CJK.search(txt))
        has_simp = any(c in SIMP for c in txt)
        note = "OK(译文)"
        if locale == "enUS" and has_cjk:
            note = "FAIL(回退简中)"
        if locale == "zhTW" and has_simp:
            note = "WARN(简中残留)"
        preview = (txt or "")[:60].replace("\n", " ")
        print(f"  [{note}] {s['inst']} / {s['bname']}: {preview}")
print("\nE2E DONE")
