-- ============================================================================
-- BossTips Picker.lua —— 副本选择器（按大版本折叠，AceGUI TreeGroup）
-- 点击副本 → 弹出攻略窗。对齐 DungeonCheatSheet 的 TreeGroup 三层树风格。
-- ============================================================================
local addonName, addon = ...
local L = addon.L
local AceGUI = LibStub("AceGUI-3.0")

local function BuildTree()
    local treeData = {}
    -- 原生版本
    for _, vid in ipairs(addon.GetNativeOrder()) do
        local catNode = { value = "V:" .. vid, text = addon.GetVersionLabel(vid), children = {} }
        local dungeons = addon.GuideData.versions[vid]
        if dungeons then
            local names = {}
            for instName in pairs(dungeons) do names[#names + 1] = instName end
            table.sort(names)
            for _, instName in ipairs(names) do
                table.insert(catNode.children, { value = instName, text = instName })
            end
        end
        table.insert(treeData, catNode)
    end
    -- 大秘境当前赛季
    for _, sid in ipairs(addon.GetMPlusOrder()) do
        local catNode = { value = "M:" .. sid, text = addon.GetVersionLabel(sid), children = {} }
        local dungeons = addon.GuideData.mplus[sid]
        if dungeons then
            local names = {}
            for instName in pairs(dungeons) do names[#names + 1] = instName end
            table.sort(names)
            for _, instName in ipairs(names) do
                table.insert(catNode.children, { value = instName, text = instName })
            end
        end
        table.insert(treeData, catNode)
    end
    return treeData
end

function addon:CreateDungeonPicker()
    if addon.dungeonPicker then return addon.dungeonPicker end

    local frame = AceGUI:Create("Frame")
    frame:SetTitle(L["Open Dungeon Picker"] or "BossTips 副本选择")
    frame:SetLayout("Fill")
    frame:SetWidth(340)
    frame:SetHeight(480)
    addon.dungeonPicker = frame

    frame:SetCallback("OnClose", function(widget) widget:Hide() end)

    local treeGroup = AceGUI:Create("TreeGroup")
    treeGroup:SetLayout("Flow")
    treeGroup:SetTreeWidth(280)
    treeGroup:SetTree(BuildTree())
    frame:AddChild(treeGroup)

    treeGroup:SetCallback("OnGroupSelected", function(widget, event, group)
        -- 根节点：V:版本 或 M:赛季；副本节点：根\001实例名
        local path = { strsplit("\001", group) }
        if #path == 2 and (string.sub(path[1], 1, 2) == "V:" or string.sub(path[1], 1, 2) == "M:") then
            local instName = path[2]
            addon:SelectInstanceAndShow(instName)
        end
    end)

    return frame
end

-- 加载期即创建（Core 的小地图按钮依赖 addon.dungeonPicker）
addon:CreateDungeonPicker()
