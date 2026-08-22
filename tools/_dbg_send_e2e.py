# -*- coding: utf-8 -*-
import lupa, traceback, sys
from lupa import LuaRuntime

log = open("c:/tmp/dbg_send_e2e.log", "w", encoding="utf-8")
def P(*a):
    s = " ".join(str(x) for x in a); log.write(s+"\n"); log.flush()

try:
    lua = LuaRuntime(unpack_returned_tuples=True)
    setup = r"""
    math=math or {}; string=string; table=table; _G=_G or {}
    function GetLocale() return "zhCN" end
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
    addon.GuideData=nil; addon.LOCALE="zhCN"
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

    # stub SendChatMessage so SendBossTips runs end-to-end
    lua.execute(r"""
    _G.SendChatMessage = function(msg, ch) print("SEND->"..tostring(ch)..": "..tostring(msg):sub(1,50)) end
    _G.InCombatLockdown = function() return false end
    addon.currentInstanceName = "塞塔里斯神庙"
    addon.tipsFrame = { difficulty = "mythicplus" }
    """)

    test = r"""
    local out = {}
    addon.BuildActiveGuides()
    local inst = "塞塔里斯神庙"; local boss = "阿德里斯和阿斯匹克斯"
    -- BuildChatParts resolves entry via addon.currentInstanceName; diff comes from tipsFrame.difficulty
    addon.tipsFrame.difficulty = "mythic"
    local bp_m = addon.BuildChatParts(boss, "INSTANCE_CHAT")
    addon.tipsFrame.difficulty = "mythicplus"
    local bp_mp = addon.BuildChatParts(boss, "INSTANCE_CHAT")
    out.mythic_nparts = bp_m and #bp_m.parts or -1
    out.mythicplus_nparts = bp_mp and #bp_mp.parts or -1
    out.mythic_head_len = bp_m and #(bp_m.parts[1] or "") or -1
    out.mythicplus_head_len = bp_mp and #(bp_mp.parts[1] or "") or -1
    out.mythic_full_len = bp_m and #(table.concat(bp_m.parts, "||")) or -1
    out.mythicplus_full_len = bp_mp and #(table.concat(bp_mp.parts, "||")) or -1
    out.full_same = (bp_m and bp_mp) and (table.concat(bp_m.parts, "||") == table.concat(bp_mp.parts, "||"))
    -- Now exercise the real SendBossTips (combat guard removed) for each difficulty
    addon.tipsFrame.difficulty = "mythic"
    addon.SendBossTips(boss, "INSTANCE_CHAT")
    addon.tipsFrame.difficulty = "mythicplus"
    addon.SendBossTips(boss, "INSTANCE_CHAT")
    return out
    """
    res = lua.execute(test)
    P("RESULT:", type(res))
    for k,v in res.items():
        P(f"  {k} = {v}")
except Exception as e:
    P("FATAL:", repr(e)); traceback.print_exc(file=log)
log.close()
