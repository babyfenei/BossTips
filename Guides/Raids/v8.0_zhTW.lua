-- ============================================================================
-- BossTips 8.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["8.0"] = {
    ["达萨罗之战"] = {
        name = "達薩羅之戰",
        ["格隆·部落"] = {
            type = "BOSS",
            name = "格隆·部落",
            tipsByDifficulty = {
                ["normal"] = "{rt8}格隆·部落{rt8}||[雷]點名需遠離；[衝撞]；[狂暴]計時||{rt1}必斷/速殺：無；[雷]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["风暴墙封锁"] = {
            type = "BOSS",
            name = "風暴牆封鎖",
            tipsByDifficulty = {
                ["normal"] = "{rt8}風暴牆封鎖{rt8}||[雙艦]需分邊打；[電]全團；[狂暴]計時||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["大工匠梅卡托克"] = {
            type = "BOSS",
            name = "大工匠梅卡托克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}大工匠梅卡托克{rt8}||[機甲]需打部件；[炸彈]點名；[狂暴]計時||{rt1}必斷/速殺：無；打部件、[炸彈]放圈{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["格隆·联盟"] = {
            type = "BOSS",
            name = "格隆·聯盟",
            tipsByDifficulty = {
                ["normal"] = "{rt8}格隆·聯盟{rt8}||[雷]點名需遠離；[衝撞]；[狂暴]計時||{rt1}必斷/速殺：無；[雷]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["被选者议会"] = {
            type = "BOSS",
            name = "被選者議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}被選者議會{rt8}||[三神]共享血量分邊；[毒/雷/火]混合||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["奥波伦斯"] = {
            type = "BOSS",
            name = "奧波倫斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧波倫斯{rt8}||[寶箱]需打；[金]dot；[狂暴]計時||{rt1}必斷/速殺：無；打寶箱、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["玉火大师·联盟"] = {
            type = "BOSS",
            name = "玉火大師·聯盟",
            tipsByDifficulty = {
                ["normal"] = "{rt8}玉火大師·聯盟{rt8}||[武/法]雙形態切換需換站位；[火]dot；[狂暴]計時||{rt1}必斷/速殺：無；按形態換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["圣光勇士·联盟"] = {
            type = "BOSS",
            name = "聖光勇士·聯盟",
            tipsByDifficulty = {
                ["normal"] = "{rt8}聖光勇士·聯盟{rt8}||[聖光]點名需打斷；[盾]；[狂暴]計時||{rt1}必斷/速殺：[聖光]打斷；集火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["拉斯塔哈大王"] = {
            type = "BOSS",
            name = "拉斯塔哈大王",
            tipsByDifficulty = {
                ["normal"] = "{rt8}拉斯塔哈大王{rt8}||[血]圖騰需打；[狂暴]計時；P2[神靈]||{rt1}必斷/速殺：無；打血圖騰、P2應對{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["吉安娜·普罗德摩尔"] = {
            type = "BOSS",
            name = "吉安娜·普羅德摩爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}吉安娜·普羅德摩爾{rt8}||[冰]全團高傷；[水]階段需躲；P3[凍結]；[狂暴]計時||{rt1}必斷/速殺：無；躲冰、P3應對{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["圣光勇士·部落"] = {
            type = "BOSS",
            name = "聖光勇士·部落",
            tipsByDifficulty = {
                ["normal"] = "{rt8}聖光勇士·部落{rt8}||[聖光]點名需打斷；[盾]；[狂暴]計時||{rt1}必斷/速殺：[聖光]打斷；集火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["玉火大师·部落"] = {
            type = "BOSS",
            name = "玉火大師·部落",
            tipsByDifficulty = {
                ["normal"] = "{rt8}玉火大師·部落{rt8}||[武/法]雙形態切換需換站位；[火]dot；[狂暴]計時||{rt1}必斷/速殺：無；按形態換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["尼奥罗萨，觉醒之城"] = {
        name = "尼奧羅薩，覺醒之城",
        ["玛乌特"] = {
            type = "BOSS",
            name = "瑪烏特",
            tipsByDifficulty = {
                ["normal"] = "{rt8}瑪烏特{rt8}||[能量]需打[寶]消；[狂暴]計時||{rt1}必斷/速殺：無；打寶消能量{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["永渴的沙德哈"] = {
            type = "BOSS",
            name = "永渴的沙德哈",
            tipsByDifficulty = {
                ["normal"] = "{rt8}永渴的沙德哈{rt8}||[三汁]需喫對應顏色；[狂暴]計時||{rt1}必斷/速殺：無；喫對應顏色汁{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["被亵渎的雷登"] = {
            type = "BOSS",
            name = "被褻瀆的雷登",
            tipsByDifficulty = {
                ["normal"] = "{rt8}被褻瀆的雷登{rt8}||[球]需拉一起；[電]全團；[狂暴]計時||{rt1}必斷/速殺：無；[球]被點名拉一起{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["拉希奥"] = {
            type = "BOSS",
            name = "拉希奧",
            tipsByDifficulty = {
                ["normal"] = "{rt8}拉希奧{rt8}||[火]點名需分擔；[狂暴]計時||{rt1}必斷/速殺：無；[火]被點名分擔{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["蜂巢意识"] = {
            type = "BOSS",
            name = "蜂巢意識",
            tipsByDifficulty = {
                ["normal"] = "{rt8}蜂巢意識{rt8}||[多腦]需打；[觸手]；[狂暴]計時||{rt1}必斷/速殺：無；打腦、速殺{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["黑暗审判官萨尼什"] = {
            type = "BOSS",
            name = "黑暗審判官薩尼什",
            tipsByDifficulty = {
                ["normal"] = "{rt8}黑暗審判官薩尼什{rt8}||[門]需進；[光]點名；[狂暴]計時||{rt1}必斷/速殺：無；進門、速殺{rt1}||坦：拉；輸出：進門",
            },
        },
        ["恩佐斯·腐蚀者"] = {
            type = "BOSS",
            name = "恩佐斯·腐蝕者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}恩佐斯·腐蝕者{rt8}||[心智]需保；[觸手]全團；P3[本體]||{rt1}必斷/速殺：無；保心智、轉火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["伊格诺斯·重生腐蚀"] = {
            type = "BOSS",
            name = "伊格諾斯·重生腐蝕",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊格諾斯·重生腐蝕{rt8}||[眼球]需打掉防回血；[觸手]；[狂暴]計時||{rt1}必斷/速殺：無；打眼球防回血{rt1}||坦：拉；輸出：轉火眼球",
            },
        },
        ["先知斯吉特拉"] = {
            type = "BOSS",
            name = "先知斯吉特拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}先知斯吉特拉{rt8}||[鏡像]需集火真身；[幻象]；[狂暴]計時||{rt1}必斷/速殺：無；集火真身{rt1}||坦：拉；輸出：集火",
            },
        },
        ["恩佐斯之壳"] = {
            type = "BOSS",
            name = "恩佐斯之殼",
            tipsByDifficulty = {
                ["normal"] = "{rt8}恩佐斯之殼{rt8}||[甲殼]需打露頭；[觸手]；P2[本體]||{rt1}必斷/速殺：無；打露頭、轉火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["德雷斯塔加斯"] = {
            type = "BOSS",
            name = "德雷斯塔加斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}德雷斯塔加斯{rt8}||[觸手]需轉火；[眼]；[狂暴]計時||{rt1}必斷/速殺：無；轉火觸手{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["维克西奥娜"] = {
            type = "BOSS",
            name = "維克西奧娜",
            tipsByDifficulty = {
                ["normal"] = "{rt8}維克西奧娜{rt8}||[暗]點名需遠離；[龍]階段；[狂暴]計時||{rt1}必斷/速殺：無；[暗]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["永恒王宫"] = {
        name = "永恆王宮",
        ["黑水巨兽"] = {
            type = "BOSS",
            name = "黑水巨獸",
            tipsByDifficulty = {
                ["normal"] = "{rt8}黑水巨獸{rt8}||[觸手]需打；[水]需躲；[狂暴]計時||{rt1}必斷/速殺：無；打觸手、躲水{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["阿什凡女士"] = {
            type = "BOSS",
            name = "阿什凡女士",
            tipsByDifficulty = {
                ["normal"] = "{rt8}阿什凡女士{rt8}||[氣泡]需打；[毒]dot；[狂暴]計時||{rt1}必斷/速殺：無；打氣泡、速殺{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["深渊指挥官希瓦拉"] = {
            type = "BOSS",
            name = "深淵指揮官希瓦拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}深淵指揮官希瓦拉{rt8}||[雙形態]火/冰切換需換站位；[狂暴]計時||{rt1}必斷/速殺：無；按形態換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["艾萨拉之辉"] = {
            type = "BOSS",
            name = "艾薩拉之輝",
            tipsByDifficulty = {
                ["normal"] = "{rt8}艾薩拉之輝{rt8}||[星]點名需遠離；[雷]全團；[狂暴]計時||{rt1}必斷/速殺：無；[星]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["艾萨拉女王"] = {
            type = "BOSS",
            name = "艾薩拉女王",
            tipsByDifficulty = {
                ["normal"] = "{rt8}艾薩拉女王{rt8}||[多重]多機制輪換，[球]；[水]全團；P3[本體]||{rt1}必斷/速殺：無；按階段應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["扎库尔·尼奥罗萨先驱"] = {
            type = "BOSS",
            name = "扎庫爾·尼奧羅薩先驅",
            tipsByDifficulty = {
                ["normal"] = "{rt8}扎庫爾·尼奧羅薩先驅{rt8}||[夢]點名需救；[心控]；[狂暴]計時||{rt1}必斷/速殺：[心控]速斷救人；[夢]救{rt1}||坦：拉；輸出：救人",
            },
        },
        ["女王之庭"] = {
            type = "BOSS",
            name = "女王之庭",
            tipsByDifficulty = {
                ["normal"] = "{rt8}女王之庭{rt8}||[雙王]共享血量分邊；[聖]混合；[狂暴]計時||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["奥戈佐亚"] = {
            type = "BOSS",
            name = "奧戈佐亞",
            tipsByDifficulty = {
                ["normal"] = "{rt8}奧戈佐亞{rt8}||[孵化]需控；[噴射]；[狂暴]計時||{rt1}必斷/速殺：無；控孵化、速殺{rt1}||坦：拉；輸出：控",
            },
        },
    },
    ["风暴熔炉"] = {
        name = "風暴熔爐",
        ["不宁的卡巴尔"] = {
            type = "BOSS",
            name = "不寧的卡巴爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}不寧的卡巴爾{rt8}||[雙子]需同時擊殺；[觸]dot；[狂暴]計時||{rt1}必斷/速殺：無；同時集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["乌纳特·虚空先驱"] = {
            type = "BOSS",
            name = "烏納特·虛空先驅",
            tipsByDifficulty = {
                ["normal"] = "{rt8}烏納特·虛空先驅{rt8}||[虛空]機制多；[球]；[狂暴]計時||{rt1}必斷/速殺：無；按機制應對{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
    ["奥迪尔"] = {
        name = "奧迪爾",
        ["祖尔"] = {
            type = "BOSS",
            name = "祖爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}祖爾{rt8}||[血]圖騰需打；[狂暴]計時||{rt1}必斷/速殺：無；打血圖騰、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["塔洛克"] = {
            type = "BOSS",
            name = "塔洛克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}塔洛克{rt8}||[血]階段需打；[噴]；[狂暴]計時||{rt1}必斷/速殺：無；打血、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["格胡恩"] = {
            type = "BOSS",
            name = "格胡恩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}格胡恩{rt8}||[血]點名需分擔；[觸手]；P3[本體]||{rt1}必斷/速殺：無；[血]被點名分擔{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["维克提斯"] = {
            type = "BOSS",
            name = "維克提斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}維克提斯{rt8}||[連鎖]點名傳染；[疾病]dot；[狂暴]計時||{rt1}必斷/速殺：無；[連鎖]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["解构者米斯拉克斯"] = {
            type = "BOSS",
            name = "解構者米斯拉克斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}解構者米斯拉克斯{rt8}||[護盾]需破；[雷]全團；[狂暴]計時||{rt1}必斷/速殺：無；破盾、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["腐臭吞噬者"] = {
            type = "BOSS",
            name = "腐臭吞噬者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}腐臭吞噬者{rt8}||[嘔吐]點名需遠離；[毒]dot；[狂暴]計時||{rt1}必斷/速殺：無；[嘔吐]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["泽克沃兹·恩佐斯先驱"] = {
            type = "BOSS",
            name = "澤克沃茲·恩佐斯先驅",
            tipsByDifficulty = {
                ["normal"] = "{rt8}澤克沃茲·恩佐斯先驅{rt8}||[蟲]點名需遠離；[眼]；[狂暴]計時||{rt1}必斷/速殺：無；[蟲]被點名遠離{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["母体"] = {
            type = "BOSS",
            name = "母體",
            tipsByDifficulty = {
                ["normal"] = "{rt8}母體{rt8}||[激光]需躲；[淨化]；[狂暴]計時||{rt1}必斷/速殺：無；躲激光、速殺{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
}
