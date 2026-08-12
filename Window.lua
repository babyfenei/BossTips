-- ============================================================================
-- BossTips Window.lua —— 攻略手风琴窗（对齐 DungeonCheatSheet 视觉/交互）
-- 数据来自 addon.ActiveGuides[instanceName][bossName] = { order, type, tips }
-- 交互：单展开 / 折叠透明度 / 锁定 / 缩放 / 底部隐藏-展开 / 小喇叭发聊天
-- ============================================================================
local addonName, addon = ...

local mainWindow = CreateFrame("Frame", "BossTipsGuideFrame", UIParent, "BackdropTemplate")
mainWindow:SetSize(BossTipsGlobalDB.guideWindowWidth or 360, 400)
mainWindow:SetPoint("RIGHT", -150, 0)
mainWindow:SetMovable(true)
mainWindow:EnableMouse(true)
mainWindow:RegisterForDrag("LeftButton")
mainWindow:SetScript("OnDragStart", mainWindow.StartMoving)
mainWindow:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    if BossTipsGlobalDB then
        local point, _, _, xOfs, yOfs = self:GetPoint()
        if point then
            BossTipsGlobalDB.tipsFramePos = { point = point, x = xOfs, y = yOfs }
        end
    end
end)
mainWindow:SetResizable(true)
mainWindow:SetResizeBounds(150, 50, 600, 800)
mainWindow:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
mainWindow:Hide()
addon.tipsFrame = mainWindow

local titleText = mainWindow:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
titleText:SetPoint("TOP", 0, -10)

local targetFrames = {}
local UpdateLayout

-- ============ 右下角缩放手柄 ============
local resizeHandle = CreateFrame("Button", nil, mainWindow)
resizeHandle:SetSize(16, 16)
resizeHandle:SetPoint("BOTTOMRIGHT", 0, 0)
resizeHandle:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizeHandle:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizeHandle:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
resizeHandle:EnableMouse(true)
resizeHandle:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not BossTipsGlobalDB.lockWindow then
        mainWindow:StartSizing("BOTTOMRIGHT")
    end
end)
resizeHandle:SetScript("OnMouseUp", function(self)
    mainWindow:StopMovingOrSizing()
    if BossTipsGlobalDB then
        BossTipsGlobalDB.guideWindowWidth = math.floor(mainWindow:GetWidth())
    end
end)

-- ============ 锁定按钮（悬停显示） ============
local lockBtn = CreateFrame("Button", nil, mainWindow)
lockBtn:SetSize(16, 16)
lockBtn:SetPoint("BOTTOMRIGHT", mainWindow, "BOTTOMRIGHT", -18, 1)
lockBtn:Hide()
lockBtn:EnableMouse(true)
local lockTex = lockBtn:CreateTexture(nil, "ARTWORK")
lockTex:SetAllPoints()
lockBtn.icon = lockTex
lockBtn:SetScript("OnEnter", function(self) self.icon:SetAlpha(1.0) end)
lockBtn:SetScript("OnLeave", function(self) self.icon:SetAlpha(0.75) end)
lockBtn:SetScript("OnClick", function()
    BossTipsGlobalDB.lockWindow = not BossTipsGlobalDB.lockWindow
    addon:UpdateWindowLock()
    local AceConfigRegistry = LibStub("AceConfigRegistry-3.0", true)
    if AceConfigRegistry then AceConfigRegistry:NotifyChange("BossTips") end
    print("|cff00ff00BossTips|r " .. (BossTipsGlobalDB.lockWindow and "窗口已锁定" or "窗口已解锁"))
end)

local function UpdateLockVisual()
    local isLocked = BossTipsGlobalDB.lockWindow
    if isLocked then
        lockTex:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-LOCK")
        lockTex:SetVertexColor(1, 0.8, 0, 1)
        lockTex:SetDesaturated(false)
        resizeHandle:Hide()
    else
        lockTex:SetTexture("Interface\\LFGFRAME\\UI-LFG-ICON-LOCK")
        lockTex:SetVertexColor(0.5, 1, 0.5, 1)
        lockTex:SetDesaturated(true)
        resizeHandle:Show()
    end
    lockTex:SetAlpha(0.75)
end

-- ============ 悬停检测 ============
local hoverWatcher = CreateFrame("Frame", nil, mainWindow)
hoverWatcher:Hide()
hoverWatcher:SetScript("OnUpdate", function(self, elapsed)
    self.timer = (self.timer or 0) + elapsed
    if self.timer < 0.1 then return end
    self.timer = 0
    if mainWindow:IsShown() and mainWindow:IsMouseOver() then
        if not lockBtn:IsShown() then UpdateLockVisual(); lockBtn:Show() end
    else
        if lockBtn:IsShown() and not lockBtn:IsMouseOver() then lockBtn:Hide() end
    end
end)
mainWindow:HookScript("OnShow", function() hoverWatcher:Show() end)
mainWindow:HookScript("OnHide", function() hoverWatcher:Hide() end)

-- ============ 隐藏/展开 按钮 ============
local toggleGuideBtn = CreateFrame("Button", nil, mainWindow)
toggleGuideBtn:SetSize(80, 20)
toggleGuideBtn:SetNormalFontObject("GameFontDisable")
toggleGuideBtn:SetHighlightFontObject("GameFontHighlight")
toggleGuideBtn:SetText("隐藏攻略")
toggleGuideBtn:SetScript("OnClick", function()
    mainWindow.isGuideHidden = true
    addon.manuallyHidden = true
    mainWindow:Hide()
end)

-- ============ 排版 ============
UpdateLayout = function()
    local left = mainWindow:GetLeft()
    local top = mainWindow:GetTop()
    if left and top then
        mainWindow:ClearAllPoints()
        mainWindow:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
    end
    local currentY = -40
    local db = BossTipsGlobalDB
    local windowWidth = mainWindow:GetWidth()
    local bgR, bgG, bgB, bgA = 0, 0, 0, 0.82
    if addon.GetTipsBg then bgR, bgG, bgB, bgA = addon.GetTipsBg() end
    mainWindow:SetBackdropColor(bgR, bgG, bgB, bgA)
    titleText:SetWidth(windowWidth - 20)

    if mainWindow.isGuideHidden then
        for i, frame in ipairs(targetFrames) do frame:Hide() end
        toggleGuideBtn:SetText("展开攻略")
        toggleGuideBtn:ClearAllPoints()
        toggleGuideBtn:SetPoint("TOP", titleText, "BOTTOM", 0, -5)
        toggleGuideBtn:Show()
        mainWindow:SetHeight(math.abs(-40 - 25))
    else
        toggleGuideBtn:SetText("隐藏攻略")
        local fontSize = db.FontSize or 14
        local fontPath = (GameFontNormal and GameFontNormal:GetFont()) or STANDARD_TEXT_FONT
        if addon.GetTipsFontPath then fontPath = addon.GetTipsFontPath() end
        for i, frame in ipairs(targetFrames) do
            if frame.inUse then
                frame:Show()
                frame:ClearAllPoints()
                frame:SetPoint("TOPLEFT", 10, currentY)
                frame:SetWidth(windowWidth - 20)
                frame.titleBtn:GetFontString():SetFont(fontPath, fontSize + 2, "OUTLINE")
                frame.noteText:SetFont(fontPath, fontSize, "")
                frame.noteText:SetWidth(windowWidth - 40)
                frame.noteText:SetText(frame.targetData.tips or "")
                if frame.isExpanded then
                    frame:SetAlpha(1.0)
                    if db.enableChatSend then
                        frame.speakerBtn:Show()
                        frame.speakerBtn:ClearAllPoints()
                        frame.speakerBtn:SetPoint("TOPLEFT", frame.titleBtn, "BOTTOMLEFT", 10, -5)
                        frame.noteText:ClearAllPoints()
                        frame.noteText:SetPoint("TOPLEFT", frame.speakerBtn, "TOPRIGHT", 4, 0)
                        frame.noteText:SetPoint("TOPRIGHT", frame.titleBtn, "BOTTOMRIGHT", -10, -5)
                        frame.noteText:SetWidth(windowWidth - 40 - 20)
                    else
                        frame.speakerBtn:Hide()
                        frame.noteText:ClearAllPoints()
                        frame.noteText:SetPoint("TOPLEFT", frame.titleBtn, "BOTTOMLEFT", 10, -5)
                        frame.noteText:SetPoint("TOPRIGHT", frame.titleBtn, "BOTTOMRIGHT", -10, -5)
                        frame.noteText:SetWidth(windowWidth - 40)
                    end
                    frame.noteText:Show()
                    frame.noteText:SetText(frame.targetData.tips or "")
                    local textHeight = frame.noteText:GetStringHeight()
                    if textHeight == 0 and frame.targetData.tips and frame.targetData.tips ~= "" then
                        textHeight = fontSize * 2
                    end
                    textHeight = math.max(textHeight, 16)
                    frame:SetHeight(30 + textHeight + 10)
                else
                    frame:SetAlpha(db.collapsedAlpha or 0.55)
                    frame.speakerBtn:Hide()
                    frame.noteText:Hide()
                    frame:SetHeight(30)
                end
                currentY = currentY - frame:GetHeight() - 5
            else
                frame:Hide()
            end
        end
        toggleGuideBtn:ClearAllPoints()
        toggleGuideBtn:SetPoint("TOP", mainWindow, "TOP", 0, currentY)
        toggleGuideBtn:Show()
        mainWindow:SetHeight(math.abs(currentY) + 25)
    end
end

mainWindow:SetScript("OnSizeChanged", function(self, width, height)
    if self.lastWidth ~= width then
        self.lastWidth = width
        C_Timer.After(0, function()
            if targetFrames[1] and targetFrames[1].inUse then UpdateLayout() end
        end)
    end
end)

-- ============ 显示实例攻略 ============
function addon:ShowWindow(instanceData) end  -- 占位（保持接口兼容）

function mainWindow:ShowInstanceGuide(instanceName, selectedBoss)
    addon.currentInstanceName = instanceName
    mainWindow.isGuideHidden = false
    if BossTipsGlobalDB.guideWindowWidth then
        mainWindow:SetWidth(BossTipsGlobalDB.guideWindowWidth)
    end
    if BossTipsGlobalDB.tipsFramePos then
        mainWindow:ClearAllPoints()
        mainWindow:SetPoint(
            BossTipsGlobalDB.tipsFramePos.point or "RIGHT",
            BossTipsGlobalDB.tipsFramePos.x or -150,
            BossTipsGlobalDB.tipsFramePos.y or 0
        )
    end
    titleText:SetText(instanceName)

    -- 重置在用状态
    for _, f in ipairs(targetFrames) do f.inUse = false end

    local BossData = addon.GetBossData()
    local instance = BossData and BossData[instanceName]
    if instance then
        -- 按 order 排序 boss 列表
        local sorted = {}
        for boss, entry in pairs(instance) do
            sorted[#sorted + 1] = { name = boss, tips = entry.tips, order = entry.order or 999 }
        end
        table.sort(sorted, function(a, b)
            if a.order ~= b.order then return a.order < b.order end
            return a.name < b.name
        end)
        for i, target in ipairs(sorted) do
            local frame = targetFrames[i]
            if not frame then
                frame = CreateFrame("Frame", nil, mainWindow)
                local btn = CreateFrame("Button", nil, frame)
                btn:SetPoint("TOPLEFT", 0, 0)
                btn:SetPoint("TOPRIGHT", 0, 0)
                btn:SetHeight(30)
                btn:SetNormalFontObject("GameFontNormal")
                btn:SetText(" ")
                btn:GetFontString():SetPoint("LEFT", 5, 0)
                frame.titleBtn = btn

                local speakerBtn = CreateFrame("Button", nil, frame)
                speakerBtn:SetSize(24, 24)
                speakerBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Up")
                speakerBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Down")
                speakerBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
                speakerBtn:SetScript("OnClick", function()
                    local tname = frame.targetData and frame.targetData.name
                    if tname and tname ~= "" then
                        if InCombatLockdown() then
                            print("|cffff0000BossTips|r 战斗中无法发送消息。")
                        else
                            addon.SendBossTips(tname)
                        end
                    end
                end)
                frame.speakerBtn = speakerBtn

                local note = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                note:SetJustifyH("LEFT")
                note:SetWordWrap(true)
                frame.noteText = note

                targetFrames[i] = frame
            end

            frame.targetData = target
            frame.inUse = true
            frame.isExpanded = (selectedBoss and target.name == selectedBoss) or (i == 1 and not selectedBoss)

            frame.titleBtn:SetScript("OnClick", function()
                if BossTipsGlobalDB.singleExpand then
                    local wasExpanded = frame.isExpanded
                    for _, f in ipairs(targetFrames) do f.isExpanded = false end
                    frame.isExpanded = not wasExpanded
                else
                    frame.isExpanded = not frame.isExpanded
                end
                UpdateLayout()
            end)
            frame.titleBtn:SetText("> " .. target.name)
        end
    end

    mainWindow:Show()
    UpdateLayout()
    UpdateLockVisual()
    if selectedBoss and addon.currentSelectedBoss then
        addon.currentSelectedBoss = selectedBoss
    end
end

function addon:HideWindow()
    mainWindow:Hide()
end

-- ============ 智能展开 ============
function addon:SmartExpandTarget(unitName, encounterId)
    if not mainWindow:IsShown() then return end
    local safeName = unitName and strlower(unitName) or ""
    for i, frame in ipairs(targetFrames) do
        if frame.inUse and frame.targetData then
            local tData = frame.targetData
            local matchFound = false
            if safeName ~= "" and tData.name and tData.name ~= "" then
                local n1 = strlower(tData.name)
                if string.find(n1, safeName, 1, true) or string.find(safeName, n1, 1, true) then
                    matchFound = true
                end
            end
            if matchFound then
                mainWindow.isGuideHidden = false
                if BossTipsGlobalDB.singleExpand then
                    if not frame.isExpanded then
                        for _, f in ipairs(targetFrames) do f.isExpanded = false end
                        frame.isExpanded = true
                        UpdateLayout()
                    end
                else
                    if not frame.isExpanded then frame.isExpanded = true; UpdateLayout() end
                end
                break
            end
        end
    end
end

-- ============ 窗口锁定 ============
function addon:UpdateWindowLock()
    local isLocked = BossTipsGlobalDB.lockWindow
    mainWindow:SetMovable(not isLocked)
    mainWindow:SetResizable(not isLocked)
    UpdateLockVisual()
end
