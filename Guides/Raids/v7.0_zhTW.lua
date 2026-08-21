-- ============================================================================
-- BossTips 7.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["7.0"] = {
    ["安托鲁斯，燃烧王座"] = {
        name = "安託魯斯，燃燒王座",
        ["希瓦尔拉议会"] = {
            type = "BOSS",
            name = "希瓦爾拉議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}希瓦爾拉議會{rt8}||[三姐妹]共享血量分邊；[火/冰/邪]混合||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["戈罗提碎界者"] = {
            type = "BOSS",
            name = "戈羅提碎界者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}戈羅提碎界者{rt8}||[炮]需打炮擊；[落點]；[狂暴]計時||{rt1}必斷/速殺：無；操炮擊、躲落點{rt1}||坦：拉；輸出：操炮",
            },
        },
        ["猎魂者伊莫纳尔"] = {
            type = "BOSS",
            name = "獵魂者伊莫納爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}獵魂者伊莫納爾{rt8}||[炸彈]點名需遠離；[電]全團；[狂暴]計時||{rt1}必斷/速殺：無；[炸彈]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["金加罗斯"] = {
            type = "BOSS",
            name = "金加羅斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}金加羅斯{rt8}||[構造體]需打斷；[炸彈]點名；[狂暴]計時||{rt1}必斷/速殺：按構造體打斷；集火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["萨格拉斯的邪犬"] = {
            type = "BOSS",
            name = "薩格拉斯的邪犬",
            tipsByDifficulty = {
                ["normal"] = "{rt8}薩格拉斯的邪犬{rt8}||[雙犬]需分開拉；[火/邪]；[狂暴]計時||{rt1}必斷/速殺：無；分拉雙犬{rt1}||坦：雙坦；輸出：集火",
            },
        },
        ["瓦里玛萨斯"] = {
            type = "BOSS",
            name = "瓦里瑪薩斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瓦里瑪薩斯{rt8}||[鏡像]分身需集火；[暗影]dot；[狂暴]計時||{rt1}必斷/速殺：無；集火真身{rt1}||坦：拉；輸出：集火",
            },
        },
        ["传送门守护者哈西贝尔"] = {
            type = "BOSS",
            name = "傳送門守護者哈西貝爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}傳送門守護者哈西貝爾{rt8}||[傳送門]需進傳送門打；[毒]dot；[狂暴]計時||{rt1}必斷/速殺：無；進傳送門集火{rt1}||坦：拉；輸出：進門",
            },
        },
        ["阿格拉玛"] = {
            type = "BOSS",
            name = "阿格拉瑪",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿格拉瑪{rt8}||[劍]點名需躲；[火焰]全團；[狂暴]計時||{rt1}必斷/速殺：無；躲劍、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["寂灭者阿古斯"] = {
            type = "BOSS",
            name = "寂滅者阿古斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}寂滅者阿古斯{rt8}||[多重]多機制輪換，[球]；[虛空]全團；P3[寂滅]||{rt1}必斷/速殺：無；按階段應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["生命缚誓者艾欧娜尔"] = {
            type = "BOSS",
            name = "生命縛誓者艾歐娜爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}生命縛誓者艾歐娜爾{rt8}||[護盾]需保種子回血；[種子]；[狂暴]計時||{rt1}必斷/速殺：無；保種子回血{rt1}||坦：拉；輸出：保種子",
            },
        },
        ["安托兰高阶指挥官"] = {
            type = "BOSS",
            name = "安託蘭高階指揮官",
            tipsByDifficulty = {
                ["normal"] = "{rt8}安託蘭高階指揮官{rt8}||[三艦]需集火單隻；[炮]；[狂暴]計時||{rt1}必斷/速殺：無；集火單艦{rt1}||坦：分坦；輸出：集火",
            },
        },
    },
    ["翡翠梦魇"] = {
        name = "翡翠夢魘",
        ["尼珊德拉"] = {
            type = "BOSS",
            name = "尼珊德拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}尼珊德拉{rt8}||[蟲]點名需遠離；[感染]dot；[狂暴]計時||{rt1}必斷/速殺：無；[蟲]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["塞纳留斯"] = {
            type = "BOSS",
            name = "塞納留斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}塞納留斯{rt8}||[夢魘]需清理；[根]點名；[狂暴]計時||{rt1}必斷/速殺：無；清夢魘、躲根{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["艾勒瑞瑟·衰亡者"] = {
            type = "BOSS",
            name = "艾勒瑞瑟·衰亡者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}艾勒瑞瑟·衰亡者{rt8}||[蜘蛛/鳥]雙形態切換；[網]；[狂暴]計時||{rt1}必斷/速殺：無；按形態換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["萨维斯"] = {
            type = "BOSS",
            name = "薩維斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}薩維斯{rt8}||[夢]點名需救；[腐蝕]dot；P3[本體]||{rt1}必斷/速殺：無；[夢]被點名救{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["伊格诺斯"] = {
            type = "BOSS",
            name = "伊格諾斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊格諾斯{rt8}||[眼球]需打掉防回血；[觸手]；[狂暴]計時||{rt1}必斷/速殺：無；打眼球防回血{rt1}||坦：拉；輸出：轉火眼球",
            },
        },
        ["梦魇之龙"] = {
            type = "BOSS",
            name = "夢魘之龍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}夢魘之龍{rt8}||[四龍]需集火單隻；[毒/火]混合；[狂暴]計時||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["乌索克"] = {
            type = "BOSS",
            name = "烏索克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}烏索克{rt8}||[衝撞]需躲；[重擊]坦；[狂暴]計時||{rt1}必斷/速殺：無；躲衝撞{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["勇气试炼"] = {
        name = "勇氣試煉",
        ["奥丁"] = {
            type = "BOSS",
            name = "奧丁",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧丁{rt8}||[錘]點名需躲；[盾]；[狂暴]計時||{rt1}必斷/速殺：無；躲錘、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["海拉"] = {
            type = "BOSS",
            name = "海拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}海拉{rt8}||[水]需躲；[觸手]；P2[本體]；[狂暴]計時||{rt1}必斷/速殺：無；躲水、轉火{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["古尔姆"] = {
            type = "BOSS",
            name = "古爾姆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}古爾姆{rt8}||[頭]多形態切換；[噴]；[狂暴]計時||{rt1}必斷/速殺：無；按形態應對{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["暗夜要塞"] = {
        name = "暗夜要塞",
        ["斯考匹隆"] = {
            type = "BOSS",
            name = "斯考匹隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}斯考匹隆{rt8}||[刺]點名需遠離；[電]全團；[狂暴]計時||{rt1}必斷/速殺：無；[刺]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["大魔导师艾莉桑德"] = {
            type = "BOSS",
            name = "大魔導師艾莉桑德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}大魔導師艾莉桑德{rt8}||[時間]需喫球控速；[水晶]；[狂暴]計時||{rt1}必斷/速殺：無；喫時間球{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["古尔丹"] = {
            type = "BOSS",
            name = "古爾丹",
            tipsByDifficulty = {
                ["normal"] = "{rt8}古爾丹{rt8}||[魂]點名需救；[混亂]dot；P3[伊利丹]階段||{rt1}必斷/速殺：無；[魂]被點名救{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["崔里阿克丝"] = {
            type = "BOSS",
            name = "崔裏阿克絲",
            tipsByDifficulty = {
                ["normal"] = "{rt8}崔裏阿克絲{rt8}||[淨化]需喫對應食物；[三形態]；[狂暴]計時||{rt1}必斷/速殺：無；喫對應食物{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["咒剑士奥鲁瑞尔"] = {
            type = "BOSS",
            name = "咒劍士奧魯瑞爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}咒劍士奧魯瑞爾{rt8}||[三劍]需對應站位；[冰]dot；[狂暴]計時||{rt1}必斷/速殺：無；按劍換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["克洛苏斯"] = {
            type = "BOSS",
            name = "克洛蘇斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}克洛蘇斯{rt8}||[橋]需炸橋；[火]落點；[狂暴]計時||{rt1}必斷/速殺：無；炸橋、躲火{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["提克迪奥斯"] = {
            type = "BOSS",
            name = "提克迪奧斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}提克迪奧斯{rt8}||[蝙蝠]需躲；[心控]點名；[狂暴]計時||{rt1}必斷/速殺：[心控]速斷救人；躲蝙蝠{rt1}||坦：拉；輸出：救人",
            },
        },
        ["高阶植物学家特尔安"] = {
            type = "BOSS",
            name = "高階植物學家特爾安",
            tipsByDifficulty = {
                ["normal"] = "{rt8}高階植物學家特爾安{rt8}||[三植物]需集火單隻；[毒]；[狂暴]計時||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：拉；輸出：集火",
            },
        },
        ["星界预言者埃特柔斯"] = {
            type = "BOSS",
            name = "星界預言者埃特柔斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}星界預言者埃特柔斯{rt8}||[星]點名需遠離；[行星]階段；[狂暴]計時||{rt1}必斷/速殺：無；[星]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["时空畸体"] = {
            type = "BOSS",
            name = "時空畸體",
            tipsByDifficulty = {
                ["normal"] = "{rt8}時空畸體{rt8}||[時間]需喫[快/慢]球；[狂暴]計時||{rt1}必斷/速殺：無；喫時間球維持{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["萨格拉斯之墓"] = {
        name = "薩格拉斯之墓",
        ["捶击者哈加坦"] = {
            type = "BOSS",
            name = "捶擊者哈加坦",
            tipsByDifficulty = {
                ["normal"] = "{rt8}捶擊者哈加坦{rt8}||[水]點名需站水減傷；[錘]；[狂暴]計時||{rt1}必斷/速殺：無；[水]被點名站水{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["堕落化身"] = {
            type = "BOSS",
            name = "墮落化身",
            tipsByDifficulty = {
                ["normal"] = "{rt8}墮落化身{rt8}||[光/暗]需對應站位；[撕裂]；[狂暴]計時||{rt1}必斷/速殺：無；按光暗換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["月之姐妹"] = {
            type = "BOSS",
            name = "月之姐妹",
            tipsByDifficulty = {
                ["normal"] = "{rt8}月之姐妹{rt8}||[三姐妹]共享血量分邊；[月]dot；[狂暴]計時||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["戈罗斯"] = {
            type = "BOSS",
            name = "戈羅斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}戈羅斯{rt8}||[流星]需躲；[火]全團；[狂暴]計時||{rt1}必斷/速殺：無；躲流星{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["守夜圣女"] = {
            type = "BOSS",
            name = "守夜聖女",
            tipsByDifficulty = {
                ["normal"] = "{rt8}守夜聖女{rt8}||[炸彈]點名需遠離；[聖]全團；[狂暴]計時||{rt1}必斷/速殺：無；[炸彈]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["基尔加丹"] = {
            type = "BOSS",
            name = "基爾加丹",
            tipsByDifficulty = {
                ["normal"] = "{rt8}基爾加丹{rt8}||[鏡像]分身；[火]全團；[手]點名；P5[暗]||{rt1}必斷/速殺：無；躲[手]、打鏡像{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["荒寂之主"] = {
            type = "BOSS",
            name = "荒寂之主",
            tipsByDifficulty = {
                ["normal"] = "{rt8}荒寂之主{rt8}||[靈界]需進靈界打；[暗影]；[狂暴]計時||{rt1}必斷/速殺：無；進靈界打{rt1}||坦：拉；輸出：進門",
            },
        },
        ["萨丝丝女士"] = {
            type = "BOSS",
            name = "薩絲絲女士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}薩絲絲女士{rt8}||[水]需躲；[觸手]；[狂暴]計時||{rt1}必斷/速殺：無；躲水、轉火{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["恶魔审判庭"] = {
            type = "BOSS",
            name = "惡魔審判庭",
            tipsByDifficulty = {
                ["normal"] = "{rt8}惡魔審判庭{rt8}||[罪]需集火；[火/邪]；[狂暴]計時||{rt1}必斷/速殺：無；集火罪{rt1}||坦：拉；輸出：集火",
            },
        },
    },
}
