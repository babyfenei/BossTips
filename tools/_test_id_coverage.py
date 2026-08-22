# -*- coding: utf-8 -*-
# Coverage test: after removing WTF encounterOverrides, does GetBossEncounterId still
# resolve every BUILT-IN boss via guide-file meta + shipped BigWigsIdDB/FallbackIdDB?
import lupa, os, glob

LUA = lupa.LuaRuntime(unpack_returned_tuples=True)
setup = r"""
addon = {}
addon.GuideData = { versions={}, mplus={}, raids={}, meta={} }
addon.BigWigsIdDB = nil
addon.FallbackIdDB = nil
function GetLocale() return "zhCN" end
function print(...) end
_G.GetLocale = GetLocale
_G.print = print
_G.strtrim = function(s) return (s or ""):gsub("^%s*(.-)%s*$", "%1") end
_G.tContains = function(t,v) for _,x in ipairs(t) do if x==v then return true end end return false end
_G.table = table
_G.string = string
"""
LUA.execute(setup)

base = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
files = []
files += glob.glob(os.path.join(base, "Guides/Dungeons/*.lua"))
files += glob.glob(os.path.join(base, "Guides/Raids/*.lua"))
files += glob.glob(os.path.join(base, "Guides/MPlus/Current.lua"))
files += [os.path.join(base, "BigWigsIdDB.lua"), os.path.join(base, "FallbackIdDB.lua")]

for f in files:
    LUA.execute('local ok, err = loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % f.replace("\\", "/"))

# Now define resolution WITHOUT WTF (customDungeons + encounterOverrides stripped)
resolver = r"""
local GD = addon.GuideData
local BigWigs = addon.BigWigsIdDB
local Fallback = addon.FallbackIdDB

local function NormalizeName(s)
    if type(s) ~= "string" then return "" end
    return s:gsub("[%s%-–—·'’'\",.。、!！?？]", ""):lower()
end
local function CharJaccard(a, b)
    if a=="" or b=="" then return 0 end
    local ca, cb = {}, {}
    for i=1,#a do ca[a:sub(i,i)] = (ca[a:sub(i,i)] or 0)+1 end
    for i=1,#b do cb[b:sub(i,i)] = (cb[b:sub(i,i)] or 0)+1 end
    local inter, uni = 0, 0
    for c,n in pairs(ca) do uni=uni+n; if cb[c] then inter=inter+math.min(n,cb[c]) end end
    for c,n in pairs(cb) do if not ca[c] then uni=uni+n end end
    return uni==0 and 0 or inter/uni
end
local function MatchBossName(a, b)
    if not a or not b or a=="" or b=="" then return false end
    local na, nb = NormalizeName(a), NormalizeName(b)
    if na=="" or nb=="" then return false end
    if na==nb then return true end
    if #na>=2 and #nb>=2 and (na:find(nb,1,true) or nb:find(na,1,true)) then return true end
    if CharJaccard(na, nb) >= 0.55 then return true end
    return false
end

local function GetBigWigsEncounterId(instance, boss)
    if not BigWigs or not instance or not boss then return nil end
    local meta = GD.meta and GD.meta[instance]
    local instanceId = meta and (meta.mapID or meta.instanceId)
    if not instanceId then return nil end
    local db = BigWigs[instanceId]
    if not db then return nil end
    local onlyName, onlyEid, count = nil, nil, 0
    for encName, eid in pairs(db) do
        if eid then count=count+1; onlyName, onlyEid = encName, eid end
    end
    if count==1 and onlyEid then return tostring(onlyEid) end
    -- NOTE: name matching needs EJ_GetEncounterInfo; in this offline test we skip it.
    return nil
end

local function GetFallbackEncounterId(instance, boss)
    if not Fallback or not instance or not boss then return nil end
    local data = Fallback[instance]
    if not data or not data.bosses then return nil end
    if data.bosses[boss] then return tostring(data.bosses[boss]) end
    local onlyBoss, onlyEid, count = nil, nil, 0
    for bname, eid in pairs(data.bosses) do count=count+1; onlyBoss, onlyEid=bname, eid end
    if count==1 and onlyEid then return tostring(onlyEid) end
    for bname, eid in pairs(data.bosses) do if MatchBossName(boss, bname) then return tostring(eid) end end
    return nil
end

-- resolution WITHOUT WTF: meta.encounterIds -> BigWigs -> Fallback
local function Resolve(instance, boss)
    local meta = GD.meta and GD.meta[instance]
    if meta and meta.encounterIds and meta.encounterIds[boss] then
        return meta.encounterIds[boss], "meta"
    end
    local bw = GetBigWigsEncounterId(instance, boss)
    if bw then return bw, "bigwigs" end
    local fb = GetFallbackEncounterId(instance, boss)
    if fb then return fb, "fallback" end
    return nil
end

local total, ok, fail = 0, 0, 0
local fails = {}
local bySource = { meta=0, bigwigs=0, fallback=0 }
for ver, insts in pairs(GD.versions or {}) do
    for inst, bosses in pairs(insts) do
        for boss in pairs(bosses) do
            total = total + 1
            local eid, src = Resolve(inst, boss)
            if eid then ok=ok+1; if src then bySource[src]=(bySource[src] or 0)+1 end
            else fail=fail+1; if #fails<15 then fails[#fails+1]=("原生 "..inst.." / "..boss) end end
        end
    end
end
for ver, insts in pairs(GD.raids or {}) do
    for inst, bosses in pairs(insts) do
        for boss in pairs(bosses) do
            total = total + 1
            local eid, src = Resolve(inst, boss)
            if eid then ok=ok+1; if src then bySource[src]=(bySource[src] or 0)+1 end
            else fail=fail+1; if #fails<15 then fails[#fails+1]=("团本 "..inst.." / "..boss) end end
        end
    end
end
for ver, insts in pairs(GD.mplus or {}) do
    for inst, bosses in pairs(insts) do
        for boss in pairs(bosses) do
            total = total + 1
            local eid, src = Resolve(inst, boss)
            if eid then ok=ok+1; if src then bySource[src]=(bySource[src] or 0)+1 end
            else fail=fail+1; if #fails<15 then fails[#fails+1]=("M+ "..inst.." / "..boss) end end
        end
    end
end
return { total=total, ok=ok, fail=fail, bySource=bySource, fails=fails }
"""
res = LUA.execute(resolver)
print("Total built-in bosses:", res['total'])
print("Resolved (no WTF):", res['ok'])
print("UNRESOLVED:", res['fail'])
print("By source:", dict(res['bySource']))
if res['fail'] > 0:
    print("Sample unresolved:")
    for f in res['fails']:
        print("  -", f)
