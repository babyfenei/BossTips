-- ============================================================================
-- BossTips Data.lua —— 数据层（与 Guides/*.lua 对接，契约保持不变）
-- 负责：默认配置、合并攻略表、按 || 分割发送聊天、导入导出。
-- UI 文件（Core/Window/Settings/Editor）均依赖本文件构建的 addon.ActiveGuides。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, versionInfo = {}, mplusInfo = {}, meta = {}, raids = {} }
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
addon.ParseVersionNumber = ParseVersionNumber

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
    disabledRaids = {},
    disabledCustomVersions = {},
    hiddenDungeons = {},
    guides = {},
    customVersions = {},
    customDungeons = {},
    encounterOverrides = {},
    dungeonOverrides = {},
    showMobs = false,
    -- 参考 DungeonCheatSheet 的行为设置
    autoExpandOnTarget = true,
    autoOpenOnEnter = true,
    guideWindowMode = "auto", -- "auto" 进本自动展开；"button" 仅点击悬浮按钮
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
    closeWindowAfterSend = false,
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
    if not BossTipsGlobalDB.disabledRaids then BossTipsGlobalDB.disabledRaids = {} end
    if not BossTipsGlobalDB.disabledCustomVersions then BossTipsGlobalDB.disabledCustomVersions = {} end
    if not BossTipsGlobalDB.hiddenDungeons then BossTipsGlobalDB.hiddenDungeons = {} end
    if not BossTipsGlobalDB.guides then BossTipsGlobalDB.guides = {} end
    if not BossTipsGlobalDB.customVersions then BossTipsGlobalDB.customVersions = {} end
    if not BossTipsGlobalDB.customDungeons then BossTipsGlobalDB.customDungeons = {} end
    if not BossTipsGlobalDB.encounterOverrides then BossTipsGlobalDB.encounterOverrides = {} end
    if not BossTipsGlobalDB.dungeonOverrides then BossTipsGlobalDB.dungeonOverrides = {} end
end
ensureDBExists()
addon.EnsureDB = ensureDBExists

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
    ensureDBExists()
    local GD = addon.GuideData
    local i = (GD.versionInfo and GD.versionInfo[id]) or (GD.mplusInfo and GD.mplusInfo[id])
    local custom = BossTipsGlobalDB.customVersions[id]
    if custom and custom.label and custom.label ~= "" then return custom.label end
    return (i and i.label) or tostring(id)
end
addon.GetNativeOrder = GetNativeOrder
addon.GetMPlusOrder = GetMPlusOrder
addon.GetVersionLabel = GetVersionLabel

-- ============ 团本（raids 命名空间）辅助 ============
-- 团本按版本字符串（"1.0".."12.0"）分文件，结构与 versions 平行，但独立命名空间，
-- 避免与 5 人本原生版本号冲突；编辑器以独立「团本」选项卡呈现。
local function GetRaidOrder()
    local GD = addon.GuideData
    return BuildSortedIDs(GD.raids, nil)
end
local function GetRaidVersionIDs()
    return GetRaidOrder()
end
local function GetRaidVersionLabel(id)
    ensureDBExists()
    local GD = addon.GuideData
    local i = GD.raidInfo and GD.raidInfo[id]
    if i and i.label and i.label ~= "" then return i.label end
    return (id and tostring(id) .. " 团本") or "团本"
end
local function GetRaidDungeons(verId)
    ensureDBExists()
    local GD = addon.GuideData
    local dungeons = {}
    if GD.raids and GD.raids[verId] then
        for instName, bosses in pairs(GD.raids[verId]) do
            dungeons[instName] = { isBuiltIn = true, source = "raid", bosses = bosses }
        end
    end
    return dungeons
end
local function IsRaidVersionEnabled(verId)
    ensureDBExists()
    return not (BossTipsGlobalDB.disabledRaids and BossTipsGlobalDB.disabledRaids[verId])
end
local function IsBuiltInRaid(verId, instName)
    local GD = addon.GuideData
    return (GD.raids and GD.raids[verId] and GD.raids[verId][instName]) ~= nil
end
addon.GetRaidOrder = GetRaidOrder
addon.GetRaidVersionIDs = GetRaidVersionIDs
addon.GetRaidVersionLabel = GetRaidVersionLabel
addon.GetRaidDungeons = GetRaidDungeons
addon.IsRaidVersionEnabled = IsRaidVersionEnabled
addon.IsBuiltInRaid = IsBuiltInRaid

-- ============ 自定义副本/版本辅助 ============
local function GetCustomVersionList()
    local list = {}
    for verId in pairs(BossTipsGlobalDB.customVersions or {}) do
        list[#list + 1] = verId
    end
    return list
end

local function GetAllVersionIDs()
    ensureDBExists()
    local seen = {}
    local list = {}
    for _, vid in ipairs(GetNativeOrder()) do seen[vid] = true; list[#list + 1] = vid end
    for _, sid in ipairs(GetMPlusOrder()) do if not seen[sid] then seen[sid] = true; list[#list + 1] = sid end end
    for _, vid in ipairs(GetCustomVersionList()) do if not seen[vid] then seen[vid] = true; list[#list + 1] = vid end end
    table.sort(list, function(a, b)
        local oa = (BossTipsGlobalDB.customVersions[a] and tonumber(BossTipsGlobalDB.customVersions[a].order)) or
                   (addon.GuideData.versionInfo[a] and tonumber(addon.GuideData.versionInfo[a].order)) or
                   (addon.GuideData.mplusInfo[a] and tonumber(addon.GuideData.mplusInfo[a].order)) or
                   ParseVersionNumber(a) or 9999
        local ob = (BossTipsGlobalDB.customVersions[b] and tonumber(BossTipsGlobalDB.customVersions[b].order)) or
                   (addon.GuideData.versionInfo[b] and tonumber(addon.GuideData.versionInfo[b].order)) or
                   (addon.GuideData.mplusInfo[b] and tonumber(addon.GuideData.mplusInfo[b].order)) or
                   ParseVersionNumber(b) or 9999
        if oa ~= ob then return oa < ob end
        return tostring(a) < tostring(b)
    end)
    return list
end
addon.GetAllVersionIDs = GetAllVersionIDs

local function GetVersionDungeons(verId)
    ensureDBExists()
    local GD = addon.GuideData
    local dungeons = {}
    -- 原生 / M+ 数据
    if GD.versions and GD.versions[verId] then
        for instName, bosses in pairs(GD.versions[verId]) do
            dungeons[instName] = { isBuiltIn = true, source = "native", bosses = bosses }
        end
    end
    if GD.mplus and GD.mplus[verId] then
        for instName, bosses in pairs(GD.mplus[verId]) do
            dungeons[instName] = { isBuiltIn = true, source = "mplus", bosses = bosses }
        end
    end
    -- 自定义副本归属到此版本
    for instName, d in pairs(BossTipsGlobalDB.customDungeons or {}) do
        if d.versionId == verId then
            dungeons[instName] = { isBuiltIn = false, source = "custom", data = d }
        end
    end
    return dungeons
end
addon.GetVersionDungeons = GetVersionDungeons

local function IsVersionEnabled(verId)
    ensureDBExists()
    local db = BossTipsGlobalDB
    local isNative = addon.GuideData.versions and addon.GuideData.versions[verId]
    local isMplus = addon.GuideData.mplus and addon.GuideData.mplus[verId]
    if isNative then return not (db.disabledNative[verId]) end
    if isMplus then return not (db.disabledMPlus[verId]) end
    -- 自定义版本
    return not (db.disabledCustomVersions and db.disabledCustomVersions[verId])
end
addon.IsVersionEnabled = IsVersionEnabled

local function IsCustomVersion(verId)
    return BossTipsGlobalDB.customVersions and BossTipsGlobalDB.customVersions[verId] ~= nil
end
addon.IsCustomVersion = IsCustomVersion

-- ============ 合并当前应显示的攻略表（按副本名索引） ============
-- 优先级：WTF 自定义 guides > 自定义副本 customDungeons > 大秘境 Current > 大版本原生
local DIFF_KEYS = { "lfr", "normal", "heroic", "mythic", "mythicplus" }
local function BuildActiveGuides()
    ensureDBExists()
    local GD = addon.GuideData or { versions = {}, mplus = {} }
    local db = BossTipsGlobalDB
    local guides = {}
    local function addBossEntry(copy, boss, entry)
        local etype = entry.type or "BOSS"
        if etype == "MOB" and not db.showMobs then return end
        local tips = entry.tips or ""
        copy[boss] = {
            order = entry.order or 999,
            type = etype,
            tips = tips,
        }
        -- 难度攻略：有则保留，缺的档位用通用 tips 兜底，保证难度按钮始终有内容
        local td = {}
        if type(entry.tipsByDifficulty) == "table" then
            for k, v in pairs(entry.tipsByDifficulty) do td[k] = v end
        end
        for _, dk in ipairs(DIFF_KEYS) do
            if not td[dk] or td[dk] == "" then td[dk] = tips end
        end
        copy[boss].tipsByDifficulty = td
    end
    local function addDungeon(instance, dungeonTbl)
        if db.hiddenDungeons and db.hiddenDungeons[instance] then return end
        if guides[instance] then return end
        local copy = {}
        for boss, entry in pairs(dungeonTbl) do
            addBossEntry(copy, boss, entry)
        end
        guides[instance] = copy
    end

    -- 大秘境
    if GD.mplus then
        for _, sid in ipairs(GetMPlusOrder()) do
            if GD.mplus[sid] and not (db.disabledMPlus and db.disabledMPlus[sid]) then
                for instance, dungeonTbl in pairs(GD.mplus[sid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end
    -- 原生版本
    if GD.versions then
        for _, vid in ipairs(GetNativeOrder()) do
            if GD.versions[vid] and not (db.disabledNative and db.disabledNative[vid]) then
                for instance, dungeonTbl in pairs(GD.versions[vid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end
    -- 团本（独立命名空间，按版本号合并；副本名与 5 人本不冲突）
    if GD.raids then
        for _, vid in ipairs(GetRaidVersionIDs()) do
            if GD.raids[vid] and not (db.disabledRaids and db.disabledRaids[vid]) then
                for instance, dungeonTbl in pairs(GD.raids[vid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end
    -- 自定义副本
    for instance, d in pairs(db.customDungeons or {}) do
        if d.isActive ~= false and not (db.hiddenDungeons and db.hiddenDungeons[instance])
           and not (db.disabledCustomVersions and db.disabledCustomVersions[d.versionId]) then
            if not guides[instance] then
                local copy = {}
                for boss, b in pairs(d.bosses or {}) do
                    addBossEntry(copy, boss, b)
                end
                guides[instance] = copy
            end
        end
    end
    -- WTF 层覆盖
    if db.guides then
        for instance, bosses in pairs(db.guides) do
            if not (db.hiddenDungeons and db.hiddenDungeons[instance]) then
                if not guides[instance] then guides[instance] = {} end
                for boss, tips in pairs(bosses) do
                    local etype, tipText = "BOSS", tips
                    local wtfDiff
                    if type(tips) == "table" then
                        tipText = tips.tips or ""
                        etype = tips.type or "BOSS"
                        if type(tips.tipsByDifficulty) == "table" then wtfDiff = tips.tipsByDifficulty end
                    end
                    if etype == "MOB" and not db.showMobs then
                        guides[instance][boss] = nil
                    else
                        if not guides[instance][boss] then
                            guides[instance][boss] = { order = 999, type = etype, tips = tipText, tipsByDifficulty = {} }
                            for _, dk in ipairs(DIFF_KEYS) do guides[instance][boss].tipsByDifficulty[dk] = tipText end
                        else
                            guides[instance][boss].tips = tipText
                            if type(tips) == "table" and tips.type then
                                guides[instance][boss].type = etype
                            end
                            if wtfDiff then
                                guides[instance][boss].tipsByDifficulty = guides[instance][boss].tipsByDifficulty or {}
                                for dk, dv in pairs(wtfDiff) do
                                    if dv ~= nil and dv ~= "" then guides[instance][boss].tipsByDifficulty[dk] = dv end
                                end
                            end
                        end
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

-- 获取某个首领/小怪的 encounterId：自定义副本 > WTF 覆盖层 > 内置数据 > BigWigs 数据
local function GetBossEncounterId(instance, boss)
    ensureDBExists()
    local GD = addon.GuideData
    if BossTipsGlobalDB.customDungeons[instance] then
        local b = BossTipsGlobalDB.customDungeons[instance].bosses and BossTipsGlobalDB.customDungeons[instance].bosses[boss]
        if b and b.encounterId and b.encounterId ~= "" then return b.encounterId end
    end
    if BossTipsGlobalDB.encounterOverrides[instance] and BossTipsGlobalDB.encounterOverrides[instance][boss] then
        return BossTipsGlobalDB.encounterOverrides[instance][boss]
    end
    if GD.meta and GD.meta[instance] and GD.meta[instance].encounterIds and GD.meta[instance].encounterIds[boss] then
        return GD.meta[instance].encounterIds[boss]
    end
    -- 尝试从 BigWigs 数据匹配（按 instanceId 和中文首领名）
    local bigWigsId = addon.GetBigWigsEncounterId and addon.GetBigWigsEncounterId(instance, boss)
    if bigWigsId then return bigWigsId end
    -- 最后尝试离线外网 fallback 数据库
    local fallbackId = addon.GetFallbackEncounterId and addon.GetFallbackEncounterId(instance, boss)
    if fallbackId then return fallbackId end
    return nil
end

-- 副本属性覆盖层（内置副本也能编辑 ID/类型/难度）
local function GetDungeonOverride(instance)
    ensureDBExists()
    return BossTipsGlobalDB.dungeonOverrides[instance]
end

local function SetDungeonOverride(instance, key, value)
    ensureDBExists()
    BossTipsGlobalDB.dungeonOverrides[instance] = BossTipsGlobalDB.dungeonOverrides[instance] or {}
    BossTipsGlobalDB.dungeonOverrides[instance][key] = value
end

addon.GetBossData = GetBossData
addon.GetActiveGuideEntry = GetActiveGuideEntry
addon.GetBossEncounterId = GetBossEncounterId
addon.GetDungeonOverride = GetDungeonOverride
addon.SetDungeonOverride = SetDungeonOverride
addon.BuildActiveGuides = BuildActiveGuides

-- ============ BigWigs ID 自动匹配 ============
local function NormalizeName(s)
    if type(s) ~= "string" then return "" end
    return s:gsub("%s+", ""):gsub("[-–—]", ""):lower()
end

local function MatchBossName(a, b)
    local na, nb = NormalizeName(a), NormalizeName(b)
    if na == "" or nb == "" then return false end
    if na == nb then return true end
    if na:find(nb, 1, true) or nb:find(na, 1, true) then return true end
    return false
end

-- 通过 BigWigs 离线数据库和 EJ 中文名反查 encounterId
local function GetBigWigsEncounterId(instance, boss)
    if not addon.BigWigsIdDB or not instance or not boss then return nil end
    local GD = addon.GuideData
    local meta = GD.meta and GD.meta[instance]
    local instanceId = meta and (meta.instanceId or meta.mapID)
    if not instanceId then return nil end
    local db = addon.BigWigsIdDB[instanceId]
    if not db then return nil end

    -- 如果该副本在 BigWigs 中只有一个首领，直接返回其 encounterId
    local onlyName, onlyEid
    local count = 0
    for encName, eid in pairs(db) do
        if eid then
            count = count + 1
            onlyName, onlyEid = encName, eid
        end
    end
    if count == 1 and onlyEid then
        return tostring(onlyEid)
    end

    -- 否则尝试用 EJ 中文名匹配
    for encName, eid in pairs(db) do
        if eid and EJ_GetEncounterInfo then
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

-- 通过离线外网 fallback 数据库（NGA/wowwiki/warcraft.wiki 等）查询 encounterId
local function GetFallbackEncounterId(instance, boss)
    if not addon.FallbackIdDB or not instance or not boss then return nil end
    local data = addon.FallbackIdDB[instance]
    if not data or not data.bosses then return nil end

    -- 直接按中文首领名查找
    if data.bosses[boss] then
        return tostring(data.bosses[boss])
    end

    -- 如果只有一个首领，直接返回
    local onlyBoss, onlyEid
    local count = 0
    for bname, eid in pairs(data.bosses) do
        count = count + 1
        onlyBoss, onlyEid = bname, eid
    end
    if count == 1 and onlyEid then
        return tostring(onlyEid)
    end

    -- 模糊匹配
    for bname, eid in pairs(data.bosses) do
        if MatchBossName(boss, bname) then
            return tostring(eid)
        end
    end
    return nil
end

addon.GetBigWigsEncounterId = GetBigWigsEncounterId
addon.GetFallbackEncounterId = GetFallbackEncounterId

-- 为当前所有已激活攻略自动填充 encounterId
local function AutoFillBigWigsIds()
    ensureDBExists()
    BossTipsGlobalDB.encounterOverrides = BossTipsGlobalDB.encounterOverrides or {}
    local count = 0
    for instance, bosses in pairs(addon.ActiveGuides or {}) do
        for boss in pairs(bosses) do
            local existing = GetBossEncounterId(instance, boss)
            if not existing then
                local eid = GetBigWigsEncounterId(instance, boss)
                if eid then
                    BossTipsGlobalDB.encounterOverrides[instance] = BossTipsGlobalDB.encounterOverrides[instance] or {}
                    BossTipsGlobalDB.encounterOverrides[instance][boss] = eid
                    count = count + 1
                end
            end
        end
    end
    return count
end
addon.AutoFillBigWigsIds = AutoFillBigWigsIds

-- ============ 导入/导出（结构化格式 BT2，兼容旧版 guides-only 分享码） ============
local FIELD = "\001"
local REC = "\002"

local function B64Encode(raw)
    if not raw or raw == "" then return "" end
    if C_Base64 and C_Base64.Encode then
        local ok, res = pcall(C_Base64.Encode, raw)
        if ok and res and res ~= "" then return res end
    end
    return raw
end

local function B64Decode(b64)
    if not b64 or b64 == "" then return "" end
    if C_Base64 and C_Base64.Decode then
        local ok, res = pcall(C_Base64.Decode, b64)
        if ok and res then return res end
    end
    return b64
end

-- 旧版：仅导出 guides（兼容已有的纯 guides 分享码）
local function EncodeGuidesOnly()
    local db = BossTipsGlobalDB
    if not db.guides then return "" end
    local parts = {}
    for instance, bosses in pairs(db.guides) do
        for boss, tips in pairs(bosses) do
            local tipText = tips
            local etype = "BOSS"
            if type(tips) == "table" then tipText = tips.tips or ""; etype = tips.type or "BOSS" end
            parts[#parts + 1] = instance .. FIELD .. boss .. FIELD .. (tipText or "") .. FIELD .. etype
        end
    end
    if #parts == 0 then return "" end
    return B64Encode(table.concat(parts, REC))
end

-- 新版：导出全部用户自定义数据（WTF 覆盖层、自定义分类/副本、开关状态）。
-- 不再导出内置攻略，避免分享码过大且与插件自带数据重复。
local function EncodeGuides()
    ensureDBExists()
    local db = BossTipsGlobalDB
    local parts = {"BT2"}

    -- 开关状态（设置）
    for verId, disabled in pairs(db.disabledNative or {}) do
        if disabled then parts[#parts + 1] = "DISABLED_NATIVE" .. FIELD .. verId end
    end
    for sid, disabled in pairs(db.disabledMPlus or {}) do
        if disabled then parts[#parts + 1] = "DISABLED_MPLUS" .. FIELD .. sid end
    end
    for verId, disabled in pairs(db.disabledCustomVersions or {}) do
        if disabled then parts[#parts + 1] = "DISABLED_CUSTOM_VERSION" .. FIELD .. verId end
    end
    for inst, hidden in pairs(db.hiddenDungeons or {}) do
        if hidden then parts[#parts + 1] = "HIDDEN_DUNGEON" .. FIELD .. inst end
    end

    -- 玩家自定义攻略覆盖
    for instance, bosses in pairs(db.guides or {}) do
        for boss, tips in pairs(bosses) do
            local tipText, etype = tips, "BOSS"
            local diffParts = {}
            if type(tips) == "table" then
                tipText = tips.tips or ""
                etype = tips.type or "BOSS"
                if type(tips.tipsByDifficulty) == "table" then
                    for dk, dv in pairs(tips.tipsByDifficulty) do
                        if dv and dv ~= "" then diffParts[#diffParts + 1] = dk .. FIELD .. dv end
                    end
                end
            end
            local rec = "GUIDE" .. FIELD .. instance .. FIELD .. boss .. FIELD .. (tipText or "") .. FIELD .. etype
            if #diffParts > 0 then
                rec = rec .. FIELD .. tostring(#diffParts) .. FIELD .. table.concat(diffParts, FIELD)
            end
            parts[#parts + 1] = rec
        end
    end

    -- 自定义版本/副本/覆盖
    for verId, v in pairs(db.customVersions or {}) do
        parts[#parts + 1] = "CUSTOM_VERSION" .. FIELD .. verId .. FIELD .. (v.label or verId) .. FIELD .. tostring(tonumber(v.order) or 999)
    end
    for inst, bosses in pairs(db.encounterOverrides or {}) do
        for boss, eid in pairs(bosses) do
            parts[#parts + 1] = "ENCOUNTER_OVERRIDE" .. FIELD .. inst .. FIELD .. boss .. FIELD .. tostring(eid)
        end
    end
    for inst, d in pairs(db.dungeonOverrides or {}) do
        parts[#parts + 1] = "DUNGEON_OVERRIDE" .. FIELD .. inst .. FIELD .. (d.id or "") .. FIELD .. (d.dungeonType or "") .. FIELD .. (d.difficulty or "")
    end
    for inst, d in pairs(db.customDungeons or {}) do
        local bossParts = {}
        for boss, b in pairs(d.bosses or {}) do
            bossParts[#bossParts + 1] = (b.order or 999) .. FIELD .. (b.type or "BOSS") .. FIELD .. (b.tips or "") .. FIELD .. (b.encounterId or "") .. FIELD .. boss
        end
        parts[#parts + 1] = "CUSTOM_DUNGEON" .. FIELD .. inst .. FIELD .. (d.versionId or "") .. FIELD .. (d.id or "") .. FIELD .. (d.mapID or "") .. FIELD .. (d.dungeonType or "") .. FIELD .. (d.difficulty or "") .. FIELD .. (d.isActive ~= false and "1" or "0") .. FIELD .. table.concat(bossParts, REC)
    end

    if #parts <= 1 then return "" end
    return B64Encode(table.concat(parts, REC))
end

-- 解析旧版 guides-only 字符串
local function ParseLegacyGuides(raw)
    local result = { guides = {} }
    local records = { strsplit(REC, raw) }
    for _, rec in ipairs(records) do
        if rec and rec ~= "" then
            local instance, boss, tips, etype = strsplit(FIELD, rec)
            if instance and boss and tips then
                result.guides[instance] = result.guides[instance] or {}
                result.guides[instance][boss] = (etype == "MOB") and { tips = tips, type = "MOB" } or tips
            end
        end
    end
    return result
end

local function DecodeGuides(b64)
    if not b64 or strtrim(b64) == "" then return {} end
    local raw = B64Decode(strtrim(b64))
    if not raw or raw == "" then return {} end

    -- 新版 BT2
    if string.sub(raw, 1, 3) == "BT2" then
        local result = {
            disabledNative = {},
            disabledMPlus = {},
            disabledCustomVersions = {},
            hiddenDungeons = {},
            guides = {},
            customVersions = {},
            customDungeons = {},
            encounterOverrides = {},
            dungeonOverrides = {},
        }
        local records = { strsplit(REC, raw) }
        for _, rec in ipairs(records) do
            if rec and rec ~= "" and rec ~= "BT2" then
                local fields = { strsplit(FIELD, rec) }
                local tag = fields[1]
                if tag == "DISABLED_NATIVE" and fields[2] then
                    result.disabledNative[fields[2]] = true
                elseif tag == "DISABLED_MPLUS" and fields[2] then
                    result.disabledMPlus[fields[2]] = true
                elseif tag == "DISABLED_CUSTOM_VERSION" and fields[2] then
                    result.disabledCustomVersions[fields[2]] = true
                elseif tag == "HIDDEN_DUNGEON" and fields[2] then
                    result.hiddenDungeons[fields[2]] = true
                elseif tag == "GUIDE" and fields[2] and fields[3] and fields[4] then
                    result.guides[fields[2]] = result.guides[fields[2]] or {}
                    local etype = fields[5] or "BOSS"
                    local entry = (etype == "MOB") and { tips = fields[4], type = "MOB" } or fields[4]
                    -- 难度专属文本：GUIDE|inst|boss|tips|etype|[n]|dk|dv|...
                    local n = tonumber(fields[6])
                    if n and n > 0 then
                        if type(entry) ~= "table" then entry = { tips = fields[4], type = etype, tipsByDifficulty = {} } end
                        entry.tipsByDifficulty = entry.tipsByDifficulty or {}
                        local i = 7
                        for _ = 1, n do
                            local dk = fields[i]
                            local dv = fields[i + 1]
                            if dk and dv then entry.tipsByDifficulty[dk] = dv end
                            i = i + 2
                        end
                    end
                    result.guides[fields[2]][fields[3]] = entry
                elseif tag == "CUSTOM_VERSION" and fields[2] then
                    result.customVersions[fields[2]] = { label = fields[3] or fields[2], order = tonumber(fields[4]) or 999 }
                elseif tag == "ENCOUNTER_OVERRIDE" and fields[2] and fields[3] and fields[4] then
                    result.encounterOverrides[fields[2]] = result.encounterOverrides[fields[2]] or {}
                    result.encounterOverrides[fields[2]][fields[3]] = fields[4]
                elseif tag == "DUNGEON_OVERRIDE" and fields[2] then
                    result.dungeonOverrides[fields[2]] = {
                        id = fields[3] or "",
                        dungeonType = fields[4] or "",
                        difficulty = fields[5] or "",
                    }
                elseif tag == "CUSTOM_DUNGEON" and fields[2] and fields[3] then
                    local inst = fields[2]
                    local d = {
                        versionId = fields[3],
                        id = fields[4] or "",
                        mapID = fields[5] or "",
                        dungeonType = fields[6] or "",
                        difficulty = fields[7] or "",
                        isActive = fields[8] ~= "0",
                        bosses = {},
                    }
                    local bossStr = fields[9] or ""
                    if bossStr and bossStr ~= "" then
                        local bossRecords = { strsplit(REC, bossStr) }
                        for _, br in ipairs(bossRecords) do
                            if br and br ~= "" then
                                local bfields = { strsplit(FIELD, br) }
                                local bossName = bfields[5] or "Boss"
                                d.bosses[bossName] = {
                                    order = tonumber(bfields[1]) or 999,
                                    type = bfields[2] or "BOSS",
                                    tips = bfields[3] or "",
                                    encounterId = bfields[4] or "",
                                }
                            end
                        end
                    end
                    result.customDungeons[inst] = d
                end
            end
        end
        return result
    end

    -- 否则按旧版 guides-only 解析
    return ParseLegacyGuides(raw)
end

local function MergeImportedGuides(decoded)
    ensureDBExists()
    local db = BossTipsGlobalDB
    if type(decoded) ~= "table" then return 0 end
    local count = 0

    for verId in pairs(decoded.disabledNative or {}) do
        db.disabledNative[verId] = true
        count = count + 1
    end
    for sid in pairs(decoded.disabledMPlus or {}) do
        db.disabledMPlus[sid] = true
        count = count + 1
    end
    for verId in pairs(decoded.disabledCustomVersions or {}) do
        db.disabledCustomVersions[verId] = true
        count = count + 1
    end
    for inst in pairs(decoded.hiddenDungeons or {}) do
        db.hiddenDungeons[inst] = true
        count = count + 1
    end
    for inst, bosses in pairs(decoded.guides or {}) do
        db.guides[inst] = db.guides[inst] or {}
        for boss, tips in pairs(bosses) do
            db.guides[inst][boss] = tips
            count = count + 1
        end
    end
    for verId, v in pairs(decoded.customVersions or {}) do
        db.customVersions[verId] = CopyTable(v)
        count = count + 1
    end
    for inst, d in pairs(decoded.customDungeons or {}) do
        db.customDungeons[inst] = CopyTable(d)
        count = count + 1
    end
    for inst, bosses in pairs(decoded.encounterOverrides or {}) do
        db.encounterOverrides[inst] = db.encounterOverrides[inst] or {}
        for boss, eid in pairs(bosses) do
            db.encounterOverrides[inst][boss] = eid
            count = count + 1
        end
    end
    for inst, d in pairs(decoded.dungeonOverrides or {}) do
        db.dungeonOverrides[inst] = CopyTable(d)
        count = count + 1
    end
    return count
end

addon.EncodeGuides = EncodeGuides
addon.DecodeGuides = DecodeGuides
addon.MergeImportedGuides = MergeImportedGuides

-- ============ 列出所有副本 ============
local function CollectAllInstances()
    ensureDBExists()
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
    if GD.raids then
        for _, t in pairs(GD.raids) do
            for instance in pairs(t) do set[instance] = true end
        end
    end
    for instance in pairs(BossTipsGlobalDB.customDungeons or {}) do set[instance] = true end
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
    -- 聊天发送前预处理：技能简写转可点击法术链接、{rt1}高亮块加★、剥除其余 rt 表情
    tips = string.gsub(tips, "%[([^%]%|]+)|spell:(%d+)%]", "|Hspell:%2|h%1|h")
    tips = string.gsub(tips, "{rt1}(.-){rt1}", "★ %1")
    tips = string.gsub(tips, "{rt%d}", "")
    tips = string.gsub(tips, "%[rt%d%]", "")
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
            if BossTipsGlobalDB.closeWindowAfterSend and addon.tipsFrame and addon.tipsFrame:IsShown() then
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
