-- ============================================================================
-- BossTips Raid Guide Data —— 版本 6.0 团本攻略
-- 实例 key 为国服名；首领 key 为国服名；encounterId 取自 BigWigs/DBM（原样保留）。
-- 攻略格式：{rt8}名字{rt8}||[机制]描述||{rt1}必断/速杀：…{rt1}||坦：…治疗：…输出：…
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {} }
addon.GuideData.raids = addon.GuideData.raids or {}
addon.GuideData.raids["6.0"] = addon.GuideData.raids["6.0"] or {}
addon.GuideData.meta = addon.GuideData.meta or {}

-- ===================== 黑石铸造厂 (instanceId 1205) =====================
addon.GuideData.raids["6.0"]["黑石铸造厂"] = {
    ["黑手"] = { order = 1, type = "BOSS", tips = [=[{rt8}黑手{rt8}||[铁砧]周期砸地；[炸弹]点名；P3[熔炉]；[狂暴]计时||{rt1}必断/速杀：无；躲铁砧、[炸弹]放圈{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["兽王达玛拉克"] = { order = 2, type = "BOSS", tips = [=[{rt8}兽王达玛拉克{rt8}||[野兽]周期召唤需控；[矛]点名；[狂暴]计时||{rt1}必断/速杀：控/杀野兽；集火{rt1}||坦：拉；输出：控小怪]=], tipsByDifficulty = {} },
    ["烈焰编织者卡格拉兹"] = { order = 3, type = "BOSS", tips = [=[{rt8}烈焰编织者卡格拉兹{rt8}||[双龙]需分开拉；[火]全团；[狂暴]计时||{rt1}必断/速杀：无；分拉双龙{rt1}||坦：双坦；输出：集火]=], tipsByDifficulty = {} },
    ["索加尔"] = { order = 4, type = "BOSS", tips = [=[{rt8}索加尔{rt8}||[火车]需按信号灯跑位；[炸弹]；[狂暴]计时||{rt1}必断/速杀：无；按信号灯跑位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["熔炉"] = { order = 5, type = "BOSS", tips = [=[{rt8}熔炉{rt8}||[熔岩]喷溅需躲；[元素]坦接；[狂暴]计时||{rt1}必断/速杀：无；躲熔岩{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["汉斯加尔与弗兰佐克"] = { order = 6, type = "BOSS", tips = [=[{rt8}汉斯加尔与弗兰佐克{rt8}||[冲压]周期需躲；[拳]点名；[狂暴]计时||{rt1}必断/速杀：无；躲冲压{rt1}||坦：双坦；输出：集火]=], tipsByDifficulty = {} },
    ["格鲁尔"] = { order = 7, type = "BOSS", tips = [=[{rt8}格鲁尔{rt8}||[碎裂]点名需远离；[地质]全团；[狂暴]计时||{rt1}必断/速杀：无；[碎裂]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["克罗莫格"] = { order = 8, type = "BOSS", tips = [=[{rt8}克罗莫格{rt8}||[震波]需跳；[石拳]点名；[狂暴]计时||{rt1}必断/速杀：无；[石拳]被点名远离、跳震波{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["奥雷戈格"] = { order = 9, type = "BOSS", tips = [=[{rt8}奥雷戈格{rt8}||[滚动]需躲；[矿]吃矿变强；[狂暴]计时||{rt1}必断/速杀：无；躲滚动、吃矿{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["钢铁女武神"] = { order = 10, type = "BOSS", tips = [=[{rt8}钢铁女武神{rt8}||[三女武神]共享血量分边；[鱼雷]；[狂暴]计时||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["黑石铸造厂"] = { isRaid = true, instanceId = 1205, encounterIds = {
    ["黑手"] = 959,
    ["兽王达玛拉克"] = 1122,
    ["烈焰编织者卡格拉兹"] = 1123,
    ["索加尔"] = 1147, 
    ["熔炉"] = 1154,
    ["汉斯加尔与弗兰佐克"] = 1155,
    ["格鲁尔"] = 1161,
    ["克罗莫格"] = 1162,
    ["奥雷戈格"] = 1202,
    ["钢铁女武神"] = 1203,
} }

-- ===================== 地狱火堡垒 (instanceId 1448) =====================
addon.GuideData.raids["6.0"]["地狱火堡垒"] = {
    ["戈尔菲恩德"] = { order = 1, type = "BOSS", tips = [=[{rt8}戈尔菲恩德{rt8}||[魂]点名需救；[腐蚀]dot；[狂暴]计时||{rt1}必断/速杀：无；[魂]被点名救{rt1}||坦：拉；输出：救人]=], tipsByDifficulty = {} },
    ["邪能领主扎库恩"] = { order = 2, type = "BOSS", tips = [=[{rt8}邪能领主扎库恩{rt8}||[迷宫]需按路线走；[邪能]dot；[狂暴]计时||{rt1}必断/速杀：无；按迷宫走位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["科尔莫克"] = { order = 3, type = "BOSS", tips = [=[{rt8}科尔莫克{rt8}||[手]点名需拉一起；[落地]全团；[狂暴]计时||{rt1}必断/速杀：无；[手]被点名拉一起{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["暴君维哈里"] = { order = 4, type = "BOSS", tips = [=[{rt8}暴君维哈里{rt8}||[光/暗]两阶段切换需换站位；[狂暴]计时||{rt1}必断/速杀：无；按光暗换站位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["玛诺洛斯"] = { order = 5, type = "BOSS", tips = [=[{rt8}玛诺洛斯{rt8}||[邪能]点名需分担；[狂暴]计时||{rt1}必断/速杀：无；[邪能]被点名分担{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["基尔罗格·死眼"] = { order = 6, type = "BOSS", tips = [=[{rt8}基尔罗格·死眼{rt8}||[幻象]需进幻象打；[眼]点名；[狂暴]计时||{rt1}必断/速杀：无；进幻象打{rt1}||坦：拉；输出：进幻象]=], tipsByDifficulty = {} },
    ["钢铁劫掠者"] = { order = 7, type = "BOSS", tips = [=[{rt8}钢铁劫掠者{rt8}||[炮]需打炮；[地雷]；[狂暴]计时||{rt1}必断/速杀：无；操炮、躲雷{rt1}||坦：拉；输出：操炮]=], tipsByDifficulty = {} },
    ["地狱火突袭"] = { order = 8, type = "BOSS", tips = [=[{rt8}地狱火突袭{rt8}||[多波]连续小怪+载具；[火]||{rt1}必断/速杀：清小怪、载具推进{rt1}||坦：拉；输出：清小怪]=], tipsByDifficulty = {} },
    ["永恒者索克雷萨"] = { order = 9, type = "BOSS", tips = [=[{rt8}永恒者索克雷萨{rt8}||[灵魂]需猎杀；[邪能]；[狂暴]计时||{rt1}必断/速杀：无；猎杀灵魂{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["地狱火高阶议会"] = { order = 10, type = "BOSS", tips = [=[{rt8}地狱火高阶议会{rt8}||[三顾问]共享血量分边；[火/暗/邪]混合||{rt1}必断/速杀：无；分边集火{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["暗影领主伊斯卡尔"] = { order = 11, type = "BOSS", tips = [=[{rt8}暗影领主伊斯卡尔{rt8}||[眼]需传；[暗影]dot；[狂暴]计时||{rt1}必断/速杀：无；传眼、躲暗影{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["阿克蒙德"] = { order = 12, type = "BOSS", tips = [=[{rt8}阿克蒙德{rt8}||[手]点名秒杀需远离；[火]全团；[狂暴]计时||{rt1}必断/速杀：[手]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["祖尔霍拉克"] = { order = 13, type = "BOSS", tips = [=[{rt8}祖尔霍拉克{rt8}||[光/暗]两阶段，需对应站位；[狂暴]计时||{rt1}必断/速杀：无；按光暗换站位{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["地狱火堡垒"] = { isRaid = true, instanceId = 1448, encounterIds = {
    ["戈尔菲恩德"] = 1372,
    ["邪能领主扎库恩"] = 1391,
    ["科尔莫克"] = 1392,
    ["暴君维哈里"] = 1394,
    ["玛诺洛斯"] = 1395,
    ["基尔罗格·死眼"] = 1396,
    ["钢铁劫掠者"] = 1425,
    ["地狱火突袭"] = 1426,
    ["永恒者索克雷萨"] = 1427,
    ["地狱火高阶议会"] = 1432,
    ["暗影领主伊斯卡尔"] = 1433,
    ["阿克蒙德"] = 1438,
    ["祖尔霍拉克"] = 1447,
} }

-- ===================== 悬锤堡 (instanceId 1228) =====================
addon.GuideData.raids["6.0"]["悬锤堡"] = {
    ["屠夫"] = { order = 1, type = "BOSS", tips = [=[{rt8}屠夫{rt8}||[顺劈]全团高伤需换坦；[狂暴]计时||{rt1}必断/速杀：无；换坦防顺劈{rt1}||坦：双坦；治疗：团刷]=], tipsByDifficulty = {} },
    ["卡加斯·刃拳"] = { order = 2, type = "BOSS", tips = [=[{rt8}卡加斯·刃拳{rt8}||[铁栏]需拉；[矛]点名；[狂暴]计时||{rt1}必断/速杀：无；拉铁栏、躲矛{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
    ["双子奥格隆"] = { order = 3, type = "BOSS", tips = [=[{rt8}双子奥格隆{rt8}||[双子]需同时击杀；[冲撞]||{rt1}必断/速杀：无；同时集火{rt1}||坦：分坦；输出：集火]=], tipsByDifficulty = {} },
    ["科拉格"] = { order = 4, type = "BOSS", tips = [=[{rt8}科拉格{rt8}||[护盾]需集火破；[法力]需控；[狂暴]计时||{rt1}必断/速杀：无；集火破盾{rt1}||坦：拉；输出：破盾]=], tipsByDifficulty = {} },
    ["泰克图斯"] = { order = 5, type = "BOSS", tips = [=[{rt8}泰克图斯{rt8}||[土]需打露头；[地震]；[分裂]||{rt1}必断/速杀：无；打露头、转火分身{rt1}||坦：拉；输出：转火]=], tipsByDifficulty = {} },
    ["布雷肯斯波雷"] = { order = 6, type = "BOSS", tips = [=[{rt8}布雷肯斯波雷{rt8}||[蘑菇]需踩回血；[毒]dot；[狂暴]计时||{rt1}必断/速杀：无；踩蘑菇回血{rt1}||坦：拉；治疗：踩蘑菇]=], tipsByDifficulty = {} },
    ["元首马尔高克"] = { order = 7, type = "BOSS", tips = [=[{rt8}元首马尔高克{rt8}||[奥能]点名需远离；[传送]；[狂暴]计时||{rt1}必断/速杀：无；[奥能]被点名远离{rt1}||坦：拉；输出：速杀]=], tipsByDifficulty = {} },
}
addon.GuideData.meta["悬锤堡"] = { isRaid = true, instanceId = 1228, encounterIds = {
    ["屠夫"] = 971,
    ["卡加斯·刃拳"] = 1128,
    ["双子奥格隆"] = 1148,
    ["科拉格"] = 1153,
    ["泰克图斯"] = 1195,
    ["布雷肯斯波雷"] = 1196,
    ["元首马尔高克"] = 1197,
} }

