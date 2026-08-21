import lupa, os

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"

FILES = [
    "Locales.lua",
    "Data.lua",
    "Guides/MPlus/Current.lua",
    "Guides/Raids/v12.1.lua",
    "Guides/MPlus/Current_zhTW.lua",
    "Guides/MPlus/Current_enUS.lua",
    "Guides/Raids/v12.1_zhTW.lua",
    "Guides/Raids/v12.1_enUS.lua",
]

def build(game_locale, setting_lang=None):
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    if setting_lang is None:
        lua.execute(r'''
        _G = _G or {}
        _G.GetLocale = function() return "%s" end
        _G.print = function() end
        _G.BossTipsGlobalDB = { lang = "AUTO" }
        ''' % game_locale)
    else:
        lua.execute(r'''
        _G = _G or {}
        _G.GetLocale = function() return "%s" end
        _G.print = function() end
        _G.BossTipsGlobalDB = { lang = "%s" }
        ''' % (game_locale, setting_lang))
    lua.execute('_G.BossTipsAddon = {}')
    for f in FILES:
        code = open(os.path.join(BASE, f), encoding="utf-8").read()
        code = code.replace("local _, addon = ...", "local addon = _G.BossTipsAddon")
        lua.execute(code)
    lua.execute('local a=_G.BossTipsAddon a.BuildActiveGuides()')
    return lua

fails = 0

# 1) AUTO + 游戏客户端=zhCN -> 应取简中
lua = build("zhCN")
loc = lua.execute('return _G.BossTipsAddon.LOCALE')
ui = lua.execute('return _G.BossTipsAddon.L["Settings"]')
mp = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["毒牙祭坛"]["拉维"] return a.GetGuideText(e,"mythicplus")')
print(f"[AUTO/zhCN] LOCALE={loc} UI={ui!r} M+首行含拉维={'拉维' in mp}")
if loc != "zhCN" or ui != "设置" or "拉维" not in mp:
    print("  FAIL AUTO/zhCN"); fails += 1

# 2) AUTO + 游戏客户端=enUS -> 应取英文
lua = build("enUS")
loc = lua.execute('return _G.BossTipsAddon.LOCALE')
ui = lua.execute('return _G.BossTipsAddon.L["Settings"]')
mp = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["毒牙祭坛"]["拉维"] return a.GetGuideText(e,"mythicplus")')
has_ravi_en = "Rav'i" in mp
print(f"[AUTO/enUS] LOCALE={loc} UI={ui!r} M+首行含Rav'i={has_ravi_en}")
if loc != "enUS" or ui != "Settings" or not has_ravi_en:
    print("  FAIL AUTO/enUS"); fails += 1

# 3) 设置强制 zhTW（即使游戏客户端 enUS）-> 应取繁中
lua = build("enUS", "zhTW")
loc = lua.execute('return _G.BossTipsAddon.LOCALE')
ui = lua.execute('return _G.BossTipsAddon.L["Settings"]')
mp = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["毒牙祭坛"]["拉维"] return a.GetGuideText(e,"mythicplus")')
rd_l = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["烈毒之渊"]["盘魂者内克扎莉"] return a.GetGuideText(e,"lfr")')
print(f"[settings=zhTW] LOCALE={loc} UI={ui!r} M+含拉維={'拉維' in mp} RaidLFR含盤魂者={'盤魂者' in rd_l}")
if loc != "zhTW" or ui != "設定" or "拉維" not in mp or "盤魂者" not in rd_l:
    print("  FAIL settings=zhTW"); fails += 1

# 4) 设置强制 enUS（即使游戏客户端 zhCN）-> 应取英文
lua = build("zhCN", "enUS")
loc = lua.execute('return _G.BossTipsAddon.LOCALE')
ui = lua.execute('return _G.BossTipsAddon.L["Settings"]')
mp = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["毒牙祭坛"]["拉维"] return a.GetGuideText(e,"mythicplus")')
rd_m = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["烈毒之渊"]["盘魂者内克扎莉"] return a.GetGuideText(e,"mythic")')
has_ravi_en2 = "Rav'i" in mp
has_sb = "Soulbinder" in rd_m
print(f"[settings=enUS] LOCALE={loc} UI={ui!r} M+含Rav'i={has_ravi_en2} RaidMythic含Soulbinder={has_sb}")
if loc != "enUS" or ui != "Settings" or not has_ravi_en2 or not has_sb:
    print("  FAIL settings=enUS"); fails += 1

# 5) 未翻译首领回退简中（M+ 繁中文件未覆盖的) — 取一份确认源数据不丢
lua = build("zhCN")
src = lua.execute('local a=_G.BossTipsAddon local e=a.ActiveGuides["毒牙祭坛"]["拉维"] return a.GetTipsForDifficulty(e,"mythicplus")')
print(f"[源数据] 拉维简中源含'拉维'={'拉维' in src}")

print("OVERALL:", "PASS" if fails == 0 else f"FAIL({fails})")
