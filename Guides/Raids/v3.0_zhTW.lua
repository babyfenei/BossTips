-- ============================================================================
-- BossTips 3.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["3.0"] = {
    ["十字军的试炼"] = {
        name = "十字軍的試煉",
        ["加拉克苏斯大王"] = {
            type = "BOSS",
            name = "加拉克蘇斯大王",
            tipsByDifficulty = {
                ["normal"] = "{rt8}加拉克蘇斯大王{rt8}||[傳送門]需進傳送門打斷施法；[地獄火]落點||{rt1}必斷/速殺：進傳送門打斷；躲地獄火{rt1}||坦：拉住；輸出：進門",
            },
        },
        ["瓦格里双子"] = {
            type = "BOSS",
            name = "瓦格里雙子",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瓦格里雙子{rt8}||[光暗]需同色站位，異色受傷；[護盾]||{rt1}必斷/速殺：無；同色站位集火{rt1}||坦：分坦",
            },
        },
        ["阿努巴拉克"] = {
            type = "BOSS",
            name = "阿努巴拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿努巴拉克{rt8}||[鑽地]週期鑽地，需打[寒冰]塊迫使出土；[刺]點名||{rt1}必斷/速殺：無；打冰塊迫出土{rt1}||坦：拉住；輸出：打冰",
            },
        },
        ["诺森德猛兽"] = {
            type = "BOSS",
            name = "諾森德猛獸",
            tipsByDifficulty = {
                ["normal"] = "{rt8}諾森德猛獸{rt8}||[三獸]依次登場，[毒]與[火]混合；[打斷]關鍵||{rt1}必斷/速殺：按機制打斷；依次擊殺{rt1}||坦：輪換；輸出：轉火",
            },
        },
        ["部落的冠军"] = {
            type = "BOSS",
            name = "部落的冠軍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}部落的冠軍{rt8}||[多職業]五個敵方職業各有技能，需控場逐個；[心控]||{rt1}必斷/速殺：控/打斷關鍵；逐個擊破{rt1}||坦：分坦；輸出：控",
            },
        },
    },
    ["奥杜尔"] = {
        name = "奧杜爾",
        ["科隆加恩"] = {
            type = "BOSS",
            name = "科隆加恩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}科隆加恩{rt8}||[手臂]分離需打掉；[碎石]落點||{rt1}必斷/速殺：無；打掉手臂{rt1}||坦：拉；輸出：轉火手臂",
            },
        },
        ["欧尔莉亚"] = {
            type = "BOSS",
            name = "歐爾莉亞",
            tipsByDifficulty = {
                ["normal"] = "{rt8}歐爾莉亞{rt8}||[哨兵]召喚需清；[光]點名||{rt1}必斷/速殺：無；清哨兵{rt1}||坦：拉；輸出：清add",
            },
        },
        ["掌炉者伊格尼斯"] = {
            type = "BOSS",
            name = "掌爐者伊格尼斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}掌爐者伊格尼斯{rt8}||[鐵球]需用水澆滅成[冰]讓坦拉；[火]||{rt1}必斷/速殺：無；澆水成冰控{rt1}||坦：拉冰；輸出：澆",
            },
        },
        ["托里姆"] = {
            type = "BOSS",
            name = "托里姆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}托里姆{rt8}||[兩側]跑通道觸發；[閃電]全團；[狂暴]計時||{rt1}必斷/速殺：無；跑通道、躲閃電{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["米米尔隆"] = {
            type = "BOSS",
            name = "米米爾隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}米米爾隆{rt8}||[三階段]機器人/火山/頭部，[炸彈]點名；[狂暴]計時||{rt1}必斷/速殺：無；[炸彈]放圈{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["XT-002拆解者"] = {
            type = "BOSS",
            name = "XT-002拆解者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}XT-002拆解者{rt8}||[心]週期暴露需集火；[炸彈]點名放圈；[狂暴]計時||{rt1}必斷/速殺：無；[炸彈]放圈、集火心{rt1}||坦：拉；輸出：轉火心",
            },
        },
        ["烈焰巨兽"] = {
            type = "BOSS",
            name = "烈焰巨獸",
            tipsByDifficulty = {
                ["normal"] = "{rt8}烈焰巨獸{rt8}||[載具]需開攻城車載具打；[火]落點||{rt1}必斷/速殺：無；載具集火{rt1}||坦：無；輸出：載具",
            },
        },
        ["维扎克斯将军"] = {
            type = "BOSS",
            name = "維扎克斯將軍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}維扎克斯將軍{rt8}||[黑水]點名圈高傷；[暗]；[狂暴]計時||{rt1}必斷/速殺：無；[黑水]被點名分散{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["霍迪尔"] = {
            type = "BOSS",
            name = "霍迪爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}霍迪爾{rt8}||[冰環]週期需破冰救；[火]增益站位；[狂暴]計時||{rt1}必斷/速殺：無；破冰環、喫火站{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["锋鳞"] = {
            type = "BOSS",
            name = "鋒鱗",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鋒鱗{rt8}||[炮]需打場內炮擊龍；[火]俯衝||{rt1}必斷/速殺：無；打炮擊龍{rt1}||坦：拉；輸出：操炮",
            },
        },
        ["观察者奥尔加隆"] = {
            type = "BOSS",
            name = "觀察者奧爾加隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}觀察者奧爾加隆{rt8}||[宇宙]全團週期高傷；[星]點名；[狂暴]極短計時||{rt1}必斷/速殺：無；[星]被點名遠離{rt1}||坦：拉；治療：團刷；輸出：速殺",
            },
        },
        ["尤格-萨隆"] = {
            type = "BOSS",
            name = "尤格-薩隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}尤格-薩隆{rt8}||[心智]進夢境保san值；[觸手]需打；P3[本體]；[狂暴]計時||{rt1}必斷/速殺：無；進夢境打觸手{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["弗蕾亚"] = {
            type = "BOSS",
            name = "弗蕾亞",
            tipsByDifficulty = {
                ["normal"] = "{rt8}弗蕾亞{rt8}||[三長老]需先清三長老再打本體；[自然]dot||{rt1}必斷/速殺：無；清三長老{rt1}||坦：拉；輸出：清長老",
            },
        },
        ["钢铁议会"] = {
            type = "BOSS",
            name = "鋼鐵議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鋼鐵議會{rt8}||[三矮人]共享血量，需按指定順序集火；[電]||{rt1}必斷/速殺：無；按序集火{rt1}||坦：分坦；輸出：集火",
            },
        },
    },
    ["红玉圣殿"] = {
        name = "紅玉聖殿",
        ["海里昂"] = {
            type = "BOSS",
            name = "海里昂",
            tipsByDifficulty = {
                ["normal"] = "{rt8}海里昂{rt8}||[雙空間]現實/夢境，需進傳送門打分身；[火]全團；[狂暴]計時||{rt1}必斷/速殺：無；進傳送門集火分身{rt1}||坦：拉；輸出：進門",
            },
        },
    },
    ["纳克萨玛斯"] = {
        name = "納克薩瑪斯",
        ["萨菲隆"] = {
            type = "BOSS",
            name = "薩菲隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}薩菲隆{rt8}||[冰墓]凍結點名遠離；[深呼吸]掃射躲側||{rt1}必斷/速殺：無；冰墓跑開深呼吸躲側{rt1}||坦：拉；輸出：躲機制",
            },
        },
        ["塔迪乌斯"] = {
            type = "BOSS",
            name = "塔迪烏斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}塔迪烏斯{rt8}||[極性]正負電荷，同極受傷異極回血需換邊||{rt1}必斷/速殺：無；按極性換邊{rt1}||坦：按極性；輸出：換邊",
            },
        },
        ["教官拉苏维奥斯"] = {
            type = "BOSS",
            name = "教官拉蘇維奧斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}教官拉蘇維奧斯{rt8}||[學員]控制小怪對其釋放[命令]打斷本體||{rt1}必斷/速殺：無；控小怪用命令斷本體{rt1}||坦：本體由學員控；輸出：控小怪",
            },
        },
        ["黑女巫法琳娜"] = {
            type = "BOSS",
            name = "黑女巫法琳娜",
            tipsByDifficulty = {
                ["normal"] = "{rt8}黑女巫法琳娜{rt8}||[狂暴]疊層需持續斷[鞭撻]抑制||{rt1}必斷/速殺：[鞭撻]必斷防狂暴{rt1}||坦：拉住；輸出：安排斷",
            },
        },
        ["克尔苏加德"] = {
            type = "BOSS",
            name = "克爾蘇加德",
            tipsByDifficulty = {
                ["normal"] = "{rt8}克爾蘇加德{rt8}||P1[小怪]；P2[寒冰]護盾；P3[心控]點名需斷救||{rt1}必斷/速殺：P3[心控]速斷救人{rt1}||坦：拉；輸出：P1清小怪P3救人",
            },
        },
        ["阿努布雷坎"] = {
            type = "BOSS",
            name = "阿努佈雷坎",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿努佈雷坎{rt8}||[蟲羣]點名追人需跑；[地穴衛士]坦接||{rt1}必斷/速殺：無；被[蟲羣]繞圈跑{rt1}||坦：接衛士；輸出：清蟲",
            },
        },
        ["药剂师诺斯"] = {
            type = "BOSS",
            name = "藥劑師諾斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}藥劑師諾斯{rt8}||[傳送]換位；[冰霜]週期全團||{rt1}必斷/速殺：無；傳送後找位{rt1}||坦：拉；治療：團刷冰",
            },
        },
        ["迈克斯纳"] = {
            type = "BOSS",
            name = "邁克斯納",
            tipsByDifficulty = {
                ["normal"] = "{rt8}邁克斯納{rt8}||[網]定身；[毒]dot；[小蜘蛛]刷新||{rt1}必斷/速殺：無；被網等救{rt1}||坦：拉；輸出：清蜘蛛",
            },
        },
        ["格拉斯"] = {
            type = "BOSS",
            name = "格拉斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}格拉斯{rt8}||[喫屍]吞小怪回血需控；[狂暴]計時||{rt1}必斷/速殺：控/殺小怪防回血{rt1}||坦：拉；輸出：控小怪",
            },
        },
        ["格罗布鲁斯"] = {
            type = "BOSS",
            name = "格羅布魯斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}格羅布魯斯{rt8}||[毒雲]放置後擴散需移動放||{rt1}必斷/速殺：無；移動放毒{rt1}||坦：拉移動；輸出：跟着移",
            },
        },
        ["天启四骑士"] = {
            type = "BOSS",
            name = "天啓四騎士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}天啓四騎士{rt8}||[印記]疊層換坦，4坦分散；共享仇恨||{rt1}必斷/速殺：無；印記換坦{rt1}||坦：4坦分散換坦；治療：分邊",
            },
        },
        ["帕奇维克"] = {
            type = "BOSS",
            name = "帕奇維克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}帕奇維克{rt8}||[狂暴]肉搏戰高額普攻；限時||{rt1}必斷/速殺：無；坦硬抗{rt1}||坦：主坦硬抗；治療：預讀",
            },
        },
        ["洛欧塞布"] = {
            type = "BOSS",
            name = "洛歐塞布",
            tipsByDifficulty = {
                ["normal"] = "{rt8}洛歐塞布{rt8}||[孢子]雲內回血；[治療抑制]週期禁治療||{rt1}必斷/速殺：無；孢子期刷血{rt1}||坦：拉；治療：孢子期爆發",
            },
        },
        ["肮脏的希尔盖"] = {
            type = "BOSS",
            name = "骯髒的希爾蓋",
            tipsByDifficulty = {
                ["normal"] = "{rt8}骯髒的希爾蓋{rt8}||[跳舞]走位機，踩死圈即死需跟節奏||{rt1}必斷/速殺：無；按安全圈走位{rt1}||坦：拉；輸出：走位中輸出",
            },
        },
        ["收割者戈提克"] = {
            type = "BOSS",
            name = "收割者戈提克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}收割者戈提克{rt8}||[兩側門]活側/死側按節奏換邊||{rt1}必斷/速殺：無；按指示換邊{rt1}||坦：分坦；輸出：換邊",
            },
        },
    },
    ["冰冠堡垒"] = {
        name = "冰冠堡壘",
        ["辛达苟萨"] = {
            type = "BOSS",
            name = "辛達苟薩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}辛達苟薩{rt8}||[冰墓]點名凍結需遠離；[狂風]吹風減員；[狂暴]計時||{rt1}必斷/速殺：無；[冰墓]被點名跑開{rt1}||坦：拉住；輸出：速殺",
            },
        },
        ["巫妖王"] = {
            type = "BOSS",
            name = "巫妖王",
            tipsByDifficulty = {
                ["normal"] = "{rt8}巫妖王{rt8}||[污染]點名放圈擴散；[靈魂]收割需躲；[寄生]dot；P3[霜]全團；P5[無敵]階段||{rt1}必斷/速殺：無；[污染]被點名放圈、躲收割{rt1}||坦：拉住；治療：團刷",
            },
        },
        ["玛洛加尔领主"] = {
            type = "BOSS",
            name = "瑪洛加爾領主",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪洛加爾領主{rt8}||[寒冰]全團週期高傷；[骨刺]點名需集火打斷；[狂暴]計時||{rt1}必斷/速殺：無；[骨刺]被點名集火打掉{rt1}||坦：拉住；輸出：轉火骨刺",
            },
        },
        ["冰冠冰川炮舰战"] = {
            type = "BOSS",
            name = "冰冠冰川炮艦戰",
            tipsByDifficulty = {
                ["normal"] = "{rt8}冰冠冰川炮艦戰{rt8}||[炮艦]兩船對轟，需打炮/投彈轟對面；[冰]落點||{rt1}必斷/速殺：無；打炮擊對面船{rt1}||坦：無；輸出：操炮",
            },
        },
        ["踏梦者瓦莉瑟瑞娅"] = {
            type = "BOSS",
            name = "踏夢者瓦莉瑟瑞婭",
            tipsByDifficulty = {
                ["normal"] = "{rt8}踏夢者瓦莉瑟瑞婭{rt8}||[夢境]本體不可攻擊，需進夢境打[夢魘]portal 救；[火]全團||{rt1}必斷/速殺：無；進夢境清怪救本體{rt1}||坦：拉；輸出：進夢境",
            },
        },
        ["鲜血王子议会"] = {
            type = "BOSS",
            name = "鮮血王子議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鮮血王子議會{rt8}||[三王子]共享血量分邊集火；[暗/火/奧]混合；[吸血]回血||{rt1}必斷/速殺：無；分邊集火單隻{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["亡语者女士"] = {
            type = "BOSS",
            name = "亡語者女士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}亡語者女士{rt8}||[召喚亡魂]分階段召喚需清；[暗影]dot||{rt1}必斷/速殺：無；清召喚亡魂{rt1}||坦：拉住；輸出：清add",
            },
        },
        ["鲜血女王兰娜瑟尔"] = {
            type = "BOSS",
            name = "鮮血女王蘭娜瑟爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鮮血女王蘭娜瑟爾{rt8}||[咬]點名傳染需鏈傳遞；[血鏡]鏡像；[暗影]dot||{rt1}必斷/速殺：無；[咬]按順序鏈傳遞{rt1}||坦：拉住；治療：解毒",
            },
        },
        ["普崔塞德教授"] = {
            type = "BOSS",
            name = "普崔塞德教授",
            tipsByDifficulty = {
                ["normal"] = "{rt8}普崔塞德教授{rt8}||[實驗]多階段，[毒]與[突變]切換；[酸雨]放置||{rt1}必斷/速殺：無；按實驗階段應對{rt1}||坦：拉住；輸出：轉火",
            },
        },
        ["腐面"] = {
            type = "BOSS",
            name = "腐面",
            tipsByDifficulty = {
                ["normal"] = "{rt8}腐面{rt8}||[疫病]點名炸彈需遠離引爆；[小軟]刷新需控||{rt1}必斷/速殺：無；[疫病]被點名遠離人羣{rt1}||坦：拉住；輸出：控小軟",
            },
        },
        ["烂肠"] = {
            type = "BOSS",
            name = "爛腸",
            tipsByDifficulty = {
                ["normal"] = "{rt8}爛腸{rt8}||[毒氣]週期全團需喫[蘑菇]減傷；[疾病]疊層||{rt1}必斷/速殺：無；喫蘑菇減毒{rt1}||坦：拉住；治療：團刷",
            },
        },
        ["死亡使者萨鲁法尔"] = {
            type = "BOSS",
            name = "死亡使者薩魯法爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}死亡使者薩魯法爾{rt8}||[血獸]點名追治療需坦接；[符文]死亡留下需踩；[狂暴]計時||{rt1}必斷/速殺：無；[血獸]坦接、踩符文{rt1}||坦：接血獸；輸出：踩符文",
            },
        },
    },
}
