-- ============================================================================
-- BossTips Editor.lua —— 副本与目标编辑器（对齐 DungeonCheatSheet 界面）
-- 三层树：分类 → 副本 → 目标。编辑写入 WTF 覆盖层 BossTipsGlobalDB。
-- 支持：自定义分类、自定义副本（类型/难度）、副本开关、首领战ID、导入导出。
-- ============================================================================
local addonName, addon = ...
local L = addon.L
local AceGUI = LibStub("AceGUI-3.0")

-- Tree value 路径分隔符：不用 \001，避免与 AceGUI TreeGroup 内部路径分隔符冲突。
-- 注意：AceGUI 仍会用它自己的 \001 把父-子 value 拼成完整路径传回 OnGroupSelected，
-- 所以 ParsePath 要先按 \001 取最后一级（叶子 value），再用我们的 "/" token 解析。
local SEP = "/"

-- 编辑器当前显示的标签页：地下城(dungeon) / 团本(raid)
local editorMode = "dungeon"

-- 当前正在编辑的难度（各难度独立编辑；已取消「通用」聚合难度，改为分别编辑 随机/英雄/史诗/史诗+）
local editDiff = "lfr"
local DIFF_EDIT_OPTION_KEYS = {
    ["lfr"] = "LFR",
    ["normal"] = "Normal",
    ["heroic"] = "Heroic",
    ["mythic"] = "Mythic",
    ["mythicplus"] = "Mythic Plus Short",
}
local function GetDiffEditLabel(key)
    return L[DIFF_EDIT_OPTION_KEYS[key]] or key
end

-- 副本类型 / 难度选项（运行时查询 L，避免文件加载时 locale 未就绪导致定死中文）
local DIFFICULTIES_ORDER = { "", "normal", "heroic", "mythic", "mythicplus" }
local RAID_DIFFICULTIES_ORDER = { "", "normal", "heroic", "mythic" }
local function GetDungeonTypes()
    return {
        [""] = L["No Limit"],
        ["dungeon"] = L["Dungeon"],
        ["raid"] = L["Raid"],
        ["mplus"] = L["Mythic Plus"],
    }
end
local function GetDifficulties(isRaid)
    local t = {
        [""] = L["No Limit"],
        ["normal"] = L["Normal"],
        ["heroic"] = L["Heroic"],
        ["mythic"] = L["Mythic"],
    }
    if not isRaid then t["mythicplus"] = L["Mythic Plus Short"] end
    return t
end

local function IsBuiltInVersion(verId)
    local GD = addon.GuideData
    return (GD.versions and GD.versions[verId]) or (GD.mplus and GD.mplus[verId])
end

local function IsCustomVersion(verId)
    return BossTipsGlobalDB.customVersions and BossTipsGlobalDB.customVersions[verId] ~= nil
end

local function IsCustomRaidVersion(verId)
    return BossTipsGlobalDB.customRaidVersions and BossTipsGlobalDB.customRaidVersions[verId] ~= nil
end

local function IsBuiltInDungeon(verId, instName, isRaid)
    local GD = addon.GuideData
    if isRaid then
        return (GD.raids and GD.raids[verId] and GD.raids[verId][instName]) ~= nil
    end
    return (GD.versions and GD.versions[verId] and GD.versions[verId][instName]) or
           (GD.mplus and GD.mplus[verId] and GD.mplus[verId][instName])
end

local function GetDungeonBossesForEditor(verId, instName, isRaid)
    if addon.EnsureDB then addon.EnsureDB() end
    local bosses = {}
    local GD = addon.GuideData
    local src
    if isRaid then
        src = (GD.raids and GD.raids[verId] and GD.raids[verId][instName])
    else
        src = (GD.versions and GD.versions[verId] and GD.versions[verId][instName]) or
              (GD.mplus and GD.mplus[verId] and GD.mplus[verId][instName])
    end
    if src then
        for boss, entry in pairs(src) do
            bosses[boss] = { source = "builtin", order = entry.order or 999, type = entry.type or "BOSS", tips = entry.tips or "", encounterId = addon.GetBossEncounterId(instName, boss) or "" }
        end
    end
    local custom = BossTipsGlobalDB.customDungeons[instName]
    if isRaid then
        custom = BossTipsGlobalDB.customRaids[instName]
    end
    if custom and custom.bosses then
        for boss, b in pairs(custom.bosses) do
            bosses[boss] = { source = "custom", order = b.order or 999, type = b.type or "BOSS", tips = b.tips or "", encounterId = b.encounterId or "" }
        end
    end
    local g = BossTipsGlobalDB.guides[instName]
    if g then
        for boss, tips in pairs(g) do
            local etype, tipText = "BOSS", tips
            if type(tips) == "table" then etype = tips.type or "BOSS"; tipText = tips.tips or "" end
            if not bosses[boss] then
                bosses[boss] = { source = "custom", order = 999, type = etype, tips = tipText, encounterId = addon.GetBossEncounterId(instName, boss) or "" }
            else
                bosses[boss].tips = tipText
                if etype == "MOB" then bosses[boss].type = "MOB" end
                -- 只要玩家在此副本/目标上有 WTF 覆盖，即视为自定义
                bosses[boss].source = "custom"
            end
        end
    end
    return bosses
end

local function IsDungeonHidden(instName)
    return BossTipsGlobalDB.hiddenDungeons and BossTipsGlobalDB.hiddenDungeons[instName] == true
end

local function IsDungeonActive(instName)
    local custom = BossTipsGlobalDB.customDungeons[instName]
    if custom then return custom.isActive ~= false end
    local raidCustom = BossTipsGlobalDB.customRaids[instName]
    if raidCustom then return raidCustom.isActive ~= false end
    return not IsDungeonHidden(instName)
end

-- ==========================================
-- 布局辅助
-- ==========================================
local function AddFullWidth(container, widget)
    widget:SetFullWidth(true)
    container:AddChild(widget)
    return widget
end

local function AddRow(container, leftWidget, rightWidget)
    local row = AceGUI:Create("SimpleGroup")
    row:SetLayout("Flow")
    row:SetFullWidth(true)
    leftWidget:SetRelativeWidth(0.5)
    rightWidget:SetRelativeWidth(0.5)
    row:AddChild(leftWidget)
    row:AddChild(rightWidget)
    container:AddChild(row)
    return row
end

local function AddHeading(container, text)
    local h = AceGUI:Create("Heading")
    h:SetText(text)
    h:SetFullWidth(true)
    container:AddChild(h)
    return h
end

local function AddLabel(container, text)
    local l = AceGUI:Create("Label")
    l:SetText(text)
    l:SetFullWidth(true)
    container:AddChild(l)
    return l
end

local function AddButton(container, text, callback, fullWidth)
    local b = AceGUI:Create("Button")
    b:SetText(text)
    b:SetCallback("OnClick", callback)
    if fullWidth then b:SetFullWidth(true) end
    container:AddChild(b)
    return b
end

-- ==========================================
-- 确认弹窗
-- ==========================================
StaticPopupDialogs["BOSSTIPS_CONFIRM_DELETE"] = {
    text = "%s",
    button1 = YES,
    button2 = NO,
    OnAccept = function(self, data)
        if data and data.func then data.func(data) end
        if data and data.frame then data.frame:RefreshTree(data.selectPath) end
    end,
    timeout = 0, whileDead = true, hideOnEscape = true, preferredIndex = 3,
}

local function ConfirmDialog(text, data)
    StaticPopup_Show("BOSSTIPS_CONFIRM_DELETE", text, nil, data)
end

-- ==========================================
-- Tree value 路径格式（/ 分隔）
-- ==========================================
local function PathVersion(verId) return "V" .. SEP .. verId end
local function PathNewDungeon(verId) return "V" .. SEP .. verId .. SEP .. "NEW_DUNGEON" end
local function PathDungeon(verId, instName) return "V" .. SEP .. verId .. SEP .. "D" .. SEP .. instName end
local function PathNewBoss(verId, instName) return "V" .. SEP .. verId .. SEP .. "D" .. SEP .. instName .. SEP .. "NEW_BOSS" end
local function PathBoss(verId, instName, bossName) return "V" .. SEP .. verId .. SEP .. "D" .. SEP .. instName .. SEP .. "B" .. SEP .. bossName end

-- 团本路径（以 "R" 区分，避免与 5 人本 "V" 命名空间冲突）
local function PathRaidVersion(verId) return "R" .. SEP .. verId end
local function PathNewRaidDungeon(verId) return "R" .. SEP .. verId .. SEP .. "NEW_DUNGEON" end
local function PathRaidDungeon(verId, instName) return "R" .. SEP .. verId .. SEP .. "D" .. SEP .. instName end
local function PathNewRaidBoss(verId, instName) return "R" .. SEP .. verId .. SEP .. "D" .. SEP .. instName .. SEP .. "NEW_BOSS" end
local function PathRaidBoss(verId, instName, bossName) return "R" .. SEP .. verId .. SEP .. "D" .. SEP .. instName .. SEP .. "B" .. SEP .. bossName end

local function GetLeafPath(group)
    if not group then return tostring(group) end
    local leaf = group
    local sep001 = "\001"
    local idx = string.find(leaf, sep001, 1, true)
    while idx do
        leaf = string.sub(leaf, idx + 1)
        idx = string.find(leaf, sep001, 1, true)
    end
    return leaf
end

local function ParsePath(group)
    if group == "import_export" then return "import_export", nil, nil, nil, GetLeafPath(group) end
    if group == "new_version" then return "new_version", nil, nil, nil, GetLeafPath(group) end
    if group == "new_raid_version" then return "new_raid_version", nil, nil, nil, GetLeafPath(group) end
    if not group then return "unknown", nil, nil, nil, GetLeafPath(group) end
    -- AceGUI TreeGroup 传回的是 "父\001子\001叶子value"，先取最后一级
    local leaf = GetLeafPath(group)
    local parts = {}
    for p in string.gmatch(leaf, "[^" .. SEP .. "]+") do table.insert(parts, p) end
    if parts[1] == "R" then
        -- 团本命名空间
        local verId = parts[2]
        local t3 = parts[3]
        if not t3 then return "raid_version", verId, nil, nil, leaf, true end
        if t3 == "NEW_DUNGEON" then return "new_raid_dungeon", verId, nil, nil, leaf, true end
        if t3 == "D" then
            local instName = parts[4]
            local t5 = parts[5]
            if not t5 then return "raid_dungeon", verId, instName, nil, leaf, true end
            if t5 == "NEW_BOSS" then return "new_raid_boss", verId, instName, nil, leaf, true end
            if t5 == "B" and parts[6] then return "raid_boss", verId, instName, parts[6], leaf, true end
        end
        return "unknown", nil, nil, nil, leaf, true
    end
    if parts[1] ~= "V" then return "unknown", nil, nil, nil, leaf end
    local verId = parts[2]
    local t3 = parts[3]
    if not t3 then return "version", verId, nil, nil, leaf end
    if t3 == "NEW_DUNGEON" then return "new_dungeon", verId, nil, nil, leaf end
    if t3 == "D" then
        local instName = parts[4]
        local t5 = parts[5]
        if not t5 then return "dungeon", verId, instName, nil, leaf end
        if t5 == "NEW_BOSS" then return "new_boss", verId, instName, nil, leaf end
        if t5 == "B" and parts[6] then return "boss", verId, instName, parts[6], leaf end
    end
    return "unknown", nil, nil, nil, leaf
end

-- 根据叶子 value 构造 AceGUI TreeGroup 所需的 \001 完整路径
local function BuildUniqueValue(leafPath)
    local nodeType, verId, instName, bossName = ParsePath(leafPath)
    if nodeType == "import_export" then return "import_export" end
    if nodeType == "new_version" then return "new_version" end
    if nodeType == "new_raid_version" then return "new_raid_version" end
    if nodeType == "new_raid_dungeon" then return PathNewRaidDungeon(verId) end
    if nodeType == "new_raid_boss" then return PathNewRaidBoss(verId, instName) end
    if nodeType == "unknown" then return leafPath end
    if nodeType == "raid_version" or nodeType == "raid_dungeon" or nodeType == "raid_boss" then
        local parts = { PathRaidVersion(verId) }
        if instName then
            parts[#parts + 1] = PathRaidDungeon(verId, instName)
            if bossName then
                parts[#parts + 1] = PathRaidBoss(verId, instName, bossName)
            end
        end
        return table.concat(parts, "\001")
    end
    local parts = { PathVersion(verId) }
    if instName then
        parts[#parts + 1] = PathDungeon(verId, instName)
        if bossName then
            parts[#parts + 1] = PathBoss(verId, instName, bossName)
        elseif nodeType == "new_boss" then
            parts[#parts + 1] = PathNewBoss(verId, instName)
        end
    elseif nodeType == "new_dungeon" then
        parts[#parts + 1] = PathNewDungeon(verId)
    end
    return table.concat(parts, "\001")
end

-- ==========================================
-- encounterId 读写
-- ==========================================
local function SaveEncounterId(instName, bossName, eid)
    BossTipsGlobalDB.encounterOverrides = BossTipsGlobalDB.encounterOverrides or {}
    if not BossTipsGlobalDB.encounterOverrides[instName] then
        BossTipsGlobalDB.encounterOverrides[instName] = {}
    end
    if eid and eid ~= "" then
        BossTipsGlobalDB.encounterOverrides[instName][bossName] = eid
    else
        BossTipsGlobalDB.encounterOverrides[instName][bossName] = nil
        if not next(BossTipsGlobalDB.encounterOverrides[instName]) then
            BossTipsGlobalDB.encounterOverrides[instName] = nil
        end
    end
end

-- ==========================================
-- 构建树
-- ==========================================
local function BuildTree()
    if addon.EnsureDB then addon.EnsureDB() end
    local treeData = {}
    table.insert(treeData, { value = "import_export", text = "|cff00ccff" .. (L["Import Export Short"] or L["[<=> Import & Export]"]) .. "|r" })
    if editorMode == "raid" then
        table.insert(treeData, { value = "new_raid_version", text = "|cff00ff00" .. (L["New Raid Category"] or L["[New Raid Category]"]) .. "|r" })
    else
        table.insert(treeData, { value = "new_version", text = "|cff00ff00" .. (L["New Category"] or L["[New Category]"]) .. "|r" })
    end

    -- ============ 团本模式：仅渲染团本树 ============
    if editorMode == "raid" then
        local raidVerIds = addon.GetRaidVersionIDs()
        table.sort(raidVerIds, function(a, b)
            local na, nb = addon.ParseVersionNumber and addon.ParseVersionNumber(a), addon.ParseVersionNumber and addon.ParseVersionNumber(b)
            if na and nb then return na > nb end
            if na then return true end
            if nb then return false end
            return tostring(a) > tostring(b)
        end)
        for _, verId in ipairs(raidVerIds) do
            local enabled = addon.IsRaidVersionEnabled(verId)
            local statusStr = enabled and "" or " |cff888888" .. (L["Hidden"] or L["[Hidden]"]) .. "|r"
            local verNode = {
                value = PathRaidVersion(verId),
                text = "|cffffcc00" .. addon.GetRaidVersionLabel(verId) .. "|r" .. statusStr,
                children = {}
            }
            table.insert(verNode.children, { value = PathNewRaidDungeon(verId), text = "|cff00ff00" .. (L["New Raid"] or L["[New Raid Dungeon]"]) .. "|r" })
            local dungeons = addon.GetRaidDungeons(verId)
            local names = {}
            for instName in pairs(dungeons) do names[#names + 1] = instName end
            table.sort(names)
            for _, instName in ipairs(names) do
                local hidden = IsDungeonHidden(instName)
                local hStr = hidden and " |cff888888" .. (L["Hidden"] or L["[Hidden]"]) .. "|r" or ""
                local instDisplay = (addon.GetLocalizedInstanceName and addon.GetLocalizedInstanceName(instName, "raids", verId)) or instName
                local instNode = {
                    value = PathRaidDungeon(verId, instName),
                    text = instDisplay .. hStr,
                    children = {}
                }
                table.insert(instNode.children, { value = PathNewRaidBoss(verId, instName), text = "|cff00ff00" .. (L["New Target"] or L["[Add Target In Dungeon]"]) .. "|r" })
                local bosses = GetDungeonBossesForEditor(verId, instName, true)
                local bossList = {}
                for boss in pairs(bosses) do bossList[#bossList + 1] = boss end
                table.sort(bossList, function(a, b)
                    local oa, ob = bosses[a].order or 999, bosses[b].order or 999
                    if oa ~= ob then return oa < ob end
                    return a < b
                end)
                for _, boss in ipairs(bossList) do
                    local displayName = (addon.GetLocalizedBossName and addon.GetLocalizedBossName(instName, boss, true, verId)) or boss
                    table.insert(instNode.children, { value = PathRaidBoss(verId, instName, boss), text = displayName })
                end
                table.insert(verNode.children, instNode)
            end
            table.insert(treeData, verNode)
        end
        return treeData
    end

    -- 排序：当前赛季置顶，其余按版本号倒序
    local allVerIds = addon.GetAllVersionIDs()
    table.sort(allVerIds, function(a, b)
        local isCurrentA = (a == "Current") or (addon.GuideData.mplusInfo and addon.GuideData.mplusInfo[a] and addon.GuideData.mplusInfo[a].isCurrent)
        local isCurrentB = (b == "Current") or (addon.GuideData.mplusInfo and addon.GuideData.mplusInfo[b] and addon.GuideData.mplusInfo[b].isCurrent)
        if isCurrentA and not isCurrentB then return true end
        if isCurrentB and not isCurrentA then return false end
        local na, nb = addon.ParseVersionNumber and addon.ParseVersionNumber(a), addon.ParseVersionNumber and addon.ParseVersionNumber(b)
        if na and nb then return na > nb end
        if na then return true end
        if nb then return false end
        return tostring(a) > tostring(b)
    end)

    for _, verId in ipairs(allVerIds) do
        local enabled = addon.IsVersionEnabled(verId)
        local statusStr = enabled and "" or " |cff888888" .. (L["Hidden"] or L["[Hidden]"]) .. "|r"
        local verNode = {
            value = PathVersion(verId),
            text = "|cffffcc00" .. addon.GetVersionLabel(verId) .. "|r" .. statusStr,
            children = {}
        }

        table.insert(verNode.children, { value = PathNewDungeon(verId), text = "|cff00ff00" .. (L["New Dungeon"] or L["[New Dungeon]"]) .. "|r" })

        local dungeons = addon.GetVersionDungeons(verId)
        local names = {}
        for instName in pairs(dungeons) do names[#names + 1] = instName end
        table.sort(names)
        for _, instName in ipairs(names) do
            local hidden = IsDungeonHidden(instName)
            local active = IsDungeonActive(instName)
            local hStr = (hidden or not active) and " |cff888888" .. (L["Hidden"] or L["[Hidden]"]) .. "|r" or ""
            local info = dungeons[instName]
            local catType = (info and info.source == "mplus") and "mplus" or "native"
            local instDisplay = (addon.GetLocalizedInstanceName and addon.GetLocalizedInstanceName(instName, catType, verId)) or instName
            local instNode = {
                value = PathDungeon(verId, instName),
                text = instDisplay .. hStr,
                children = {}
            }
            table.insert(instNode.children, { value = PathNewBoss(verId, instName), text = "|cff00ff00" .. (L["New Target"] or L["[Add Target In Dungeon]"]) .. "|r" })
            local bosses = GetDungeonBossesForEditor(verId, instName)
            local bossList = {}
            for boss in pairs(bosses) do bossList[#bossList + 1] = boss end
            table.sort(bossList, function(a, b)
                local oa, ob = bosses[a].order or 999, bosses[b].order or 999
                if oa ~= ob then return oa < ob end
                return a < b
            end)
            for _, boss in ipairs(bossList) do
                local displayName = (addon.GetLocalizedBossName and addon.GetLocalizedBossName(instName, boss, false, verId)) or boss
                table.insert(instNode.children, { value = PathBoss(verId, instName, boss), text = displayName })
            end
            table.insert(verNode.children, instNode)
        end
        table.insert(treeData, verNode)
    end
    return treeData
end
addon.BuildEditorTree = BuildTree

-- ==========================================
-- 保存辅助
-- ==========================================
local function SaveBossTips(instName, bossName, text)
    BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
    BossTipsGlobalDB.guides[instName] = BossTipsGlobalDB.guides[instName] or {}
    local rg = BossTipsGlobalDB.guides[instName][bossName]
    -- 编辑特定难度：确保该条目标为 table 并写入 tipsByDifficulty
    if type(rg) ~= "table" then
        local base = (type(rg) == "string" and rg) or ""
        rg = { tips = base, type = "BOSS", tipsByDifficulty = {} }
        BossTipsGlobalDB.guides[instName][bossName] = rg
    end
    rg.tipsByDifficulty = rg.tipsByDifficulty or {}
    -- 大秘境仅存 mythicplus 一档：即使编辑难度落在其它档也写入 mythicplus
    local saveDiff = editDiff
    local e = addon.GetActiveGuideEntry(instName, bossName)
    if e and e._src and e._src.type == "mplus" then saveDiff = "mythicplus" end
    rg.tipsByDifficulty[saveDiff] = text
    -- 编辑随机(lfr)时同步更新 tips 字段，保持兜底内容一致
    if saveDiff == "lfr" then rg.tips = text end
    addon.RefreshGuides()
end

local function SaveBossType(instName, bossName, newType)
    BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
    BossTipsGlobalDB.guides[instName] = BossTipsGlobalDB.guides[instName] or {}
    local rg = BossTipsGlobalDB.guides[instName][bossName]
    if type(rg) == "table" then
        rg.type = newType
    else
        local tips = rg or ""
        BossTipsGlobalDB.guides[instName][bossName] = { tips = tips, type = newType }
    end
    addon.RefreshGuides()
end

local function GetRawGuide(instName, bossName)
    local entry = addon.GetActiveGuideEntry(instName, bossName)
    local rg = BossTipsGlobalDB.guides[instName] and BossTipsGlobalDB.guides[instName][bossName]
    local currentType = (entry and entry.type) or "BOSS"

    local function extractTips(tbl)
        if type(tbl) ~= "table" then return nil end
        if tbl.tipsByDifficulty and tbl.tipsByDifficulty[editDiff] and tbl.tipsByDifficulty[editDiff] ~= "" then
            return tbl.tipsByDifficulty[editDiff]
        end
        if tbl.tips and tbl.tips ~= "" then return tbl.tips end
        return nil
    end

    local curTips
    local wtfTips = rg and extractTips(rg)
    if wtfTips then
        -- WTF 自定义攻略：用户自己编辑/导入的内容，保持原样不翻译
        curTips = wtfTips
        if type(rg) == "table" and rg.type then currentType = rg.type end
    elseif entry then
        -- 内置攻略：走翻译层，按当前 locale + 编辑难度取译文
        -- 大秘境仅存 mythicplus 一档，强制按该难度取译文
        local lookupDiff = (entry._src and entry._src.type == "mplus") and "mythicplus" or editDiff
        curTips = addon.GetGuideText(entry, lookupDiff) or addon.GetTipsForDifficulty(entry, lookupDiff) or ""
    else
        curTips = ""
    end
    return curTips, currentType
end
addon.GetRawGuide = GetRawGuide

-- ==========================================
-- 主编辑器窗口
-- ==========================================
function addon:CreateEditorFrame()
    if addon.EnsureDB then addon.EnsureDB() end
    if addon.editorFrame then
        addon.editorFrame:Show()
        addon.editorFrame:RefreshTree()
        return
    end

    local frame = AceGUI:Create("Frame")
    frame:SetTitle(L["Dungeon & Target Editor"] or L["Dungeon & Target Editor"])
    frame:SetLayout("Flow")
    frame:SetWidth(820)
    frame:SetHeight(600)
    addon.editorFrame = frame
    -- 关闭按钮跟随插件语言（AceGUI Frame 的关闭按钮为 frame.frame.close）
    if frame.frame and frame.frame.close then
        frame.frame.close:SetText(L["Close"])
    end

    frame:SetCallback("OnClose", function(widget)
        widget:Hide()
        addon.RefreshGuides()
        if not InCombatLockdown() and addon.OpenMainGUI then addon:OpenMainGUI() end
    end)

    -- 顶部工具栏：标签页切换（地下城/团本）+ 展开/折叠
    -- 前置声明 treeGroup：下方“一键展开/折叠”按钮闭包需捕获本变量，
    -- 否则若在按钮之后才 local treeGroup，闭包会捕获到 nil/外层变量导致按钮失效。
    local treeGroup
    local toolbar = AceGUI:Create("SimpleGroup")
    toolbar:SetLayout("Flow")
    toolbar:SetFullWidth(true)

    local dungeonTab = AceGUI:Create("Button")
    dungeonTab:SetText(L["Dungeon"])
    dungeonTab:SetWidth(100)
    local raidTab = AceGUI:Create("Button")
    raidTab:SetText(L["Raid"])
    raidTab:SetWidth(100)
    local function RefreshTabHighlight()
        dungeonTab:SetText(editorMode == "dungeon" and "|cffffff00[" .. L["Dungeon"] .. "]|r" or L["Dungeon"])
        raidTab:SetText(editorMode == "raid" and "|cffffff00[" .. L["Raid"] .. "]|r" or L["Raid"])
    end
    dungeonTab:SetCallback("OnClick", function()
        if editorMode ~= "dungeon" then editorMode = "dungeon"; RefreshTabHighlight(); frame:RefreshTree() end
    end)
    raidTab:SetCallback("OnClick", function()
        if editorMode ~= "raid" then editorMode = "raid"; RefreshTabHighlight(); frame:RefreshTree() end
    end)
    toolbar:AddChild(dungeonTab)
    toolbar:AddChild(raidTab)
    -- 一键展开 / 一键折叠（作用于当前树）
    local expandBtn = AceGUI:Create("Button")
    expandBtn:SetText(L["Expand All"])
    expandBtn:SetWidth(100)
    expandBtn:SetCallback("OnClick", function()
        local status = treeGroup.status or treeGroup.localstatus
        status.groups = status.groups or {}
        local function walk(list, prefix)
            for _, node in ipairs(list) do
                if node.children and #node.children > 0 then
                    local uv = prefix and (prefix .. "\001" .. node.value) or node.value
                    status.groups[uv] = true
                    walk(node.children, uv)
                end
            end
        end
        walk(BuildTree(), nil)
        treeGroup:RefreshTree()
    end)
    toolbar:AddChild(expandBtn)
    local collapseBtn = AceGUI:Create("Button")
    collapseBtn:SetText(L["Collapse All"])
    collapseBtn:SetWidth(100)
    collapseBtn:SetCallback("OnClick", function()
        local status = treeGroup.status or treeGroup.localstatus
        status.groups = status.groups or {}
        local function walk(list, prefix)
            for _, node in ipairs(list) do
                if node.children and #node.children > 0 then
                    local uv = prefix and (prefix .. "\001" .. node.value) or node.value
                    status.groups[uv] = nil
                    walk(node.children, uv)
                end
            end
        end
        walk(BuildTree(), nil)
        treeGroup:RefreshTree()
    end)
    toolbar:AddChild(collapseBtn)
    frame:AddChild(toolbar)
    RefreshTabHighlight()

    treeGroup = AceGUI:Create("TreeGroup")
    -- TreeGroup 右侧内容区应使用 Fill，让 ScrollFrame 占满整个右侧面板
    treeGroup:SetLayout("Fill")
    treeGroup:SetTreeWidth(260)
    treeGroup:SetFullWidth(true)
    treeGroup:SetHeight(540)
    treeGroup:SetTree(BuildTree())
    frame:AddChild(treeGroup)
    frame.treeGroup = treeGroup

    function frame:RefreshTree(selectedPath)
        treeGroup:SetTree(BuildTree())
        if selectedPath then
            -- 容错：不同 AceGUI 版本的 TreeGroup 支持 SelectByValue/SelectByPath 之一
            local uv = BuildUniqueValue(selectedPath)
            local ok = pcall(function()
                if treeGroup.SelectByValue then
                    treeGroup:SelectByValue(uv)
                elseif treeGroup.SelectByPath then
                    treeGroup:SelectByPath(selectedPath)
                end
            end)
            if not ok then
                -- 回退：尝试直接按叶子 value 选中
                pcall(function()
                    if treeGroup.SelectByValue then treeGroup:SelectByValue(selectedPath) end
                end)
            end
        end
    end

    -- 单击版本/副本/团本节点整行即展开或折叠（无需点右侧 + 号，也无需双击）。
    -- value 是 \001 拼接的 uniquevalue（即 status.groups 的键），直接取反即可，
    -- 不能用 ParsePath（它按 / 解析 leaf，对 \001 拼接的整路径会返回 unknown）。
    treeGroup:SetCallback("OnClick", function(_, _, value)
        local status = treeGroup.status or treeGroup.localstatus
        status.groups = status.groups or {}
        status.groups[value] = not (status.groups[value] or false)
        treeGroup:RefreshTree()
    end)

    treeGroup:SetCallback("OnGroupSelected", function(widget, event, group)
        widget:ReleaseChildren()
        local scroll = AceGUI:Create("ScrollFrame")
        scroll:SetLayout("List")
        scroll:SetFullWidth(true)
        scroll:SetFullHeight(true)
        widget:AddChild(scroll)

        local function ShowError(msg)
            scroll:ReleaseChildren()
            AddHeading(scroll, L["Editor Load Failed"])
            AddLabel(scroll, "|cffff0000" .. tostring(msg) .. "|r")
            AddLabel(scroll, L["Please screenshot and report"])
            widget:DoLayout()
        end

        local ok, err = pcall(function()
            if addon.EnsureDB then addon.EnsureDB() end
            local nodeType, verId, instName, bossName, leaf = ParsePath(group)
            local isRaid = (nodeType == "raid_version" or nodeType == "raid_dungeon" or nodeType == "raid_boss")

            -- ========== 导入导出 ==========
            if nodeType == "import_export" then
                AddHeading(scroll, L["Import / Export"] or L["Import / Export"])
                AddLabel(scroll, L["Export Desc"])

                local exportBox = AceGUI:Create("MultiLineEditBox")
                exportBox:SetLabel(L["Export Code"] or L["Export Code"])
                exportBox:SetNumLines(8)
                exportBox:DisableButton(true)
                local exportStatus = AceGUI:Create("Label")
                exportStatus:SetFullWidth(true)

                local function RefreshExport()
                    local ok, t = pcall(addon.EncodeGuides)
                    if not ok then
                        exportBox:SetText(L["Export error: "] .. tostring(t))
                        exportStatus:SetText(L["|cffff0000Export failed: "] .. tostring(t) .. "|r")
                        print(L["Export error: "] .. tostring(t))
                        return
                    end
                    t = t or ""
                    if t == "" then
                        exportBox:SetText(L["No custom data to export"])
                        exportStatus:SetText(L["No custom data hint"])
                    else
                        local okSet = pcall(function() exportBox:SetText(t) end)
                        if okSet then
                            exportStatus:SetText(L["|cff00ff00Export successful: "] .. #t .. L[" chars. Click the text above, then Ctrl+A / Ctrl+C to copy.|r"])
                        else
                            exportStatus:SetText(L["|cffff0000Export result too large, check chat.|r"])
                            print(L["BossTips export code ("] .. #t .. L[" chars):|r"])
                            print(t)
                        end
                    end
                end
                RefreshExport()
                AddFullWidth(scroll, exportBox)
                AddFullWidth(scroll, exportStatus)

                local genBtn = AceGUI:Create("Button")
                genBtn:SetText(L["Generate Export Code"] or L["Generate Export Code"])
                genBtn:SetCallback("OnClick", function()
                    RefreshExport()
                    exportBox:HighlightText()
                    exportBox:SetFocus()
                end)
                AddFullWidth(scroll, genBtn)
                AddLabel(scroll, L["Export scope hint"])

                AddLabel(scroll, L["Import Desc"])

                local importBox = AceGUI:Create("MultiLineEditBox")
                importBox:SetLabel(L["Import Code"] or L["Import Code"])
                importBox:SetNumLines(5)
                importBox:DisableButton(true)
                AddFullWidth(scroll, importBox)

                local importBtn = AceGUI:Create("Button")
                importBtn:SetText(L["Verify & Import"] or L["Verify & Import"])
                importBtn:SetCallback("OnClick", function()
                    local code = importBox:GetText() or ""
                    local decoded = addon.DecodeGuides(code)
                    if decoded and (next(decoded.guides or {}) or next(decoded.customVersions or {}) or next(decoded.customDungeons or {})
                        or next(decoded.disabledNative or {}) or next(decoded.disabledMPlus or {}) or next(decoded.hiddenDungeons or {})
                        or next(decoded.encounterOverrides or {})) then
                        local count = addon.MergeImportedGuides(decoded)
                        importBox:SetText((L["Import successful!"] or L["Import successful!"]) .. " (" .. count .. ")")
                        addon.RefreshGuides()
                        frame:RefreshTree("import_export")
                    else
                        importBox:SetText((L["Import failed: "] or L["Import failed: "]) .. L["Invalid format or empty"])
                    end
                end)
                AddFullWidth(scroll, importBtn)
                return
            end

            -- ========== 新建分类 ==========
            if nodeType == "new_version" then
                AddHeading(scroll, L["New Category"] or L["New Category"])

                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Category Name"])
                AddFullWidth(scroll, nameEdit)

                AddButton(scroll, L["Save Category"] or L["Save Category"], function()
                    local label = strtrim(nameEdit:GetText() or "")
                    if label == "" then
                        print(L["|cffff0000BossTips|r Please enter category name!"])
                        return
                    end
                    local base = label:gsub("[^%w%u%l%d]", "")
                    if base == "" then base = "Custom" end
                    local verId = base
                    local n = 1
                    while IsBuiltInVersion(verId) or IsCustomVersion(verId) do
                        verId = base .. n
                        n = n + 1
                    end
                    BossTipsGlobalDB.customVersions[verId] = {
                        label = label,
                        order = 999,
                    }
                    frame:RefreshTree(PathVersion(verId))
                end, true)
                return
            end

            -- ========== 新建团本分类 ==========
            if nodeType == "new_raid_version" then
                AddHeading(scroll, L["New Raid Category"] or L["New Raid Category"])
                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Category Name"])
                AddFullWidth(scroll, nameEdit)
                AddButton(scroll, L["Save Category"] or L["Save Category"], function()
                    local label = strtrim(nameEdit:GetText() or "")
                    if label == "" then
                        print(L["|cffff0000BossTips|r Please enter category name!"])
                        return
                    end
                    local base = label:gsub("[^%w%u%l%d]", "")
                    if base == "" then base = "RaidCustom" end
                    local verId = base
                    local n = 1
                    while IsBuiltInVersion(verId) or IsCustomVersion(verId) or IsCustomRaidVersion(verId) do
                        verId = base .. n
                        n = n + 1
                    end
                    BossTipsGlobalDB.customRaidVersions[verId] = { label = label, order = 999 }
                    frame:RefreshTree(PathRaidVersion(verId))
                end, true)
                return
            end

            -- ========== 管理团本版本 ==========
            if nodeType == "raid_version" then
                AddHeading(scroll, (L["Manage Raid Version"] or L["Manage Raid Version"]) .. "：" .. addon.GetRaidVersionLabel(verId))

                local enabled = addon.IsRaidVersionEnabled(verId)
                local activeCheck = AceGUI:Create("CheckBox")
                activeCheck:SetLabel(L["Enable Raid Version Hint"])
                activeCheck:SetValue(enabled)
                activeCheck:SetCallback("OnValueChanged", function(_, _, val)
                    if IsCustomRaidVersion(verId) then
                        BossTipsGlobalDB.disabledCustomRaidVersions[verId] = (not val) and true or nil
                    else
                        BossTipsGlobalDB.disabledRaids[verId] = (not val) and true or nil
                    end
                    addon.RefreshGuides()
                    frame:RefreshTree(PathRaidVersion(verId))
                end)
                AddFullWidth(scroll, activeCheck)
                if IsCustomRaidVersion(verId) then
                    local labelEdit = AceGUI:Create("EditBox")
                    labelEdit:SetLabel(L["Category Name"])
                    labelEdit:SetText(BossTipsGlobalDB.customRaidVersions[verId].label or verId)
                    labelEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        BossTipsGlobalDB.customRaidVersions[verId].label = strtrim(text)
                        frame:RefreshTree(PathRaidVersion(verId))
                    end)
                    local orderEdit = AceGUI:Create("EditBox")
                    orderEdit:SetLabel(L["Category Order"] or L["Category Order"])
                    orderEdit:SetText(tostring(BossTipsGlobalDB.customRaidVersions[verId].order or 999))
                    orderEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        BossTipsGlobalDB.customRaidVersions[verId].order = tonumber(text) or 999
                        frame:RefreshTree(PathRaidVersion(verId))
                    end)
                    AddRow(scroll, labelEdit, orderEdit)
                end
                -- 删除按钮：自定义版本彻底删除；内置版本隐藏其下所有团本
                local confirmDelCat = IsCustomRaidVersion(verId)
                    and (L["Confirm delete custom raid category '"] .. addon.GetRaidVersionLabel(verId) .. L["' and all its raids?"])
                    or (L["Confirm delete raid category '"] .. addon.GetRaidVersionLabel(verId) .. L["'? Built-in raids will be hidden."])
                AddButton(scroll, L["Delete Category"] or L["Delete Category"], function()
                    ConfirmDialog(confirmDelCat, {
                        frame = frame,
                        selectPath = "new_raid_version",
                        func = function()
                            if IsCustomRaidVersion(verId) then
                                for inst, d in pairs(BossTipsGlobalDB.customRaids or {}) do
                                    if d.versionId == verId then BossTipsGlobalDB.customRaids[inst] = nil end
                                end
                                BossTipsGlobalDB.customRaidVersions[verId] = nil
                                BossTipsGlobalDB.disabledCustomRaidVersions[verId] = nil
                            else
                                -- 内置版本：彻底禁用并隐藏其下所有团本
                                BossTipsGlobalDB.disabledRaids[verId] = true
                                local GD = addon.GuideData
                                if GD.raids and GD.raids[verId] then
                                    for inst in pairs(GD.raids[verId]) do
                                        BossTipsGlobalDB.hiddenDungeons[inst] = true
                                    end
                                end
                            end
                            addon.RefreshGuides()
                        end,
                    })
                end, true)
                return
            end

            -- ========== 管理团本副本 ==========
            if nodeType == "raid_dungeon" then
                AddHeading(scroll, (L["Manage Raid"] or L["Manage Raid"]) .. "：" .. instName)

                local meta = addon.GuideData.meta and addon.GuideData.meta[instName]
                local idEdit = AceGUI:Create("EditBox")
                idEdit:SetLabel(L["Dungeon ID"] or L["Dungeon ID Instance"])
                if customRaid then
                    idEdit:SetText(customRaid.id or "")
                    idEdit:SetDisabled(false)
                    idEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        customRaid.id = strtrim(text)
                        frame:RefreshTree(PathRaidDungeon(verId, instName))
                    end)
                else
                    idEdit:SetText((meta and (meta.instanceId or meta.mapID)) and tostring(meta.instanceId or meta.mapID) or "")
                    idEdit:SetDisabled(true)
                end
                AddFullWidth(scroll, idEdit)

                -- 自动填充 BigWigs 首领战ID
                AddButton(scroll, L["Auto Fill BigWigs IDs"] or L["Auto Fill BigWigs IDs"], function()
                    local bosses = GetDungeonBossesForEditor(verId, instName, true)
                    local filled = 0
                    for boss in pairs(bosses) do
                        local existing = addon.GetBossEncounterId(instName, boss)
                        if not existing then
                            local eid = addon.GetBigWigsEncounterId(instName, boss)
                            if eid then SaveEncounterId(instName, boss, eid); filled = filled + 1 end
                        end
                    end
                    print(L["|cff00ff00BossTips|r filled "] .. filled .. L[" encounter IDs"])
                    frame:RefreshTree(PathRaidDungeon(verId, instName))
                end, true)

                -- 激活/隐藏此团本
                local activeCheck = AceGUI:Create("CheckBox")
                activeCheck:SetLabel(L["Active Dungeon Hint"] or L["Active Raid Hint"])
                activeCheck:SetValue(IsDungeonActive(instName) and not IsDungeonHidden(instName))
                activeCheck:SetCallback("OnValueChanged", function(_, _, val)
                    if customRaid then
                        customRaid.isActive = val
                    else
                        if val then BossTipsGlobalDB.hiddenDungeons[instName] = nil
                        else BossTipsGlobalDB.hiddenDungeons[instName] = true end
                    end
                    addon.RefreshGuides()
                    frame:RefreshTree(PathRaidDungeon(verId, instName))
                end)
                AddFullWidth(scroll, activeCheck)

                -- 移动到分类（仅自定义团本）
                if customRaid then
                    local moveDD = AceGUI:Create("Dropdown")
                    moveDD:SetLabel(L["Move To Category"] or L["Move To Category"])
                    local catList = {}
                    for _, vid in ipairs(addon.GetRaidVersionIDs()) do
                        catList[vid] = addon.GetRaidVersionLabel(vid)
                    end
                    moveDD:SetList(catList)
                    moveDD:SetValue(verId)
                    moveDD:SetCallback("OnValueChanged", function(_, _, newVerId)
                        if newVerId and newVerId ~= verId and customRaid then
                            customRaid.versionId = newVerId
                            addon.RefreshGuides()
                            frame:RefreshTree(PathRaidDungeon(newVerId, instName))
                        end
                    end)
                    AddFullWidth(scroll, moveDD)

                    AddButton(scroll, L["Add Target In Dungeon"] or L["Add Target In Dungeon"], function()
                        frame:RefreshTree(PathNewRaidBoss(verId, instName))
                    end, true)
                else
                    AddLabel(scroll, L["Raid skeleton hint"])
                end

                -- 删除按钮：自定义团本彻底删除；内置团本隐藏
                local confirmDelRaid = customRaid
                    and (L["Confirm delete custom raid '"] .. instName .. L["'? Built-in raids won't be deleted."])
                    or (L["Confirm delete raid '"] .. instName .. L["'? Built-in raid will be hidden."])
                AddButton(scroll, L["Delete Dungeon"] or L["Delete Dungeon"], function()
                    ConfirmDialog(confirmDelRaid, {
                        frame = frame,
                        selectPath = PathRaidVersion(verId),
                        func = function()
                            if customRaid then
                                BossTipsGlobalDB.customRaids[instName] = nil
                            end
                            BossTipsGlobalDB.guides[instName] = nil
                            BossTipsGlobalDB.hiddenDungeons[instName] = true
                            addon.RefreshGuides()
                        end,
                    })
                end, true)
                return
            end

            if nodeType == "unknown" then
                AddLabel(scroll, L["Select Node Hint"])
                AddLabel(scroll, L["Debug: unrecognized path [|r"] .. tostring(group or "nil") .. L["], leaf [|r"] .. tostring(leaf or "nil") .. "|cff888888]|r")
                return
            end

            -- ========== 管理分类 ==========
            if nodeType == "version" then
                AddHeading(scroll, (L["Manage Category"] or L["Manage Category"]) .. "：" .. addon.GetVersionLabel(verId))

                local enabled = addon.IsVersionEnabled(verId)
                local activeCheck = AceGUI:Create("CheckBox")
                activeCheck:SetLabel(L["Enable Category Hint"])
                activeCheck:SetValue(enabled)
                activeCheck:SetCallback("OnValueChanged", function(_, _, val)
                    local isNative = addon.GuideData.versions and addon.GuideData.versions[verId]
                    local isMplus = addon.GuideData.mplus and addon.GuideData.mplus[verId]
                    if isNative then BossTipsGlobalDB.disabledNative[verId] = (not val) and true or nil end
                    if isMplus then BossTipsGlobalDB.disabledMPlus[verId] = (not val) and true or nil end
                    if IsCustomVersion(verId) then BossTipsGlobalDB.disabledCustomVersions[verId] = (not val) and true or nil end
                    addon.RefreshGuides()
                    frame:RefreshTree(PathVersion(verId))
                end)
                AddFullWidth(scroll, activeCheck)

                if IsCustomVersion(verId) then
                    local labelEdit = AceGUI:Create("EditBox")
                    labelEdit:SetLabel(L["Category Name"])
                    labelEdit:SetText(BossTipsGlobalDB.customVersions[verId].label or verId)
                    labelEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        BossTipsGlobalDB.customVersions[verId].label = strtrim(text)
                        frame:RefreshTree(PathVersion(verId))
                    end)

                    local orderEdit = AceGUI:Create("EditBox")
                    orderEdit:SetLabel(L["Category Order"] or L["Category Order"])
                    orderEdit:SetText(tostring(BossTipsGlobalDB.customVersions[verId].order or 999))
                    orderEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        BossTipsGlobalDB.customVersions[verId].order = tonumber(text) or 999
                        frame:RefreshTree(PathVersion(verId))
                    end)
                    AddRow(scroll, labelEdit, orderEdit)
                end

                -- 删除按钮：自定义分类彻底删除；内置版本隐藏其下所有副本
                local confirmDelVer = IsCustomVersion(verId)
                    and (L["Confirm delete custom category '"] .. addon.GetVersionLabel(verId) .. L["' and all its dungeons?"])
                    or (L["Confirm delete category '"] .. addon.GetVersionLabel(verId) .. L["'? Built-in dungeons will be hidden."])
                AddButton(scroll, L["Delete Category"] or L["Delete Category"], function()
                    ConfirmDialog(confirmDelVer, {
                        frame = frame,
                        selectPath = "new_version",
                        func = function()
                            if IsCustomVersion(verId) then
                                for inst, d in pairs(BossTipsGlobalDB.customDungeons or {}) do
                                    if d.versionId == verId then BossTipsGlobalDB.customDungeons[inst] = nil end
                                end
                                BossTipsGlobalDB.customVersions[verId] = nil
                                BossTipsGlobalDB.disabledCustomVersions[verId] = nil
                            else
                                local isNative = addon.GuideData.versions and addon.GuideData.versions[verId]
                                local isMplus = addon.GuideData.mplus and addon.GuideData.mplus[verId]
                                if isNative then BossTipsGlobalDB.disabledNative[verId] = true end
                                if isMplus then BossTipsGlobalDB.disabledMPlus[verId] = true end
                                local GD = addon.GuideData
                                if isNative and GD.versions[verId] then
                                    for inst in pairs(GD.versions[verId]) do BossTipsGlobalDB.hiddenDungeons[inst] = true end
                                end
                                if isMplus and GD.mplus[verId] then
                                    for inst in pairs(GD.mplus[verId]) do BossTipsGlobalDB.hiddenDungeons[inst] = true end
                                end
                            end
                            addon.RefreshGuides()
                        end,
                    })
                end, true)
                return
            end

            -- ========== 新建副本 ==========
            if nodeType == "new_dungeon" then
                AddHeading(scroll, L["New Dungeon"] or L["New Dungeon"])

                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Dungeon Name"])

                local idEdit = AceGUI:Create("EditBox")
                idEdit:SetLabel(L["Dungeon ID"] or L["Dungeon ID Optional"])
                AddRow(scroll, nameEdit, idEdit)

                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Dungeon Type"] or L["Dungeon Type"])
                typeDD:SetList(GetDungeonTypes())
                typeDD:SetValue("")

                local diffDD = AceGUI:Create("Dropdown")
                diffDD:SetLabel(L["Difficulty"] or L["Difficulty"])
                diffDD:SetList(GetDifficulties(isRaid), isRaid and RAID_DIFFICULTIES_ORDER or DIFFICULTIES_ORDER)
                diffDD:SetValue("")
                AddRow(scroll, typeDD, diffDD)

                AddButton(scroll, L["Print Current Instance Info"] or L["Print Instance Info"], function()
                    local n, _, dID, dName, _, _, _, i = GetInstanceInfo()
                    if i then
                        print((L["Print Inst Header"] or "|cff00ff00BossTips|r current instance: |cffffff00%s|r  ID:|cffffff00%s|r  Difficulty:|cffffff00%s|r"):format(tostring(n), tostring(i), tostring(dName)))
                    else
                        print("|cFFFF0000BossTips|r: " .. (L["No Instance"] or "Not in an instance"))
                    end
                end, true)

                AddButton(scroll, L["Save Dungeon"] or L["Save Dungeon"], function()
                    local nm = strtrim(nameEdit:GetText() or "")
                    if nm == "" then
                        print(L["|cffff0000BossTips|r Please enter dungeon name!"])
                        return
                    end
                    if BossTipsGlobalDB.customDungeons[nm] or IsBuiltInDungeon(verId, nm) then
                        print(L["|cffff0000BossTips|r Dungeon name already exists!"])
                        return
                    end
                    BossTipsGlobalDB.customDungeons[nm] = {
                        versionId = verId,
                        id = strtrim(idEdit:GetText() or ""),
                        mapID = "",
                        dungeonType = typeDD:GetValue() or "",
                        difficulty = diffDD:GetValue() or "",
                        isActive = true,
                        bosses = {},
                    }
                    frame:RefreshTree(PathDungeon(verId, nm))
                    addon.RefreshGuides()
                end, true)
                return
            end

            -- 新建团本副本
            if nodeType == "new_raid_dungeon" then
                AddHeading(scroll, L["New Raid"] or L["New Raid Dungeon"])
                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Dungeon Name"])
                local idEdit = AceGUI:Create("EditBox")
                idEdit:SetLabel(L["Dungeon ID"] or L["Dungeon ID Optional"])
                AddRow(scroll, nameEdit, idEdit)
                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Dungeon Type"] or L["Dungeon Type"])
                typeDD:SetList(GetDungeonTypes())
                typeDD:SetValue("")
                local diffDD = AceGUI:Create("Dropdown")
                diffDD:SetLabel(L["Difficulty"] or L["Difficulty"])
                diffDD:SetList(GetDifficulties(isRaid), isRaid and RAID_DIFFICULTIES_ORDER or DIFFICULTIES_ORDER)
                diffDD:SetValue("")
                AddRow(scroll, typeDD, diffDD)
                AddButton(scroll, L["Save Dungeon"] or L["Save Dungeon"], function()
                    local nm = strtrim(nameEdit:GetText() or "")
                    if nm == "" then
                        print(L["|cffff0000BossTips|r Please enter dungeon name!"])
                        return
                    end
                    if BossTipsGlobalDB.customRaids[nm] or BossTipsGlobalDB.customDungeons[nm] or IsBuiltInDungeon(verId, nm, true) then
                        print(L["|cffff0000BossTips|r Dungeon name already exists!"])
                        return
                    end
                    BossTipsGlobalDB.customRaids[nm] = {
                        versionId = verId,
                        id = strtrim(idEdit:GetText() or ""),
                        mapID = "",
                        dungeonType = typeDD:GetValue() or "",
                        difficulty = diffDD:GetValue() or "",
                        isActive = true,
                        bosses = {},
                    }
                    frame:RefreshTree(PathRaidDungeon(verId, nm))
                    addon.RefreshGuides()
                end, true)
                return
            end

            -- 以下都需要 instName
            local isBuiltInDungeon = IsBuiltInDungeon(verId, instName, isRaid)
            -- 路径别名：团本节点用 R 前缀路径刷新，地下城用 V 前缀
            local PB = isRaid and PathRaidBoss or PathBoss
            local PD = isRaid and PathRaidDungeon or PathDungeon
            local customDungeon = BossTipsGlobalDB.customDungeons[instName]
            local customRaid = BossTipsGlobalDB.customRaids[instName]
            local dungeonOverride = addon.GetDungeonOverride(instName)
            local customBosses = (customDungeon and customDungeon.bosses) or (customRaid and customRaid.bosses)

            -- ========== 新建目标 ==========
            if nodeType == "new_boss" then
                AddHeading(scroll, L["New Target Title"])

                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Target Name"] or L["Target Name"])
                AddFullWidth(scroll, nameEdit)

                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Type"])
                typeDD:SetList({ ["BOSS"] = L["BOSS"], ["MOB"] = L["MOB"] })
                typeDD:SetValue("BOSS")
                AddFullWidth(scroll, typeDD)

                AddButton(scroll, L["Save Target"] or L["Save Target"], function()
                    local nm = strtrim(nameEdit:GetText() or "")
                    if nm == "" then
                        print(L["|cffff0000BossTips|r Please enter target name!"])
                        return
                    end
                    local defaultTips = "{rt8}" .. nm .. L["NewTargetDefaultTips"]
                    if isBuiltInDungeon then
                        BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
                        BossTipsGlobalDB.guides[instName] = BossTipsGlobalDB.guides[instName] or {}
                        if typeDD:GetValue() == "MOB" then
                            BossTipsGlobalDB.guides[instName][nm] = { tips = defaultTips, type = "MOB" }
                        else
                            BossTipsGlobalDB.guides[instName][nm] = defaultTips
                        end
                    else
                        if not customDungeon then
                            print(L["|cffff0000BossTips|r Custom dungeon data error"])
                            return
                        end
                        customDungeon.bosses[nm] = { order = 999, type = typeDD:GetValue() or "BOSS", tips = defaultTips, encounterId = "" }
                    end
                    addon.RefreshGuides()
                    frame:RefreshTree(PathBoss(verId, instName, nm))
                end, true)
                return
            end

            -- 新建团本目标
            if nodeType == "new_raid_boss" then
                AddHeading(scroll, L["New Target Title"])
                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Target Name"] or L["Target Name"])
                AddFullWidth(scroll, nameEdit)
                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Type"])
                typeDD:SetList({ ["BOSS"] = L["BOSS"], ["MOB"] = L["MOB"] })
                typeDD:SetValue("BOSS")
                AddFullWidth(scroll, typeDD)
                AddButton(scroll, L["Save Target"] or L["Save Target"], function()
                    local nm = strtrim(nameEdit:GetText() or "")
                    if nm == "" then
                        print(L["|cffff0000BossTips|r Please enter target name!"])
                        return
                    end
                    if not customRaid then
                        print(L["|cffff0000BossTips|r Custom raid data error"])
                        return
                    end
                    local defaultTips = "{rt8}" .. nm .. L["NewTargetDefaultTips"]
                    customRaid.bosses[nm] = { order = 999, type = typeDD:GetValue() or "BOSS", tips = defaultTips, encounterId = "" }
                    addon.RefreshGuides()
                    frame:RefreshTree(PathRaidBoss(verId, instName, nm))
                end, true)
                return
            end

            -- ========== 编辑目标 ==========
            if nodeType == "boss" or nodeType == "raid_boss" then
                local bosses = GetDungeonBossesForEditor(verId, instName, isRaid)
                local binfo = bosses[bossName]
                if not binfo then
                    AddLabel(scroll, L["Not found '"] .. tostring(bossName) .. L["' guide data."])
                    return
                end

                local sourceLabel = ""
                if binfo.source == "builtin" then
                    sourceLabel = L["BuiltinSuffix"]
                else
                    sourceLabel = L["CustomSuffix"]
                end
                local displayName = (addon.GetLocalizedBossName and addon.GetLocalizedBossName(instName, bossName, isRaid, verId)) or bossName
                AddHeading(scroll, L["Edit Target"] .. displayName .. sourceLabel)

                local curTips, currentType = GetRawGuide(instName, bossName)

                -- 目标名称 + 删除按钮
                local nameRow = AceGUI:Create("SimpleGroup")
                nameRow:SetLayout("Flow")
                nameRow:SetFullWidth(true)
                local nameLabel = AceGUI:Create("EditBox")
                nameLabel:SetLabel(L["Target Name"] or L["Target Name"])
                nameLabel:SetText(displayName)
                nameLabel:SetDisabled(true)
                nameLabel:SetRelativeWidth(0.65)
                nameRow:AddChild(nameLabel)
                local delBtn = AceGUI:Create("Button")
                delBtn:SetText(L["Delete Target"] or L["Delete Target"])
                delBtn:SetRelativeWidth(0.35)
                delBtn:SetCallback("OnClick", function()
                    ConfirmDialog(L["Confirm delete '"] .. bossName .. L["'?"], {
                        frame = frame,
                        selectPath = PD(verId, instName),
                        func = function()
                            if customBosses then
                                customBosses[bossName] = nil
                            end
                            if BossTipsGlobalDB.guides[instName] then
                                BossTipsGlobalDB.guides[instName][bossName] = nil
                            end
                            SaveEncounterId(instName, bossName, "")
                            addon.RefreshGuides()
                        end,
                    })
                end)
                nameRow:AddChild(delBtn)
                scroll:AddChild(nameRow)

                -- 首领战ID + 自动填充按钮
                local encRow = AceGUI:Create("SimpleGroup")
                encRow:SetLayout("Flow")
                encRow:SetFullWidth(true)
                local encounterEdit = AceGUI:Create("EditBox")
                encounterEdit:SetLabel(L["Encounter ID"] or L["Encounter ID"])
                encounterEdit:SetText(binfo.encounterId or "")
                encounterEdit:SetRelativeWidth(0.65)
                encounterEdit:SetCallback("OnEnterPressed", function(_, _, text)
                    local eid = strtrim(text)
                    if isBuiltInDungeon then
                        SaveEncounterId(instName, bossName, eid)
                    elseif customBosses and customBosses[bossName] then
                        customBosses[bossName].encounterId = eid
                    end
                end)
                encRow:AddChild(encounterEdit)
                local autoEncBtn = AceGUI:Create("Button")
                autoEncBtn:SetText(L["Auto Fill"] or L["Auto Fill"])
                autoEncBtn:SetRelativeWidth(0.35)
                autoEncBtn:SetCallback("OnClick", function()
                    local eid = addon.GetBigWigsEncounterId(instName, bossName)
                    if eid then
                        encounterEdit:SetText(eid)
                        if isBuiltInDungeon then
                            SaveEncounterId(instName, bossName, eid)
                        elseif customBosses and customBosses[bossName] then
                            customBosses[bossName].encounterId = eid
                        end
                        print(L["|cff00ff00BossTips|r filled encounter IDs: "] .. eid)
                    else
                        print(L["|cffff0000BossTips|r No matching encounter ID"])
                    end
                end)
                encRow:AddChild(autoEncBtn)
                scroll:AddChild(encRow)
                AddLabel(scroll, "|cffffcc00" .. L["Encounter ID Hint"] .. "|r")

                -- 类型 + 排序（自定义目标可排序）
                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Type"])
                typeDD:SetList({ ["BOSS"] = L["BOSS"], ["MOB"] = L["MOB"] })
                typeDD:SetValue(currentType)
                typeDD:SetCallback("OnValueChanged", function(_, _, v) SaveBossType(instName, bossName, v) end)

                if not isBuiltInDungeon and customBosses and customBosses[bossName] then
                    local orderEdit = AceGUI:Create("EditBox")
                    orderEdit:SetLabel(L["Category Order"] or L["Category Order"])
                    orderEdit:SetText(tostring(customBosses[bossName].order or 999))
                    orderEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        customBosses[bossName].order = tonumber(text) or 999
                        frame:RefreshTree(PB(verId, instName, bossName))
                    end)
                    AddRow(scroll, typeDD, orderEdit)
                else
                    AddFullWidth(scroll, typeDD)
                end

                -- 编辑难度选择（团本无 M+ 模式；大秘境仅一档 mythicplus；原生 5 人本可按多难度编辑）
                local activeEntry = addon.GetActiveGuideEntry(instName, bossName)
                local isMPlusEdit = activeEntry and activeEntry._src and activeEntry._src.type == "mplus"
                -- 大秘境只有 mythicplus 一档：下拉仅提供 Mythic+，避免“选其它难度又被弹回 M+”
                if isMPlusEdit then
                    editDiff = "mythicplus"
                elseif isRaid and editDiff == "mythicplus" then
                    editDiff = "lfr"
                end
                local diffEditOrder
                if isMPlusEdit then
                    diffEditOrder = { "mythicplus" }
                elseif isRaid then
                    diffEditOrder = { "lfr", "normal", "heroic", "mythic" }
                else
                    diffEditOrder = { "lfr", "normal", "heroic", "mythic", "mythicplus" }
                end
                local diffEditList = {}
                for _, dkey in ipairs(diffEditOrder) do
                    diffEditList[dkey] = GetDiffEditLabel(dkey)
                end
                local diffDD = AceGUI:Create("Dropdown")
                diffDD:SetLabel(L["Edit Difficulty"])
                diffDD:SetList(diffEditList, diffEditOrder)
                diffDD:SetValue(editDiff)
                diffDD:SetCallback("OnValueChanged", function(_, _, v)
                    editDiff = v
                    frame:RefreshTree(PB(verId, instName, bossName))
                end)
                AddFullWidth(scroll, diffDD)

                -- 文本笔记
                local diffLabel = GetDiffEditLabel(editDiff)
                local noteEdit = AceGUI:Create("MultiLineEditBox")
                noteEdit:SetLabel(L["Text Notes Current"] .. diffLabel .. L["Text Notes Suffix"])
                noteEdit:SetText(curTips)
                noteEdit:SetNumLines(18)
                noteEdit:DisableButton(true)
                noteEdit:SetCallback("OnTextChanged", function(_, _, text) SaveBossTips(instName, bossName, text) end)
                AddFullWidth(scroll, noteEdit)
                return
            end

            -- ========== 管理副本 ==========
            if nodeType == "dungeon" then
                AddHeading(scroll, (L["Manage Dungeon"] or L["Manage Dungeon"]) .. "：" .. instName)

                -- 副本名称 / 副本ID（内置副本也能编辑并保存到 dungeonOverrides）
                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Dungeon Name"] or L["Dungeon Name"])
                nameEdit:SetText(instName)
                nameEdit:SetDisabled(true)

                local idEdit = AceGUI:Create("EditBox")
                idEdit:SetLabel(L["Dungeon ID"] or L["Dungeon ID"])
                idEdit:SetText((customDungeon and customDungeon.id) or (dungeonOverride and dungeonOverride.id) or "")
                idEdit:SetCallback("OnEnterPressed", function(_, _, text)
                    if customDungeon then
                        customDungeon.id = strtrim(text)
                    else
                        addon.SetDungeonOverride(instName, "id", strtrim(text))
                    end
                end)
                AddRow(scroll, nameEdit, idEdit)

                -- 副本类型 / 难度（内置副本也能编辑并保存到 dungeonOverrides）
                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Dungeon Type"] or L["Dungeon Type"])
                typeDD:SetList(GetDungeonTypes())
                typeDD:SetValue((customDungeon and customDungeon.dungeonType) or (dungeonOverride and dungeonOverride.dungeonType) or "")
                typeDD:SetCallback("OnValueChanged", function(_, _, v)
                    if customDungeon then
                        customDungeon.dungeonType = v
                    else
                        addon.SetDungeonOverride(instName, "dungeonType", v)
                    end
                end)

                local diffDD = AceGUI:Create("Dropdown")
                diffDD:SetLabel(L["Difficulty"] or L["Difficulty"])
                diffDD:SetList(GetDifficulties(isRaid), isRaid and RAID_DIFFICULTIES_ORDER or DIFFICULTIES_ORDER)
                diffDD:SetValue((customDungeon and customDungeon.difficulty) or (dungeonOverride and dungeonOverride.difficulty) or "")
                diffDD:SetCallback("OnValueChanged", function(_, _, v)
                    if customDungeon then
                        customDungeon.difficulty = v
                    else
                        addon.SetDungeonOverride(instName, "difficulty", v)
                    end
                end)
                AddRow(scroll, typeDD, diffDD)

                AddButton(scroll, L["Print Current Instance Info"] or L["Print Instance Info Edit"], function()
                    local n, _, dID, dName, _, _, _, i = GetInstanceInfo()
                    if i then
                        print((L["Print Inst Header"] or "|cff00ff00BossTips|r current instance: |cffffff00%s|r  ID:|cffffff00%s|r  Difficulty:|cffffff00%s|r"):format(tostring(n), tostring(i), tostring(dName)))
                    else
                        print("|cFFFF0000BossTips|r: " .. (L["No Instance"] or "Not in an instance"))
                    end
                end, true)

                -- 自动填充 BigWigs 首领战ID
                AddButton(scroll, L["Auto Fill BigWigs IDs"] or L["Auto Fill BigWigs IDs"], function()
                    local bosses = GetDungeonBossesForEditor(verId, instName)
                    local filled = 0
                    for boss in pairs(bosses) do
                        local existing = addon.GetBossEncounterId(instName, boss)
                        if not existing then
                            local eid = addon.GetBigWigsEncounterId(instName, boss)
                            if eid then
                                SaveEncounterId(instName, boss, eid)
                                filled = filled + 1
                            end
                        end
                    end
                    print(L["|cff00ff00BossTips|r filled "] .. filled .. L[" encounter IDs"])
                    frame:RefreshTree(PD(verId, instName))
                end, true)

                -- 激活此副本
                local activeCheck = AceGUI:Create("CheckBox")
                activeCheck:SetLabel(L["Active Dungeon Hint"] or L["Active Dungeon Hint"])
                activeCheck:SetValue(IsDungeonActive(instName) and not IsDungeonHidden(instName))
                activeCheck:SetCallback("OnValueChanged", function(_, _, val)
                    if customDungeon then
                        customDungeon.isActive = val
                    else
                        if val then
                            BossTipsGlobalDB.hiddenDungeons[instName] = nil
                        else
                            BossTipsGlobalDB.hiddenDungeons[instName] = true
                        end
                    end
                    addon.RefreshGuides()
                    frame:RefreshTree(PD(verId, instName))
                end)
                AddFullWidth(scroll, activeCheck)

                -- 移动到分类（仅自定义副本）
                if customDungeon then
                    local moveDD = AceGUI:Create("Dropdown")
                    moveDD:SetLabel(L["Move To Category"] or L["Move To Category"])
                    local catList = {}
                    for _, vid in ipairs(addon.GetAllVersionIDs()) do
                        catList[vid] = addon.GetVersionLabel(vid)
                    end
                    moveDD:SetList(catList)
                    moveDD:SetValue(verId)
                    moveDD:SetCallback("OnValueChanged", function(_, _, newVerId)
                        if newVerId and newVerId ~= verId and customDungeon then
                            customDungeon.versionId = newVerId
                            addon.RefreshGuides()
                            frame:RefreshTree(PathDungeon(newVerId, instName))
                        end
                    end)
                    AddFullWidth(scroll, moveDD)
                end

                -- + 在此副本中新增目标
                AddButton(scroll, L["Add Target In Dungeon"] or L["Add Target In Dungeon"], function()
                    frame:RefreshTree(PathNewBoss(verId, instName))
                end, true)

                -- 删除按钮：自定义副本彻底删除；内置副本隐藏并清掉覆盖
                local confirmDelDung = customDungeon
                    and (L["Confirm delete custom dungeon '"] .. instName .. L["'? Built-in dungeons won't be deleted."])
                    or (L["Confirm delete dungeon '"] .. instName .. L["'? Built-in dungeon will be hidden."])
                AddButton(scroll, L["Delete Dungeon"] or L["Delete Dungeon"], function()
                    ConfirmDialog(confirmDelDung, {
                        frame = frame,
                        selectPath = PathVersion(verId),
                        func = function()
                            if customDungeon then
                                BossTipsGlobalDB.customDungeons[instName] = nil
                            end
                            BossTipsGlobalDB.guides[instName] = nil
                            BossTipsGlobalDB.hiddenDungeons[instName] = true
                            addon.RefreshGuides()
                        end,
                    })
                end, true)
                return
            end

            -- 兜底
            AddLabel(scroll, L["Select Node Hint"])
        end)

        if not ok then
            ShowError(err)
        else
            widget:DoLayout()
        end
    end)

    frame:RefreshTree()
end
