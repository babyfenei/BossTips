# -*- coding: utf-8 -*-
"""Runtime test: load REAL BossTips Data.lua + Locales.lua + M+ files in lupa,
then call addon.GetLocalizedBossName for a BOSS and a MOB under enUS / zhTW.
Goal: confirm whether the {rtN} extraction chain really returns localized names.
"""
import os, sys
from lupa import LuaRuntime

ADDON_DIR = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
LUA_FILES = [
    # (path, "arg-passed-as-addon")
    (os.path.join(ADDON_DIR, "Locales.lua"),  True),
    (os.path.join(ADDON_DIR, "Data.lua"),     True),
    (os.path.join(ADDON_DIR, "Guides", "MPlus", "Current.lua"),       True),
    (os.path.join(ADDON_DIR, "Guides", "MPlus", "Current_enUS.lua"),  True),
    (os.path.join(ADDON_DIR, "Guides", "MPlus", "Current_zhTW.lua"),  True),
]

lua = LuaRuntime(unpack_returned_tuples=True, encoding="utf-8")

# Pre-seed globals the addon reads at load time.
# Force enUS resolution path; we override LOCALE later for zhTW test.
BD = lua.table()
BD["lang"] = "enUS"
lua.globals().BossTipsGlobalDB = BD
lua.globals().GetLocale = lambda: "enUS"

# Create the shared addon table that every file receives as `...`.
addon = lua.table()
lua.globals()._shared_addon = addon

for path, _ in LUA_FILES:
    with open(path, "r", encoding="utf-8") as f:
        code = f.read()
    chunk = lua.eval("function(...) " + code + " end")
    # `local _, addon = ...` -> arg1 = dummy, arg2 = addon
    chunk(0, addon)

print("LOCALE after load:", addon.LOCALE)
print("translations locales:", list(addon.GuideData.translations.keys()))
print("enUS.mplus Current instances:",
      list(addon.GuideData.translations.enUS.mplus["Current"].keys()))

def test(locale, inst, boss, isRaid=False, verId="Current"):
    addon.LOCALE = locale
    name = addon.GetLocalizedBossName(inst, boss, isRaid, verId)
    print(f"[{locale}] GetLocalizedBossName({inst!r}, {boss!r}) -> {name!r}")
    return name

print("\n=== ENUS ===")
test("enUS", "虚空之痕竞技场", "煞戎努斯")        # BOSS
test("enUS", "塞塔里斯神庙", "剧毒蝰蛇")        # MOB
test("enUS", "毒牙祭坛", "高阶进化者")          # BOSS

print("\n=== ZHTW ===")
test("zhTW", "虚空之痕竞技场", "煞戎努斯")        # BOSS
test("zhTW", "塞塔里斯神庙", "剧毒蝰蛇")        # MOB

print("\n=== ZHCN (fallback, should be Chinese key) ===")
test("zhCN", "虚空之痕竞技场", "煞戎努斯")

print("\n=== Instance name ===")
addon.LOCALE = "enUS"
print("enUS instance:", addon.GetLocalizedInstanceName("虚空之痕竞技场", "mplus", "Current"))
addon.LOCALE = "zhTW"
print("zhTW instance:", addon.GetLocalizedInstanceName("虚空之痕竞技场", "mplus", "Current"))
