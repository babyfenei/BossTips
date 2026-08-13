local addon = {}
function strsplit(delimiter, text)
    local list = {}
    local pos = 1
    if string.find("", delimiter, 1) then
        error("delimiter matches empty string")
    end
    while true do
        local first, last = string.find(text, delimiter, pos)
        if first then
            table.insert(list, string.sub(text, pos, first - 1))
            pos = last + 1
        else
            table.insert(list, string.sub(text, pos))
            break
        end
    end
    return table.unpack(list)
end
function strtrim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
local STANDARD_TEXT_FONT = "Fonts\\ARHei.ttf"
local GameFontNormal = {GetFont=function() return STANDARD_TEXT_FONT, 12 end}

local ICON_PLUS = "+"
local ICON_MINUS = "-"
local ICON_PLUS_MOB = "+"
local ICON_MINUS_MOB = "-"

local function GetTitleText(name, isExpanded, etype)
    local prefix = isExpanded and ICON_MINUS or ICON_PLUS
    if etype == "MOB" then
        prefix = isExpanded and ICON_MINUS_MOB or ICON_PLUS_MOB
    end
    local color = (etype == "MOB") and "|cffaaaaaa" or "|cffffcc00"
    return prefix .. " " .. color .. (name or "") .. "|r"
end

local function TrySetHyperlinkScripts(note) return false end

local function NormalizeSegmentColor(seg)
    seg = seg:gsub("([^|])([cC][fF][fF]%x%x%x%x%x%x)", "%1|%2")
    seg = seg:gsub("^([cC][fF][fF]%x%x%x%x%x%x)", "|%1")
    local out = {}
    local open = 0
    local i = 1
    while i <= #seg do
        local s = seg:sub(i)
        if s:match("^|cff%x%x%x%x%x%x") then
            open = open + 1
            out[#out + 1] = seg:sub(i, i + 9)
            i = i + 10
        elseif s:match("^|r") then
            open = math.max(0, open - 1)
            out[#out + 1] = "|r"
            i = i + 2
        elseif s:match("^r") and open > 0 then
            open = math.max(0, open - 1)
            out[#out + 1] = "|r"
            i = i + 1
        else
            out[#out + 1] = seg:sub(i, i)
            i = i + 1
        end
    end
    if open > 0 then out[#out + 1] = "|r" end
    return table.concat(out)
end

local function ColorSkill(skill)
    if skill:find("打断") or skill:find("必断") or skill:find("^断") or skill:find("^速断") then
        return "|cffff3333[" .. skill .. "]|r"
    end
    if skill:find("速杀") or skill:find("重点") or skill:find("关注") or skill:find("集火") or skill:find("优先") then
        return "|cffffcc00[" .. skill .. "]|r"
    end
    return "|cff33ff33[" .. skill .. "]|r"
end

local function FormatTips(text)
    if not text or text == "" then return "" end

    text = string.gsub(text, "%[([^%]%|]+)|spell:(%d+)%]", function(name)
        return "[" .. name .. "]"
    end)

    local links = {}
    text = string.gsub(text, "(|H[^|]*|h.-|h)", function(h)
        links[#links + 1] = h
        return "\001" .. #links .. "\001"
    end)

    text = string.gsub(text, "^{rt8}(.-){rt8}|", "%1\n")
    text = string.gsub(text, "^{rt8}(.-){rt8}", "%1\n")

    text = string.gsub(text, "||", "\002")
    text = string.gsub(text, "|", " ")

    text = string.gsub(text, "{rt1}(.-){rt1}", function(inner)
        return "|cffffcc00重点 " .. inner .. "|r"
    end)

    text = string.gsub(text, "{rt%d}", "")
    text = string.gsub(text, "%[rt%d%]", "")

    text = string.gsub(text, "打断([^%s%[%]|，。；：,;!！?？]+)", "|cffff3333打断%1|r")

    text = string.gsub(text, "%[([^%]]+)%]", function(skill)
        return ColorSkill(skill)
    end)

    text = string.gsub(text, "\002", "\n")
    text = string.gsub(text, "\001(%d+)\001", function(n)
        return links[tonumber(n)] or ""
    end)

    local segments = { strsplit("\n", text) }
    local out = {}
    for _, seg in ipairs(segments) do
        seg = strtrim(seg)
        if seg ~= "" then
            seg = NormalizeSegmentColor(seg)
            table.insert(out, seg)
        end
    end
    return table.concat(out, "\n")
end

local text = "{rt8}扭缠盘蛇{rt8}|[死亡响尾]时全员位移扯断[藤蔓束缚]触发[解缠]，随后集火[解缠之蛇]镜像输出；[复仇猛攻]躲[掘地冲锋]线、把[毒液喷射]正面拉离人群|{rt1}必断/速杀：[萎缩毒化]连读三发必断{rt1}|坦抗[尾刃]；治疗顶[同步毒液]持续与[死亡响尾]叠层"
RESULT = FormatTips(text)
local f = io.open("tools/_fmt.bin", "wb")
if f then f:write(RESULT); f:close() end
