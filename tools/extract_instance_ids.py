# -*- coding: utf-8 -*-
"""
BossTips 全版本副本/首领战 ID 提取器
扫描本地 BigWigs + DBM 插件，提取 instanceId / encounterId / 首领名，
生成：
  1) BigWigsIdDB.lua   —— 覆盖全版本的实例ID -> {英文首领名 = encounterId}
  2) boss_tips_ids_report.md —— 按扩展分组的可读核查报告
用法：python extract_instance_ids.py
"""
import os, re, json, pathlib

ADDONS = r"E:\World of Warcraft\_retail_\Interface\AddOns"
OUT_DIR = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips"

# 扩展版本推断
EXP_KEYWORDS = [
    ("WarWithin",          ("11.0", "地心之战")),
    ("Midnight",           ("12.0", "午夜")),
    ("Dragonflight",       ("10.0", "巨龙时代")),
    ("Shadowlands",        ("9.0",  "暗影国度")),
    ("BattleForAzeroth",   ("8.0",  "争霸艾泽拉斯")),
    ("BfA",                ("8.0",  "争霸艾泽拉斯")),
    ("Legion",             ("7.0",  "军团再临")),
    ("BrokenIsles",        ("7.0",  "军团再临")),
    ("WarlordsOfDraenor",  ("6.0",  "德拉诺之王")),
    ("WoD",                ("6.0",  "德拉诺之王")),
    ("Draenor",            ("6.0",  "德拉诺之王")),
    ("MistsOfPandaria",    ("5.0",  "熊猫人之谜")),
    ("MoP",                ("5.0",  "熊猫人之谜")),
    ("Cataclysm",          ("4.0",  "大地的裂变")),
    ("BC",                 ("4.0",  "大地的裂变")),
    ("WrathOfTheLichKing", ("3.0",  "巫妖王之怒")),
    ("WotLK",              ("3.0",  "巫妖王之怒")),
    ("BurningCrusade",     ("2.0",  "燃烧的远征")),
    ("TBC",                ("2.0",  "燃烧的远征")),
    ("Classic",            ("1.0",  "经典旧世")),
    ("Vanilla",            ("1.0",  "经典旧世")),
    ("Azeroth",            ("1.0",  "旧世界")),
    ("Outlands",           ("2.0",  "燃烧的远征")),
    ("Pandaria",           ("5.0",  "熊猫人之谜")),
    ("TimelessIsle",       ("5.0",  "熊猫人之谜")),
    ("Scenario",           ("5.0",  "熊猫人之谜")),
]
# Midnight 的若干奇名 BigWigs 目录
MIDNIGHT_FOLDERS = {
    "BigWigs_MidnightWorld", "BigWigs_TheDreamrift", "BigWigs_Sporefall",
    "BigWigs_TheVenomousAbyss", "BigWigs_TheVoidspire", "BigWigs_MarchOnQuelDanas",
}

SKIP_BIGWIGS = {"BigWigs", "BigWigs_Core", "BigWigs_Options", "BigWigs_Plugins", "BigWigs_Voice_Rurutia"}
SKIP_DBM = {"DBM-Core", "DBM-GUI", "DBM-Brawlers", "DBM-Challenges",
            "DBM-CountPack-HotS", "DBM-CountPack-HotS-Ru", "DBM-CountPack-Overwatch",
            "DBM-Delves-WarWithin", "DBM-Delves-Midnight", "DBM-LFG", "DBM-Test"}

RE_BIGWIGS = re.compile(r'NewBoss\(\s*"([^"]+)"\s*,\s*(-?\d+)\s*,\s*(-?\d+)')
RE_BIGWIGS2 = re.compile(r'NewBoss\(\s*"([^"]+)"\s*,\s*(-?\d+)\s*\)')
RE_DBM_NEWMOD = re.compile(
    r'NewMod\(\s*(\d+)\s*,\s*"([^"]*)"\s*,\s*(?:nil|\d+|"[^"]*")\s*,\s*(\d+)')
RE_DBM_SETZONE = re.compile(r'SetZone\(\s*(\d+)')
RE_DBM_ENC = re.compile(r'SetEncounterID\(\s*(\d+)')
SKIP_PATH = re.compile(r'[/\\]([Ll]ocales?|libs?|Localization|localization)[/\\]', re.I)


def exp_of(folder_name):
    if folder_name in MIDNIGHT_FOLDERS:
        return ("12.0", "午夜")
    for kw, ver in EXP_KEYWORDS:
        if kw in folder_name:
            return ver
    return ("?", "未知")


def walk_lua(root):
    for dirpath, dirnames, filenames in os.walk(root):
        if SKIP_PATH.search(dirpath):
            continue
        for fn in filenames:
            if fn.lower().endswith(".lua"):
                yield os.path.join(dirpath, fn)


def extract_bigwigs():
    """返回 {instanceId(int): {bossName: encId}} 以及 instanceId -> 元信息"""
    data = {}            # instanceId -> {boss: encId}
    meta = {}            # instanceId -> set(folderNames)
    for name in os.listdir(ADDONS):
        if not name.startswith("BigWigs") or name in SKIP_BIGWIGS:
            continue
        ver = exp_of(name)
        root = os.path.join(ADDONS, name)
        if not os.path.isdir(root):
            continue
        for fp in walk_lua(root):
            try:
                txt = open(fp, encoding="utf-8", errors="ignore").read()
            except Exception:
                continue
            inst_folder = os.path.basename(os.path.dirname(fp))
            for m in RE_BIGWIGS.finditer(txt):
                bname, iid, eid = m.group(1), int(m.group(2)), int(m.group(3))
                data.setdefault(iid, {})[bname] = eid
                meta.setdefault(iid, set()).add("%s/%s" % (name, inst_folder))
            for m in RE_BIGWIGS2.finditer(txt):
                bname, iid = m.group(1), int(m.group(2))
                # 无 encounterId 的小怪/trash，仅记录 instance 占位不写 boss
                meta.setdefault(iid, set()).add("%s/%s" % (name, inst_folder))
    return data, meta


def extract_dbm():
    """返回 {instanceId(int): {bossName: encId}}，用于补齐 BigWigs 缺失（如 TWW）"""
    data = {}
    meta = {}
    for name in os.listdir(ADDONS):
        if not name.startswith("DBM-") or name in SKIP_DBM:
            continue
        root = os.path.join(ADDONS, name)
        if not os.path.isdir(root):
            continue
        for fp in walk_lua(root):
            try:
                txt = open(fp, encoding="utf-8", errors="ignore").read()
            except Exception:
                continue
            nm = RE_DBM_NEWMOD.search(txt)
            enc = RE_DBM_ENC.search(txt)
            sz = RE_DBM_SETZONE.search(txt)
            bname = os.path.splitext(os.path.basename(fp))[0]
            # 实例ID：优先 SetZone，否则 NewMod 第4参
            iid = None
            if sz:
                iid = int(sz.group(1))
            elif nm:
                iid = int(nm.group(3))
            if iid is None:
                continue
            if enc:
                eid = int(enc.group(1))
                data.setdefault(iid, {})[bname] = eid
                meta.setdefault(iid, set()).add("%s/%s" % (name, bname))
            else:
                # 无 SetEncounterID 的 trash/通用模块，仅占位
                meta.setdefault(iid, set())
    return data, meta


def merge(bw, dbm):
    out = {}
    for iid, bosses in bw.items():
        out[iid] = dict(bosses)
    # DBM 补齐 BigWigs 缺失的实例/首领（如 TWW）
    for iid, bosses in dbm.items():
        if iid not in out:
            out[iid] = dict(bosses)
        else:
            for b, e in bosses.items():
                if e not in out[iid].values():
                    out[iid][b] = e
    return out


def gen_lua(db):
    lines = []
    lines.append("-- ============================================================================")
    lines.append("-- BossTips BigWigsIdDB.lua —— 本地 BigWigs + DBM 提取的全版本副本/首领战ID对照表")
    lines.append("-- 生成时间：2026-08-13（自动提取）")
    lines.append("-- 格式：addon.BigWigsIdDB[instanceId] = { [英文首领名] = encounterId, ... }")
    lines.append("-- 负数 instanceId 表示世界首领（对应 mapId 取反）")
    lines.append("-- ============================================================================")
    lines.append('local _, addon = ...')
    lines.append('addon.BigWigsIdDB = {')
    for iid in sorted(db.keys(), key=lambda x: (x < 0, x)):
        bosses = db[iid]
        lines.append('    [%d] = {' % iid)
        for bname, eid in sorted(bosses.items(), key=lambda kv: kv[1]):
            safe = bname.replace('\\', '\\\\').replace('"', '\\"')
            lines.append('        ["%s"] = %d,' % (safe, eid))
        lines.append('    },')
    lines.append('}')
    return "\n".join(lines) + "\n"


def gen_report(db, meta_bw, meta_dbm):
    lines = []
    lines.append("# BossTips 副本/首领战 ID 提取报告\n")
    lines.append("生成时间：2026-08-13  |  数据源：本地 BigWigs + DBM\n")
    lines.append("总计：%d 个实例，%d 个首领战条目\n" % (
        len(db), sum(len(v) for v in db.values())))
    lines.append("\n## 按扩展分布\n")
    # 按扩展分组
    groups = {}
    for iid, bosses in db.items():
        # 用 meta 推断扩展：优先 BigWigs 来源、优先已知扩展
        src = (meta_bw.get(iid) or set()) | (meta_dbm.get(iid) or set())
        preferred = [s for s in src if s.split("/")[0].startswith("BigWigs")]
        candidates = preferred + [s for s in src if s not in preferred]
        exp = "未知"
        for s in candidates:
            v = exp_of(s.split("/")[0])
            if v[0] != "?":
                exp = v[1]
                break
        groups.setdefault(exp, []).append((iid, bosses))
    for exp in sorted(groups.keys()):
        items = groups[exp]
        lines.append("\n### %s（%d 实例）\n" % (exp, len(items)))
        for iid, bosses in sorted(items, key=lambda x: (x[0] < 0, x[0])):
            lines.append("- 实例ID **%d** —— %d 个首领" % (iid, len(bosses)))
            for bname, eid in sorted(bosses.items(), key=lambda kv: kv[1]):
                lines.append("    - `%s` → encounterId %d" % (bname, eid))
    return "\n".join(lines) + "\n"


def main():
    print("== 提取 BigWigs ==")
    bw, meta_bw = extract_bigwigs()
    print("  BigWigs 实例数: %d, 首领条目: %d" % (len(bw), sum(len(v) for v in bw.values())))
    print("== 提取 DBM ==")
    dbm, meta_dbm = extract_dbm()
    print("  DBM 实例数: %d, 首领条目: %d" % (len(dbm), sum(len(v) for v in dbm.values())))
    print("== 合并 ==")
    db = merge(bw, dbm)
    print("  合并后实例数: %d, 首领条目: %d" % (len(db), sum(len(v) for v in db.values())))

    lua = gen_lua(db)
    path_lua = os.path.join(OUT_DIR, "BigWigsIdDB.lua")
    with open(path_lua, "w", encoding="utf-8") as f:
        f.write(lua)
    print("  写出 %s (%d 字节)" % (path_lua, len(lua)))

    rep = gen_report(db, meta_bw, meta_dbm)
    path_rep = os.path.join(OUT_DIR, "boss_tips_ids_report.md")
    with open(path_rep, "w", encoding="utf-8") as f:
        f.write(rep)
    print("  写出 %s (%d 字节)" % (path_rep, len(rep)))
    print("完成。")


if __name__ == "__main__":
    main()
