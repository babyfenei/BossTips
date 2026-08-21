# -*- coding: utf-8 -*-
"""专项核验：M+ 译文文件是否覆盖全部五难度 + 简中/英语泄漏检测"""
import os, re
from lupa import LuaRuntime

ADDON = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"
SRC = os.path.join(ADDON, "Guides/MPlus/Current.lua")
ZH = os.path.join(ADDON, "Guides/MPlus/Current_zhTW.lua")
EN = os.path.join(ADDON, "Guides/MPlus/Current_enUS.lua")
DIFFS = ["lfr", "normal", "heroic", "mythic", "mythicplus"]

lua = LuaRuntime(unpack_returned_tuples=True)
lua.execute("__BTAddon = {}")
lua.execute("__BTAddon.L = setmetatable({}, { __index = function(t,k) return k end })")

def fix_first_line(src):
    return re.sub(r'= \.\.\.', '= "BossTips", _G.__BTAddon', src, count=1)

def load_into(path):
    src = fix_first_line(open(path, encoding="utf-8").read())
    lua.execute(src, name=path)

load_into(SRC)
load_into(ZH)
load_into(EN)

def has_key(t, k):
    try:
        return k in t
    except Exception:
        return False

a = lua.eval("_G.__BTAddon")
src_mplus = a["GuideData"]["mplus"]["Current"]
zh_mplus = a["GuideData"]["translations"]["zhTW"]["mplus"]["Current"]
en_mplus = a["GuideData"]["translations"]["enUS"]["mplus"]["Current"]

# 简中常用但繁中通常不同的字（出现其一即疑似简中残留）
SIMPLIFIED_MARKERS = set("国关东车电时间题体来热几刘杨")
CJK = re.compile(r'[\u4e00-\u9fff\u3400-\u4dbf]')

total_boss = 0
total_mob = 0
issues = []
zh_simp_leak = 0
en_cjk_leak = 0

for inst in src_mplus.keys():
    s_inst = src_mplus[inst]
    z_inst = zh_mplus[inst] if has_key(zh_mplus, inst) else None
    e_inst = en_mplus[inst] if has_key(en_mplus, inst) else None
    for boss in s_inst.keys():
        s_entry = s_inst[boss]
        etype = s_entry["type"] if has_key(s_entry, "type") else "BOSS"
        z_entry = z_inst[boss] if (z_inst and has_key(z_inst, boss)) else None
        e_entry = e_inst[boss] if (e_inst and has_key(e_inst, boss)) else None
        if etype == "MOB":
            total_mob += 1
            for label, entry in (("zhTW", z_entry), ("enUS", e_entry)):
                if entry is None or not has_key(entry, "tips") or not entry["tips"]:
                    issues.append(f"[MISSING] {inst}/{boss} ({label}) MOB tips 缺失")
                else:
                    txt = entry["tips"]
                    if label == "zhTW" and any(c in SIMPLIFIED_MARKERS for c in txt):
                        zh_simp_leak += 1
                    if label == "enUS" and CJK.search(txt):
                        en_cjk_leak += 1
        else:
            total_boss += 1
            for label, entry in (("zhTW", z_entry), ("enUS", e_entry)):
                if entry is None:
                    issues.append(f"[MISSING] {inst}/{boss} ({label}) BOSS 整条缺失")
                    continue
                tb = entry["tipsByDifficulty"] if has_key(entry, "tipsByDifficulty") else None
                for d in DIFFS:
                    txt = None
                    if tb is not None and has_key(tb, d):
                        txt = tb[d]
                    elif has_key(entry, d):
                        txt = entry[d]
                    if not txt:
                        issues.append(f"[EMPTY] {inst}/{boss} ({label}) 难度 {d} 译文为空")
                    else:
                        if label == "zhTW" and any(c in SIMPLIFIED_MARKERS for c in txt):
                            zh_simp_leak += 1
                        if label == "enUS" and CJK.search(txt):
                            en_cjk_leak += 1

print(f"源 M+ 统计：BOSS={total_boss}, MOB={total_mob}")
print(f"翻译完整性问题数：{len(issues)}")
for i in issues[:50]:
    print("  " + i)
if len(issues) > 50:
    print(f"  ... 另有 {len(issues)-50} 条")
print(f"繁中简中残留标记命中：{zh_simp_leak}")
print(f"英语 CJK 泄漏命中：{en_cjk_leak}")
print("RESULT:", "PASS" if (len(issues)==0 and zh_simp_leak==0 and en_cjk_leak==0) else "FAIL")
