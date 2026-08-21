# -*- coding: utf-8 -*-
"""Validate per-difficulty translation files.

enUS: must contain ZERO CJK characters (names, BOSS difficulty tips, MOB tips).
zhTW: must be loadable Lua and contain Traditional Chinese (CJK expected).
Raid:  lfr/normal/heroic/mythic must be 4 distinct texts; mythicplus == mythic (mirror).
M+:    source has lfr == mythic (detailed); normal & heroic differ from mythic;
       mythicplus == mythic + normal + heroic combined => mythicplus != mythic.
"""
import lupa, os, re

BASE = "E:/World of Warcraft/_retail_/Interface/AddOns/BossTips"
CJK = re.compile(r'[\u4e00-\u9fff\u3400-\u4dbf\u3000-\u303f\uff00-\uffef]')

def has_cjk(s):
    return bool(CJK.search(s)) if isinstance(s, str) else False

def g(t, k):
    try:
        return t[k]
    except Exception:
        return None

def load(rel):
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BT={}")
    code = open(os.path.join(BASE, rel), encoding="utf-8").read().replace("local _, addon = ...", "local addon = BT")
    lua.execute(code)
    return lua.globals()["BT"]

def analyze(rel, lang, cat, ver, is_raid):
    mod = load(rel)
    GD = g(mod, "GuideData"); TR = g(GD, "translations")
    L = g(TR, lang); C = g(L, cat); V = g(C, ver)
    if V is None:
        print("[FAIL] %s : ver table missing" % rel); return False
    errors = []
    nboss = 0
    for inst_key in sorted(V.keys()):
        inst = g(V, inst_key)
        if not hasattr(inst, "items"):
            continue
        for bk in sorted(inst.keys()):
            if bk == "name":
                continue
            e = g(inst, bk)
            if not hasattr(e, "items"):
                continue
            nboss += 1
            t = g(e, "type") or "BOSS"
            nm = str(g(e, "name") or "")
            if lang == "enUS" and has_cjk(nm):
                errors.append("CJK name %s.%s=%r" % (inst_key, bk, nm))
            if t == "MOB":
                tip = g(e, "tips") or ""
                if lang == "enUS" and has_cjk(tip):
                    errors.append("CJK MOB tip %s.%s" % (inst_key, bk))
                if not tip.strip():
                    errors.append("EMPTY MOB tip %s.%s" % (inst_key, bk))
            else:
                td = g(e, "tipsByDifficulty") or {}
                diffs = ["lfr", "normal", "heroic", "mythic", "mythicplus"]
                txt = {d: (g(td, d) or "") for d in diffs}
                if lang == "enUS":
                    for d in diffs:
                        if has_cjk(txt[d]):
                            errors.append("CJK %s.%s[%s]" % (inst_key, bk, d))
                for d in diffs:
                    if not txt[d].strip():
                        errors.append("EMPTY %s.%s[%s]" % (inst_key, bk, d))
                if is_raid:
                    if txt["mythicplus"] != txt["mythic"]:
                        errors.append("raid mp!=mythic %s.%s" % (inst_key, bk))
                    core = [txt["lfr"], txt["normal"], txt["heroic"], txt["mythic"]]
                    if len(set(core)) != 4:
                        errors.append("raid lfr/normal/heroic/mythic not 4-distinct %s.%s" % (inst_key, bk))
                else:
                    if txt["mythicplus"] == txt["mythic"]:
                        errors.append("M+ mp==mythic (not combined) %s.%s" % (inst_key, bk))
                    if txt["normal"] == txt["mythic"] or txt["heroic"] == txt["mythic"]:
                        errors.append("M+ normal/heroic==mythic %s.%s" % (inst_key, bk))
    ok = (len(errors) == 0)
    print("[%s] %s : %d entries, %d errors" % ("OK " if ok else "FAIL", rel, nboss, len(errors)))
    for er in errors[:30]:
        print("     -", er)
    return ok

print("== 12.1 RAID ==")
r1 = analyze("Guides/Raids/v12.1_enUS.lua", "enUS", "raids", "12.1", True)
r2 = analyze("Guides/Raids/v12.1_zhTW.lua", "zhTW", "raids", "12.1", True)
print("== M+ ==")
r3 = analyze("Guides/MPlus/Current_enUS.lua", "enUS", "mplus", "Current", False)
r4 = analyze("Guides/MPlus/Current_zhTW.lua", "zhTW", "mplus", "Current", False)
print()
print("ALL PASS" if all([r1, r2, r3, r4]) else "SOME FAILED")
