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
                quick_actions = {
                    type = "group",
                    name = L["Quick Actions"],
                    inline = true,
                    order = 1,
                    args = {
                        open_picker = {
                            type = "execute",
                            name = L["Open Dungeon Picker"],
                            width = "normal",
                            order = 1,
                            func = function()
                                AceConfigDialog:Close("BossTips")
                                if addon.dungeonPicker then addon.dungeonPicker:Show() end
                            end,
                        },
                        open_editor = {
                            type = "execute",
                            name = L["Open Guide Editor"],
                            width = "normal",
                            order = 2,
                            func = function()
                                AceConfigDialog:Close("BossTips")
                                addon:OpenEditor()
                            end,
                        },
                    }
                },
                behavior = {
                    type = "group",
                    name = L["Behavior & Interaction"],
                    inline = true,
                    order = 2,
                    args = {
                        autoExpand = {
                            type = "toggle",
                            name = L["Enable Smart Expand"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.autoExpandOnTarget end,
                            set = function(_, val) BossTipsGlobalDB.autoExpandOnTarget = val end,
                            order = 1,
                        },
                        autoOpen = {
                            type = "toggle",
                            name = L["Auto Open On Enter"],
                            width = "full",
                            get = function() return BossTipsGlobalDB.autoOpenOnEnter end,
                            set = function(_, val) BossTipsGlobalDB.autoOpenOnEnter = val end,
                            order = 2,
                        },
                        lock_window = {
                            type = "toggle",
                            name = L["Lock Window"],
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
                            width = "full",
                            get = function() return BossTipsGlobalDB.showMobs end,
                            set = function(_, val) BossTipsGlobalDB.showMobs = val; addon.RefreshGuides() end,
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
    args = {
        version_toggles = {
            type = "group",
            name = L["Version Toggles"],
            inline = true,
            order = 1,
            args = {},
        },
        hidden_dungeons = {
            type = "group",
            name = L["Hidden Dungeons"],
            inline = true,
            order = 2,
            args = {},
        },
        edit_guides = {
            type = "group",
            name = L["Edit Guides"],
            inline = true,
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
    -- 版本开关（原生 + M+）
    local vt = guideOptions.args.version_toggles.args
    for k in pairs(vt) do vt[k] = nil end
    local order = 1
    for _, vid in ipairs(addon.GetNativeOrder()) do
        local label = addon.GetVersionLabel(vid)
        vt["nat_" .. vid] = {
            type = "toggle",
            name = label,
            width = "full",
            get = function() return not (BossTipsGlobalDB.disabledNative[vid]) end,
            set = function(_, val)
                BossTipsGlobalDB.disabledNative[vid] = not val
                addon.RefreshGuides()
            end,
            order = order,
        }
        order = order + 1
    end
    for _, sid in ipairs(addon.GetMPlusOrder()) do
        local label = addon.GetVersionLabel(sid)
        vt["mplus_" .. sid] = {
            type = "toggle",
            name = label .. " (M+)",
            width = "full",
            get = function() return not (BossTipsGlobalDB.disabledMPlus[sid]) end,
            set = function(_, val)
                BossTipsGlobalDB.disabledMPlus[sid] = not val
                addon.RefreshGuides()
            end,
            order = order,
        }
        order = order + 1
    end
    -- 隐藏副本
    local hd = guideOptions.args.hidden_dungeons.args
    for k in pairs(hd) do hd[k] = nil end
    order = 1
    local instances = addon.CollectAllInstances()
    for _, inst in ipairs(instances) do
        hd["hide_" .. inst] = {
            type = "toggle",
            name = inst,
            width = "full",
            get = function() return not (BossTipsGlobalDB.hiddenDungeons[inst]) end,
            set = function(_, val)
                if val then BossTipsGlobalDB.hiddenDungeons[inst] = true
                else BossTipsGlobalDB.hiddenDungeons[inst] = nil end
                addon.RefreshGuides()
            end,
            order = order,
        }
        order = order + 1
    end
end

-- ADDON_LOADED：注册选项表
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == addonName then
        BuildGuideOptions()
        options.args.guide_options_tab = guideOptions
        AceConfig:RegisterOptionsTable("BossTips", options)
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- 每次打开前刷新（数据可能在游戏内变化）
local origOpen = addon.OpenMainGUI
function addon:OpenMainGUI()
    if InCombatLockdown() then
        print("|cffff0000BossTips|r 战斗中无法打开设置面板。")
        return
    end
    BuildGuideOptions()
    if LibStub("AceConfigRegistry-3.0", true) then
        LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
    end
    AceConfigDialog:Open("BossTips")
end
