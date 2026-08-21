-- Test MatchBossName logic standalone
local function test_match()
    local function NormalizeForMatch(s)
        if type(s) ~= "string" then return "" end
        s = s:gsub("[%s%-%—–·'’'\"\"`~,，.。、!！?？]", "")
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
                    local nx, ny = NormalizeForMatch(x), NormalizeForMatch(y)
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
        local na, nb = NormalizeForMatch(a), NormalizeForMatch(b)
        if na == "" or nb == "" then return false end
        if na == nb then return true end
        if #na >= 2 and #nb >= 2 and (na:find(nb, 1, true) or nb:find(na, 1, true)) then return true end
        if CharJaccard(na, nb) >= 0.55 then return true end
        if AnySegmentMatch(a, b) then return true end
        return false
    end

    local cases = {
        {true,  "凯斯媞亚·魔力之心", "凯斯媞亚·魔力之心", "exact match"},
        {true,  "凯斯媞亚·魔力之心", "凯斯媞亚·玛心", "different 2nd segment (should still match via main name)"},
        {true,  "赞恩·刃悲", "赞恩·刃悲", "exact short match"},
        {true,  "歼灭者萨祖克斯", "歼灭者萨祖克斯", "exact"},
        {true,  "凯斯媞亚", "凯斯媞亚·魔力之心", "first segment match (substr)"},
        {true,  "Kystia Manaheart", "凯斯媞亚·魔力之心", "EN vs CN (Jaccard >= 0.55)"},
        {false, "Xathuux the Annihilator", "凯斯媞亚·魔力之心", "EN vs CN different bosses (should not match)"},
        {true,  "Xathuux", "XathuuxtheAnnihilator", "EN substring"},
        {true,  "Anub'arak", "阿努巴拉克", "EN vs CN (high Jaccard)"},
        {true,  "Kryxis the Voracious", "克里西斯·贪噬者", "EN vs CN test"},
        {false, "", "anything", "empty input"},
        {false, "nothing", "", "empty other"},
        {true,  "灼热之缚", "灼热之缚", "exact CN short"},
        {true,  "岩浆管道", "岩浆管道", "exact CN"},
    }
    local passed, failed = 0, 0
    for _, c in ipairs(cases) do
        local got = MatchBossName(c[2], c[3])
        if got == c[1] then
            passed = passed + 1
            print(string.format("  PASS  [%s] '%s' vs '%s'", tostring(got), c[2], c[3]))
        else
            failed = failed + 1
            print(string.format("  FAIL  [got %s expected %s] '%s' vs '%s'  -- %s", tostring(got), tostring(c[1]), c[2], c[3], c[4]))
        end
    end
    print(string.format("MatchBossName: %d passed, %d failed", passed, failed))
end
return test_match
