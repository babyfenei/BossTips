-- ============================================================================
-- BossTips Raid Guide Data —— 版本 2.0 团本攻略
-- 实例 key 为国服名；首领 key 为国服名；encounterId 取自 BigWigs/DBM（原样保留）。
-- 攻略格式：{rt8}名字{rt8}||[机制]描述||{rt1}必断/速杀：…{rt1}||坦：…治疗：…输出：…
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["2.0"] = addon.GuideData.raids["2.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 黑暗神殿 (instanceId 564) =====================
addon.GuideData.raids["2.0"]["黑暗神殿"] = {
    ["高阶督军纳因图斯"] = { order = 1, type = "BOSS", tips = [=[{rt8}高阶督军纳因图斯{rt8}||[穿刺]点名后中者需队友踩水圈解救；[旋风斩]近战受伤；击杀掉落[沃达希尔碎片]||{rt1}必断/速杀：无；[穿刺]被点名后队友用水圈救{rt1}||坦：拉住；治疗：救人；输出：转火]=], tipsByDifficulty = {} },
    ["苏普雷姆斯"] = { order = 2, type = "BOSS", tips = [=[{rt8}苏普雷姆斯{rt8}||[燃烧]追踪红圈需持续跑位；[火花]随机选目标追人||{rt1}必断/速杀：无；[燃烧]被点名远离人群{rt1}||坦：拉住；输出：躲火花]=], tipsByDifficulty = {} },
    ["阿卡玛之影"] = { order = 3, type = "BOSS", tips = [=[{rt8}阿卡玛之影{rt8}||[相位]分阶段推进，P2需保护阿卡玛不被小怪击杀；[暗影]dot||{rt1}必断/速杀：无；P2优先清威胁阿卡玛的小怪{rt1}||坦：拉住；输出：清小怪]=], tipsByDifficulty = {} },
    ["塔隆·血魔"] = { order = 4, type = "BOSS", tips = [=[{rt8}塔隆·血魔{rt8}||[灵魂]点名后死亡化为灵魂，需击碎场内[灵契之瓶]否则团灭；[烈焰]dot||{rt1}必断/速杀：无；[灵魂]被点名立刻去打碎瓶子{rt1}||坦：拉住；治疗：救灵魂；输出：救灵魂]=], tipsByDifficulty = {} },
    ["古尔图格·血沸"] = { order = 5, type = "BOSS", tips = [=[{rt8}古尔图格·血沸{rt8}||[血沸]周期性全团高伤需双坦换坦；[酸液]dot；[狂暴]计时||{rt1}必断/速杀：无；[血沸]换坦分担{rt1}||坦：双坦轮换；治疗：团刷]=], tipsByDifficulty = {} },
    ["灵魂之匣"] = { order = 6, type = "BOSS", tips = [=[{rt8}灵魂之匣{rt8}||[三阶段]愤怒/欲望/苦难轮流，每阶段需对应打断与分配；[吸蓝]法力被吸干||{rt1}必断/速杀：按阶段分配打断对应法术{rt1}||坦：拉住；输出：控蓝]=], tipsByDifficulty = {} },
    ["莎赫拉丝主母"] = { order = 7, type = "BOSS", tips = [=[{rt8}莎赫拉丝主母{rt8}||[顺劈]；[致死打击]；[心控]点名变恶魔需打断救||{rt1}必断/速杀：[心控]速打断救人{rt1}||坦：拉住；输出：救人]=], tipsByDifficulty = {} },
    ["伊利达雷议会"] = { order = 8, type = "BOSS", tips = [=[{rt8}伊利达雷议会{rt8}||[四顾问]同时作战共享血量，需分散站位逐个击破；混合火/冰/暗||{rt1}必断/速杀：无；分边集火单只{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["伊利丹·怒风"] = { order = 9, type = "BOSS", tips = [=[{rt8}伊利丹·怒风{rt8}||[剪切]点名变恶魔需队友救；[烈焰之地]放圈躲；[暗影]分身；P3[恶魔形态]全团火伤||{rt1}必断/速杀：无；[剪切]被点名远离等救援{rt1}||坦：拉住；治疗：救；输出：躲机制]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["黑暗神殿"] = { isRaid = true, instanceId = 564, encounterIds = {
    ["高阶督军纳因图斯"] = 1582,
    ["苏普雷姆斯"] = 1583,
    ["阿卡玛之影"] = 1584,
    ["塔隆·血魔"] = 1585,
    ["古尔图格·血沸"] = 1586,
    ["灵魂之匣"] = 1587,
    ["莎赫拉丝主母"] = 1588,
    ["伊利达雷议会"] = 1589,
    ["伊利丹·怒风"] = 1590,
} }

-- ===================== 海加尔山之战 (instanceId 534) =====================
addon.GuideData.raids["2.0"]["海加尔山之战"] = {
    ["雷基·冬寒"] = { order = 1, type = "BOSS", tips = [=[{rt8}雷基·冬寒{rt8}||[冰霜]高伤；[冰棺]点名冻结需队友救||{rt1}必断/速杀：无；[冰棺]被点名救{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["安纳塞隆"] = { order = 2, type = "BOSS", tips = [=[{rt8}安纳塞隆{rt8}||[睡眠]点名睡人需唤醒；[毒]dot||{rt1}必断/速杀：无；[睡眠]被点名唤醒{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["卡兹洛加"] = { order = 3, type = "BOSS", tips = [=[{rt8}卡兹洛加{rt8}||[重伤]高额普攻；[火]直伤||{rt1}必断/速杀：无{rt1}||坦：硬抗；治疗：预读]=], tipsByDifficulty = {} },
    ["阿兹加洛"] = { order = 4, type = "BOSS", tips = [=[{rt8}阿兹加洛{rt8}||[火雨]放置圈需躲；[顺劈]||{rt1}必断/速杀：无；躲火雨{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["阿克蒙德"] = { order = 5, type = "BOSS", tips = [=[{rt8}阿克蒙德{rt8}||[死亡之指]点名秒杀需立刻远离；[火]全团；[狂暴]计时||{rt1}必断/速杀：[死亡之指]被点名远离人群{rt1}||坦：拉住；输出：速杀]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["海加尔山之战"] = { isRaid = true, instanceId = 534, encounterIds = {
    ["雷基·冬寒"] = 1577,
    ["安纳塞隆"] = 1578,
    ["卡兹洛加"] = 1579,
    ["阿兹加洛"] = 1580,
    ["阿克蒙德"] = 1581,
} }

-- ===================== 卡拉赞 (instanceId 532) =====================
addon.GuideData.raids["2.0"]["卡拉赞"] = {
    ["夜之魇"] = { order = 1, type = "BOSS", tips = [=[{rt8}夜之魇{rt8}||[召唤]需在墓地读条召唤；[骨雨]全团高伤；[减益]点名需上天躲避||{rt1}必断/速杀：无；[减益]被点名上天躲{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["罗密欧与朱丽叶"] = { order = 2, type = "BOSS", tips = [=[{rt8}罗密欧与朱丽叶{rt8}||[双人]共享血量需同时集火；[心控]点名||{rt1}必断/速杀：无；同时压两目标{rt1}||坦：分坦]=], tipsByDifficulty = {} },
    ["大灰狼"] = { order = 3, type = "BOSS", tips = [=[{rt8}大灰狼{rt8}||[小红帽]点名追人需绕柱风筝；[吞噬]秒杀被追者||{rt1}必断/速杀：无；[小红帽]被点名绕柱跑{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["老巫婆"] = { order = 4, type = "BOSS", tips = [=[{rt8}老巫婆{rt8}||[月/星]阶段切换需对应站位；[火/冰]混合||{rt1}必断/速杀：无；按阶段换站位{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["仆役宿舍"] = { order = 5, type = "BOSS", tips = [=[{rt8}仆役宿舍{rt8}||[多波小怪]连续刷新需控场；[恐惧]点名||{rt1}必断/速杀：控/断恐惧；分波清小怪{rt1}||坦：群拉；输出：控小怪]=], tipsByDifficulty = {} },
    ["猎手阿图门"] = { order = 6, type = "BOSS", tips = [=[{rt8}猎手阿图门{rt8}||[马与猎手]分离阶段，需分别拉开击杀；[冲锋]||{rt1}必断/速杀：无；把马和猎手拉开分别打{rt1}||坦：拉马]=], tipsByDifficulty = {} },
    ["莫罗斯"] = { order = 7, type = "BOSS", tips = [=[{rt8}莫罗斯{rt8}||[召唤随从]周期召唤需控；[致盲]当前坦||{rt1}必断/速杀：控/杀随从{rt1}||坦：双坦；输出：控小怪]=], tipsByDifficulty = {} },
    ["贞节圣女"] = { order = 8, type = "BOSS", tips = [=[{rt8}贞节圣女{rt8}||[神圣]治疗读条反伤；[忏悔]点名定身||{rt1}必断/速杀：无；[忏悔]被点名远离{rt1}||坦：拉住；治疗：禁读条]=], tipsByDifficulty = {} },
    ["馆长"] = { order = 9, type = "BOSS", tips = [=[{rt8}馆长{rt8}||[蓝球]能量球需打掉回蓝；[电弧]全团；[狂暴]能量满||{rt1}必断/速杀：无；[蓝球]打掉防狂暴{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["埃兰之影"] = { order = 10, type = "BOSS", tips = [=[{rt8}埃兰之影{rt8}||[三法术]火/冰/奥轮流读条需对应打断；[闪现]换位||{rt1}必断/速杀：[法术]必须打断{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["特雷斯坦·邪蹄"] = { order = 11, type = "BOSS", tips = [=[{rt8}特雷斯坦·邪蹄{rt8}||[心控]点名变恶魔需打断救；[火]||{rt1}必断/速杀：[心控]速打断救人{rt1}||坦：拉住；输出：救人]=], tipsByDifficulty = {} },
    ["虚空幽龙"] = { order = 12, type = "BOSS", tips = [=[{rt8}虚空幽龙{rt8}||[颜色]红/蓝/绿/青铜，需对应站位吃增益；[点名]||{rt1}必断/速杀：无；按颜色站位{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["玛克扎尔王子"] = { order = 13, type = "BOSS", tips = [=[{rt8}玛克扎尔王子{rt8}||[镜像]分身需集火真身；[火]；[橙杖]阶段||{rt1}必断/速杀：无；集火真身{rt1}||坦：拉住]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["卡拉赞"] = { isRaid = true, instanceId = 532, encounterIds = {
    ["夜之魇"] = -662,
    ["罗密欧与朱丽叶"] = -655,
    ["大灰狼"] = -655,
    ["老巫婆"] = -655,
    ["仆役宿舍"] = 1552,
    ["猎手阿图门"] = 1553,
    ["莫罗斯"] = 1554,
    ["贞节圣女"] = 1555,
    ["馆长"] = 1557,
    ["埃兰之影"] = 1559,
    ["特雷斯坦·邪蹄"] = 1560,
    ["虚空幽龙"] = 1561,
    ["玛克扎尔王子"] = 1563,
} }

-- ===================== 毒蛇神殿 (instanceId 548) =====================
addon.GuideData.raids["2.0"]["毒蛇神殿"] = {
    ["不稳定的海度斯"] = { order = 1, type = "BOSS", tips = [=[{rt8}不稳定的海度斯{rt8}||[自然/冰霜]双形态切换需对应抗；[毒]dot||{rt1}必断/速杀：无；按形态换抗{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["鱼斯拉"] = { order = 2, type = "BOSS", tips = [=[{rt8}鱼斯拉{rt8}||[喷吐]旋转扫射需躲侧；[潜艇]阶段需击沉潜艇||{rt1}必断/速杀：无；躲喷吐打潜艇{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["盲眼者莱欧瑟拉斯"] = { order = 3, type = "BOSS", tips = [=[{rt8}盲眼者莱欧瑟拉斯{rt8}||[双心]共享血量需同时压；[旋风斩]||{rt1}必断/速杀：无；同时集火两心{rt1}||坦：双坦]=], tipsByDifficulty = {} },
    ["深水领主卡拉瑟雷斯"] = { order = 4, type = "BOSS", tips = [=[{rt8}深水领主卡拉瑟雷斯{rt8}||[四顾问]水/火/土/空气分边集火；[复活]||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦]=], tipsByDifficulty = {} },
    ["莫洛格里·踏潮者"] = { order = 5, type = "BOSS", tips = [=[{rt8}莫洛格里·踏潮者{rt8}||[水墓]点名圈高伤需散开；[治疗]add需控||{rt1}必断/速杀：无；[水墓]被点名分散{rt1}||坦：拉住；输出：控add]=], tipsByDifficulty = {} },
    ["瓦丝琪"] = { order = 6, type = "BOSS", tips = [=[{rt8}瓦丝琪{rt8}||[三相]P1小怪/P2[毒]需解毒/P3[电击]躲；[元素]需打||{rt1}必断/速杀：无；P2解毒P3躲电击{rt1}||坦：拉住；治疗：解毒]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["毒蛇神殿"] = { isRaid = true, instanceId = 548, encounterIds = {
    ["不稳定的海度斯"] = 1567,
    ["鱼斯拉"] = 1568,
    ["盲眼者莱欧瑟拉斯"] = 1569,
    ["深水领主卡拉瑟雷斯"] = 1570,
    ["莫洛格里·踏潮者"] = 1571,
    ["瓦丝琪"] = 1572,
} }

-- ===================== 太阳之井高地 (instanceId 580) =====================
addon.GuideData.raids["2.0"]["太阳之井高地"] = {
    ["卡雷苟斯"] = { order = 1, type = "BOSS", tips = [=[{rt8}卡雷苟斯{rt8}||[蓝龙/恶魔]双空间，需进传送门打恶魔；[点名]||{rt1}必断/速杀：无；进传送门集火恶魔{rt1}||坦：拉龙]=], tipsByDifficulty = {} },
    ["布鲁塔卢斯"] = { order = 2, type = "BOSS", tips = [=[{rt8}布鲁塔卢斯{rt8}||[燃烧]dot高伤；[击飞]；[狂暴]计时||{rt1}必断/速杀：无；[燃烧]被点名远离{rt1}||坦：硬抗；治疗：团刷]=], tipsByDifficulty = {} },
    ["菲米丝"] = { order = 3, type = "BOSS", tips = [=[{rt8}菲米丝{rt8}||[毒气]全团需躲云；[气体]新星；[俯冲]||{rt1}必断/速杀：无；躲毒云{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["艾瑞达双子"] = { order = 4, type = "BOSS", tips = [=[{rt8}艾瑞达双子{rt8}||[火/暗]双子共享血量需同色站位；[光环]||{rt1}必断/速杀：无；同色站位集火{rt1}||坦：分坦]=], tipsByDifficulty = {} },
    ["穆鲁"] = { order = 5, type = "BOSS", tips = [=[{rt8}穆鲁{rt8}||[虚空]阶段召唤小怪需清；[暗]；P2[熵]本体||{rt1}必断/速杀：无；清虚空小怪{rt1}||坦：拉住；输出：清小怪]=], tipsByDifficulty = {} },
    ["基尔加丹"] = { order = 6, type = "BOSS", tips = [=[{rt8}基尔加丹{rt8}||[镜像]分身；[火焰]全团；[手]点名秒杀；P5[暗]||{rt1}必断/速杀：无；躲[手]打镜像{rt1}||坦：拉住；输出：躲机制]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["太阳之井高地"] = { isRaid = true, instanceId = 580, encounterIds = {
    ["卡雷苟斯"] = 1591,
    ["布鲁塔卢斯"] = 1592,
    ["菲米丝"] = 1593,
    ["艾瑞达双子"] = 1594,
    ["穆鲁"] = 1595,
    ["基尔加丹"] = 1596,
} }

-- ===================== 风暴要塞 (instanceId 550) =====================
addon.GuideData.raids["2.0"]["风暴要塞"] = {
    ["奥"] = { order = 1, type = "BOSS", tips = [=[{rt8}奥{rt8}||[四顾问]奥/火/冰/暗分边集火共享血量；[复活]||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦]=], tipsByDifficulty = {} },
    ["空灵机甲"] = { order = 2, type = "BOSS", tips = [=[{rt8}空灵机甲{rt8}||[炸弹]点名放圈；[充能]高伤；[飞行]阶段||{rt1}必断/速杀：无；[炸弹]被点名放圈{rt1}||坦：拉住]=], tipsByDifficulty = {} },
    ["大星术师索兰莉安"] = { order = 3, type = "BOSS", tips = [=[{rt8}大星术师索兰莉安{rt8}||[法术]火/冰/奥需打断；[召唤]小怪||{rt1}必断/速杀：[法术]打断{rt1}||坦：拉住；输出：清小怪]=], tipsByDifficulty = {} },
    ["凯尔萨斯·逐日者"] = { order = 4, type = "BOSS", tips = [=[{rt8}凯尔萨斯·逐日者{rt8}||[顾问]多波；[武器]需拾取对应武器破盾；[火]||{rt1}必断/速杀：无；拾武器破盾集火{rt1}||坦：拉住]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["风暴要塞"] = { isRaid = true, instanceId = 550, encounterIds = {
    ["奥"] = 1573,
    ["空灵机甲"] = 1574,
    ["大星术师索兰莉安"] = 1575,
    ["凯尔萨斯·逐日者"] = 1576,
} }

-- ===================== 祖阿曼 (instanceId 568) =====================
addon.GuideData.raids["2.0"]["祖阿曼"] = {
    ["埃基尔松"] = { order = 1, type = "BOSS", tips = [=[{rt8}埃基尔松{rt8}||[闪电]点名；[鸟]阶段俯冲||{rt1}必断/速杀：无；躲闪电{rt1}||坦：拉]=], tipsByDifficulty = {} },
    ["纳洛拉克"] = { order = 2, type = "BOSS", tips = [=[{rt8}纳洛拉克{rt8}||[熊/鹰]双形态切换；[冲撞]||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉]=], tipsByDifficulty = {} },
    ["加亚莱"] = { order = 3, type = "BOSS", tips = [=[{rt8}加亚莱{rt8}||[龙]火伤；[蛋]需打掉防孵化||{rt1}必断/速杀：无；打蛋{rt1}||坦：拉]=], tipsByDifficulty = {} },
    ["哈尔拉兹"] = { order = 4, type = "BOSS", tips = [=[{rt8}哈尔拉兹{rt8}||[虎]冲撞；[召唤]小怪||{rt1}必断/速杀：无{rt1}||坦：拉]=], tipsByDifficulty = {} },
    ["妖术领主玛拉卡斯"] = { order = 5, type = "BOSS", tips = [=[{rt8}妖术领主玛拉卡斯{rt8}||[妖术]变动物点名；[治疗]add||{rt1}必断/速杀：[妖术]速救{rt1}||坦：拉；输出：救人]=], tipsByDifficulty = {} },
    ["祖尔金"] = { order = 6, type = "BOSS", tips = [=[{rt8}祖尔金{rt8}||[熊/鹰/龙/山猫]四形态轮流各机制；[狂暴]计时||{rt1}必断/速杀：无；按形态应对{rt1}||坦：拉]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["祖阿曼"] = { isRaid = true, instanceId = 568, encounterIds = {
    ["埃基尔松"] = 186,
    ["纳洛拉克"] = 187,
    ["加亚莱"] = 188,
    ["哈尔拉兹"] = 189,
    ["妖术领主玛拉卡斯"] = 190,
    ["祖尔金"] = 191,
} }

