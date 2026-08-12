# -*- coding: utf-8 -*-
"""
BossTips 团本骨架生成器
扫描本地 BigWigs 各扩展团本文件夹 + DBM 的 TWW 团本，生成：
  Guides/Raids/vXX.lua  —— 各版本团本骨架（正确 instanceId / encounterIds / 骨架 tips / 多难度框架）
说明：
  - 实例 key 用国服 CN 名（便于进本自动展开 GetInstanceInfo 匹配）。
  - 首领 key 暂时用 BigWigs/DBM 的英文/文件名（骨架阶段；第7项"国服翻译核对"会替换为权威 CN 名）。
  - encounterId 取自 BigWigs:NewBoss 第3参 / DBM SetEncounterID，准确无误，智能展开按 encId 反查 CN 仍能命中。
"""
import os, re, collections

ADDONS = r"E:\World of Warcraft\_retail_\Interface\AddOns"
OUT_DIR = r"E:\World of Warcraft\_retail_\Interface\AddOns\BossTips\Guides\Raids"

# 团本扫描定义：(扫描路径相对 AddOns, 国服实例名, 版本字符串)
RAID_DEFS = [
    # 经典旧世 1.0
    ("BigWigs_Classic/AQ20", "安其拉废墟", "1.0"),
    ("BigWigs_Classic/AQ40", "安其拉神殿", "1.0"),
    ("BigWigs_Classic/BlackwingLair", "黑翼之巢", "1.0"),
    ("BigWigs_Classic/MoltenCore", "熔火之心", "1.0"),
    ("BigWigs_Classic/Naxxramas_Classic", "纳克萨玛斯", "1.0"),
    ("BigWigs_Classic/Onyxia_Classic", "奥妮克希亚的巢穴", "1.0"),
    ("BigWigs_Classic/ZulGurub_Classic", "祖尔格拉布", "1.0"),
    # 燃烧的远征 2.0
    ("BigWigs_BurningCrusade/BlackTemple", "黑暗神殿", "2.0"),
    ("BigWigs_BurningCrusade/Hyjal", "海加尔山之战", "2.0"),
    ("BigWigs_BurningCrusade/Karazhan", "卡拉赞", "2.0"),
    ("BigWigs_BurningCrusade/Serpentshrine", "毒蛇神殿", "2.0"),
    ("BigWigs_BurningCrusade/Sunwell", "太阳之井高地", "2.0"),
    ("BigWigs_BurningCrusade/TheEye", "风暴要塞", "2.0"),
    ("BigWigs_BurningCrusade/ZulAman_Classic", "祖阿曼", "2.0"),
    # 巫妖王之怒 3.0
    ("BigWigs_WrathOfTheLichKing/Citadel", "冰冠堡垒", "3.0"),
    ("BigWigs_WrathOfTheLichKing/Coliseum", "十字军的试炼", "3.0"),
    ("BigWigs_WrathOfTheLichKing/Naxxramas", "纳克萨玛斯", "3.0"),
    ("BigWigs_WrathOfTheLichKing/RubySanctum", "红玉圣殿", "3.0"),
    ("BigWigs_WrathOfTheLichKing/Ulduar", "奥杜尔", "3.0"),
    # 大地的裂变 4.0
    ("BigWigs_Cataclysm/Bastion", "暮光堡垒", "4.0"),
    ("BigWigs_Cataclysm/Blackwing", "黑翼血环", "4.0"),
    ("BigWigs_Cataclysm/DragonSoul", "巨龙之魂", "4.0"),
    ("BigWigs_Cataclysm/Firelands", "火焰之地", "4.0"),
    ("BigWigs_Cataclysm/Throne", "风神王座", "4.0"),
    # 熊猫人之谜 5.0
    ("BigWigs_MistsOfPandaria/EndlessSpring", "永春台", "5.0"),
    ("BigWigs_MistsOfPandaria/HeartOfFear", "恐惧之心", "5.0"),
    ("BigWigs_MistsOfPandaria/Mogushan", "魔古山宝库", "5.0"),
    ("BigWigs_MistsOfPandaria/SiegeOfOrgrimmar", "决战奥格瑞玛", "5.0"),
    ("BigWigs_MistsOfPandaria/ThroneOfThunder", "雷霆王座", "5.0"),
    # 德拉诺之王 6.0
    ("BigWigs_WarlordsOfDraenor/BlackrockFoundry", "黑石铸造厂", "6.0"),
    ("BigWigs_WarlordsOfDraenor/HellfireCitadel", "地狱火堡垒", "6.0"),
    ("BigWigs_WarlordsOfDraenor/Highmaul", "悬锤堡", "6.0"),
    # 军团再临 7.0
    ("BigWigs_Legion/Antorus", "安托鲁斯，燃烧王座", "7.0"),
    ("BigWigs_Legion/Nighthold", "暗夜要塞", "7.0"),
    ("BigWigs_Legion/Nightmare", "翡翠梦魇", "7.0"),
    ("BigWigs_Legion/TombOfSargeras", "萨格拉斯之墓", "7.0"),
    ("BigWigs_Legion/TrialOfValor", "勇气试炼", "7.0"),
    # 争霸艾泽拉斯 8.0
    ("BigWigs_BattleForAzeroth/BattleOfDazaralor", "达萨罗之战", "8.0"),
    ("BigWigs_BattleForAzeroth/CrucibleOfStorms", "风暴熔炉", "8.0"),
    ("BigWigs_BattleForAzeroth/EternalPalace", "永恒王宫", "8.0"),
    ("BigWigs_BattleForAzeroth/Nyalotha", "尼奥罗萨，觉醒之城", "8.0"),
    ("BigWigs_BattleForAzeroth/Uldir", "奥迪尔", "8.0"),
    # 暗影国度 9.0
    ("BigWigs_Shadowlands/CastleNathria", "纳斯利亚堡", "9.0"),
    ("BigWigs_Shadowlands/SanctumOfDomination", "统御圣所", "9.0"),
    ("BigWigs_Shadowlands/SepulcherOfTheFirstOnes", "初诞者圣墓", "9.0"),
    # 巨龙时代 10.0
    ("BigWigs_Dragonflight/Aberrus", "亚贝鲁斯，焰影熔炉", "10.0"),
    ("BigWigs_Dragonflight/Amirdrassil", "阿梅达希尔，梦境之愿", "10.0"),
    ("BigWigs_Dragonflight/VaultOfTheIncarnates", "化身巨龙牢窟", "10.0"),
    # 午夜 12.0（奇名 BigWigs 目录，首领文件直接在目录内）
    ("BigWigs_TheVenomousAbyss", "毒渊", "12.0"),
    ("BigWigs_TheVoidspire", "虚空尖塔", "12.0"),
    ("BigWigs_TheDreamrift", "梦裂", "12.0"),
    ("BigWigs_MarchOnQuelDanas", "进军奎尔萨拉斯", "12.0"),
    # 地心之战 11.0（来自 DBM-Raids-WarWithin）
    ("DBM-Raids-WarWithin/NerubarPalace", "尼鲁巴宫殿", "11.0"),
    ("DBM-Raids-WarWithin/ManaforgeOmega", "玛纳符文熔炉", "11.0"),
    ("DBM-Raids-WarWithin/Undermine", "解放安德麦", "11.0"),
]

RE_BIGWIGS = re.compile(r'NewBoss\(\s*"([^"]+)"\s*,\s*(-?\d+)\s*,\s*(-?\d+)')
RE_BIGWIGS2 = re.compile(r'NewBoss\(\s*"([^"]+)"\s*,\s*(-?\d+)\s*\)')
RE_BW_SETENC = re.compile(r'SetEncounterID\(\s*(\d+)')
RE_DBM_SETZONE = re.compile(r'SetZone\(\s*(\d+)')
RE_DBM_ENC = re.compile(r'SetEncounterID\(\s*(\d+)')
SKIP_PATH = re.compile(r'[/\\]([Ll]ocales?|libs?|Localization|localization)[/\\]', re.I)


def scan_raid_folder(rel_path):
    """返回 (instanceId, {bossKey: encId}) 或 None"""
    root = os.path.join(ADDONS, rel_path)
    if not os.path.isdir(root):
        return None
    bosses = {}          # bossKey -> encId
    inst_ids = []        # 收集 instanceId 用于取众数
    for dirpath, dirnames, filenames in os.walk(root):
        if SKIP_PATH.search(dirpath):
            continue
        for fn in filenames:
            if not fn.lower().endswith(".lua"):
                continue
            fp = os.path.join(dirpath, fn)
            try:
                txt = open(fp, encoding="utf-8", errors="ignore").read()
            except Exception:
                continue
            # BigWigs 3参模式：NewBoss("name", iid, eid)
            bw = RE_BIGWIGS.findall(txt)
            if bw:
                for name, iid, eid in bw:
                    inst_ids.append(int(iid))
                    bosses[name] = int(eid)
                continue
            # BigWigs 旧式 2参 + SetEncounterID：NewBoss("name", iid) ... SetEncounterID(eid)
            bw2 = RE_BIGWIGS2.findall(txt)
            if bw2:
                enc = RE_BW_SETENC.search(txt)
                eid = int(enc.group(1)) if enc else None
                for name, iid in bw2:
                    inst_ids.append(int(iid))
                    if eid:
                        bosses[name] = eid
                continue
            # DBM 模式：SetZone(iid) + SetEncounterID(eid)
            sz = RE_DBM_SETZONE.search(txt)
            enc = RE_DBM_ENC.search(txt)
            if sz and enc:
                inst_ids.append(int(sz.group(1)))
                bname = os.path.splitext(fn)[0]
                bosses[bname] = int(enc.group(1))
    if not bosses:
        return None
    # 实例ID取众数
    iid = collections.Counter(inst_ids).most_common(1)[0][0] if inst_ids else None
    return iid, bosses


def esc(s):
    return s.replace("\\", "\\\\").replace('"', '\\"')


def main():
    os.makedirs(OUT_DIR, exist_ok=True)
    # version -> { cn_instance: (instanceId, {bossKey: encId}) }
    by_ver = collections.defaultdict(dict)
    skipped = []
    for rel, cn, ver in RAID_DEFS:
        res = scan_raid_folder(rel)
        if not res:
            skipped.append((rel, cn, ver))
            continue
        iid, bosses = res
        if not iid or not bosses:
            skipped.append((rel, cn, ver))
            continue
        by_ver[ver][cn] = (iid, bosses)

    written = []
    for ver in sorted(by_ver.keys(), key=lambda v: float(v)):
        instances = by_ver[ver]
        lines = []
        lines.append("-- ============================================================================")
        lines.append("-- BossTips Raid Guide Data —— 版本 %s 团本骨架（自动生成，攻略正文待补）" % ver)
        lines.append("-- 说明：实例 key 为国服名；首领 key 暂用英文/文件名（第7项国服翻译核对后替换）。" )
        lines.append("--       encounterId 取自 BigWigs/DBM，准确；智能展开按 encId 反查 CN 命中。")
        lines.append("-- ============================================================================")
        lines.append('local _, addon = ...')
        lines.append('addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }')
        lines.append('addon.GuideData.raids = addon.GuideData.raids or {}')
        lines.append('addon.GuideData.raids["%s"] = addon.GuideData.raids["%s"] or {}' % (ver, ver))
        lines.append('addon.GuideData.meta = addon.GuideData.meta or {}')
        lines.append('')
        for cn, (iid, bosses) in instances.items():
            # 按 encounterId 升序作为击杀顺序
            ordered = sorted(bosses.items(), key=lambda kv: kv[1])
            lines.append('-- ===================== %s (instanceId %d) =====================' % (cn, iid))
            lines.append('addon.GuideData.raids["%s"]["%s"] = {' % (ver, cn))
            for idx, (bkey, eid) in enumerate(ordered, 1):
                lines.append('    ["%s"] = { order = %d, type = "BOSS", tips = "", tipsByDifficulty = {} },' % (esc(bkey), idx))
            lines.append('}')
            lines.append('addon.GuideData.meta["%s"] = { isRaid = true, instanceId = %d, encounterIds = {' % (cn, iid))
            for bkey, eid in ordered:
                lines.append('    ["%s"] = %d,' % (esc(bkey), eid))
            lines.append('} }')
            lines.append('')
        out = os.path.join(OUT_DIR, "v%s.lua" % ver)
        with open(out, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")
        written.append(out)

    # 更新 .toc
    toc = os.path.join(os.path.dirname(OUT_DIR), "..", "BossTips.toc")
    toc = os.path.abspath(toc)
    tlines = open(toc, encoding="utf-8", errors="ignore").read().splitlines()
    # 找到最后一个 Guides/ 行
    last_idx = -1
    for i, l in enumerate(tlines):
        if l.strip().startswith("Guides/") and not l.strip().startswith("Guides/Raids/"):
            last_idx = i
    raid_lines = ["Guides/Raids/v%s.lua" % v for v in sorted(by_ver.keys(), key=lambda x: float(x))]
    if last_idx >= 0:
        insert_at = last_idx + 1
        # 避免重复插入
        existing = set(l.strip() for l in tlines)
        to_add = [rl for rl in raid_lines if rl not in existing]
        if to_add:
            tlines[insert_at:insert_at] = to_add
            open(toc, "w", encoding="utf-8").write("\n".join(tlines) + "\n")

    print("生成团本文件 %d 个，覆盖版本：" % len(written), sorted(by_ver.keys(), key=lambda x: float(x)))
    total_instances = sum(len(v) for v in by_ver.values())
    total_bosses = sum(len(b[1]) for v in by_ver.values() for b in v.values())
    print("  团本实例数: %d，首领条目: %d" % (total_instances, total_bosses))
    if skipped:
        print("跳过（未扫描到首领数据）:")
        for rel, cn, ver in skipped:
            print("   -", ver, cn, "(%s)" % rel)


if __name__ == "__main__":
    main()
