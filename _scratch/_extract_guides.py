import lupa, json, shutil, os

lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute(r'''
_G = _G or {}
_G.GetLocale = function() return "zhCN" end
_G.print = function() end
''')
lua.execute('_G.BossTipsAddon = {}')

base = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
files = ["Locales.lua", "Data.lua", "Guides/MPlus/Current.lua", "Guides/Raids/v12.1.lua"]
for f in files:
    with open(os.path.join(base, f), "r", encoding="utf-8") as fh:
        code = fh.read().replace("local _, addon = ...", "local addon = _G.BossTipsAddon")
    lua.execute(code)

# Walk in Lua, emit flat array of {cat, inst, boss, diff, lang, text}
lua.execute(r'''
function walk(cat, root, diffs)
  local out = {}
  for inst, bosses in pairs(root) do
    for boss, e in pairs(bosses) do
      local tl = e.tipsByLang
      if type(tl) == "table" then
        for _, diff in ipairs(diffs) do
          local byDiff = tl[diff]
          if type(byDiff) == "table" then
            local zhTW = byDiff.zhTW
            local enUS = byDiff.enUS
            if zhTW and zhTW ~= "" then out[#out+1] = {cat=cat, inst=tostring(inst), boss=tostring(boss), diff=diff, lang="zhTW", text=zhTW} end
            if enUS and enUS ~= "" then out[#out+1] = {cat=cat, inst=tostring(inst), boss=tostring(boss), diff=diff, lang="enUS", text=enUS} end
          end
        end
      end
    end
  end
  return out
end
local a = _G.BossTipsAddon
local mp = walk("mplus", a.GuideData.mplus.Current, {"mythicplus"})
local rd = walk("raids", a.GuideData.raids["12.1"], {"lfr","normal","heroic","mythic"})
_G.__EXTRACT = {mplus=mp, raids=rd}
''')

ext = lua.globals()['_G']['__EXTRACT']
out = {"mplus": {}, "raids": {}}
for cat in ("mplus", "raids"):
    arr = ext[cat]
    for i in range(1, len(arr) + 1):
        row = arr[i]
        c = row['cat']; inst = row['inst']; boss = row['boss']
        diff = row['diff']; lang = row['lang']; text = row['text']
        out.setdefault(c, {}).setdefault(inst, {}).setdefault(boss, {}).setdefault(diff, {})[lang] = text

with open(os.path.join(base, "_extract_guides.json"), "w", encoding="utf-8") as fh:
    json.dump(out, fh, ensure_ascii=False, indent=1)

shutil.copy(os.path.join(base, "Locales.lua"), os.path.join(base, "_keep_Locales.lua"))

cnt_mp = sum(len(v) for v in out["mplus"].values())
cnt_rd = sum(len(v) for v in out["raids"].values())
print(f"M+ instances={len(out['mplus'])} bosses={cnt_mp}")
print(f"Raid instances={len(out['raids'])} bosses={cnt_rd}")
print("Saved _extract_guides.json and _keep_Locales.lua")
