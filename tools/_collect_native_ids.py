# -*- coding: utf-8 -*-
# For every native BOSS missing meta.encounterIds, derive the English boss name from
# the enUS translation tips header ({rt8}NAME{rt8}) and look it up in BigWigsIdDB
# keyed by meta.instanceId. Collect (ver, inst, cnBoss, enBoss, eid) for resolved ones.
import lupa, os, glob, json

LUA = lupa.LuaRuntime(unpack_returned_tuples=True)
LUA.execute(r"""
addon = {}
addon.GuideData = { versions={}, mplus={}, raids={}, meta={}, translations={} }
function GetLocale() return "zhCN" end
_G.GetLocale=GetLocale
_G.strtrim=function(s) return (s or ""):gsub("^%s*(.-)%s*$", "%1") end
_G.tContains=function(t,v) for _,x in ipairs(t) do if x==v then return true end end return false end
_G.table=table; _G.string=string
""")
base = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
native_vers = ["v1.0","v2.0","v3.0","v4.0","v5.0","v6.0","v7.0","v8.0","v9.0","v10.0","v11.0","v12.0"]
for v in native_vers:
    LUA.execute('local ok,err=loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % (base+f"/Guides/Dungeons/{v}.lua").replace("\\","/"))
    LUA.execute('local ok,err=loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % (base+f"/Guides/Dungeons/{v}_enUS.lua").replace("\\","/"))
LUA.execute('local ok,err=loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % (base+"/BigWigsIdDB.lua").replace("\\","/"))

probe = r"""
local GD = addon.GuideData
local BW = addon.BigWigsIdDB
local out = { resolved={}, unresolved={}, noEnUS={}, noHeader={}, bwMiss={} }
local function headerEn(t)
    -- t: a difficulty tips string; return English name inside {rt8}..{rt8}
    if type(t)~="string" then return nil end
    local m = t:match("^{rt%d+}(.-){rt%d+}")
    return m
end
for ver, insts in pairs(GD.versions or {}) do
    for inst, bosses in pairs(insts) do
        local meta = GD.meta and GD.meta[inst]
        local eids = meta and meta.encounterIds
        local instId = meta and (meta.instanceId or meta.mapID)
        local bwdb = instId and BW[tostring(instId)] or (instId and BW[instId])
        local enInst = GD.translations and GD.translations.enUS and GD.translations.enUS.native and GD.translations.enUS.native[ver] and GD.translations.enUS.native[ver][inst]
        for cnBoss, entry in pairs(bosses) do
            local typ = (type(entry)=="table") and entry.type or nil
            if typ ~= "MOB" then
                if eids and eids[cnBoss] then
                    -- already baked
                else
                    -- get English name from enUS translation
                    local enBoss, enName
                    if enInst and enInst[cnBoss] then
                        enBoss = enInst[cnBoss]
                        local td = enBoss.tipsByDifficulty
                        if type(td)=="table" then
                            for _, dk in ipairs({"normal","heroic","mythic","mythicplus","lfr"}) do
                                if td[dk] then enName = headerEn(td[dk]); if enName then break end end
                            end
                        end
                        if not enName and type(enBoss.tips)=="string" then enName = headerEn(enBoss.tips) end
                        if not enName and type(enBoss.name)=="string" then enName = enBoss.name end
                    end
                    if not enInst then
                        out.noEnUS[#out.noEnUS+1] = ver.."/"..inst.."/"..cnBoss
                    elseif not enName then
                        out.noHeader[#out.noHeader+1] = ver.."/"..inst.."/"..cnBoss
                    else
                        local eid
                        if bwdb then eid = bwdb[enName] end
                        if not eid then
                            -- try case-insensitive / partial
                            for k,v in pairs(bwdb or {}) do
                                if type(k)=="string" and k:lower()==enName:lower() then eid=v; break end
                            end
                        end
                        if eid then
                            out.resolved[#out.resolved+1] = { ver=ver, inst=inst, cn=cnBoss, en=enName, eid=tostring(eid), instId=tostring(instId) }
                        else
                            out.bwMiss[#out.bwMiss+1] = ver.."/"..inst.."/"..cnBoss.." (en="..enName..")"
                        end
                    end
                end
            end
        end
    end
end
return out
"""
res = LUA.execute(probe)
print("RESOLVED via enUS-header + BigWigsIdDB:", len(res['resolved']))
print("  noEnUS (no enUS translation):", len(res['noEnUS']))
print("  noHeader (enUS present but no {rt8}NAME{rt8}):", len(res['noHeader']))
print("  bwMiss (English name not found in BigWigsIdDB):", len(res['bwMiss']))
print("\n--- sample resolved (first 15) ---")
for r in res['resolved'][:15]:
    print(f"  {r['ver']}/{r['inst']}/{r['cn']}  en={r['en']}  eid={r['eid']}  instId={r['instId']}")
print("\n--- sample bwMiss (first 20) ---")
for s in res['bwMiss'][:20]:
    print("  ", s)
# save resolved to json for baking
with open(os.path.join(base, "tools", "_resolved_native_ids.json"), "w", encoding="utf-8") as f:
    json.dump(res['resolved'], f, ensure_ascii=False, indent=1)
print("\nsaved tools/_resolved_native_ids.json")
