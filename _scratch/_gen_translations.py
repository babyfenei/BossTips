import json, os

base = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
data = json.load(open(os.path.join(base, "_extract_guides.json"), encoding="utf-8"))

DIFFS = ["lfr", "normal", "heroic", "mythic"]

def lua_str(s):
    """Emit a Lua long-bracket string, choosing a bracket level that never closes inside s."""
    if s is None:
        s = ""
    k = 0
    while ("]" + "=" * k + "]") in s:
        k += 1
    eq = "=" * k
    return "[" + eq + "[" + s + "]" + eq + "]"

def header(lang, cat):
    cat_label = "大秘境" if cat == "mplus" else "团本"
    return (
        "-- ============================================================================\n"
        f"-- BossTips 攻略翻译 —— {cat_label}（{lang}，仅译文；源文本见对应简中攻略文件）\n"
        "-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。\n"
        "-- 难度键：大秘境=mythicplus；团本=lfr/normal/heroic/mythic。\n"
        "-- ============================================================================\n"
        "local _, addon = ...\n"
        "addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }\n"
        "addon.GuideData.translations = addon.GuideData.translations or {}\n"
        f"addon.GuideData.translations.{lang} = addon.GuideData.translations.{lang} or {{}}\n"
        f"addon.GuideData.translations.{lang}.{cat} = addon.GuideData.translations.{lang}.{cat} or {{}}\n"
    )

def build_mplus(lang):
    out = [header(lang, "mplus")]
    out.append('addon.GuideData.translations.%s.mplus["Current"] = {\n' % lang)
    first_inst = True
    for inst, bosses in data["mplus"].items():
        if not first_inst:
            out.append(",\n")
        first_inst = False
        out.append('    ["%s"] = {\n' % inst)
        first_boss = True
        for boss, rec in bosses.items():
            if not first_boss:
                out.append(",\n")
            first_boss = False
            txt = rec.get("mythicplus", {}).get(lang, "")
            out.append('        ["%s"] = { mythicplus = %s }' % (boss, lua_str(txt)))
        out.append("\n    }")
    out.append("\n}\n")
    return "".join(out)

def build_raid(lang):
    out = [header(lang, "raids")]
    out.append('addon.GuideData.translations.%s.raids["12.1"] = {\n' % lang)
    first_inst = True
    for inst, bosses in data["raids"].items():
        if not first_inst:
            out.append(",\n")
        first_inst = False
        out.append('    ["%s"] = {\n' % inst)
        first_boss = True
        for boss, rec in bosses.items():
            if not first_boss:
                out.append(",\n")
            first_boss = False
            parts = []
            for d in DIFFS:
                txt = rec.get(d, {}).get(lang, "")
                parts.append("%s = %s" % (d, lua_str(txt)))
            out.append('        ["%s"] = { %s }' % (boss, ", ".join(parts)))
        out.append("\n    }")
    out.append("\n}\n")
    return "".join(out)

files = {
    "Guides/MPlus/Current_zhTW.lua": build_mplus("zhTW"),
    "Guides/MPlus/Current_enUS.lua": build_mplus("enUS"),
    "Guides/Raids/v12.1_zhTW.lua": build_raid("zhTW"),
    "Guides/Raids/v12.1_enUS.lua": build_raid("enUS"),
}
for rel, content in files.items():
    with open(os.path.join(base, rel), "w", encoding="utf-8") as f:
        f.write(content)
    print("wrote", rel, len(content), "bytes")
