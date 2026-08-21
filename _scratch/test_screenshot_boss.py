import os
from lupa import LuaRuntime
ADDON = r"E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
lua = LuaRuntime(unpack_returned_tuples=True, encoding="utf-8")
BD = lua.table(); BD["lang"] = "enUS"
lua.globals().BossTipsGlobalDB = BD
lua.globals().GetLocale = lambda: "enUS"
addon = lua.table()
for rel in ["Locales.lua", "Data.lua", "Guides/MPlus/Current.lua", "Guides/MPlus/Current_enUS.lua", "Guides/MPlus/Current_zhTW.lua"]:
    with open(os.path.join(ADDON, rel), encoding="utf-8") as f:
        code = f.read()
    lua.eval("function(...) " + code + " end")(0, addon)
for loc in ("enUS", "zhTW"):
    addon.LOCALE = loc
    print(f"[{loc}] Lightbloom name:", addon.GetLocalizedBossName("夺目谷", "光明众花", False, "Current"))
    print(f"[{loc}] Instance  Dazzling:", addon.GetLocalizedInstanceName("夺目谷", "mplus", "Current"))
