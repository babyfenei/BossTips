-- ============================================================================
-- BossTips Data.lua —— 数据层（与 Guides/*.lua 对接，契约保持不变）
-- 负责：默认配置、合并攻略表、按 || 分割发送聊天、导入导出。
-- UI 文件（Core/Window/Settings/Editor）均依赖本文件构建的 addon.ActiveGuides。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, versionInfo = {}, mplusInfo = {}, meta = {}, raids = {} }
addon.ActiveGuides = addon.ActiveGuides or {}

-- 本地化表：与 Core/Window/Editor/Settings 一致，从 addon.L 取（Locales.lua 已先加载）
local L = addon.L

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
    sendChannelRight = "SAY",
    disabledNative = {},
    disabledMPlus = {},
    disabledRaids = {},
    disabledCustomVersions = {},
    hiddenDungeons = {},
    guides = {},
    customVersions = {},
    customDungeons = {},
    customRaidVersions = {},
    customRaids = {},
    disabledCustomRaidVersions = {},
    encounterOverrides = {},
    dungeonOverrides = {},
    showMobs = false,
    -- 参考 DungeonCheatSheet 的行为设置
    autoExpandOnTarget = true,
    autoOpenOnEnter = true,
    guideWindowMode = "button", -- "auto" 进本自动展开；"button" 仅点击悬浮按钮（默认按钮模式）
    lockWindow = false,
    theme = "ace3",             -- "ace3" 半透明暗色自定义边框；"default" 暴雪对话框风格
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
    lang = "AUTO",             -- 显示语言：AUTO 跟随系统 / zhCN / zhTW / enUS
    defaultDifficulty = "mythic", -- 进本时攻略窗优先使用的难度（持久化；在攻略窗手动切换也会写回这里）。默认史诗
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
    if not BossTipsGlobalDB.customRaidVersions then BossTipsGlobalDB.customRaidVersions = {} end
    if not BossTipsGlobalDB.customRaids then BossTipsGlobalDB.customRaids = {} end
    if not BossTipsGlobalDB.disabledCustomRaidVersions then BossTipsGlobalDB.disabledCustomRaidVersions = {} end
    if not BossTipsGlobalDB.encounterOverrides then BossTipsGlobalDB.encounterOverrides = {} end
    if not BossTipsGlobalDB.dungeonOverrides then BossTipsGlobalDB.dungeonOverrides = {} end
    -- 数据库兜底完成后，按真正的 lang 重新解析 locale（Locales.lua 加载早于 Data.lua，需刷新）
    if addon.RefreshLocale then addon.RefreshLocale() end
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
-- 统一主题边框/背景：根据 theme 应用 ACE3（半透明暗色+用户颜色）或官方默认（暴雪对话框）
local function ApplyThemeToFrame(frame)
    if not frame then return end
    local theme = BossTipsGlobalDB.theme or "ace3"
    if theme == "default" then
        frame:SetBackdrop({
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true, tileSize = 32, edgeSize = 32,
            insets = { left = 8, right = 8, top = 8, bottom = 8 },
        })
        frame:SetBackdropColor(1, 1, 1, 1)
        frame:SetBackdropBorderColor(1, 1, 1, 1)
    else
        -- ACE3 主题：无边框/弱边框现代风格（与官方默认的厚重暴雪对话框形成明显区别）
        frame:SetBackdrop({
            bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
            edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
            tile = true, tileSize = 1, edgeSize = 1,
            insets = { left = 1, right = 1, top = 1, bottom = 1 },
        })
        local r, g, b, a = GetTipsBg()
        frame:SetBackdropColor(r, g, b, a)
        frame:SetBackdropBorderColor(0.15, 0.15, 0.15, 0.30)
    end
end
addon.ApplyThemeToFrame = ApplyThemeToFrame
-- 保持旧别名兼容（Window.lua/Core.lua 仍有调用）
addon.ApplyAce3Backdrop = ApplyThemeToFrame

local function RefreshAllThemes()
    if addon.tipsFrame then ApplyThemeToFrame(addon.tipsFrame) end
    if addon.mainButton then ApplyThemeToFrame(addon.mainButton) end
    local ACD = LibStub("AceConfigDialog-3.0", true)
    local openFrame = ACD and ACD.OpenFrames and ACD.OpenFrames["BossTips"]
    if openFrame and openFrame.frame then ApplyThemeToFrame(openFrame.frame) end
    if addon.editorFrame and addon.editorFrame.frame then ApplyThemeToFrame(addon.editorFrame.frame) end
end
addon.RefreshAllThemes = RefreshAllThemes
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

-- 版本显示名本地化（源文件为中文，按 locale 替换为繁中/英文）
local VERSION_LABEL_LOCALE = {
    ["zhTW"] = {
        ["1.0"] = "1.0 經典舊世",
        ["2.0"] = "2.0 燃燒的遠征",
        ["3.0"] = "3.0 巫妖王之怒",
        ["4.0"] = "4.0 大地的裂變",
        ["5.0"] = "5.0 熊貓人之謎",
        ["6.0"] = "6.0 德拉諾之王",
        ["7.0"] = "7.0 軍團再臨",
        ["8.0"] = "8.0 爭霸艾澤拉斯",
        ["9.0"] = "9.0 暗影國度",
        ["10.0"] = "10.0 巨龍時代",
        ["11.0"] = "11.0 地心之戰",
        ["12.0"] = "12.0 至暗之夜",
        ["Current"] = "大秘境（當前賽季）",
    },
    ["enUS"] = {
        ["1.0"] = "1.0 Classic",
        ["2.0"] = "2.0 The Burning Crusade",
        ["3.0"] = "3.0 Wrath of the Lich King",
        ["4.0"] = "4.0 Cataclysm",
        ["5.0"] = "5.0 Mists of Pandaria",
        ["6.0"] = "6.0 Warlords of Draenor",
        ["7.0"] = "7.0 Legion",
        ["8.0"] = "8.0 Battle for Azeroth",
        ["9.0"] = "9.0 Shadowlands",
        ["10.0"] = "10.0 Dragonflight",
        ["11.0"] = "11.0 The War Within",
        ["12.0"] = "12.0 The War Within",
        ["Current"] = "Mythic+ Current Season",
    },
}
local function LocalizeVersionLabel(id, rawLabel)
    local loc = addon.LOCALE
    local map = VERSION_LABEL_LOCALE[loc]
    if map and map[id] then return map[id] end
    -- 若 rawLabel 是中文且当前 locale 非简中，尝试用映射兜底
    if loc ~= "zhCN" and map and map[id] then return map[id] end
    return rawLabel
end
local function GetVersionLabel(id)
    ensureDBExists()
    local GD = addon.GuideData
    local i = (GD.versionInfo and GD.versionInfo[id]) or (GD.mplusInfo and GD.mplusInfo[id])
    local custom = BossTipsGlobalDB.customVersions[id]
    if custom and custom.label and custom.label ~= "" then return custom.label end
    local raw = (i and i.label) or tostring(id)
    return LocalizeVersionLabel(id, raw)
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
    local list = GetRaidOrder()
    for verId in pairs(BossTipsGlobalDB.customRaidVersions or {}) do
        local found = false
        for _, v in ipairs(list) do if v == verId then found = true; break end end
        if not found then table.insert(list, verId) end
    end
    return list
end
local function GetRaidVersionLabel(id)
    ensureDBExists()
    local custom = BossTipsGlobalDB.customRaidVersions and BossTipsGlobalDB.customRaidVersions[id]
    if custom and custom.label and custom.label ~= "" then return custom.label end
    local GD = addon.GuideData
    local i = GD.raidInfo and GD.raidInfo[id]
    if i and i.label and i.label ~= "" then return i.label end
    -- 若该版本号在 5 人本/M+ 中也有定义，复用其显示名（保持 12.0 至暗之夜 等一致）
    local verLabel = GetVersionLabel(id)
    if verLabel and verLabel ~= tostring(id) then return verLabel end
    local suffix = (addon.LOCALE == "zhTW" and " 團隊副本") or (addon.LOCALE == "enUS" and " Raid") or " 团本"
    return (id and tostring(id) .. suffix) or (addon.LOCALE == "zhTW" and "團隊副本" or addon.LOCALE == "enUS" and "Raid" or "团本")
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
    for instName, d in pairs(BossTipsGlobalDB.customRaids or {}) do
        if d.versionId == verId then
            dungeons[instName] = { isBuiltIn = false, source = "custom", data = d }
        end
    end
    return dungeons
end
local function IsRaidVersionEnabled(verId)
    ensureDBExists()
    local db = BossTipsGlobalDB
    if db.disabledRaids and db.disabledRaids[verId] then return false end
    if db.customRaidVersions and db.customRaidVersions[verId] and db.disabledCustomRaidVersions and db.disabledCustomRaidVersions[verId] then return false end
    return true
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

local function IsCurrentMPlusSeason(verId)
    if verId == "Current" then return true end
    local info = addon.GuideData.mplusInfo and addon.GuideData.mplusInfo[verId]
    return info and info.isCurrent
end

local function GetAllVersionIDs()
    ensureDBExists()
    local seen = {}
    local list = {}
    for _, vid in ipairs(GetNativeOrder()) do seen[vid] = true; list[#list + 1] = vid end
    for _, sid in ipairs(GetMPlusOrder()) do if not seen[sid] then seen[sid] = true; list[#list + 1] = sid end end
    for _, vid in ipairs(GetCustomVersionList()) do if not seen[vid] then seen[vid] = true; list[#list + 1] = vid end end
    table.sort(list, function(a, b)
        -- 当前赛季大秘境始终置顶
        local isCurrentA = IsCurrentMPlusSeason(a)
        local isCurrentB = IsCurrentMPlusSeason(b)
        if isCurrentA and not isCurrentB then return true end
        if isCurrentB and not isCurrentA then return false end
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

local function IsDungeonVersionEnabled(verId)
    ensureDBExists()
    local db = BossTipsGlobalDB
    local GD = addon.GuideData
    if GD.versions and GD.versions[verId] and db.disabledNative[verId] then return false end
    if GD.mplus and GD.mplus[verId] and db.disabledMPlus[verId] then return false end
    if db.customVersions and db.customVersions[verId] and db.disabledCustomVersions and db.disabledCustomVersions[verId] then return false end
    return true
end
addon.IsDungeonVersionEnabled = IsDungeonVersionEnabled


local function IsVersionEnabled(verId)
    -- 多命名空间共享同一版本号（如 12.0 既有 5 人本又有团本）：任一适用命名空间被禁用即视为禁用
    if not IsDungeonVersionEnabled(verId) then return false end
    if not IsRaidVersionEnabled(verId) then return false end
    return true
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
    -- 判断实例是否为团本（决定缺省难度兜底到「普通」还是「随机」）
    local function IsRaidInstance(instance)
        if not instance then return false end
        local m = GD and GD.meta and GD.meta[instance]
        if m and m.isRaid then return true end
        local cr = db.customRaids and db.customRaids[instance]
        return cr ~= nil
    end
    local function addBossEntry(copy, boss, entry, isRaid, catType, verId, instance)
        local etype = entry.type or "BOSS"
        copy[boss] = {
            order = entry.order or 999,
            type = etype,
        }
        -- 多语言攻略回指：标记来源类型/版本/副本/首领，供 GetGuideText 按当前语言取译文
        if catType then
            copy[boss]._src = { type = catType, ver = verId, instance = instance, boss = boss }
        end
        -- 翻译名：优先从分语言攻略文件取当前语言的首领/小怪显示名；缺失则回退原始 key
        local locale = addon.LOCALE or "zhCN"
        local displayName = boss
        if locale ~= "zhCN" and catType then
            local trans = GD.translations and GD.translations[locale]
            local cat = trans and trans[catType]
            local ver = cat and cat[verId]
            local inst = ver and ver[instance]
            local b = inst and inst[boss]
            if b and b.name and b.name ~= "" then
                displayName = b.name
            elseif b then
                -- 大秘境译文条目无独立 name 字段：从神话难度攻略头 {rtN}NAME{rtN} 提取本地化名
                local d = b.mythicplus or b.mythic or b.normal or b.heroic or b.lfr
                if d then
                    local nm = tostring(d):match("^{rt%d+}(.-){rt%d+}")
                    if nm and nm ~= "" then displayName = nm end
                end
            end
        end
        copy[boss].name = displayName
        -- MOB 没有难度分层，保留外层 tips
        if etype == "MOB" then
            copy[boss].tips = entry.tips or ""
            return
        end
        -- BOSS：难度键全部平级存放在 tipsByDifficulty，不再保留外层 tips。
        -- 为兼容旧版/自定义/WTF 覆盖中仍使用外层 tips 的数据，按需映射到默认难度键。
        local tips = entry.tips or ""
        local td = {}
        if type(entry.tipsByDifficulty) == "table" then
            for k, v in pairs(entry.tipsByDifficulty) do td[k] = v end
        end
        if isRaid then
            if (not td.normal or td.normal == "") and tips ~= "" then td.normal = tips end
        else
            if (not td.lfr or td.lfr == "") and tips ~= "" then td.lfr = tips end
        end
        copy[boss].tipsByDifficulty = td
    end
    local function addDungeon(instance, dungeonTbl, catType, verId)
        if db.hiddenDungeons and db.hiddenDungeons[instance] then return end
        if guides[instance] then return end
        local copy = {}
        local isRaid = IsRaidInstance(instance)
        for boss, entry in pairs(dungeonTbl) do
            addBossEntry(copy, boss, entry, isRaid, catType, verId, instance)
        end
        -- 实例级来源标记，供 GetLocalizedInstanceName 按当前 locale 取显示名
        if catType then
            copy._src = { type = catType, ver = verId, instance = instance }
        end
        guides[instance] = copy
    end

    -- 大秘境
    if GD.mplus then
        for _, sid in ipairs(GetMPlusOrder()) do
            if GD.mplus[sid] and not (db.disabledMPlus and db.disabledMPlus[sid]) then
                for instance, dungeonTbl in pairs(GD.mplus[sid]) do
                    addDungeon(instance, dungeonTbl, "mplus", sid)
                end
            end
        end
    end
    -- 原生版本
    if GD.versions then
        for _, vid in ipairs(GetNativeOrder()) do
            if GD.versions[vid] and not (db.disabledNative and db.disabledNative[vid]) then
                for instance, dungeonTbl in pairs(GD.versions[vid]) do
                    addDungeon(instance, dungeonTbl, "native", vid)
                end
            end
        end
    end
    -- 团本（独立命名空间，按版本号合并；副本名与 5 人本不冲突）
    if GD.raids then
        for _, vid in ipairs(GetRaidVersionIDs()) do
            if GD.raids[vid] and not (db.disabledRaids and db.disabledRaids[vid]) then
                for instance, dungeonTbl in pairs(GD.raids[vid]) do
                    addDungeon(instance, dungeonTbl, "raids", vid)
                end
            end
        end
    end
    -- 自定义团本
    for instance, d in pairs(db.customRaids or {}) do
        if d.isActive ~= false and not (db.hiddenDungeons and db.hiddenDungeons[instance])
           and not (db.disabledCustomRaidVersions and db.disabledCustomRaidVersions[d.versionId]) then
            if not guides[instance] then
                local copy = {}
                for boss, b in pairs(d.bosses or {}) do
                    addBossEntry(copy, boss, b, true, "customraid", d.versionId, instance)
                end
                guides[instance] = copy
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
                    addBossEntry(copy, boss, b, IsRaidInstance(instance), "customdungeon", d.versionId, instance)
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
    -- 把缺失的首领 encounterId 填回内存攻略 meta（不再写入 WTF）；EJ 未就绪时为空操作，无副作用。
    pcall(addon.AutoFillBigWigsIds)
end

local function GetBossData() return addon.ActiveGuides end
local function GetActiveGuideEntry(instance, boss)
    local g = addon.ActiveGuides
    if g and g[instance] and g[instance][boss] then return g[instance][boss] end
    return nil
end

-- 读取指定难度的攻略文本；MOB 直接返回 tips，BOSS 优先取 tipsByDifficulty[diff]，
-- 其次兼容旧外层 tips，最后按难度顺序回退到首个非空难度。
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
addon.GetTipsForDifficulty = GetTipsForDifficulty

-- 按当前语言(addon.LOCALE)读取首领/小怪攻略文本。
-- 优先从分语言攻略文件(addon.GuideData.translations[locale][type][ver][instance][boss][diff])取译文；
-- 缺失（未翻译语言/未覆盖首领）则回退 GetTipsForDifficulty（简中源）。
local function GetGuideText(entry, diff)
    if not entry then return "" end
    local locale = addon.LOCALE or "zhCN"
    if locale ~= "zhCN" then
        local trans = addon.GuideData and addon.GuideData.translations and addon.GuideData.translations[locale]
        local src = entry._src
        if trans and src then
            -- 大秘境译文按源每难度分别翻译（lfr/normal/heroic/mythic/mythicplus 五档齐全），
            -- 故按所选难度取对应译文；某难度译文缺失时回退 mythicplus（M+ 翻译主档），避免回退到简中源。
            local lookupDiff = diff
            local cat = trans[src.type]
            local ver = cat and cat[src.ver]
            local inst = ver and ver[src.instance]
            local b = inst and inst[src.boss]
            if b then
                -- 兼容旧/新两种译文存储结构：
                --   旧格式 M+（_rebuild 产物）：BOSS/MOB 均只存 mythicplus 单档；
                --   新格式（_regen_perdiff 产物）：BOSS 存 tipsByDifficulty 嵌套、MOB 存外层 tips。
                -- 因此 MOB 依次尝试 tips / 所选难度 / mythicplus / tipsByDifficulty[lookupDiff]；
                -- BOSS 依次尝试 tipsByDifficulty[lookupDiff] / tipsByDifficulty["mythicplus"] / 扁平难度键 / 外层 tips。
                local txt
                if entry.type == "MOB" then
                    txt = b.tips or b[lookupDiff] or b.mythicplus or (b.tipsByDifficulty and b.tipsByDifficulty[lookupDiff])
                else
                    local tbd = b.tipsByDifficulty
                    txt = (tbd and tbd[lookupDiff])
                        or (tbd and tbd["mythicplus"])
                        or b[lookupDiff] or b.tips
                end
                if txt and txt ~= "" then return txt end
            end
        end
    end
    return GetTipsForDifficulty(entry, diff)
end
addon.GetGuideText = GetGuideText

-- 根据当前 locale 获取首领/小怪的显示名（用于编辑器左侧树、攻略窗标题等）
-- 仅 M+ Current 与有翻译文件的团本返回译文；其余返回原名
function addon.GetLocalizedBossName(instName, bossName, isRaid, verId)
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
    -- 兼容两种译文存储：扁平难度键（旧M+）或 tipsByDifficulty 嵌套（团本/原生5人本）
    if t then
        local d = t.mythicplus or t.mythic or t.normal or t.heroic or t.lfr
        if not d then
            local td = t.tipsByDifficulty
            if td then
                d = td.mythicplus or td.mythic or td.normal or td.heroic or td.lfr
            end
        end
        if not d then
            d = t.tips
        end
        if d then
            local nm = tostring(d):match("^{rt%d+}(.-){rt%d+}")
            if nm and nm ~= "" then return nm end
        end
    end
    return bossName
end

-- 根据当前 locale 获取副本实例显示名（用于编辑器左侧树、攻略窗标题等）
-- 仅 M+ Current 与有翻译文件的团本返回译文；其余返回原名
function addon.GetLocalizedInstanceName(instName, catType, verId)
    if not instName or instName == "" then return instName end
    local trans = addon.GuideData.translations and addon.GuideData.translations[addon.LOCALE]
    if trans and catType and verId then
        local cat = trans[catType]
        local ver = cat and cat[verId]
        local inst = ver and ver[instName]
        if inst and inst.name and inst.name ~= "" then return inst.name end
    end
    return instName
end

-- 获取某个首领/小怪的 encounterId：
--   自定义副本(customDungeons/customBosses, 用户自建内容无攻略文件, 保留 WTF) >
--   内置数据(攻略文件 meta.encounterIds, 权威源) > BigWigsIdDB/FallbackIdDB(随插件发布, 非 WTF)
-- 不再依赖 WTF encounterOverrides，重置 SavedVariables 也不会丢失内置 ID。
local function GetBossEncounterId(instance, boss)
    ensureDBExists()
    local GD = addon.GuideData
    if BossTipsGlobalDB.customDungeons[instance] then
        local b = BossTipsGlobalDB.customDungeons[instance].bosses and BossTipsGlobalDB.customDungeons[instance].bosses[boss]
        if b and b.encounterId and b.encounterId ~= "" then return b.encounterId end
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
    -- 同时移除空白/连字符/中点（处理繁简译名差异，如「魔力之心」vs「玛心」分段匹配）
    return s:gsub("[%s%-–—·'’'\",.。、!！?？]", ""):lower()
end

-- 字符级 Jaccard 相似度（处理译名/繁简差异导致的字符不匹配）
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

-- 字符串分段匹配：把 a/b 按 · / - 拆成段，任意一段命中即视为匹配
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
    -- 字符级 Jaccard >= 0.55：处理译名/繁简差异
    if CharJaccard(na, nb) >= 0.55 then return true end
    -- 中点分段匹配
    if AnySegmentMatch(a, b) then return true end
    return false
end

-- 通过 BigWigs 离线数据库和 EJ 中文名反查 encounterId
local function GetBigWigsEncounterId(instance, boss)
    if not addon.BigWigsIdDB or not instance or not boss then return nil end
    local GD = addon.GuideData
    local meta = GD.meta and GD.meta[instance]
    -- 优先用 mapID 取表：BigWigsIdDB 按 journalInstanceID(=mapID) 建表；
    -- 团本 meta 无 mapID 字段，退回到 instanceId（其值即 journalInstanceID）。
    local instanceId = meta and (meta.mapID or meta.instanceId)
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

    -- 用 EJ 客户端 ID 反查（带 SelectEncounter 兜底，确保数据就绪）
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

-- 为当前所有已激活攻略自动填充缺失的 encounterId。
-- 写回「内存中的攻略 meta」(addon.GuideData.meta)，而非 WTF SavedVariables；
-- 这样智能展开/发送不再依赖 SavedVariables，重置 WTF 也不丢 ID。
-- 真正持久化由把这些 ID 烘焙进攻略文件(commit)完成。
local function AutoFillBigWigsIds()
    ensureDBExists()
    local GD = addon.GuideData
    GD.meta = GD.meta or {}
    local count = 0
    for instance, bosses in pairs(addon.ActiveGuides or {}) do
        for boss in pairs(bosses) do
            local existing = GetBossEncounterId(instance, boss)
            if not existing then
                local eid = GetBigWigsEncounterId(instance, boss)
                if eid then
                    GD.meta[instance] = GD.meta[instance] or {}
                    GD.meta[instance].encounterIds = GD.meta[instance].encounterIds or {}
                    GD.meta[instance].encounterIds[boss] = eid
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
local KV = "\003"  -- 键值对分隔：配置项 / 自定义副本 boss 内部使用，与 FIELD/REC 区分，避免层级冲突

-- 纯 Lua base64（fallback），不依赖 bit/C_Base64，保证导出码为可见 ASCII
local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local function LuaBase64Encode(data)
    if not data or data == "" then return "" end
    local out = {}
    local len = #data
    for i = 1, len, 3 do
        local a, b, c = data:byte(i, i + 2)
        local n = a * 65536 + (b or 0) * 256 + (c or 0)
        local pad = 0
        if not b then pad = 2 elseif not c then pad = 1 end
        local chars = 4 - pad
        for j = 3, 0, -1 do
            if j >= pad then
                local idx = math.floor(n / 64 ^ j) % 64 + 1
                out[#out + 1] = b64chars:sub(idx, idx)
            end
        end
        if pad == 2 then out[#out + 1] = "==" elseif pad == 1 then out[#out + 1] = "=" end
    end
    return table.concat(out)
end
local function LuaBase64Decode(data)
    if not data or data == "" then return "" end
    data = data:gsub("[^" .. b64chars .. "=]", "")
    local rev = {}
    for i = 1, 64 do rev[b64chars:sub(i, i)] = i - 1 end
    local out = {}
    local len = #data
    local pad = 0
    if data:sub(-2) == "==" then pad = 2 elseif data:sub(-1) == "=" then pad = 1 end
    for i = 1, len, 4 do
        local remaining = len - i + 1
        local groupPad = (remaining <= 4) and pad or 0
        local v = 0
        for j = 0, 3 do
            local ch = data:sub(i + j, i + j)
            local n = 0
            if ch ~= "=" then n = rev[ch] or 0 end
            v = v * 64 + n
        end
        out[#out + 1] = string.char(math.floor(v / 65536) % 256)
        if groupPad <= 1 then out[#out + 1] = string.char(math.floor(v / 256) % 256) end
        if groupPad == 0 then out[#out + 1] = string.char(v % 256) end
    end
    return table.concat(out)
end

local function B64Encode(raw)
    if not raw or raw == "" then return "" end
    -- 统一使用纯 Lua base64，避免不同客户端 C_Base64 实现不一致导致导入失败
    local ok, res = pcall(LuaBase64Encode, raw)
    if ok and res and res ~= "" then return res end
    -- 极端 fallback
    if C_Base64 and C_Base64.Encode then
        local ok2, res2 = pcall(C_Base64.Encode, raw)
        if ok2 and res2 and res2 ~= "" then return res2 end
    end
    return raw
end

local function B64Decode(b64)
    if not b64 or b64 == "" then return "" end
    local candidates = {}
    -- 优先尝试 Lua fallback（与新导出保持一致）
    local ok, res = pcall(LuaBase64Decode, b64)
    if ok and res then table.insert(candidates, res) end
    -- 兼容旧版 C_Base64 导出的码
    if C_Base64 and C_Base64.Decode then
        local ok2, res2 = pcall(C_Base64.Decode, b64)
        if ok2 and res2 then table.insert(candidates, res2) end
    end
    -- 选择看起来像有效数据的结果
    for _, raw in ipairs(candidates) do
        if raw:sub(1, 3) == "BT2" or raw:find("\001") then return raw end
    end
    return candidates[1] or b64
end

-- 需要随分享码迁移的插件配置（UI/行为设置）。enabledRaids 等开关单独用标签导出。
local CONFIG_KEYS = {
    { key = "FontSize", t = "number" },
    { key = "guideWindowMode", t = "string" },
    { key = "tipsFont", t = "string" },
    { key = "collapsedAlpha", t = "number" },
    { key = "singleExpand", t = "bool" },
    { key = "showMobs", t = "bool" },
    { key = "enableChatSend", t = "bool" },
    { key = "defaultChatChannel", t = "string" },
    { key = "sendChannelRight", t = "string" },
    { key = "theme", t = "string" },
    { key = "lockWindow", t = "bool" },
    { key = "guideWindowWidth", t = "number" },
    { key = "showMinimapButton", t = "bool" },
    { key = "minimapAngle", t = "number" },
    { key = "autoExpandOnTarget", t = "bool" },
    { key = "autoOpenOnEnter", t = "bool" },
    { key = "closeWindowAfterSend", t = "bool" },
    { key = "hideMainButtonWhenNoGuide", t = "bool" },
    { key = "tipsBgR", t = "number" },
    { key = "tipsBgG", t = "number" },
    { key = "tipsBgB", t = "number" },
    { key = "tipsBgA", t = "number" },
    { key = "bossMenuPopDirection", t = "string" },
    { key = "tipsFramePopDirection", t = "string" },
    { key = "tipsFrameAlign", t = "string" },
    -- 跨设备同步：界面语言、延展方向、难度显示开关
    { key = "lang", t = "string" },
    { key = "guideExpandDir", t = "string" },
    { key = "guideFrameTopY", t = "number" },
    { key = "guideFrameBottomY", t = "number" },
    { key = "enabledDifficulties", t = "table" },
}
local function ConfigValueToStr(v, t)
    if t == "bool" then return v and "1" or "0" end
    if t == "table" then
        -- 序列化 table 为 "k1=v1,k2=v2" 形式（用 SUB 隔开），仅支持 {string=number/bool} 简单表
        if type(v) ~= "table" then return "" end
        local pairs_ = {}
        for k, val in pairs(v) do
            pairs_[#pairs_ + 1] = tostring(k) .. "=" .. tostring(val)
        end
        return table.concat(pairs_, ",")
    end
    return tostring(v)
end
local function EncodeConfig()
    local db = BossTipsGlobalDB
    local parts = {}
    for _, ck in ipairs(CONFIG_KEYS) do
        if db[ck.key] ~= nil then
            parts[#parts + 1] = ck.key .. KV .. ConfigValueToStr(db[ck.key], ck.t)
        end
    end
    if db.mainButtonPos then
        parts[#parts + 1] = "mainButtonPos.point" .. KV .. tostring(db.mainButtonPos.point or "")
        parts[#parts + 1] = "mainButtonPos.relativePoint" .. KV .. tostring(db.mainButtonPos.relativePoint or "")
        parts[#parts + 1] = "mainButtonPos.xOffset" .. KV .. tostring(db.mainButtonPos.xOffset or 0)
        parts[#parts + 1] = "mainButtonPos.yOffset" .. KV .. tostring(db.mainButtonPos.yOffset or 0)
    end
    if db.minimap then
        parts[#parts + 1] = "minimap.hide" .. KV .. (db.minimap.hide and "1" or "0")
    end
    if #parts == 0 then return nil end
    return table.concat(parts, FIELD)
end

-- 新版：导出全部用户自定义数据（WTF 覆盖层、自定义分类/副本、开关状态、插件配置）。
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
            -- boss 内部字段用 KV(\003) 分隔，boss 之间用 REC(\002) 分隔；
            -- 这样外层按 FIELD(\001) 拆分整条记录时，bossStr 仍是一个完整字段，不会被拆散。
            bossParts[#bossParts + 1] = (b.order or 999) .. KV .. (b.type or "BOSS") .. KV .. (b.tips or "") .. KV .. (b.encounterId or "") .. KV .. boss
        end
        parts[#parts + 1] = "CUSTOM_DUNGEON" .. FIELD .. inst .. FIELD .. (d.versionId or "") .. FIELD .. (d.id or "") .. FIELD .. (d.mapID or "") .. FIELD .. (d.dungeonType or "") .. FIELD .. (d.difficulty or "") .. FIELD .. (d.isActive ~= false and "1" or "0") .. FIELD .. table.concat(bossParts, REC)
    end
    for verId, v in pairs(db.customRaidVersions or {}) do
        parts[#parts + 1] = "CUSTOM_RAID_VERSION" .. FIELD .. verId .. FIELD .. (v.label or verId) .. FIELD .. tostring(tonumber(v.order) or 999)
    end
    for inst, d in pairs(db.customRaids or {}) do
        local bossParts = {}
        for boss, b in pairs(d.bosses or {}) do
            bossParts[#bossParts + 1] = (b.order or 999) .. KV .. (b.type or "BOSS") .. KV .. (b.tips or "") .. KV .. (b.encounterId or "") .. KV .. boss
        end
        parts[#parts + 1] = "CUSTOM_RAID" .. FIELD .. inst .. FIELD .. (d.versionId or "") .. FIELD .. (d.id or "") .. FIELD .. (d.mapID or "") .. FIELD .. (d.dungeonType or "") .. FIELD .. (d.difficulty or "") .. FIELD .. (d.isActive ~= false and "1" or "0") .. FIELD .. table.concat(bossParts, REC)
    end

    -- 插件配置（UI/行为设置）：始终尝试导出，保证分享码可完整迁移观感设置
    local configStr = EncodeConfig()
    if configStr then parts[#parts + 1] = "CONFIG" .. FIELD .. configStr end

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
            disabledCustomRaidVersions = {},
            hiddenDungeons = {},
            guides = {},
            customVersions = {},
            customDungeons = {},
            customRaidVersions = {},
            customRaids = {},
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
                                local bfields = { strsplit(KV, br) }
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
                elseif tag == "CUSTOM_RAID_VERSION" and fields[2] then
                    result.customRaidVersions[fields[2]] = { label = fields[3] or fields[2], order = tonumber(fields[4]) or 999 }
                elseif tag == "CUSTOM_RAID" and fields[2] and fields[3] then
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
                                local bfields = { strsplit(KV, br) }
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
                    result.customRaids[inst] = d
                elseif tag == "CONFIG" then
                    -- 配置项以 KV(\003) 分隔的 key\003value 子串存放，外层仍按 FIELD(\001) 切分
                    result.config = result.config or {}
                    for i = 2, #fields do
                        if fields[i] and fields[i] ~= "" then
                            local kvp = { strsplit(KV, fields[i]) }
                            local ck = kvp[1]
                            local cv = kvp[2]
                            if ck and cv ~= nil then
                                result.config[ck] = cv
                            end
                        end
                    end
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
    for verId in pairs(decoded.disabledCustomRaidVersions or {}) do
        db.disabledCustomRaidVersions[verId] = true
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
    for verId, v in pairs(decoded.customRaidVersions or {}) do
        db.customRaidVersions[verId] = CopyTable(v)
        count = count + 1
    end
    for inst, d in pairs(decoded.customRaids or {}) do
        db.customRaids[inst] = CopyTable(d)
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

    -- 应用插件配置（UI/行为设置），按 CONFIG_KEYS 类型还原
    if type(decoded.config) == "table" then
        for _, ck in ipairs(CONFIG_KEYS) do
            local sval = decoded.config[ck.key]
            if sval ~= nil then
                local v
                if ck.t == "bool" then
                    v = (sval == "1")
                elseif ck.t == "number" then
                    v = tonumber(sval) or 0
                else
                    v = sval
                end
                db[ck.key] = v
                count = count + 1
            end
        end
        local mbp = decoded.config["mainButtonPos.point"]
        if mbp ~= nil then
            db.mainButtonPos = db.mainButtonPos or {}
            db.mainButtonPos.point = decoded.config["mainButtonPos.point"] or ""
            db.mainButtonPos.relativePoint = decoded.config["mainButtonPos.relativePoint"] or ""
            db.mainButtonPos.xOffset = tonumber(decoded.config["mainButtonPos.xOffset"] or 0) or 0
            db.mainButtonPos.yOffset = tonumber(decoded.config["mainButtonPos.yOffset"] or 0) or 0
            count = count + 1
        end
        local mh = decoded.config["minimap.hide"]
        if mh ~= nil then
            db.minimap = db.minimap or {}
            db.minimap.hide = (mh == "1")
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

-- ============ 聊天发送频道解析 & 技能着色 ============
-- PARTY 在 5 人以上自动转为 RAID（与游戏内行为一致）
local function ResolveSendChannel(raw)
    if not raw or raw == "" then return "INSTANCE_CHAT" end
    if raw == "PARTY" then
        local numGroup = GetNumGroupMembers() or 0
        return (numGroup > 5 and "RAID" or "PARTY")
    end
    return raw
end
addon.ResolveSendChannel = ResolveSendChannel

-- 频道中文名（用于提示/显示）
local CHANNEL_LABEL = { SAY = "说", PARTY = "队伍", RAID = "团队", INSTANCE_CHAT = "副本", YELL = "大喊", CHANNEL = "频道" }
local function ChannelLabel(ch)
    return CHANNEL_LABEL[ch] or (ch or "INSTANCE_CHAT")
end
addon.ChannelLabel = ChannelLabel

-- 聊天发送文本预处理：保留法术链接，其余转为纯文本标记，剥除 rt 表情，不再使用 |c...|r 颜色代码。
local function ColorChatTips(text)
    if not text or text == "" then return "" end

    -- 技能简写 [名称|spell:id] -> 可点击法术链接（保留可点击）
    text = string.gsub(text, "%[([^%]%|]+)|spell:(%d+)%]", "|Hspell:%2|h%1|h")

    -- {rt8} 首领名 -> 【首领名】；{rt1} 重点块 -> 【重点】...；其余 rt 表情剥除
    text = string.gsub(text, "{rt8}(.-){rt8}", "【%1】")
    text = string.gsub(text, "{rt1}(.-){rt1}", "【重点】%1")
    text = string.gsub(text, "{rt%d}", "")
    text = string.gsub(text, "%[rt%d%]", "")
    -- 注意：不再自动把自由文本「打断X」转成 [断-X]，避免把「打断/强控」等含标点的词
    -- 错套成 [断-/强控] 进而被二次包装成 [断-断-/强控]，导致聊天发送被截断/乱码。
    -- [技能名] 按类型加前缀
    text = string.gsub(text, "%[([^%]]+)%]", function(skill)
        if skill:find("打断") or skill:find("必断") or skill:find("^断") or skill:find("^速断") then
            return "[断-" .. skill .. "]"
        elseif skill:find("速杀") or skill:find("重点") or skill:find("关注") or skill:find("集火") or skill:find("优先") then
            return "[重-" .. skill .. "]"
        end
        return "[技-" .. skill .. "]"
    end)
    return text
end
addon.ColorChatTips = ColorChatTips

-- 轻量聊天行清理：保留法术链接，仅剥除 rt 表情
local function CleanChatLine(text)
    if not text or text == "" then return "" end
    -- [名称|spell:id] -> 可点击法术链接
    text = string.gsub(text, "%[([^%]%|]+)|spell:(%d+)%]", "|Hspell:%2|h%1|h")
    -- 剥除 rt 表情
    text = string.gsub(text, "{rt%d}", "")
    text = string.gsub(text, "%[rt%d%]", "")
    return strtrim(text)
end
addon.CleanChatLine = CleanChatLine

-- 从攻略文本提取「首领关键技能/要点」列表，供类 BigWigs 式逐条发送。
-- 规则：按 || 分段；每段内提取 {rt1}重点块、[技能名]（含 spell 链接）；
--       若剩余文本含打断/必断/速杀等关键词，也作为补充要点；
--       同一段内的多个技能/要点合并成一行（与 BigWigs 一致）。
-- ============ 攻略发送（按 || 分割，约 240 字/条发送） ============

-- 攻略发送：首条同步立即发出（点击即有反馈，与旧版一致），后续分条用 C_Timer 间隔发送，
-- 规避 WoW 聊天限流。所有分条已按 UTF-8 字节切分（≤ MAX_CHAT_BYTES），不会触发
-- 「Chat message limits exceeded」。pcall 包裹单条发送，单条异常不影响其余分条与完成提示。

-- 按字节切分 UTF-8 字符串，确保每块不超过 maxBytes 且不截断多字节字符。
-- SendChatMessage 的 255 字节限制按 UTF-8 字节计算，中文攻略必须按字节而非字符数切分。
local function SplitUtf8Bytes(text, maxBytes)
    local chunks = {}
    local current = ""
    local currentLen = 0
    for char in string.gmatch(text, "([%z\1-\127\194-\244][\128-\191]*)") do
        local charLen = string.len(char)
        if currentLen + charLen > maxBytes then
            if current ~= "" then
                chunks[#chunks + 1] = current
                current = char
                currentLen = charLen
            else
                -- 单个字符即超上限（理论上不会发生），直接成块
                chunks[#chunks + 1] = char
                current = ""
                currentLen = 0
            end
        else
            current = current .. char
            currentLen = currentLen + charLen
        end
    end
    if current ~= "" then chunks[#chunks + 1] = current end
    return chunks
end

-- 构造聊天发送分段（与显示同语言、同难度）。返回 { parts = {chat-ready 字符串}, displayName = "..." }，
-- 失败返回 nil（错误已打印）。parts 与频道无关，调用方按目标频道拼 /slash 宏文本即可。
local function BuildChatParts(bossName, channelOverride)
    if not bossName or not addon.currentInstanceName then
        print("|cFFFF0000BossTips|r: " .. (L["No Boss Selected"] or "未选中BOSS或副本信息异常"))
        return nil
    end
    local BossData = GetBossData()
    if not BossData or not BossData[addon.currentInstanceName] or not BossData[addon.currentInstanceName][bossName] then
        local disp = bossName
        local e = addon.GetActiveGuideEntry and addon.GetActiveGuideEntry(addon.currentInstanceName, bossName)
        if e and e.name then disp = e.name end
        print("|cFFFF0000BossTips|r: " .. ((L["No Guide For"] or "无 %s 的攻略信息"):format(disp)))
        return nil
    end
    local entry = BossData[addon.currentInstanceName][bossName]
    local displayName = (entry and entry.name) or bossName
    -- 按当前窗口难度发送：优先取该难度的专属攻略。
    -- 团本攻略为累计式撰写（高难度含低难度），发送所选难度即等于递进包含低难度；
    -- 大秘境只发所选难度，不叠加低难度（缺专属时回退首个非空难度，避免空发）。
    local diff = (addon.tipsFrame and addon.tipsFrame.difficulty) or "normal"
    -- 与攻略窗显示保持一致：团本没有 M+，选到 mythicplus 时回退 normal，避免取到空攻略。
    if entry and entry._src and (entry._src.type == "raids" or entry._src.type == "customraid") and diff == "mythicplus" then diff = "normal" end
    if BossTipsGlobalDB.debugSend then
        print(string.format("|cFF88CCFFBossTips[调试]|r 发送: 副本=%s 首领=%s 难度=%s 频道=%s",
            tostring(addon.currentInstanceName), tostring(bossName), tostring(diff),
            tostring(channelOverride or BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")))
    end
    local tips = GetGuideText(entry, diff)
    -- 聊天发送前预处理：保留法术链接，其余转为文本标记，剥除 rt 表情
    tips = ColorChatTips(tips)
    if not tips or tips == "" then
        print("|cFFFF0000BossTips|r: " .. ((L["No Guide For"] or "无 %s 的攻略信息"):format(displayName)))
        return nil
    end
    local MAX_CHAT_BYTES = 240  -- SendChatMessage 硬上限约 255 字节，留安全边距
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
            sortedParts = SplitUtf8Bytes(trimmedTips, MAX_CHAT_BYTES)
        end
    end
    if #sortedParts == 0 then
        print("|cFFFF0000BossTips|r: " .. (L["Guide Empty"] or "攻略内容为空"))
        return nil
    end
    -- 在第一条消息前加首领名 header（用本地化显示名；分语言独立 L key 渲染）
    local header = (L["Guide Header"] or "【%s】"):format(displayName)
    if sortedParts[1] then sortedParts[1] = header .. " " .. sortedParts[1] end
    if #sortedParts == 1 and string.find(sortedParts[1], "{rt8}.*{rt8}") then
        sortedParts[#sortedParts + 1] = strtrim(string.gsub(tips, "{rt8}.*{rt8}", ""))
        local filtered = {}
        for _, part in ipairs(sortedParts) do
            if strtrim(part) ~= "" then filtered[#filtered + 1] = part end
        end
        sortedParts = filtered
    end
    -- 最终按字节再切分：header 加入后首条可能超长，且 || 段本身也可能超过 255 字节
    local finalParts = {}
    for _, part in ipairs(sortedParts) do
        local trimmed = strtrim(part)
        if trimmed ~= "" then
            if string.len(trimmed) <= MAX_CHAT_BYTES then
                finalParts[#finalParts + 1] = trimmed
            else
                local chunks = SplitUtf8Bytes(trimmed, MAX_CHAT_BYTES)
                for _, chunk in ipairs(chunks) do
                    finalParts[#finalParts + 1] = chunk
                end
            end
        end
    end
    if #finalParts == 0 then
        print("|cFFFF0000BossTips|r: " .. (L["Guide Empty"] or "攻略内容为空"))
        return nil
    end
    return { parts = finalParts, displayName = displayName }
end
addon.BuildChatParts = BuildChatParts

-- 直接发送：点击即发、无延迟；战斗中由 InCombatLockdown 拦截（不发送，不打扰战斗）。
-- 喇叭按钮 OnClick → 此函数（见 Window.lua），脱战点击立即 SendChatMessage。
local function SendBossTips(bossName, channelOverride)
    local result = BuildChatParts(bossName, channelOverride)
    if not result then return end
    local parts, displayName = result.parts, result.displayName
    local chatType = ResolveSendChannel(channelOverride or BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
    if InCombatLockdown() then
        print(L["|cffff0000BossTips|r Cannot send message in combat."])
        return
    end
    for _, p in ipairs(parts) do
        local ok, err = pcall(SendChatMessage, p, chatType)
        if not ok then
            print("|cFFFF0000BossTips|r: " .. (L["Chat Send Failed"] or "攻略发送失败") .. "：" .. tostring(err):sub(1, 40))
        end
    end
    local sentMsg = (L["Sent Guide To"] or "已发送 %s 攻略到 %s"):format(displayName, chatType)
    print("|cFF00FF00BossTips|r: " .. sentMsg)
    if BossTipsGlobalDB.closeWindowAfterSend and addon.tipsFrame and addon.tipsFrame:IsShown() then
        addon.tipsFrame:Hide()
        addon.manuallyHidden = true
    end
end
addon.SendBossTips = SendBossTips

addon.GetTipsBg = GetTipsBg
addon.GetTipsFontPath = GetTipsFontPath
addon.ApplyThemeToFrame = ApplyThemeToFrame
