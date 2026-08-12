-- ============================================================================
-- BossTips Data.lua —— 数据层（与 Guides/*.lua 对接，契约保持不变）
-- 负责：默认配置、合并攻略表、按 || 分割发送聊天、base64 导入导出。
-- UI 文件（Core/Window/Settings/Editor/Picker）均依赖本文件构建的 addon.ActiveGuides。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, versionInfo = {}, mplusInfo = {}, meta = {} }
addon.ActiveGuides = addon.ActiveGuides or {}

-- ============ 工具 ============
local function CopyTable(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do copy[k] = CopyTable(v) end
    return copy
end

local function ParseVersionNumber(v)
    if type(v) ~= "string" then return nil end
    local n = v:match("(%d+)")
    return n and tonumber(n) or nil
end

-- ============ 默认配置（账号级 SavedVariables: BossTipsGlobalDB） ============
local defaultConfig = {
    mainButtonPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", xOffset = 20, yOffset = -50 },
    bossMenuPopDirection = "BOTTOM",
    tipsFramePopDirection = "BOTTOM",
    tipsFrameAlign = "LEFT",
    hideMainButtonWhenNoGuide = false,
    TipsFrameSize = { width = 500, height = 400 },
    FontSize = 14,
    defaultChatChannel = "INSTANCE_CHAT",
    disabledNative = {},
    disabledMPlus = {},
    hiddenDungeons = {},
    guides = {},
    showMobs = false,
    -- 参考 DungeonCheatSheet 的行为设置
    autoExpandOnTarget = true,
    autoOpenOnEnter = true,
    lockWindow = false,
    tipsBgStyle = "black",
    tipsFont = "default",
    tipsBgR = 0.05,
    tipsBgG = 0.05,
    tipsBgB = 0.05,
    tipsBgA = 0.82,
    collapsedAlpha = 0.55,
    singleExpand = true,
    enableChatSend = true,
    guideWindowWidth = 360,
    showMinimapButton = false,
    minimapAngle = 225,
    testInstance = nil,
}
addon.defaultConfig = defaultConfig

local function ensureDBExists()
    if not BossTipsGlobalDB then
        BossTipsGlobalDB = CopyTable(defaultConfig)
    else
        for k, v in pairs(defaultConfig) do
            if BossTipsGlobalDB[k] == nil then
                if type(v) == "table" then BossTipsGlobalDB[k] = CopyTable(v)
                else BossTipsGlobalDB[k] = v end
            end
        end
    end
    -- 嵌套表兜底（防止旧存档里是 nil）
    if not BossTipsGlobalDB.disabledNative then BossTipsGlobalDB.disabledNative = {} end
    if not BossTipsGlobalDB.disabledMPlus then BossTipsGlobalDB.disabledMPlus = {} end
    if not BossTipsGlobalDB.hiddenDungeons then BossTipsGlobalDB.hiddenDungeons = {} end
    if not BossTipsGlobalDB.guides then BossTipsGlobalDB.guides = {} end
end
ensureDBExists()

-- ============ 攻略框背景/字体映射 ============
local BG_STYLES = {
    black = { 0, 0, 0, 0.90 },
    translucent = { 0, 0, 0, 0.60 },
    navy = { 0.08, 0.16, 0.32, 0.88 },
}
local function GetTipsBg()
    if BossTipsGlobalDB.tipsBgR ~= nil then
        return BossTipsGlobalDB.tipsBgR, BossTipsGlobalDB.tipsBgG, BossTipsGlobalDB.tipsBgB, BossTipsGlobalDB.tipsBgA
    end
    local s = BG_STYLES[BossTipsGlobalDB.tipsBgStyle] or BG_STYLES.black
    return s[1], s[2], s[3], s[4]
end
local FONT_PATHS = {
    default = (GameFontNormal and GameFontNormal:GetFont()) or STANDARD_TEXT_FONT,
    damage = DAMAGE_TEXT_FONT,
    chat = "Fonts\\ARHei.ttf",
}
local function GetTipsFontPath()
    return FONT_PATHS[BossTipsGlobalDB.tipsFont] or FONT_PATHS.default
end

-- ============ 排序工具 ============
local function BuildSortedIDs(tbl, info)
    local list = {}
    if type(tbl) ~= "table" then return list end
    for id in pairs(tbl) do list[#list + 1] = id end
    table.sort(list, function(a, b)
        local oa = info and info[a] and tonumber(info[a].order)
        local ob = info and info[b] and tonumber(info[b].order)
        if oa and ob then
            if oa ~= ob then return oa < ob end
        elseif oa then return true
        elseif ob then return false end
        local na, nb = ParseVersionNumber(a), ParseVersionNumber(b)
        if na and nb then
            if na ~= nb then return na < nb end
        elseif na then return true
        elseif nb then return false end
        return tostring(a) < tostring(b)
    end)
    return list
end

local function GetNativeOrder()
    local GD = addon.GuideData
    return BuildSortedIDs(GD.versions, GD.versionInfo)
end
local function GetMPlusOrder()
    local GD = addon.GuideData
    return BuildSortedIDs(GD.mplus, GD.mplusInfo)
end
local function GetVersionLabel(id)
    local GD = addon.GuideData
    local i = (GD.versionInfo and GD.versionInfo[id]) or (GD.mplusInfo and GD.mplusInfo[id])
    return (i and i.label) or tostring(id)
end
addon.GetNativeOrder = GetNativeOrder
addon.GetMPlusOrder = GetMPlusOrder
addon.GetVersionLabel = GetVersionLabel

-- ============ 合并当前应显示的攻略表（按副本名索引） ============
-- 优先级：WTF 自定义 guides > 大秘境 Current > 大版本原生
local function BuildActiveGuides()
    local GD = addon.GuideData or { versions = {}, mplus = {} }
    local db = BossTipsGlobalDB
    local guides = {}
    local function addDungeon(instance, dungeonTbl)
        if db.hiddenDungeons and db.hiddenDungeons[instance] then return end
        if guides[instance] then return end
        local copy = {}
        for boss, entry in pairs(dungeonTbl) do
            local etype = entry.type or "BOSS"
            if etype == "MOB" and not db.showMobs then
                -- 跳过小怪条目
            else
                copy[boss] = { order = entry.order, type = etype, tips = entry.tips }
            end
        end
        guides[instance] = copy
    end
    if GD.mplus then
        for _, sid in ipairs(GetMPlusOrder()) do
            if GD.mplus[sid] and not (db.disabledMPlus and db.disabledMPlus[sid]) then
                for instance, dungeonTbl in pairs(GD.mplus[sid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end
    if GD.versions then
        for _, vid in ipairs(GetNativeOrder()) do
            if GD.versions[vid] and not (db.disabledNative and db.disabledNative[vid]) then
                for instance, dungeonTbl in pairs(GD.versions[vid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end
    if db.guides then
        for instance, bosses in pairs(db.guides) do
            if not (db.hiddenDungeons and db.hiddenDungeons[instance]) then
                if not guides[instance] then guides[instance] = {} end
                for boss, tips in pairs(bosses) do
                    if not guides[instance][boss] then
                        guides[instance][boss] = { order = 999, type = "BOSS", tips = tips }
                    else
                        guides[instance][boss].tips = tips
                    end
                end
            end
        end
    end
    addon.ActiveGuides = guides
end

local function GetBossData() return addon.ActiveGuides end
local function GetActiveGuideEntry(instance, boss)
    local g = addon.ActiveGuides
    if g and g[instance] and g[instance][boss] then return g[instance][boss] end
    return nil
end
addon.GetBossData = GetBossData
addon.GetActiveGuideEntry = GetActiveGuideEntry
addon.BuildActiveGuides = BuildActiveGuides

-- ============ base64 导入/导出（分隔符 \001 / \002） ============
local FIELD_SEP = "\001"
local REC_SEP = "\002"
local function EncodeGuides()
    local db = BossTipsGlobalDB
    if not db.guides then return "" end
    local parts = {}
    for instance, bosses in pairs(db.guides) do
        for boss, tips in pairs(bosses) do
            parts[#parts + 1] = instance .. FIELD_SEP .. boss .. FIELD_SEP .. tips
        end
    end
    local raw = table.concat(parts, REC_SEP)
    if C_Base64 and C_Base64.Encode then
        local ok, res = pcall(C_Base64.Encode, raw)
        if ok and res then return res end
    end
    return raw
end
local function DecodeGuides(b64)
    if not b64 or b64 == "" then return {} end
    local raw = b64
    if C_Base64 and C_Base64.Decode then
        local ok, res = pcall(C_Base64.Decode, b64)
        if ok and res then raw = res end
    end
    local result = {}
    local records = { strsplit(REC_SEP, raw) }
    for _, rec in ipairs(records) do
        if rec and rec ~= "" then
            local instance, boss, tips = strsplit(FIELD_SEP, rec)
            if instance and boss and tips then
                result[instance] = result[instance] or {}
                result[instance][boss] = tips
            end
        end
    end
    return result
end
local function MergeImportedGuides(decoded)
    local db = BossTipsGlobalDB
    db.guides = db.guides or {}
    local count = 0
    for instance, bosses in pairs(decoded) do
        db.guides[instance] = db.guides[instance] or {}
        for boss, tips in pairs(bosses) do
            db.guides[instance][boss] = tips
            count = count + 1
        end
    end
    return count
end
addon.EncodeGuides = EncodeGuides
addon.DecodeGuides = DecodeGuides
addon.MergeImportedGuides = MergeImportedGuides

-- ============ 列出所有副本 ============
local function CollectAllInstances()
    local set = {}
    local GD = addon.GuideData or { versions = {}, mplus = {} }
    if GD.versions then
        for _, t in pairs(GD.versions) do
            for instance in pairs(t) do set[instance] = true end
        end
    end
    if GD.mplus then
        for _, t in pairs(GD.mplus) do
            for instance in pairs(t) do set[instance] = true end
        end
    end
    local list = {}
    for k in pairs(set) do list[#list + 1] = k end
    table.sort(list)
    return list
end
addon.CollectAllInstances = CollectAllInstances

-- ============ 攻略发送（按 || 分割，约 240 字/条发送） ============
local function SendBossTips(bossName)
    if not bossName or not addon.currentInstanceName then
        print("|cFFFF0000BossTips|r: 未选中BOSS或副本信息异常")
        return
    end
    local BossData = GetBossData()
    if not BossData or not BossData[addon.currentInstanceName] or not BossData[addon.currentInstanceName][bossName] then
        print("|cFFFF0000BossTips|r: 无", bossName, "的攻略信息")
        return
    end
    local tips = BossData[addon.currentInstanceName][bossName].tips
    if not tips then
        print("|cFFFF0000BossTips|r: 无", bossName, "的攻略信息")
        return
    end
    local MAX_CHAT_LENGTH = 240
    local parts = { strsplit("||", tips) }
    local sortedParts = {}
    local hasSeparator = false
    for _, part in ipairs(parts) do
        local trimmed = strtrim(part)
        if trimmed ~= "" then sortedParts[#sortedParts + 1] = trimmed; hasSeparator = true end
    end
    if not hasSeparator then
        local trimmedTips = strtrim(tips)
        if trimmedTips ~= "" then
            sortedParts = {}
            local currentPart = ""
            local words = { strsplit(" ", trimmedTips) }
            for _, word in ipairs(words) do
                if string.len(currentPart) + string.len(word) + 1 <= MAX_CHAT_LENGTH then
                    currentPart = (currentPart ~= "" and (currentPart .. " " .. word) or word)
                else
                    if currentPart ~= "" then sortedParts[#sortedParts + 1] = currentPart end
                    currentPart = word
                end
            end
            if currentPart ~= "" then sortedParts[#sortedParts + 1] = currentPart end
        end
    end
    if #sortedParts == 0 then
        print("|cFFFF0000BossTips|r: 攻略内容为空")
        return
    end
    if #sortedParts == 1 and string.find(sortedParts[1], "{rt8}.*{rt8}") then
        sortedParts[#sortedParts + 1] = strtrim(string.gsub(tips, "{rt8}.*{rt8}", ""))
        local filtered = {}
        for _, part in ipairs(sortedParts) do
            if strtrim(part) ~= "" then filtered[#filtered + 1] = part end
        end
        sortedParts = filtered
    end
    local chatType = BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT"
    if chatType == "PARTY" then
        local numGroup = GetNumGroupMembers() or 0
        chatType = (numGroup > 5 and "RAID" or "PARTY")
    end
    local index = 1
    local delay = 0.5
    local function sendNext()
        if index <= #sortedParts then
            SendChatMessage(sortedParts[index], chatType)
            index = index + 1
            C_Timer.After(delay, sendNext)
        else
            print("|cFF00FF00BossTips|r: 已发送", bossName, "攻略到", chatType)
            if addon.tipsFrame and addon.tipsFrame:IsShown() then
                addon.tipsFrame:Hide()
                addon.manuallyHidden = true
            end
        end
    end
    sendNext()
end
addon.SendBossTips = SendBossTips
addon.GetTipsBg = GetTipsBg
addon.GetTipsFontPath = GetTipsFontPath
