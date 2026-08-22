-- ============================================================================
-- BossTips Settings.lua —— AceConfig 双标签设置面板（对齐 DungeonCheatSheet）
-- 标签1：设置（快捷操作 / 行为交互 / 聊天输出 / 外观）
-- 标签2：攻略配置（版本开关 / 隐藏副本 / 打开编辑器）
-- ============================================================================
local addonName, addon = ...
local L = addon.L
local AceConfig = LibStub("AceConfig-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

-- ============ 外部链接（关于/帮助页签使用）============
-- 来源：.toc（插件名/作者/版本）+ 社区与发布平台
local NGA_URL = "https://bbs.nga.cn/read.php?tid=42002877"
local CURSE_URL = "https://legacy.curseforge.com/wow/addons/bosstips"

-- ============ 难度显示开关 ============
-- 设置面板可勾选要展示的难度；未勾选的难度不会出现在攻略窗难度切换列表，
-- 也不会作为进本自动切换的默认难度。数据与筛选逻辑见 Core.lua：addon.IsDifficultyEnabled 等。
local function GetDiffToggleLabel(key)
    local map = {
        lfr = "LFR",
        normal = "Normal",
        heroic = "Heroic",
        mythic = "Mythic",
        mythicplus = "Mythic Plus",
    }
    return L[map[key]] or key
end
local function MakeDiffToggle(key, order)
    return {
        type = "toggle",
        name = function() return GetDiffToggleLabel(key) end,
        desc = function() return L["Diff Toggle Desc"] end,
        -- 0.65 ≈ 1/3 行宽，5 个复选框按 3+2 两行均衡分布
        width = "full",
        order = order,
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

-- ============ 主题应用到设置框（含内层 content/tab 区域）============
-- Ace3 的 AceConfigDialog.Open() 打开的 frame 是 AceGUI Frame，
-- 内部 content 区域是 frame.content（不同 AceGUI 版本可能为 frame.children / 直接的子 frame）。
-- 我们对 frame 本身以及所有 child frame 套用主题，确保内层背景/边框也跟随 ACE3 风格。
local function ApplyThemeToOpenSettings(openFrame)
    if not openFrame or not openFrame.frame or not addon.ApplyThemeToFrame then return end
    addon.ApplyThemeToFrame(openFrame.frame)
    -- 遍历子 frame（content、tab container 等），逐个套用主题
    local function walkChildren(parent)
        if not parent or not parent.GetChildren then return end
        local kids = { parent:GetChildren() }
        for _, child in ipairs(kids) do
            if child and child.SetBackdrop then
                -- 跳过标准 Blizzard 控件（按钮/下拉/编辑框自身的边框由 Blizzard 渲染，强行改 backdrop 容易渲染异常）
                local objType = child.GetObjectType and child:GetObjectType()
                if objType ~= "Button" and objType ~= "EditBox" and objType ~= "Slider" and objType ~= "CheckButton" then
                    addon.ApplyThemeToFrame(child)
                end
            end
            walkChildren(child)
        end
    end
    walkChildren(openFrame.frame)
end

local function ApplyThemeToSettingsFrame()
    local ACD = LibStub("AceConfigDialog-3.0", true)
    local openFrame = ACD and ACD.OpenFrames and ACD.OpenFrames["BossTips"]
    if openFrame then ApplyThemeToOpenSettings(openFrame) end
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

local function BuildMainOptions()
    local options = {
        type = "group",
        name = "BossTips v" .. (addon.version or "?"),
        childGroups = "tab",
        args = {
        -- ===== 第一个标签页：设置 =====
        settings_tab = {
            type = "group",
            name = function() return L["Settings"] end,
            order = 1,
            args = {
                behavior = {
                    type = "group",
                    name = function() return L["Behavior & Interaction"] end,
                    desc = function() return L["Behavior Desc"] end,
                    inline = true,
                    order = 2,
                    args = {
                        guide_window_mode = {
                            type = "select",
                            name = function() return L["Display Mode"] end,
                            desc = function() return L["Display Mode Desc"] end,
                            width = "full",
                            values = function() return {
                                ["auto"] = L["Auto Expand"],
                                ["button"] = L["Button Mode"],
                            } end,
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
                            name = function() return L["Enable Smart Expand"] end,
                            desc = function() return L["Smart Expand Desc"] end,
                            width = "full",
                            get = function() return BossTipsGlobalDB.autoExpandOnTarget end,
                            set = function(_, val) BossTipsGlobalDB.autoExpandOnTarget = val end,
                            order = 1,
                        },
                        autoOpen = {
                            type = "toggle",
                            name = function() return L["Auto Open On Enter"] end,
                            width = "full",
                            hidden = function() return (BossTipsGlobalDB.guideWindowMode or "auto") ~= "auto" end,
                            get = function() return BossTipsGlobalDB.autoOpenOnEnter end,
                            set = function(_, val) BossTipsGlobalDB.autoOpenOnEnter = val end,
                            order = 2,
                        },
                        lock_window = {
                            type = "toggle",
                            name = function() return L["Lock Window"] end,
                            desc = function() return L["Lock Window Desc"] end,
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
                            name = function() return L["Only allow one expanded item at a time"] end,
                            width = "full",
                            get = function() return BossTipsGlobalDB.singleExpand end,
                            set = function(_, val) BossTipsGlobalDB.singleExpand = val; ApplyAppearanceChange() end,
                            order = 4,
                        },
                        showMobs = {
                            type = "toggle",
                            name = function() return L["Show Mob Entries"] end,
                            desc = function() return L["Show Mobs Desc"] end,
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
                    name = function() return L["Difficulty Display"] end,
                    desc = function() return L["Diff Display Desc"] end,
                    inline = true,
                    order = 2.5,
                    args = {
                        default_difficulty = {
                            type = "select",
                            name = function() return L["Default Difficulty"] end,
                            desc = function() return L["Default Difficulty Desc"] end,
                            width = "full",
                            order = 0,
                            values = function()
                                return {
                                    lfr = GetDiffToggleLabel("lfr"),
                                    normal = GetDiffToggleLabel("normal"),
                                    heroic = GetDiffToggleLabel("heroic"),
                                    mythic = GetDiffToggleLabel("mythic"),
                                    mythicplus = GetDiffToggleLabel("mythicplus"),
                                }
                            end,
                            get = function() return BossTipsGlobalDB.defaultDifficulty or "mythic" end,
                            set = function(_, val)
                                BossTipsGlobalDB.defaultDifficulty = val
                                -- 若攻略窗当前显示，立即按新默认难度刷新（优先新默认；该副本无攻略则回退首个可用）
                                if addon.tipsFrame and addon.tipsFrame:IsShown() and addon.currentInstanceName then
                                    local isRaid = false
                                    local m = addon.GuideData and addon.GuideData.meta and addon.GuideData.meta[addon.currentInstanceName]
                                    if m and m.isRaid then isRaid = true end
                                    addon.tipsFrame.difficulty = addon.ResolveVisibleDifficulty(val, isRaid)
                                    addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                                end
                            end,
                        },
                        diff_lfr = MakeDiffToggle("lfr", 1),
                        diff_normal = MakeDiffToggle("normal", 2),
                        diff_heroic = MakeDiffToggle("heroic", 3),
                        diff_mythic = MakeDiffToggle("mythic", 4),
                        diff_mythicplus = MakeDiffToggle("mythicplus", 5),
                    },
                },
                chat_output = {
                    type = "group",
                    name = function() return L["Chat Output"] end,
                    desc = function() return L["Chat Output Desc"] end,
                    inline = true,
                    order = 3,
                    args = {
                        enable_chat_send = {
                            type = "toggle",
                            name = function() return L["Enable sending guide to chat"] end,
                            desc = function() return L["Chat Send Desc"] end,
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
                            name = function() return L["Left Click Channel"] end,
                            desc = function() return L["Left Channel Desc"] end,
                            width = "full",
                            values = function() return {
                                ["SAY"] = L["Say"],
                                ["PARTY"] = L["Party"],
                                ["RAID"] = L["Raid Channel"],
                                ["INSTANCE_CHAT"] = L["Instance"],
                                ["YELL"] = L["Yell"],
                            } end,
                            get = function() return BossTipsGlobalDB.defaultChatChannel end,
                            set = function(_, val) BossTipsGlobalDB.defaultChatChannel = val end,
                            hidden = function() return not BossTipsGlobalDB.enableChatSend end,
                            order = 2,
                        },
                        chat_channel_right = {
                            type = "select",
                            name = function() return L["Right Click Channel"] end,
                            desc = function() return L["Right Channel Desc"] end,
                            width = "full",
                            values = function() return {
                                ["SAY"] = L["Say"],
                                ["PARTY"] = L["Party"],
                                ["RAID"] = L["Raid Channel"],
                                ["INSTANCE_CHAT"] = L["Instance"],
                                ["YELL"] = L["Yell"],
                            } end,
                            get = function() return BossTipsGlobalDB.sendChannelRight or "SAY" end,
                            set = function(_, val) BossTipsGlobalDB.sendChannelRight = val end,
                            hidden = function() return not BossTipsGlobalDB.enableChatSend end,
                            order = 3,
                        },
                        close_after_send = {
                            type = "toggle",
                            name = function() return L["Close After Send"] end,
                            desc = function() return L["Close After Send Desc"] end,
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
                    name = function() return L["Appearance & Testing"] end,
                    desc = function() return L["Appearance Desc"] end,
                    inline = true,
                    order = 4,
                    args = {
                        -- 语言和框体延展方向移入外观与测试分组顶部
                        lang = {
                            type = "select",
                            name = function() return L["Language"] end,
                            desc = function() return L["Language Desc"] end,
                            width = "full",
                            values = function()
                                return {
                                    ["AUTO"] = L["Follow System"],
                                    ["zhCN"] = L["简体中文"],
                                    ["zhTW"] = L["繁體中文"],
                                    ["enUS"] = L["English"],
                                }
                            end,
                            get = function() return BossTipsGlobalDB.lang or "AUTO" end,
                            set = function(_, val)
                                -- 统一切语言入口：一个变量驱动全部文本切换，杜绝残留其他语言
                                if addon.ApplyLanguage then
                                    addon.ApplyLanguage(val)
                                else
                                    BossTipsGlobalDB.lang = val
                                    if addon.RefreshLocale then addon.RefreshLocale() end
                                    if addon.BuildActiveGuides then addon.BuildActiveGuides() end
                                    if addon.BuildGuideOptions then addon.BuildGuideOptions() end
                                    if LibStub("AceConfigRegistry-3.0", true) then
                                        LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
                                    end
                                end
                            end,
                            order = 0,
                        },
                        expandDir = {
                            type = "select",
                            name = function() return L["Expansion Direction"] end,
                            desc = function() return L["Expansion Direction Desc"] end,
                            width = "full",
                            values = function() return {
                                ["down"] = L["Expand Down"],
                                ["up"]   = L["Expand Up"],
                            } end,
                            get = function() return BossTipsGlobalDB.guideExpandDir or "down" end,
                            set = function(_, val)
                                BossTipsGlobalDB.guideExpandDir = val
                                if addon.tipsFrame and addon.tipsFrame.GetTop then
                                    BossTipsGlobalDB.guideFrameTopY = addon.tipsFrame:GetTop()
                                    BossTipsGlobalDB.guideFrameBottomY = addon.tipsFrame:GetBottom()
                                end
                                if addon.tipsFrame and addon.tipsFrame:IsShown() and addon.currentInstanceName and addon.tipsFrame.ShowInstanceGuide then
                                    addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                                end
                            end,
                            order = 0,
                        },
                        theme = {
                            type = "select",
                            name = function() return L["Theme Style"] end,
                            desc = function() return L["Theme Style Desc"] end,
                            width = "full",
                            values = function() return {
                                ["ace3"] = L["ACE3 Theme"],
                                ["default"] = L["Default Theme"],
                            } end,
                            get = function() return BossTipsGlobalDB.theme or "ace3" end,
                            set = function(_, val)
                                BossTipsGlobalDB.theme = val
                                if addon.RefreshAllThemes then addon.RefreshAllThemes() end
                            end,
                            order = 1,
                        },
                        font = {
                            type = "select",
                            name = function() return L["Font"] end,
                            width = "full",
                            values = function() return {
                                ["default"] = L["System Default"],
                                ["damage"] = L["Damage Font"],
                                ["chat"] = L["Chat Bold"],
                            } end,
                            get = function() return BossTipsGlobalDB.tipsFont end,
                            set = function(_, val) BossTipsGlobalDB.tipsFont = val; ApplyAppearanceChange() end,
                            order = 1,
                        },
                        fontSize = {
                            type = "range",
                            name = function() return L["Font Size"] end,
                            min = 10, max = 30, step = 1,
                            get = function() return BossTipsGlobalDB.FontSize end,
                            set = function(_, val) BossTipsGlobalDB.FontSize = val; ApplyAppearanceChange() end,
                            order = 2,
                        },
                        collapsedAlpha = {
                            type = "range",
                            name = function() return L["Collapsed Alpha"] end,
                            width = "full",
                            min = 0.1, max = 1.0, step = 0.05,
                            get = function() return BossTipsGlobalDB.collapsedAlpha end,
                            set = function(_, val) BossTipsGlobalDB.collapsedAlpha = val; ApplyAppearanceChange() end,
                            order = 3,
                        },
                        bgColor = {
                            type = "color",
                            name = function() return L["Background Color & Alpha"] end,
                            width = "full",
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
                            order = 3,
                        },
                        minimap_btn = {
                            type = "toggle",
                            name = function() return L["Show Minimap Button"] end,
                            width = "full",
                            get = function() return BossTipsGlobalDB.showMinimapButton end,
                            set = function(_, val)
                                BossTipsGlobalDB.showMinimapButton = val
                                if addon.RefreshMinimapButton then addon.RefreshMinimapButton() end
                            end,
                            order = 5,
                        },
                        hide_main_button_no_guide = {
                            type = "toggle",
                            name = function() return L["Hide Button When No Guide"] end,
                            desc = function() return L["按钮模式下_当前区域_副本没有攻略时自动隐藏悬浮按钮"] end,
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
                            name = function() return L["Reset Button Position"] end,
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
                            name = function() return L["Show Test Window"] end,
                            width = "full",
                            func = function()
                                if addon.ShowTestWindow then addon.ShowTestWindow() end
                            end,
                            order = 8,
                        },
                        hide_test_window = {
                            type = "execute",
                            name = function() return L["Hide Test Window"] end,
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
        -- ===== 第四个标签页：关于（版权 / 帮助 / 下载与社区）=====
        about_tab = {
            type = "group",
            name = function() return L["About"] end,
            order = 4,
            args = {
                copyright_header = {
                    type = "header",
                    name = function() return L["Copyright"] end,
                    order = 1,
                },
                copyright_desc = {
                    type = "description",
                    name = function()
                        return L["Title"] .. "：Boss Tips\n"
                            .. L["Author"] .. "：nga_babyfenei, nga_以德报德\n"
                            .. (L["Version"] or "Version") .. "：v" .. (addon.version or "?")
                    end,
                    fontSize = "medium",
                    order = 2,
                },
                help_header = {
                    type = "header",
                    name = function() return L["Help"] end,
                    order = 3,
                },
                help_desc = {
                    type = "description",
                    name = function() return L["Help Info"] end,
                    fontSize = "medium",
                    order = 4,
                },
                links_header = {
                    type = "header",
                    name = function() return L["Download & Community"] end,
                    order = 5,
                },
                nga_url = {
                    type = "input",
                    name = function() return L["NGA Post"] end,
                    width = "full",
                    get = function() return NGA_URL end,
                    set = function() end,
                    order = 6,
                },
                curse_url = {
                    type = "input",
                    name = function() return L["CurseForge"] end,
                    width = "full",
                    get = function() return CURSE_URL end,
                    set = function() end,
                    order = 7,
                },
                other_platforms_desc = {
                    type = "description",
                    name = function() return L["Other Platforms Hint"] end,
                    fontSize = "medium",
                    order = 8,
                },
            },
        },
    }
}
    return options
end
addon.BuildMainOptions = BuildMainOptions
local options = BuildMainOptions()

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
    name = function() return L["Guide Options"] end,

    order = 2,
    childGroups = "tree",
    args = {
        -- 最上方：编辑攻略按钮（直接显示在面板顶部，非树节点）
        open_editor_hint = {
            type = "description",
            name = function() return L["Open Editor Desc"] end,
            fontSize = "medium",
            order = 0.5,
        },
        open_editor = {
            type = "execute",
            name = function() return L["Edit Guide Header"] end,
            desc = function() return L["Open Editor Button Desc"] end,
            width = "full",
            order = 1,
            func = function()
                AceConfigDialog:Close("BossTips")
                addon:OpenEditor()
            end,
        },
        editor_divider = {
            type = "header",
            name = function() return L["Dungeons & Categories"] end,
            order = 2,
        },
        -- 5人本 / 团本 树（单击节点即可展开/折叠）
        dungeon_tree = {
            type = "group",
            name = function() return L["Dungeons"] end,
            order = 3,
            childGroups = "tree",
            args = {},
        },
        raid_tree = {
            type = "group",
            name = function() return L["Raid"] end,
            order = 4,
            childGroups = "tree",
            args = {},
        },
    }
}
addon.guideOptions = guideOptions

local function BuildGuideOptions()
    if addon.EnsureDB then addon.EnsureDB() end
    -- 刷新 guideOptions 所有本地化文本（文件加载时 L 可能还是 zhCN）
    guideOptions.name = L["Guide Options"]
    guideOptions.args.open_editor_hint.name = L["Open Editor Desc"]
    guideOptions.args.open_editor.name = L["Edit Guide Header"]
    guideOptions.args.open_editor.desc = L["Open Editor Button Desc"]
    guideOptions.args.editor_divider.name = L["Dungeons & Categories"]
    guideOptions.args.dungeon_tree.name = L["Dungeons"]
    guideOptions.args.raid_tree.name = L["Raid"]
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
            name = function() return L["Enable this version"] end,
            desc = mode == "raid" and L["Hide Version Raids"] or L["Hide Version Dungeons"],
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
        for inst, dinfo in pairs(dungeons) do
            instList[#instList + 1] = { inst = inst, source = dinfo and dinfo.source }
        end
        table.sort(instList, function(a, b) return a.inst < b.inst end)
        local dorder = 2
        for _, item in ipairs(instList) do
            local inst = item.inst
            local catType = (mode == "raid") and "raids" or ((item.source == "mplus") and "mplus" or "native")
            verArgs["dung_" .. inst] = {
                type = "toggle",
                name = addon.GetLocalizedInstanceName(inst, catType, vid),
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
addon.BuildGuideOptions = BuildGuideOptions

-- ============ 配置文件标签（简单版，未使用 AceDB Profile） ============
local function ResetProfile()
    StaticPopupDialogs["BOSSTIPS_RESET_PROFILE"] = {
        text = L["Reset Profile Confirm"],
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
            print(L["|cff00ff00BossTips|r profile reset."])
        end,
        timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
    }
    StaticPopup_Show("BOSSTIPS_RESET_PROFILE")
end

local function BuildProfileOptions()
    return {
        type = "group",
        name = function() return L["Profiles"] end,
        order = 3,
        args = {
            current_profile = {
                type = "description",
                name = function() return L["Current Profile: "] .. L["Default"] .. L["Profile Reset Desc"] end,
                order = 1,
            },
            reset_profile = {
                type = "execute",
                name = function() return L["Reset Current Profile"] end,
                width = "full",
                func = ResetProfile,
                order = 2,
            },
        }
    }
end
addon.BuildProfileOptions = BuildProfileOptions
local profileOptions = BuildProfileOptions()

-- ADDON_LOADED：注册选项表
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == addonName then
        if addon.EnsureDB then addon.EnsureDB() end
        -- SavedVariables 此时已加载，按真实 lang 重新解析 locale 并重建设置面板
        if addon.RefreshLocale then addon.RefreshLocale() end
        options = BuildMainOptions()
        profileOptions = BuildProfileOptions()
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
        print(L["|cffff0000BossTips|r Cannot open settings in combat."])
        return
    end
    local AceConfigDialog = LibStub("AceConfigDialog-3.0", true)
    if not AceConfigDialog then return end
    local openFrame = AceConfigDialog.OpenFrames and AceConfigDialog.OpenFrames["BossTips"]
    -- 切换：已打开则关闭（关闭后由 OnHide 钩子恢复攻略窗）
    if openFrame and openFrame.frame and openFrame.frame:IsShown() then
        AceConfigDialog:Close("BossTips")
        return
    end
    -- 打开设置时临时隐藏攻略窗，避免“设置面板 + 攻略窗”两个面板叠加（选语言时尤为明显）
    addon._guideShownBeforeSettings = (addon.tipsFrame and addon.tipsFrame:IsShown()) or false
    if addon.tipsFrame then addon.tipsFrame:Hide() end
    if addon.EnsureDB then addon.EnsureDB() end
    if LibStub("AceConfigRegistry-3.0", true) then
        LibStub("AceConfigRegistry-3.0"):NotifyChange("BossTips")
    end
    AceConfigDialog:Open("BossTips")
    -- 打开后立即套用当前主题（ACE3/官方默认），让设置框与攻略窗风格一致
    ApplyThemeToSettingsFrame()
    -- 关闭按钮使用插件语言（Blizzard 默认 CLOSE 会跟随客户端语言）
    openFrame = AceConfigDialog.OpenFrames and AceConfigDialog.OpenFrames["BossTips"]
    if openFrame and openFrame.frame and openFrame.frame.close then
        openFrame.frame.close:SetText(L["Close"])
    end
    -- 注：ESC 关闭由 AceConfig 自身的 CloseSpecialWindows 钩子处理（AceConfigDialog:Open 内已注册），
    -- 切勿在此对设置框 EnableKeyboard(true) —— 会让设置框捕获键盘且 OnKeyDown 不转发其它按键，
    -- 导致打开设置后游戏键盘失灵（与先前隐藏 EditBox 抢焦点同一类问题）。
    -- 设置关闭后恢复攻略窗（若原本可见且未被手动隐藏），保持与切换语言前一致
    if openFrame and openFrame.frame and not addon._btSettingsHideHooked then
        addon._btSettingsHideHooked = true
        openFrame.frame:HookScript("OnHide", function()
            if addon._guideShownBeforeSettings and addon.tipsFrame and not addon.manuallyHidden then
                -- 仅在副本内有匹配攻略时恢复攻略窗；
                -- 测试窗体不再随设置关闭自动弹出（避免「其他时间」意外弹出），用户需主动点击主按钮或在设置里点「显示测试窗体」
                if addon.currentInstanceName and (HasCurrentMapGuide and HasCurrentMapGuide()) then
                    addon.tipsFrame:ShowInstanceGuide(addon.currentInstanceName)
                end
            end
            addon._guideShownBeforeSettings = false
        end)
    end
end
