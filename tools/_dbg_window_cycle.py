# -*- coding: utf-8 -*-
import lupa, traceback, sys
from lupa import LuaRuntime

log = open("c:/tmp/dbg_window.log", "w", encoding="utf-8")
def P(*a):
    s = " ".join(str(x) for x in a); log.write(s+"\n"); log.flush()

try:
    lua = LuaRuntime(unpack_returned_tuples=True)
    setup = r"""
    math=math or {}; string=string; table=table; _G=_G or {}
    -- generic frame proxy
    local function newFrame()
        local t = { difficulty=nil, showMobs=false, availableDifficulties=nil,
                    contextBossName=nil, inUse=false, isExpanded=false, targetData=nil,
                    frame=nil, scripts={} }
        local mt = { __index = function(self, k)
            -- return a no-op function for any method call
            return function(...) return nil end
        end }
        setmetatable(t, mt)
        t.frame = t
        return t
    end
    _G.CreateFrame = function(...) return newFrame() end
    _G.UIParent = newFrame()
    _G.UIPanelButtonTemplate = "UIPanelButtonTemplate"
    _G.BackdropTemplate = "BackdropTemplate"
    _G.GameFontNormal = newFrame()
    _G.GameFontHighlight = newFrame()
    _G.STANDARD_TEXT_FONT = "Fonts\\FRIZQT__.TTF"
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
    function GetInstanceInfo() return "塞塔里斯神庙", nil, 23, nil, nil, nil, nil, 1877 end
    function RegisterEvent() end
    function hooksecurefunc() end
    function ChatFrame_AddMessageEventFilter() end
    function CreateFontString() return newFrame() end
    _G.SlashCmdList = {}
    _G.C_Timer = { After = function() end }
    _G.GetLocale=GetLocale; _G.GetNumGroupMembers=GetNumGroupMembers; _G.strtrim=strtrim
    _G.strsplit=strsplit; _G.tContains=tContains; _G.print=print
    _G.RegisterEvent=RegisterEvent; _G.hooksecurefunc=hooksecurefunc
    _G.ChatFrame_AddMessageEventFilter=ChatFrame_AddMessageEventFilter
    _G.CreateFontString=CreateFontString
    -- LibStub stub
    local libStub = { AceConfigDialog={}, AceGUI={}, AceTimer={}, AceConfig={}, AceConsole={}, AceEvent={} }
    _G.LibStub = function(name) return libStub[name] or {} end
    addon={}; addon.L=setmetatable({},{__index=function(_,k) return k end})
    addon.GuideData=nil; addon.LOCALE="zhCN"
    addon.ApplyThemeToFrame=function() end
    BossTipsGlobalDB={ defaultChatChannel="INSTANCE_CHAT", sendChannelRight="SAY",
        defaultDifficulty="mythic", enabledDifficulties=nil, disabledMPlus={}, hiddenDungeons={},
        guideWindowWidth=360 }
    local function loadfile_safe(path) local f,err=loadfile(path)
        if not f then error("load "..path..": "..tostring(err)) end return f("BossTips",addon) end
    _G._load=loadfile_safe
    """
    lua.execute(setup)
    P("setup done")
    base="E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/"
    for f in ["Locales.lua","Data.lua","Core.lua","Window.lua","Guides/MPlus/Current.lua","Guides/MPlus/Current_enUS.lua","Guides/MPlus/Current_zhTW.lua"]:
        try:
            lua.execute(f'_load("{base}{f}")'); P("loaded", f)
        except Exception as e:
            P("LOAD FAIL", f, repr(e))

    test = r"""
    local out = {}
    addon.BuildActiveGuides()
    addon.currentInstanceName = "塞塔里斯神庙"
    -- IsCurrentRaid
    out.isRaid = (function()
        local meta = addon.GuideData and addon.GuideData.meta and addon.currentInstanceName and addon.GuideData.meta[addon.currentInstanceName]
        return meta and meta.isRaid or false
    end)()
    -- call the REAL GetWindowCycleDiffs via upvalue? It's local; replicate using addon API:
    -- GetWindowCycleDiffs is local; instead test GetBossAvailableDifficulties + GetEnabledDiffOrder
    out.enabledOrder = table.concat(addon.GetEnabledDiffOrder(out.isRaid), ",")
    local avail = addon.GetBossAvailableDifficulties("塞塔里斯神庙","阿德里斯和阿斯匹克斯", out.isRaid)
    out.avail = table.concat(avail, ",")
    -- also for all bosses in instance
    local BossData = addon.GetBossData()
    local inst = BossData["塞塔里斯神庙"]
    local allmap = {}
    for boss, entry in pairs(inst) do
        if boss ~= "_src" then
            local a = addon.GetBossAvailableDifficulties("塞塔里斯神庙", boss, out.isRaid)
            for _,d in ipairs(a) do allmap[d]=true end
        end
    end
    local all = {}
    for _,d in ipairs({"lfr","normal","heroic","mythic","mythicplus"}) do if allmap[d] then all[#all+1]=d end end
    out.windowCycle = table.concat(all, ",")
    return out
    """
    res = lua.execute(test)
    P("RESULT:", type(res))
    for k,v in res.items():
        P(f"  {k} = {v}")
except Exception as e:
    P("FATAL:", repr(e)); traceback.print_exc(file=log)
log.close()
