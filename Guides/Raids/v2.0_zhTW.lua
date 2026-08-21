-- ============================================================================
-- BossTips 2.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["2.0"] = {
    ["海加尔山之战"] = {
        name = "海加爾山之戰",
        ["阿兹加洛"] = {
            type = "BOSS",
            name = "阿茲加洛",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿茲加洛{rt8}||[火雨]放置圈需躲；[順劈]||{rt1}必斷/速殺：無；躲火雨{rt1}||坦：拉住",
            },
        },
        ["雷基·冬寒"] = {
            type = "BOSS",
            name = "雷基·冬寒",
            tipsByDifficulty = {
                ["normal"] = "{rt8}雷基·冬寒{rt8}||[冰霜]高傷；[冰棺]點名凍結需隊友救||{rt1}必斷/速殺：無；[冰棺]被點名救{rt1}||坦：拉住",
            },
        },
        ["卡兹洛加"] = {
            type = "BOSS",
            name = "卡茲洛加",
            tipsByDifficulty = {
                ["normal"] = "{rt8}卡茲洛加{rt8}||[重傷]高額普攻；[火]直傷||{rt1}必斷/速殺：無{rt1}||坦：硬抗；治療：預讀",
            },
        },
        ["阿克蒙德"] = {
            type = "BOSS",
            name = "阿克蒙德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿克蒙德{rt8}||[死亡之指]點名秒殺需立刻遠離；[火]全團；[狂暴]計時||{rt1}必斷/速殺：[死亡之指]被點名遠離人羣{rt1}||坦：拉住；輸出：速殺",
            },
        },
        ["安纳塞隆"] = {
            type = "BOSS",
            name = "安納塞隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}安納塞隆{rt8}||[睡眠]點名睡人需喚醒；[毒]dot||{rt1}必斷/速殺：無；[睡眠]被點名喚醒{rt1}||坦：拉住",
            },
        },
    },
    ["太阳之井高地"] = {
        name = "太陽之井高地",
        ["穆鲁"] = {
            type = "BOSS",
            name = "穆魯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}穆魯{rt8}||[虛空]階段召喚小怪需清；[暗]；P2[熵]本體||{rt1}必斷/速殺：無；清虛空小怪{rt1}||坦：拉住；輸出：清小怪",
            },
        },
        ["布鲁塔卢斯"] = {
            type = "BOSS",
            name = "布魯塔盧斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}布魯塔盧斯{rt8}||[燃燒]dot高傷；[擊飛]；[狂暴]計時||{rt1}必斷/速殺：無；[燃燒]被點名遠離{rt1}||坦：硬抗；治療：團刷",
            },
        },
        ["菲米丝"] = {
            type = "BOSS",
            name = "菲米絲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}菲米絲{rt8}||[毒氣]全團需躲雲；[氣體]新星；[俯衝]||{rt1}必斷/速殺：無；躲毒雲{rt1}||坦：拉住",
            },
        },
        ["基尔加丹"] = {
            type = "BOSS",
            name = "基爾加丹",
            tipsByDifficulty = {
                ["normal"] = "{rt8}基爾加丹{rt8}||[鏡像]分身；[火焰]全團；[手]點名秒殺；P5[暗]||{rt1}必斷/速殺：無；躲[手]打鏡像{rt1}||坦：拉住；輸出：躲機制",
            },
        },
        ["卡雷苟斯"] = {
            type = "BOSS",
            name = "卡雷苟斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}卡雷苟斯{rt8}||[藍龍/惡魔]雙空間，需進傳送門打惡魔；[點名]||{rt1}必斷/速殺：無；進傳送門集火惡魔{rt1}||坦：拉龍",
            },
        },
        ["艾瑞达双子"] = {
            type = "BOSS",
            name = "艾瑞達雙子",
            tipsByDifficulty = {
                ["normal"] = "{rt8}艾瑞達雙子{rt8}||[火/暗]雙子共享血量需同色站位；[光環]||{rt1}必斷/速殺：無；同色站位集火{rt1}||坦：分坦",
            },
        },
    },
    ["毒蛇神殿"] = {
        name = "毒蛇神殿",
        ["莫洛格里·踏潮者"] = {
            type = "BOSS",
            name = "莫洛格里·踏潮者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}莫洛格里·踏潮者{rt8}||[水墓]點名圈高傷需散開；[治療]add需控||{rt1}必斷/速殺：無；[水墓]被點名分散{rt1}||坦：拉住；輸出：控add",
            },
        },
        ["鱼斯拉"] = {
            type = "BOSS",
            name = "魚斯拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}魚斯拉{rt8}||[噴吐]旋轉掃射需躲側；[潛艇]階段需擊沉潛艇||{rt1}必斷/速殺：無；躲噴吐打潛艇{rt1}||坦：拉住",
            },
        },
        ["瓦丝琪"] = {
            type = "BOSS",
            name = "瓦絲琪",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瓦絲琪{rt8}||[三相]P1小怪/P2[毒]需解毒/P3[電擊]躲；[元素]需打||{rt1}必斷/速殺：無；P2解毒P3躲電擊{rt1}||坦：拉住；治療：解毒",
            },
        },
        ["深水领主卡拉瑟雷斯"] = {
            type = "BOSS",
            name = "深水領主卡拉瑟雷斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}深水領主卡拉瑟雷斯{rt8}||[四顧問]水/火/土/空氣分邊集火；[復活]||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦",
            },
        },
        ["不稳定的海度斯"] = {
            type = "BOSS",
            name = "不穩定的海度斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}不穩定的海度斯{rt8}||[自然/冰霜]雙形態切換需對應抗；[毒]dot||{rt1}必斷/速殺：無；按形態換抗{rt1}||坦：拉住",
            },
        },
        ["盲眼者莱欧瑟拉斯"] = {
            type = "BOSS",
            name = "盲眼者萊歐瑟拉斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}盲眼者萊歐瑟拉斯{rt8}||[雙心]共享血量需同時壓；[旋風斬]||{rt1}必斷/速殺：無；同時集火兩心{rt1}||坦：雙坦",
            },
        },
    },
    ["风暴要塞"] = {
        name = "風暴要塞",
        ["奥"] = {
            type = "BOSS",
            name = "奧",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧{rt8}||[四顧問]奧/火/冰/暗分邊集火共享血量；[復活]||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦",
            },
        },
        ["凯尔萨斯·逐日者"] = {
            type = "BOSS",
            name = "凱爾薩斯·逐日者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}凱爾薩斯·逐日者{rt8}||[顧問]多波；[武器]需拾取對應武器破盾；[火]||{rt1}必斷/速殺：無；拾武器破盾集火{rt1}||坦：拉住",
            },
        },
        ["大星术师索兰莉安"] = {
            type = "BOSS",
            name = "大星術師索蘭莉安",
            tipsByDifficulty = {
                ["normal"] = "{rt8}大星術師索蘭莉安{rt8}||[法術]火/冰/奧需打斷；[召喚]小怪||{rt1}必斷/速殺：[法術]打斷{rt1}||坦：拉住；輸出：清小怪",
            },
        },
        ["空灵机甲"] = {
            type = "BOSS",
            name = "空靈機甲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}空靈機甲{rt8}||[炸彈]點名放圈；[充能]高傷；[飛行]階段||{rt1}必斷/速殺：無；[炸彈]被點名放圈{rt1}||坦：拉住",
            },
        },
    },
    ["祖阿曼"] = {
        name = "祖阿曼",
        ["祖尔金"] = {
            type = "BOSS",
            name = "祖爾金",
            tipsByDifficulty = {
                ["normal"] = "{rt8}祖爾金{rt8}||[熊/鷹/龍/山貓]四形態輪流各機制；[狂暴]計時||{rt1}必斷/速殺：無；按形態應對{rt1}||坦：拉",
            },
        },
        ["纳洛拉克"] = {
            type = "BOSS",
            name = "納洛拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}納洛拉克{rt8}||[熊/鷹]雙形態切換；[衝撞]||{rt1}必斷/速殺：無；按形態換站位{rt1}||坦：拉",
            },
        },
        ["加亚莱"] = {
            type = "BOSS",
            name = "加亞萊",
            tipsByDifficulty = {
                ["normal"] = "{rt8}加亞萊{rt8}||[龍]火傷；[蛋]需打掉防孵化||{rt1}必斷/速殺：無；打蛋{rt1}||坦：拉",
            },
        },
        ["埃基尔松"] = {
            type = "BOSS",
            name = "埃基爾松",
            tipsByDifficulty = {
                ["normal"] = "{rt8}埃基爾松{rt8}||[閃電]點名；[鳥]階段俯衝||{rt1}必斷/速殺：無；躲閃電{rt1}||坦：拉",
            },
        },
        ["哈尔拉兹"] = {
            type = "BOSS",
            name = "哈爾拉茲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}哈爾拉茲{rt8}||[虎]衝撞；[召喚]小怪||{rt1}必斷/速殺：無{rt1}||坦：拉",
            },
        },
        ["妖术领主玛拉卡斯"] = {
            type = "BOSS",
            name = "妖術領主瑪拉卡斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}妖術領主瑪拉卡斯{rt8}||[妖術]變動物點名；[治療]add||{rt1}必斷/速殺：[妖術]速救{rt1}||坦：拉；輸出：救人",
            },
        },
    },
    ["黑暗神殿"] = {
        name = "黑暗神殿",
        ["塔隆·血魔"] = {
            type = "BOSS",
            name = "塔隆·血魔",
            tipsByDifficulty = {
                ["normal"] = "{rt8}塔隆·血魔{rt8}||[靈魂]點名後死亡化爲靈魂，需擊碎場內[靈契之瓶]否則團滅；[烈焰]dot||{rt1}必斷/速殺：無；[靈魂]被點名立刻去打碎瓶子{rt1}||坦：拉住；治療：救靈魂；輸出：救靈魂",
            },
        },
        ["高阶督军纳因图斯"] = {
            type = "BOSS",
            name = "高階督軍納因圖斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}高階督軍納因圖斯{rt8}||[穿刺]點名後中者需隊友踩水圈解救；[旋風斬]近戰受傷；擊殺掉落[沃達希爾碎片]||{rt1}必斷/速殺：無；[穿刺]被點名後隊友用水圈救{rt1}||坦：拉住；治療：救人；輸出：轉火",
            },
        },
        ["莎赫拉丝主母"] = {
            type = "BOSS",
            name = "莎赫拉絲主母",
            tipsByDifficulty = {
                ["normal"] = "{rt8}莎赫拉絲主母{rt8}||[順劈]；[致死打擊]；[心控]點名變惡魔需打斷救||{rt1}必斷/速殺：[心控]速打斷救人{rt1}||坦：拉住；輸出：救人",
            },
        },
        ["苏普雷姆斯"] = {
            type = "BOSS",
            name = "蘇普雷姆斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}蘇普雷姆斯{rt8}||[燃燒]追蹤紅圈需持續跑位；[火花]隨機選目標追人||{rt1}必斷/速殺：無；[燃燒]被點名遠離人羣{rt1}||坦：拉住；輸出：躲火花",
            },
        },
        ["伊利达雷议会"] = {
            type = "BOSS",
            name = "伊利達雷議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊利達雷議會{rt8}||[四顧問]同時作戰共享血量，需分散站位逐個擊破；混合火/冰/暗||{rt1}必斷/速殺：無；分邊集火單隻{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["古尔图格·血沸"] = {
            type = "BOSS",
            name = "古爾圖格·血沸",
            tipsByDifficulty = {
                ["normal"] = "{rt8}古爾圖格·血沸{rt8}||[血沸]週期性全團高傷需雙坦換坦；[酸液]dot；[狂暴]計時||{rt1}必斷/速殺：無；[血沸]換坦分擔{rt1}||坦：雙坦輪換；治療：團刷",
            },
        },
        ["阿卡玛之影"] = {
            type = "BOSS",
            name = "阿卡瑪之影",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿卡瑪之影{rt8}||[相位]分階段推進，P2需保護阿卡瑪不被小怪擊殺；[暗影]dot||{rt1}必斷/速殺：無；P2優先清威脅阿卡瑪的小怪{rt1}||坦：拉住；輸出：清小怪",
            },
        },
        ["灵魂之匣"] = {
            type = "BOSS",
            name = "靈魂之匣",
            tipsByDifficulty = {
                ["normal"] = "{rt8}靈魂之匣{rt8}||[三階段]憤怒/慾望/苦難輪流，每階段需對應打斷與分配；[吸藍]法力被吸乾||{rt1}必斷/速殺：按階段分配打斷對應法術{rt1}||坦：拉住；輸出：控藍",
            },
        },
        ["伊利丹·怒风"] = {
            type = "BOSS",
            name = "伊利丹·怒風",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊利丹·怒風{rt8}||[剪切]點名變惡魔需隊友救；[烈焰之地]放圈躲；[暗影]分身；P3[惡魔形態]全團火傷||{rt1}必斷/速殺：無；[剪切]被點名遠離等救援{rt1}||坦：拉住；治療：救；輸出：躲機制",
            },
        },
    },
    ["卡拉赞"] = {
        name = "卡拉贊",
        ["特雷斯坦·邪蹄"] = {
            type = "BOSS",
            name = "特雷斯坦·邪蹄",
            tipsByDifficulty = {
                ["normal"] = "{rt8}特雷斯坦·邪蹄{rt8}||[心控]點名變惡魔需打斷救；[火]||{rt1}必斷/速殺：[心控]速打斷救人{rt1}||坦：拉住；輸出：救人",
            },
        },
        ["猎手阿图门"] = {
            type = "BOSS",
            name = "獵手阿圖門",
            tipsByDifficulty = {
                ["normal"] = "{rt8}獵手阿圖門{rt8}||[馬與獵手]分離階段，需分別拉開擊殺；[衝鋒]||{rt1}必斷/速殺：無；把馬和獵手拉開分別打{rt1}||坦：拉馬",
            },
        },
        ["仆役宿舍"] = {
            type = "BOSS",
            name = "僕役宿舍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}僕役宿舍{rt8}||[多波小怪]連續刷新需控場；[恐懼]點名||{rt1}必斷/速殺：控/斷恐懼；分波清小怪{rt1}||坦：羣拉；輸出：控小怪",
            },
        },
        ["莫罗斯"] = {
            type = "BOSS",
            name = "莫羅斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}莫羅斯{rt8}||[召喚隨從]週期召喚需控；[致盲]當前坦||{rt1}必斷/速殺：控/殺隨從{rt1}||坦：雙坦；輸出：控小怪",
            },
        },
        ["馆长"] = {
            type = "BOSS",
            name = "館長",
            tipsByDifficulty = {
                ["normal"] = "{rt8}館長{rt8}||[藍球]能量球需打掉回藍；[電弧]全團；[狂暴]能量滿||{rt1}必斷/速殺：無；[藍球]打掉防狂暴{rt1}||坦：拉住",
            },
        },
        ["虚空幽龙"] = {
            type = "BOSS",
            name = "虛空幽龍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}虛空幽龍{rt8}||[顏色]紅/藍/綠/青銅，需對應站位喫增益；[點名]||{rt1}必斷/速殺：無；按顏色站位{rt1}||坦：拉住",
            },
        },
        ["贞节圣女"] = {
            type = "BOSS",
            name = "貞節聖女",
            tipsByDifficulty = {
                ["normal"] = "{rt8}貞節聖女{rt8}||[神聖]治療讀條反傷；[懺悔]點名定身||{rt1}必斷/速殺：無；[懺悔]被點名遠離{rt1}||坦：拉住；治療：禁讀條",
            },
        },
        ["老巫婆"] = {
            type = "BOSS",
            name = "老巫婆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}老巫婆{rt8}||[月/星]階段切換需對應站位；[火/冰]混合||{rt1}必斷/速殺：無；按階段換站位{rt1}||坦：拉住",
            },
        },
        ["大灰狼"] = {
            type = "BOSS",
            name = "大灰狼",
            tipsByDifficulty = {
                ["normal"] = "{rt8}大灰狼{rt8}||[小紅帽]點名追人需繞柱風箏；[吞噬]秒殺被追者||{rt1}必斷/速殺：無；[小紅帽]被點名繞柱跑{rt1}||坦：拉住",
            },
        },
        ["埃兰之影"] = {
            type = "BOSS",
            name = "埃蘭之影",
            tipsByDifficulty = {
                ["normal"] = "{rt8}埃蘭之影{rt8}||[三法術]火/冰/奧輪流讀條需對應打斷；[閃現]換位||{rt1}必斷/速殺：[法術]必須打斷{rt1}||坦：拉住",
            },
        },
        ["夜之魇"] = {
            type = "BOSS",
            name = "夜之魘",
            tipsByDifficulty = {
                ["normal"] = "{rt8}夜之魘{rt8}||[召喚]需在墓地讀條召喚；[骨雨]全團高傷；[減益]點名需上天躲避||{rt1}必斷/速殺：無；[減益]被點名上天躲{rt1}||坦：拉住",
            },
        },
        ["玛克扎尔王子"] = {
            type = "BOSS",
            name = "瑪克扎爾王子",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪克扎爾王子{rt8}||[鏡像]分身需集火真身；[火]；[橙杖]階段||{rt1}必斷/速殺：無；集火真身{rt1}||坦：拉住",
            },
        },
        ["罗密欧与朱丽叶"] = {
            type = "BOSS",
            name = "羅密歐與朱麗葉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}羅密歐與朱麗葉{rt8}||[雙人]共享血量需同時集火；[心控]點名||{rt1}必斷/速殺：無；同時壓兩目標{rt1}||坦：分坦",
            },
        },
    },
}
