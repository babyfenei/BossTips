-- ============================================================================
-- BossTips Settings.lua —— AceConfig 双标签设置面板（对齐 DungeonCheatSheet）
-- 标签1：设置（快捷操作 / 行为交互 / 聊天输出 / 外观）
-- 标签2：攻略配置（版本开关 / 隐藏副本 / 打开编辑器）
-- ============================================================================
local addonName, addon = ...
local L = addon.L
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

-- ============ 难度显示开关 ============
-- 设置面板可勾选要展示的难度；未勾选的难度不会出现在攻略窗难度切换列表，
-- 也不会作为进本自动切换的默认难度。数据与筛选逻辑见 Core.lua：addon.IsDifficultyEnabled 等。
local DIFF_TOGGLE_LABELS = {
    lfr = "随机（LFR）",
    normal = "普通",
    heroic = "英雄",
    mythic = "史诗",
    mythicplus = "史诗+（大秘境）",
}
local function MakeDiffToggle(key)
    return {
        type = "toggle",
        name = DIFF_TOGGLE_LABELS[key] or key,
        desc = "取消勾选后，该难度不会出现在攻略窗的难度切换列表中，也不会作为进本后的默认显示难度。",
        width = "full",
        get = function()
            local ed = BossTipsGlobalDB.enabledDifficulties
            return ed == nil or ed[key] ~= false  -- 缺省（未设置）= 启用
        end,
        set = function(_, val)
            if not BossTipsGlobalDB.enabledDifficulties then BossTipsGlobalDB.enabledDifficulties = {} end
            BossTipsGlobalDB.enabledDifficulties[key] = val
            -- 刷新攻略窗：若当前显示难度被关闭，会在 ShowInstanceGuide 中自动回退到首个启用难度
            if addon.RefreshGuides then addon.RefreshGuides() end
            if addon.tipsFrame and addon.tipsFrame:IsShown() and addon.currentInstanceName then
                addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
            end
        end,
    }
end

local function ApplyThemeToSettingsFrame()
    local ACD = LibStub("AceConfigDialog-3.0", true)
    local openFrame = ACD and ACD.OpenFrames and ACD.OpenFrames["BossTips"]
    if openFrame and openFrame.frame and addon.ApplyThemeToFrame then
        addon.ApplyThemeToFrame(openFrame.frame)
    end
end

local function ApplyAppearanceChange()
    if addon.tipsFrame and addon.tipsFrame:IsShown() then
        addon:CheckInstance()
    end
    if addon.UpdateMainButtonAppearance then
        addon.UpdateMainButtonAppearance()
    end
    -- 设置框若打开，同步刷新主题
    ApplyThemeToSettingsFrame()
end

local options = {
    type = "group",
    name = "BossTips",
    childGroups = "tab",
    args = {
        -- ===== 第一个标签页：设置 =====
        settings_tab = {
            type = "group",
            name = L["Settings"],
            order = 1,
            args = {
                behavior = {
                    type = "group",
                    name = L["Behavior & Interaction"],
                    inline = true,
                    order = 2,
                    args = {
                        guide_window_mode = {
                            type = "select",
                            name = "显示方式",
                            desc = "自动展开：进本自动弹出攻略窗。按钮模式：仅显示悬浮按钮，点击后弹窗。",
                            values = {
                                ["auto"] = "自动展开",
                                ["button"] = "按钮模式",
                            },
                            get = function() return BossTipsGlobalDB.guideWindowMode or "auto" end,
                            set = function(_, val)
                                BossTipsGlobalDB.guideWindowMode = val
                                if addon.UpdateMainButtonVisibility then addon.UpdateMainButtonVisibility() end
                                if val == "auto" and addon.currentInstanceName and addon.HasCurrentMapGuide and addon.HasCurrentMapGuide() then
                                    addon.manuallyHidden = false
                                    if addon.tipsFrame and addon.tipsFrame.ShowInstanceGuide then
                                        addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                                    end
                                elseif val == "button" and addon.tipsFrame then
                                    addon.tipsFrame:Hide()
                                    addon.manuallyHidden = true
                                end
                            end,
                            order = 0,
                        },
                        autoExpand = {
                            type = "toggle",
                            name = L["Enable Smart Expand"],
                            desc = L["Smart Expand Desc"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.autoExpandOnTarget end,
                            set = function(_, val) BossTipsGlobalDB.autoExpandOnTarget = val end,
                            order = 1,
                        },
                        autoOpen = {
                            type = "toggle",
                            name = L["Auto Open On Enter"],
                            width = "full",
                            hidden = function() return (BossTipsGlobalDB.guideWindowMode or "auto") ~= "auto" end,
                            get = function() return BossTipsGlobalDB.autoOpenOnEnter end,
                            set = function(_, val) BossTipsGlobalDB.autoOpenOnEnter = val end,
                            order = 2,
                        },
                        lock_window = {
                            type = "toggle",
                            name = L["Lock Window"],
                            desc = L["Lock Window Desc"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.lockWindow end,
                            set = function(_, val)
                                BossTipsGlobalDB.lockWindow = val
                                addon:UpdateWindowLock()
                                if LibStub("AceConfigRegistry-3.0", true) then
                                    LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
                                end
                            end,
                            order = 3,
                        },
                        singleExpand = {
                            type = "toggle",
                            name = L["Only allow one expanded item at a time"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.singleExpand end,
                            set = function(_, val) BossTipsGlobalDB.singleExpand = val; ApplyAppearanceChange() end,
                            order = 4,
                        },
                        showMobs = {
                            type = "toggle",
                            name = "显示小怪条目",
                            desc = "关闭时攻略窗口只显示首领（BOSS），不显示小怪/重点怪。",
                            width = "full",
                            get = function() return BossTipsGlobalDB.showMobs end,
                            set = function(_, val)
                                BossTipsGlobalDB.showMobs = val
                                addon.RefreshGuides()
                                if addon.tipsFrame and addon.tipsFrame:IsShown() and addon.currentInstanceName then
                                    addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                                end
                            end,
                            order = 5,
                        },
                    }
                },
                difficulty_visibility = {
                    type = "group",
                    name = "难度显示",
                    desc = "勾选要在攻略窗中展示的难度；未勾选的难度不会出现在难度切换列表，也不会作为进本后的默认难度。",
                    inline = true,
                    order = 2.5,
                    args = {
                        diff_lfr = MakeDiffToggle("lfr"),
                        diff_normal = MakeDiffToggle("normal"),
                        diff_heroic = MakeDiffToggle("heroic"),
                        diff_mythic = MakeDiffToggle("mythic"),
                        diff_mythicplus = MakeDiffToggle("mythicplus"),
                    },
                },
                chat_output = {
                    type = "group",
                    name = L["Chat Output"],
                    inline = true,
                    order = 3,
                    args = {
                        enable_chat_send = {
                            type = "toggle",
                            name = L["Enable sending guide to chat"],
                            desc = L["Chat Send Desc"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.enableChatSend end,
                            set = function(_, val)
                                BossTipsGlobalDB.enableChatSend = val
                                ApplyAppearanceChange()
                            end,
                            order = 1,
                        },
                        chat_channel_left = {
                            type = "select",
                            name = "左键发送频道",
                            desc = "攻略窗体小喇叭「左键」点击时发送的频道。默认副本（INSTANCE_CHAT）。",
                            values = {
                                ["SAY"] = "说",
                                ["PARTY"] = "队伍",
                                ["RAID"] = "团队",
                                ["INSTANCE_CHAT"] = "副本",
                                ["YELL"] = "大喊",
                            },
                            get = function() return BossTipsGlobalDB.defaultChatChannel end,
                            set = function(_, val) BossTipsGlobalDB.defaultChatChannel = val end,
                            hidden = function() return not BossTipsGlobalDB.enableChatSend end,
                            order = 2,
                        },
                        chat_channel_right = {
                            type = "select",
                            name = "右键发送频道",
                            desc = "攻略窗体小喇叭「右键」点击时发送的频道。默认说（SAY）。",
                            values = {
                                ["SAY"] = "说",
                                ["PARTY"] = "队伍",
                                ["RAID"] = "团队",
                                ["INSTANCE_CHAT"] = "副本",
                                ["YELL"] = "大喊",
                            },
                            get = function() return BossTipsGlobalDB.sendChannelRight or "SAY" end,
                            set = function(_, val) BossTipsGlobalDB.sendChannelRight = val end,
                            hidden = function() return not BossTipsGlobalDB.enableChatSend end,
                            order = 3,
                        },
                        close_after_send = {
                            type = "toggle",
                            name = "发送攻略后关闭窗口",
                            desc = "勾选后点击小喇叭发送攻略会自动隐藏攻略窗口。",
                            width = "full",
                            get = function() return BossTipsGlobalDB.closeWindowAfterSend end,
                            set = function(_, val) BossTipsGlobalDB.closeWindowAfterSend = val end,
                            hidden = function() return not BossTipsGlobalDB.enableChatSend end,
                            order = 4,
                        },
                    }
                },
                appearance = {
                    type = "group",
                    name = L["Appearance & Testing"],
                    inline = true,
                    order = 4,
                    args = {
                        theme = {
                            type = "select",
                            name = "主题风格",
                            desc = "选择界面整体主题。ACE3 主题与攻略窗一致（半透明暗色+用户颜色+灰色边框）；官方默认使用暴雪对话框风格。",
                            values = {
                                ["ace3"] = "ACE3 主题",
                                ["default"] = "官方默认主题",
                            },
                            get = function() return BossTipsGlobalDB.theme or "ace3" end,
                            set = function(_, val)
                                BossTipsGlobalDB.theme = val
                                -- 同时刷新设置框、攻略窗、悬浮按钮、编辑器主题
                                if addon.RefreshAllThemes then addon.RefreshAllThemes() end
                            end,
                            order = 0,
                        },
                        font = {
                            type = "select",
                            name = L["Font"],
                            values = {
                                ["default"] = "系统默认",
                                ["damage"] = "伤害数字",
                                ["chat"] = "聊天粗体",
                            },
                            get = function() return BossTipsGlobalDB.tipsFont end,
                            set = function(_, val) BossTipsGlobalDB.tipsFont = val; ApplyAppearanceChange() end,
                            order = 1,
                        },
                        fontSize = {
                            type = "range",
                            name = L["Font Size"],
                            min = 10, max = 30, step = 1,
                            get = function() return BossTipsGlobalDB.FontSize end,
                            set = function(_, val) BossTipsGlobalDB.FontSize = val; ApplyAppearanceChange() end,
                            order = 2,
                        },
                        collapsedAlpha = {
                            type = "range",
                            name = L["Collapsed Alpha"],
                            min = 0.1, max = 1.0, step = 0.05,
                            get = function() return BossTipsGlobalDB.collapsedAlpha end,
                            set = function(_, val) BossTipsGlobalDB.collapsedAlpha = val; ApplyAppearanceChange() end,
                            order = 3,
                        },
                        bgColor = {
                            type = "color",
                            name = L["Background Color & Alpha"],
                            hasAlpha = true,
                            get = function()
                                return BossTipsGlobalDB.tipsBgR or 0.05, BossTipsGlobalDB.tipsBgG or 0.05,
                                       BossTipsGlobalDB.tipsBgB or 0.05, BossTipsGlobalDB.tipsBgA or 0.82
                            end,
                            set = function(_, r, g, b, a)
                                BossTipsGlobalDB.tipsBgR, BossTipsGlobalDB.tipsBgG = r, g
                                BossTipsGlobalDB.tipsBgB, BossTipsGlobalDB.tipsBgA = b, a
                                ApplyAppearanceChange()
                            end,
                            order = 4,
                        },
                        minimap_btn = {
                            type = "toggle",
                            name = L["Show Minimap Button"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.showMinimapButton end,
                            set = function(_, val)
                                BossTipsGlobalDB.showMinimapButton = val
                                BossTipsGlobalDB.minimap = BossTipsGlobalDB.minimap or {}
                                BossTipsGlobalDB.minimap.hide = not val
                                local icon = LibStub("LibDBIcon-1.0", true)
                                if icon then
                                    if val then icon:Show("BossTips") else icon:Hide("BossTips") end
                                end
                            end,
                            order = 5,
                        },
                        hide_main_button_no_guide = {
                            type = "toggle",
                            name = "无攻略时隐藏悬浮按钮",
                            desc = "按钮模式下，当前区域/副本没有攻略时自动隐藏悬浮按钮。",
                            width = "full",
                            get = function() return BossTipsGlobalDB.hideMainButtonWhenNoGuide end,
                            set = function(_, val)
                                BossTipsGlobalDB.hideMainButtonWhenNoGuide = val
                                if addon.UpdateMainButtonVisibility then addon.UpdateMainButtonVisibility() end
                            end,
                            hidden = function() return (BossTipsGlobalDB.guideWindowMode or "auto") ~= "button" end,
                            order = 6,
                        },
                        reset_main_button = {
                            type = "execute",
                            name = "重置悬浮按钮位置",
                            width = "full",
                            func = function()
                                BossTipsGlobalDB.mainButtonPos = { point = "TOPLEFT", relativePoint = "TOPLEFT", xOffset = 20, yOffset = -50 }
                                if addon.mainButton then
                                    addon.mainButton:ClearAllPoints()
                                    addon.mainButton:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 20, -50)
                                end
                            end,
                            hidden = function() return (BossTipsGlobalDB.guideWindowMode or "auto") ~= "button" end,
                            order = 7,
                        },
                        show_test_window = {
                            type = "execute",
                            name = L["Show Test Window"],
                            width = "full",
                            func = function()
                                if addon.ShowTestWindow then addon.ShowTestWindow() end
                            end,
                            order = 8,
                        },
                        hide_test_window = {
                            type = "execute",
                            name = L["Hide Test Window"],
                            width = "full",
                            func = function()
                                if addon.HideTestWindow then addon.HideTestWindow() end
                            end,
                            order = 9,
                        },
                    }
                },
            }
        },
    }
}

-- ============ 攻略配置标签（编辑按钮 → 5人本/团本 树） ============
-- 保留此辅助函数供测试脚本/tools 使用，设置面板内不再提供一键展开/折叠按钮。
local function SetGuideTreesExpanded(expand)
    local status = AceConfigDialog:GetStatusTable("BossTips", { "guide_options_tab" })
    -- 对话框未真正打开时（如仿真环境）status.groups 可能为 __index 元表提供的函数，需显式建表；
    -- 已打开时（游戏内）它本就是 TreeGroup 使用的真实表，保留既有展开状态。
    local g = status.groups
    if type(g) ~= "table" then g = {}; status.groups = g end
    if expand then
        g["dungeon_tree"] = true
        g["raid_tree"] = true
        for _, vid in ipairs(addon.GetAllVersionIDs()) do
            g["dungeon_tree\001ver_" .. vid] = true
        end
        for _, vid in ipairs(addon.GetRaidVersionIDs()) do
            g["raid_tree\001ver_" .. vid] = true
        end
    else
        g["dungeon_tree"] = nil
        g["raid_tree"] = nil
        for k in pairs(g) do
            if k:match("^dungeon_tree\001") or k:match("^raid_tree\001") then
                g[k] = nil
            end
        end
    end
    AceConfig:NotifyChange("BossTips")
end
addon.SetGuideTreesExpanded = SetGuideTreesExpanded

local guideOptions = {
    type = "group",
    name = L["Guide Options"],
    order = 2,
    childGroups = "tree",
    args = {
        -- 最上方：编辑攻略按钮（直接显示在面板顶部，非树节点）
        open_editor_hint = {
            type = "description",
            name = "点击下方按钮打开攻略编辑器，可修改任意副本/首领的攻略文本。",
            fontSize = "medium",
            order = 0.5,
        },
        open_editor = {
            type = "execute",
            name = "|cffffcc00› 编辑攻略 ‹|r",
            desc = "打开攻略编辑器，增删改任意副本/首领的攻略文本。",
            width = "full",
            order = 1,
            func = function()
                AceConfigDialog:Close("BossTips")
                addon:OpenEditor()
            end,
        },
        editor_divider = {
            type = "header",
            name = "副本与分类",
            order = 2,
        },
        -- 5人本 / 团本 树（单击节点即可展开/折叠）
        dungeon_tree = {
            type = "group",
            name = "5人本",
            order = 3,
            childGroups = "tree",
            args = {},
        },
        raid_tree = {
            type = "group",
            name = "团本",
            order = 4,
            childGroups = "tree",
            args = {},
        },
    }
}

local function BuildGuideOptions()
    if addon.EnsureDB then addon.EnsureDB() end
    local dt = guideOptions.args.dungeon_tree.args
    local rt = guideOptions.args.raid_tree.args
    for k in pairs(dt) do dt[k] = nil end
    for k in pairs(rt) do rt[k] = nil end

    local function buildVersionNode(vid, order, targetArgs, mode)
        local label
        if mode == "raid" then
            label = addon.GetRaidVersionLabel(vid)
        else
            label = addon.GetVersionLabel(vid)
        end
        local verArgs = {}
        verArgs["enable"] = {
            type = "toggle",
            name = L["Enable this version"],
            desc = mode == "raid" and "取消勾选将隐藏该版本下所有团本" or "取消勾选将隐藏该版本下所有 5 人本/大秘境",
            width = "full",
            get = function()
                if mode == "raid" then return addon.IsRaidVersionEnabled(vid) end
                return addon.IsDungeonVersionEnabled(vid)
            end,
            set = function(_, val)
                if mode == "raid" then
                    BossTipsGlobalDB.disabledRaids[vid] = not val
                else
                    local GD = addon.GuideData
                    if GD.versions and GD.versions[vid] then BossTipsGlobalDB.disabledNative[vid] = not val end
                    if GD.mplus and GD.mplus[vid] then BossTipsGlobalDB.disabledMPlus[vid] = not val end
                    if BossTipsGlobalDB.customVersions and BossTipsGlobalDB.customVersions[vid] then
                        BossTipsGlobalDB.disabledCustomVersions[vid] = not val
                    end
                end
                addon.RefreshGuides()
            end,
            order = 1,
        }
        -- 分割线：区分「版本级开关」与「副本级复选框」
        verArgs["divider"] = {
            type = "header",
            name = "",
            order = 1.5,
            cmdHidden = true,
        }
        local dungeons
        if mode == "raid" then
            dungeons = addon.GetRaidDungeons(vid) or {}
        else
            dungeons = addon.GetVersionDungeons(vid) or {}
        end
        local instList = {}
        for inst in pairs(dungeons) do instList[#instList + 1] = inst end
        table.sort(instList)
        local dorder = 2
        for _, inst in ipairs(instList) do
            verArgs["dung_" .. inst] = {
                type = "toggle",
                name = inst,
                width = "full",
                get = function() return not (BossTipsGlobalDB.hiddenDungeons[inst]) end,
                set = function(_, val)
                    if val then BossTipsGlobalDB.hiddenDungeons[inst] = nil
                    else BossTipsGlobalDB.hiddenDungeons[inst] = true end
                    addon.RefreshGuides()
                end,
                order = dorder,
            }
            dorder = dorder + 1
        end
        targetArgs["ver_" .. vid] = {
            type = "group",
            name = label,
            order = order,
            args = verArgs,
        }
    end

    -- 5人本树：原生 + M+ + 自定义（GetAllVersionIDs 已把当前赛季大秘境置顶）
    local dorder = 1
    for _, vid in ipairs(addon.GetAllVersionIDs()) do
        buildVersionNode(vid, dorder, dt, "dungeon")
        dorder = dorder + 1
    end

    -- 团本树：按版本号倒序
    local raidIds = addon.GetRaidVersionIDs()
    table.sort(raidIds, function(a, b)
        local na, nb = addon.ParseVersionNumber(a), addon.ParseVersionNumber(b)
        if na and nb then return na > nb end
        if na then return true end
        if nb then return false end
        return tostring(a) > tostring(b)
    end)
    local rorder = 1
    for _, vid in ipairs(raidIds) do
        buildVersionNode(vid, rorder, rt, "raid")
        rorder = rorder + 1
    end
end

-- ============ 配置文件标签（简单版，未使用 AceDB Profile） ============
local function ResetProfile()
    StaticPopupDialogs["BOSSTIPS_RESET_PROFILE"] = {
        text = "确定将当前配置文件重置为默认吗？所有自定义攻略、分类、副本开关都会丢失！",
        button1 = YES,
        button2 = NO,
        OnAccept = function()
            BossTipsGlobalDB = {}
            if addon.EnsureDB then addon.EnsureDB() end
            BuildGuideOptions()
            addon.RefreshGuides()
            if LibStub("AceConfigRegistry-3.0", true) then
                LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
            end
            print("|cff00ff00BossTips|r 当前配置文件已重置为默认。")
        end,
        timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
    }
    StaticPopup_Show("BOSSTIPS_RESET_PROFILE")
end

local profileOptions = {
    type = "group",
    name = L["Profiles"] or "配置文件",
    order = 3,
    args = {
        current_profile = {
            type = "description",
            name = "当前配置文件：" .. (L["Default"] or "Default") .. "\n\nBossTips 使用账号级 SavedVariables，暂不支持多角色独立配置。点击下方按钮可将当前配置恢复为默认。",
            order = 1,
        },
        reset_profile = {
            type = "execute",
            name = L["Reset Current Profile"] or "重置当前配置文件",
            width = "full",
            func = ResetProfile,
            order = 2,
        },
    }
}

-- ADDON_LOADED：注册选项表
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == addonName then
        if addon.EnsureDB then addon.EnsureDB() end
        BuildGuideOptions()
        options.args.guide_options_tab = guideOptions
        options.args.profiles_tab = profileOptions
        AceConfig:RegisterOptionsTable("BossTips", options)
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- 打开设置面板：不再每次重建 options，只在 ADDON_LOADED / 数据变化时重建，
-- 避免 AceConfigDialog:Open 处理大量 inline toggle 导致 script ran too long。
local origOpen = addon.OpenMainGUI
function addon:OpenMainGUI()
    if InCombatLockdown() then
        print("|cffff0000BossTips|r 战斗中无法打开设置面板。")
        return
    end
    -- 切换：已打开则关闭
    local openFrame = AceConfigDialog.OpenFrames and AceConfigDialog.OpenFrames["BossTips"]
    if openFrame and openFrame.frame and openFrame.frame:IsShown() then
        AceConfigDialog:Close("BossTips")
        return
    end
    if addon.EnsureDB then addon.EnsureDB() end
    if LibStub("AceConfigRegistry-3.0", true) then
        LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
    end
    AceConfigDialog:Open("BossTips")
    -- 打开后立即套用当前主题（ACE3/官方默认），让设置框与攻略窗风格一致
    ApplyThemeToSettingsFrame()
end
