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
        -- 保存当前 top/bottom y（独立于 tipsFramePos.point 的 anchor 类型），
        -- 供 UpdateLayout 在「切换难度/内容长度变化」时保持固定延展方向，不让框体上下抖动
        BossTipsGlobalDB.guideFrameTopY = self:GetTop()
        BossTipsGlobalDB.guideFrameBottomY = self:GetBottom()
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
mainWindow.difficulty = BossTipsGlobalDB.defaultDifficulty or "mythic"  -- 当前显示难度（初始化用持久化默认难度，进本时由 CheckInstance 按副本解析）
-- 展开状态权威表：按「当前副本 + 源 boss key」记录哪些目标处于展开。
-- 用源 key（简中稳定名）而非本地化显示名做键，切语言/切难度/切小怪后仍能精确恢复展开项，
-- 避免「展开第 3/4 条后一切换又跳回第 1 条」。
mainWindow.expandedKeys = mainWindow.expandedKeys or {}

local titleText = mainWindow:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", 0, -10)
titleText:SetTextColor(1.0, 1.0, 1.0)

local targetFrames = {}
local UpdateLayout

-- ============ 聊天发送（SecureActionButton 宏方式）============
-- 暴雪在大秘境/战斗中禁止插件用 SendChatMessage（tainted 闭包调用受保护函数会 ADDON_ACTION_BLOCKED）。
-- 解决方案：发送按钮改为 SecureActionButton(type="macro")，点击是「硬件事件」，宏执行被授权，
-- 战斗中/大秘境均可发，且一次宏执行发完所有分段、无逐条延迟。超长攻略超出宏上限(约1024字)的
-- 部分，点击后由 OnPostClick 在脱战时补发，战斗中则入队、PLAYER_REGEN_ENABLED 时补发。
local CHAT_SLASH = {
    INSTANCE_CHAT = "/instance", SAY = "/say", PARTY = "/party", RAID = "/raid",
    YELL = "/yell", GUILD = "/guild", CHANNEL = "/say",
}
-- 把分段拼成多行宏文本；超过 maxLen 的部分作为 remainder 返回（需点击后补发）。
local function BuildMacroText(parts, chatType, maxLen)
    maxLen = maxLen or 1000
    local slash = CHAT_SLASH[chatType] or "/say"
    local lines, used, remainder = {}, 0, {}
    for _, p in ipairs(parts) do
        -- 转义宏条件括号：聊天文本里的 [断-X]/[技-X]/[重-X] 等若处于行首，会被宏解析器当作
        -- 无效条件子句而将「整行丢弃」（静默不发）。改为 ( ) 后不再是条件，逐行正常发送。
        local safe = p:gsub("%[", "("):gsub("%]", ")")
        local line = slash .. " " .. safe
        if used + #line + 1 <= maxLen then
            lines[#lines + 1] = line
            used = used + #line + 1
        else
            remainder[#remainder + 1] = safe
        end
    end
    return table.concat(lines, "\n"), remainder
end
-- 战斗结束补发队列
local pendingSends = {}
function addon.QueueRemainingSend(parts, chatType)
    pendingSends[#pendingSends + 1] = { parts = parts, chatType = chatType }
end
local regenFrame = CreateFrame("Frame")
regenFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
regenFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED" then
        for _, item in ipairs(pendingSends) do
            for _, p in ipairs(item.parts) do pcall(SendChatMessage, p, item.chatType) end
        end
        pendingSends = {}
    end
end)

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
        return L["Focus "] .. inner .. "|r"
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
    print("|cff00ff00BossTips|r " .. (BossTipsGlobalDB.lockWindow and L["Window locked"] or L["Window unlocked"]))
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
toggleGuideBtn:SetText(L["Hide Guide"])
toggleGuideBtn:SetScript("OnClick", function()
    mainWindow.isGuideHidden = true
    addon.manuallyHidden = true
    mainWindow:Hide()
end)

-- ============ 难度选择按钮（循环切换） ============
local DIFFICULTY_ORDER = { "lfr", "normal", "heroic", "mythic", "mythicplus" }
local function GetDifficultyLabel(key)
    local map = { lfr = "LFR", normal = "Normal", heroic = "Heroic", mythic = "Mythic", mythicplus = "Mythic Plus Short" }
    return L[map[key]] or key
end
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
    return GetDifficultyLabel(diffKey) or L["Normal"]
end

-- 取当前窗口中「已展开」的目标显示名（用于切换难度/小怪时保持展开同一目标，避免跳回第一个）
local function GetExpandedBossName()
    for _, f in ipairs(targetFrames) do
        if f.inUse and f.isExpanded and f.targetData then
            return f.targetData.name
        end
    end
    return nil
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
    -- 持久化：手动切换难度写回默认难度，下次进任何副本都沿用（也同步设置面板的「默认难度」）
    BossTipsGlobalDB.defaultDifficulty = mainWindow.difficulty
    diffBtn:SetText(GetDiffButtonLabel(mainWindow.difficulty))
    if addon.currentInstanceName then
        -- 切换难度时保留当前展开的目标，不再跳回第一个 BOSS
        addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName, GetExpandedBossName())
    end
end)

-- ============ 小怪显示切换按钮（仅影响当前窗口） ============
local mobBtn = CreateFrame("Button", nil, mainWindow, "UIPanelButtonTemplate")
mobBtn:SetSize(80, 24)
mobBtn:SetScript("OnClick", function()
    mainWindow.showMobs = not mainWindow.showMobs
    mobBtn:SetText(mainWindow.showMobs and L["Hide Mobs"] or L["Show Mobs"])
    if addon.currentInstanceName then
        -- 切换小怪显示时同样保留当前展开的目标
        addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName, GetExpandedBossName())
    end
end)

-- ============ 排版 ============
UpdateLayout = function()
    -- 攻略框体延展方向：默认「向下」（向屏幕下方延展）；
    -- 可在设置中切换为「向上」（向屏幕上方延展，框体贴底时有用）。
    -- 通过锚点固定实现：向下→TOPLEFT（高度增加时 BOTTOM 自然下移）；
    -- 向上→BOTTOMLEFT（高度增加时 TOP 自然上移）。两种模式都不会上下抖动。
    --
    -- 关键：使用拖动时保存的 guideFrameTopY/guideFrameBottomY 作锚点（与当前内容高度无关），
    -- 避免切换难度时 GetTop() 跟着高度变化导致顶部/底部「上下抖」。
    local expandDir = BossTipsGlobalDB and BossTipsGlobalDB.guideExpandDir or "down"
    local left = mainWindow:GetLeft()
    local top = mainWindow:GetTop()
    local bottom = mainWindow:GetBottom()
    -- 优先使用拖动时保存的「稳定」锚点 y（与内容高度无关）
    local desiredTop = top
    local desiredBottom = bottom
    if BossTipsGlobalDB then
        if BossTipsGlobalDB.guideFrameTopY then desiredTop = BossTipsGlobalDB.guideFrameTopY end
        if BossTipsGlobalDB.guideFrameBottomY then desiredBottom = BossTipsGlobalDB.guideFrameBottomY end
    end
    mainWindow:ClearAllPoints()
    if expandDir == "up" and desiredBottom then
        mainWindow:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left or 0, desiredBottom)
    else
        mainWindow:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left or 0, desiredTop or 0)
    end
    local currentY = -40
    local db = BossTipsGlobalDB
    local windowWidth = mainWindow:GetWidth()
    -- 刷新主题背景/边框（ACE3/官方默认）
    if addon.ApplyThemeToFrame then addon.ApplyThemeToFrame(mainWindow) end
    titleText:SetWidth(windowWidth - 20)

    if mainWindow.isGuideHidden then
        for i, frame in ipairs(targetFrames) do frame:Hide() end
        toggleGuideBtn:SetText(L["Show Guide"])
        toggleGuideBtn:ClearAllPoints()
        toggleGuideBtn:SetPoint("TOP", titleText, "BOTTOM", 0, -5)
        toggleGuideBtn:Show()
        diffBtn:Hide()
        mobBtn:Hide()
        mainWindow:SetHeight(math.abs(-40 - 25))
    else
        toggleGuideBtn:SetText(L["Hide Guide"])
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
                    local formatted = FormatTips(frame.targetData.tips or "")
                    frame.noteText:SetText(formatted)
                    local textHeight = frame.noteText:GetStringHeight()
                    if (not textHeight or textHeight <= 0) and formatted ~= "" then
                        -- GetStringHeight 尚未结算（首帧布局未刷新）时回退：按行数估算，
                        -- 避免长攻略被截断成 2 行（旧逻辑用 fontSize*2 固定高度会裁掉内容）。
                        local lines = 1
                        for _ in string.gmatch(formatted, "\n") do lines = lines + 1 end
                        textHeight = lines * (fontSize + 4) + 4
                    end
                    textHeight = math.max(textHeight or 0, 16)
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

        mobBtn:SetText(mainWindow.showMobs and L["Hide Mobs"] or L["Show Mobs"])
        mobBtn:ClearAllPoints()
        mobBtn:SetPoint("TOP", mainWindow, "TOP", 45, currentY)
        mobBtn:Show()

        diffBtn:SetText(GetDiffButtonLabel(mainWindow.difficulty))
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
    local BossDataForTitle = addon.GetBossData()
    local instanceForTitle = BossDataForTitle and BossDataForTitle[instanceName]
    titleText:SetText(addon.GetLocalizedInstanceName(
        instanceName,
        instanceForTitle and instanceForTitle._src and instanceForTitle._src.type,
        instanceForTitle and instanceForTitle._src and instanceForTitle._src.ver
    ))

    -- 重置在用状态
    for _, f in ipairs(targetFrames) do f.inUse = false end

    local BossData = addon.GetBossData()
    local instance = BossData and BossData[instanceName]
    if instance then
        -- 按 order 排序 boss 列表（保留 entry，便于后面按难度取 tips）
        local isRaid = IsCurrentRaid()
        local sortedBosses = {}
        for boss, entry in pairs(instance) do
            -- _src 是内部元数据（记录来源版本/类型），不是 BOSS/MOB 条目，不能显示在攻略窗
            if boss == "_src" then
                -- 保留元数据供后续 GetLocalizedBossName 使用，但不加入排序列表
            else
                local etype = entry.type or "BOSS"
                if etype ~= "MOB" or mainWindow.showMobs then
                    local displayName = (addon.GetLocalizedBossName and addon.GetLocalizedBossName(instanceName, boss, isRaid, entry._src and entry._src.ver)) or entry.name or boss
                    sortedBosses[#sortedBosses + 1] = { name = displayName, entry = entry, order = entry.order or 999, type = etype }
                end
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
        -- 同时保留「源 key」（entry._src.boss，简体中），供聊天发送时按源 key 查找 BossData，
        -- 避免用本地化显示名（繁中/英文）作为 key 查找时失败。
        local sorted = {}
        for _, t in ipairs(sortedBosses) do
            local entry = t.entry
            local tips = addon.GetGuideText(entry, diff)
            local srcKey = (entry._src and entry._src.boss) or t.bossKey
            sorted[#sorted + 1] = { name = t.name, bossKey = srcKey, tips = tips, order = t.order, type = t.type }
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
                -- 直接发送：点击即发、无延迟；SendChatMessage 在战斗中可用，故战斗中也可即时发送攻略（不再拦截 InCombatLockdown）。
                -- 左键=设定频道(defaultChatChannel)，右键=右键频道(sendChannelRight)。
                speakerBtn:SetScript("OnClick", function(_, button)
                    local tdata = frame.targetData
                    local tname = tdata and (tdata.bossKey or tdata.name)
                    if tname and tname ~= "" then
                        -- 注意：SendChatMessage 在战斗中可用（战斗只限制安全按钮/受保护 API，不限制聊天），
                        -- 因此不拦截 InCombatLockdown，保证副本/团本战斗中也能即时发送攻略。
                        local ch = (button == "RightButton")
                            and (BossTipsGlobalDB.sendChannelRight or "SAY")
                            or (BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
                        addon.SendBossTips(tname, ch)
                    end
                end)

                local note = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
                note:SetJustifyH("LEFT")
                note:SetWordWrap(true)
                -- 部分 WoW API 中 FontString 不支持超链接脚本；探测后 gracefully 降级
                if note.SetHyperlinksEnabled then note:SetHyperlinksEnabled(true) end
                TrySetHyperlinkScripts(note)
                frame.noteText = note

                targetFrames[i] = frame
            end

            -- 喇叭按钮的 OnClick 已在创建时绑定为「直接发送」(addon.SendBossTips)，无需每次显示重设。
            -- 点击即发、无延迟；SendChatMessage 在战斗中可用，故不再拦截 InCombatLockdown。
            frame.speakerBtn:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L["Send Guide"])
                GameTooltip:AddLine(L["Left: send to "] .. addon.ChannelLabel(BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT"), 1, 1, 1)
                GameTooltip:AddLine(L["Right: send to "] .. addon.ChannelLabel(BossTipsGlobalDB.sendChannelRight or "SAY"), 1, 1, 1)
                GameTooltip:Show()
            end)
            frame.speakerBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

            frame.targetData = target
            frame.inUse = true
            -- 展开状态权威键：副本 + 源 boss key（简中稳定名），切语言/难度/小怪后仍能精确恢复。
            local expKey = instanceName .. "\001" .. tostring(target.bossKey or target.name)
            frame.expKey = expKey
            -- 恢复展开：优先按「持久展开集合」；其次 selectedBoss（外部传入，如智能展开）；
            -- 默认（首次进副本、无任何展开记录且未指定）展开第一条。
            local isExpanded = mainWindow.expandedKeys[expKey] == true
            if selectedBoss and target.name == selectedBoss then isExpanded = true end
            if not selectedBoss and next(mainWindow.expandedKeys) == nil then
                isExpanded = (i == 1)
            end
            frame.isExpanded = isExpanded
            mainWindow.expandedKeys[expKey] = isExpanded or nil

            frame.titleBtn:SetScript("OnClick", function()
                if BossTipsGlobalDB.singleExpand then
                    local wasExpanded = frame.isExpanded
                    for _, f in ipairs(targetFrames) do
                        f.isExpanded = false
                        if f.expKey then mainWindow.expandedKeys[f.expKey] = nil end
                    end
                    frame.isExpanded = not wasExpanded
                else
                    frame.isExpanded = not frame.isExpanded
                end
                mainWindow.expandedKeys[expKey] = frame.isExpanded or nil
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
local testInstanceName = L["Test Window"]
-- 测试文本：包含所有角色共有的通用技能（炉石 spell:6948），验证可点击技能链接
-- 注意：不再在模块加载时捕获 TEST_TIPS，改为在 ShowTestWindow / SendTestTipsToChat
-- 调用时实时取 L["TestWindowSampleTips"]，使切换语言后测试窗能立即显示对应译文。
local function SendTestTipsToChat(channelOverride)
    -- SendChatMessage 在战斗中可用，故不在战斗中拦截（与真实攻略窗行为一致）。
    local chatType = addon.ResolveSendChannel(channelOverride or BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
    local segs = { strsplit("||", L["TestWindowSampleTips"]) }
    for _, seg in ipairs(segs) do
        seg = strtrim(seg)
        if seg ~= "" then
            seg = addon.ColorChatTips and addon.ColorChatTips(seg) or seg
            SendChatMessage(seg, chatType)
        end
    end
    print(L["|cFF00FF00BossTips|r sent test guide to "] .. chatType)
end

function addon.ShowTestWindow()
    mainWindow.isGuideHidden = false
    titleText:SetText(L["Show Test Window"] or L["Test Window"])
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
    frame.targetData = { name = L["Sample Target"], type = "BOSS", tips = L["TestWindowSampleTips"] }
    frame.inUse = true
    frame.isExpanded = true
    frame.titleBtn:SetScript("OnClick", function() end)
    frame.speakerBtn:SetScript("OnClick", function(_, button)
        local ch = (button == "RightButton")
            and (BossTipsGlobalDB.sendChannelRight or "SAY")
            or (BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT")
        SendTestTipsToChat(ch)
    end)
    frame.speakerBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Send Guide"])
        GameTooltip:AddLine(L["Left: send to "] .. addon.ChannelLabel(BossTipsGlobalDB.defaultChatChannel or "INSTANCE_CHAT"), 1, 1, 1)
        GameTooltip:AddLine(L["Right: send to "] .. addon.ChannelLabel(BossTipsGlobalDB.sendChannelRight or "SAY"), 1, 1, 1)
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
