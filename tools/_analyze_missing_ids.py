# -*- coding: utf-8 -*-
# Correct analysis: real boss name = string key OR v.name/v.entry.name.
# Exclude MOB-type (no encounterId needed). Measure FallbackIdDB offline coverage
# for the BOSS entries that lack meta.encounterIds.
import lupa, os, glob

LUA = lupa.LuaRuntime(unpack_returned_tuples=True)
LUA.execute(r"""
addon = {}
addon.GuideData = { versions={}, mplus={}, raids={}, meta={} }
addon.FallbackIdDB = nil
function GetLocale() return "zhCN" end
_G.GetLocale=GetLocale
_G.strtrim=function(s) return (s or ""):gsub("^%s*(.-)%s*$", "%1") end
_G.tContains=function(t,v) for _,x in ipairs(t) do if x==v then return true end end return false end
_G.table=table; _G.string=string
""")
base = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
for f in (glob.glob(os.path.join(base,"Guides/Dungeons/*.lua"))
          + glob.glob(os.path.join(base,"Guides/Raids/*.lua"))
          + [os.path.join(base,"Guides/MPlus/Current.lua")]
          + [os.path.join(base,"FallbackIdDB.lua")]):
    LUA.execute('local ok,err=loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % f.replace("\\","/"))

probe = r"""
local GD = addon.GuideData
local FB = addon.FallbackIdDB
local cats = { {name="DUN", t=GD.versions}, {name="RAID", t=GD.raids}, {name="MPLUS", t=GD.mplus} }
local function bossName(k, v)
    if type(k)=="string" then return k end
    if type(v)=="table" then return v.name or (v.entry and v.entry.name) or nil end
    return nil
end
local function NormalizeName(s)
    if type(s)~="string" then return "" end
    return s:gsub("[%s%-–—·'’'\",.。、!！?？]", ""):lower()
end
local function CharJaccard(a,b)
    if a=="" or b=="" then return 0 end
    local ca,cb={},{}
    for i=1,#a do ca[a:sub(i,i)]=(ca[a:sub(i,i)] or 0)+1 end
    for i=1,#b do cb[b:sub(i,i)]=(cb[b:sub(i,i)] or 0)+1 end
    local inter,uni=0,0
    for c,n in pairs(ca) do uni=uni+n; if cb[c] then inter=inter+math.min(n,cb[c]) end end
    for c,n in pairs(cb) do if not ca[c] then uni=uni+n end end
    return uni==0 and 0 or inter/uni
end
local function MatchBossName(a,b)
    if not a or not b or a=="" or b=="" then return false end
    local na,nb=NormalizeName(a),NormalizeName(b)
    if na==nb then return true end
    if #na>=2 and #nb>=2 and (na:find(nb,1,true) or nb:find(na,1,true)) then return true end
    if CharJaccard(na,nb)>=0.55 then return true end
    return false
end

local stats = { DUN={bossMiss=0,mobMiss=0,fbDirect=0,fbFuzzy=0,fbNone=0},
                RAID={bossMiss=0,mobMiss=0,fbDirect=0,fbFuzzy=0,fbNone=0},
                MPLUS={bossMiss=0,mobMiss=0,fbDirect=0,fbFuzzy=0,fbNone=0} }
local noneSamples = {}
for _, c in ipairs(cats) do
    local s = stats[c.name]
    for ver, insts in pairs(c.t or {}) do
        for inst, bosses in pairs(insts) do
            local meta = GD.meta and GD.meta[inst]
            local eids = meta and meta.encounterIds
            local fdata = FB and FB[inst]
            for k, v in pairs(bosses) do
                local nm = bossName(k, v)
                if nm then
                    local typ = (type(v)=="table") and v.type or nil
                    if typ=="MOB" then
                        s.mobMiss = s.mobMiss + 1
                    else
                        if eids and eids[nm] then
                            -- covered
                        else
                            s.bossMiss = s.bossMiss + 1
                            local got = nil
                            if fdata and fdata.bosses then
                                if fdata.bosses[nm] then got="direct"
                                else for bn,eid in pairs(fdata.bosses) do if MatchBossName(nm,bn) then got="fuzzy"; break end end end
                            end
                            if got=="direct" then s.fbDirect=s.fbDirect+1
                            elseif got=="fuzzy" then s.fbFuzzy=s.fbFuzzy+1
                            else s.fbNone=s.fbNone+1
                                if #noneSamples<40 then noneSamples[#noneSamples+1]=c.name.." "..tostring(ver).."/"..tostring(inst).."/"..tostring(nm) end
                            end
                        end
                    end
                end
            end
        end
    end
end
local lines = {}
for _, cn in ipairs({"DUN","RAID","MPLUS"}) do
    local s=stats[cn]
    lines[#lines+1]=cn..": bossMiss="..s.bossMiss.." mobMiss="..s.mobMiss.." fbDirect="..s.fbDirect.." fbFuzzy="..s.fbFuzzy.." fbNone="..s.fbNone
end
lines[#lines+1]="--- samples NOT resolvable offline (first 40) ---"
for _, x in ipairs(noneSamples) do lines[#lines+1]="  "..x end
return table.concat(lines, "\n")
"""
print(LUA.execute(probe))
