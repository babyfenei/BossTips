# -*- coding: utf-8 -*-
import os, re, lupa
BASE="E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
TOC=os.path.join(BASE,"BossTips.toc")
lua=lupa.LuaRuntime(unpack_returned_tuples=True)
bootstrap=r'''
local _frame_mt={__index=function(t,k)
 if k=="IsShown" then return function() return false end end
 if k=="CreateFontString" or k=="CreateTexture" then return function() return _NewFrame() end end
 return function() return _NewFrame() end end}
function _NewFrame() local f={} setmetatable(f,_frame_mt) return f end
'''
globals_setup=r'''
GameFontNormal=_NewFrame(); STANDARD_TEXT_FONT="Fonts\\ARHei.ttf"
BossTipsGlobalDB={disabledNative={},disabledMPlus={},disabledRaids={},hiddenDungeons={},guides={},lang="AUTO"}
function CreateFrame(...) return _NewFrame() end
function GetInstanceInfo() return "x",nil,0 end
function GetLocale() return _G.__TEST_LOCALE or "zhCN" end
function SendChatMessage(...) end; function print(...) end
function strsplit(d,s) if not s then return nil end local t={} local p=1 while true do local i=string.find(s,d,p,true) if not i then t[#t+1]=string.sub(s,p) break end t[#t+1]=string.sub(s,p,i-1) p=i+1 end return table.unpack(t) end
function EJ_GetEncounterInfo(...) return nil end
function LibStub() local fl={} setmetatable(fl,{__index=function(t,k) return function(...) return fl end end}) return fl end
C_Timer={After=function(d,f) end}
SlashCmdList={}; UIParent=_NewFrame(); StaticPopupDialogs={}; GameTooltip=_NewFrame()
function pcall(f,...) return true,f(...) end
'''
lua.execute(bootstrap); lua.execute(globals_setup)
lua.execute("__BTAddon={}")
lua.execute("__BTAddon.L=setmetatable({},{__index=function(t,k) return k end})")
def fix(src): return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)
order=[l.strip() for l in open(TOC,encoding="utf-8") if l.strip().endswith(".lua") and not l.strip().startswith("#")]
for rel in order:
    p=os.path.join(BASE,rel)
    if os.path.exists(p): lua.execute(fix(open(p,encoding="utf-8").read()), name=rel)
A=lua.globals()["__BTAddon"]
G=lua.globals()

def set_lang(lang, client):
    G["BossTipsGlobalDB"].lang=lang
    G["__TEST_LOCALE"]=client
    # resolve like settings panel: try RefreshLocale else ResolveLocale
    try: A.RefreshLocale()
    except Exception: A.ResolveLocale()

def test(lang, client, inst, cat, ver, boss=None, isRaid=False):
    set_lang(lang, client)
    A.BuildActiveGuides()
    iname=A.GetLocalizedInstanceName(inst, cat, ver)
    bname=A.GetLocalizedBossName(inst, boss, isRaid, ver) if boss else "(n/a)"
    return A.LOCALE, iname, bname

print("== lang=AUTO, client=enUS ==")
print(" native inst 剃刀沼泽 ->", test("AUTO","enUS","剃刀沼泽","native","1.0"))
print(" native boss 督军拉姆塔斯 ->", test("AUTO","enUS","剃刀沼泽","native","1.0","督军拉姆塔斯",False))
print(" raid   inst 熔火之心 ->", test("AUTO","enUS","熔火之心","raids","1.0"))
print(" raid   boss 鲁西弗隆(fallback zhCN) ->", test("AUTO","enUS","熔火之心","raids","1.0","鲁西弗隆",True))
print("== lang=AUTO, client=zhTW ==")
print(" native inst 剃刀沼泽 ->", test("AUTO","zhTW","剃刀沼泽","native","1.0"))
print(" native boss 督军拉姆塔斯 ->", test("AUTO","zhTW","剃刀沼泽","native","1.0","督军拉姆塔斯",False))
print("== lang=enUS (explicit) ==")
print(" native inst 剃刀沼泽 ->", test("enUS","zhCN","剃刀沼泽","native","1.0"))
print("== lang=zhTW (explicit) ==")
print(" native inst 剃刀沼泽 ->", test("zhTW","zhCN","剃刀沼泽","native","1.0"))
print("== lang=zhCN explicit (passthrough) ==")
print(" native inst 剃刀沼泽 ->", test("zhCN","zhCN","剃刀沼泽","native","1.0"))
