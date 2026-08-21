import os
from lupa import LuaRuntime
ADDON = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
lua = LuaRuntime(unpack_returned_tuples=True, encoding="utf-8")
BD = lua.table(); BD["lang"] = "enUS"
lua.globals().BossTipsGlobalDB = BD
lua.globals().GetLocale = lambda: "enUS"
addon = lua.table()
files = ["Locales.lua", "Data.lua",
         "Guides/MPlus/Current.lua", "Guides/MPlus/Current_enUS.lua", "Guides/MPlus/Current_zhTW.lua",
         "Guides/Dungeons/v12.0.lua", "Guides/Dungeons/v12.0_enUS.lua", "Guides/Dungeons/v12.0_zhTW.lua"]
for rel in files:
    p = os.path.join(ADDON, rel)
    if not os.path.exists(p): continue
    with open(p, encoding="utf-8") as f: code = f.read()
    lua.eval("function(...) " + code + " end")(0, addon)

print("=== NATIVE v12.0 (the screenshot scenario) ===")
addon.LOCALE = "enUS"
print("Instance 夺目谷 ->", addon.GetLocalizedInstanceName("夺目谷", "native", "12.0"))
for b in ("光明众花", "护光者鲁伊亚", "兹欧凯特", "圣光猎手伊库兹"):
    n = addon.GetLocalizedBossName("夺目谷", b, False, "12.0")
    print(f"  Boss {b} -> {n}")

print("\n=== M+ Current (regression check) ===")
for b in ("煞戎努斯", "光明众花", "剧毒蝰蛇"):
    n = addon.GetLocalizedBossName("虚空之痕竞技场" if b=="煞戎努斯" else "塞塔里斯神庙" if b=="剧毒蝰蛇" else "夺目谷", b, False, "Current")
    print(f"  Boss {b} -> {n}")

print("\n=== ZHTW native ===")
addon.LOCALE = "zhTW"
n = addon.GetLocalizedBossName("夺目谷", "护光者鲁伊亚", False, "12.0")
print(f"  Boss 护光者鲁伊亚 -> {n}")
n = addon.GetLocalizedBossName("夺目谷", "光明众花", False, "Current")
print(f"  M+ Boss 光明众花 -> {n}")
