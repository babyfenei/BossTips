# -*- coding: utf-8 -*-
"""E2E: confirm GetGuideText returns DISTINCt per-difficulty text for M+ & raid
in enUS/zhTW mode (catches _src mapping or lookup regressions)."""
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
globals_setup = r"""
GameFontNormal = _NewFrame()
STANDARD_TEXT_FONT = "Fonts\\ARHei.ttf"
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
lua.execute(bootstrap); lua.execute(globals_setup)
lua.execute("__BTAddon = {}")
lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")

def fix_first_line(src):
    return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)

order = [l.strip() for l in open(TOC, encoding="utf-8") if l.strip().endswith(".lua") and not l.strip().startswith("#")]
for rel in order:
    p = os.path.join(ADDON, rel)
    if not os.path.exists(p): continue
    lua.execute(fix_first_line(open(p, encoding="utf-8").read()), name=rel)

lua.execute("__BTAddon.BuildActiveGuides()")

CJK = re.compile(r'[\u4e00-\u9fff]')
def g(t, k):
    try: return t[k]
    except Exception: return None

def e2e(locale, inst, boss, isRaid):
    lua.execute('__BTAddon.LOCALE = "%s"' % locale)
    BD = lua.globals()["__BTAddon"].GetBossData()
    inst_t = g(BD, inst)
    if not inst_t:
        return "FAIL: instance %s missing" % inst
    entry = g(inst_t, boss)
    if not entry:
        return "FAIL: boss %s missing" % boss
    src = entry._src
    if not src:
        return "FAIL: no _src"
    diffs = ["normal", "heroic", "mythicplus"] if not isRaid else ["lfr", "normal", "heroic", "mythic"]
    txts = {}
    for d in diffs:
        t = lua.globals()["__BTAddon"].GetGuideText(entry, d)
        txts[d] = t
    distinct = len(set(txts.values()))
    cjk = any(CJK.search(v or "") for v in txts.values())
    ok = (distinct == len(diffs)) and (not cjk)
    return "%s %s/%s/%s: distinct=%d/%d cjk=%s src=%s" % (
        "OK " if ok else "FAIL", locale, inst, boss, distinct, len(diffs), cjk,
        "%s.%s.%s.%s" % (src.type, src.ver, src.instance, src.boss))

print("== M+ (expect distinct per diff, no CJK in enUS) ==")
print(e2e("enUS", "塞塔里斯神庙", "加瓦兹特", False))
print(e2e("zhTW", "塞塔里斯神庙", "加瓦兹特", False))
print(e2e("enUS", "夺目谷", "光明众花", False))
print(e2e("zhTW", "夺目谷", "光明众花", False))
print("== RAID (expect distinct per diff, no CJK in enUS) ==")
print(e2e("enUS", "潮缚石窟", "尼姆瑞莎·唤波者", True))
print(e2e("zhTW", "潮缚石窟", "尼姆瑞莎·唤波者", True))
print(e2e("enUS", "烈毒之渊", "万毒邪祟者瓦什尼克", True))
print(e2e("zhTW", "烈毒之渊", "万毒邪祟者瓦什尼克", True))
