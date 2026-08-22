# -*- coding: utf-8 -*-
import lupa, traceback, sys
from lupa import LuaRuntime

log = open("c:/tmp/dbg_guidetext.log", "w", encoding="utf-8")
def P(*a):
    s = " ".join(str(x) for x in a); log.write(s+"\n"); log.flush()

try:
    lua = LuaRuntime(unpack_returned_tuples=True)
    setup = r"""
    math=math or {}; string=string; table=table; _G=_G or {}
    function GetLocale() return "enUS" end
    function GetNumGroupMembers() return 1 end
    function print(...) end
    function strtrim(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end
    function strsplit(sep,s)
        local t={}; local pat=(sep:gsub("([%%%.])","%%%1")); local p=1
        while true do local i=s:find(pat,p,true)
            if not i then t[#t+1]=s:sub(p); break end
            t[#t+1]=s:sub(p,i-1); p=i+#sep end
        return table.unpack(t) end
    function tContains(t,v) for _,x in ipairs(t) do if x==v then return true end end return false end
    _G.GetLocale=GetLocale; _G.GetNumGroupMembers=GetNumGroupMembers; _G.strtrim=strtrim
    _G.strsplit=strsplit; _G.tContains=tContains; _G.print=print
    addon={}; addon.L=setmetatable({},{__index=function(_,k) return k end})
    addon.GuideData=nil; addon.LOCALE="enUS"
    BossTipsGlobalDB={ defaultChatChannel="INSTANCE_CHAT", sendChannelRight="SAY",
        defaultDifficulty="mythic", enabledDifficulties=nil, disabledMPlus={}, hiddenDungeons={} }
    local function loadfile_safe(path) local f,err=loadfile(path)
        if not f then error("load "..path..": "..tostring(err)) end return f("BossTips",addon) end
    _G._load=loadfile_safe
    """
    lua.execute(setup)
    P("setup done")
    base="E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/"
    for f in ["Locales.lua","Data.lua","Guides/MPlus/Current.lua","Guides/MPlus/Current_enUS.lua","Guides/MPlus/Current_zhTW.lua"]:
        try:
            lua.execute(f'_load("{base}{f}")'); P("loaded", f)
        except Exception as e:
            P("LOAD FAIL", f, repr(e))

    test = r"""
    local out = {}
    addon.LOCALE = "enUS"
    addon.BuildActiveGuides()
    local AG = addon.ActiveGuides
    local inst = "塞塔里斯神庙"
    local boss = "阿德里斯和阿斯匹克斯"
    local entry = AG[inst][boss]
    out.entry_has_src = (entry and entry._src ~= nil)
    out.src_type = entry and entry._src and entry._src.type
    -- real GetGuideText for each difficulty
    for _, d in ipairs({"lfr","normal","heroic","mythic","mythicplus"}) do
        local t = addon.GetGuideText(entry, d)
        out["enUS_"..d] = (t and #t or 0)
    end
    -- compare mythic vs mythicplus prefixes to see if identical
    local m = addon.GetGuideText(entry, "mythic")
    local mp = addon.GetGuideText(entry, "mythicplus")
    out.mythic_eq_mythicplus = (m == mp)
    out.mythic_head = (m and m:sub(1,60)) or "NIL"
    out.mythicplus_head = (mp and mp:sub(1,60)) or "NIL"
    -- also zhCN
    addon.LOCALE = "zhCN"
    local mz = addon.GetGuideText(entry, "mythic")
    local mpz = addon.GetGuideText(entry, "mythicplus")
    out.zhCN_mythic_eq_mythicplus = (mz == mpz)
    out.zhCN_mythic_head = (mz and mz:sub(1,40)) or "NIL"
    out.zhCN_mythicplus_head = (mpz and mpz:sub(1,40)) or "NIL"
    return out
    """
    res = lua.execute(test)
    P("RESULT:", type(res))
    for k,v in res.items():
        P(f"  {k} = {v}")
except Exception as e:
    P("FATAL:", repr(e)); traceback.print_exc(file=log)
log.close()
