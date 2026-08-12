-- ============================================================================
-- BossTips Core.lua —— 主逻辑（对齐 DungeonCheatSheet 架构）
-- 事件、LibDBIcon 小地图按钮、进本自动弹窗、CheckInstance 匹配、各 UI 入口。
-- ============================================================================
local addonName, addon = ...
local L = addon.L

addon.version = "2.0.0"
addon.currentInstanceName = nil
addon.currentSelectedBoss = nil
addon.manuallyHidden = false
addon.lastAutoShownInstance = nil
addon.tipsFrame = nil
addon.mainButton = nil
addon.dungeonPicker = nil
addon.settingsFrame = nil
addon.editorFrame = nil

-- ============ 状态工具 ============
local function HasCurrentMapGuide()
    local bossData = addon.GetBossData()
    return bossData and addon.currentInstanceName and bossData[addon.currentInstanceName] ~= nil
end
addon.HasCurrentMapGuide = HasCurrentMapGuide

local function UpdateMainButtonVisibility()
    if not addon.mainButton then return end
    local shouldHide = not HasCurrentMapGuide() and BossTipsGlobalDB.hideMainButtonWhenNoGuide
    addon.mainButton:SetShown(not shouldHide)
end
addon.UpdateMainButtonVisibility = UpdateMainButtonVisibility

local function RefreshGuides()
    addon.BuildActiveGuides()
    UpdateMainButtonVisibility()
end
addon.RefreshGuides = RefreshGuides

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

-- ============ 匹配当前副本 ============
local function CheckInstance()
    local name, _, difficultyID, _, _, _, _, id = GetInstanceInfo()
    addon.currentInstanceName = nil
    if name and name ~= "" then
        local BossData = addon.GetBossData()
        if BossData and BossData[name] then
            addon.currentInstanceName = name
        end
    end
    if not addon.currentInstanceName and id then
        -- 按 mapID 在 meta 中反查副本名
        local GD = addon.GuideData
        if GD and GD.meta then
            for instName, m in pairs(GD.meta) do
                if m.mapID == id and addon.GetBossData()[instName] then
                    addon.currentInstanceName = instName
                    break
                end
            end
        end
    end

    if addon.currentInstanceName and HasCurrentMapGuide() then
        if BossTipsGlobalDB.autoOpenOnEnter and addon.tipsFrame then
            if addon.currentInstanceName ~= addon.lastAutoShownInstance then
                addon.manuallyHidden = false
                addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                addon.lastAutoShownInstance = addon.currentInstanceName
            end
        else
            -- 不自动弹窗，但刷新当前显示（若已打开）
            if addon.tipsFrame:IsShown() then
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

-- ============ 事件 ============
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("ENCOUNTER_START")

frame:SetScript("OnEvent", function(self, event, arg1, arg2)
    if event == "ADDON_LOADED" and arg1 == addonName then
        addon.BuildActiveGuides()

        -- 小地图按钮（LibDBIcon）
        BossTipsGlobalDB.minimap = BossTipsGlobalDB.minimap or {
            hide = not BossTipsGlobalDB.showMinimapButton,
            minimapPos = BossTipsGlobalDB.minimapAngle or 225,
        }
        local LDB = LibStub("LibDataBroker-1.1", true)
        local icon = LibStub("LibDBIcon-1.0", true)
        if LDB and icon then
            local BossTipsLDB = LDB:NewDataObject("BossTips", {
                type = "data source",
                text = "BossTips",
                icon = "Interface\\Icons\\INV_Misc_QuestionMark",
                OnClick = function(self, button)
                    if InCombatLockdown() then
                        print("|cffff0000BossTips|r 战斗中无法打开面板。")
                    elseif button == "LeftButton" then
                        if addon.dungeonPicker then
                            if addon.dungeonPicker:IsShown() then addon.dungeonPicker:Hide()
                            else addon.dungeonPicker:Show() end
                        end
                    else
                        addon:OpenMainGUI()
                    end
                end,
                OnTooltipShow = function(tooltip)
                    tooltip:AddLine("BossTips")
                    tooltip:AddLine(L["Open Dungeon Picker"] or "左键：打开副本选择", 1, 1, 1)
                    tooltip:AddLine(L["Open Guide Editor"] or "右键：打开设置", 1, 1, 1)
                end,
            })
            icon:Register("BossTips", BossTipsLDB, BossTipsGlobalDB.minimap)
        else
            print("|cffff0000BossTips|r 缺少 LibDataBroker / LibDBIcon 库，小地图按钮加载失败！")
        end

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
        local encounterName = arg2
        if BossTipsGlobalDB.autoExpandOnTarget and encounterName then
            SmartExpandBoss(encounterName)
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

-- ============ 副本选择（供 Picker 点击） ============
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

-- ============ 斜杠命令 ============
SLASH_BOSSTIPS1 = "/bts"
SlashCmdList["BOSSTIPS"] = function(msg)
    msg = msg and string.lower(strtrim(msg)) or ""
    if msg == "manage" or msg == "edit" then
        addon:OpenEditor()
    elseif msg == "picker" or msg == "dungeons" then
        if addon.dungeonPicker then
            if addon.dungeonPicker:IsShown() then addon.dungeonPicker:Hide() else addon.dungeonPicker:Show() end
        end
    elseif msg == "lock" then
        BossTipsGlobalDB.lockWindow = not BossTipsGlobalDB.lockWindow
        if addon.UpdateWindowLock then addon:UpdateWindowLock() end
        if LibStub("AceConfigRegistry-3.0", true) then
            LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
        end
        print("|cff00ff00BossTips|r " .. (BossTipsGlobalDB.lockWindow and "窗口已锁定" or "窗口已解锁"))
    else
        addon:OpenMainGUI()
    end
end

-- ============ 初始化错误可见 ============
local function SafeInit()
    local ok, err = pcall(function()
        print("|cFF00FF00BossTips|r v" .. addon.version .. " 加载完成！")
        print("|cFFFFFF00输入 /bts|r 查看命令帮助")
    end)
    if not ok then
        local handler = geterrorhandler and geterrorhandler()
        if handler then handler(err) end
    end
end
