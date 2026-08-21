# -*- coding: utf-8 -*-
"""Verify two fixes against REAL BossTips code:
  A) GetGuideText now returns the localized MOB body (was falling back to Chinese
     because live M+ files store MOBs under `mythicplus`, not `tips`).
  B) _regen_trans_perdiff.convert_name harvests English/Traditional names from the
     existing {rtN}NAME{rtN} header, so M+ regen won't fall back to Chinese.
"""
import os, re
from lupa import LuaRuntime

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"

lua = LuaRuntime(unpack_returned_tuples=True, encoding="utf-8")
BD = lua.table(); BD["lang"] = "enUS"
lua.globals().BossTipsGlobalDB = BD
lua.globals().GetLocale = lambda: "enUS"
addon = lua.table()
lua.globals()._shared_addon = addon

for rel in ["Locales.lua", "Data.lua",
            "Guides/MPlus/Current.lua",
            "Guides/MPlus/Current_enUS.lua",
            "Guides/MPlus/Current_zhTW.lua"]:
    with open(os.path.join(ADDON, rel), encoding="utf-8") as f:
        code = f.read()
    chunk = lua.eval("function(...) " + code + " end")
    chunk(0, addon)

def g(t, k):
    try: return t[k]
    except Exception: return None

_CJK = re.compile(r"[\u3400-\u9fff\uf900-\ufaff]")
def looks_cjk(s): return bool(s) and bool(_CJK.search(str(s)))

def harvest_name(txt):
    if not txt: return None
    m = re.match(r"^\{rt\d+\}(.+?)\{rt\d+\}", str(txt).lstrip())
    return m.group(1) if m else None

print("================ TEST A: GetGuideText MOB body ================")
def mk_entry(btype, ver, inst, boss):
    e = lua.table(); e["type"] = btype
    s = lua.table(); s["type"] = "mplus"; s["ver"] = ver; s["instance"] = inst; s["boss"] = boss
    e["_src"] = s
    return e

# MOB in 塞塔里斯神庙
for locale in ("enUS", "zhTW"):
    addon.LOCALE = locale
    body = addon.GetGuideText(mk_entry("MOB", "Current", "塞塔里斯神庙", "剧毒蝰蛇"), "mythicplus")
    snippet = (body[:60] if body else "")
    print(f"[{locale}] MOB body starts: {snippet!r}")
    print(f"         CJK present: {looks_cjk(body)}  | contains latin 'Venom'/'毒': {'Venom' in (body or '') or '毒' in (body or '')}")
# BOSS control
addon.LOCALE = "enUS"
bbody = addon.GetGuideText(mk_entry("BOSS", "Current", "虚空之痕竞技场", "煞戎努斯"), "mythicplus")
print(f"[enUS] BOSS body CJK present: {looks_cjk(bbody)} | 'Charonus' in header: {'Charonus' in (bbody or '')}")

print("\n================ TEST B: convert_name harvest for M+ ================")
src = g(g(addon.GuideData, "mplus"), "Current")
enUS_inst = g(g(g(addon.GuideData.translations, "enUS"), "mplus"), "Current")
zhTW_inst = g(g(addon.GuideData.translations, "zhTW"), "mplus"), 
zhTW_inst = zhTW_inst[0] if isinstance(zhTW_inst, tuple) else zhTW_inst

bad_en, bad_zh = [], []
total = 0
for inst_key in sorted(src.keys()):
    s_inst = src[inst_key]
    e_en = g(enUS_inst, inst_key) or {}
    e_zh = g(zhTW_inst, inst_key) or {}
    for boss_key in sorted(s_inst.keys()):
        total += 1
        # replicate convert_name enUS logic (harvest from header)
        eb_en = g(e_en, boss_key)
        nm_en = (g(eb_en, "name") if eb_en else None)
        if not nm_en:
            h = harvest_name(g(eb_en, "mythicplus")) or harvest_name(g(eb_en, "tips"))
            nm_en = h if (h and not looks_cjk(h)) else boss_key
        # zhTW (harvest header; else s2t fallback not available here -> just header)
        eb_zh = g(e_zh, boss_key)
        nm_zh = (g(eb_zh, "name") if eb_zh else None)
        if not nm_zh:
            nm_zh = harvest_name(g(eb_zh, "mythicplus")) or harvest_name(g(eb_zh, "tips")) or None
        if looks_cjk(nm_en) or nm_en == boss_key:
            bad_en.append((inst_key, boss_key, nm_en))
        if not nm_zh:
            bad_zh.append((inst_key, boss_key))
print(f"Total M+ boss/mob entries checked: {total}")
print(f"enUS names that fell back to Chinese key: {len(bad_en)}")
for b in bad_en[:20]: print("   BAD enUS:", b)
print(f"zhTW names with no header to harvest: {len(bad_zh)}")
for b in bad_zh[:20]: print("   BAD zhTW:", b)

print("\n================ TEST C: M+ instance name (known gap) ================")
for locale in ("enUS", "zhTW"):
    addon.LOCALE = locale
    print(f"[{locale}] instance 虚空之痕竞技场 ->", addon.GetLocalizedInstanceName("虚空之痕竞技场", "mplus", "Current"))
print("\nDONE.")
