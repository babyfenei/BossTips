-- Test GetBigWigsEncounterId for 密谋小径
-- Need to load the actual Data.lua logic in isolation

-- Mock the addon/L woW APIs
GetLocale = function() return "zhCN" end
local _addon = {
    LOCALE = "zhCN",
    GuideData = {
        meta = {
            ["密谋小径"] = { challengeID = 587, mapID = 2813, journalID = 1304 },
        },
    },
    BigWigsIdDB = {
        [2813] = {
            ["KystiaManaheart"] = 3101,
            ["ZaenBladesorrow"] = 3102,
            ["XathuuxtheAnnihilator"] = 3103,
            ["LithielCinderfury"] = 3105,
        },
    },
}
_G._addon_for_test = _addon
package.preload["Data"] = function()
    return _addon
end

-- Inline copy of the logic
local function NormalizeName(s)
    if type(s) ~= "string" then return "" end
    s = s:gsub("[%s%-–—·'’'\",.。、!！?？]", "")
    return s
end
local function CharJaccard(a, b)
    if a == "" or b == "" then return 0 end
    local ca, cb = {}, {}
    for i = 1, #a do ca[a:sub(i, i)] = (ca[a:sub(i, i)] or 0) + 1 end
    for i = 1, #b do cb[b:sub(i, i)] = (cb[b:sub(i, i)] or 0) + 1 end
    local inter, uni = 0, 0
    for c, n in pairs(ca) do
        uni = uni + n
        if cb[c] then inter = inter + math.min(n, cb[c]) end
    end
    for c, n in pairs(cb) do
        if not ca[c] then uni = uni + n end
    end
    return uni == 0 and 0 or inter / uni
end
local function AnySegmentMatch(a, b)
    if not a or not b then return false end
    if a:find("·") or b:find("·") then
        local function segs(s)
            local out = {}
            for p in s:gmatch("[^·]+") do out[#out+1] = p end
            return out
        end
        for _, x in ipairs(segs(a)) do
            for _, y in ipairs(segs(b)) do
                local nx, ny = NormalizeName(x), NormalizeName(y)
                if nx ~= "" and ny ~= "" and (nx == ny or nx:find(ny, 1, true) or ny:find(nx, 1, true)) then
                    return true
                end
            end
        end
    end
    return false
end
local function MatchBossName(a, b)
    if not a or not b or a == "" or b == "" then return false end
    local na, nb = NormalizeName(a), NormalizeName(b)
    if na == "" or nb == "" then return false end
    if na == nb then return true end
    if #na >= 2 and #nb >= 2 and (na:find(nb, 1, true) or nb:find(na, 1, true)) then return true end
    if CharJaccard(na, nb) >= 0.55 then return true end
    if AnySegmentMatch(a, b) then return true end
    return false
end

-- Mock EJ to return different names for testing
local mockEJNames = {
    [3101] = "凯斯媞亚·魔力之心",  -- exact match
    [3102] = "赞恩·刃悲",          -- exact match
    [3103] = "歼灭者萨祖克斯",       -- exact match
    [3105] = "利希尔·烬怒",          -- exact match
}
EJ_GetEncounterInfo = function(eid) return mockEJNames[eid] or "" end
EJ_SelectEncounter = function() end

local function GetBigWigsEncounterId(instance, boss)
    if not _addon.BigWigsIdDB or not instance or not boss then return nil end
    local meta = _addon.GuideData.meta and _addon.GuideData.meta[instance]
    local instanceId = meta and (meta.instanceId or meta.mapID)
    if not instanceId then return nil end
    local db = _addon.BigWigsIdDB[instanceId]
    if not db then return nil end
    local onlyName, onlyEid, count = nil, nil, 0
    for encName, eid in pairs(db) do
        if eid then
            count = count + 1
            onlyName, onlyEid = encName, eid
        end
    end
    if count == 1 and onlyEid then return tostring(onlyEid) end
    for encName, eid in pairs(db) do
        if eid and EJ_GetEncounterInfo then
            if EJ_SelectEncounter then pcall(EJ_SelectEncounter, tonumber(eid)) end
            local ok, ejName = pcall(EJ_GetEncounterInfo, tonumber(eid))
            if ok and ejName and ejName ~= "" then
                if MatchBossName(boss, ejName) then
                    return tostring(eid)
                end
            end
        end
    end
    return nil
end

-- Tests
print("=== Test GetBigWigsEncounterId for 密谋小径 ===")
local cases = {
    {"密谋小径", "凯斯媞亚·魔力之心", "3101"},
    {"密谋小径", "赞恩·刃悲", "3102"},
    {"密谋小径", "歼灭者萨祖克斯", "3103"},
    {"密谋小径", "利希尔·烬怒", "3105"},
    {"密谋小径", "凯斯媞亚·玛心", "3101"},  -- 不同译名
    {"密谋小径", "凯斯媞亚", "3101"},       -- 简称
    {"密谋小径", "凯斯蒂亚", nil},         -- 完全不同的译名
    {"密谋小径", "UnknownBoss", nil},      -- 找不到
}
local passed, failed = 0, 0
for _, c in ipairs(cases) do
    local got = GetBigWigsEncounterId(c[1], c[2])
    if got == c[3] then
        passed = passed + 1
        print(string.format("  PASS  [%s] %s -> %s", got or "nil", c[2], c[3] or "nil"))
    else
        failed = failed + 1
        print(string.format("  FAIL  got %s, expected %s  -- %s in %s", tostring(got), tostring(c[3]), c[2], c[1]))
    end
end
print(string.format("Total: %d passed, %d failed", passed, failed))
