# -*- coding: utf-8 -*-
# Per-category breakdown: which bosses lack meta.encounterIds, and which instances
# have NO meta block at all.
import lupa, os, glob

LUA = lupa.LuaRuntime(unpack_returned_tuples=True)
setup = r"""
addon = {}
addon.GuideData = { versions={}, mplus={}, raids={}, meta={} }
function GetLocale() return "zhCN" end
function print(...) end
_G.GetLocale = GetLocale; _G.print = print
_G.strtrim = function(s) return (s or ""):gsub("^%s*(.-)%s*$", "%1") end
_G.tContains = function(t,v) for _,x in ipairs(t) do if x==v then return true end end return false end
_G.table = table; _G.string = string
"""
LUA.execute(setup)

base = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
files = (glob.glob(os.path.join(base, "Guides/Dungeons/*.lua"))
         + glob.glob(os.path.join(base, "Guides/Raids/*.lua"))
         + [os.path.join(base, "Guides/MPlus/Current.lua")])
for f in files:
    LUA.execute('local ok, err = loadfile(%r); if not ok then error(err) end; ok("BossTips", addon)' % f.replace("\\", "/"))

probe = r"""
local GD = addon.GuideData
local cats = { {name="DUN", t=GD.versions}, {name="RAID", t=GD.raids}, {name="MPLUS", t=GD.mplus} }
local out = {}
for _, c in ipairs(cats) do
    local tot, cov = 0, 0
    local instsNoMeta = {}
    local missByInst = {}
    for ver, insts in pairs(c.t or {}) do
        for inst, bosses in pairs(insts) do
            local meta = GD.meta and GD.meta[inst]
            local eids = meta and meta.encounterIds
            if not meta then instsNoMeta[#instsNoMeta+1] = tostring(ver).."/"..tostring(inst) end
            local names = {}
            for k, v in pairs(bosses) do
                if type(k)=="string" then names[#names+1]=k end
            end
            for _, bn in ipairs(names) do
                tot = tot + 1
                if eids and eids[bn] then cov = cov + 1
                else missByInst[tostring(ver).."/"..tostring(inst)] = (missByInst[tostring(ver).."/"..tostring(inst)] or 0) + 1 end
            end
        end
    end
    out[c.name] = { total=tot, covered=cov, instsNoMeta=instsNoMeta,
                    missByInst=missByInst, nMissInst=#missByInst }
end
return out
"""
res = LUA.execute(probe)
for cat in ("DUN", "RAID", "MPLUS"):
    d = res[cat]
    print(f"=== {cat} === total={d['total']} covered={d['covered']} missing={d['total']-d['covered']} instancesWithGaps={d['nMissInst']}")
    if d['instsNoMeta']:
        print("  instances with NO meta block:", d['instsNoMeta'][:20])
    # print top missing instances
    mb = d['missByInst']
    items = sorted(mb.items(), key=lambda kv: -kv[1])[:15]
    for k, v in items:
        print(f"    missing {v}: {k}")
