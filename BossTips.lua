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

-- ========== 2. 全局状态与配置（账号通用） ==========
local currentInstanceName = nil
local currentSelectedBoss = nil
local manuallyHidden = false
local bossPanelButtons = {}

local tipsFrame, titleText, tipsFontString, bossButtonArea
local mainButton, bossMenu, settingsFrame

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
    FontSize = 14
}

-- 初始化账号通用配置数据库
local function ensureDBExists()
    if not BossTipsGlobalDB then
        BossTipsGlobalDB = CopyTable(defaultConfig)
    else
        for k, v in pairs(defaultConfig) do
            if BossTipsGlobalDB[k] == nil then
                BossTipsGlobalDB[k] = v
            end
        end
    end
end
ensureDBExists()

-- ========== 3. BOSS数据配置（纯外部文件调用） ==========
local function GetBossData()
    if not addon or not addon.BossData then
        debugPrint("警告：BossData外部文件未加载，无BOSS数据可用")
        return nil
    end
    return addon.BossData
end

-- ========== 4. 检查是否有当前地图攻略 + 主按钮显示控制 ==========
local function HasCurrentMapGuide()
    local bossData = GetBossData()
    if not bossData or not currentInstanceName then
        return false
    end
    return bossData[currentInstanceName] ~= nil
end

local function UpdateMainButtonVisibility()
    if not mainButton then return end
    
    local hasGuide = HasCurrentMapGuide()
    local shouldHide = not hasGuide and BossTipsGlobalDB.hideMainButtonWhenNoGuide
    
    if shouldHide then
        mainButton:Hide()
    else
        mainButton:Show()
    end
end

-- ========== 5. 攻略发送功能 ==========
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
    
    local parts = {strsplit("||", tips)}
    local sortedParts = {}
    for _, part in ipairs(parts) do
        local trimmed = strtrim(part)
        if trimmed ~= "" then
            table.insert(sortedParts, trimmed)
        end
    end
    
    if #sortedParts == 0 then
        print("|cFFFF0000BossTips|r: 攻略内容为空")
        return
    end
    
    local groupSize = GetNumGroupMembers()
    local chatType = "SAY"
    if groupSize > 0 and groupSize <= 5 then
        chatType = "PARTY"
    elseif groupSize > 5 then
        chatType = "RAID"
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

-- ========== 6. 面板内BOSS按钮管理 ==========
local function ClearPanelBossButtons()
    for _, btn in ipairs(bossPanelButtons) do
        btn:Hide()
        btn:ClearAllPoints()
        btn:SetParent(nil)
    end
    bossPanelButtons = {}
end

-- ========== 7. BOSS弹出框体（核心修改：按钮左右键区分） ==========
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
                    -- 左键：弹出攻略窗口
                    local tips = bossInfo.tips or "无攻略信息"
                    local cleanTips = string.gsub(tips, "{[^}]*}", "")
                    cleanTips = string.gsub(cleanTips, "||", "\n\n")
                    local formattedTips = string.format("|cFFFFFF00【%s】|r\n\n%s", bossName, cleanTips)
                    
                    tipsFontString:SetText(formattedTips)
                    tipsFrame.titleText:SetText(currentInstanceName .. " - " .. bossName)
                    tipsFrame:Show()
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

-- ========== 8. 攻略框体（修改：滚动条1px边距） ==========
local function CreateTipsFrame()
    local frame = CreateFrame("Frame", "BossTipsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(BossTipsGlobalDB.TipsFrameSize.width or 500, BossTipsGlobalDB.TipsFrameSize.height or 400)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(100)
    frame:SetMovable(true)
    frame:SetResizable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:Hide()
    
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 12, right = 12, top = 12, bottom = 12 }
    })
    frame:SetBackdropColor(0, 0, 0, 0.9)
    
    local titleBar = CreateFrame("Frame", nil, frame)
    titleBar:SetSize(frame:GetWidth() - 24, 30)
    titleBar:SetPoint("TOP", 0, -6)
    titleBar:EnableMouse(true)
    titleBar:RegisterForDrag("LeftButton")
    
    frame.titleText = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    frame.titleText:SetPoint("CENTER", titleBar, "CENTER")
    frame.titleText:SetText("BossTips 攻略面板")
    frame.titleText:SetTextColor(1, 0.8, 0)
    
    -- 滚动区域
    local scrollFrame = CreateFrame("ScrollFrame", "BossTipsTextScrollFrame", frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetSize(frame:GetWidth() - 36, frame:GetHeight() - 100)
    scrollFrame:SetPoint("TOPLEFT", 12, -42)
    
    -- 核心修改：滚动条距离右侧边框1px
    local scrollBar = scrollFrame.ScrollBar
    scrollBar:ClearAllPoints()
    scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -1, -10)  -- 修改为-1px
    scrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -1, 10)  -- 修改为-1px
    scrollBar:SetWidth(16)
    scrollBar:EnableMouse(true)
    
    local isDragging = false
    scrollBar:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            isDragging = true
            local y = select(2, GetCursorPosition()) / self:GetEffectiveScale()
            self.startY = y
            self.startValue = self:GetValue()
        end
    end)
    
    scrollBar:SetScript("OnMouseUp", function(self)
        isDragging = false
    end)
    
    scrollBar:SetScript("OnUpdate", function(self)
        if isDragging then
            local y = select(2, GetCursorPosition()) / self:GetEffectiveScale()
            local delta = (self.startY - y) * 2
            local minVal, maxVal = self:GetMinMaxValues()
            local newValue = math.max(minVal, math.min(maxVal, self.startValue + delta))
            self:SetValue(newValue)
            local scrollHeight = math.max(0, textFrame:GetHeight() - scrollFrame:GetHeight())
            if scrollHeight > 0 then
                scrollFrame:SetVerticalScroll(scrollHeight * (newValue / maxVal))
            end
        end
    end)
    
    scrollFrame:SetScript("OnMouseWheel", function(self, delta)
        local minVal, maxVal = scrollBar:GetMinMaxValues()
        local newValue = math.max(minVal, math.min(maxVal, scrollBar:GetValue() - delta * 5))
        scrollBar:SetValue(newValue)
        local scrollHeight = math.max(0, textFrame:GetHeight() - self:GetHeight())
        if scrollHeight > 0 then
            self:SetVerticalScroll(scrollHeight * (newValue / maxVal))
        end
    end)
    
    -- 文本容器（自适应宽度）
    local textFrame = CreateFrame("Frame", nil, scrollFrame)
    textFrame:SetSize(scrollFrame:GetWidth() - 20, 500)
    scrollFrame:SetScrollChild(textFrame)
    
    tipsFontString = textFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tipsFontString:SetPoint("TOPLEFT", 10, -10)
    tipsFontString:SetPoint("BOTTOMRIGHT", -10, 10)
    tipsFontString:SetJustifyH("LEFT")
    tipsFontString:SetJustifyV("TOP")
    tipsFontString:SetTextColor(1, 1, 1)
    tipsFontString:SetText("请选择一个BOSS查看攻略")
    
    -- 修复字体：右键缩小生效
    local function UpdateFontSize()
        local fontPath = GameFontNormal:GetFont()
        tipsFontString:SetFont(fontPath, BossTipsGlobalDB.FontSize, "OUTLINE")
    end
    UpdateFontSize()
    
    -- 自适应文本宽度（核心修复）
    local function UpdateTextWrap()
        textFrame:SetSize(scrollFrame:GetWidth() - 20, 5000)
        local text = tipsFontString:GetText()
        tipsFontString:SetText("")
        tipsFontString:SetText(text)
        local textHeight = tipsFontString:GetStringHeight()
        textFrame:SetSize(scrollFrame:GetWidth() - 20, textHeight + 20)
    end
    
    -- 底部3个按钮
    local btnWidth = 120
    local btnHeight = 25
    local btnMargin = 20
    
    local fontSizeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    fontSizeBtn:SetSize(btnWidth, btnHeight)
    fontSizeBtn:SetPoint("BOTTOMLEFT", btnMargin, 20)
    fontSizeBtn:SetText("字体: " .. BossTipsGlobalDB.FontSize)
    fontSizeBtn:GetFontString():SetTextColor(1, 0.8, 0)
    
    -- 修复：左键放大、右键缩小
    fontSizeBtn:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            BossTipsGlobalDB.FontSize = math.min(BossTipsGlobalDB.FontSize + 2, 32)
        elseif button == "RightButton" then
            BossTipsGlobalDB.FontSize = math.max(BossTipsGlobalDB.FontSize - 2, 12)
        end
        UpdateFontSize()
        UpdateTextWrap()
        self:SetText("字体: " .. BossTipsGlobalDB.FontSize)
    end)
    
    local backBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    backBtn:SetSize(btnWidth, btnHeight)
    backBtn:SetPoint("BOTTOMLEFT", fontSizeBtn, "BOTTOMRIGHT", 20, 0)
    backBtn:SetText("返回")
    backBtn:GetFontString():SetTextColor(1, 0.8, 0)
    backBtn:SetScript("OnClick", function()
        frame:Hide()
        bossMenu:ShowBossMenu()
    end)
    
    local sendBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    sendBtn:SetSize(btnWidth, btnHeight)
    sendBtn:SetPoint("BOTTOMLEFT", backBtn, "BOTTOMRIGHT", 20, 0)
    sendBtn:SetText("发送攻略")
    sendBtn:GetFontString():SetTextColor(1, 0.8, 0)
    sendBtn:SetScript("OnClick", function(self, button)
        if not currentSelectedBoss then
            print("|cFFFF0000BossTips|r: 请先选择一个BOSS")
            return
        end
        SendBossTips(currentSelectedBoss)
    end)
    
    -- 调整大小后自适应文本宽度
    local resizeHandle = CreateFrame("Button", nil, frame)
    resizeHandle:SetSize(16, 16)
    resizeHandle:SetPoint("BOTTOMRIGHT", -4, 4)
    resizeHandle:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeHandle:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    resizeHandle:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeHandle:RegisterForDrag("LeftButton")
    resizeHandle:SetScript("OnDragStart", function()
        frame:StartSizing("BOTTOMRIGHT")
    end)
    resizeHandle:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        BossTipsGlobalDB.TipsFrameSize = {
            width = frame:GetWidth(),
            height = frame:GetHeight()
        }
        scrollFrame:SetSize(frame:GetWidth() - 36, frame:GetHeight() - 100)
        UpdateTextWrap() -- 自适应宽度
    end)
    
    titleBar:SetScript("OnDragStart", function()
        frame:StartMoving()
    end)
    titleBar:SetScript("OnDragStop", function()
        frame:StopMovingOrSizing()
        local point, _, relativePoint, xOffset, yOffset = frame:GetPoint()
        BossTipsGlobalDB.TipsFramePosition = {
            point = point,
            relativePoint = relativePoint,
            xOffset = xOffset,
            yOffset = yOffset
        }
    end)
    
    frame:SetScript("OnShow", function(self)
        if not BossTipsGlobalDB.TipsFramePosition then
            self:ClearAllPoints()
            local dir = BossTipsGlobalDB.tipsFramePopDirection
            local align = BossTipsGlobalDB.tipsFrameAlign
            if dir == "TOP" then
                if align == "LEFT" then
                    self:SetPoint("BOTTOMLEFT", mainButton, "TOPLEFT", 0, 10)
                else
                    self:SetPoint("BOTTOMRIGHT", mainButton, "TOPRIGHT", 0, 10)
                end
            elseif dir == "BOTTOM" then
                if align == "LEFT" then
                    self:SetPoint("TOPLEFT", mainButton, "BOTTOMLEFT", 0, -10)
                else
                    self:SetPoint("TOPRIGHT", mainButton, "BOTTOMRIGHT", 0, -10)
                end
            elseif dir == "LEFT" then
                self:SetPoint("RIGHT", mainButton, "LEFT", -10, 0)
            elseif dir == "RIGHT" then
                self:SetPoint("LEFT", mainButton, "RIGHT", 10, 0)
            end
        else
            self:ClearAllPoints()
            self:SetPoint(
                BossTipsGlobalDB.TipsFramePosition.point,
                UIParent,
                BossTipsGlobalDB.TipsFramePosition.relativePoint,
                BossTipsGlobalDB.TipsFramePosition.xOffset,
                BossTipsGlobalDB.TipsFramePosition.yOffset
            )
        end
        UpdateTextWrap()
    end)
    
    return frame
end

-- ========== 9. 设置界面 ==========
local function CreateSettingsFrame()
    local frame = CreateFrame("Frame", "BossTipsSettingsFrame", UIParent, "BackdropTemplate")
    frame:SetSize(320, 360)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(300)
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
    frame:SetBackdropColor(0, 0, 0, 0.9)
    
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOP", 0, -10)
    title:SetText("BossTips 设置")
    title:SetTextColor(1, 0.8, 0)
    
    local bossDirLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    bossDirLabel:SetPoint("TOPLEFT", 20, -40)
    bossDirLabel:SetText("BOSS菜单弹出方向：")
    
    local bossDirDropDown = CreateFrame("Frame", "BossTipsBossDirDropDown", frame, "UIDropDownMenuTemplate")
    bossDirDropDown:SetPoint("TOPLEFT", 180, -38)
    UIDropDownMenu_SetWidth(bossDirDropDown, 90)
    UIDropDownMenu_SetText(bossDirDropDown, BossTipsGlobalDB.bossMenuPopDirection or "BOTTOM")
    
    local function SetBossDir(self)
        UIDropDownMenu_SetText(bossDirDropDown, self.value)
        BossTipsGlobalDB.bossMenuPopDirection = self.value
    end
    
    UIDropDownMenu_Initialize(bossDirDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "上" info.value = "TOP" info.func = SetBossDir UIDropDownMenu_AddButton(info)
        info.text = "下" info.value = "BOTTOM" info.func = SetBossDir UIDropDownMenu_AddButton(info)
        info.text = "左" info.value = "LEFT" info.func = SetBossDir UIDropDownMenu_AddButton(info)
        info.text = "右" info.value = "RIGHT" info.func = SetBossDir UIDropDownMenu_AddButton(info)
    end)
    
    local tipsDirLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tipsDirLabel:SetPoint("TOPLEFT", 20, -80)
    tipsDirLabel:SetText("攻略框弹出方向：")
    
    local tipsDirDropDown = CreateFrame("Frame", "BossTipsTipsDirDropDown", frame, "UIDropDownMenuTemplate")
    tipsDirDropDown:SetPoint("TOPLEFT", 180, -78)
    UIDropDownMenu_SetWidth(tipsDirDropDown, 90)
    UIDropDownMenu_SetText(tipsDirDropDown, BossTipsGlobalDB.tipsFramePopDirection or "BOTTOM")
    
    local function SetTipsDir(self)
        UIDropDownMenu_SetText(tipsDirDropDown, self.value)
        BossTipsGlobalDB.tipsFramePopDirection = self.value
    end
    
    UIDropDownMenu_Initialize(tipsDirDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "上" info.value = "TOP" info.func = SetTipsDir UIDropDownMenu_AddButton(info)
        info.text = "下" info.value = "BOTTOM" info.func = SetTipsDir UIDropDownMenu_AddButton(info)
        info.text = "左" info.value = "LEFT" info.func = SetTipsDir UIDropDownMenu_AddButton(info)
        info.text = "右" info.value = "RIGHT" info.func = SetTipsDir UIDropDownMenu_AddButton(info)
    end)
    
    local alignLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    alignLabel:SetPoint("TOPLEFT", 20, -120)
    alignLabel:SetText("攻略框对齐方式：")
    
    local alignDropDown = CreateFrame("Frame", "BossTipsAlignDropDown", frame, "UIDropDownMenuTemplate")
    alignDropDown:SetPoint("TOPLEFT", 180, -118)
    UIDropDownMenu_SetWidth(alignDropDown, 90)
    UIDropDownMenu_SetText(alignDropDown, BossTipsGlobalDB.tipsFrameAlign or "LEFT")
    
    local function SetAlign(self)
        UIDropDownMenu_SetText(alignDropDown, self.value)
        BossTipsGlobalDB.tipsFrameAlign = self.value
    end
    
    UIDropDownMenu_Initialize(alignDropDown, function()
        local info = UIDropDownMenu_CreateInfo()
        info.text = "左对齐" info.value = "LEFT" info.func = SetAlign UIDropDownMenu_AddButton(info)
        info.text = "右对齐" info.value = "RIGHT" info.func = SetAlign UIDropDownMenu_AddButton(info)
    end)
    
    local hideBtnLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    hideBtnLabel:SetPoint("TOPLEFT", 20, -160)
    hideBtnLabel:SetText("无攻略时隐藏主按钮：")
    
    local hideBtnCheck = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
    hideBtnCheck:SetPoint("TOPLEFT", 180, -158)
    hideBtnCheck:SetChecked(BossTipsGlobalDB.hideMainButtonWhenNoGuide or false)
    hideBtnCheck:SetScript("OnClick", function(self)
        BossTipsGlobalDB.hideMainButtonWhenNoGuide = self:GetChecked()
        UpdateMainButtonVisibility()
    end)
    
    local resetBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    resetBtn:SetSize(120, 25)
    resetBtn:SetPoint("TOPLEFT", 20, -200)
    resetBtn:SetText("重置所有设置")
    resetBtn:GetFontString():SetTextColor(1, 0.8, 0)
    resetBtn:SetScript("OnClick", function()
        BossTipsGlobalDB = CopyTable(defaultConfig)
        
        mainButton:ClearAllPoints()
        mainButton:SetPoint(
            BossTipsGlobalDB.mainButtonPos.point,
            UIParent,
            BossTipsGlobalDB.mainButtonPos.relativePoint,
            BossTipsGlobalDB.mainButtonPos.xOffset,
            BossTipsGlobalDB.mainButtonPos.yOffset
        )
        
        UIDropDownMenu_SetText(bossDirDropDown, "BOTTOM")
        UIDropDownMenu_SetText(tipsDirDropDown, "BOTTOM")
        UIDropDownMenu_SetText(alignDropDown, "LEFT")
        hideBtnCheck:SetChecked(false)
        
        UpdateMainButtonVisibility()
        
        print("|cFF00FF00BossTips|r: 已重置所有设置到默认值")
    end)
    
    local closeBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    closeBtn:SetSize(100, 25)
    closeBtn:SetPoint("BOTTOM", 0, 12)
    closeBtn:SetText("关闭设置")
    closeBtn:GetFontString():SetTextColor(1, 0.8, 0)
    closeBtn:SetScript("OnClick", function()
        frame:Hide()
    end)
    
    frame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    
    return frame
end

-- ========== 10. 主按钮 ==========
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
    
    btn:SetScript("OnClick", function(self, button)
        if tipsFrame and tipsFrame:IsShown() then
            tipsFrame:Hide()
            manuallyHidden = true
            return
        end
        
        if button == "LeftButton" then
            if bossMenu:IsShown() then
                bossMenu:Hide()
            else
                bossMenu:ShowBossMenu()
            end
        elseif button == "RightButton" then
            tipsFrame:Show()
            manuallyHidden = false
        end
    end)
    
    btn:SetScript("OnDragStart", function(self)
        self:StartMoving()
        bossMenu:Hide()
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

-- ========== 11. 副本信息更新 ==========
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

-- ========== 12. 命令注册 ==========
local function RegisterSlashCommands()
    SLASH_BOSSTIPS1 = "/bts"
    SLASH_BOSSTIPS2 = "/bosstips"
    
    SlashCmdList["BOSSTIPS"] = function(msg)
        msg = strtrim(msg:lower())
        if msg == "settings" or msg == "设置" then
            if settingsFrame and settingsFrame:IsShown() then
                settingsFrame:Hide()
            else
                if not settingsFrame then
                    settingsFrame = CreateSettingsFrame()
                end
                settingsFrame:Show()
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
            print("|cFFFFFF00/bts settings|r - 打开设置界面")
            print("|cFFFFFF00/bts reset|r - 重置所有配置")
            print("|cFFFFFF00左键点击主按钮|r - 打开/关闭BOSS列表")
            print("|cFFFFFF00右键点击主按钮|r - 打开攻略面板")
            print("|cFFFFFF00点击主按钮|r - 关闭攻略面板")
            print("|cFFFFFF00BOSS列表左键|r - 打开攻略窗口")
            print("|cFFFFFF00BOSS列表右键|r - 直接发送攻略到聊天频道")
        end
    end
end

-- ========== 13. 初始化 ==========
local function InitAddon()
    mainButton = CreateMainButton()
    bossMenu = CreateBossMenu()
    tipsFrame = CreateTipsFrame()
    settingsFrame = CreateSettingsFrame()
    
    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    eventFrame:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
    eventFrame:RegisterEvent("INSTANCE_GROUP_SIZE_CHANGED")
    
    eventFrame:SetScript("OnEvent", function(self, event)
        C_Timer.After(1, function()
            UpdateCurrentInstance()
            manuallyHidden = false
            currentSelectedBoss = nil
        end)
    end)
    
    RegisterSlashCommands()
    UpdateCurrentInstance()
    
    print("|cFF00FF00BossTips|r v" .. addon.version .. " 加载完成！")
    print("|cFFFFFF00输入 /bts|r 查看命令帮助")
    print("|cFFFFFF00输入 /bts settings|r 打开设置界面")
end

InitAddon()