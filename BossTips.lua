-- ============================================================================
-- Boss Tips  —— 副本一句话攻略提示插件（DCS 风格重写版）
-- 说明：本文件不含任何游戏大版本号；版本清单/标签/排序由各 Guides/*.lua
--       通过 addon.GuideData 自注册，主文件运行时自动发现并合并。
-- 攻略数据（Guides/*.lua）保持不变，本重写只重写框体/设置/导入导出。
-- ============================================================================
local addonName, addon = ...
addon.version = "2.0.0"
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, versionInfo = {}, mplusInfo = {}, meta = {} }

-- ============ 0. 工具函数 ============
local function CopyTable(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do copy[k] = CopyTable(v) end
    return copy
end

local DEBUG = false
local function debugPrint(...)
    if not DEBUG then return end
    local args = { ... }
    local safe = {}
    for i, v in ipairs(args) do safe[i] = (v == nil and "[NIL]" or tostring(v)) end
    print("|cFFFF0000BossTips DEBUG|r:", unpack(safe))
end

local function ParseVersionNumber(v)
    if type(v) ~= "string" then return nil end
    local n = v:match("(%d+)")
    return n and tonumber(n) or nil
end

-- ============ 1. 全局状态与默认配置 ============
local currentInstanceName, currentSelectedBoss, manuallyHidden = nil, nil, false
local lastAutoShownInstance = nil
local tipsFrame, tipsFontString, mainButton, bossMenu, settingsFrame, dungeonPicker, minimapButton

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
    -- 外观与测试
    testInstance = nil,
}

local function ensureDBExists()
    if not BossTipsGlobalDB then
        BossTipsGlobalDB = CopyTable(defaultConfig)
    else
        for k, v in pairs(defaultConfig) do
            if BossTipsGlobalDB[k] == nil then BossTipsGlobalDB[k] = v end
        end
    end
end
ensureDBExists()

-- 攻略框背景/字体映射
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
local function UpdateFontSize()
    if not tipsFontString then return end
    tipsFontString:SetFont(GetTipsFontPath(), BossTipsGlobalDB.FontSize, "OUTLINE")
end

-- ============ 2. 数据层（与 Guides/*.lua 对接，契约保持不变） ============
-- 升序返回 tbl 的全部 key：info.order 优先 -> 数值版本号 -> 字母序
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

-- 合并出当前应显示的攻略表（按副本名索引）
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

-- 自定义攻略 base64 导出/导入（分隔符 \001 / \002）
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

local function HasCurrentMapGuide()
    local bossData = GetBossData()
    return bossData and currentInstanceName and bossData[currentInstanceName] ~= nil
end

local function UpdateMainButtonVisibility()
    if not mainButton then return end
    local shouldHide = not HasCurrentMapGuide() and BossTipsGlobalDB.hideMainButtonWhenNoGuide
    mainButton:SetShown(not shouldHide)
end

local function RefreshGuides()
    BuildActiveGuides()
    UpdateMainButtonVisibility()
end

-- 攻略发送（按 || 分割，约 240 字/条发送）
local function SendBossTips(bossName)
    if not bossName or not currentInstanceName then
        print("|cFFFF0000BossTips|r: 未选中BOSS或副本信息异常")
        return
    end
    local BossData = GetBossData()
    if not BossData or not BossData[currentInstanceName] or not BossData[currentInstanceName][bossName] then
        print("|cFFFF0000BossTips|r: 无", bossName, "的攻略信息")
        return
    end
    local tips = BossData[currentInstanceName][bossName].tips
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
            if tipsFrame and tipsFrame:IsShown() then
                tipsFrame:Hide()
                manuallyHidden = true
            end
        end
    end
    sendNext()
end

-- ============ 3. 选中/智能展开 ============
local function SelectBossAndShow(bossName)
    if not bossName or not currentInstanceName or not tipsFrame then return end
    local BossData = GetBossData()
    if not BossData or not BossData[currentInstanceName] or not BossData[currentInstanceName][bossName] then return end
    currentSelectedBoss = bossName
    manuallyHidden = false
    if tipsFrame.ShowInstanceGuide then tipsFrame:ShowInstanceGuide(currentInstanceName, bossName) end
end
addon.SelectBossAndShow = SelectBossAndShow

local function SmartExpandBoss(name)
    if not BossTipsGlobalDB.autoExpandOnTarget then return end
    if manuallyHidden then return end
    if not currentInstanceName then return end
    if not name or name == "" then return end
    local BossData = GetBossData()
    if not BossData or not BossData[currentInstanceName] then return end
    local match = nil
    for boss in pairs(BossData[currentInstanceName]) do
        if boss == name then match = boss; break end
    end
    if not match then
        name = name:gsub("%s*%-%s*", "")
        for boss in pairs(BossData[currentInstanceName]) do
            local short = boss:gsub("%s*%-%s*", "")
            if short == name or boss:find(name, 1, true) or name:find(boss, 1, true) then
                match = boss; break
            end
        end
    end
    if match then SelectBossAndShow(match) end
end

-- ============ 4. 攻略窗（副本总览手风琴，DCS 风格） ============
local function CreateTipsFrame()
    local frame = CreateFrame("Frame", "BossTipsGuideFrame", UIParent, "BackdropTemplate")
    frame:SetSize(BossTipsGlobalDB.guideWindowWidth or 360, 400)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(50)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:SetClampedToScreen(true)
    frame:Hide()
    if BackdropTemplateMixin and frame.ApplyBackdrop then
        frame:ApplyBackdrop()
    end
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -8)
    title:SetText("BossTips 攻略")
    frame.titleText = title

    -- 锁定图标（右下角悬停显示）
    local lockBtn = CreateFrame("Button", nil, frame)
    lockBtn:SetSize(22, 22)
    lockBtn:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -4, 4)
    lockBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-ExpandButton")
    lockBtn:SetScript("OnClick", function()
        BossTipsGlobalDB.lockWindow = not BossTipsGlobalDB.lockWindow
        ApplyWindowLock()
    end)
    lockBtn:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
    lockBtn:SetScript("OnLeave", function(self)
        if not BossTipsGlobalDB.lockWindow then self:SetAlpha(0.25) end
    end)
    lockBtn:SetAlpha(0.25)
    frame.lockBtn = lockBtn

    -- 缩放手柄（右下角）
    local scale = CreateFrame("Frame", nil, frame)
    scale:SetSize(16, 16)
    scale:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0)
    scale:EnableMouse(true)
    scale:SetScript("OnMouseDown", function() if not BossTipsGlobalDB.lockWindow then frame:StartSizing("BOTTOMRIGHT") end end)
    scale:SetScript("OnMouseUp", function() frame:StopMovingOrSizing() end)

    -- 隐藏/展开按钮（底部）
    local toggle = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    toggle:SetSize(frame:GetWidth() - 16, 22)
    toggle:SetPoint("BOTTOM", frame, "BOTTOM", 0, 2)
    toggle:SetText("隐藏攻略")
    toggle:SetScript("OnClick", function()
        manuallyHidden = true
        frame:Hide()
    end)
    frame.toggleBtn = toggle

    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -34)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -28, 28)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(1, 1)
    scroll:SetScrollChild(content)
    frame.content = content
    frame.scroll = scroll

    local entryPool = {}
    local headerPool = {}

    local function clearChildren()
        for _, w in ipairs(entryPool) do w:Hide() end
        for _, w in ipairs(headerPool) do w:Hide() end
    end

    local function makeHeader(instance)
        local h = table.remove(headerPool) or CreateFrame("Button", nil, content)
        h:SetParent(content)
        h:SetSize(content:GetWidth() > 1 and content:GetWidth() or (frame:GetWidth() - 40), 24)
        h:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
        h:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Highlight")
        h.label = h.label or h:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        h.label:SetPoint("LEFT", h, "LEFT", 24, 0)
        h.label:SetText(instance)
        h:Show()
        headerPool[#headerPool + 1] = h
        return h
    end

    local function makeEntry(boss, entry)
        local e = table.remove(entryPool) or CreateFrame("Frame", nil, content)
        e:SetParent(content)
        e:SetWidth(content:GetWidth() > 1 and content:GetWidth() or (frame:GetWidth() - 20))
        e.fs = e.fs or e:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
        e.fs:SetPoint("TOPLEFT", e, "TOPLEFT", 8, 0)
        e.fs:SetPoint("TOPRIGHT", e, "TOPRIGHT", -30, 0)
        e.fs:SetJustifyH("LEFT")
        e.fs:SetText(entry.tips)
        e.fs:SetWordWrap(true)
        local send = e.send or CreateFrame("Button", nil, e)
        e.send = send
        send:SetSize(20, 20)
        send:SetPoint("TOPRIGHT", e, "TOPRIGHT", 0, 0)
        send:SetNormalTexture("Interface\\Buttons\\UI-GuildButton-MOTDButton")
        send:SetScript("OnClick", function()
            if BossTipsGlobalDB.enableChatSend and not InCombatLockdown() then
                SendBossTips(boss)
            end
        end)
        e:Show()
        entryPool[#entryPool + 1] = e
        return e, e.fs
    end

    function frame:UpdateLayout()
        local r, g, b, a = GetTipsBg()
        if frame.SetBackdropColor then frame:SetBackdropColor(r, g, b, a) end
        local fs = GetTipsFontPath()
        for _, e in ipairs(entryPool) do
            if e.fs then e.fs:SetFont(fs, BossTipsGlobalDB.FontSize, "OUTLINE") end
        end
    end

    function frame:ShowInstanceGuide(instance, selectedBoss)
        currentInstanceName = instance
        local BossData = GetBossData()
        if not BossData or not BossData[instance] then
            frame:Hide()
            return
        end
        frame:Show()
        manuallyHidden = false
        frame.titleText:SetText(instance)
        clearChildren()
        local bosses = {}
        for boss, entry in pairs(BossData[instance]) do bosses[#bosses + 1] = boss end
        table.sort(bosses, function(a, b)
            local ea = BossData[instance][a].order or 99
            local eb = BossData[instance][b].order or 99
            if ea ~= eb then return ea < eb end
            return a < b
        end)
        local y = 0
        local firstHeader = nil
        for i, boss in ipairs(bosses) do
            local entry = BossData[instance][boss]
            local h = makeHeader(boss)
            if not firstHeader then firstHeader = h end
            h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y)
            h.expanded = false
            local entryFrame, fs = makeEntry(boss, entry)
            entryFrame:SetPoint("TOPLEFT", h, "BOTTOMLEFT", 0, -2)
            fs:SetText(entry.tips)
            local lineCount = select(2, string.gsub(entry.tips, "\n", "\n")) + 2
            local eh = math.max(40, lineCount * (BossTipsGlobalDB.FontSize + 4))
            entryFrame:SetHeight(eh)
            h:SetScript("OnClick", function()
                if h.expanded then
                    entryFrame:Hide(); h.expanded = false
                    h:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
                else
                    entryFrame:Show(); h.expanded = true
                    h:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
                    if BossTipsGlobalDB.singleExpand then
                        for _, oh in ipairs(headerPool) do
                            if oh ~= h and oh.expanded then
                                oh.expanded = false
                                oh:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
                                local ef = oh.entryFrame
                                if ef then ef:Hide() end
                            end
                        end
                    end
                end
                frame:RefreshSize()
            end)
            h.entryFrame = entryFrame
            y = y + 24 + 2
            -- 默认首项展开；或选中项展开
            if i == 1 or boss == selectedBoss then
                h.expanded = true
                entryFrame:Show()
                h:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
                y = y + eh + 4
            else
                entryFrame:Hide()
            end
        end
        content:SetHeight(math.max(y, 50))
        frame:UpdateLayout()
        -- 锁定按钮透明度
        if BossTipsGlobalDB.lockWindow then lockBtn:SetAlpha(1) else lockBtn:SetAlpha(0.25) end
    end

    function frame:RefreshSize()
        local total = 0
        for _, h in ipairs(headerPool) do
            total = total + 24 + 2
            if h.expanded and h.entryFrame then
                total = total + h.entryFrame:GetHeight() + 4
            end
        end
        content:SetHeight(math.max(total, 50))
        scroll:UpdateScrollChildRect()
    end

    frame:SetScript("OnDragStart", function(self)
        if BossTipsGlobalDB.lockWindow then return end
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local p, _, rp, x, y = self:GetPoint()
        BossTipsGlobalDB.TipsFramePosition = { point = p, relativePoint = rp, xOffset = x, yOffset = y }
    end)

    if BossTipsGlobalDB.TipsFramePosition then
        local p = BossTipsGlobalDB.TipsFramePosition
        frame:SetPoint(p.point, UIParent, p.relativePoint, p.xOffset, p.yOffset)
    else
        frame:SetPoint("CENTER", UIParent, "CENTER", 200, 0)
    end

    return frame
end

-- ============ 5. 设置窗（设置 / 攻略配置 双标签，DCS 风格） ============
local function CreateSettingsFrame()
    local frame = CreateFrame("Frame", "BossTipsSettingsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(420, 480)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(60)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:Hide()
    if BackdropTemplateMixin and frame.ApplyBackdrop then frame:ApplyBackdrop() end
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetScript("OnDragStart", function(self) if not BossTipsGlobalDB.lockWindow then self:StartMoving() end end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    frame:RegisterForDrag("LeftButton")

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -10)
    title:SetText("BossTips 设置")

    -- 双标签按钮
    local tabSet = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    tabSet:SetSize(120, 24); tabSet:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -36)
    tabSet:SetText("设置")
    local tabGuide = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    tabGuide:SetSize(120, 24); tabGuide:SetPoint("LEFT", tabSet, "RIGHT", 4, 0)
    tabGuide:SetText("攻略配置")

    local panelSet = CreateFrame("Frame", nil, frame)
    panelSet:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -66)
    panelSet:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -16, 40)
    local panelGuide = CreateFrame("Frame", nil, frame)
    panelGuide:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -66)
    panelGuide:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -16, 40)
    panelGuide:Hide()

    local function selectTab(which)
        if which == "set" then
            panelSet:Show(); panelGuide:Hide()
            tabSet:SetEnabled(false); tabGuide:SetEnabled(true)
        else
            panelSet:Hide(); panelGuide:Show()
            tabSet:SetEnabled(true); tabGuide:SetEnabled(false)
        end
    end
    tabSet:SetScript("OnClick", function() selectTab("set") end)
    tabGuide:SetScript("OnClick", function() selectTab("guide") end)

    -- 通用控件工厂
    local y = 0
    local function newLine(parent)
        y = y + 26
        return y
    end
    local function addCheck(parent, label, key, callback)
        local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
        cb:SetPoint("TOPLEFT", parent, "TOPLEFT", 6, -newLine(parent))
        cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        cb.text:SetPoint("LEFT", cb, "RIGHT", 4, 0)
        cb.text:SetText(label)
        cb:SetChecked(BossTipsGlobalDB[key] and true or false)
        cb:SetScript("OnClick", function(self)
            BossTipsGlobalDB[key] = self:GetChecked()
            if callback then callback(self:GetChecked()) end
        end)
        return cb
    end
    local function addButton(parent, label, w, callback)
        local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
        b:SetSize(w or 140, 24)
        b:SetPoint("TOPLEFT", parent, "TOPLEFT", 6, -newLine(parent))
        b:SetText(label)
        b:SetScript("OnClick", callback)
        return b
    end

    -- 设置页内容
    addCheck(panelSet, "智能展开（选中首领自动打开攻略）", "autoExpandOnTarget")
    addCheck(panelSet, "进入副本自动弹出攻略窗", "autoOpenOnEnter")
    addCheck(panelSet, "锁定窗口（禁止拖动/缩放）", "lockWindow", function(v) ApplyWindowLock() end)
    addCheck(panelSet, "显示小怪/重点怪攻略", "showMobs", function() RefreshGuides() end)
    addCheck(panelSet, "允许发送攻略到聊天", "enableChatSend")
    addCheck(panelSet, "同时只展开一个首领", "singleExpand")
    addCheck(panelSet, "显示小地图按钮", "showMinimapButton", function(v) UpdateMinimapButtonVisibility() end)
    addCheck(panelSet, "无攻略时隐藏主按钮", "hideMainButtonWhenNoGuide", function() UpdateMainButtonVisibility() end)

    -- 字号滑块
    newLine(panelSet)
    local fsLabel = panelSet:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    fsLabel:SetPoint("TOPLEFT", panelSet, "TOPLEFT", 6, -y)
    fsLabel:SetText("攻略字号: " .. BossTipsGlobalDB.FontSize)
    local slider = CreateFrame("Slider", nil, panelSet, "OptionsSliderTemplate")
    slider:SetPoint("TOPLEFT", panelSet, "TOPLEFT", 6, -y - 18)
    slider:SetMinMaxValues(10, 22)
    slider:SetValueStep(1)
    slider:SetValue(BossTipsGlobalDB.FontSize or 14)
    slider:SetScript("OnValueChanged", function(self, val)
        val = math.floor(val)
        BossTipsGlobalDB.FontSize = val
        fsLabel:SetText("攻略字号: " .. val)
        UpdateFontSize()
        if tipsFrame then tipsFrame:UpdateLayout() end
    end)

    -- 字体下拉（用简单按钮循环切换）
    newLine(panelSet); newLine(panelSet)
    local fontNames = { default = "系统默认", damage = "伤害数字", chat = "聊天(雅黑)" }
    local fontOrder = { "default", "damage", "chat" }
    local fontBtn = addButton(panelSet, "字体: " .. (fontNames[BossTipsGlobalDB.tipsFont] or "系统默认"), 200, function()
        local i = 1
        for k, v in ipairs(fontOrder) do if v == BossTipsGlobalDB.tipsFont then i = k end end
        i = i % #fontOrder + 1
        BossTipsGlobalDB.tipsFont = fontOrder[i]
        fontBtn:SetText("字体: " .. fontNames[BossTipsGlobalDB.tipsFont])
        UpdateFontSize()
        if tipsFrame then tipsFrame:UpdateLayout() end
    end)

    -- 背景颜色取色器
    newLine(panelSet)
    local colorBtn = addButton(panelSet, "背景颜色", 120, function()
        -- 简易：点击在预设间循环
        local r, g, b, a = GetTipsBg()
        local next = {
            { 0.05, 0.05, 0.05, 0.82 },
            { 0, 0, 0, 0.60 },
            { 0.08, 0.16, 0.32, 0.88 },
        }
        local cur = (BossTipsGlobalDB.tipsBgR ~= nil and 1 or 0)
        local idx = (BossTipsGlobalDB._bgIdx or 1) % #next + 1
        BossTipsGlobalDB._bgIdx = idx
        BossTipsGlobalDB.tipsBgR, BossTipsGlobalDB.tipsBgG, BossTipsGlobalDB.tipsBgB, BossTipsGlobalDB.tipsBgA = unpack(next[idx])
        if tipsFrame then tipsFrame:UpdateLayout() end
    end)

    addButton(panelSet, "打开攻略管理（导入/导出）", 220, function()
        if addon.guideManagerFrame then addon.guideManagerFrame:Show() end
    end)
    addButton(panelSet, "重置全部配置", 160, function()
        BossTipsGlobalDB = CopyTable(defaultConfig)
        ReloadUI()
    end)

    -- 攻略配置页内容
    local guideInfo = panelGuide:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    guideInfo:SetPoint("TOPLEFT", panelGuide, "TOPLEFT", 6, -6)
    guideInfo:SetWidth(panelGuide:GetWidth() - 12)
    guideInfo:SetJustifyH("LEFT")
    guideInfo:SetText("攻略版本管理 / 隐藏副本 / 攻略编辑 / 导入导出，请点击下方按钮打开攻略管理器。")
    addButton(panelGuide, "打开攻略管理器", 200, function()
        if addon.guideManagerFrame then addon.guideManagerFrame:Show() end
    end)

    selectTab("set")
    return frame
end

-- ============ 6. 副本选择器（按版本折叠，DCS 风格） ============
local function CreateDungeonPicker()
    local frame = CreateFrame("Frame", "BossTipsDungeonPicker", UIParent, "BackdropTemplate")
    frame:SetSize(280, 420)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(55)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:Hide()
    if BackdropTemplateMixin and frame.ApplyBackdrop then frame:ApplyBackdrop() end
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetScript("OnDragStart", function(self) if not BossTipsGlobalDB.lockWindow then self:StartMoving() end end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    frame:RegisterForDrag("LeftButton")

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -8)
    title:SetText("选择副本")

    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -34)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -28, 10)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(1, 1)
    scroll:SetScrollChild(content)
    frame.content = content

    local foldState = {}

    local function makeHeader(versionId, label, count)
        local h = CreateFrame("Button", nil, content)
        h:SetSize(content:GetWidth() > 1 and content:GetWidth() or (frame:GetWidth() - 24), 22)
        h:SetNormalFontObject("GameFontNormal")
        h:SetText((foldState[versionId] and "▸ " or "▾ ") .. label .. " (" .. count .. ")")
        h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, 0)
        h:SetScript("OnClick", function()
            foldState[versionId] = not foldState[versionId]
            frame:Refresh()
        end)
        return h
    end
    local function makeDungeon(instance)
        local b = CreateFrame("Button", nil, content)
        b:SetSize(content:GetWidth() > 1 and content:GetWidth() or (frame:GetWidth() - 24), 20)
        b:SetNormalFontObject("GameFontHighlightSmall")
        b:SetText("· " .. instance)
        b:SetPoint("TOPLEFT", content, "TOPLEFT", 14, 0)
        b:SetScript("OnClick", function()
            if tipsFrame and tipsFrame.ShowInstanceGuide then
                tipsFrame:ShowInstanceGuide(instance)
                frame:Hide()
            end
        end)
        return b
    end

    function frame:Refresh()
        for _, c in ipairs({ content:GetChildren() }) do c:Hide() end
        local BossData = GetBossData()
        local y = 0
        -- 当前副本快捷入口
        if currentInstanceName and BossData and BossData[currentInstanceName] then
            local cur = CreateFrame("Button", nil, content)
            cur:SetSize(frame:GetWidth() - 24, 22)
            cur:SetNormalFontObject("GameFontNormal")
            cur:SetText("◆ 当前副本：" .. currentInstanceName)
            cur:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y); y = y + 24
            cur:SetScript("OnClick", function()
                tipsFrame:ShowInstanceGuide(currentInstanceName)
                frame:Hide()
            end)
        end
        -- 原生版本
        for _, vid in ipairs(GetNativeOrder()) do
            if not (BossTipsGlobalDB.disabledNative and BossTipsGlobalDB.disabledNative[vid]) then
                local t = addon.GuideData.versions[vid]
                if t then
                    local instances = {}
                    for inst in pairs(t) do
                        if not (BossTipsGlobalDB.hiddenDungeons and BossTipsGlobalDB.hiddenDungeons[inst]) then
                            instances[#instances + 1] = inst
                        end
                    end
                    if #instances > 0 then
                        table.sort(instances)
                        local h = makeHeader(vid, GetVersionLabel(vid), #instances)
                        h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y); y = y + 22
                        if not foldState[vid] then
                            for _, inst in ipairs(instances) do
                                local b = makeDungeon(inst)
                                b:SetPoint("TOPLEFT", content, "TOPLEFT", 14, -y); y = y + 20
                            end
                        end
                    end
                end
            end
        end
        -- 大秘境赛季
        for _, sid in ipairs(GetMPlusOrder()) do
            if not (BossTipsGlobalDB.disabledMPlus and BossTipsGlobalDB.disabledMPlus[sid]) then
                local t = addon.GuideData.mplus[sid]
                if t then
                    local instances = {}
                    for inst in pairs(t) do
                        if not (BossTipsGlobalDB.hiddenDungeons and BossTipsGlobalDB.hiddenDungeons[inst]) then
                            instances[#instances + 1] = inst
                        end
                    end
                    if #instances > 0 then
                        table.sort(instances)
                        local h = makeHeader(sid, GetVersionLabel(sid), #instances)
                        h:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y); y = y + 22
                        if not foldState[sid] then
                            for _, inst in ipairs(instances) do
                                local b = makeDungeon(inst)
                                b:SetPoint("TOPLEFT", content, "TOPLEFT", 14, -y); y = y + 20
                            end
                        end
                    end
                end
            end
        end
        content:SetHeight(math.max(y, 50))
        scroll:UpdateScrollChildRect()
    end

    frame:SetScript("OnShow", function() frame:Refresh() end)
    frame:SetPoint("CENTER", UIParent, "CENTER", -200, 0)
    return frame
end

-- ============ 7. 攻略管理器（版本开关 / 隐藏副本 / 编辑 / 导入导出） ============
local function CreateGuideManagerFrame()
    local frame = CreateFrame("Frame", "BossTipsGuideManager", UIParent, "BackdropTemplate")
    frame:SetSize(460, 500)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(65)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:Hide()
    if BackdropTemplateMixin and frame.ApplyBackdrop then frame:ApplyBackdrop() end
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetScript("OnDragStart", function(self) if not BossTipsGlobalDB.lockWindow then self:StartMoving() end end)
    frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    frame:RegisterForDrag("LeftButton")

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", frame, "TOP", 0, -8)
    title:SetText("攻略管理器")

    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -34)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -28, 60)
    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(1, 1)
    scroll:SetScrollChild(content)
    frame.content = content

    local edInstance = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    edInstance:SetSize(140, 24); edInstance:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 30)
    edInstance:SetAutoFocus(false)
    local edBoss = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    edBoss:SetSize(140, 24); edBoss:SetPoint("LEFT", edInstance, "RIGHT", 6, 0)
    edBoss:SetAutoFocus(false)
    local edTips = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    edTips:SetSize(140, 24); edTips:SetPoint("LEFT", edBoss, "RIGHT", 6, 0)
    edTips:SetAutoFocus(false)
    edTips:SetText("攻略文本(用||分段)")

    local function buildList()
        for _, c in ipairs({ content:GetChildren() }) do c:Hide() end
        local y = 0
        local all = CollectAllInstances()
        for _, inst in ipairs(all) do
            local hidden = BossTipsGlobalDB.hiddenDungeons and BossTipsGlobalDB.hiddenDungeons[inst]
            local row = CreateFrame("Frame", nil, content)
            row:SetSize(frame:GetWidth() - 40, 22)
            row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y); y = y + 22
            local t = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            t:SetPoint("LEFT", row, "LEFT", 0, 0)
            t:SetText((hidden and "[隐藏] " or "") .. inst)
            local hideBtn = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
            hideBtn:SetSize(50, 18); hideBtn:SetPoint("RIGHT", row, "RIGHT", 0, 0)
            hideBtn:SetText(hidden and "显示" or "隐藏")
            hideBtn:SetScript("OnClick", function()
                BossTipsGlobalDB.hiddenDungeons = BossTipsGlobalDB.hiddenDungeons or {}
                BossTipsGlobalDB.hiddenDungeons[inst] = hidden and nil or true
                RefreshGuides()
                buildList()
            end)
        end
        content:SetHeight(math.max(y, 50))
        scroll:UpdateScrollChildRect()
    end

    local saveBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    saveBtn:SetSize(80, 24); saveBtn:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 4)
    saveBtn:SetText("保存攻略")
    saveBtn:SetScript("OnClick", function()
        local inst = strtrim(edInstance:GetText())
        local boss = strtrim(edBoss:GetText())
        local tips = strtrim(edTips:GetText())
        if inst == "" or boss == "" then print("|cFFFF0000BossTips|r: 副本与BOSS不能为空") return end
        BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
        BossTipsGlobalDB.guides[inst] = BossTipsGlobalDB.guides[inst] or {}
        BossTipsGlobalDB.guides[inst][boss] = tips
        RefreshGuides()
        print("|cFF00FF00BossTips|r: 已保存 " .. inst .. " - " .. boss)
    end)

    local exportBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    exportBtn:SetSize(80, 24); exportBtn:SetPoint("LEFT", saveBtn, "RIGHT", 6, 0)
    exportBtn:SetText("导出")
    exportBtn:SetScript("OnClick", function()
        local code = EncodeGuides()
        -- 复制到剪贴板（若可用），同时打印到聊天便于复制
        if code and code ~= "" then
            if frame.editBox then frame.editBox:SetText(code) end
            print("|cFF00FF00BossTips 导出码:|r")
            print(code)
        else
            print("|cFFFF0000BossTips|r: 没有可导出的自定义攻略")
        end
    end)

    local importBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    importBtn:SetSize(80, 24); importBtn:SetPoint("LEFT", exportBtn, "RIGHT", 6, 0)
    importBtn:SetText("导入")
    importBtn:SetScript("OnClick", function()
        local code = frame.editBox and frame.editBox:GetText() or ""
        if not code or code == "" then
            print("|cFFFF0000BossTips|r: 请先在下方编辑框粘贴导出码")
            return
        end
        local decoded = DecodeGuides(code)
        local n = MergeImportedGuides(decoded)
        RefreshGuides()
        print("|cFF00FF00BossTips|r: 已导入 " .. n .. " 条攻略")
    end)

    -- 导入码编辑框
    local importBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
    importBox:SetSize(frame:GetWidth() - 40, 40)
    importBox:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 10, 30)
    importBox:SetMultiLine(true)
    importBox:Hide()
    frame.editBox = edTips -- 临时：用 edTips 作为导入码入口（简化）
    -- 用专门的导入码框更稳妥
    importBox:SetPoint("BOTTOM", frame, "BOTTOM", 0, 30)
    importBox:Show()
    frame.editBox = importBox

    frame:SetScript("OnShow", function() buildList() end)
    frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    return frame
end

-- ============ 8. 主按钮 / 小地图按钮 ============
local function CreateMainButton()
    local btn = CreateFrame("Button", "BossTipsMainButton", UIParent, "UIPanelButtonTemplate")
    btn:SetSize(150, 40)
    btn:SetPoint(
        BossTipsGlobalDB.mainButtonPos.point, UIParent,
        BossTipsGlobalDB.mainButtonPos.relativePoint,
        BossTipsGlobalDB.mainButtonPos.xOffset, BossTipsGlobalDB.mainButtonPos.yOffset)
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
            if dungeonPicker and dungeonPicker:IsShown() then dungeonPicker:Hide()
            elseif dungeonPicker then dungeonPicker:Show() end
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
        local p, _, rp, x, y = self:GetPoint()
        BossTipsGlobalDB.mainButtonPos = { point = p, relativePoint = rp, xOffset = x, yOffset = y }
    end)
    return btn
end

local function CreateBossMenu()
    local menu = CreateFrame("Frame", "BossTipsSimpleMenu", UIParent, "BackdropTemplate")
    menu:SetSize(200, 30)
    menu:SetFrameStrata("HIGH")
    menu:Hide()
    return menu
end

local function CreateMinimapButton()
    local btn = CreateFrame("Button", "BossTipsMinimapButton", Minimap)
    btn:SetSize(32, 32)
    btn:SetFrameStrata("MEDIUM")
    btn:SetPoint("CENTER", Minimap, "CENTER", 0, 0)
    btn:SetNormalTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    btn:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if dungeonPicker and dungeonPicker:IsShown() then dungeonPicker:Hide()
            elseif dungeonPicker then dungeonPicker:Show() end
        else
            if settingsFrame then settingsFrame:Show() end
        end
    end)
    btn:SetScript("OnDragStart", function()
        if BossTipsGlobalDB.lockWindow then return end
        btn:SetScript("OnUpdate", function()
            local mx, my = Minimap:GetCenter()
            local px, py = GetCursorPosition()
            local scale = btn:GetEffectiveScale()
            px, py = px / scale, py / scale
            local angle = math.atan2(py - my, px - mx)
            BossTipsGlobalDB.minimapAngle = math.deg(angle)
            btn:ClearAllPoints()
            btn:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * 78, math.sin(angle) * 78)
        end)
    end)
    btn:SetScript("OnDragStop", function()
        btn:SetScript("OnUpdate", nil)
    end)
    return btn
end

local function UpdateMinimapButtonVisibility()
    if not minimapButton then return end
    if BossTipsGlobalDB.showMinimapButton then
        local angle = math.rad(BossTipsGlobalDB.minimapAngle or 225)
        minimapButton:ClearAllPoints()
        minimapButton:SetPoint("CENTER", Minimap, "CENTER", math.cos(angle) * 78, math.sin(angle) * 78)
        minimapButton:Show()
    else
        minimapButton:Hide()
    end
end

local function ApplyWindowLock()
    local locked = BossTipsGlobalDB.lockWindow
    if mainButton then
        if locked then mainButton:RegisterForDrag(); mainButton:EnableMouse(true)
        else mainButton:RegisterForDrag("LeftButton") end
    end
    if tipsFrame and tipsFrame.lockBtn then
        tipsFrame.lockBtn:SetAlpha(locked and 1 or 0.25)
    end
end

local function ApplyTipsAppearance()
    if tipsFrame then tipsFrame:UpdateLayout() end
    UpdateFontSize()
end

-- ============ 9. 副本信息更新 ============
local function UpdateCurrentInstance()
    local inInstance, _ = IsInInstance()
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

-- ============ 10. 设置面板（集成到 ESC-界面） ============
local function CreateInterfaceOptionsPanel()
    local panel = CreateFrame("Frame", "BossTipsOptionsPanel")
    panel.name = "BossTips"
    local openBtn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    openBtn:SetSize(200, 30)
    openBtn:SetPoint("CENTER", panel, "CENTER", 0, 0)
    openBtn:SetText("打开 BossTips 设置")
    openBtn:SetScript("OnClick", function()
        if settingsFrame then settingsFrame:Show() end
    end)
    local ok, cat = pcall(function() return Settings.RegisterCanvasLayoutCategory(panel, panel.name) end)
    if ok and cat then
        Settings.RegisterAddOnCategory(cat)
        addon.settingsCategory = cat
    elseif InterfaceOptionsFrame_AddCategory then
        InterfaceOptionsFrame_AddCategory(panel)
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    end
end

-- ============ 11. 命令注册 ============
local function RegisterSlashCommands()
    SLASH_BOSSTIPS1 = "/bts"
    SLASH_BOSSTIPS2 = "/bosstips"
    SlashCmdList["BOSSTIPS"] = function(msg)
        msg = strtrim((msg or ""):lower())
        if msg == "set" or msg == "settings" or msg == "设置" or msg == "" then
            if InCombatLockdown() then
                print("|cFFFF0000BossTips|r: 战斗中无法打开设置窗口")
            elseif settingsFrame then
                settingsFrame:Show()
            end
        elseif msg == "dungeons" or msg == "副本" or msg == "选择" then
            if dungeonPicker then dungeonPicker:Show() end
        elseif msg == "manage" or msg == "管理" or msg == "guide" then
            if addon.guideManagerFrame then addon.guideManagerFrame:Show() end
        elseif msg == "reset" or msg == "重置" then
            BossTipsGlobalDB = CopyTable(defaultConfig)
            if mainButton then
                mainButton:ClearAllPoints()
                mainButton:SetPoint(
                    BossTipsGlobalDB.mainButtonPos.point, UIParent,
                    BossTipsGlobalDB.mainButtonPos.relativePoint,
                    BossTipsGlobalDB.mainButtonPos.xOffset, BossTipsGlobalDB.mainButtonPos.yOffset)
            end
            UpdateMainButtonVisibility()
            print("|cFF00FF00BossTips|r: 已重置所有配置到默认值")
        else
            print("|cFF00FF00BossTips 命令帮助|r:")
            print("|cFFFFFF00/bts|r - 打开设置")
            print("|cFFFFFF00/bts set|r - 打开设置界面")
            print("|cFFFFFF00/bts dungeons|r - 打开副本选择（按版本折叠）")
            print("|cFFFFFF00/bts manage|r - 打开攻略管理（导入/导出）")
            print("|cFFFFFF00/bts reset|r - 重置配置")
            print("|cFFFFFF00左键主按钮|r - 副本选择 |cFFFFFF00右键|r - 设置")
        end
    end
end

-- ============ 12. 初始化（带错误可见保护） ============
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
end

-- 错误可见：任何初始化异常都打印到聊天，而不是静默“完全无反应”
local function SafeInit()
    local ok, err = pcall(InitAddon)
    if not ok then
        print("|cFFFF0000BossTips 初始化失败:|r " .. tostring(err))
        print(debug.traceback and debug.traceback() or "")
    end
end

SafeInit()
