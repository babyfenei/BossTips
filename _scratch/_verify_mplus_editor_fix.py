#!/usr/bin/env python3
"""Verify the M+ editor multi-language fix:
   1) syntax-check Data.lua / Editor.lua (compile only)
   2) functionally test GetGuideText + GetLocalizedBossName against the REAL
      M+ translation files for enUS / zhTW / zhCN.
"""
import os, sys, re

ROOT = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
LUA = os.path.join(ROOT, "Guides", "MPlus")
DATA = os.path.join(ROOT, "Data.lua")
EDITOR = os.path.join(ROOT, "Editor.lua")

try:
    from lupa import LuaRuntime
except ImportError:
    venv = r"C:\Users\Administrator\.workbuddy\binaries\python\envs\default"
    import subprocess
    subprocess.run([os.path.join(venv, "Scripts", "pip"), "install", "lupa"], check=True)
    from lupa import LuaRuntime

def read(p):
    with open(p, "r", encoding="utf-8") as f:
        return f.read()

lua = LuaRuntime(encoding="utf-8", unpack_returned_tuples=True)
R = lua.globals()

print("=== 1. Syntax check (compile only) ===")
for f in (DATA, EDITOR):
    try:
        lua.compile(read(f))
        print(f"  OK  {os.path.basename(f)}")
    except Exception as e:
        print(f"  FAIL {os.path.basename(f)}: {e}")
        sys.exit(1)

print("=== 2. Load real M+ translation data ===")
# make `addon` a Lua global; translation files bind `local _, addon = ...`
# so strip that line and let them use the global _G.addon
addon = lua.eval("{}")
addon["GuideData"] = lua.eval("{ versions={}, mplus={}, raids={}, meta={}, mplusInfo={}, versionInfo={} }")
addon["GuideData"]["translations"] = lua.eval("{}")
R["addon"] = addon

import re as _re
def strip_addon_bind(chunk):
    return _re.sub(r"^local\s+(?:_,?\s*)?addon\s*=\s*\.\.\.\s*$", "", chunk, flags=_re.M)

for fn in ("Current.lua", "Current_enUS.lua", "Current_zhTW.lua"):
    chunk = strip_addon_bind(read(os.path.join(LUA, fn)))
    try:
        lua.execute(chunk)  # uses global _G.addon
    except Exception as e:
        print(f"  load FAIL {fn}: {e}")
        sys.exit(1)
print("  loaded Current.lua / Current_enUS.lua / Current_zhTW.lua")

ZH = addon["GuideData"]["mplus"]["Current"]
EN = addon["GuideData"]["translations"]["enUS"]["mplus"]["Current"]
TW = addon["GuideData"]["translations"]["zhTW"]["mplus"]["Current"]

# ---- replicate the FIXED functions (copied from edited Data.lua) ----
fixed = r"""
local addon = ...
local DIFF_KEYS = { "lfr", "normal", "heroic", "mythic", "mythicplus" }

local function GetTipsForDifficulty(entry, diff)
    if not entry then return "" end
    if entry.type == "MOB" then return entry.tips or "" end
    local td = entry.tipsByDifficulty
    if type(td) == "table" and td[diff] and td[diff] ~= "" then return td[diff] end
    if entry.tips and entry.tips ~= "" then return entry.tips end
    if type(td) == "table" then
        for _, k in ipairs(DIFF_KEYS) do
            if td[k] and td[k] ~= "" then return td[k] end
        end
    end
    return ""
end

local function GetGuideText(entry, diff)
    if not entry then return "" end
    local locale = addon.LOCALE or "zhCN"
    if locale ~= "zhCN" then
        local trans = addon.GuideData and addon.GuideData.translations and addon.GuideData.translations[locale]
        local src = entry._src
        if trans and src then
            local lookupDiff = (src.type == "mplus") and "mythicplus" or diff
            local cat = trans[src.type]
            local ver = cat and cat[src.ver]
            local inst = ver and ver[src.instance]
            local b = inst and inst[src.boss]
            if b then
                local txt
                if entry.type == "MOB" then
                    txt = b.tips
                else
                    txt = (b.tipsByDifficulty and b.tipsByDifficulty[lookupDiff]) or b[lookupDiff]
                end
                if txt and txt ~= "" then return txt end
            end
        end
    end
    return GetTipsForDifficulty(entry, diff)
end

local function GetLocalizedBossName(instName, bossName, isRaid, verId)
    if not bossName or bossName == "" then return bossName end
    local trans = addon.GuideData.translations and addon.GuideData.translations[addon.LOCALE]
    if not trans then return bossName end
    local t
    if isRaid then
        if verId and trans.raids and trans.raids[verId] and trans.raids[verId][instName] then
            t = trans.raids[verId][instName][bossName]
        end
    else
        if verId and trans.mplus and trans.mplus[verId] and trans.mplus[verId][instName] then
            t = trans.mplus[verId][instName][bossName]
        end
        if not t and verId and trans.native and trans.native[verId] and trans.native[verId][instName] then
            t = trans.native[verId][instName][bossName]
        end
        if not t and verId and trans.versions and trans.versions[verId] and trans.versions[verId][instName] then
            t = trans.versions[verId][instName][bossName]
        end
    end
    if t and t.name and t.name ~= "" then return t.name end
    if t then
        local d = t.mythicplus or t.mythic or t.normal or t.heroic or t.lfr
        if d then
            local nm = tostring(d):match("^{rt%d+}(.-){rt%d+}")
            if nm and nm ~= "" then return nm end
        end
    end
    return bossName
end

addon.__GetGuideText = GetGuideText
addon.__GetLocalizedBossName = GetLocalizedBossName
"""
lua.execute(strip_addon_bind(fixed))  # uses global _G.addon
GetGuideText = addon["__GetGuideText"]
GetLocalizedBossName = addon["__GetLocalizedBossName"]

def has_cjk(s):
    if isinstance(s, bytes):
        s = s.decode("utf-8", "ignore")
    if not isinstance(s, str):
        return False
    return any('\u4e00' <= c <= '\u9fff' for c in s)

print("=== 3. Functional verification (every M+ boss, 3 locales) ===")
failures = 0
total = 0
samples = []
for inst, bosses in ZH.items():
    for boss, srcEntry in bosses.items():
        total += 1
        entry = lua.eval("{}")
        entry["type"] = "BOSS"
        entry["_src"] = lua.eval("{}")
        entry["_src"]["type"] = "mplus"
        entry["_src"]["ver"] = "Current"
        entry["_src"]["instance"] = inst
        entry["_src"]["boss"] = boss
        srcTd = srcEntry["tipsByDifficulty"]
        mp = ((srcTd and srcTd["mythicplus"]) or srcEntry["mythicplus"]
              or srcEntry["tips"] or "")
        entry["tipsByDifficulty"] = lua.eval("{}")
        entry["tipsByDifficulty"]["mythicplus"] = mp
        entry["tipsByDifficulty"]["lfr"] = mp   # mimic BuildActiveGuides LFR-fill for the mock
        entry["tips"] = mp

        for locale, transInst in (("zhCN", ZH), ("enUS", EN), ("zhTW", TW)):
            addon["LOCALE"] = locale
            body = GetGuideText(entry, "lfr")   # editor default editDiff = "lfr"
            name = GetLocalizedBossName(inst, boss, False, "Current")

            if locale == "zhCN":
                # zhCN: body must be the zhCN source (Chinese), name = zhCN key
                ok = (body == mp) and has_cjk(body) and (name == boss)
                expectBody = mp
                expectName = boss
            else:
                tEntry = transInst[inst]
                tEntry = tEntry[boss] if tEntry else None
                expectBody = tEntry["mythicplus"] if tEntry else ""
                m = re.match(r"^\{rt\d+\}(.*?)\{rt\d+\}", expectBody) if expectBody else None
                expectName = m.group(1) if m else ""
                # enUS: translated text must contain NO CJK; zhTW: Traditional Chinese (CJK ok)
                if locale == "enUS":
                    ok = (body == expectBody) and (not has_cjk(body)) and (name == expectName)
                else:  # zhTW
                    ok = (body == expectBody) and (name == expectName)
            if not ok:
                failures += 1
                print(f"  FAIL [{locale}] {inst}/{boss}")
                print(f"      body==expect? {body==expectBody}  noCJK(enUS only)? {not has_cjk(body)}  name={name!r} expectName={expectName!r}")
        if len(samples) < 3:
            addon["LOCALE"] = "enUS"
            samples.append((inst, boss, GetLocalizedBossName(inst, boss, False, "Current")))

for inst, boss, nm in samples:
    print(f"  sample(enUS) {inst}/{boss} -> {nm!r}")

print(f"\n=== RESULT: {total} bosses checked, {failures} failures ===")
print("PASS" if failures == 0 else "FAIL")
