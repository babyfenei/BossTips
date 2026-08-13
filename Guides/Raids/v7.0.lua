-- ============================================================================
-- BossTips Raid Guide Data —— 版本 7.0 团本攻略
-- 实例 key 为国服名；首领 key 为国服名；encounterId 取自 BigWigs/DBM（原样保留）。
-- 攻略格式：{rt8}名字{rt8}||[机制]描述||{rt1}必断/速杀：…{rt1}||坦：…治疗：…输出：…
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["7.0"] = addon.GuideData.raids["7.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 安托鲁斯，燃烧王座 (instanceId 1712) =====================
addon.GuideData.raids["7.0"]["安托鲁斯，燃烧王座"] = {
    ["瓦里玛萨斯"] = { order = 1, type = "BOSS", tips = [=[{rt8}瓦里玛萨斯{rt8}||[镜像]分身需集火；[暗影]dot；[狂暴]计时||{rt1}必断/速杀：无；集火真身{rt1}||坦：拉；输出：集火]=], tipsByDifficulty = {} },
    ["阿格拉玛"] = { order = 2, type = "BOSS", tips = [=[{rt8}阿格拉玛{rt8}||[剑]点名需躲；[火焰]全团；[狂暴]计时||{rt1}必断/速杀：无；躲剑、速杀{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["传送门守护者哈西贝尔"] = { order = 3, type = "BOSS", tips = [=[{rt8}传送门守护者哈西贝尔{rt8}||[传送门]需进传送门打；[毒]dot；[狂暴]计时||{rt1}必断/速杀：无；进传送门集火{rt1}||坦：拉；输出：进门]=], tipsByDifficulty = {} },
    ["希瓦尔拉议会"] = { order = 4, type = "BOSS", tips = [=[{rt8}希瓦尔拉议会{rt8}||[三姐妹]共享血量分边；[火/冰/邪]混合||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["萨格拉斯的邪犬"] = { order = 5, type = "BOSS", tips = [=[{rt8}萨格拉斯的邪犬{rt8}||[双犬]需分开拉；[火/邪]；[狂暴]计时||{rt1}必断/速杀：无；分拉双犬{rt1}||坦：双坦；输出：集火]=], tipsByDifficulty = {} },
    ["戈罗提碎界者"] = { order = 6, type = "BOSS", tips = [=[{rt8}戈罗提碎界者{rt8}||[炮]需打炮击；[落点]；[狂暴]计时||{rt1}必断/速杀：无；操炮击、躲落点{rt1}||坦：拉；输出：操炮]=], tipsByDifficulty = {} },
    ["安托兰高阶指挥官"] = { order = 7, type = "BOSS", tips = [=[{rt8}安托兰高阶指挥官{rt8}||[三舰]需集火单只；[炮]；[狂暴]计时||{rt1}必断/速杀：无；集火单舰{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["金加罗斯"] = { order = 8, type = "BOSS", tips = [=[{rt8}金加罗斯{rt8}||[构造体]需打断；[炸弹]点名；[狂暴]计时||{rt1}必断/速杀：按构造体打断；集火{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["猎魂者伊莫纳尔"] = { order = 9, type = "BOSS", tips = [=[{rt8}猎魂者伊莫纳尔{rt8}||[炸弹]点名需远离；[电]全团；[狂暴]计时||{rt1}必断/速杀：无；[炸弹]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["生命缚誓者艾欧娜尔"] = { order = 10, type = "BOSS", tips = [=[{rt8}生命缚誓者艾欧娜尔{rt8}||[护盾]需保种子回血；[种子]；[狂暴]计时||{rt1}必断/速杀：无；保种子回血{rt1}||坦：拉；输出：保种子]=], tipsByDifficulty = {} },
    ["寂灭者阿古斯"] = { order = 11, type = "BOSS", tips = [=[{rt8}寂灭者阿古斯{rt8}||[多重]多机制轮换，[球]；[虚空]全团；P3[寂灭]||{rt1}必断/速杀：无；按阶段应对{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["安托鲁斯，燃烧王座"] = { isRaid = true, instanceId = 1712, encounterIds = {
    ["瓦里玛萨斯"] = 1983,
    ["阿格拉玛"] = 1984,
    ["传送门守护者哈西贝尔"] = 1985,
    ["希瓦尔拉议会"] = 1986,
    ["萨格拉斯的邪犬"] = 1987,
    ["戈罗提碎界者"] = 1992,
    ["安托兰高阶指挥官"] = 1997,
    ["金加罗斯"] = 2004,
    ["猎魂者伊莫纳尔"] = 2009,
    ["生命缚誓者艾欧娜尔"] = 2025,
    ["寂灭者阿古斯"] = 2031,
} }

-- ===================== 暗夜要塞 (instanceId 1530) =====================
addon.GuideData.raids["7.0"]["暗夜要塞"] = {
    ["斯考匹隆"] = { order = 1, type = "BOSS", tips = [=[{rt8}斯考匹隆{rt8}||[刺]点名需远离；[电]全团；[狂暴]计时||{rt1}必断/速杀：无；[刺]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["克洛苏斯"] = { order = 2, type = "BOSS", tips = [=[{rt8}克洛苏斯{rt8}||[桥]需炸桥；[火]落点；[狂暴]计时||{rt1}必断/速杀：无；炸桥、躲火{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["时空畸体"] = { order = 3, type = "BOSS", tips = [=[{rt8}时空畸体{rt8}||[时间]需吃[快/慢]球；[狂暴]计时||{rt1}必断/速杀：无；吃时间球维持{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["崔里阿克丝"] = { order = 4, type = "BOSS", tips = [=[{rt8}崔里阿克丝{rt8}||[净化]需吃对应食物；[三形态]；[狂暴]计时||{rt1}必断/速杀：无；吃对应食物{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["星界预言者埃特柔斯"] = { order = 5, type = "BOSS", tips = [=[{rt8}星界预言者埃特柔斯{rt8}||[星]点名需远离；[行星]阶段；[狂暴]计时||{rt1}必断/速杀：无；[星]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["古尔丹"] = { order = 6, type = "BOSS", tips = [=[{rt8}古尔丹{rt8}||[魂]点名需救；[混乱]dot；P3[伊利丹]阶段||{rt1}必断/速杀：无；[魂]被点名救{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["大魔导师艾莉桑德"] = { order = 7, type = "BOSS", tips = [=[{rt8}大魔导师艾莉桑德{rt8}||[时间]需吃球控速；[水晶]；[狂暴]计时||{rt1}必断/速杀：无；吃时间球{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["咒剑士奥鲁瑞尔"] = { order = 8, type = "BOSS", tips = [=[{rt8}咒剑士奥鲁瑞尔{rt8}||[三剑]需对应站位；[冰]dot；[狂暴]计时||{rt1}必断/速杀：无；按剑换站位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["高阶植物学家特尔安"] = { order = 9, type = "BOSS", tips = [=[{rt8}高阶植物学家特尔安{rt8}||[三植物]需集火单只；[毒]；[狂暴]计时||{rt1}必断/速杀：无；集火单只{rt1}||坦：拉；输出：集火]=], tipsByDifficulty = {} },
    ["提克迪奥斯"] = { order = 10, type = "BOSS", tips = [=[{rt8}提克迪奥斯{rt8}||[蝙蝠]需躲；[心控]点名；[狂暴]计时||{rt1}必断/速杀：[心控]速断救人；躲蝙蝠{rt1}||坦：拉；输出：救人]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["暗夜要塞"] = { isRaid = true, instanceId = 1530, encounterIds = {
    ["斯考匹隆"] = 1706,
    ["克洛苏斯"] = 1713,
    ["时空畸体"] = 1725,
    ["崔里阿克丝"] = 1731,
    ["星界预言者埃特柔斯"] = 1732,
    ["古尔丹"] = 1737,
    ["大魔导师艾莉桑德"] = 1743,
    ["咒剑士奥鲁瑞尔"] = 1751,
    ["高阶植物学家特尔安"] = 1761,
    ["提克迪奥斯"] = 1762,
} }

-- ===================== 翡翠梦魇 (instanceId 1520) =====================
addon.GuideData.raids["7.0"]["翡翠梦魇"] = {
    ["乌索克"] = { order = 1, type = "BOSS", tips = [=[{rt8}乌索克{rt8}||[冲撞]需躲；[重击]坦；[狂暴]计时||{rt1}必断/速杀：无；躲冲撞{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["尼珊德拉"] = { order = 2, type = "BOSS", tips = [=[{rt8}尼珊德拉{rt8}||[虫]点名需远离；[感染]dot；[狂暴]计时||{rt1}必断/速杀：无；[虫]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["梦魇之龙"] = { order = 3, type = "BOSS", tips = [=[{rt8}梦魇之龙{rt8}||[四龙]需集火单只；[毒/火]混合；[狂暴]计时||{rt1}必断/速杀：无；集火单只{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["萨维斯"] = { order = 4, type = "BOSS", tips = [=[{rt8}萨维斯{rt8}||[梦]点名需救；[腐蚀]dot；P3[本体]||{rt1}必断/速杀：无；[梦]被点名救{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["伊格诺斯"] = { order = 5, type = "BOSS", tips = [=[{rt8}伊格诺斯{rt8}||[眼球]需打掉防回血；[触手]；[狂暴]计时||{rt1}必断/速杀：无；打眼球防回血{rt1}||坦：拉；输出：转火眼球]=], tipsByDifficulty = {} },
    ["艾勒瑞瑟·衰亡者"] = { order = 6, type = "BOSS", tips = [=[{rt8}艾勒瑞瑟·衰亡者{rt8}||[蜘蛛/鸟]双形态切换；[网]；[狂暴]计时||{rt1}必断/速杀：无；按形态换站位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["塞纳留斯"] = { order = 7, type = "BOSS", tips = [=[{rt8}塞纳留斯{rt8}||[梦魇]需清理；[根]点名；[狂暴]计时||{rt1}必断/速杀：无；清梦魇、躲根{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["翡翠梦魇"] = { isRaid = true, instanceId = 1520, encounterIds = {
    ["乌索克"] = 1667,
    ["尼珊德拉"] = 1703,
    ["梦魇之龙"] = 1704,
    ["萨维斯"] = 1726,
    ["伊格诺斯"] = 1738,
    ["艾勒瑞瑟·衰亡者"] = 1744,
    ["塞纳留斯"] = 1750,
} }

-- ===================== 萨格拉斯之墓 (instanceId 1676) =====================
addon.GuideData.raids["7.0"]["萨格拉斯之墓"] = {
    ["捶击者哈加坦"] = { order = 1, type = "BOSS", tips = [=[{rt8}捶击者哈加坦{rt8}||[水]点名需站水减伤；[锤]；[狂暴]计时||{rt1}必断/速杀：无；[水]被点名站水{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["萨丝丝女士"] = { order = 2, type = "BOSS", tips = [=[{rt8}萨丝丝女士{rt8}||[水]需躲；[触手]；[狂暴]计时||{rt1}必断/速杀：无；躲水、转火{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["戈罗斯"] = { order = 3, type = "BOSS", tips = [=[{rt8}戈罗斯{rt8}||[流星]需躲；[火]全团；[狂暴]计时||{rt1}必断/速杀：无；躲流星{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["恶魔审判庭"] = { order = 4, type = "BOSS", tips = [=[{rt8}恶魔审判庭{rt8}||[罪]需集火；[火/邪]；[狂暴]计时||{rt1}必断/速杀：无；集火罪{rt1}||坦：拉；输出：集火]=], tipsByDifficulty = {} },
    ["堕落化身"] = { order = 5, type = "BOSS", tips = [=[{rt8}堕落化身{rt8}||[光/暗]需对应站位；[撕裂]；[狂暴]计时||{rt1}必断/速杀：无；按光暗换站位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["荒寂之主"] = { order = 6, type = "BOSS", tips = [=[{rt8}荒寂之主{rt8}||[灵界]需进灵界打；[暗影]；[狂暴]计时||{rt1}必断/速杀：无；进灵界打{rt1}||坦：拉；输出：进门]=], tipsByDifficulty = {} },
    ["守夜圣女"] = { order = 7, type = "BOSS", tips = [=[{rt8}守夜圣女{rt8}||[炸弹]点名需远离；[圣]全团；[狂暴]计时||{rt1}必断/速杀：无；[炸弹]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["基尔加丹"] = { order = 8, type = "BOSS", tips = [=[{rt8}基尔加丹{rt8}||[镜像]分身；[火]全团；[手]点名；P5[暗]||{rt1}必断/速杀：无；躲[手]、打镜像{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["月之姐妹"] = { order = 9, type = "BOSS", tips = [=[{rt8}月之姐妹{rt8}||[三姐妹]共享血量分边；[月]dot；[狂暴]计时||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["萨格拉斯之墓"] = { isRaid = true, instanceId = 1676, encounterIds = {
    ["捶击者哈加坦"] = 1856,
    ["萨丝丝女士"] = 1861,
    ["戈罗斯"] = 1862,
    ["恶魔审判庭"] = 1867,
    ["堕落化身"] = 1873,
    ["荒寂之主"] = 1896,
    ["守夜圣女"] = 1897,
    ["基尔加丹"] = 1898,
    ["月之姐妹"] = 1903,
} }

-- ===================== 勇气试炼 (instanceId 1648) =====================
addon.GuideData.raids["7.0"]["勇气试炼"] = {
    ["奥丁"] = { order = 1, type = "BOSS", tips = [=[{rt8}奥丁{rt8}||[锤]点名需躲；[盾]；[狂暴]计时||{rt1}必断/速杀：无；躲锤、速杀{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["海拉"] = { order = 2, type = "BOSS", tips = [=[{rt8}海拉{rt8}||[水]需躲；[触手]；P2[本体]；[狂暴]计时||{rt1}必断/速杀：无；躲水、转火{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["古尔姆"] = { order = 3, type = "BOSS", tips = [=[{rt8}古尔姆{rt8}||[头]多形态切换；[喷]；[狂暴]计时||{rt1}必断/速杀：无；按形态应对{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["勇气试炼"] = { isRaid = true, instanceId = 1648, encounterIds = {
    ["奥丁"] = 1819,
    ["海拉"] = 1829,
    ["古尔姆"] = 1830,
} }

