-- ============================================================================
-- BossTips Core.lua —— 主逻辑（对齐 DungeonCheatSheet 架构）
-- 事件、LibDBIcon 小地图按钮、进本自动弹窗/按钮模式、CheckInstance 匹配、各 UI 入口。
-- ============================================================================
local addonName, addon = ...
local L = addon.L

addon.version = "1.4.4"
addon.currentInstanceName = nil
addon.currentSelectedBoss = nil
addon.manuallyHidden = false
addon.lastAutoShownInstance = nil
addon.debugMatch = false
addon.tipsFrame = nil
addon.mainButton = nil
addon.settingsFrame = nil
addon.editorFrame = nil

-- ============ 状态工具 ============
local function HasCurrentMapGuide()
    local bossData = addon.GetBossData()
    return bossData and addon.currentInstanceName and bossData[addon.currentInstanceName] ~= nil
end
addon.HasCurrentMapGuide = HasCurrentMapGuide

local function RefreshGuides()
    addon.BuildActiveGuides()
    if addon.BuildGuideOptions then addon.BuildGuideOptions() end
    if addon.UpdateMainButtonVisibility then addon.UpdateMainButtonVisibility() end
end
addon.RefreshGuides = RefreshGuides

-- ============ 创建悬浮按钮（按钮模式） ============
local function CreateMainButton()
    if addon.mainButton then return addon.mainButton end
    local btn = CreateFrame("Button", "BossTipsMainButton", UIParent, "BackdropTemplate")
    btn:SetSize(96, 30)
    -- 层级置于系统 UI 之下：LOW 在 BACKGROUND 之上、MEDIUM/HIGH 系统框体之下，
    -- 避免悬浮按钮遮挡系统面板/菜单/下拉框。
    btn:SetFrameStrata("LOW")
    local pos = BossTipsGlobalDB.mainButtonPos or { point = "TOPLEFT", relativePoint = "TOPLEFT", xOffset = 20, yOffset = -50 }
    btn:SetPoint(pos.point or "TOPLEFT", UIParent, pos.relativePoint or "TOPLEFT", pos.xOffset or 20, pos.yOffset or -50)
    btn:SetMovable(true)
    btn:EnableMouse(true)

    -- 统一主题边框/背景，与攻略窗体/设置框一致
    if addon.ApplyThemeToFrame then addon.ApplyThemeToFrame(btn) end

    local fs = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    fs:SetPoint("CENTER", 0, 0)
    fs:SetText("|cffffffffBossTips|r")
    btn:SetFontString(fs)

    -- 鼠标悬停高亮（Ace3 中性灰边框）
    btn:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(0.7, 0.7, 0.7, 1.0)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("BossTips")
        GameTooltip:AddLine(L["Floating Left Click"] or "左键：打开/关闭攻略框体（非副本时显示测试窗口）", 1, 1, 1)
        GameTooltip:AddLine(L["Floating Right Click"] or "右键：打开/关闭设置面板", 1, 1, 1)
        GameTooltip:AddLine(L["Floating Drag"] or "拖拽：按住左键拖动按钮位置", 0.8, 0.8, 0.8)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.4, 0.4, 0.4, 1.0)
        GameTooltip:Hide()
    end)

    -- 左键拖拽 + 点击识别；右键打开设置
    local dragStartX, dragStartY
    btn:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            dragStartX, dragStartY = GetCursorPosition()
            self:StartMoving()
        end
    end)
    btn:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            self:StopMovingOrSizing()
            local x, y = GetCursorPosition()
            local moved = math.abs(x - (dragStartX or 0)) + math.abs(y - (dragStartY or 0))
            -- 保存位置
            local p, _, rp, xOfs, yOfs = self:GetPoint()
            BossTipsGlobalDB.mainButtonPos = { point = p, relativePoint = rp, xOffset = xOfs, yOffset = yOfs }
                -- 位移很小视为点击（小幅拖动容错）
                if moved < 10 then
                    if InCombatLockdown() then
                        print("|cffff0000BossTips|r 战斗中无法切换攻略窗。")
                        return
                    end
                    -- 左键：始终切换攻略框体（非副本时显示测试窗口）
                    if addon.tipsFrame:IsShown() then
                        addon.tipsFrame:Hide()
                        addon.manuallyHidden = true
                    else
                        addon.manuallyHidden = false
                        local ok, err
                        if addon.currentInstanceName and HasCurrentMapGuide() then
                            ok, err = pcall(function()
                                addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                            end)
                        else
                            ok, err = pcall(function()
                                addon.ShowTestWindow()
                            end)
                        end
                        if not ok then
                            print("|cffff0000BossTips|r 显示攻略窗出错: " .. tostring(err))
                            print("|cffff0000BossTips|r 请把上面错误复制反馈；已为你打开攻略编辑器。")
                            addon:OpenEditor()
                        end
                    end
                end
            elseif button == "RightButton" then
                if not InCombatLockdown() then
                    addon:OpenMainGUI()
                else
                    print("|cffff0000BossTips|r 战斗中无法打开设置面板。")
                end
            end
    end)

    addon.mainButton = btn
    return btn
end
addon.CreateMainButton = CreateMainButton

local function UpdateMainButtonVisibility()
    local btn = addon.mainButton
    if not btn then return end
    -- 始终显示悬浮按钮，保证玩家始终有可见入口（auto 模式下进本自动弹窗依旧生效）
    btn:Show()
end
addon.UpdateMainButtonVisibility = UpdateMainButtonVisibility

local function UpdateMainButtonAppearance()
    local btn = addon.mainButton
    if not btn then return end
    if addon.ApplyThemeToFrame then
        addon.ApplyThemeToFrame(btn)
    else
        local br, bg, bb, ba = 0, 0, 0, 0.82
        if addon.GetTipsBg then br, bg, bb, ba = addon.GetTipsBg() end
        btn:SetBackdropColor(br, bg, bb, ba)
        btn:SetBackdropBorderColor(0.4, 0.4, 0.4, 1.0)
    end
end
addon.UpdateMainButtonAppearance = UpdateMainButtonAppearance

-- ============ 选中/智能展开 ============
local function SelectBossAndShow(bossName)
    if not bossName or not addon.currentInstanceName or not addon.tipsFrame then return end
    local BossData = addon.GetBossData()
    if not BossData or not BossData[addon.currentInstanceName] or not BossData[addon.currentInstanceName][bossName] then return end
    addon.currentSelectedBoss = bossName
    addon.manuallyHidden = false
    if addon.tipsFrame.ShowInstanceGuide then addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName, bossName) end
end
addon.SelectBossAndShow = SelectBossAndShow

local function SmartExpandBoss(name)
    if not BossTipsGlobalDB.autoExpandOnTarget then return end
    if addon.manuallyHidden then return end
    if BossTipsGlobalDB.guideWindowMode == "button" then return end
    if not addon.currentInstanceName then return end
    if not name or name == "" then return end
    local BossData = addon.GetBossData()
    if not BossData or not BossData[addon.currentInstanceName] then return end
    local match = nil
    for boss in pairs(BossData[addon.currentInstanceName]) do
        if boss == name then match = boss; break end
    end
    if not match then
        name = name:gsub("%s*%-%s*", "")
        for boss in pairs(BossData[addon.currentInstanceName]) do
            local short = boss:gsub("%s*%-%s*", "")
            if short == name or boss:find(name, 1, true) or name:find(boss, 1, true) then
                match = boss; break
            end
        end
    end
    if match then SelectBossAndShow(match) end
end
addon.SmartExpandBoss = SmartExpandBoss

-- ============ 按 encounterId 智能展开（团本可靠命中，无需依赖国服名匹配） ============
local function SmartExpandByEncounterId(encId)
    if not BossTipsGlobalDB.autoExpandOnTarget then return end
    if addon.manuallyHidden then return end
    if not addon.currentInstanceName then return end
    encId = tostring(encId)
    local GD = addon.GuideData
    local meta = GD and GD.meta and GD.meta[addon.currentInstanceName]
    if not meta or not meta.encounterIds then return end
    local match
    for boss, eid in pairs(meta.encounterIds) do
        if tostring(eid) == encId then match = boss; break end
    end
    if match then SelectBossAndShow(match) end
end
addon.SmartExpandByEncounterId = SmartExpandByEncounterId

-- ============ 匹配当前副本 ============
-- 归一化：去空格/连接符/引号后小写，用于兜底匹配
local function NormName(s)
    if type(s) ~= "string" then return "" end
    return (s:gsub("[%s%-–—·'’\"“”]", ""):lower())
end
addon.NormName = NormName

-- GetInstanceInfo() 的 difficultyID -> 我们的难度键
local DIFF_ID_MAP = {
    [1] = "normal",   -- 5人普通
    [2] = "heroic",   -- 5人英雄
    [23] = "mythic",  -- 5人史诗
    [24] = "mythicplus", -- 史诗+
    [3] = "normal", [4] = "normal", [14] = "normal", -- 团本普通
    [5] = "heroic", [6] = "heroic", [15] = "heroic", -- 团本英雄
    [7] = "lfr",      -- 随机
    [8] = "mythic", [16] = "mythic", -- 团本史诗
}
local function DiffIDToKey(diffId)
    return DIFF_ID_MAP[diffId]
end
addon.DiffIDToKey = DiffIDToKey

-- ============ 难度显示开关 ============
-- 设置面板可勾选要展示的难度，未勾选的难度不出现在攻略窗难度切换列表、
-- 也不作为进本自动切换的默认难度。数据存放于 BossTipsGlobalDB.enabledDifficulties。
function addon.IsDifficultyEnabled(key)
    if not key then return false end
    local ed = BossTipsGlobalDB.enabledDifficulties
    return ed == nil or ed[key] ~= false  -- 缺省（未设置）= 启用
end

-- 返回当前应展示的难度顺序（已按开关过滤）。isRaid=true 时去掉史诗+（M+ 仅大秘境）。
-- 显示顺序：随机 → 普通 → 英雄 → 史诗 → 史诗+（与设置面板、循环按钮一致）。
function addon.GetEnabledDiffOrder(isRaid)
    local base = isRaid and { "lfr", "normal", "heroic", "mythic" }
                         or { "lfr", "normal", "heroic", "mythic", "mythicplus" }
    local out = {}
    for _, k in ipairs(base) do
        if addon.IsDifficultyEnabled(k) then out[#out + 1] = k end
    end
    if #out == 0 then out = base end  -- 全部关闭时回退全开，避免无难度可选
    return out
end

function addon.GetFirstEnabledDifficulty(isRaid)
    local order = addon.GetEnabledDiffOrder(isRaid)
    return order[1] or "normal"
end

-- 把某个难度键规范化到「已启用」集合内；若被关闭则回退到首个启用的难度。
function addon.ResolveVisibleDifficulty(diffKey, isRaid)
    if addon.IsDifficultyEnabled(diffKey) then return diffKey end
    return addon.GetFirstEnabledDifficulty(isRaid)
end

-- 返回指定 BOSS 实际有攻略内容的难度键列表（已按显示顺序排列）。
-- 规则：
-- 1. 遍历 DIFF_ORDER，若 tipsByDifficulty[key] 非空则纳入。
-- 2. 与设置中的「启用难度」取交集；若交集为空则返回第 1 步结果（避免无难度可选）。
-- normal 为真实难度（五人本=链接4普通攻略，团本=普通难度），仅在有专属内容时显示。
-- isRaid 仅用于剔除团本不存在的 mythicplus。
function addon.GetBossAvailableDifficulties(instanceName, bossName, isRaid)
    local BossData = addon.GetBossData and addon.GetBossData()
    local entry = BossData and BossData[instanceName] and BossData[instanceName][bossName]
    if not entry then return {} end

    local base = isRaid and { "lfr", "normal", "heroic", "mythic" }
                         or { "lfr", "normal", "heroic", "mythic", "mythicplus" }
    local available = {}
    for _, k in ipairs(base) do
        local hasSpecific = type(entry.tipsByDifficulty) == "table" and
                            type(entry.tipsByDifficulty[k]) == "string" and
                            entry.tipsByDifficulty[k] ~= ""
        if hasSpecific then
            available[#available + 1] = k
        end
    end

    -- 再与「设置中启用的难度」取交集
    local enabled = {}
    for _, k in ipairs(available) do
        if addon.IsDifficultyEnabled(k) then enabled[#enabled + 1] = k end
    end
    if #enabled == 0 then
        -- 全被设置关闭时，回退到 available，保证至少能看
        return available
    end
    return enabled
end

-- normal 为真实难度（普通），不再回退通用攻略并标注「通用」。
-- 五人本攻略按 随机/普通/英雄/史诗/史诗+ 分难度独立存放；团本按 随机/普通/英雄/史诗。
function addon.IsDifficultyGeneric(instanceName, bossName, diffKey)
    return false
end

local function CheckInstance()
    local name, _, difficultyID, _, _, _, _, id = GetInstanceInfo()
    local prevInstance = addon.currentInstanceName
    addon.currentInstanceName = nil
    local BossData = addon.GetBossData()
    local GD = addon.GuideData

    -- 1) 精确名匹配
    if name and name ~= "" and BossData and BossData[name] then
        addon.currentInstanceName = name
    end
    -- 2) 归一化/别名匹配（缓解 key 与 GetInstanceInfo 不完全一致）
    if not addon.currentInstanceName and name and name ~= "" and GD and GD.meta then
        local nk = NormName(name)
        for instName, m in pairs(GD.meta) do
            if BossData and BossData[instName] then
                if NormName(instName) == nk then
                    addon.currentInstanceName = instName
                    break
                end
                if m.aliases then
                    for _, a in ipairs(m.aliases) do
                        if NormName(a) == nk then
                            addon.currentInstanceName = instName
                            break
                        end
                    end
                end
                if addon.currentInstanceName then break end
            end
        end
    end
    -- 3) instanceId / mapID 兜底（团本 meta.instanceId 可靠）
    if not addon.currentInstanceName and id then
        if GD and GD.meta then
            for instName, m in pairs(GD.meta) do
                if BossData and BossData[instName] then
                    local mid = m.instanceId or m.mapID
                    if mid and tonumber(mid) == tonumber(id) then
                        addon.currentInstanceName = instName
                        break
                    end
                end
            end
        end
    end
    if addon.debugMatch then
        print(("|cff00ccffBossTips|r 副本 [%s] instanceId=%s 难度=%s → %s"):format(
            tostring(name), tostring(id), tostring(difficultyID),
            addon.currentInstanceName or "|cffff0000未匹配|r"))
    end

    -- 按副本难度自动切换攻略窗难度（默认：五人本→史诗+(M+)，团本→普通(PT)）
    -- 若首选难度被设置关闭或无内容，由其本身回退逻辑处理（ShowInstanceGuide 会回退到首个可用难度）。
    if addon.currentInstanceName and addon.tipsFrame then
        local isRaid = false
        local m = addon.GuideData and addon.GuideData.meta and addon.GuideData.meta[addon.currentInstanceName]
        if m and m.isRaid then isRaid = true end
        -- 进本默认难度：优先用用户持久化保存的默认难度（在攻略窗手动切换或设置里指定），
        -- 缺省时五人本→史诗+(M+)、团本→普通（兼容旧行为）；该难度在当前副本无攻略时由 ShowInstanceGuide 回退首个可用。
        local preferred = BossTipsGlobalDB.defaultDifficulty
            or (isRaid and "normal" or "mythicplus")
        addon.tipsFrame.difficulty = addon.ResolveVisibleDifficulty(preferred, isRaid)
    end

    local mode = BossTipsGlobalDB.guideWindowMode or "auto"

    if addon.currentInstanceName and HasCurrentMapGuide() then
        if mode == "auto" and BossTipsGlobalDB.autoOpenOnEnter and addon.tipsFrame then
            if addon.currentInstanceName ~= addon.lastAutoShownInstance then
                addon.manuallyHidden = false
                addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                addon.lastAutoShownInstance = addon.currentInstanceName
            end
        else
            if addon.tipsFrame and addon.tipsFrame:IsShown() then
                addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
            end
        end
    else
        addon.lastAutoShownInstance = nil
        if addon.tipsFrame and not addon.manuallyHidden then
            addon.tipsFrame:Hide()
        end
    end
    UpdateMainButtonVisibility()
end
addon.CheckInstance = CheckInstance

-- ============ 初始化错误可见（先定义，供 ADDON_LOADED 调用） ============
local function SafeInit()
    local ok, err = pcall(function()
        local loc = addon.LOCALE or "?"
        local lang = BossTipsGlobalDB.lang or "AUTO"
        print("|cFF00FF00BossTips|r v" .. addon.version .. " 加载完成！  [语言设置=" .. lang .. "  解析locale=" .. loc .. "]")
        print("|cFFFFFF00/bts|r " .. (L["Settings"] or "设置面板") .. "  |cFFFFFF00/bts edit|r " .. (L["Open Guide Editor"] or "攻略编辑器") .. "  |cFFFFFF00/bts version|r " .. (L["Version"] or "版本") .. "  |cFFFFFF00/bts locale|r " .. (L["Current Language"] or "当前语言"))
    end)
    if not ok then
        local handler = geterrorhandler and geterrorhandler()
        if handler then handler(err) end
    end
end

-- ============ 事件 ============
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("ENCOUNTER_START")

frame:SetScript("OnEvent", function(self, event, arg1, arg2)
    if event == "ADDON_LOADED" and arg1 == addonName then
        if addon.EnsureDB then addon.EnsureDB() end
        -- SavedVariables 此时已加载，根据真实 lang 重新解析 locale
        if addon.RefreshLocale then addon.RefreshLocale() end
        addon.BuildActiveGuides()
        CreateMainButton()
        UpdateMainButtonVisibility()

        -- 小地图按钮（自包含实现，不依赖 LibDBIcon / LibDataBroker；内置 Libs 缺失时仍可用）
        do
            local miniBtn = CreateFrame("Button", "BossTipsMinimapButton", Minimap)
            miniBtn:SetSize(32, 32)
            miniBtn:SetFrameStrata("MEDIUM")
            miniBtn:SetFrameLevel(8)
            miniBtn:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
            local bg = miniBtn:CreateTexture(nil, "BACKGROUND")
            bg:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
            bg:SetSize(24, 24); bg:SetPoint("CENTER")
            local ic = miniBtn:CreateTexture(nil, "ARTWORK")
            ic:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
            ic:SetSize(20, 20); ic:SetPoint("CENTER")
            miniBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            miniBtn:RegisterForDrag("LeftButton")
            miniBtn:SetScript("OnClick", function(_, button)
                if InCombatLockdown() then
                    print("|cffff0000BossTips|r 战斗中无法打开面板。")
                elseif button == "LeftButton" then
                    if addon.tipsFrame and addon.tipsFrame:IsShown() and addon.currentInstanceName then
                        addon.tipsFrame:Hide(); addon.manuallyHidden = true
                    elseif addon.currentInstanceName and HasCurrentMapGuide() then
                        addon.manuallyHidden = false
                        if addon.ResetTipsFramePos then addon.ResetTipsFramePos() end
                        local ok, err = pcall(function()
                            addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                        end)
                        if not ok then
                            print("|cffff0000BossTips|r 显示攻略窗出错: " .. tostring(err))
                        end
                    else
                        addon:OpenMainGUI()
                    end
                else
                    addon:OpenMainGUI()
                end
            end)
            miniBtn:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_LEFT")
                GameTooltip:AddLine("BossTips")
                GameTooltip:AddLine(L["Minimap Left Click"] or "左键：切换攻略窗", 1, 1, 1)
                GameTooltip:AddLine(L["Minimap Right Click"] or "右键：打开设置", 1, 1, 1)
                GameTooltip:Show()
            end)
            miniBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
            local function place()
                local ang = math.rad(BossTipsGlobalDB.minimapAngle or 225)
                local r = 64
                miniBtn:ClearAllPoints()
                miniBtn:SetPoint("CENTER", Minimap, "CENTER", math.cos(ang) * r, math.sin(ang) * r)
            end
            miniBtn:SetScript("OnDragStart", function()
                miniBtn:SetScript("OnUpdate", function()
                    local mx, my = Minimap:GetCenter()
                    local px, py = GetCursorPosition()
                    local s = Minimap:GetEffectiveScale()
                    local ang = math.atan2((py / s) - my, (px / s) - mx)
                    BossTipsGlobalDB.minimapAngle = math.deg(ang)
                    place()
                end)
            end)
            miniBtn:SetScript("OnDragStop", function() miniBtn:SetScript("OnUpdate", nil) end)
            addon.minimapButton = miniBtn
            addon.RefreshMinimapButton = function()
                if BossTipsGlobalDB.showMinimapButton then miniBtn:Show() else miniBtn:Hide() end
                place()
            end
            addon.RefreshMinimapButton()
        end
        SafeInit()

    elseif event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
        CheckInstance()
        C_Timer.After(1, CheckInstance)
        C_Timer.After(3, CheckInstance)
    elseif event == "PLAYER_TARGET_CHANGED" then
        if BossTipsGlobalDB.autoExpandOnTarget and UnitExists("target") then
            local targetName = UnitName("target")
            if targetName then SmartExpandBoss(targetName) end
        end
    elseif event == "ENCOUNTER_START" then
        local encounterId = arg1
        local encounterName = arg2
        if BossTipsGlobalDB.autoExpandOnTarget then
            if encounterName then SmartExpandBoss(encounterName) end
            if encounterId then addon.SmartExpandByEncounterId(encounterId) end
        end
    end
end)

-- ============ UI 入口 ============
function addon:OpenMainGUI()
    if InCombatLockdown() then
        print("|cffff0000BossTips|r 战斗中无法打开设置面板。")
        return
    end
    local AceConfigDialog = LibStub("AceConfigDialog-3.0", true)
    if AceConfigDialog then AceConfigDialog:Open("BossTips") end
end

function addon:OpenEditor()
    if addon.editorFrame then
        addon.editorFrame:Show()
        if addon.editorFrame.RefreshTree then addon.editorFrame:RefreshTree() end
        return
    end
    if addon.CreateEditorFrame then addon.CreateEditorFrame() end
end

-- ============ 副本选择（供旧接口兼容） ============
function addon:SelectInstanceAndShow(instanceName)
    if not instanceName then return end
    addon.currentInstanceName = instanceName
    addon.manuallyHidden = false
    addon.lastAutoShownInstance = instanceName
    if addon.tipsFrame and addon.tipsFrame.ShowInstanceGuide then
        addon.tipsFrame:ShowInstanceGuide(instanceName)
    end
    UpdateMainButtonVisibility()
end

-- ============ 导出团本首领国服名（供离线翻译回填） ============
-- 在国服客户端内运行：遍历所有团本首领，用 EJ_GetEncounterInfo(encId) 取权威中文名，
-- 打印可回传的 [encId] = "国服名" 块。把 CN_EXPORT_START/END 之间的内容贴回对话即可让助手批量替换。
function addon:ExportRaidCnNames()
    local GD = addon.GuideData
    if not GD or not GD.raids then
        print("|cFFFF0000BossTips|r 无团本数据")
        return
    end
    local lines, count = {}, 0
    for _, ver in pairs(GD.raids) do
        for inst, bosses in pairs(ver) do
            for boss, entry in pairs(bosses) do
                local eid = addon.GetBossEncounterId and addon.GetBossEncounterId(inst, boss)
                if eid then
                    local ej = (EJ_GetEncounterInfo and pcall(EJ_GetEncounterInfo, tonumber(eid)) and EJ_GetEncounterInfo(tonumber(eid))) or ""
                    if ej and ej ~= "" then
                        table.insert(lines, string.format('    [%s] = "%s",  -- %s @ %s', eid, ej, boss, inst))
                        count = count + 1
                    end
                end
            end
        end
    end
    print("|cFF00FF00BossTips|r 导出国服名 " .. count .. " 条，复制 CN_EXPORT_START ~ END 之间内容回传：")
    print("CN_EXPORT_START")
    for _, l in ipairs(lines) do print(l) end
    print("CN_EXPORT_END")
end

-- ============ 斜杠命令 ============
SLASH_BOSSTIPS1 = "/bts"
SlashCmdList["BOSSTIPS"] = function(msg)
    msg = msg and string.lower(strtrim(msg)) or ""
    if msg == "manage" or msg == "edit" then
        addon:OpenEditor()
    elseif msg == "debug" then
        addon.debugMatch = not addon.debugMatch
        print("|cff00ff00BossTips|r 副本匹配调试 " .. (addon.debugMatch and "已开启" or "已关闭") .. "（进本/切图时打印 GetInstanceInfo 与匹配结果）")
    elseif msg == "inst" then
        local n, t, dID, dName, maxP, dyn, isDyn, i = GetInstanceInfo()
        if i then
            print("|cff00ccffBossTips|r 当前副本：[" .. tostring(n) .. "] instanceId=" .. tostring(i) .. " 难度=" .. tostring(dName))
        else
            print("|cffff0000BossTips|r 当前不在副本中")
        end
    elseif msg == "resetpos" then
        if addon.ResetTipsFramePos then addon.ResetTipsFramePos() end
        print("|cff00ff00BossTips|r 攻略窗口位置已重置。")
    elseif msg == "exportcn" then
        addon:ExportRaidCnNames()
    elseif msg == "lock" then
        BossTipsGlobalDB.lockWindow = not BossTipsGlobalDB.lockWindow
        if addon.UpdateWindowLock then addon:UpdateWindowLock() end
        if LibStub("AceConfigRegistry-3.0", true) then
            LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
        end
        print("|cff00ff00BossTips|r " .. (BossTipsGlobalDB.lockWindow and "窗口已锁定" or "窗口已解锁"))
    elseif msg == "button" then
        BossTipsGlobalDB.guideWindowMode = "button"
        BossTipsGlobalDB.mainButtonPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", xOffset = 20, yOffset = -50 }
        if addon.mainButton then
            addon.mainButton:ClearAllPoints()
            addon.mainButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -50)
        end
        if addon.UpdateMainButtonVisibility then addon.UpdateMainButtonVisibility() end
        print("|cff00ff00BossTips|r 已切换到按钮模式并重置悬浮按钮位置。")
    elseif msg == "version" then
        print("|cff00ff00BossTips|r 当前版本：v" .. addon.version)
    elseif msg == "locale" then
        print("|cff00ff00BossTips|r 语言设置=" .. (BossTipsGlobalDB.lang or "AUTO") .. "  解析locale=" .. (addon.LOCALE or "?"))
    else
        addon:OpenMainGUI()
    end
end

