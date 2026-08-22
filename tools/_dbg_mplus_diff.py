# -*- coding: utf-8 -*-
import lupa, traceback, sys
from lupa import LuaRuntime

log = open("c:/tmp/dbg_mplus.log", "w", encoding="utf-8")
def P(*a):
    s = " ".join(str(x) for x in a)
    log.write(s + "\n"); log.flush()

try:
    lua = LuaRuntime(unpack_returned_tuples=True)
    P("lupa OK")

    setup = r"""
    math = math or {}; string = string; table = table; _G = _G or {}
    function GetLocale() return "zhCN" end
    function GetNumGroupMembers() return 1 end
    function print(...) end
    function strtrim(s) return (s:gsub("^%s*(.-)%s*$", "%1")) end
    function strsplit(sep, s)
        local t = {}; local pat = (sep:gsub("([%%%.])", "%%%1")); local p = 1
        while true do local i = s:find(pat, p, true)
            if not i then t[#t+1] = s:sub(p); break end
            t[#t+1] = s:sub(p, i-1); p = i + #sep end
        return table.unpack(t)
    end
    function tContains(t, v) for _,x in ipairs(t) do if x==v then return true end end return false end
    _G.GetLocale=GetLocale; _G.GetNumGroupMembers=GetNumGroupMembers; _G.strtrim=strtrim
    _G.strsplit=strsplit; _G.tContains=tContains; _G.print=print
    addon = {}; addon.L = setmetatable({}, { __index = function(_, k) return k end })
    addon.GuideData = nil; addon.LOCALE = "zhCN"
    BossTipsGlobalDB = { defaultChatChannel="INSTANCE_CHAT", sendChannelRight="SAY",
        defaultDifficulty="mythic", enabledDifficulties=nil, disabledMPlus={}, hiddenDungeons={} }
    local function loadfile_safe(path)
        local f, err = loadfile(path)
        if not f then error("load "..path..": "..tostring(err)) end
        return f("BossTips", addon)
    end
    _G._load = loadfile_safe
    """
    lua.execute(setup)
    P("setup done")

    base = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips/"
    files = ["Locales.lua","Data.lua","Guides/MPlus/Current.lua",
             "Guides/MPlus/Current_enUS.lua","Guides/MPlus/Current_zhTW.lua"]
    for f in files:
        try:
            lua.execute(f'_load("{base}{f}")')
            P("loaded OK:", f)
        except Exception as e:
            P("LOAD FAIL:", f, "->", repr(e))

    test = r"""
    local out = {}
    addon.BuildActiveGuides()
    local AG = addon.ActiveGuides
    local inst = "塞塔里斯神庙"
    out.hasInst = (AG and AG[inst]) ~= nil
    out.hasMetaMPlus = (addon.GuideData.meta and addon.GuideData.meta[inst]) ~= nil
    if AG and AG[inst] then
        for boss, entry in pairs(AG[inst]) do
            if boss ~= "_src" then
                local keys = {}
                if type(entry.tipsByDifficulty) == "table" then
                    for k,_ in pairs(entry.tipsByDifficulty) do keys[#keys+1]=k end
                end
                out["B:"..boss] = (entry.type or "?").." keys="..table.concat(keys, ",")
            end
        end
    end
    local function GetAvail(instanceName, bossName, isRaid)
        local BossData = addon.ActiveGuides
        local entry = BossData and BossData[instanceName] and BossData[instanceName][bossName]
        if not entry then return "NO ENTRY" end
        local base = isRaid and {"lfr","normal","heroic","mythic"} or {"lfr","normal","heroic","mythic","mythicplus"}
        local available = {}
        for _, k in ipairs(base) do
            local hasSpecific = type(entry.tipsByDifficulty)=="table" and type(entry.tipsByDifficulty[k])=="string" and entry.tipsByDifficulty[k]~=""
            if hasSpecific then available[#available+1]=k end
        end
        return table.concat(available, ",")
    end
    out.avail_Adderis = GetAvail("塞塔里斯神庙","阿德里斯和阿斯匹克斯",false)
    return out
    """
    res = lua.execute(test)
    P("RESULT TYPE:", type(res))
    for k, v in res.items():
        P(f"  {k} = {v}")
except Exception as e:
    P("FATAL:", repr(e))
    traceback.print_exc(file=log)
log.close()
