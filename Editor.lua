-- ============================================================================
-- BossTips Editor.lua —— 攻略编辑器（AceGUI TreeGroup，对齐 DungeonCheatSheet）
-- 三层树：版本 → 副本 → 首领/小怪。编辑写入 WTF 覆盖层 BossTipsGlobalDB.guides。
-- 导入导出用 Base64（EncodeGuides / DecodeGuides / MergeImportedGuides）。
-- ============================================================================
local addonName, addon = ...
local L = addon.L
local AceGUI = LibStub("AceGUI-3.0")

local function GetInstanceBosses(instanceName)
    local g = addon.GetBossData()
    return (g and g[instanceName]) or {}
end

local function BuildTree()
    local treeData = {}
    table.insert(treeData, { value = "import_export", text = "|cff00ccff" .. (L["Import / Export"] or "[<=> 导入/导出]") .. "|r" })
    for _, vid in ipairs(addon.GetNativeOrder()) do
        local catNode = { value = "V:" .. vid, text = "|cffffcc00" .. addon.GetVersionLabel(vid) .. "|r", children = {} }
        local dungeons = addon.GuideData.versions[vid]
        if dungeons then
            for instName in pairs(dungeons) do
                local instNode = { value = "V:" .. vid .. "\001" .. instName, text = instName, children = {} }
                local bosses = dungeons[instName]
                for boss in pairs(bosses) do
                    table.insert(instNode.children, { value = "V:" .. vid .. "\001" .. instName .. "\001" .. boss, text = boss })
                end
                table.insert(catNode.children, instNode)
            end
        end
        table.insert(treeData, catNode)
    end
    for _, sid in ipairs(addon.GetMPlusOrder()) do
        local catNode = { value = "M:" .. sid, text = "|cffffcc00" .. addon.GetVersionLabel(sid) .. "|r", children = {} }
        local dungeons = addon.GuideData.mplus[sid]
        if dungeons then
            for instName in pairs(dungeons) do
                local instNode = { value = "M:" .. sid .. "\001" .. instName, text = instName, children = {} }
                local bosses = dungeons[instName]
                for boss in pairs(bosses) do
                    table.insert(instNode.children, { value = "M:" .. sid .. "\001" .. instName .. "\001" .. boss, text = boss })
                end
                table.insert(catNode.children, instNode)
            end
        end
        table.insert(treeData, catNode)
    end
    return treeData
end

function addon:CreateEditorFrame()
    if addon.editorFrame then
        addon.editorFrame:Show()
        if addon.editorFrame.RefreshTree then addon.editorFrame:RefreshTree() end
        return
    end

    local frame = AceGUI:Create("Frame")
    frame:SetTitle(L["Dungeon & Target Editor"] or "BossTips 攻略编辑器")
    frame:SetLayout("Fill")
    frame:SetWidth(750)
    frame:SetHeight(550)
    addon.editorFrame = frame

    frame:SetCallback("OnClose", function(widget)
        widget:Hide()
        addon.RefreshGuides()
        if not InCombatLockdown() then addon:OpenMainGUI() end
    end)

    local treeGroup = AceGUI:Create("TreeGroup")
    treeGroup:SetLayout("Flow")
    treeGroup:SetTreeWidth(240)
    treeGroup:SetTree(BuildTree())
    frame:AddChild(treeGroup)
    frame.treeGroup = treeGroup

    function frame:RefreshTree(selectedPath)
        treeGroup:SetTree(BuildTree())
        if selectedPath then treeGroup:SelectByPath(selectedPath) end
    end

    treeGroup:SetCallback("OnGroupSelected", function(widget, event, group)
        widget:ReleaseChildren()
        local scroll = AceGUI:Create("ScrollFrame")
        scroll:SetLayout("Flow")
        scroll:SetFullWidth(true)
        scroll:SetFullHeight(true)
        widget:AddChild(scroll)

        -- ============ 导入导出 ============
        if group == "import_export" then
            local title = AceGUI:Create("Heading")
            title:SetText(L["Import / Export"] or "数据导入/导出")
            title:SetFullWidth(true)
            scroll:AddChild(title)

            local exportBox = AceGUI:Create("MultiLineEditBox")
            exportBox:SetLabel(L["Export Code"] or "导出码（分享给好友）")
            exportBox:SetFullWidth(true)
            exportBox:SetNumLines(6)
            exportBox:DisableButton(true)
            exportBox:SetText(addon.EncodeGuides() or "")
            scroll:AddChild(exportBox)

            local genBtn = AceGUI:Create("Button")
            genBtn:SetText(L["Generate Export Code"] or "生成导出码")
            genBtn:SetFullWidth(true)
            genBtn:SetCallback("OnClick", function()
                exportBox:SetText(addon.EncodeGuides() or "")
                exportBox:HighlightText()
                exportBox:SetFocus()
            end)
            scroll:AddChild(genBtn)

            local importBox = AceGUI:Create("MultiLineEditBox")
            importBox:SetLabel(L["Import Code"] or "导入码（粘贴分享码）")
            importBox:SetFullWidth(true)
            importBox:SetNumLines(6)
            importBox:DisableButton(true)
            scroll:AddChild(importBox)

            local importBtn = AceGUI:Create("Button")
            importBtn:SetText(L["Verify & Import"] or "校验并导入")
            importBtn:SetFullWidth(true)
            importBtn:SetCallback("OnClick", function()
                local code = importBox:GetText()
                local decoded = addon.DecodeGuides(code)
                if decoded and next(decoded) then
                    local count = addon.MergeImportedGuides(decoded)
                    importBox:SetText((L["Import successful!"] or "导入成功！") .. " (" .. count .. ")")
                    addon.RefreshGuides()
                    frame:RefreshTree("import_export")
                else
                    importBox:SetText((L["Import failed: "] or "导入失败：") .. "格式无效")
                end
            end)
            scroll:AddChild(importBtn)
            return
        end

        -- ============ 版本 / 副本 / Boss ============
        local path = { strsplit("\001", group) }
        local prefix = path[1]
        if not prefix or (string.sub(prefix, 1, 2) ~= "V:" and string.sub(prefix, 1, 2) ~= "M:") then return end
        local isMplus = string.sub(prefix, 1, 2) == "M:"
        local verId = string.sub(prefix, 3)
        local instName = path[2]
        local bossName = path[3]

        if not instName then
            -- 版本管理（仅展示，列出副本）
            local title = AceGUI:Create("Heading")
            title:SetText(addon.GetVersionLabel(verId))
            title:SetFullWidth(true)
            scroll:AddChild(title)
            local src = isMplus and addon.GuideData.mplus[verId] or addon.GuideData.versions[verId]
            if src then
                for name in pairs(src) do
                    local label = AceGUI:Create("Label")
                    label:SetText(name)
                    label:SetFullWidth(true)
                    scroll:AddChild(label)
                end
            end
            return
        end

        local bosses = GetInstanceBosses(instName)

        if not bossName then
            -- ============ 管理副本 ============
            local title = AceGUI:Create("Heading")
            title:SetText(L["Manage Dungeon"] and ("管理副本：" .. instName) or instName)
            title:SetFullWidth(true)
            scroll:AddChild(title)

            -- 列出 boss + 编辑入口
            for bname in pairs(bosses) do
                local btn = AceGUI:Create("Button")
                btn:SetText(bname)
                btn:SetFullWidth(true)
                btn:SetCallback("OnClick", function()
                    frame:RefreshTree(prefix .. "\001" .. instName .. "\001" .. bname)
                end)
                scroll:AddChild(btn)
            end

            -- 新建首领/小怪
            local newEdit = AceGUI:Create("EditBox")
            newEdit:SetLabel(L["New Boss"] or "新建首领/小怪名称")
            newEdit:SetRelativeWidth(0.7)
            scroll:AddChild(newEdit)
            local addType = "BOSS"
            local typeDD = AceGUI:Create("Dropdown")
            typeDD:SetLabel("类型")
            typeDD:SetRelativeWidth(0.3)
            typeDD:SetList({ ["BOSS"] = "首领", ["MOB"] = "小怪" })
            typeDD:SetValue("BOSS")
            typeDD:SetCallback("OnValueChanged", function(_, _, v) addType = v end)
            scroll:AddChild(typeDD)

            local newBtn = AceGUI:Create("Button")
            newBtn:SetText(L["New Boss"] or "+ 新建首领/小怪")
            newBtn:SetFullWidth(true)
            newBtn:SetCallback("OnClick", function()
                local nm = strtrim(newEdit:GetText() or "")
                if nm == "" then
                    print("|cffff0000BossTips|r 请输入首领/小怪名称！")
                    return
                end
                BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
                BossTipsGlobalDB.guides[instName] = BossTipsGlobalDB.guides[instName] or {}
                BossTipsGlobalDB.guides[instName][nm] = "{rt8}" .. nm .. "{rt8}||在此输入攻略"
                addon.RefreshGuides()
                frame:RefreshTree(prefix .. "\001" .. instName .. "\001" .. nm)
            end)
            scroll:AddChild(newBtn)

            -- 删除副本（仅从 WTF 覆盖层移除）
            if BossTipsGlobalDB.guides and BossTipsGlobalDB.guides[instName] then
                local spacer = AceGUI:Create("Label")
                spacer:SetText("\n")
                spacer:SetFullWidth(true)
                scroll:AddChild(spacer)
                local delBtn = AceGUI:Create("Button")
                delBtn:SetText(L["Delete"] and ("删除本副本自定义攻略") or "删除自定义")
                delBtn:SetFullWidth(true)
                delBtn:SetCallback("OnClick", function()
                    BossTipsGlobalDB.guides[instName] = nil
                    addon.RefreshGuides()
                    frame:RefreshTree(prefix)
                end)
                scroll:AddChild(delBtn)
            end
            return
        end

        -- ============ 编辑 Boss ============
        local entry = GetActiveGuideEntry and addon.GetActiveGuideEntry(instName, bossName)
        local curTips = (entry and entry.tips) or (BossTipsGlobalDB.guides[instName] and BossTipsGlobalDB.guides[instName][bossName]) or ""

        local title = AceGUI:Create("Heading")
        title:SetText(bossName)
        title:SetFullWidth(true)
        scroll:AddChild(title)

        local noteEdit = AceGUI:Create("MultiLineEditBox")
        noteEdit:SetLabel(L["Note"] or "攻略文本")
        noteEdit:SetText(curTips)
        noteEdit:SetFullWidth(true)
        noteEdit:SetNumLines(16)
        noteEdit:DisableButton(true)
        noteEdit:SetCallback("OnTextChanged", function(_, _, text)
            BossTipsGlobalDB.guides = BossTipsGlobalDB.guides or {}
            BossTipsGlobalDB.guides[instName] = BossTipsGlobalDB.guides[instName] or {}
            BossTipsGlobalDB.guides[instName][bossName] = text
            addon.RefreshGuides()
        end)
        scroll:AddChild(noteEdit)

        local delBtn = AceGUI:Create("Button")
        delBtn:SetText(L["Delete"] or "删除本首领攻略")
        delBtn:SetFullWidth(true)
        delBtn:SetCallback("OnClick", function()
            if BossTipsGlobalDB.guides[instName] then
                BossTipsGlobalDB.guides[instName][bossName] = nil
                if next(BossTipsGlobalDB.guides[instName]) == nil then
                    BossTipsGlobalDB.guides[instName] = nil
                end
            end
            addon.RefreshGuides()
            frame:RefreshTree(prefix .. "\001" .. instName)
        end)
        scroll:AddChild(delBtn)
    end)

    frame:RefreshTree()
end
