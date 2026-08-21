# -*- coding: utf-8 -*-
"""
Rebuild raid (12.1) + M+ (Current) translation files PER-DIFFICULTY from source.

- zhTW: opencc(s2t) each source difficulty text  -> distinct, correct Traditional Chinese.
- enUS: each source difficulty text translated    -> distinct English (EN dict provided).

Both files get every difficulty key filled (raids: lfr/normal/heroic/mythic + mythicplus=mythic;
M+: lfr/normal/heroic/mythic/mythicplus as present in source). MOB keeps single tips
(zhTW: opencc source; enUS: harvested from existing enUS file, else opencc source).

Boss `name` fields are harvested from the EXISTING translation files to preserve canonical
English / Traditional names; missing ones fall back to opencc(Chinese key).
"""
import lupa, json, os, re
from opencc import OpenCC

# CJK detection: used to refuse a CJK string where we expect an English name.
_CJK_RANGE = re.compile(r"[\u3400-\u9fff\uf900-\ufaff]")
def _looks_cjk(s):
    return bool(s) and bool(_CJK_RANGE.search(str(s)))

def harvest_name_from_text(txt):
    """Extract the localised name from a guide's {rtN}NAME{rtN} header.
    The existing translation files keep the canonical localised name in that
    header (English in the enUS file, Traditional Chinese in the zhTW file)."""
    if not txt:
        return None
    m = re.match(r"^\{rt\d+\}(.+?)\{rt\d+\}", str(txt).lstrip())
    return m.group(1) if m else None

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
cc = OpenCC('s2t')
DIFFS_RAID = ["lfr", "normal", "heroic", "mythic"]
DIFFS_MP = ["lfr", "normal", "heroic", "mythic", "mythicplus"]

def g(t, k):
    try:
        return t[k]
    except Exception:
        return None

# Canonical English names for 12.1 raid (instance + boss) — preserves prior translations.
EN_NAMES = {
    "潮缚石窟": "Tidebound Grotto",
    "烈毒之渊": "The Venomous Abyss",
    "尼姆瑞莎·唤波者": "Nimrissa the Wavecaller",
    "万毒邪祟者瓦什尼克": "Vashnik the Malignant",
    "乌拉特克": "Urathek",
    "双子毒牙": "The Twin Fangs",
    "斯索拉克": "Sszorak",
    "盘卷祭坛": "The Coiled Altar",
    "盘魂者内克扎莉": "Nek'zali the Soulcoiler",
    "迷失的探险者": "The Lost Explorers",
    "陵寝哨兵": "The Entombed Sentinels",
}

def load_module(rel, var="BossTipsAddon"):
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("%s={}" % var)
    code = open(os.path.join(BASE, rel), encoding="utf-8").read().replace(
        "local _, addon = ...", "local addon = %s" % var)
    lua.execute(code)
    return lua.globals()[var]

def load_source_trans(lang, cat, ver):
    """Load existing translation file, return its translations[lang][cat][ver] table (or {})."""
    rel = "Guides/%s/%s_%s.lua" % (
        "Raids" if cat == "raids" else "MPlus",
        ver if cat == "raids" else "Current", lang)
    p = os.path.join(BASE, rel)
    if not os.path.exists(p):
        return {}
    lua = lupa.LuaRuntime(unpack_returned_tuples=True)
    lua.execute("BT={}")
    code = open(p, encoding="utf-8").read().replace("local _, addon = ...", "local addon = BT")
    try:
        lua.execute(code)
    except Exception:
        # broken existing file (e.g. stale syntax error) — fall back to opencc harvest
        return {}
    try:
        return g(g(g(g(lua.globals()["BT"]["GuideData"], "translations"), lang), cat), ver) or {}
    except Exception:
        return {}

def esc_long(s):
    s = s if isinstance(s, str) else str(s)
    level = 0
    while True:
        close = ']' + ('=' * level) + ']'
        # bump level if the close delimiter appears in the content, OR if the
        # content ends with ']' (level 0 close ']]' would collide at the boundary
        # and truncate the string, leaving a stray ']').
        if (close not in s) and not (level == 0 and s.endswith(']')):
            break
        level += 1
    return '[' + ('=' * level) + '[' + s + ']' + ('=' * level) + ']'

def qstr(s):
    s = s if isinstance(s, str) else str(s)
    return '"%s"' % s.replace("\\", "\\\\").replace('"', '\\"')

def esc_key(k):
    k = k.replace("\\", "\\\\").replace('"', '\\"')
    return '["%s"]' % k

def convert_name(existing_inst, boss_key, zh_key, lang):
    # enUS: prefer explicit canonical name map; then the existing translation
    #       file's `name` field; then harvest the canonical name from the
    #       existing {rtN}NAME{rtN} header (English in the enUS file). Only if
    #       nothing is found fall back to the Chinese key (must NOT silently
    #       emit CJK for an English locale).
    if lang == "enUS":
        nm = EN_NAMES.get(boss_key) or EN_NAMES.get(zh_key)
        if nm:
            return nm
        if existing_inst:
            eb = g(existing_inst, boss_key)
            if eb:
                if g(eb, "name"):
                    return g(eb, "name")
                h = harvest_name_from_text(g(eb, "mythicplus")) or harvest_name_from_text(g(eb, "tips"))
                if h and not _looks_cjk(h):
                    return h
        return zh_key
    # zhTW: prefer existing `name`, then harvest the Traditional name from the
    #       {rtN}NAME{rtN} header (preserves canonical Traditional spelling),
    #       else mechanical s2t of the Chinese key.
    if existing_inst:
        eb = g(existing_inst, boss_key)
        if eb:
            if g(eb, "name"):
                return g(eb, "name")
            h = harvest_name_from_text(g(eb, "mythicplus")) or harvest_name_from_text(g(eb, "tips"))
            if h:
                return h
    return cc.convert(zh_key)

def rebuild(scope, lang, EN):
    """
    scope: 'raid' or 'mplus'
    EN: dict inst/boss -> {diff: en_text}  (only used for lang enUS)
    """
    if scope == "raid":
        src = g(g(load_module("Guides/Raids/v12.1.lua")["GuideData"], "raids"), "12.1")
        cat, ver, DIFFS = "raids", "12.1", DIFFS_RAID
        out_rel = "Guides/Raids/v12.1_%s.lua" % lang
        header = "-- BossTips 12.1 团本攻略翻译 —— %s（按源每难度分别翻译/转换；四难度 + mythicplus=mythic）" % lang
    else:
        src = g(g(load_module("Guides/MPlus/Current.lua")["GuideData"], "mplus"), "Current")
        cat, ver, DIFFS = "mplus", "Current", DIFFS_MP
        out_rel = "Guides/MPlus/Current_%s.lua" % lang
        header = "-- BossTips M+ 攻略翻译 —— %s（按源每难度分别翻译/转换；五难度）" % lang
    existing = load_source_trans(lang, cat, ver)
    insts = {}
    for inst_key in sorted(src.keys()):
        s_inst = src[inst_key]
        if not hasattr(s_inst, "items"):
            continue
        e_inst = g(existing, inst_key) or {}
        if lang == "enUS":
            inst_name = EN_NAMES.get(inst_key) or g(e_inst, "name") or inst_key
        else:
            inst_name = g(e_inst, "name") or cc.convert(inst_key)
        blocks = []
        for boss_key in sorted(s_inst.keys()):
            e = g(s_inst, boss_key)
            if not hasattr(e, "items"):
                continue
            t = g(e, "type") or "BOSS"
            name = convert_name(e_inst, boss_key, boss_key, lang)
            if t == "MOB":
                zh_tip = cc.convert(g(e, "tips") or "")
                en_tip = None
                eb = g(e_inst, boss_key)
                # 旧格式译文 MOB 仅存 mythicplus 单档（英文），新格式存外层 tips；
                # 两种都要尝试，避免英文 MOB 译文被 opencc(zhCN) 覆盖丢失。
                if eb:
                    en_tip = g(eb, "tips") or g(eb, "mythicplus")
                if en_tip is None:
                    en_tip = zh_tip
                if lang == "zhTW":
                    tip = zh_tip
                else:
                    tip = en_tip
                blocks.append(
                    "        %s = {\n            type = \"MOB\",\n            name = %s,\n            tips = %s,\n        }," % (
                        esc_key(boss_key), qstr(name), esc_long(tip)))
            else:
                td = g(e, "tipsByDifficulty") or {}
                diff_texts = {}
                for d in DIFFS:
                    diff_texts[d] = g(td, d) or ""
                if lang == "zhTW":
                    out = {d: cc.convert(diff_texts[d]) for d in DIFFS}
                    # raid has no source mythicplus -> mirror mythic for display
                    if scope == "raid":
                        out["mythicplus"] = out["mythic"]
                else:
                    en_boss = EN.get(inst_key, {}).get(boss_key)
                    if en_boss:
                        # distinct per-difficulty English provided
                        out = {d: (en_boss.get(d) or "") for d in DIFFS}
                    else:
                        # fallback: harvest existing translation file. Supports both
                        # new layout (tipsByDifficulty) and old layout (single
                        # combined mythicplus/tips text). Reusing the existing
                        # English text avoids emitting CJK for known gaps (e.g. the
                        # 3 red-jade bosses missing from the EN dict).
                        eb = g(e_inst, boss_key)
                        etd = g(eb, "tipsByDifficulty") if eb else None
                        if etd:
                            out = {d: (g(etd, d) or "") for d in DIFFS}
                        elif eb:
                            single = g(eb, "mythicplus") or g(eb, "tips")
                            if single:
                                out = {d: single for d in DIFFS}
                            else:
                                out = {d: cc.convert(diff_texts[d]) for d in DIFFS}
                        else:
                            out = {d: cc.convert(diff_texts[d]) for d in DIFFS}
                    if scope == "raid":
                        out["mythicplus"] = out["mythic"]
                    else:
                        # M+ source mythicplus is the combined text; use it directly
                        out["mythicplus"] = out.get("mythicplus") or out["mythic"]
                inner = "\n".join("                %s = %s," % (esc_key(d), esc_long(out[d])) for d in DIFFS_MP if d in out)
                blocks.append(
                    "        %s = {\n            type = \"BOSS\",\n            name = %s,\n            tipsByDifficulty = {\n%s\n            },\n        }," % (
                        esc_key(boss_key), qstr(name), inner))
        insts[inst_key] = (inst_name, blocks)
    # assemble
    lines = [
        "-- ============================================================================",
        header,
        "-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。",
        "-- ============================================================================",
        "local _, addon = ...",
        "addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }",
        "addon.GuideData.translations = addon.GuideData.translations or {}",
        "addon.GuideData.translations.%s = addon.GuideData.translations.%s or {}" % (lang, lang),
        "addon.GuideData.translations.%s.%s = addon.GuideData.translations.%s.%s or {}" % (lang, cat, lang, cat),
        "addon.GuideData.translations.%s.%s[\"%s\"] = {" % (lang, cat, ver),
    ]
    for inst_key in sorted(insts.keys()):
        inst_name, blocks = insts[inst_key]
        lines.append("    %s = {" % esc_key(inst_key))
        lines.append("        name = %s," % qstr(inst_name))
        lines.extend(blocks)
        lines.append("    },")
    lines.append("}")
    with open(os.path.join(BASE, out_rel), "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    n = sum(len(b) for _, b in insts.values())
    print("[%s/%s] rebuilt %s -> %d bosses/MOBs" % (scope, lang, out_rel, n))

if __name__ == "__main__":
    EN_RAID = json.load(open(os.path.join(BASE, "tools/data/_en_raid121.json"), encoding="utf-8"))
    # 12.1 raid
    rebuild("raid", "enUS", EN_RAID)
    rebuild("raid", "zhTW", EN_RAID)
    # M+ : merge all _en_mp_*.json part files
    import glob
    EN_MP = {}
    for pf in sorted(glob.glob(os.path.join(BASE, "tools/data/_en_mp_*.json"))):
        part = json.load(open(pf, encoding="utf-8"))
        for inst, bosses in part.items():
            EN_MP.setdefault(inst, {}).update(bosses)
    if EN_MP:
        rebuild("mplus", "enUS", EN_MP)
        print("M+ enUS merged from %d part files" % len(glob.glob(os.path.join(BASE, "tools/data/_en_mp_*.json"))))
    # M+ zhTW is opencc-based, no EN dict needed
    rebuild("mplus", "zhTW", {})

