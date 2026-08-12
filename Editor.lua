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

-- 副本类型 / 难度选项
local DUNGEON_TYPES = {
    [""] = L["No Limit"],
    ["dungeon"] = L["Dungeon"],
    ["raid"] = L["Raid"],
    ["mplus"] = L["Mythic Plus"],
}
local DIFFICULTIES = {
    [""] = L["No Limit"],
    ["normal"] = L["Normal"],
    ["heroic"] = L["Heroic"],
    ["mythic"] = L["Mythic"],
    ["mythicplus"] = L["Mythic Plus Short"],
}

local function IsBuiltInVersion(verId)
    local GD = addon.GuideData
    return (GD.versions and GD.versions[verId]) or (GD.mplus and GD.mplus[verId])
end

local function IsCustomVersion(verId)
    return BossTipsGlobalDB.customVersions and BossTipsGlobalDB.customVersions[verId] ~= nil
end

local function IsBuiltInDungeon(verId, instName)
    local GD = addon.GuideData
    return (GD.versions and GD.versions[verId] and GD.versions[verId][instName]) or
           (GD.mplus and GD.mplus[verId] and GD.mplus[verId][instName])
end

local function GetDungeonBossesForEditor(verId, instName)
    if addon.EnsureDB then addon.EnsureDB() end
    local bosses = {}
    local GD = addon.GuideData
    local src = (GD.versions and GD.versions[verId] and GD.versions[verId][instName]) or
                (GD.mplus and GD.mplus[verId] and GD.mplus[verId][instName])
    if src then
        for boss, entry in pairs(src) do
            bosses[boss] = { source = "builtin", order = entry.order or 999, type = entry.type or "BOSS", tips = entry.tips or "", encounterId = addon.GetBossEncounterId(instName, boss) or "" }
        end
    end
    local custom = BossTipsGlobalDB.customDungeons[instName]
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
    if not group then return "unknown", nil, nil, nil, GetLeafPath(group) end
    -- AceGUI TreeGroup 传回的是 "父\001子\001叶子value"，先取最后一级
    local leaf = GetLeafPath(group)
    local parts = {}
    for p in string.gmatch(leaf, "[^" .. SEP .. "]+") do table.insert(parts, p) end
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
    if nodeType == "unknown" then return leafPath end
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
    table.insert(treeData, { value = "import_export", text = "|cff00ccff" .. (L["Import Export Short"] or "[<=> 导入与导出]") .. "|r" })
    table.insert(treeData, { value = "new_version", text = "|cff00ff00" .. (L["New Category"] or "[+ 新建分类]") .. "|r" })

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
        local statusStr = enabled and "" or " |cff888888" .. (L["Hidden"] or "[已隐藏]") .. "|r"
        local verNode = {
            value = PathVersion(verId),
            text = "|cffffcc00" .. addon.GetVersionLabel(verId) .. "|r" .. statusStr,
            children = {}
        }

        table.insert(verNode.children, { value = PathNewDungeon(verId), text = "|cff00ff00" .. (L["New Dungeon"] or "[+ 新建副本]") .. "|r" })

        local dungeons = addon.GetVersionDungeons(verId)
        local names = {}
        for instName in pairs(dungeons) do names[#names + 1] = instName end
        table.sort(names)
        for _, instName in ipairs(names) do
            local hidden = IsDungeonHidden(instName)
            local active = IsDungeonActive(instName)
            local hStr = (hidden or not active) and " |cff888888" .. (L["Hidden"] or "[已隐藏]") .. "|r" or ""
            local instNode = {
                value = PathDungeon(verId, instName),
                text = instName .. hStr,
                children = {}
            }
            table.insert(instNode.children, { value = PathNewBoss(verId, instName), text = "|cff00ff00" .. (L["New Target"] or "[+ 在此副本中新增目标]") .. "|r" })
            local bosses = GetDungeonBossesForEditor(verId, instName)
            local bossList = {}
            for boss in pairs(bosses) do bossList[#bossList + 1] = boss end
            table.sort(bossList, function(a, b)
                local oa, ob = bosses[a].order or 999, bosses[b].order or 999
                if oa ~= ob then return oa < ob end
                return a < b
            end)
            for _, boss in ipairs(bossList) do
                table.insert(instNode.children, { value = PathBoss(verId, instName, boss), text = boss })
            end
            table.insert(verNode.children, instNode)
        end
        table.insert(treeData, verNode)
    end
    return treeData
end

-- ==========================================
-- 保存辅助
-- ==========================================
local function SaveBossTips(instName, bossName, text)
    BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
    BossTipsGlobalDB.guides[instName] = BossTipsGlobalDB.guides[instName] or {}
    local rg = BossTipsGlobalDB.guides[instName][bossName]
    if type(rg) == "table" then
        rg.tips = text
    else
        BossTipsGlobalDB.guides[instName][bossName] = text
    end
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
    local curTips = ""
    local currentType = (entry and entry.type) or "BOSS"
    if type(rg) == "table" then
        curTips = rg.tips or ""
        currentType = rg.type or currentType
    elseif rg then
        curTips = rg
    elseif entry and entry.tips then
        curTips = entry.tips
    end
    return curTips, currentType
end

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
    frame:SetTitle(L["Dungeon & Target Editor"] or "BossTips - 副本与目标编辑器")
    frame:SetLayout("Flow")
    frame:SetWidth(820)
    frame:SetHeight(600)
    addon.editorFrame = frame

    frame:SetCallback("OnClose", function(widget)
        widget:Hide()
        addon.RefreshGuides()
        if not InCombatLockdown() and addon.OpenMainGUI then addon:OpenMainGUI() end
    end)

    -- 顶部工具栏：展开/折叠所有副本
    local toolbar = AceGUI:Create("SimpleGroup")
    toolbar:SetLayout("Flow")
    toolbar:SetFullWidth(true)
    local expandBtn = AceGUI:Create("Button")
    expandBtn:SetText("展开所有副本")
    expandBtn:SetWidth(120)
    local collapseBtn = AceGUI:Create("Button")
    collapseBtn:SetText("折叠所有副本")
    collapseBtn:SetWidth(120)
    toolbar:AddChild(expandBtn)
    toolbar:AddChild(collapseBtn)
    frame:AddChild(toolbar)

    local treeGroup = AceGUI:Create("TreeGroup")
    -- TreeGroup 右侧内容区应使用 Fill，让 ScrollFrame 占满整个右侧面板
    treeGroup:SetLayout("Fill")
    treeGroup:SetTreeWidth(260)
    treeGroup:SetFullWidth(true)
    treeGroup:SetHeight(540)
    treeGroup:SetTree(BuildTree())
    frame:AddChild(treeGroup)
    frame.treeGroup = treeGroup

    local function CollectGroupValues(treeData, prefix, result)
        for _, node in ipairs(treeData or {}) do
            local uv = (prefix and prefix ~= "") and (prefix .. "\001" .. node.value) or node.value
            if node.children and #node.children > 0 then
                result[uv] = true
                CollectGroupValues(node.children, uv, result)
            end
        end
    end
    expandBtn:SetCallback("OnClick", function()
        local status = treeGroup.status or treeGroup.localstatus
        status.groups = status.groups or {}
        for k in pairs(status.groups) do status.groups[k] = nil end
        CollectGroupValues(treeGroup.tree, "", status.groups)
        treeGroup:RefreshTree()
    end)
    collapseBtn:SetCallback("OnClick", function()
        local status = treeGroup.status or treeGroup.localstatus
        status.groups = {}
        treeGroup:RefreshTree()
    end)

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

    treeGroup:SetCallback("OnGroupSelected", function(widget, event, group)
        widget:ReleaseChildren()
        local scroll = AceGUI:Create("ScrollFrame")
        scroll:SetLayout("List")
        scroll:SetFullWidth(true)
        scroll:SetFullHeight(true)
        widget:AddChild(scroll)

        local function ShowError(msg)
            scroll:ReleaseChildren()
            AddHeading(scroll, "编辑器加载失败")
            AddLabel(scroll, "|cffff0000" .. tostring(msg) .. "|r")
            AddLabel(scroll, "请截图此提示并反馈。")
            widget:DoLayout()
        end

        local ok, err = pcall(function()
            if addon.EnsureDB then addon.EnsureDB() end
            local nodeType, verId, instName, bossName, leaf = ParsePath(group)

            -- ========== 导入导出 ==========
            if nodeType == "import_export" then
                AddHeading(scroll, L["Import / Export"] or "数据导入/导出")
                AddLabel(scroll, "导出生成一段分享码，包含自定义分类、副本、目标攻略与开关状态。")

                local exportBox = AceGUI:Create("MultiLineEditBox")
                exportBox:SetLabel(L["Export Code"] or "导出码（分享给好友）")
                exportBox:SetNumLines(8)
                exportBox:DisableButton(true)
                local exportStatus = AceGUI:Create("Label")
                exportStatus:SetFullWidth(true)

                local function RefreshExport()
                    local ok, t = pcall(addon.EncodeGuides)
                    if not ok then
                        exportBox:SetText("导出出错：" .. tostring(t))
                        exportStatus:SetText("|cffff0000导出失败：" .. tostring(t) .. "|r")
                        print("|cffff0000BossTips|r 导出出错：" .. tostring(t))
                        return
                    end
                    t = t or ""
                    if t == "" then
                        exportBox:SetText("（当前没有可导出的自定义数据，请在编辑器中修改任意攻略后再试）")
                        exportStatus:SetText("|cffffff00提示：尚未修改任何内置攻略或创建自定义数据。|r")
                    else
                        local okSet = pcall(function() exportBox:SetText(t) end)
                        if okSet then
                            exportStatus:SetText("|cff00ff00导出成功：" .. #t .. " 字符。点击上方框内文字后 Ctrl+A / Ctrl+C 复制。|r")
                        else
                            exportStatus:SetText("|cffff0000导出结果无法显示，请查看聊天框。|r")
                            print("|cffffff00BossTips 导出码（" .. #t .. " 字符）：|r")
                            print(t)
                        end
                    end
                end
                RefreshExport()
                AddFullWidth(scroll, exportBox)
                AddFullWidth(scroll, exportStatus)

                local genBtn = AceGUI:Create("Button")
                genBtn:SetText(L["Generate Export Code"] or "生成导出码")
                genBtn:SetCallback("OnClick", function()
                    RefreshExport()
                    exportBox:HighlightText()
                    exportBox:SetFocus()
                end)
                AddFullWidth(scroll, genBtn)
                AddLabel(scroll, "|cff888888导出范围：自定义攻略覆盖、开关状态、自定义分类/副本、首领战ID覆盖。不包含内置攻略与UI设置。|r")

                AddLabel(scroll, "粘贴别人分享的导入码后点击导入，兼容旧版纯攻略分享码。")

                local importBox = AceGUI:Create("MultiLineEditBox")
                importBox:SetLabel(L["Import Code"] or "导入码（粘贴分享码）")
                importBox:SetNumLines(5)
                importBox:DisableButton(true)
                AddFullWidth(scroll, importBox)

                local importBtn = AceGUI:Create("Button")
                importBtn:SetText(L["Verify & Import"] or "校验并导入")
                importBtn:SetCallback("OnClick", function()
                    local code = importBox:GetText() or ""
                    local decoded = addon.DecodeGuides(code)
                    if decoded and (next(decoded.guides or {}) or next(decoded.customVersions or {}) or next(decoded.customDungeons or {})
                        or next(decoded.disabledNative or {}) or next(decoded.disabledMPlus or {}) or next(decoded.hiddenDungeons or {})
                        or next(decoded.encounterOverrides or {})) then
                        local count = addon.MergeImportedGuides(decoded)
                        importBox:SetText((L["Import successful!"] or "导入成功！") .. " (" .. count .. ")")
                        addon.RefreshGuides()
                        frame:RefreshTree("import_export")
                    else
                        importBox:SetText((L["Import failed: "] or "导入失败：") .. "格式无效或内容为空")
                    end
                end)
                AddFullWidth(scroll, importBtn)
                return
            end

            -- ========== 新建分类 ==========
            if nodeType == "new_version" then
                AddHeading(scroll, L["New Category"] or "新建分类")

                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Category Name"] or "分类名称")
                AddFullWidth(scroll, nameEdit)

                AddButton(scroll, L["Save Category"] or "保存并添加分类", function()
                    local label = strtrim(nameEdit:GetText() or "")
                    if label == "" then
                        print("|cffff0000BossTips|r 请输入分类名称！")
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

            if nodeType == "unknown" then
                AddLabel(scroll, "请从左侧选择一个分类、副本或目标节点。")
                AddLabel(scroll, "|cff888888调试：未识别路径 [|r" .. tostring(group or "nil") .. "|cff888888]，叶子 [|r" .. tostring(leaf or "nil") .. "|cff888888]|r")
                return
            end

            -- ========== 管理分类 ==========
            if nodeType == "version" then
                AddHeading(scroll, (L["Manage Category"] or "管理分类") .. "：" .. addon.GetVersionLabel(verId))

                local enabled = addon.IsVersionEnabled(verId)
                local activeCheck = AceGUI:Create("CheckBox")
                activeCheck:SetLabel("启用此分类（取消勾选将隐藏该分类下所有副本）")
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
                    labelEdit:SetLabel(L["Category Name"] or "分类名称")
                    labelEdit:SetText(BossTipsGlobalDB.customVersions[verId].label or verId)
                    labelEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        BossTipsGlobalDB.customVersions[verId].label = strtrim(text)
                        frame:RefreshTree(PathVersion(verId))
                    end)

                    local orderEdit = AceGUI:Create("EditBox")
                    orderEdit:SetLabel(L["Category Order"] or "排序权重")
                    orderEdit:SetText(tostring(BossTipsGlobalDB.customVersions[verId].order or 999))
                    orderEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        BossTipsGlobalDB.customVersions[verId].order = tonumber(text) or 999
                        frame:RefreshTree(PathVersion(verId))
                    end)
                    AddRow(scroll, labelEdit, orderEdit)

                    AddButton(scroll, L["Delete Category"] or "删除此分类及其所有内容", function()
                        ConfirmDialog("确定删除自定义分类 '" .. addon.GetVersionLabel(verId) .. "' 及其所有副本吗？", {
                            frame = frame,
                            selectPath = "new_version",
                            func = function()
                                for inst, d in pairs(BossTipsGlobalDB.customDungeons or {}) do
                                    if d.versionId == verId then BossTipsGlobalDB.customDungeons[inst] = nil end
                                end
                                BossTipsGlobalDB.customVersions[verId] = nil
                                BossTipsGlobalDB.disabledCustomVersions[verId] = nil
                                addon.RefreshGuides()
                            end,
                        })
                    end, true)
                end
                return
            end

            -- ========== 新建副本 ==========
            if nodeType == "new_dungeon" then
                AddHeading(scroll, L["New Dungeon"] or "新建副本")

                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Dungeon Name"] or "副本名称（需与 GetInstanceInfo() 一致才能自动匹配）")

                local idEdit = AceGUI:Create("EditBox")
                idEdit:SetLabel(L["Dungeon ID"] or "副本ID（可选）")
                AddRow(scroll, nameEdit, idEdit)

                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel(L["Dungeon Type"] or "副本类型")
                typeDD:SetList(DUNGEON_TYPES)
                typeDD:SetValue("")

                local diffDD = AceGUI:Create("Dropdown")
                diffDD:SetLabel(L["Difficulty"] or "难度")
                diffDD:SetList(DIFFICULTIES)
                diffDD:SetValue("")
                AddRow(scroll, typeDD, diffDD)

                AddButton(scroll, L["Print Current Instance Info"] or "在聊天框打印当前副本信息（需手动输入）", function()
                    local n, _, dID, dName, _, _, _, i = GetInstanceInfo()
                    if i then
                        print("|cff00ff00BossTips|r 当前副本：|cffffff00" .. tostring(n) .. "|r  ID：|cffffff00" .. tostring(i) .. "|r  难度：|cffffff00" .. tostring(dName) .. "|r")
                    else
                        print("|cffff0000BossTips|r 当前不在副本中")
                    end
                end, true)

                AddButton(scroll, L["Save Dungeon"] or "保存并添加副本", function()
                    local nm = strtrim(nameEdit:GetText() or "")
                    if nm == "" then
                        print("|cffff0000BossTips|r 请输入副本名称！")
                        return
                    end
                    if BossTipsGlobalDB.customDungeons[nm] or IsBuiltInDungeon(verId, nm) then
                        print("|cffff0000BossTips|r 副本名称已存在（或与内置副本重名）！")
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

            -- 以下都需要 instName
            local isBuiltInDungeon = IsBuiltInDungeon(verId, instName)
            local customDungeon = BossTipsGlobalDB.customDungeons[instName]
            local dungeonOverride = addon.GetDungeonOverride(instName)

            -- ========== 新建目标 ==========
            if nodeType == "new_boss" then
                AddHeading(scroll, L["New Target Title"] or "新建目标")

                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Target Name"] or "目标名称")
                AddFullWidth(scroll, nameEdit)

                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel("类型")
                typeDD:SetList({ ["BOSS"] = "首领", ["MOB"] = "小怪" })
                typeDD:SetValue("BOSS")
                AddFullWidth(scroll, typeDD)

                AddButton(scroll, L["Save Target"] or "保存并添加目标", function()
                    local nm = strtrim(nameEdit:GetText() or "")
                    if nm == "" then
                        print("|cffff0000BossTips|r 请输入目标名称！")
                        return
                    end
                    local defaultTips = "{rt8}" .. nm .. "{rt8}||在此输入攻略"
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
                            print("|cffff0000BossTips|r 自定义副本数据异常")
                            return
                        end
                        customDungeon.bosses[nm] = { order = 999, type = typeDD:GetValue() or "BOSS", tips = defaultTips, encounterId = "" }
                    end
                    addon.RefreshGuides()
                    frame:RefreshTree(PathBoss(verId, instName, nm))
                end, true)
                return
            end

            -- ========== 编辑目标 ==========
            if nodeType == "boss" then
                local bosses = GetDungeonBossesForEditor(verId, instName)
                local binfo = bosses[bossName]
                if not binfo then
                    AddLabel(scroll, "未找到 '" .. tostring(bossName) .. "' 的攻略数据。")
                    return
                end

                local sourceLabel = ""
                if binfo.source == "builtin" then
                    sourceLabel = " |cffaaaaaa(内置)|r"
                else
                    sourceLabel = " |cff00ccff(自定义)|r"
                end
                AddHeading(scroll, (L["Edit Target"] or "编辑目标") .. "：" .. bossName .. sourceLabel)

                local curTips, currentType = GetRawGuide(instName, bossName)

                -- 目标名称 + 删除按钮
                local nameRow = AceGUI:Create("SimpleGroup")
                nameRow:SetLayout("Flow")
                nameRow:SetFullWidth(true)
                local nameLabel = AceGUI:Create("EditBox")
                nameLabel:SetLabel(L["Target Name"] or "目标名称")
                nameLabel:SetText(bossName)
                nameLabel:SetDisabled(true)
                nameLabel:SetRelativeWidth(0.65)
                nameRow:AddChild(nameLabel)
                local delBtn = AceGUI:Create("Button")
                delBtn:SetText(L["Delete Target"] or "删除此目标")
                delBtn:SetRelativeWidth(0.35)
                delBtn:SetCallback("OnClick", function()
                    ConfirmDialog("确定删除 '" .. bossName .. "' 吗？", {
                        frame = frame,
                        selectPath = PathDungeon(verId, instName),
                        func = function()
                            if customDungeon and customDungeon.bosses then
                                customDungeon.bosses[bossName] = nil
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
                encounterEdit:SetLabel(L["Encounter ID"] or "首领战ID")
                encounterEdit:SetText(binfo.encounterId or "")
                encounterEdit:SetRelativeWidth(0.65)
                encounterEdit:SetCallback("OnEnterPressed", function(_, _, text)
                    local eid = strtrim(text)
                    if isBuiltInDungeon then
                        SaveEncounterId(instName, bossName, eid)
                    elseif customDungeon and customDungeon.bosses and customDungeon.bosses[bossName] then
                        customDungeon.bosses[bossName].encounterId = eid
                    end
                end)
                encRow:AddChild(encounterEdit)
                local autoEncBtn = AceGUI:Create("Button")
                autoEncBtn:SetText(L["Auto Fill"] or "自动填充")
                autoEncBtn:SetRelativeWidth(0.35)
                autoEncBtn:SetCallback("OnClick", function()
                    local eid = addon.GetBigWigsEncounterId(instName, bossName)
                    if eid then
                        encounterEdit:SetText(eid)
                        if isBuiltInDungeon then
                            SaveEncounterId(instName, bossName, eid)
                        elseif customDungeon and customDungeon.bosses and customDungeon.bosses[bossName] then
                            customDungeon.bosses[bossName].encounterId = eid
                        end
                        print("|cff00ff00BossTips|r 已填充首领战ID：" .. eid)
                    else
                        print("|cffff0000BossTips|r 未找到匹配的首领战ID")
                    end
                end)
                encRow:AddChild(autoEncBtn)
                scroll:AddChild(encRow)
                AddLabel(scroll, "|cffffcc00" .. (L["Encounter ID Hint"] or "可通过DBM/BigWigs等插件查找，帮助智能展开") .. "|r")

                -- 类型 + 排序（自定义目标可排序）
                local typeDD = AceGUI:Create("Dropdown")
                typeDD:SetLabel("类型")
                typeDD:SetList({ ["BOSS"] = "首领", ["MOB"] = "小怪" })
                typeDD:SetValue(currentType)
                typeDD:SetCallback("OnValueChanged", function(_, _, v) SaveBossType(instName, bossName, v) end)

                if not isBuiltInDungeon and customDungeon and customDungeon.bosses and customDungeon.bosses[bossName] then
                    local orderEdit = AceGUI:Create("EditBox")
                    orderEdit:SetLabel(L["Category Order"] or "排序权重")
                    orderEdit:SetText(tostring(customDungeon.bosses[bossName].order or 999))
                    orderEdit:SetCallback("OnEnterPressed", function(_, _, text)
                        customDungeon.bosses[bossName].order = tonumber(text) or 999
                        frame:RefreshTree(PathBoss(verId, instName, bossName))
                    end)
                    AddRow(scroll, typeDD, orderEdit)
                else
                    AddFullWidth(scroll, typeDD)
                end

                -- 文本笔记
                local noteEdit = AceGUI:Create("MultiLineEditBox")
                noteEdit:SetLabel(L["Note"] or "文本笔记（输入后自动保存）")
                noteEdit:SetText(curTips)
                noteEdit:SetNumLines(18)
                noteEdit:DisableButton(true)
                noteEdit:SetCallback("OnTextChanged", function(_, _, text) SaveBossTips(instName, bossName, text) end)
                AddFullWidth(scroll, noteEdit)
                return
            end

            -- ========== 管理副本 ==========
            if nodeType == "dungeon" then
                AddHeading(scroll, (L["Manage Dungeon"] or "管理副本") .. "：" .. instName)

                -- 副本名称 / 副本ID（内置副本也能编辑并保存到 dungeonOverrides）
                local nameEdit = AceGUI:Create("EditBox")
                nameEdit:SetLabel(L["Dungeon Name"] or "副本名称")
                nameEdit:SetText(instName)
                nameEdit:SetDisabled(true)

                local idEdit = AceGUI:Create("EditBox")
                idEdit:SetLabel(L["Dungeon ID"] or "副本ID")
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
                typeDD:SetLabel(L["Dungeon Type"] or "副本类型")
                typeDD:SetList(DUNGEON_TYPES)
                typeDD:SetValue((customDungeon and customDungeon.dungeonType) or (dungeonOverride and dungeonOverride.dungeonType) or "")
                typeDD:SetCallback("OnValueChanged", function(_, _, v)
                    if customDungeon then
                        customDungeon.dungeonType = v
                    else
                        addon.SetDungeonOverride(instName, "dungeonType", v)
                    end
                end)

                local diffDD = AceGUI:Create("Dropdown")
                diffDD:SetLabel(L["Difficulty"] or "难度")
                diffDD:SetList(DIFFICULTIES)
                diffDD:SetValue((customDungeon and customDungeon.difficulty) or (dungeonOverride and dungeonOverride.difficulty) or "")
                diffDD:SetCallback("OnValueChanged", function(_, _, v)
                    if customDungeon then
                        customDungeon.difficulty = v
                    else
                        addon.SetDungeonOverride(instName, "difficulty", v)
                    end
                end)
                AddRow(scroll, typeDD, diffDD)

                AddButton(scroll, L["Print Current Instance Info"] or "在聊天框打印当前副本信息（需手动修改）", function()
                    local n, _, dID, dName, _, _, _, i = GetInstanceInfo()
                    if i then
                        print("|cff00ff00BossTips|r 当前副本：|cffffff00" .. tostring(n) .. "|r  ID：|cffffff00" .. tostring(i) .. "|r  难度：|cffffff00" .. tostring(dName) .. "|r")
                    else
                        print("|cffff0000BossTips|r 当前不在副本中")
                    end
                end, true)

                -- 自动填充 BigWigs 首领战ID
                AddButton(scroll, L["Auto Fill BigWigs IDs"] or "自动填充 BigWigs 首领战ID", function()
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
                    print("|cff00ff00BossTips|r 已填充 " .. filled .. " 个首领战ID")
                    frame:RefreshTree(PathDungeon(verId, instName))
                end, true)

                -- 激活此副本
                local activeCheck = AceGUI:Create("CheckBox")
                activeCheck:SetLabel(L["Active Dungeon Hint"] or "激活此副本（取消勾选将在屏幕上隐藏）")
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
                    frame:RefreshTree(PathDungeon(verId, instName))
                end)
                AddFullWidth(scroll, activeCheck)

                -- 移动到分类（仅自定义副本）
                if customDungeon then
                    local moveDD = AceGUI:Create("Dropdown")
                    moveDD:SetLabel(L["Move To Category"] or "移动到分类")
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
                AddButton(scroll, L["Add Target In Dungeon"] or "+ 在此副本中新增目标", function()
                    frame:RefreshTree(PathNewBoss(verId, instName))
                end, true)

                -- 删除此副本及其所有内容
                if customDungeon then
                    AddButton(scroll, L["Delete Dungeon"] or "删除此副本及其所有内容", function()
                        ConfirmDialog("确定删除自定义副本 '" .. instName .. "' 吗？内置副本不会被删除。", {
                            frame = frame,
                            selectPath = PathVersion(verId),
                            func = function()
                                BossTipsGlobalDB.customDungeons[instName] = nil
                                BossTipsGlobalDB.guides[instName] = nil
                                BossTipsGlobalDB.hiddenDungeons[instName] = nil
                                addon.RefreshGuides()
                            end,
                        })
                    end, true)
                end
                return
            end

            -- 兜底
            AddLabel(scroll, "请从左侧选择一个分类、副本或目标节点。")
        end)

        if not ok then
            ShowError(err)
        else
            widget:DoLayout()
        end
    end)

    frame:RefreshTree()
end
