local addonName, addon = ...
addon.version = "1.3.1"

-- ========== 1.-- 核心配置与工具函数 ==========

-- 复制表的辅助函数
local function CopyTable(tbl)
    if type(tbl) ~= "table" then
        return tbl
    end
    local copy = {}
    for k, v in pairs(tbl) do
        copy[k] = CopyTable(v)
    end
    return copy
end
local DEBUG = false
local function debugPrint(...)
    if not DEBUG then return end
    local args = {...}
    local safeArgs = {}
    for i, v in ipairs(args) do
        table.insert(safeArgs, v == nil and "[NIL]" or tostring(v))
    end
    print("|cFFFF0000BossTips DEBUG|r:", unpack(safeArgs))
end

-- ========== 2. 全局状态与配置 ==========
local currentInstanceName, currentSelectedBoss, manuallyHidden = nil, nil, false
local lastAutoShownInstance = nil  -- 已自动展开过的副本，避免同副本内反复弹窗
local tipsFrame, tipsFontString, mainButton, bossMenu, settingsFrame, dungeonPicker

-- 账号通用默认配置
local defaultConfig = {
    mainButtonPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", xOffset = 20, yOffset = -50 },
    bossMenuPopDirection = "BOTTOM",
    tipsFramePopDirection = "BOTTOM",
    tipsFrameAlign = "LEFT",
    hideMainButtonWhenNoGuide = false,
    BossMenuPosition = nil,
    TipsFramePosition = nil,
    TipsFrameSize = { width = 500, height = 400 },
    FontSize = 14,
    defaultChatChannel = "YELL",  -- 默认使用大喊频道
    -- 版本/副本开关（opt-out：为空表示全部显示）
    disabledNative = {},      -- { [verId] = true } 隐藏某大版本原生副本
    disabledMPlus = {},       -- { [seasonId] = true } 隐藏某大秘境赛季
    hiddenDungeons = {},      -- { [instance] = true } 隐藏单个副本
    guides = {},              -- WTF 自定义攻略覆盖 { [instance] = { [boss] = tips } }
    showMobs = false,         -- 是否显示小怪攻略（默认不显示，仅显示首领）
    -- ========== 参考 DungeonCheatSheet 的新增设置 ==========
    autoExpandOnTarget = true,   -- 智能展开：选中首领/首领战开始时自动打开其攻略
    autoOpenOnEnter = true,      -- 进入副本时自动弹出攻略窗（参考 DCS 行为）
    lockWindow = false,         -- 锁定窗口：禁止拖动/缩放攻略框与主按钮
    tipsBgStyle = "black",      -- 兼容旧设置；新窗口使用下方 RGBA
    tipsFont = "default",       -- 攻略字体：default / damage / chat
    tipsBgR = 0.05,
    tipsBgG = 0.05,
    tipsBgB = 0.05,
    tipsBgA = 0.82,
    collapsedAlpha = 0.55,
    singleExpand = true,
    enableChatSend = true,
    guideWindowWidth = 360,
    showMinimapButton = false,  -- 显示小地图按钮
    minimapAngle = 225          -- 小地图按钮环绕角度
}

-- 初始化账号通用配置数据库
local function ensureDBExists()
    if not BossTipsGlobalDB then
        BossTipsGlobalDB = CopyTable(defaultConfig)
    else
        -- 合并新配置项
        for k, v in pairs(defaultConfig) do
            if BossTipsGlobalDB[k] == nil then
                BossTipsGlobalDB[k] = v
            end
        end
    end
end
ensureDBExists()

-- ========== 2b. 参考 DungeonCheatSheet 的辅助函数 ==========
-- 攻略框背景风格与字体路径映射
local BG_STYLES = {
    black       = { 0, 0, 0, 0.90 },
    translucent = { 0, 0, 0, 0.60 },
    navy        = { 0.08, 0.16, 0.32, 0.88 },
}
local FONT_PATHS = {
    default = (GameFontNormal and GameFontNormal:GetFont()) or STANDARD_TEXT_FONT,
    damage  = DAMAGE_TEXT_FONT,
    chat    = "Fonts\\ARHei.ttf",
}
local function GetTipsBg()
    if BossTipsGlobalDB.tipsBgR ~= nil then
        return BossTipsGlobalDB.tipsBgR, BossTipsGlobalDB.tipsBgG, BossTipsGlobalDB.tipsBgB, BossTipsGlobalDB.tipsBgA
    end
    local s = BG_STYLES[BossTipsGlobalDB.tipsBgStyle] or BG_STYLES.black
    return s[1], s[2], s[3], s[4]
end
local function GetTipsFontPath()
    return FONT_PATHS[BossTipsGlobalDB.tipsFont] or FONT_PATHS.default
end

-- 攻略字体刷新（供字体大小滑块、字体选择、外观应用共用）
local function UpdateFontSize()
    if not tipsFontString then return end
    tipsFontString:SetFont(GetTipsFontPath(), BossTipsGlobalDB.FontSize, "OUTLINE")
end

-- 选中首领并展示其攻略（首领菜单左键 / 智能展开 共用）
local function SelectBossAndShow(bossName)
    if not bossName or not currentInstanceName or not tipsFrame then return end
    local BossData = GetBossData()
    if not BossData or not BossData[currentInstanceName] or not BossData[currentInstanceName][bossName] then return end
    currentSelectedBoss = bossName
    manuallyHidden = false
    if tipsFrame.ShowInstanceGuide then
        tipsFrame:ShowInstanceGuide(currentInstanceName, bossName)
    end
end
addon.SelectBossAndShow = SelectBossAndShow

-- 智能展开：根据当前目标名 / 首领战名，自动打开匹配首领的攻略
local function SmartExpandBoss(name)
    if not BossTipsGlobalDB.autoExpandOnTarget then return end
    if manuallyHidden then return end
    if not currentInstanceName then return end
    local BossData = GetBossData()
    if not BossData or not BossData[currentInstanceName] then return end
    local bossList = BossData[currentInstanceName]
    local match = nil
    if name and name ~= "" then
        local lowerName = strlower(name)
        for bossName, _ in pairs(bossList) do
            local lowerBoss = strlower(bossName)
            if lowerBoss == lowerName
                or string.find(lowerBoss, lowerName, 1, true)
                or string.find(lowerName, lowerBoss, 1, true) then
                match = bossName
                break
            end
        end
    end
    if match then SelectBossAndShow(match) end
end

-- 应用窗口锁定状态（锁定后禁止拖动/缩放）
local function ApplyWindowLock()
    local locked = BossTipsGlobalDB.lockWindow
    if tipsFrame then
        tipsFrame:SetMovable(not locked)
        tipsFrame:SetResizable(not locked)
        if tipsFrame.UpdateLockVisual then tipsFrame:UpdateLockVisual() end
    end
    if mainButton then mainButton:SetMovable(not locked) end
    if bossMenu then bossMenu:SetMovable(not locked) end
    if dungeonPicker then dungeonPicker:SetMovable(not locked) end
end

-- 应用攻略框外观（背景风格 + 字体）
local function ApplyTipsAppearance()
    if not tipsFrame then return end
    local r, g, b, a = GetTipsBg()
    tipsFrame:SetBackdropColor(r, g, b, a)
    UpdateFontSize()
end

-- ========== 小地图按钮（原生实现，不依赖外部库） ==========
local minimapButton
local function UpdateMinimapButtonPosition()
    if not minimapButton then return end
    local angle = (BossTipsGlobalDB.minimapAngle or 225) * (math.pi / 180)
    local radius = 78
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius
    minimapButton:ClearAllPoints()
    minimapButton:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

local function CreateMinimapButton()
    local btn = CreateFrame("Button", "BossTipsMinimapButton", Minimap)
    btn:SetSize(32, 32)
    btn:SetFrameStrata("MEDIUM")
    btn:SetNormalTexture("Interface\\Icons\\INV_Scroll_03")
    btn:SetPushedTexture("Interface\\Icons\\INV_Scroll_03")
    btn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    btn:SetScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if dungeonPicker and dungeonPicker:IsShown() then dungeonPicker:Hide() else if dungeonPicker then dungeonPicker:Show() end end
        elseif button == "RightButton" then
            if settingsFrame then settingsFrame:Show() end
        end
    end)
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("BossTips")
        GameTooltip:AddLine("左键：打开副本选择（按版本）", 1, 1, 1)
        GameTooltip:AddLine("右键：打开设置", 1, 1, 1)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    -- 拖动以绕小地图环重新定位
    btn:SetMovable(true)
    btn:RegisterForDrag("LeftButton")
    btn:SetScript("OnDragStart", function() btn:SetScript("OnUpdate", function()
        local mx, my = Minimap:GetCenter()
        local px, py = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale() or 1
        px, py = px / scale, py / scale
        local ang = math.atan2(py - my, px - mx)
        BossTipsGlobalDB.minimapAngle = math.deg(ang)
        UpdateMinimapButtonPosition()
    end) end)
    btn:SetScript("OnDragStop", function() btn:SetScript("OnUpdate", nil) end)
    minimapButton = btn
    return btn
end

local function UpdateMinimapButtonVisibility()
    if not minimapButton then return end
    if BossTipsGlobalDB.showMinimapButton then
        UpdateMinimapButtonPosition()
        minimapButton:Show()
    else
        minimapButton:Hide()
    end
end

-- ========== 3. BOSS数据配置（版本化分层） ==========
-- 数据来源（由 Guides/*.lua 填充，加载顺序见 .toc：Guides 在前，本文件在后）：
--   addon.GuideData.versions[verId][instance] = { [boss] = {order, type, tips} }   -- 大版本原生副本
--   addon.GuideData.mplus[seasonId][instance] = { [boss] = {order, type, tips} }   -- 大秘境赛季池
--   addon.GuideData.versionInfo[verId]   = { label = "...", order = n }            -- 版本标签/排序（数据文件自注册）
--   addon.GuideData.mplusInfo[seasonId]  = { label = "...", order = n }            -- 赛季标签/排序（数据文件自注册）
--   addon.GuideData.meta[instance]       = { mapID, journalID, challengeID }       -- 副本编号（Blizzard DB2）
--   type = "BOSS" 表示首领，type = "MOB" 表示小怪/重点怪；两者均须显式标记。
-- 优先级（高->低）：WTF自定义(BossTipsGlobalDB.guides) > 大秘境赛季 > 大版本原生
-- 规则：
--   1) 每个大版本数据文件只收录“本版本自己”的副本；
--      副本名重复时，按版本号从低到高扫描，恒定保留首次出现的最低版本（重做/复用本不重复收录）。
--   2) 大秘境池仅保留“当前小版本”的赛季文件，历史赛季不留存。
--   3) 重名时以大秘境为准（大秘境 > 原生）；WTF 自定义攻略优先级最高。
--   4) 版本清单/标签/排序全部由数据文件自注册，本文件不含任何游戏版本号。

-- 本地安全的 tContains（不依赖全局）
local function tContains(tbl, item)
    if not tbl then return false end
    for _, v in pairs(tbl) do
        if v == item then return true end
    end
    return false
end

-- 确保命名空间存在（Guides 文件也会用 or 守卫）
addon.GuideData = addon.GuideData or {}
addon.GuideData.versions    = addon.GuideData.versions    or {}
addon.GuideData.mplus       = addon.GuideData.mplus       or {}
addon.GuideData.versionInfo = addon.GuideData.versionInfo or {}
addon.GuideData.mplusInfo   = addon.GuideData.mplusInfo   or {}
addon.GuideData.meta        = addon.GuideData.meta        or {}
addon.ActiveGuides = addon.ActiveGuides or {}

-- ---------- 版本/赛季的动态发现（本文件不含任何游戏版本号） ----------
-- 版本清单、标签、排序全部来自数据文件自注册：
--   新增一个大版本 = 新增一个 Guides 数据文件，本文件无需任何改动。
-- 把 "<主>.<次>" / "<主>" 形式的版本 ID 解析为可比较数值；非数值 ID（如赛季代号）返回 nil。
local function ParseVersionNumber(id)
    if type(id) ~= "string" then return nil end
    local maj, min = id:match("^(%d+)%.(%d+)$")
    if maj then return tonumber(maj) * 1000 + tonumber(min) end
    local only = id:match("^(%d+)$")
    if only then return tonumber(only) * 1000 end
    return nil
end

-- 升序返回 tbl 的全部 key：info.order 优先 -> 数值版本号 -> 字母序
local function BuildSortedIDs(tbl, info)
    local list = {}
    if type(tbl) ~= "table" then return list end
    for id in pairs(tbl) do table.insert(list, id) end
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

-- 原生版本顺序：低版本在前 => 同名副本天然"低版本优先"（覆盖已加载的全部版本文件）
local function GetNativeOrder()
    local GD = addon.GuideData
    return BuildSortedIDs(GD.versions, GD.versionInfo)
end

-- 大秘境赛季顺序
local function GetMPlusOrder()
    local GD = addon.GuideData
    return BuildSortedIDs(GD.mplus, GD.mplusInfo)
end

-- 显示标签：取数据文件自注册的 label，缺失则回退为 ID 本身
local function GetVersionLabel(id)
    local GD = addon.GuideData
    local i = (GD.versionInfo and GD.versionInfo[id]) or (GD.mplusInfo and GD.mplusInfo[id])
    return (i and i.label) or tostring(id)
end
addon.GetNativeOrder  = GetNativeOrder
addon.GetMPlusOrder   = GetMPlusOrder
addon.GetVersionLabel = GetVersionLabel

-- 合并出当前应显示的攻略表（按副本名索引）
local function BuildActiveGuides()
    local GD = addon.GuideData or { versions = {}, mplus = {} }
    local db = BossTipsGlobalDB
    local guides = {}

    local function addDungeon(instance, dungeonTbl)
        if db.hiddenDungeons and db.hiddenDungeons[instance] then return end
        if guides[instance] then return end  -- 已存在则跳过（保证 M+ > 原生 的优先级）
        local copy = {}
        for boss, entry in pairs(dungeonTbl) do
            local etype = entry.type or "BOSS"
            -- 小怪/重点怪：仅在 showMobs 开启时纳入（默认仅显示首领）
            if etype == "MOB" and not (db.showMobs) then
                -- 跳过小怪条目，不纳入激活攻略
            else
                copy[boss] = { order = entry.order, type = etype, tips = entry.tips }
            end
        end
        guides[instance] = copy
    end

    -- 1) 大秘境赛季（高优先级，赛季顺序由数据文件自注册决定）
    if GD.mplus then
        for _, sid in ipairs(GetMPlusOrder()) do
            if GD.mplus[sid] and not (db.disabledMPlus and db.disabledMPlus[sid]) then
                for instance, dungeonTbl in pairs(GD.mplus[sid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end

    -- 2) 大版本原生副本（低优先级）
    --    GetNativeOrder() 为数值升序（最低版本 -> 最高版本），逐版本扫描；
    --    addDungeon 对已存在的副本名直接跳过，因此同名副本恒定保留"首次出现的最低版本"。
    if GD.versions then
        for _, vid in ipairs(GetNativeOrder()) do
            if GD.versions[vid] and not (db.disabledNative and db.disabledNative[vid]) then
                for instance, dungeonTbl in pairs(GD.versions[vid]) do
                    addDungeon(instance, dungeonTbl)
                end
            end
        end
    end

    -- 3) WTF 自定义覆盖（最高优先级）：仅替换 tips，不影响内置结构
    if db.guides then
        for instance, bosses in pairs(db.guides) do
            if not (db.hiddenDungeons and db.hiddenDungeons[instance]) then
                if not guides[instance] then
                    guides[instance] = {}
                end
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

local function GetBossData()
    return addon.ActiveGuides
end

local function GetActiveGuideEntry(instance, boss)
    local g = addon.ActiveGuides
    if g and g[instance] and g[instance][boss] then
        return g[instance][boss]
    end
    return nil
end

-- ========== 3b. 自定义攻略 base64 导出/导入 ==========
local FIELD_SEP = "\001"
local REC_SEP = "\002"

local function EncodeGuides()
    local db = BossTipsGlobalDB
    if not db.guides then return "" end
    local parts = {}
    for instance, bosses in pairs(db.guides) do
        for boss, tips in pairs(bosses) do
            table.insert(parts, instance .. FIELD_SEP .. boss .. FIELD_SEP .. tips)
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

-- 合并导入的攻略到 WTF（导入项覆盖已有项）
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

-- 收集所有已知副本名（用于隐藏列表 / 编辑器下拉）
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
    for k in pairs(set) do table.insert(list, k) end
    table.sort(list, function(a, b) return a < b end)
    return list
end

-- ========== 4. 检查是否有当前地图攻略 ==========
local function HasCurrentMapGuide()
    local bossData = GetBossData()
    return bossData and currentInstanceName and bossData[currentInstanceName] ~= nil
end

-- ========== 5. 主按钮显示控制 ==========
local function UpdateMainButtonVisibility()
    if not mainButton then return end
    local shouldHide = not HasCurrentMapGuide() and BossTipsGlobalDB.hideMainButtonWhenNoGuide
    mainButton:SetShown(not shouldHide)
end

-- 刷新攻略表并同步主按钮可见性
local function RefreshGuides()
    BuildActiveGuides()
    UpdateMainButtonVisibility()
end

-- ========== 6. 攻略发送功能 ==========
local function SendBossTips(bossName)
    if not bossName or not currentInstanceName then
        print("|cFFFF0000BossTips|r: 未选中BOSS或副本信息异常")
        return
    end
    
    local BossData = GetBossData()
    if not BossData or not BossData[currentInstanceName] or not BossData[currentInstanceName][bossName] then
        print("|cFFFF0000BossTips|r: 无", bossName, "的攻略信息（请检查BossData.lua）")
        return
    end
    
    local tips = BossData[currentInstanceName][bossName].tips
    if not tips then
        print("|cFFFF0000BossTips|r: 无", bossName, "的攻略信息")
        return
    end
    
    -- 魔兽世界频道最大字符串长度限制（大约）
    local MAX_CHAT_LENGTH = 240
    
    local parts = {strsplit("||", tips)}
    local sortedParts = {}
    
    -- 检查是否有||分割符
    local hasSeparator = false
    for _, part in ipairs(parts) do
        local trimmed = strtrim(part)
        if trimmed ~= "" then
            table.insert(sortedParts, trimmed)
            hasSeparator = true
        end
    end
    
    -- 如果没有||分割符，根据长度自动分割
    if not hasSeparator then
        local trimmedTips = strtrim(tips)
        if trimmedTips ~= "" then
            sortedParts = {}
            local currentPart = ""
            
            -- 按空格分割文本，构建符合长度限制的段落
            local words = {strsplit(" ", trimmedTips)}
            for _, word in ipairs(words) do
                -- 检查添加当前单词后是否超过长度限制
                if string.len(currentPart) + string.len(word) + 1 <= MAX_CHAT_LENGTH then
                    if currentPart ~= "" then
                        currentPart = currentPart .. " " .. word
                    else
                        currentPart = word
                    end
                else
                    -- 超过长度限制，保存当前段落并开始新段落
                    if currentPart ~= "" then
                        table.insert(sortedParts, currentPart)
                    end
                    currentPart = word
                end
            end
            
            -- 保存最后一个段落
            if currentPart ~= "" then
                table.insert(sortedParts, currentPart)
            end
        end
    end
    
    if #sortedParts == 0 then
        print("|cFFFF0000BossTips|r: 攻略内容为空")
        return
    end
    
    -- 确保至少发送一条攻略内容
    if #sortedParts == 1 and string.find(sortedParts[1], "{rt8}.*{rt8}") then
        -- 如果只有BOSS名称，尝试发送整个tips
        table.insert(sortedParts, strtrim(string.gsub(tips, "{rt8}.*{rt8}", "")))
        -- 移除空的部分
        local filteredParts = {}
        for _, part in ipairs(sortedParts) do
            if strtrim(part) ~= "" then
                table.insert(filteredParts, part)
            end
        end
        sortedParts = filteredParts
    end
    
    -- 根据配置选择聊天频道
    local chatType = BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT"
    
    -- 如果选择了"队伍频道"，根据团队人数自动判断
    if chatType == "PARTY" then
        local numGroup = GetNumGroupMembers() or 0
        if numGroup > 5 then
            chatType = "RAID"
        else
            chatType = "PARTY"
        end
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
            if tipsFrame and tipsFrame:IsShown() then
                tipsFrame:Hide()
                manuallyHidden = true
            end
        end
    end
    sendNext()
end

-- ========== 6. BOSS弹出框体（核心修改：按钮左右键区分） ==========
local function CreateBossMenu()
    local menuFrame = CreateFrame("Frame", "BossTipsSimpleMenu", UIParent, "BackdropTemplate")
    menuFrame:SetSize(200, 30)
    menuFrame:SetFrameStrata("HIGH")
    menuFrame:SetFrameLevel(200)
    menuFrame:SetClampedToScreen(true)
    menuFrame:EnableMouse(true)
    menuFrame:RegisterForDrag("LeftButton")
    menuFrame:Hide()
    
    menuFrame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 12, right = 12, top = 12, bottom = 12 }
    })
    menuFrame:SetBackdropColor(0, 0, 0, 0.9)
    
    local titleBar = CreateFrame("Frame", nil, menuFrame)
    titleBar:SetSize(menuFrame:GetWidth() - 24, 30)
    titleBar:SetPoint("TOP", 0, -6)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function(self)
        if BossTipsGlobalDB.lockWindow then return end
        self:GetParent():StartMoving()
    end)
    titleBar:SetScript("OnDragStop", function(self)
        self:GetParent():StopMovingOrSizing()
    end)
    
    local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    titleText:SetPoint("CENTER", titleBar, "CENTER")
    titleText:SetText("选择BOSS")
    titleText:SetTextColor(1, 0.8, 0)
    
    local buttonContainer = CreateFrame("Frame", nil, menuFrame)
    buttonContainer:SetSize(menuFrame:GetWidth() - 24, 0)
    buttonContainer:SetPoint("TOPLEFT", 12, -42)
    buttonContainer.buttons = {}
    
    menuFrame.ShowBossMenu = function(self)
        for i = 1, #buttonContainer.buttons do
            if buttonContainer.buttons[i] and buttonContainer.buttons[i].Hide then
                buttonContainer.buttons[i]:Hide()
            end
        end
        buttonContainer.buttons = {}
        
        titleText:SetText(currentInstanceName or "选择BOSS")
        
        local BossData = GetBossData()
        if not BossData or not currentInstanceName or not BossData[currentInstanceName] then
            local noDataText = buttonContainer:CreateFontString(nil, "OVERLAY", "GameFontNormal")
            noDataText:SetPoint("CENTER")
            noDataText:SetText("无BOSS数据")
            noDataText:SetTextColor(1, 0, 0)
            table.insert(buttonContainer.buttons, noDataText)
            self:Show()
            return
        end
        
        local bossList = BossData[currentInstanceName]
        
        -- 获取有序的BOSS名称列表
        local orderedBossNames = {}
        
        -- 检查每个BOSS是否有order属性
        local bossWithOrder = {}
        local bossWithoutOrder = {}
        
        for bossName, bossInfo in pairs(bossList) do
            if bossInfo.order then
                -- 有order属性的BOSS
                table.insert(bossWithOrder, {name = bossName, order = bossInfo.order})
            else
                -- 没有order属性的BOSS
                table.insert(bossWithoutOrder, bossName)
            end
        end
        
        -- 按照order属性排序
        table.sort(bossWithOrder, function(a, b)
            return tonumber(a.order) < tonumber(b.order)
        end)
        
        -- 先添加有order属性的BOSS
        for _, boss in ipairs(bossWithOrder) do
            table.insert(orderedBossNames, boss.name)
        end
        
        -- 再添加没有order属性的BOSS
        for _, bossName in ipairs(bossWithoutOrder) do
            table.insert(orderedBossNames, bossName)
        end
        
        local btnCount = #orderedBossNames
        local btnHeight = 25
        local btnSpacing = 8
        local totalBtnHeight = btnCount * (btnHeight + btnSpacing) - btnSpacing
        local containerHeight = totalBtnHeight
        local menuHeight = 30 + 20 + containerHeight + 20
        
        self:SetSize(200, menuHeight)
        buttonContainer:SetSize(176, containerHeight)
        titleBar:SetWidth(176)
        
        local yOffset = 0
        for _, bossName in ipairs(orderedBossNames) do
            local bossInfo = bossList[bossName]
            local btn = CreateFrame("Button", nil, buttonContainer, "UIPanelButtonTemplate")
            btn:SetSize(176, btnHeight)
            btn:SetPoint("TOPLEFT", 0, -yOffset)
            btn:SetText(bossName)
            btn:GetFontString():SetTextColor(1, 0.8, 0)
            
            -- 确保按钮能够响应右键点击
            btn:EnableMouse(true)
            btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            
            -- 核心修改：区分左键/右键点击
            btn:SetScript("OnClick", function(self, button)
                currentSelectedBoss = bossName
                if button == "LeftButton" then
                    SelectBossAndShow(bossName)
                    menuFrame:Hide()
                elseif button == "RightButton" then
                    -- 右键：直接发送攻略到聊天频道
                    SendBossTips(bossName)
                    menuFrame:Hide()
                end
            end)
            
            btn:Show()
            table.insert(buttonContainer.buttons, btn)
            yOffset = yOffset + btnHeight + btnSpacing
        end
        
        if BossTipsGlobalDB.BossMenuPosition and BossTipsGlobalDB.BossMenuPosition.point then
            self:ClearAllPoints()
            self:SetPoint(
                BossTipsGlobalDB.BossMenuPosition.point,
                UIParent,
                BossTipsGlobalDB.BossMenuPosition.relativePoint,
                BossTipsGlobalDB.BossMenuPosition.xOffset,
                BossTipsGlobalDB.BossMenuPosition.yOffset
            )
        else
            self:ClearAllPoints()
            local dir = BossTipsGlobalDB.bossMenuPopDirection
            if dir == "TOP" then
                self:SetPoint("BOTTOMLEFT", mainButton, "TOPLEFT", 0, 5)
            elseif dir == "BOTTOM" then
                self:SetPoint("TOPLEFT", mainButton, "BOTTOMLEFT", 0, -5)
            elseif dir == "LEFT" then
                self:SetPoint("TOPRIGHT", mainButton, "TOPLEFT", -5, 0)
            elseif dir == "RIGHT" then
                self:SetPoint("TOPLEFT", mainButton, "TOPRIGHT", 5, 0)
            end
        end
        self:Show()
    end
    
    menuFrame:SetScript("OnDragStart", function(self)
        if BossTipsGlobalDB.lockWindow then return end
        self:StartMoving()
    end)
    menuFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relativePoint, xOffset, yOffset = self:GetPoint()
        BossTipsGlobalDB.BossMenuPosition = {
            point = point,
            relativePoint = relativePoint,
            xOffset = xOffset,
            yOffset = yOffset
        }
    end)
    
    local closeOnClick = CreateFrame("Frame")
    closeOnClick:RegisterEvent("GLOBAL_MOUSE_DOWN")
    closeOnClick:SetScript("OnEvent", function(_, _, button)
        if not menuFrame:IsShown() then return end
        
        local mouseX, mouseY = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale() or 1
        mouseX = mouseX / scale
        mouseY = mouseY / scale
        
        local menuX = menuFrame:GetLeft() or 0
        local menuY = menuFrame:GetBottom() or 0
        local menuWidth = menuFrame:GetWidth() or 0
        local menuHeight = menuFrame:GetHeight() or 0
        
        local mainBtnX1, mainBtnY1, mainBtnX2, mainBtnY2 = 0, 0, 0, 0
        if mainButton then
            mainBtnX1 = mainButton:GetLeft() or 0
            mainBtnY1 = mainButton:GetBottom() or 0
            mainBtnX2 = mainButton:GetRight() or 0
            mainBtnY2 = mainButton:GetTop() or 0
        end
        
        local inMenu = (mouseX >= menuX and mouseX <= menuX + menuWidth) and 
                      (mouseY >= menuY and mouseY <= menuY + menuHeight)
        local inMainBtn = (mouseX >= mainBtnX1 and mouseX <= mainBtnX2) and 
                         (mouseY >= mainBtnY1 and mouseY <= mainBtnY2)
        
        if button == "LeftButton" and not inMenu and not inMainBtn then
            menuFrame:Hide()
        end
    end)
    
    return menuFrame
end

-- ========== 7. DungeonCheatSheet 风格的副本总览攻略窗口（旧 CreateLegacyTipsFrame 实现已移除） ==========
local function CreateTipsFrame()
    local frame = CreateFrame("Frame", "BossTipsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(BossTipsGlobalDB.guideWindowWidth or 360, 200)
    frame:SetPoint("RIGHT", UIParent, "RIGHT", -120, 0)
    frame:SetFrameStrata("HIGH")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:SetResizeBounds(260, 80, 700, 900)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:Hide()
    frame:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })

    frame.titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    frame.titleText:SetPoint("TOP", 0, -10)
    frame.titleText:SetJustifyH("CENTER")

    local rows = {}
    frame.rows = rows
    frame.isGuideHidden = false

    local resizeHandle = CreateFrame("Button", nil, frame)
    resizeHandle:SetSize(16, 16)
    resizeHandle:SetPoint("BOTTOMRIGHT", 0, 0)
    resizeHandle:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeHandle:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeHandle:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    resizeHandle:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" and not BossTipsGlobalDB.lockWindow then frame:StartSizing("BOTTOMRIGHT") end
    end)
    resizeHandle:SetScript("OnMouseUp", function()
        frame:StopMovingOrSizing()
        BossTipsGlobalDB.guideWindowWidth = math.floor(frame:GetWidth())
    end)
    frame.resizeHandle = resizeHandle

    local lockBtn = CreateFrame("Button", nil, frame)
    lockBtn:SetSize(16, 16)
    lockBtn:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -18, 1)
    lockBtn:Hide()
    local lockTex = lockBtn:CreateTexture(nil, "ARTWORK")
    lockTex:SetAllPoints()
    lockTex:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-LOCK")
    lockBtn.icon = lockTex
    frame.lockBtn = lockBtn

    local function UpdateLockVisual()
        local locked = BossTipsGlobalDB.lockWindow
        lockTex:SetVertexColor(locked and 1 or 0.5, locked and 0.8 or 1, locked and 0 or 0.5, 1)
        lockTex:SetDesaturated(not locked)
        lockTex:SetAlpha(0.75)
        resizeHandle:SetShown(not locked)
        frame:SetMovable(not locked)
        frame:SetResizable(not locked)
    end
    frame.UpdateLockVisual = UpdateLockVisual

    lockBtn:SetScript("OnEnter", function(self) self.icon:SetAlpha(1) end)
    lockBtn:SetScript("OnLeave", function(self) self.icon:SetAlpha(0.75) end)
    lockBtn:SetScript("OnClick", function()
        BossTipsGlobalDB.lockWindow = not BossTipsGlobalDB.lockWindow
        ApplyWindowLock()
        UpdateLockVisual()
    end)

    local hoverWatcher = CreateFrame("Frame", nil, frame)
    hoverWatcher:Hide()
    hoverWatcher:SetScript("OnUpdate", function(self, elapsed)
        self.timer = (self.timer or 0) + elapsed
        if self.timer < 0.1 then return end
        self.timer = 0
        if frame:IsShown() and frame:IsMouseOver() then
            if not lockBtn:IsShown() then UpdateLockVisual(); lockBtn:Show() end
        elseif lockBtn:IsShown() and not lockBtn:IsMouseOver() then
            lockBtn:Hide()
        end
    end)
    frame:HookScript("OnShow", function() hoverWatcher:Show() end)
    frame:HookScript("OnHide", function() hoverWatcher:Hide() end)

    local toggleGuideBtn = CreateFrame("Button", nil, frame)
    toggleGuideBtn:SetSize(90, 20)
    toggleGuideBtn:SetNormalFontObject("GameFontDisable")
    toggleGuideBtn:SetHighlightFontObject("GameFontHighlight")
    frame.toggleGuideBtn = toggleGuideBtn

    local function CleanTips(text)
        text = text or "无攻略信息"
        text = string.gsub(text, "{[^}]*}", "")
        text = string.gsub(text, "||", "\n")
        return strtrim(text)
    end

    local function UpdateLayout()
        local left, top = frame:GetLeft(), frame:GetTop()
        if left and top then
            frame:ClearAllPoints()
            frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
        end
        local r, g, b, a = GetTipsBg()
        frame:SetBackdropColor(r, g, b, a)
        local width = frame:GetWidth()
        frame.titleText:SetWidth(width - 20)
        local currentY = -40

        if frame.isGuideHidden then
            for _, row in ipairs(rows) do row:Hide() end
            toggleGuideBtn:SetText("展开攻略")
            toggleGuideBtn:ClearAllPoints()
            toggleGuideBtn:SetPoint("TOP", frame.titleText, "BOTTOM", 0, -5)
            frame:SetHeight(65)
            return
        end

        toggleGuideBtn:SetText("隐藏攻略")
        for _, row in ipairs(rows) do
            if row.inUse then
                row:Show()
                row:ClearAllPoints()
                row:SetPoint("TOPLEFT", 10, currentY)
                row:SetWidth(width - 20)
                row.titleBtn:GetFontString():SetFont(GetTipsFontPath(), BossTipsGlobalDB.FontSize + 2, "OUTLINE")
                row.noteText:SetFont(GetTipsFontPath(), BossTipsGlobalDB.FontSize, "")
                row.noteText:SetWidth(width - 40)
                if row.isExpanded then
                    row:SetAlpha(1)
                    if BossTipsGlobalDB.enableChatSend then
                        row.speakerBtn:Show()
                        row.speakerBtn:ClearAllPoints()
                        row.speakerBtn:SetPoint("TOPLEFT", row.titleBtn, "BOTTOMLEFT", 10, -5)
                        row.noteText:ClearAllPoints()
                        row.noteText:SetPoint("TOPLEFT", row.speakerBtn, "TOPRIGHT", 4, 0)
                        row.noteText:SetPoint("TOPRIGHT", row.titleBtn, "BOTTOMRIGHT", -10, -5)
                        row.noteText:SetWidth(width - 64)
                    else
                        row.speakerBtn:Hide()
                        row.noteText:ClearAllPoints()
                        row.noteText:SetPoint("TOPLEFT", row.titleBtn, "BOTTOMLEFT", 10, -5)
                        row.noteText:SetPoint("TOPRIGHT", row.titleBtn, "BOTTOMRIGHT", -10, -5)
                    end
                    row.noteText:SetText(row.cleanTips)
                    row.noteText:Show()
                    local textHeight = math.max(row.noteText:GetStringHeight(), 16)
                    row:SetHeight(30 + textHeight + 10)
                else
                    row:SetAlpha(BossTipsGlobalDB.collapsedAlpha or 0.55)
                    row.speakerBtn:Hide()
                    row.noteText:Hide()
                    row:SetHeight(30)
                end
                currentY = currentY - row:GetHeight() - 5
            else
                row:Hide()
            end
        end
        toggleGuideBtn:ClearAllPoints()
        toggleGuideBtn:SetPoint("TOP", frame, "TOP", 0, currentY)
        frame:SetHeight(math.abs(currentY) + 25)
    end
    frame.UpdateLayout = UpdateLayout

    toggleGuideBtn:SetScript("OnClick", function()
        frame.isGuideHidden = not frame.isGuideHidden
        UpdateLayout()
    end)

    frame:SetScript("OnDragStart", function(self)
        if not BossTipsGlobalDB.lockWindow then self:StartMoving() end
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relativePoint, xOffset, yOffset = self:GetPoint()
        BossTipsGlobalDB.TipsFramePosition = { point = point, relativePoint = relativePoint, xOffset = xOffset, yOffset = yOffset }
    end)
    frame:SetScript("OnSizeChanged", function(self, width)
        if self.lastWidth ~= width then
            self.lastWidth = width
            C_Timer.After(0, function() if frame:IsShown() then UpdateLayout() end end)
        end
    end)

    function frame:ShowInstanceGuide(instanceName, expandBoss)
        local BossData = GetBossData()
        local bossList = BossData and BossData[instanceName]
        if not bossList then return end
        self.isGuideHidden = false
        self:SetWidth(BossTipsGlobalDB.guideWindowWidth or 360)
        if BossTipsGlobalDB.TipsFramePosition and BossTipsGlobalDB.TipsFramePosition.point then
            self:ClearAllPoints()
            self:SetPoint(BossTipsGlobalDB.TipsFramePosition.point, UIParent, BossTipsGlobalDB.TipsFramePosition.relativePoint, BossTipsGlobalDB.TipsFramePosition.xOffset, BossTipsGlobalDB.TipsFramePosition.yOffset)
        end
        self.titleText:SetText(instanceName)
        for _, row in ipairs(rows) do row.inUse = false end
        local ordered = {}
        for bossName, bossInfo in pairs(bossList) do
            table.insert(ordered, { name = bossName, info = bossInfo })
        end
        table.sort(ordered, function(x, y)
            local xo, yo = tonumber(x.info.order) or 999, tonumber(y.info.order) or 999
            if xo == yo then return x.name < y.name end
            return xo < yo
        end)
        for i, data in ipairs(ordered) do
            local row = rows[i]
            if not row then
                row = CreateFrame("Frame", nil, self)
                local btn = CreateFrame("Button", nil, row)
                btn:SetPoint("TOPLEFT")
                btn:SetPoint("TOPRIGHT")
                btn:SetHeight(30)
                btn:SetNormalFontObject("GameFontNormal")
                btn:GetFontString():SetPoint("LEFT", 5, 0)
                row.titleBtn = btn
                local speaker = CreateFrame("Button", nil, row)
                speaker:SetSize(24, 24)
                speaker:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Up")
                speaker:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Down")
                speaker:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
                row.speakerBtn = speaker
                local note = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                note:SetJustifyH("LEFT")
                note:SetJustifyV("TOP")
                note:SetWordWrap(true)
                row.noteText = note
                rows[i] = row
            end
            row.inUse = true
            row.bossName = data.name
            row.cleanTips = CleanTips(data.info.tips)
            row.isExpanded = expandBoss and data.name == expandBoss or (not expandBoss and i == 1)
            row.titleBtn:SetText((row.isExpanded and "- " or "> ") .. data.name)
            row.titleBtn:SetScript("OnClick", function()
                local wasExpanded = row.isExpanded
                if BossTipsGlobalDB.singleExpand then
                    for _, other in ipairs(rows) do
                        other.isExpanded = false
                        if other.inUse then other.titleBtn:SetText("> " .. other.bossName) end
                    end
                end
                row.isExpanded = not wasExpanded
                row.titleBtn:SetText((row.isExpanded and "- " or "> ") .. row.bossName)
                currentSelectedBoss = row.bossName
                UpdateLayout()
            end)
            row.speakerBtn:SetScript("OnClick", function()
                if InCombatLockdown() then
                    print("|cFFFF0000BossTips|r: 战斗中无法发送攻略")
                    return
                end
                currentSelectedBoss = row.bossName
                SendBossTips(row.bossName)
            end)
        end
        self:Show()
        UpdateLayout()
        UpdateLockVisual()
    end

    return frame
end


-- ========== 8. DungeonCheatSheet 风格双标签设置窗口 ==========
local function CreateSettingsFrame()
    local frame = CreateFrame("Frame", "BossTipsSettingsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(680, 610)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 24,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    frame:SetBackdropColor(0.04, 0.04, 0.04, 0.96)
    frame:Hide()
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 22, -18)
    title:SetText("BossTips")
    local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -5, -5)

    local settingsTab = CreateFrame("Button", nil, frame, "PanelTabButtonTemplate")
    settingsTab:SetID(1)
    settingsTab:SetText("设置")
    settingsTab:SetPoint("TOPLEFT", 18, -48)
    PanelTemplates_TabResize(settingsTab, 12)
    local configTab = CreateFrame("Button", nil, frame, "PanelTabButtonTemplate")
    configTab:SetID(2)
    configTab:SetText("攻略配置")
    configTab:SetPoint("LEFT", settingsTab, "RIGHT", -8, 0)
    PanelTemplates_TabResize(configTab, 12)
    PanelTemplates_SetNumTabs(frame, 2)

    local content = CreateFrame("Frame", nil, frame, "BackdropTemplate")
    content:SetPoint("TOPLEFT", 16, -76)
    content:SetPoint("BOTTOMRIGHT", -16, 16)
    content:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 12 })
    content:SetBackdropColor(0.07, 0.07, 0.07, 0.9)
    content:SetBackdropBorderColor(0.35, 0.35, 0.35, 0.8)

    local settingsPage = CreateFrame("Frame", nil, content)
    settingsPage:SetAllPoints()
    local configPage = CreateFrame("Frame", nil, content)
    configPage:SetAllPoints()

    local function Section(parent, text, y, height)
        local box = CreateFrame("Frame", nil, parent, "BackdropTemplate")
        box:SetPoint("TOPLEFT", 14, y)
        box:SetPoint("TOPRIGHT", -14, y)
        box:SetHeight(height)
        box:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 10 })
        box:SetBackdropColor(0.10, 0.10, 0.10, 0.75)
        box:SetBackdropBorderColor(0.3, 0.3, 0.3, 0.8)
        local label = box:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        label:SetPoint("TOPLEFT", 10, -8)
        label:SetText(text)
        label:SetTextColor(1, 0.82, 0)
        return box
    end

    local quick = Section(settingsPage, "快捷操作", -14, 66)
    local manage = CreateFrame("Button", nil, quick, "UIPanelButtonTemplate")
    manage:SetSize(220, 26)
    manage:SetPoint("TOPLEFT", 12, -28)
    manage:SetText("打开副本与攻略编辑器")
    manage:SetScript("OnClick", function()
        frame:Hide()
        if addon.guideManagerFrame then addon.guideManagerFrame:Show() end
    end)
    local quickHelp = quick:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    quickHelp:SetPoint("LEFT", manage, "RIGHT", 12, 0)
    quickHelp:SetText("输入 /bts 可打开此设置窗口")

    local behavior = Section(settingsPage, "行为与交互", -88, 92)
    local autoExpand = CreateFrame("CheckButton", nil, behavior, "UICheckButtonTemplate")
    autoExpand:SetPoint("TOPLEFT", 12, -28)
    local autoLabel = behavior:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    autoLabel:SetPoint("LEFT", autoExpand, "RIGHT", 6, 0)
    autoLabel:SetText("启用智能展开（根据当前目标/首领自动展开对应攻略）")
    autoExpand:SetScript("OnClick", function(self) BossTipsGlobalDB.autoExpandOnTarget = self:GetChecked() end)
    local lock = CreateFrame("CheckButton", nil, behavior, "UICheckButtonTemplate")
    lock:SetPoint("TOPLEFT", autoExpand, "BOTTOMLEFT", 0, -6)
    local lockLabel = behavior:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    lockLabel:SetPoint("LEFT", lock, "RIGHT", 6, 0)
    lockLabel:SetText("锁定窗口（防止拖动）")
    lock:SetScript("OnClick", function(self) BossTipsGlobalDB.lockWindow = self:GetChecked(); ApplyWindowLock() end)

    local chat = Section(settingsPage, "聊天输出", -188, 104)
    local enableChat = CreateFrame("CheckButton", nil, chat, "UICheckButtonTemplate")
    enableChat:SetPoint("TOPLEFT", 12, -28)
    local enableChatLabel = chat:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    enableChatLabel:SetPoint("LEFT", enableChat, "RIGHT", 6, 0)
    enableChatLabel:SetText("允许通过每条攻略旁的小喇叭发送到聊天频道（战斗中不可发送）")
    enableChat:SetScript("OnClick", function(self)
        BossTipsGlobalDB.enableChatSend = self:GetChecked()
        if tipsFrame and tipsFrame.UpdateLayout then tipsFrame:UpdateLayout() end
    end)
    local channelLabel = chat:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    channelLabel:SetPoint("TOPLEFT", 14, -66)
    channelLabel:SetText("发送到：")
    local channelDrop = CreateFrame("Frame", "BossTipsDCSChannelDropDown", chat, "UIDropDownMenuTemplate")
    channelDrop:SetPoint("LEFT", channelLabel, "RIGHT", 4, 0)
    UIDropDownMenu_SetWidth(channelDrop, 120)
    local channelNames = { SAY = "说", YELL = "大喊", PARTY = "队伍", RAID = "团队", INSTANCE_CHAT = "副本" }
    local function SetChannel(self)
        BossTipsGlobalDB.defaultChatChannel = self.value
        UIDropDownMenu_SetText(channelDrop, channelNames[self.value])
    end
    UIDropDownMenu_Initialize(channelDrop, function()
        local info = UIDropDownMenu_CreateInfo()
        for _, value in ipairs({"SAY", "YELL", "PARTY", "RAID", "INSTANCE_CHAT"}) do
            info.text = channelNames[value]; info.value = value; info.func = SetChannel; UIDropDownMenu_AddButton(info)
        end
    end)

    local appearance = Section(settingsPage, "外观与测试", -300, 212)
    local fontLabel = appearance:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fontLabel:SetPoint("TOPLEFT", 14, -32)
    fontLabel:SetText("选择字体：")
    local fontDrop = CreateFrame("Frame", "BossTipsDCSFontDropDown", appearance, "UIDropDownMenuTemplate")
    fontDrop:SetPoint("LEFT", fontLabel, "RIGHT", 4, 0)
    UIDropDownMenu_SetWidth(fontDrop, 125)
    local fontNames = { default = "系统默认（任务字体）", damage = "伤害数字", chat = "聊天框粗体" }
    local function SetFont(self)
        BossTipsGlobalDB.tipsFont = self.value
        UIDropDownMenu_SetText(fontDrop, fontNames[self.value])
        if tipsFrame and tipsFrame.UpdateLayout then tipsFrame:UpdateLayout() end
    end
    UIDropDownMenu_Initialize(fontDrop, function()
        local info = UIDropDownMenu_CreateInfo()
        for _, value in ipairs({"default", "damage", "chat"}) do
            info.text = fontNames[value]; info.value = value; info.func = SetFont; UIDropDownMenu_AddButton(info)
        end
    end)

    local function CreateSlider(name, label, x, y, minValue, maxValue, step, getter, setter)
        local text = appearance:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("TOPLEFT", x, y)
        text:SetText(label)
        local slider = CreateFrame("Slider", name, appearance, "OptionsSliderTemplate")
        slider:SetPoint("TOPLEFT", x + 100, y + 3)
        slider:SetSize(170, 18)
        slider:SetMinMaxValues(minValue, maxValue)
        slider:SetValueStep(step)
        slider:SetObeyStepOnDrag(true)
        slider:SetScript("OnValueChanged", function(_, value) setter(value) end)
        slider.getter = getter
        return slider
    end
    local fontSlider = CreateSlider("BossTipsDCSFontSize", "字体大小：", 14, -72, 10, 30, 1,
        function() return BossTipsGlobalDB.FontSize end,
        function(v) BossTipsGlobalDB.FontSize = math.floor(v + 0.5); if tipsFrame and tipsFrame.UpdateLayout then tipsFrame:UpdateLayout() end end)
    local alphaSlider = CreateSlider("BossTipsDCSCollapsedAlpha", "折叠透明度：", 330, -72, 0.1, 1, 0.05,
        function() return BossTipsGlobalDB.collapsedAlpha end,
        function(v) BossTipsGlobalDB.collapsedAlpha = v; if tipsFrame and tipsFrame.UpdateLayout then tipsFrame:UpdateLayout() end end)

    local singleExpand = CreateFrame("CheckButton", nil, appearance, "UICheckButtonTemplate")
    singleExpand:SetPoint("TOPLEFT", 14, -112)
    local singleLabel = appearance:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    singleLabel:SetPoint("LEFT", singleExpand, "RIGHT", 6, 0)
    singleLabel:SetText("同时只允许展开一个攻略条目")
    singleExpand:SetScript("OnClick", function(self) BossTipsGlobalDB.singleExpand = self:GetChecked() end)

    local minimap = CreateFrame("CheckButton", nil, appearance, "UICheckButtonTemplate")
    minimap:SetPoint("TOPLEFT", 330, -112)
    local minimapLabel = appearance:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    minimapLabel:SetPoint("LEFT", minimap, "RIGHT", 6, 0)
    minimapLabel:SetText("显示小地图按钮")
    minimap:SetScript("OnClick", function(self) BossTipsGlobalDB.showMinimapButton = self:GetChecked(); UpdateMinimapButtonVisibility() end)

    local bgLabel = appearance:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    bgLabel:SetPoint("TOPLEFT", 14, -154)
    bgLabel:SetText("背景颜色与透明度：")
    local swatch = CreateFrame("Button", nil, appearance, "BackdropTemplate")
    swatch:SetSize(70, 22)
    swatch:SetPoint("LEFT", bgLabel, "RIGHT", 8, 0)
    swatch:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 8 })
    swatch:SetScript("OnClick", function()
        local info = {
            r = BossTipsGlobalDB.tipsBgR, g = BossTipsGlobalDB.tipsBgG, b = BossTipsGlobalDB.tipsBgB,
            opacity = BossTipsGlobalDB.tipsBgA, hasOpacity = true,
            swatchFunc = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                BossTipsGlobalDB.tipsBgR, BossTipsGlobalDB.tipsBgG, BossTipsGlobalDB.tipsBgB = r, g, b
                if tipsFrame and tipsFrame.UpdateLayout then tipsFrame:UpdateLayout() end
            end,
            opacityFunc = function()
                BossTipsGlobalDB.tipsBgA = 1 - OpacitySliderFrame:GetValue()
                if tipsFrame and tipsFrame.UpdateLayout then tipsFrame:UpdateLayout() end
            end,
        }
        ColorPickerFrame:SetupColorPickerAndShow(info)
    end)

    local testBtn = CreateFrame("Button", nil, appearance, "UIPanelButtonTemplate")
    testBtn:SetSize(230, 26)
    testBtn:SetPoint("TOPLEFT", 14, -178)
    testBtn:SetText("在屏幕上显示测试窗口")
    testBtn:SetScript("OnClick", function()
        local data = GetBossData()
        if currentInstanceName and data and data[currentInstanceName] then
            tipsFrame:ShowInstanceGuide(currentInstanceName)
        else
            print("|cFFFFFF00BossTips|r: 当前区域没有攻略，请进入一个已收录副本后测试。")
        end
    end)
    local closeTest = CreateFrame("Button", nil, appearance, "UIPanelButtonTemplate")
    closeTest:SetSize(150, 26)
    closeTest:SetPoint("LEFT", testBtn, "RIGHT", 12, 0)
    closeTest:SetText("关闭测试窗口")
    closeTest:SetScript("OnClick", function() if tipsFrame then tipsFrame:Hide() end end)

    local configTitle = configPage:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    configTitle:SetPoint("TOPLEFT", 22, -22)
    configTitle:SetText("攻略配置")
    local configDesc = configPage:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    configDesc:SetPoint("TOPLEFT", configTitle, "BOTTOMLEFT", 0, -12)
    configDesc:SetWidth(560)
    configDesc:SetJustifyH("LEFT")
    configDesc:SetText("管理大版本和当前大秘境池、隐藏单个副本、显示小怪攻略，并编辑或导入导出自定义攻略。")
    local openManager = CreateFrame("Button", nil, configPage, "UIPanelButtonTemplate")
    openManager:SetSize(280, 30)
    openManager:SetPoint("TOPLEFT", configDesc, "BOTTOMLEFT", 0, -20)
    openManager:SetText("打开攻略版本 / 编辑 / 导入导出")
    openManager:SetScript("OnClick", function()
        frame:Hide()
        if addon.guideManagerFrame then addon.guideManagerFrame:Show() end
    end)
    local configNote = configPage:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    configNote:SetPoint("TOPLEFT", openManager, "BOTTOMLEFT", 0, -16)
    configNote:SetWidth(570)
    configNote:SetJustifyH("LEFT")
    configNote:SetText("说明：BossTips 使用账号级 SavedVariables，不使用 AceDB 角色配置文件；因此这里改为本插件真正需要的攻略配置入口。")

    local function SelectTab(id)
        PanelTemplates_SetTab(frame, id)
        settingsPage:SetShown(id == 1)
        configPage:SetShown(id == 2)
    end
    settingsTab:SetScript("OnClick", function() SelectTab(1) end)
    configTab:SetScript("OnClick", function() SelectTab(2) end)
    SelectTab(1)

    frame:SetScript("OnShow", function()
        autoExpand:SetChecked(BossTipsGlobalDB.autoExpandOnTarget)
        lock:SetChecked(BossTipsGlobalDB.lockWindow)
        enableChat:SetChecked(BossTipsGlobalDB.enableChatSend)
        singleExpand:SetChecked(BossTipsGlobalDB.singleExpand)
        minimap:SetChecked(BossTipsGlobalDB.showMinimapButton)
        UIDropDownMenu_SetText(channelDrop, channelNames[BossTipsGlobalDB.defaultChatChannel] or "大喊")
        UIDropDownMenu_SetText(fontDrop, fontNames[BossTipsGlobalDB.tipsFont] or fontNames.default)
        fontSlider:SetValue(BossTipsGlobalDB.FontSize or 14)
        alphaSlider:SetValue(BossTipsGlobalDB.collapsedAlpha or 0.55)
        swatch:SetBackdropColor(GetTipsBg())
    end)
    return frame
end

-- ========== 8. 界面选项面板集成 ==========
local function CreateInterfaceOptionsPanel()
    -- 创建选项面板框架
    local panel = CreateFrame("Frame", "BossTipsOptionsPanel", UIParent)
    panel.name = "BossTips"
    
    -- 标题
    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("BossTips 设置")
    
    -- 说明文字
    local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    desc:SetText("配置BOSS攻略提示插件的各项设置，修改后立即生效。")

    -- ========== 弹出方向设置区域 ==========
    local dirFrame = CreateFrame("Frame", nil, panel)
    dirFrame:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -12)
    dirFrame:SetPoint("RIGHT", panel, "RIGHT", -30, 0)
    dirFrame:SetHeight(120)
    
    -- 分隔线
    local dirLine = dirFrame:CreateTexture(nil, "BACKGROUND")
    dirLine:SetPoint("TOPLEFT", 0, 0)
    dirLine:SetPoint("RIGHT", 0, 0)
    dirLine:SetHeight(1)
    dirLine:SetColorTexture(0.5, 0.5, 0.5, 0.5)
    
    local dirTitle = dirFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    dirTitle:SetPoint("TOPLEFT", 8, -10)
    dirTitle:SetText("弹出方向设置")
    
    -- BOSS菜单弹出方向
    local bossDirLabel = dirFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    bossDirLabel:SetPoint("TOPLEFT", dirTitle, "BOTTOMLEFT", 0, -10)
    bossDirLabel:SetText("BOSS菜单弹出方向:")
    
    local bossDirDropDown = CreateFrame("Frame", "BossTipsBossDirDropDown", dirFrame, "UIDropDownMenuTemplate")
    bossDirDropDown:SetPoint("LEFT", bossDirLabel, "RIGHT", 8, 0)
    UIDropDownMenu_SetWidth(bossDirDropDown, 80)
    
    -- 使用中文显示当前值
    local dirTextMap = { TOP = "上", BOTTOM = "下", LEFT = "左", RIGHT = "右" }
    UIDropDownMenu_SetText(bossDirDropDown, dirTextMap[BossTipsGlobalDB.bossMenuPopDirection] or "下")
    
    local function SetBossDir(self)
        UIDropDownMenu_SetText(bossDirDropDown, self.text)
        BossTipsGlobalDB.bossMenuPopDirection = self.value
    end
    
    UIDropDownMenu_Initialize(bossDirDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "上"; info.value = "TOP"; info.func = SetBossDir; UIDropDownMenu_AddButton(info)
        info.text = "下"; info.value = "BOTTOM"; info.func = SetBossDir; UIDropDownMenu_AddButton(info)
        info.text = "左"; info.value = "LEFT"; info.func = SetBossDir; UIDropDownMenu_AddButton(info)
        info.text = "右"; info.value = "RIGHT"; info.func = SetBossDir; UIDropDownMenu_AddButton(info)
    end)
    
    -- 攻略框弹出方向
    local tipsDirLabel = dirFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    tipsDirLabel:SetPoint("TOPLEFT", bossDirLabel, "BOTTOMLEFT", 0, -12)
    tipsDirLabel:SetText("攻略框弹出方向:")
    
    local tipsDirDropDown = CreateFrame("Frame", "BossTipsTipsDirDropDown", dirFrame, "UIDropDownMenuTemplate")
    tipsDirDropDown:SetPoint("LEFT", tipsDirLabel, "RIGHT", 8, 0)
    UIDropDownMenu_SetWidth(tipsDirDropDown, 80)
    UIDropDownMenu_SetText(tipsDirDropDown, dirTextMap[BossTipsGlobalDB.tipsFramePopDirection] or "下")
    
    local function SetTipsDir(self)
        UIDropDownMenu_SetText(tipsDirDropDown, self.text)
        BossTipsGlobalDB.tipsFramePopDirection = self.value
    end
    
    UIDropDownMenu_Initialize(tipsDirDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "上"; info.value = "TOP"; info.func = SetTipsDir; UIDropDownMenu_AddButton(info)
        info.text = "下"; info.value = "BOTTOM"; info.func = SetTipsDir; UIDropDownMenu_AddButton(info)
        info.text = "左"; info.value = "LEFT"; info.func = SetTipsDir; UIDropDownMenu_AddButton(info)
        info.text = "右"; info.value = "RIGHT"; info.func = SetTipsDir; UIDropDownMenu_AddButton(info)
    end)
    
    -- 攻略框对齐方式
    local alignLabel = dirFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    alignLabel:SetPoint("TOPLEFT", tipsDirLabel, "BOTTOMLEFT", 0, -12)
    alignLabel:SetText("攻略框对齐方式:")
    
    local alignDropDown = CreateFrame("Frame", "BossTipsAlignDropDown", dirFrame, "UIDropDownMenuTemplate")
    alignDropDown:SetPoint("LEFT", alignLabel, "RIGHT", 8, 0)
    UIDropDownMenu_SetWidth(alignDropDown, 90)
    
    -- 使用中文显示对齐方式
    local alignTextMap = { LEFT = "左对齐", RIGHT = "右对齐" }
    UIDropDownMenu_SetText(alignDropDown, alignTextMap[BossTipsGlobalDB.tipsFrameAlign] or "左对齐")
    
    local function SetAlign(self)
        UIDropDownMenu_SetText(alignDropDown, self.text)
        BossTipsGlobalDB.tipsFrameAlign = self.value
    end
    
    UIDropDownMenu_Initialize(alignDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "左对齐"; info.value = "LEFT"; info.func = SetAlign; UIDropDownMenu_AddButton(info)
        info.text = "右对齐"; info.value = "RIGHT"; info.func = SetAlign; UIDropDownMenu_AddButton(info)
    end)

    -- ========== 功能设置区域 ==========
    local funcFrame = CreateFrame("Frame", nil, panel)
    funcFrame:SetPoint("TOPLEFT", dirFrame, "BOTTOMLEFT", 0, -8)
    funcFrame:SetPoint("RIGHT", panel, "RIGHT", -30, 0)
    funcFrame:SetHeight(100)
    
    -- 分隔线
    local funcLine = funcFrame:CreateTexture(nil, "BACKGROUND")
    funcLine:SetPoint("TOPLEFT", 0, 0)
    funcLine:SetPoint("RIGHT", 0, 0)
    funcLine:SetHeight(1)
    funcLine:SetColorTexture(0.5, 0.5, 0.5, 0.5)
    
    local funcTitle = funcFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    funcTitle:SetPoint("TOPLEFT", 8, -10)
    funcTitle:SetText("功能设置")
    
    -- 无攻略时隐藏主按钮
    local hideBtnCheck = CreateFrame("CheckButton", nil, funcFrame, "UICheckButtonTemplate")
    hideBtnCheck:SetPoint("TOPLEFT", funcTitle, "BOTTOMLEFT", 0, -10)
    hideBtnCheck:SetChecked(BossTipsGlobalDB.hideMainButtonWhenNoGuide or false)
    hideBtnCheck:SetScript("OnClick", function(self)
        BossTipsGlobalDB.hideMainButtonWhenNoGuide = self:GetChecked()
        UpdateMainButtonVisibility()
    end)
    
    local hideBtnLabel = funcFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    hideBtnLabel:SetPoint("LEFT", hideBtnCheck, "RIGHT", 8, 0)
    hideBtnLabel:SetText("无攻略时隐藏主按钮")
    
    -- 默认发送频道
    local channelLabel = funcFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    channelLabel:SetPoint("TOPLEFT", hideBtnCheck, "BOTTOMLEFT", 0, -12)
    channelLabel:SetText("默认发送频道:")
    
    local channelDropDown = CreateFrame("Frame", "BossTipsChannelDropDown", funcFrame, "UIDropDownMenuTemplate")
    channelDropDown:SetPoint("LEFT", channelLabel, "RIGHT", 8, 0)
    UIDropDownMenu_SetWidth(channelDropDown, 110)
    
    local channelNames = {
        ["INSTANCE_CHAT"] = "副本频道",
        ["SAY"] = "说频道",
        ["YELL"] = "大喊频道",
        ["PARTY"] = "队伍频道",
    }
    -- 默认改为大喊频道
    UIDropDownMenu_SetText(channelDropDown, channelNames[BossTipsGlobalDB.defaultChatChannel] or "大喊频道")
    
    local function SetChannel(self)
        UIDropDownMenu_SetText(channelDropDown, channelNames[self.value] or self.value)
        BossTipsGlobalDB.defaultChatChannel = self.value
    end
    
    UIDropDownMenu_Initialize(channelDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "副本频道"; info.value = "INSTANCE_CHAT"; info.func = SetChannel; UIDropDownMenu_AddButton(info)
        info.text = "说频道"; info.value = "SAY"; info.func = SetChannel; UIDropDownMenu_AddButton(info)
        info.text = "大喊频道"; info.value = "YELL"; info.func = SetChannel; UIDropDownMenu_AddButton(info)
        info.text = "队伍频道"; info.value = "PARTY"; info.func = SetChannel; UIDropDownMenu_AddButton(info)
    end)

    -- ========== 攻略框设置区域 ==========
    local tipsFrameSettings = CreateFrame("Frame", nil, panel)
    tipsFrameSettings:SetPoint("TOPLEFT", funcFrame, "BOTTOMLEFT", 0, -8)
    tipsFrameSettings:SetPoint("RIGHT", panel, "RIGHT", -30, 0)
    tipsFrameSettings:SetHeight(180)

    -- 分隔线
    local tipsLine = tipsFrameSettings:CreateTexture(nil, "BACKGROUND")
    tipsLine:SetPoint("TOPLEFT", 0, 0)
    tipsLine:SetPoint("RIGHT", 0, 0)
    tipsLine:SetHeight(1)
    tipsLine:SetColorTexture(0.5, 0.5, 0.5, 0.5)

    local tipsTitle = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    tipsTitle:SetPoint("TOPLEFT", 8, -10)
    tipsTitle:SetText("攻略框设置")

    -- 字体大小标签
    local fontSizeLabel = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fontSizeLabel:SetPoint("TOPLEFT", tipsTitle, "BOTTOMLEFT", 0, -12)
    fontSizeLabel:SetText("字体大小:")

    -- 字体大小滑块
    local fontSizeSlider = CreateFrame("Slider", "BossTipsFontSizeSlider", tipsFrameSettings, "OptionsSliderTemplate")
    fontSizeSlider:SetPoint("LEFT", fontSizeLabel, "RIGHT", 8, 0)
    fontSizeSlider:SetSize(150, 20)
    fontSizeSlider:SetMinMaxValues(12, 32)
    fontSizeSlider:SetValueStep(1)
    fontSizeSlider:SetObeyStepOnDrag(true)
    fontSizeSlider:SetValue(BossTipsGlobalDB.FontSize or 14)
    _G["BossTipsFontSizeSliderText"]:SetText("12-32")

    -- 字体大小数值显示
    local fontSizeValue = fontSizeSlider:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fontSizeValue:SetPoint("LEFT", fontSizeSlider, "RIGHT", 8, 0)
    fontSizeValue:SetText(tostring(BossTipsGlobalDB.FontSize or 14))

    fontSizeSlider:SetScript("OnValueChanged", function(self, value)
        local rounded = math.floor(value + 0.5)
        fontSizeValue:SetText(rounded)
        BossTipsGlobalDB.FontSize = rounded
        UpdateFontSize()
    end)

    -- 攻略字体
    local fontLabel = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fontLabel:SetPoint("TOPLEFT", fontSizeLabel, "BOTTOMLEFT", 0, -16)
    fontLabel:SetText("攻略字体:")
    local fontDropDown = CreateFrame("Frame", "BossTipsOptionsFontDropDown", tipsFrameSettings, "UIDropDownMenuTemplate")
    fontDropDown:SetPoint("LEFT", fontLabel, "RIGHT", 8, 0)
    UIDropDownMenu_SetWidth(fontDropDown, 110)
    local fontNames = { default = "系统默认", damage = "伤害数字", chat = "聊天加粗" }
    UIDropDownMenu_SetText(fontDropDown, fontNames[BossTipsGlobalDB.tipsFont] or "系统默认")
    local function SetTipsFontOpts(self)
        UIDropDownMenu_SetText(fontDropDown, fontNames[self.value])
        BossTipsGlobalDB.tipsFont = self.value
        UpdateFontSize()
    end
    UIDropDownMenu_Initialize(fontDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "系统默认"; info.value = "default"; info.func = SetTipsFontOpts; UIDropDownMenu_AddButton(info)
        info.text = "伤害数字"; info.value = "damage"; info.func = SetTipsFontOpts; UIDropDownMenu_AddButton(info)
        info.text = "聊天加粗"; info.value = "chat"; info.func = SetTipsFontOpts; UIDropDownMenu_AddButton(info)
    end)

    -- 背景风格
    local bgStyleLabel = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    bgStyleLabel:SetPoint("TOPLEFT", fontLabel, "BOTTOMLEFT", 0, -16)
    bgStyleLabel:SetText("背景风格:")
    local bgStyleDropDown = CreateFrame("Frame", "BossTipsOptionsBgStyleDropDown", tipsFrameSettings, "UIDropDownMenuTemplate")
    bgStyleDropDown:SetPoint("LEFT", bgStyleLabel, "RIGHT", 8, 0)
    UIDropDownMenu_SetWidth(bgStyleDropDown, 90)
    local styleNames = { black = "黑底", translucent = "半透明", navy = "暗蓝" }
    UIDropDownMenu_SetText(bgStyleDropDown, styleNames[BossTipsGlobalDB.tipsBgStyle] or "黑底")
    local function SetBgStyleOpts(self)
        UIDropDownMenu_SetText(bgStyleDropDown, styleNames[self.value])
        BossTipsGlobalDB.tipsBgStyle = self.value
        ApplyTipsAppearance()
    end
    UIDropDownMenu_Initialize(bgStyleDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "黑底"; info.value = "black"; info.func = SetBgStyleOpts; UIDropDownMenu_AddButton(info)
        info.text = "半透明"; info.value = "translucent"; info.func = SetBgStyleOpts; UIDropDownMenu_AddButton(info)
        info.text = "暗蓝"; info.value = "navy"; info.func = SetBgStyleOpts; UIDropDownMenu_AddButton(info)
    end)

    -- 智能展开
    local autoExpandCheck = CreateFrame("CheckButton", "BossTipsOptionsAutoExpandCheck", tipsFrameSettings, "UICheckButtonTemplate")
    autoExpandCheck:SetPoint("TOPLEFT", bgStyleLabel, "BOTTOMLEFT", 0, -12)
    autoExpandCheck:SetChecked(BossTipsGlobalDB.autoExpandOnTarget or false)
    autoExpandCheck:SetScript("OnClick", function(self)
        BossTipsGlobalDB.autoExpandOnTarget = self:GetChecked()
    end)
    local autoExpandLabel = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    autoExpandLabel:SetPoint("LEFT", autoExpandCheck, "RIGHT", 8, 0)
    autoExpandLabel:SetText("智能展开（选中首领/开战自动显示攻略）")

    -- 锁定窗口
    local lockCheck = CreateFrame("CheckButton", "BossTipsOptionsLockCheck", tipsFrameSettings, "UICheckButtonTemplate")
    lockCheck:SetPoint("TOPLEFT", autoExpandCheck, "BOTTOMLEFT", 0, -8)
    lockCheck:SetChecked(BossTipsGlobalDB.lockWindow or false)
    lockCheck:SetScript("OnClick", function(self)
        BossTipsGlobalDB.lockWindow = self:GetChecked()
        ApplyWindowLock()
    end)
    local lockLabel = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    lockLabel:SetPoint("LEFT", lockCheck, "RIGHT", 8, 0)
    lockLabel:SetText("锁定窗口（防止误拖动）")

    -- 小地图按钮
    local minimapCheck = CreateFrame("CheckButton", "BossTipsOptionsMinimapCheck", tipsFrameSettings, "UICheckButtonTemplate")
    minimapCheck:SetPoint("TOPLEFT", lockCheck, "BOTTOMLEFT", 0, -8)
    minimapCheck:SetChecked(BossTipsGlobalDB.showMinimapButton or false)
    minimapCheck:SetScript("OnClick", function(self)
        BossTipsGlobalDB.showMinimapButton = self:GetChecked()
        UpdateMinimapButtonVisibility()
    end)
    local minimapLabel = tipsFrameSettings:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    minimapLabel:SetPoint("LEFT", minimapCheck, "RIGHT", 8, 0)
    minimapLabel:SetText("显示小地图按钮")

    -- ========== 重置按钮区域 ==========
    local resetFrame = CreateFrame("Frame", nil, panel)
    resetFrame:SetPoint("TOPLEFT", tipsFrameSettings, "BOTTOMLEFT", 0, -8)
    resetFrame:SetPoint("RIGHT", panel, "RIGHT", -30, 0)
    resetFrame:SetHeight(60)
    
    -- 分隔线
    local resetLine = resetFrame:CreateTexture(nil, "BACKGROUND")
    resetLine:SetPoint("TOPLEFT", 0, 0)
    resetLine:SetPoint("RIGHT", 0, 0)
    resetLine:SetHeight(1)
    resetLine:SetColorTexture(0.5, 0.5, 0.5, 0.5)
    
    -- 重置所有设置按钮
    local resetBtn = CreateFrame("Button", nil, resetFrame, "UIPanelButtonTemplate")
    resetBtn:SetSize(140, 28)
    resetBtn:SetPoint("TOPLEFT", 8, -10)
    resetBtn:SetText("重置所有设置")
    resetBtn:GetFontString():SetTextColor(1, 0.8, 0)
    resetBtn:SetScript("OnClick", function()
        BossTipsGlobalDB = CopyTable(defaultConfig)
        -- 默认频道改为大喊频道
        BossTipsGlobalDB.defaultChatChannel = "YELL"
        
        -- 重置主按钮位置
        if mainButton then
            mainButton:ClearAllPoints()
            mainButton:SetPoint(
                BossTipsGlobalDB.mainButtonPos.point,
                UIParent,
                BossTipsGlobalDB.mainButtonPos.relativePoint,
                BossTipsGlobalDB.mainButtonPos.xOffset,
                BossTipsGlobalDB.mainButtonPos.yOffset
            )
        end
        
        -- 重置下拉菜单（使用中文）
        UIDropDownMenu_SetText(bossDirDropDown, "下")
        UIDropDownMenu_SetText(tipsDirDropDown, "下")
        UIDropDownMenu_SetText(alignDropDown, "左对齐")
        UIDropDownMenu_SetText(channelDropDown, "大喊频道")
        
        -- 重置复选框
        hideBtnCheck:SetChecked(false)
        autoExpandCheck:SetChecked(defaultConfig.autoExpandOnTarget)
        lockCheck:SetChecked(defaultConfig.lockWindow)
        minimapCheck:SetChecked(defaultConfig.showMinimapButton)

        -- 重置下拉菜单
        UIDropDownMenu_SetText(fontDropDown, fontNames[defaultConfig.tipsFont])
        UIDropDownMenu_SetText(bgStyleDropDown, styleNames[defaultConfig.tipsBgStyle])

        -- 重置字体大小
        fontSizeSlider:SetValue(defaultConfig.FontSize)
        fontSizeValue:SetText(tostring(defaultConfig.FontSize))
        UpdateFontSize()

        -- 应用新增状态
        ApplyWindowLock()
        ApplyTipsAppearance()
        UpdateMinimapButtonVisibility()
        UpdateMainButtonVisibility()
        print("|cFF00FF00BossTips|r: 已重置所有设置到默认值")
    end)
    
    -- 更新重置框架高度以容纳帮助信息
    resetFrame:SetHeight(70)
    
    -- 精简的帮助信息（两行）
    local helpLine1 = resetFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    helpLine1:SetPoint("TOPLEFT", resetBtn, "BOTTOMLEFT", 0, -12)
    helpLine1:SetText("|cFFFFFF00命令:|r |cFF00FF00/bts|r 显示帮助 |cFF00FF00/bts set|r 打开设置窗口 |cFF00FF00/bts reset|r 重置配置")
    
    local helpLine2 = resetFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    helpLine2:SetPoint("TOPLEFT", helpLine1, "BOTTOMLEFT", 0, -6)
    helpLine2:SetText("|cFFFFFF00操作:|r 主按钮左键打开BOSS列表，右键打开设置窗口")
    
    local helpLine3 = resetFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    helpLine3:SetPoint("TOPLEFT", helpLine2, "BOTTOMLEFT", 0, -6)
    helpLine3:SetText("|cFFFFFF00操作:|r BOSS列表左键打开攻略窗口，右键发送攻略到聊天频道")

    -- 打开攻略管理窗口（版本开关/编辑/导入导出）
    local manageBtn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    manageBtn:SetSize(240, 28)
    manageBtn:SetPoint("TOPLEFT", helpLine3, "BOTTOMLEFT", 0, -14)
    manageBtn:SetText("攻略版本/编辑/导入导出")
    manageBtn:GetFontString():SetTextColor(1, 0.8, 0)
    manageBtn:SetScript("OnClick", function()
        if addon.guideManagerFrame then
            addon.guideManagerFrame:Show()
        end
    end)

    -- 面板显示时刷新所有控件
    panel:SetScript("OnShow", function()
        UIDropDownMenu_SetText(bossDirDropDown, dirTextMap[BossTipsGlobalDB.bossMenuPopDirection] or "下")
        UIDropDownMenu_SetText(tipsDirDropDown, dirTextMap[BossTipsGlobalDB.tipsFramePopDirection] or "下")
        UIDropDownMenu_SetText(alignDropDown, alignTextMap[BossTipsGlobalDB.tipsFrameAlign] or "左对齐")
        UIDropDownMenu_SetText(channelDropDown, channelNames[BossTipsGlobalDB.defaultChatChannel] or "大喊频道")
        hideBtnCheck:SetChecked(BossTipsGlobalDB.hideMainButtonWhenNoGuide or false)
        fontSizeSlider:SetValue(BossTipsGlobalDB.FontSize or 14)
        fontSizeValue:SetText(tostring(BossTipsGlobalDB.FontSize or 14))
        UIDropDownMenu_SetText(fontDropDown, fontNames[BossTipsGlobalDB.tipsFont] or "系统默认")
        UIDropDownMenu_SetText(bgStyleDropDown, styleNames[BossTipsGlobalDB.tipsBgStyle] or "黑底")
        autoExpandCheck:SetChecked(BossTipsGlobalDB.autoExpandOnTarget or false)
        lockCheck:SetChecked(BossTipsGlobalDB.lockWindow or false)
        minimapCheck:SetChecked(BossTipsGlobalDB.showMinimapButton or false)
    end)

    -- 注册到设置系统（兼容新旧API）
    local ok, cat = pcall(function()
        return Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    end)
    if ok and cat then
        Settings.RegisterAddOnCategory(cat)
        addon.settingsCategory = cat
    else
        if InterfaceOptionsFrame_AddCategory then
            InterfaceOptionsFrame_AddCategory(panel)
        end
    end
end

-- ========== 8b. 攻略管理窗口（版本开关 / 编辑 / 导入导出） ==========
local function CreateGuideManagerFrame()
    local frame = CreateFrame("Frame", "BossTipsGuideManager", UIParent, "BackdropTemplate")
    frame:SetSize(720, 600)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(400)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:Hide()
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 12, right = 12, top = 12, bottom = 12 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.92)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -10)
    title:SetText("BossTips 攻略管理（版本 / 编辑 / 导入导出）")
    title:SetTextColor(1, 0.8, 0)

    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeBtn:SetSize(100, 24)
    closeBtn:SetPoint("TOPRIGHT", -16, -12)
    closeBtn:SetText("关闭")
    closeBtn:GetFontString():SetTextColor(1, 0.8, 0)
    closeBtn:SetScript("OnClick", function() frame:Hide() end)

    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -44)
    scroll:SetPoint("BOTTOMRIGHT", -32, 12)
    local child = CreateFrame("Frame", nil, scroll)
    child:SetSize(680, 2400)
    scroll:SetScrollChild(child)

    local y = -8
    local function Section(titleText)
        local t = child:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
        t:SetPoint("TOPLEFT", 8, y)
        t:SetText(titleText)
        t:SetTextColor(1, 0.8, 0)
        y = y - 26
    end

    -- 零、全局显示设置（小怪攻略开关）
    local showMobsCheck = CreateFrame("CheckButton", nil, child, "UICheckButtonTemplate")
    showMobsCheck:SetPoint("TOPLEFT", 12, y)
    showMobsCheck:SetChecked(BossTipsGlobalDB.showMobs or false)
    showMobsCheck:SetScript("OnClick", function(self)
        BossTipsGlobalDB.showMobs = self:GetChecked()
        RefreshGuides()
    end)
    local showMobsLabel = child:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    showMobsLabel:SetPoint("LEFT", showMobsCheck, "RIGHT", 6, 0)
    showMobsLabel:SetText("显示小怪/重点怪攻略（取消勾选=仅显示首领）")
    y = y - 30

    local GD = addon.GuideData or { versions = {}, mplus = {} }
    local db = BossTipsGlobalDB

    -- 一、大版本原生副本开关
    Section("一、大版本原生副本（取消勾选=隐藏该版本全部副本）")
    local nativeList = GetNativeOrder()
    for _, vid in ipairs(nativeList) do
        local cb = CreateFrame("CheckButton", nil, child, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 12, y)
        cb:SetChecked(not (db.disabledNative[vid]))
        cb:SetScript("OnClick", function(self)
            if self:GetChecked() then db.disabledNative[vid] = nil else db.disabledNative[vid] = true end
            RefreshGuides()
        end)
        local lbl = child:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        lbl:SetPoint("LEFT", cb, "RIGHT", 6, 0)
        lbl:SetText(GetVersionLabel(vid))
        y = y - 26
    end
    y = y - 6

    -- 二、大秘境赛季开关
    Section("二、大秘境赛季（取消勾选=隐藏该赛季池）")
    local mplusList = GetMPlusOrder()
    for _, sid in ipairs(mplusList) do
        local cb = CreateFrame("CheckButton", nil, child, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 12, y)
        cb:SetChecked(not (db.disabledMPlus[sid]))
        cb:SetScript("OnClick", function(self)
            if self:GetChecked() then db.disabledMPlus[sid] = nil else db.disabledMPlus[sid] = true end
            RefreshGuides()
        end)
        local lbl = child:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        lbl:SetPoint("LEFT", cb, "RIGHT", 6, 0)
        lbl:SetText(GetVersionLabel(sid))
        y = y - 26
    end
    y = y - 6

    -- 三、隐藏单个副本
    Section("三、隐藏单个副本（取消勾选=隐藏该副本）")
    local instances = CollectAllInstances()
    for _, inst in ipairs(instances) do
        local cb = CreateFrame("CheckButton", nil, child, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", 12, y)
        cb:SetChecked(not (db.hiddenDungeons[inst]))
        cb:SetScript("OnClick", function(self)
            if self:GetChecked() then db.hiddenDungeons[inst] = nil else db.hiddenDungeons[inst] = true end
            RefreshGuides()
        end)
        local lbl = child:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        lbl:SetPoint("LEFT", cb, "RIGHT", 6, 0)
        lbl:SetText(inst)
        y = y - 22
    end
    y = y - 10

    -- 四、攻略编辑（保存到 WTF）
    Section("四、攻略编辑（修改后保存到 WTF，优先级最高）")
    local instDD = CreateFrame("Frame", "BossTipsMgrInstDD", child, "UIDropDownMenuTemplate")
    instDD:SetPoint("TOPLEFT", 12, y)
    UIDropDownMenu_SetWidth(instDD, 250)
    local bossDD = CreateFrame("Frame", "BossTipsMgrBossDD", child, "UIDropDownMenuTemplate")
    bossDD:SetPoint("LEFT", instDD, "RIGHT", 10, 0)
    UIDropDownMenu_SetWidth(bossDD, 250)
    y = y - 30

    local currentInst, currentBoss = nil, nil
    local editBox

    local function LoadEditor()
        if not currentInst or not currentBoss then
            editBox:SetText("")
            return
        end
        local tips = ""
        if db.guides[currentInst] and db.guides[currentInst][currentBoss] then
            tips = db.guides[currentInst][currentBoss]
        else
            local e = GetActiveGuideEntry(currentInst, currentBoss)
            if e then tips = e.tips or "" end
        end
        editBox:SetText(tips)
    end

    local function FillBossList()
        UIDropDownMenu_Initialize(bossDD, function()
            local inst = currentInst
            if not inst then return end
            local list = {}
            local ag = addon.ActiveGuides[inst]
            if ag then for b in pairs(ag) do if not tContains(list, b) then table.insert(list, b) end end end
            if GD.versions then
                for _, t in pairs(GD.versions) do
                    if t[inst] then for b in pairs(t[inst]) do if not tContains(list, b) then table.insert(list, b) end end end
                end
            end
            if GD.mplus then
                for _, t in pairs(GD.mplus) do
                    if t[inst] then for b in pairs(t[inst]) do if not tContains(list, b) then table.insert(list, b) end end end
                end
            end
            table.sort(list)
            local info = UIDropDownMenu_CreateInfo()
            for _, b in ipairs(list) do
                info.text = b
                info.value = b
                info.func = function(self)
                    currentBoss = self.value
                    UIDropDownMenu_SetText(bossDD, self.value)
                    LoadEditor()
                end
                UIDropDownMenu_AddButton(info)
            end
        end)
    end

    UIDropDownMenu_Initialize(instDD, function()
        local info = UIDropDownMenu_CreateInfo()
        for _, inst in ipairs(CollectAllInstances()) do
            info.text = inst
            info.value = inst
            info.func = function(self)
                currentInst = self.value
                UIDropDownMenu_SetText(instDD, self.value)
                currentBoss = nil
                UIDropDownMenu_SetText(bossDD, "")
                FillBossList()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)

    editBox = CreateFrame("EditBox", "BossTipsMgrEdit", child, "InputBoxTemplate")
    editBox:SetSize(644, 120)
    editBox:SetPoint("TOPLEFT", 12, y)
    if editBox.SetMultiLine then editBox:SetMultiLine(true) end
    editBox:SetFontObject("GameFontNormal")
    editBox:SetTextInsets(6, 6, 6, 6)
    editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    y = y - 130

    local saveBtn = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
    saveBtn:SetSize(130, 26)
    saveBtn:SetPoint("TOPLEFT", 12, y)
    saveBtn:SetText("保存攻略")
    saveBtn:GetFontString():SetTextColor(1, 0.8, 0)
    saveBtn:SetScript("OnClick", function()
        if not currentInst or not currentBoss then
            print("|cFFFF0000BossTips|r: 请先选择副本与 BOSS")
            return
        end
        db.guides[currentInst] = db.guides[currentInst] or {}
        db.guides[currentInst][currentBoss] = editBox:GetText()
        RefreshGuides()
        print("|cFF00FF00BossTips|r: 已保存 " .. currentInst .. " - " .. currentBoss .. " 到 WTF")
    end)

    local resetBtn = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
    resetBtn:SetSize(150, 26)
    resetBtn:SetPoint("LEFT", saveBtn, "RIGHT", 10, 0)
    resetBtn:SetText("清除该覆盖")
    resetBtn:GetFontString():SetTextColor(1, 0.8, 0)
    resetBtn:SetScript("OnClick", function()
        if not currentInst or not currentBoss then return end
        if db.guides[currentInst] then
            db.guides[currentInst][currentBoss] = nil
            if not next(db.guides[currentInst]) then db.guides[currentInst] = nil end
        end
        RefreshGuides()
        LoadEditor()
        print("|cFF00FF00BossTips|r: 已清除 " .. currentInst .. " - " .. currentBoss .. " 的自定义覆盖")
    end)
    y = y - 36

    -- 五、导入 / 导出
    Section("五、攻略导入 / 导出（base64 编码）")
    local exportBox = CreateFrame("EditBox", "BossTipsMgrExport", child, "InputBoxTemplate")
    exportBox:SetSize(644, 70)
    exportBox:SetPoint("TOPLEFT", 12, y)
    if exportBox.SetMultiLine then exportBox:SetMultiLine(true) end
    exportBox:SetFontObject("GameFontNormal")
    exportBox:SetTextInsets(6, 6, 6, 6)
    y = y - 80

    local exportBtn = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
    exportBtn:SetSize(180, 26)
    exportBtn:SetPoint("TOPLEFT", 12, y)
    exportBtn:SetText("导出自定义攻略到框")
    exportBtn:GetFontString():SetTextColor(1, 0.8, 0)
    exportBtn:SetScript("OnClick", function()
        exportBox:SetText(EncodeGuides())
        print("|cFF00FF00BossTips|r: 已导出自定义攻略（base64），可复制保存")
    end)
    y = y - 36

    local importBox = CreateFrame("EditBox", "BossTipsMgrImport", child, "InputBoxTemplate")
    importBox:SetSize(644, 70)
    importBox:SetPoint("TOPLEFT", 12, y)
    if importBox.SetMultiLine then importBox:SetMultiLine(true) end
    importBox:SetFontObject("GameFontNormal")
    importBox:SetTextInsets(6, 6, 6, 6)
    importBox:SetText("在此粘贴 base64 攻略串，然后点导入")
    y = y - 80

    local importBtn = CreateFrame("Button", nil, child, "UIPanelButtonTemplate")
    importBtn:SetSize(180, 26)
    importBtn:SetPoint("TOPLEFT", 12, y)
    importBtn:SetText("导入并合并")
    importBtn:GetFontString():SetTextColor(1, 0.8, 0)
    importBtn:SetScript("OnClick", function()
        local txt = strtrim(importBox:GetText() or "")
        if txt == "" or txt == "在此粘贴 base64 攻略串，然后点导入" then
            print("|cFFFF0000BossTips|r: 请先粘贴 base64 攻略串")
            return
        end
        local decoded = DecodeGuides(txt)
        if not next(decoded) then
            print("|cFFFF0000BossTips|r: 导入内容为空或格式错误")
            return
        end
        local n = MergeImportedGuides(decoded)
        RefreshGuides()
        print("|cFF00FF00BossTips|r: 已导入并合并 " .. n .. " 条自定义攻略")
    end)
    y = y - 36

    return frame
end

-- ========== 8b. 副本选择（按版本折叠） ==========
local function CreateDungeonPicker()
    local frame = CreateFrame("Frame", "BossTipsDungeonPicker", UIParent, "BackdropTemplate")
    frame:SetSize(260, 460)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(150)
    frame:SetClampedToScreen(true)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:Hide()
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 16,
        insets = { left = 11, right = 11, top = 11, bottom = 11 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.9)

    -- 标题栏
    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetSize(frame:GetWidth() - 22, 24)
    titleBar:SetPoint("TOP", 0, -8)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    titleBar:SetScript("OnDragStart", function()
        if not BossTipsGlobalDB.lockWindow then frame:StartMoving() end
    end)
    titleBar:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    local titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    titleText:SetPoint("CENTER")
    titleText:SetText("副本选择（按版本）")
    titleText:SetTextColor(1, 0.8, 0)
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -2, -2)
    closeBtn:SetScript("OnClick", function() frame:Hide() end)

    -- 滚动容器
    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", 12, -36)
    scroll:SetPoint("BOTTOMRIGHT", -30, 12)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(200, 1)
    scroll:SetScrollChild(content)
    frame.content = content

    -- 折叠状态记忆（按版本/赛季 id）
    local expanded = {}
    local headerPool, dungeonPool = {}, {}
    local usedHeaders, usedDungeons = 0, 0

    local function acquireHeader()
        usedHeaders = usedHeaders + 1
        local b = headerPool[usedHeaders]
        if not b then
            b = CreateFrame("Button", nil, content)
            b:SetHeight(22)
            b:SetNormalFontObject("GameFontNormal")
            b:GetFontString():SetPoint("LEFT", 4, 0)
            b:GetFontString():SetJustifyH("LEFT")
            b:SetHighlightTexture("Interface\\Buttons\\UI-Listbox-Highlight", "ADD")
            headerPool[usedHeaders] = b
        end
        b:Show(); b:ClearAllPoints(); return b
    end
    local function acquireDungeon()
        usedDungeons = usedDungeons + 1
        local b = dungeonPool[usedDungeons]
        if not b then
            b = CreateFrame("Button", nil, content)
            b:SetHeight(20)
            b:SetNormalFontObject("GameFontHighlight")
            b:GetFontString():SetPoint("LEFT", 18, 0)
            b:GetFontString():SetJustifyH("LEFT")
            b:SetHighlightTexture("Interface\\Buttons\\UI-Listbox-Highlight", "ADD")
            dungeonPool[usedDungeons] = b
        end
        b:Show(); b:ClearAllPoints(); return b
    end

    local function openInstance(inst)
        if tipsFrame then
            tipsFrame:ShowInstanceGuide(inst)
        end
        frame:Hide()
    end

    function frame:Refresh()
        usedHeaders = 0
        usedDungeons = 0
        local db = BossTipsGlobalDB
        local GD = addon.GuideData
        local sw = (frame:GetWidth() or 260) - 62
        if sw < 120 then sw = 200 end
        content:SetWidth(sw)
        local y = 0
        local lineH, dH = 22, 20

        -- 当前副本快捷入口
        if currentInstanceName and GetBossData()[currentInstanceName] then
            local h = acquireHeader()
            h:SetWidth(sw); h:SetPoint("TOPLEFT", 0, -y); y = y + lineH
            h:SetText("◆ 当前副本：" .. currentInstanceName)
            h:GetFontString():SetTextColor(1, 0.9, 0.3)
            h:SetScript("OnClick", function() openInstance(currentInstanceName) end)
        end

        -- 大版本原生副本（低版本优先，同名去重）
        local seen = {}
        for _, vid in ipairs(GetNativeOrder()) do
            if GD.versions[vid] and not (db.disabledNative and db.disabledNative[vid]) then
                local insts = {}
                for inst, _ in pairs(GD.versions[vid]) do
                    if not (db.hiddenDungeons and db.hiddenDungeons[inst]) and not seen[inst] then
                        seen[inst] = true
                        table.insert(insts, inst)
                    end
                end
                if #insts > 0 then
                    table.sort(insts)
                    local isExp = expanded[vid] ~= false
                    local h = acquireHeader()
                    h:SetWidth(sw); h:SetPoint("TOPLEFT", 0, -y); y = y + lineH
                    h:SetText((isExp and "▾ " or "▸ ") .. GetVersionLabel(vid) .. "（" .. #insts .. "）")
                    h:GetFontString():SetTextColor(0.6, 0.8, 1)
                    h:SetScript("OnClick", function()
                        expanded[vid] = not isExp
                        frame:Refresh()
                    end)
                    if isExp then
                        for _, inst in ipairs(insts) do
                            local d = acquireDungeon()
                            d:SetWidth(sw - 8); d:SetPoint("TOPLEFT", 4, -y); y = y + dH
                            d:SetText("· " .. inst)
                            d:GetFontString():SetTextColor(1, 0.85, 0.5)
                            d:SetScript("OnClick", function() openInstance(inst) end)
                        end
                    end
                end
            end
        end

        -- 大秘境赛季
        for _, sid in ipairs(GetMPlusOrder()) do
            if GD.mplus[sid] and not (db.disabledMPlus and db.disabledMPlus[sid]) then
                local insts = {}
                for inst, _ in pairs(GD.mplus[sid]) do
                    if not (db.hiddenDungeons and db.hiddenDungeons[inst]) then
                        table.insert(insts, inst)
                    end
                end
                if #insts > 0 then
                    table.sort(insts)
                    local key = "M+" .. sid
                    local isExp = expanded[key] ~= false
                    local h = acquireHeader()
                    h:SetWidth(sw); h:SetPoint("TOPLEFT", 0, -y); y = y + lineH
                    h:SetText((isExp and "▾ " or "▸ ") .. GetVersionLabel(sid) .. "（" .. #insts .. "）")
                    h:GetFontString():SetTextColor(0.95, 0.7, 0.35)
                    h:SetScript("OnClick", function()
                        expanded[key] = not isExp
                        frame:Refresh()
                    end)
                    if isExp then
                        for _, inst in ipairs(insts) do
                            local d = acquireDungeon()
                            d:SetWidth(sw - 8); d:SetPoint("TOPLEFT", 4, -y); y = y + dH
                            d:SetText("· " .. inst)
                            d:GetFontString():SetTextColor(1, 0.85, 0.5)
                            d:SetScript("OnClick", function() openInstance(inst) end)
                        end
                    end
                end
            end
        end

        for i = usedHeaders + 1, #headerPool do headerPool[i]:Hide() end
        for i = usedDungeons + 1, #dungeonPool do dungeonPool[i]:Hide() end

        content:SetHeight(math.max(y, 1))
    end

    frame:SetScript("OnShow", function() frame:Refresh() end)
    return frame
end

-- ========== 9. 主按钮 ==========
local function CreateMainButton()
    local btn = CreateFrame("Button", "BossTipsMainButton", UIParent, "UIPanelButtonTemplate")
    btn:SetSize(150, 40)
    btn:SetPoint(
        BossTipsGlobalDB.mainButtonPos.point,
        UIParent,
        BossTipsGlobalDB.mainButtonPos.relativePoint,
        BossTipsGlobalDB.mainButtonPos.xOffset,
        BossTipsGlobalDB.mainButtonPos.yOffset
    )
    btn:SetText("BossTips")
    btn:GetFontString():SetTextColor(1, 0.8, 0)
    btn:SetFrameStrata("HIGH")
    btn:SetFrameLevel(100)
    btn:SetMovable(true)
    btn:EnableMouse(true)
    btn:RegisterForDrag("LeftButton")
    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    
    btn:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if dungeonPicker and dungeonPicker:IsShown() then
                dungeonPicker:Hide()
            elseif dungeonPicker then
                dungeonPicker:Show()
            end
        elseif button == "RightButton" then
            if settingsFrame then settingsFrame:Show() end
        end
    end)
    
    btn:SetScript("OnDragStart", function(self)
        if BossTipsGlobalDB.lockWindow then return end
        self:StartMoving()
        if bossMenu then bossMenu:Hide() end
    end)
    
    btn:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relativePoint, xOffset, yOffset = self:GetPoint()
        BossTipsGlobalDB.mainButtonPos = {
            point = point,
            relativePoint = relativePoint,
            xOffset = xOffset,
            yOffset = yOffset
        }
    end)
    
    return btn
end

-- ========== 10. 副本信息更新 ==========
local function UpdateCurrentInstance()
    local inInstance, instanceType = IsInInstance()
    if inInstance then
        currentInstanceName = GetInstanceInfo()
    else
        currentInstanceName = GetRealZoneText()
    end
    

    
    if mainButton then
        mainButton:SetText(currentInstanceName or "BossTips")
        mainButton:GetFontString():SetTextColor(1, 0.8, 0)
    end
    
    UpdateMainButtonVisibility()
end

-- ========== 11. 命令注册 ==========
local function RegisterSlashCommands()
    SLASH_BOSSTIPS1 = "/bts"
    SLASH_BOSSTIPS2 = "/bosstips"
    
    SlashCmdList["BOSSTIPS"] = function(msg)
        msg = strtrim(msg:lower())
        if msg == "set" or msg == "settings" or msg == "设置" or msg == "" then
            if InCombatLockdown() then
                print("|cFFFF0000BossTips|r: 战斗中无法打开设置窗口")
            elseif settingsFrame then
                settingsFrame:Show()
            end
        elseif msg == "dungeons" or msg == "副本" or msg == "选择" then
            if dungeonPicker then dungeonPicker:Show() end
        elseif msg == "manage" or msg == "管理" or msg == "guide" then
            if addon.guideManagerFrame then
                addon.guideManagerFrame:Show()
            end
        elseif msg == "reset" or msg == "重置" then
            BossTipsGlobalDB = CopyTable(defaultConfig)
            mainButton:ClearAllPoints()
            mainButton:SetPoint(
                BossTipsGlobalDB.mainButtonPos.point,
                UIParent,
                BossTipsGlobalDB.mainButtonPos.relativePoint,
                BossTipsGlobalDB.mainButtonPos.xOffset,
                BossTipsGlobalDB.mainButtonPos.yOffset
            )
            UpdateMainButtonVisibility()
            print("|cFF00FF00BossTips|r: 已重置所有配置到默认值")
        else
            print("|cFF00FF00BossTips 命令帮助|r:")
            print("|cFFFFFF00/bts|r - 显示此帮助信息")
            print("|cFFFFFF00/bts set|r - 打开设置界面")
            print("|cFFFFFF00/bts dungeons|r - 打开副本选择（按版本折叠）")
            print("|cFFFFFF00/bts manage|r - 打开攻略管理（版本/编辑/导入导出）")
            print("|cFFFFFF00/bts reset|r - 重置所有配置")
            print("|cFFFFFF00左键点击主按钮|r - 打开/关闭副本选择")
            print("|cFFFFFF00右键点击主按钮|r - 打开设置窗口")
            print("|cFFFFFF00副本选择里点击副本|r - 打开该副本攻略窗口")
        end
    end
end

-- ========== 12. 初始化 ==========
local function InitAddon()
    mainButton = CreateMainButton()
    bossMenu = CreateBossMenu()
    tipsFrame = CreateTipsFrame()
    settingsFrame = CreateSettingsFrame()
    minimapButton = CreateMinimapButton()
    dungeonPicker = CreateDungeonPicker()
    
    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    eventFrame:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
    eventFrame:RegisterEvent("INSTANCE_GROUP_SIZE_CHANGED")
    eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
    eventFrame:RegisterEvent("ENCOUNTER_START")
    
    eventFrame:SetScript("OnEvent", function(self, event, arg1, arg2)
        if event == "PLAYER_TARGET_CHANGED" then
            if UnitExists("target") and not UnitIsPlayer("target") then
                SmartExpandBoss(UnitName("target"))
            end
            return
        elseif event == "ENCOUNTER_START" then
            SmartExpandBoss(arg2)
            return
        end
        C_Timer.After(1, function()
            UpdateCurrentInstance()
            currentSelectedBoss = nil
            -- 参考 DungeonCheatSheet：进入副本自动弹出攻略窗
            if not BossTipsGlobalDB.autoOpenOnEnter then return end
            local inInst = IsInInstance()
            if inInst and HasCurrentMapGuide() then
                if currentInstanceName ~= lastAutoShownInstance then
                    manuallyHidden = false
                    if tipsFrame and tipsFrame.ShowInstanceGuide then
                        tipsFrame:ShowInstanceGuide(currentInstanceName)
                        lastAutoShownInstance = currentInstanceName
                    end
                end
            else
                lastAutoShownInstance = nil
                if tipsFrame and not manuallyHidden then tipsFrame:Hide() end
            end
        end)
    end)
    
    RegisterSlashCommands()
    UpdateCurrentInstance()
    CreateInterfaceOptionsPanel()
    addon.guideManagerFrame = CreateGuideManagerFrame()
    RefreshGuides()
    ApplyWindowLock()
    ApplyTipsAppearance()
    UpdateMinimapButtonVisibility()
    
    print("|cFF00FF00BossTips|r v" .. addon.version .. " 加载完成！")
    print("|cFFFFFF00输入 /bts|r 查看命令帮助")
    print("|cFFFFFF00输入 /bts settings|r 打开设置界面")
end

InitAddon()