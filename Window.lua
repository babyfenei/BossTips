-- ============================================================================
-- BossTips Window.lua —— 攻略手风琴窗（对齐 DungeonCheatSheet 视觉/交互）
-- 数据来自 addon.ActiveGuides[instanceName][bossName] = { order, type, tips }
-- 交互：单展开 / 折叠透明度 / 锁定 / 缩放 / 底部隐藏-展开 / 小喇叭发聊天
-- ============================================================================
local addonName, addon = ...
local L = addon.L

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
-- 统一主题背景/边框，与悬浮按钮/设置框一致
if addon.ApplyThemeToFrame then addon.ApplyThemeToFrame(mainWindow) end
mainWindow:Hide()
addon.tipsFrame = mainWindow

-- 当前窗口的临时状态（不写入 SavedVariables）
mainWindow.showMobs = BossTipsGlobalDB.showMobs  -- 当前窗口是否显示小怪
mainWindow.difficulty = "mythicplus"             -- 当前显示难度（默认 M+；五人本进本自动 M+，团本自动普通）

local titleText = mainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", 0, -10)
titleText:SetTextColor(1.0, 1.0, 1.0)

local targetFrames = {}
local UpdateLayout

-- ============ 列表项图标（BOSS / 小怪）============
-- 使用简单 ASCII 字符，避免纹理在不同客户端显示为方框/问号
local ICON_PLUS = "|cffffcc00+|r"
local ICON_MINUS = "|cffffcc00-|r"
local ICON_PLUS_MOB = "|cff888888+|r"
local ICON_MINUS_MOB = "|cff888888-|r"

local function GetTitleText(name, isExpanded, etype)
    local prefix = isExpanded and ICON_MINUS or ICON_PLUS
    if etype == "MOB" then
        prefix = isExpanded and ICON_MINUS_MOB or ICON_PLUS_MOB
    end
    local color = (etype == "MOB") and "|cffaaaaaa" or "|cffffcc00"
    return prefix .. " " .. color .. (name or "") .. "|r"
end

-- 当前 WoW API（正式服）中 FontString 不支持 OnHyperlinkClick 脚本；
-- 用 pcall 探测，不支持时仅显示文本，不阻断整个窗口。
local function TrySetHyperlinkScripts(note)
    if not note then return false end
    local ok = pcall(function()
        note:SetScript("OnHyperlinkClick", function(_, link)
            if link and link:find("^spell:") and not IsModifiedClick("CHATLINK") then
                GameTooltip:SetOwner(note, "ANCHOR_CURSOR")
                GameTooltip:SetHyperlink(link)
                GameTooltip:Show()
            end
        end)
        note:SetScript("OnHyperlinkEnter", function(_, link)
            if link and link:find("^spell:") then
                GameTooltip:SetOwner(note, "ANCHOR_CURSOR")
                GameTooltip:SetHyperlink(link)
            end
        end)
        note:SetScript("OnHyperlinkLeave", function() GameTooltip:Hide() end)
    end)
    return ok
end

-- ============ 颜色代码规范化 ============
-- 支持两种写法：|cffRRGGBB（标准） 与 cffRRGGBB（用户旧数据缺少前导 |）
-- 并在每个 || 分段的末尾自动补 |r，防止颜色串污染下一行
local function NormalizeSegmentColor(seg)
    -- 给缺少 | 的 cff<hex> 加上 |
    seg = seg:gsub("([^|])([cC][fF][fF]%x%x%x%x%x%x)", "%1|%2")
    seg = seg:gsub("^([cC][fF][fF]%x%x%x%x%x%x)", "|%1")

    -- 遍历字符：统计未闭合的 |cff 块；把缺失 | 的 r 重置符也补成 |r
    local out = {}
    local open = 0
    local i = 1
    while i <= #seg do
        local s = seg:sub(i)
        if s:match("^|cff%x%x%x%x%x%x") then
            open = open + 1
            out[#out + 1] = seg:sub(i, i + 9)
            i = i + 10
        elseif s:match("^|r") then
            open = math.max(0, open - 1)
            out[#out + 1] = "|r"
            i = i + 2
        elseif s:match("^r") and open > 0 then
            -- 当前处于着色块内，单独的 r 视为颜色重置
            open = math.max(0, open - 1)
            out[#out + 1] = "|r"
            i = i + 1
        else
            out[#out + 1] = seg:sub(i, i)
            i = i + 1
        end
    end
    if open > 0 then out[#out + 1] = "|r" end
    return table.concat(out)
end

-- ============ 攻略文本格式化（删除 rt 表情，技能/必断着色） ============
-- 已移除 RT_COLORS：用户要求攻略框体不再显示 {rtN} 表情，仅保留技能着色
local function ColorSkill(skill)
    if skill:find("打断") or skill:find("必断") or skill:find("^断") or skill:find("^速断") then
        return "|cffff3333[" .. skill .. "]|r"
    end
    if skill:find("速杀") or skill:find("重点") or skill:find("关注") or skill:find("集火") or skill:find("优先") then
        return "|cffffcc00[" .. skill .. "]|r"
    end
    return "|cff33ff33[" .. skill .. "]|r"
end

local function FormatTips(text)
    if not text or text == "" then return "" end

    -- 第0步：作者简写 [技能名|spell:ID] -> 仅保留 [技能名] 并着色
    text = string.gsub(text, "%[([^%]%|]+)|spell:(%d+)%]", function(name)
        return "[" .. name .. "]"
    end)

    -- 第1步：抽取已有超链接 |H...|h...|h，避免被后续替换单 | 破坏
    local links = {}
    text = string.gsub(text, "(|H[^|]*|h.-|h)", function(h)
        links[#links + 1] = h
        return "\001" .. #links .. "\001"
    end)

    -- 第2步：BOSS 名（{rt8}...{rt8}）独占一行；后面紧跟的 | 视为换行
    text = string.gsub(text, "^{rt8}(.-){rt8}|", "%1\n")
    text = string.gsub(text, "^{rt8}(.-){rt8}", "%1\n")

    -- 第3步：|| 显式换行；其余单 | 视为段落内分隔，替换为空格
    --（| 在 FontString 中是转义字符，必须处理，否则会导致显示异常）
    text = string.gsub(text, "||", "\002")
    text = string.gsub(text, "|", " ")

    -- 第4步：{rt1}...{rt1} 视为「重点关注/打断」高亮块
    -- 注意：不使用 ★ / ◆ 等装饰符号，这些字形在 WoW 中文字体中缺失会显示为方块（乱码）。
    -- 改用纯文字标签「重点」，保证任何客户端都正常显示。
    text = string.gsub(text, "{rt1}(.-){rt1}", function(inner)
        return "|cffffcc00重点 " .. inner .. "|r"
    end)

    -- 第5步：删除其余 {rtN} / [rtN] 表情标记
    text = string.gsub(text, "{rt%d}", "")
    text = string.gsub(text, "%[rt%d%]", "")

    -- 第6步：自由文本中的「打断」标红
    -- 注意：仅匹配字面「打断」二字（本身是完整的多字节序列，gsub 整体捕获，字节安全）。
    -- 不使用 ([^%a])(断) 这类单字节捕获符去匹配中文「断」——Lua 5.1 正则按字节匹配，
    -- 单字节捕获会把「必」「连」等多字节汉字拆坏，导致下游汉字字节错位、显示成方块/乱码。
    -- 其余「必断/速断」等带括号的技能已由第7步 ColorSkill 着色。
    text = string.gsub(text, "打断([^%s%[%]|，。；：,;!！?？]+)", "|cffff3333打断%1|r")

    -- 第7步：[技能名] -> 着色（在自由文本 断 着色之后，避免重复匹配）
    text = string.gsub(text, "%[([^%]]+)%]", function(skill)
        return ColorSkill(skill)
    end)

    -- 第8步：还原 || 换行与超链接
    text = string.gsub(text, "\002", "\n")
    text = string.gsub(text, "\001(%d+)\001", function(n)
        return links[tonumber(n)] or ""
    end)

    -- 第9步：按 \n 分段，trim，规范化颜色
    local segments = { strsplit("\n", text) }
    local out = {}
    for _, seg in ipairs(segments) do
        seg = strtrim(seg)
        if seg ~= "" then
            seg = NormalizeSegmentColor(seg)
            table.insert(out, seg)
        end
    end
    return table.concat(out, "\n")
end
addon.FormatTips = FormatTips

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
local toggleGuideBtn = CreateFrame("Button", nil, mainWindow, "UIPanelButtonTemplate")
toggleGuideBtn:SetSize(90, 24)
toggleGuideBtn:SetText("隐藏攻略")
toggleGuideBtn:SetScript("OnClick", function()
    mainWindow.isGuideHidden = true
    addon.manuallyHidden = true
    mainWindow:Hide()
end)

-- ============ 难度选择按钮（循环切换） ============
local DIFFICULTY_ORDER = { "lfr", "normal", "heroic", "mythic", "mythicplus" }
local DIFFICULTY_LABELS = { lfr = "随机", normal = "普通", heroic = "英雄", mythic = "史诗", mythicplus = "史诗+" }
-- 团本没有 M+ 模式（M+ 仅大秘境），团本难度循环不含 mythicplus
local function IsCurrentRaid()
    local name = addon.currentInstanceName
    local meta = addon.GuideData and addon.GuideData.meta and name and addon.GuideData.meta[name]
    return meta and meta.isRaid or false
end
local function GetDiffOrder()
    -- 仅返回设置中“启用显示”的难度；团本不含史诗+
    return addon.GetEnabledDiffOrder(IsCurrentRaid())
end

-- 获取当前窗口应循环的难度列表：取「实例中至少有一个 BOSS 有攻略」的难度 与 「设置中启用」的交集。
local function GetWindowCycleDiffs()
    local instance = addon.currentInstanceName
    if not instance then return GetDiffOrder() end
    local BossData = addon.GetBossData()
    local inst = BossData and BossData[instance]
    if not inst then return GetDiffOrder() end

    local isRaid = IsCurrentRaid()
    local availMap = {}
    for boss, entry in pairs(inst) do
        local diffs = addon.GetBossAvailableDifficulties(instance, boss, isRaid)
        for _, d in ipairs(diffs) do availMap[d] = true end
    end

    local order = GetDiffOrder()
    local out = {}
    for _, k in ipairs(order) do
        if availMap[k] then out[#out + 1] = k end
    end
    if #out == 0 then
        -- 当前实例没有任何难度有攻略时回退到启用列表，避免按钮空白
        return order
    end
    return out
end

-- 难度按钮标签：不再显示「通用」（通用攻略已并入随机/普通等真实难度）
local function GetDiffButtonLabel(diffKey)
    return DIFFICULTY_LABELS[diffKey] or "普通"
end

local diffBtn = CreateFrame("Button", nil, mainWindow, "UIPanelButtonTemplate")
diffBtn:SetSize(80, 24)
diffBtn:SetScript("OnClick", function()
    local order = GetWindowCycleDiffs()
    local cur = mainWindow.difficulty
    if not cur or not tContains(order, cur) then cur = order[1] or "normal" end
    local idx = 1
    for i, v in ipairs(order) do if v == cur then idx = i; break end end
    mainWindow.difficulty = order[(idx % #order) + 1]
    diffBtn:SetText("难度: " .. GetDiffButtonLabel(mainWindow.difficulty))
    if addon.currentInstanceName then
        addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
    end
end)

-- ============ 小怪显示切换按钮（仅影响当前窗口） ============
local mobBtn = CreateFrame("Button", nil, mainWindow, "UIPanelButtonTemplate")
mobBtn:SetSize(80, 24)
mobBtn:SetScript("OnClick", function()
    mainWindow.showMobs = not mainWindow.showMobs
    mobBtn:SetText(mainWindow.showMobs and "隐藏小怪" or "显示小怪")
    if addon.currentInstanceName then
        addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
    end
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
    -- 刷新主题背景/边框（ACE3/官方默认）
    if addon.ApplyThemeToFrame then addon.ApplyThemeToFrame(mainWindow) end
    titleText:SetWidth(windowWidth - 20)

    if mainWindow.isGuideHidden then
        for i, frame in ipairs(targetFrames) do frame:Hide() end
        toggleGuideBtn:SetText("展开攻略")
        toggleGuideBtn:ClearAllPoints()
        toggleGuideBtn:SetPoint("TOP", titleText, "BOTTOM", 0, -5)
        toggleGuideBtn:Show()
        diffBtn:Hide()
        mobBtn:Hide()
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
                frame.noteText:SetText(FormatTips(frame.targetData.tips or ""))
                frame.titleBtn:SetText(GetTitleText(frame.targetData.name, frame.isExpanded, frame.targetData.type))
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
                    frame.noteText:SetText(FormatTips(frame.targetData.tips or ""))
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
        toggleGuideBtn:SetPoint("TOP", mainWindow, "TOP", -45, currentY)
        toggleGuideBtn:Show()

        mobBtn:SetText(mainWindow.showMobs and "隐藏小怪" or "显示小怪")
        mobBtn:ClearAllPoints()
        mobBtn:SetPoint("TOP", mainWindow, "TOP", 45, currentY)
        mobBtn:Show()

        diffBtn:SetText("难度: " .. GetDiffButtonLabel(mainWindow.difficulty))
        diffBtn:ClearAllPoints()
        diffBtn:SetPoint("TOPRIGHT", mainWindow, "TOPRIGHT", -10, -10)
        diffBtn:Show()

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

-- 重置攻略窗口位置：默认位于主按钮正下方并左对齐
function addon.ResetTipsFramePos()
    BossTipsGlobalDB.tipsFramePos = nil
    mainWindow:ClearAllPoints()
    if addon.mainButton then
        mainWindow:SetPoint("TOPLEFT", addon.mainButton, "BOTTOMLEFT", 0, -5)
    else
        mainWindow:SetPoint("RIGHT", UIParent, "RIGHT", -150, 0)
    end
end

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
    elseif addon.mainButton then
        mainWindow:ClearAllPoints()
        mainWindow:SetPoint("TOPLEFT", addon.mainButton, "BOTTOMLEFT", 0, -5)
    end
    titleText:SetText(instanceName)

    -- 重置在用状态
    for _, f in ipairs(targetFrames) do f.inUse = false end

    local BossData = addon.GetBossData()
    local instance = BossData and BossData[instanceName]
    if instance then
        -- 按 order 排序 boss 列表（保留 entry，便于后面按难度取 tips）
        local isRaid = IsCurrentRaid()
        local sortedBosses = {}
        for boss, entry in pairs(instance) do
            local etype = entry.type or "BOSS"
            if etype ~= "MOB" or mainWindow.showMobs then
                sortedBosses[#sortedBosses + 1] = { name = boss, entry = entry, order = entry.order or 999, type = etype }
            end
        end
        table.sort(sortedBosses, function(a, b)
            if a.order ~= b.order then return a.order < b.order end
            return a.name < b.name
        end)

        -- 确定上下文 BOSS（选中或第一个），用于难度标签判断
        local contextBoss = nil
        if selectedBoss then
            for _, t in ipairs(sortedBosses) do
                if t.name == selectedBoss then contextBoss = t; break end
            end
        end
        if not contextBoss then contextBoss = sortedBosses[1] end
        mainWindow.contextBossName = contextBoss and contextBoss.name or nil

        -- 计算当前实例可用的难度（至少一个 BOSS 有攻略 且 设置中启用）
        local availDiffs = GetWindowCycleDiffs()
        mainWindow.availableDifficulties = availDiffs

        -- 若当前难度不在可用列表中，回退到第一个可用难度
        local diff = mainWindow.difficulty
        if not diff or not tContains(availDiffs, diff) then
            diff = availDiffs[1] or addon.GetFirstEnabledDifficulty(isRaid)
            mainWindow.difficulty = diff
        end
        if isRaid and diff == "mythicplus" then diff = "normal" end

        -- 按当前难度取出每个 BOSS 的 tips（MOB 仍用外层 tips）
        local sorted = {}
        for _, t in ipairs(sortedBosses) do
            local entry = t.entry
            local tips = addon.GetTipsForDifficulty(entry, diff)
            sorted[#sorted + 1] = { name = t.name, tips = tips, order = t.order, type = t.type }
        end
        -- 隐藏多余的旧 frame
        for j = #sorted + 1, #targetFrames do targetFrames[j].inUse = false end
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
                -- 必须显式注册右键，否则 OnClick 只响应左键，右键发送不到 /say
                speakerBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                frame.speakerBtn = speakerBtn

                local note = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                note:SetJustifyH("LEFT")
                note:SetWordWrap(true)
                -- 部分 WoW API 中 FontString 不支持超链接脚本；探测后 gracefully 降级
                if note.SetHyperlinksEnabled then note:SetHyperlinksEnabled(true) end
                TrySetHyperlinkScripts(note)
                frame.noteText = note

                targetFrames[i] = frame
            end

            -- 每次显示副本攻略都重新绑定 speakerBtn，避免之前测试窗口复用 frame 时把它改成 SendTestTipsToChat
            frame.speakerBtn:SetScript("OnClick", function(_, button)
                local tname = frame.targetData and frame.targetData.name
                if tname and tname ~= "" then
                    if InCombatLockdown() then
                        print("|cffff0000BossTips|r 战斗中无法发送消息。")
                    else
                        -- button 为第二参数（"LeftButton"/"RightButton"）；左键用设定频道，右键用右键频道
                        local ch = (button == "RightButton")
                            and (BossTipsGlobalDB.sendChannelRight or "SAY")
                            or (BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
                        addon.SendBossTips(tname, ch)
                    end
                end
            end)
            frame.speakerBtn:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText("发送攻略")
                GameTooltip:AddLine("左键：发送到 " .. addon.ChannelLabel(BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT"), 1, 1, 1)
                GameTooltip:AddLine("右键：发送到 " .. addon.ChannelLabel(BossTipsGlobalDB.sendChannelRight or "SAY"), 1, 1, 1)
                GameTooltip:Show()
            end)
            frame.speakerBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

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
            frame.titleBtn:SetText(GetTitleText(target.name, frame.isExpanded, target.type))
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

-- ============ 测试窗口 ============
local testInstanceName = "测试窗口"
-- 测试文本：包含所有角色共有的通用技能（炉石 spell:6948），验证可点击技能链接
local TEST_TIPS = "{rt8}示例目标{rt8}||这是测试窗口的示例攻略文本。||[炉石|spell:6948]：所有角色共有的通用技能，点击/悬停可查看技能说明。||必断示例：[打断] 技能会标红；速杀示例：[集火] 技能会标金。||拖动标题栏可移动窗口，右下角可缩放；点小喇叭把本攻略发到聊天。"
local function SendTestTipsToChat(channelOverride)
    if InCombatLockdown() then
        print("|cffff0000BossTips|r 战斗中无法发送消息。")
        return
    end
    local chatType = addon.ResolveSendChannel(channelOverride or BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
    local segs = { strsplit("||", TEST_TIPS) }
    for _, seg in ipairs(segs) do
        seg = strtrim(seg)
        if seg ~= "" then
            seg = addon.ColorChatTips and addon.ColorChatTips(seg) or seg
            SendChatMessage(seg, chatType)
        end
    end
    print("|cFF00FF00BossTips|r 已发送测试攻略到 " .. chatType)
end

function addon.ShowTestWindow()
    mainWindow.isGuideHidden = false
    titleText:SetText(L["Show Test Window"] or "测试窗口")
    for _, f in ipairs(targetFrames) do f.inUse = false end
    local frame = targetFrames[1]
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
        -- 必须显式注册右键，否则 OnClick 只响应左键，右键发送不到 /say
        speakerBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        frame.speakerBtn = speakerBtn
        local note = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        note:SetJustifyH("LEFT")
        note:SetWordWrap(true)
        if note.SetHyperlinksEnabled then note:SetHyperlinksEnabled(true) end
        TrySetHyperlinkScripts(note)
        frame.noteText = note
        targetFrames[1] = frame
    end
    frame.targetData = { name = "示例目标", type = "BOSS", tips = TEST_TIPS }
    frame.inUse = true
    frame.isExpanded = true
    frame.titleBtn:SetScript("OnClick", function() end)
    frame.speakerBtn:SetScript("OnClick", function(_, button)
        if InCombatLockdown() then
            print("|cffff0000BossTips|r 战斗中无法发送消息。")
        else
            local ch = (button == "RightButton")
                and (BossTipsGlobalDB.sendChannelRight or "SAY")
                or (BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
            SendTestTipsToChat(ch)
        end
    end)
    frame.speakerBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("发送攻略")
        GameTooltip:AddLine("左键：发送到 " .. addon.ChannelLabel(BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT"), 1, 1, 1)
        GameTooltip:AddLine("右键：发送到 " .. addon.ChannelLabel(BossTipsGlobalDB.sendChannelRight or "SAY"), 1, 1, 1)
        GameTooltip:Show()
    end)
    frame.speakerBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
    mainWindow:Show()
    UpdateLayout()
    UpdateLockVisual()
end

function addon.HideTestWindow()
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
