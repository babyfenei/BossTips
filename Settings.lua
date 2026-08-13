-- ============================================================================
-- BossTips Settings.lua —— AceConfig 双标签设置面板（对齐 DungeonCheatSheet）
-- 标签1：设置（快捷操作 / 行为交互 / 聊天输出 / 外观）
-- 标签2：攻略配置（版本开关 / 隐藏副本 / 打开编辑器）
-- ============================================================================
local addonName, addon = ...
local L = addon.L
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local function ApplyAppearanceChange()
    if addon.tipsFrame and addon.tipsFrame:IsShown() then
        addon:CheckInstance()
    end
    if addon.UpdateMainButtonAppearance then
        addon.UpdateMainButtonAppearance()
    end
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
                        chat_channel = {
                            type = "select",
                            name = L["Send to"],
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
                        close_after_send = {
                            type = "toggle",
                            name = "发送攻略后关闭窗口",
                            desc = "勾选后点击小喇叭发送攻略会自动隐藏攻略窗口。",
                            width = "full",
                            get = function() return BossTipsGlobalDB.closeWindowAfterSend end,
                            set = function(_, val) BossTipsGlobalDB.closeWindowAfterSend = val end,
                            hidden = function() return not BossTipsGlobalDB.enableChatSend end,
                            order = 3,
                        },
                    }
                },
                appearance = {
                    type = "group",
                    name = L["Appearance & Testing"],
                    inline = true,
                    order = 4,
                    args = {
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

-- ============ 攻略配置标签（动态构建版本开关 / 隐藏副本） ============
local guideOptions = {
    type = "group",
    name = L["Guide Options"],
    order = 2,
    childGroups = "tree",
    args = {
        dungeon_tree = {
            type = "group",
            name = "5人本",
            order = 1,
            childGroups = "tree",
            args = {},
        },
        raid_tree = {
            type = "group",
            name = "团本",
            order = 2,
            childGroups = "tree",
            args = {},
        },
        edit_guides = {
            type = "group",
            name = L["Edit Guides"] or "编辑攻略",
            order = 3,
            args = {
                open_editor = {
                    type = "execute",
                    name = L["Open Guide Editor"],
                    width = "full",
                    func = function()
                        AceConfigDialog:Close("BossTips")
                        addon:OpenEditor()
                    end,
                },
            },
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
end
