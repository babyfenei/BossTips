import lupa, os

lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute(r'''
_G = _G or {}
_G.print = function() end
_G.BossTipsGlobalDB = { lang = "AUTO" }
''')

base = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
# stub GetLocale so we can test AUTO -> game locale mapping
lua.execute('_G.GetLocale = function() return "enUS" end')
lua.execute('_G.BossTipsAddon = {}')

files = [
    "Locales.lua", "Data.lua",
    "Guides/MPlus/Current.lua", "Guides/Raids/v12.1.lua",
    "Guides/MPlus/Current_zhTW.lua", "Guides/MPlus/Current_enUS.lua",
    "Guides/Raids/v12.1_zhTW.lua", "Guides/Raids/v12.1_enUS.lua",
]
for f in files:
    code = open(os.path.join(base, f), encoding="utf-8").read().replace("local _, addon = ...", "local addon = _G.BossTipsAddon")
    lua.execute(code)

addon = lua.globals()['_G']['BossTipsAddon']
addon.BuildActiveGuides()

def get_text(inst, boss, diff):
    return lua.execute(
        'local a=_G.BossTipsAddon local e=a.ActiveGuides[%r][%r] return a.GetGuideText(e, %r)'
        % (inst, boss, diff)
    )

# original difficulty data intact?
orig = get_text("毒牙祭坛", "拉维", "mythicplus")  # zhCN source (lang AUTO + GetLocale enUS -> but this is zhCN source via fallback)
# Force zhCN to read source
lua.execute('_G.BossTipsGlobalDB.lang = "zhCN"')
addon.RefreshLocale()
src_zhCN = get_text("毒牙祭坛", "拉维", "mythicplus")
assert "拉维" in src_zhCN, "zhCN source lost: " + src_zhCN[:40]

# enUS via AUTO (GetLocale stubbed enUS)
lua.execute('_G.BossTipsGlobalDB.lang = "AUTO"')
addon.RefreshLocale()
en_auto = get_text("毒牙祭坛", "拉维", "mythicplus")
print("LOCALE(auto/enUS) =", addon.LOCALE, "| M+ got:", en_auto[:30].replace("\n"," "))

# zhTW explicit override
lua.execute('_G.BossTipsGlobalDB.lang = "zhTW"')
addon.RefreshLocale()
tw = get_text("毒牙祭坛", "拉维", "mythicplus")
print("LOCALE(zhTW)      =", addon.LOCALE, "| M+ got:", tw[:30].replace("\n"," "))

# enUS explicit
lua.execute('_G.BossTipsGlobalDB.lang = "enUS"')
addon.RefreshLocale()
en = get_text("毒牙祭坛", "拉维", "mythicplus")
print("LOCALE(enUS)      =", addon.LOCALE, "| M+ got:", en[:30].replace("\n"," "))

# Raid: 4 difficulties, zhTW
lua.execute('_G.BossTipsGlobalDB.lang = "zhTW"')
addon.RefreshLocale()
for d in ("lfr","normal","heroic","mythic"):
    t = get_text("烈毒之渊", "盘魂者内克扎莉", d)
    print(f"RAID zhTW {d:7s}:", t[:28].replace("\n"," "))

# Checks
fails = 0
lua.execute('_G.BossTipsGlobalDB.lang = "enUS"'); addon.RefreshLocale()
if "Rav'i" not in get_text("毒牙祭坛","拉维","mythicplus"): print("FAIL M+ enUS name"); fails+=1
lua.execute('_G.BossTipsGlobalDB.lang = "zhTW"'); addon.RefreshLocale()
if "拉維" not in get_text("毒牙祭坛","拉维","mythicplus"): print("FAIL M+ zhTW name"); fails+=1
if "盤魂者" not in get_text("烈毒之渊","盘魂者内克扎莉","normal"): print("FAIL raid zhTW"); fails+=1
lua.execute('_G.BossTipsGlobalDB.lang = "zhCN"'); addon.RefreshLocale()
zc = get_text("烈毒之渊","盘魂者内克扎莉","normal")
if "拦停" not in zc: print("FAIL raid zhCN source (simplified 拦停 missing)"); fails+=1
lua.execute('_G.BossTipsGlobalDB.lang = "zhTW"'); addon.RefreshLocale()
zt = get_text("烈毒之渊","盘魂者内克扎莉","normal")
if "攔停" not in zt: print("FAIL raid zhTW (traditional 攔停 missing)"); fails+=1
if zc == zt: print("FAIL zhCN==zhTW (no language separation)"); fails+=1
lua.execute('_G.BossTipsGlobalDB.lang = "zhCN"'); addon.RefreshLocale()

# UI language: addon.L should follow setting
lua.execute('_G.BossTipsGlobalDB.lang = "enUS"'); addon.RefreshLocale()
ui_en = lua.execute('return _G.BossTipsAddon.L["Settings"]')
lua.execute('_G.BossTipsGlobalDB.lang = "zhTW"'); addon.RefreshLocale()
ui_tw = lua.execute('return _G.BossTipsAddon.L["Settings"]')
lua.execute('_G.BossTipsGlobalDB.lang = "zhCN"'); addon.RefreshLocale()
ui_zh = lua.execute('return _G.BossTipsAddon.L["Settings"]')
print("UI L Settings:", ui_en, "/", ui_tw, "/", ui_zh)
if not (ui_en=="Settings" and ui_tw=="設定" and ui_zh=="设置"): print("FAIL UI lang"); fails+=1

print("OVERALL:", "PASS" if fails==0 else f"FAIL({fails})")
