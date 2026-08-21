-- ============================================================================
-- BossTips 5.0 攻略翻译 —— zhTW（简中源经 opencc s2t 转换；与简中同结构）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.zhTW = addon.GuideData.translations.zhTW or {}
addon.GuideData.translations.zhTW.raids = addon.GuideData.translations.zhTW.raids or {}
addon.GuideData.translations.zhTW.raids["5.0"] = {
    ["永春台"] = {
        name = "永春臺",
        ["烛龙"] = {
            type = "BOSS",
            name = "燭龍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}燭龍{rt8}||[晝夜]白天需打斷、夜晚需保血；[光線]||{rt1}必斷/速殺：白天按機制打斷；夜晚抬血{rt1}||坦：拉；治療：夜晚抬血",
            },
        },
        ["雷施"] = {
            type = "BOSS",
            name = "雷施",
            tipsByDifficulty = {
                ["normal"] = "{rt8}雷施{rt8}||[隱身]週期消失需停手找位；[水流]；[濺射]||{rt1}必斷/速殺：無；隱身期停手定位{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["无尽者守护者"] = {
            type = "BOSS",
            name = "無盡者守護者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}無盡者守護者{rt8}||[三守衛]共享血量分邊集火；[光/暗]階段切換||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["惧之煞"] = {
            type = "BOSS",
            name = "懼之煞",
            tipsByDifficulty = {
                ["normal"] = "{rt8}懼之煞{rt8}||[恐懼]點名需躲[光]；[觸手]；[狂暴]計時||{rt1}必斷/速殺：無；被[恐懼]點名躲光{rt1}||坦：拉；輸出：轉火",
            },
        },
    },
    ["决战奥格瑞玛"] = {
        name = "決戰奧格瑞瑪",
        ["库卡隆黑暗萨满"] = {
            type = "BOSS",
            name = "庫卡隆黑暗薩滿",
            tipsByDifficulty = {
                ["normal"] = "{rt8}庫卡隆黑暗薩滿{rt8}||[火/電]兩薩滿分邊，需對應站位；[圖騰]||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["伊墨苏斯"] = {
            type = "BOSS",
            name = "伊墨蘇斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊墨蘇斯{rt8}||[水滴]需打掉防回血；[腐蝕]dot；[階段]||{rt1}必斷/速殺：無；打掉水滴防回血{rt1}||坦：拉；輸出：轉火水滴",
            },
        },
        ["潘达利亚的战利品"] = {
            type = "BOSS",
            name = "潘達利亞的戰利品",
            tipsByDifficulty = {
                ["normal"] = "{rt8}潘達利亞的戰利品{rt8}||[寶箱]兩邊開箱清怪，限時擊殺||{rt1}必斷/速殺：無；限時開箱清怪{rt1}||坦：分坦；輸出：清怪",
            },
        },
        ["诺鲁什"] = {
            type = "BOSS",
            name = "諾魯什",
            tipsByDifficulty = {
                ["normal"] = "{rt8}諾魯什{rt8}||[測試]進內場清[疑]球；[腐蝕]dot||{rt1}必斷/速殺：無；進內場清疑球{rt1}||坦：拉；輸出：進內場",
            },
        },
        ["攻城师黑弗斯"] = {
            type = "BOSS",
            name = "攻城師黑弗斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}攻城師黑弗斯{rt8}||[傳送帶]需打斷對應；[地雷]；[拆解]||{rt1}必斷/速殺：按傳送帶打斷；集火{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["马尔考洛克"] = {
            type = "BOSS",
            name = "馬爾考洛克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}馬爾考洛克{rt8}||[球]點名需拉一起分擔；[落地]全團；[狂暴]計時||{rt1}必斷/速殺：無；[球]被點名拉一起分擔{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["嗜血的索克"] = {
            type = "BOSS",
            name = "嗜血的索克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}嗜血的索克{rt8}||[牢]需救被抓者；[毒]階段；[狂暴]計時||{rt1}必斷/速殺：無；救被抓者{rt1}||坦：拉；輸出：救人",
            },
        },
        ["傲之煞"] = {
            type = "BOSS",
            name = "傲之煞",
            tipsByDifficulty = {
                ["normal"] = "{rt8}傲之煞{rt8}||[驕傲]滿需散開；[光]點名；[狂暴]計時||{rt1}必斷/速殺：無；[驕傲]滿散開{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["加尔鲁什·地狱咆哮"] = {
            type = "BOSS",
            name = "加爾魯什·地獄咆哮",
            tipsByDifficulty = {
                ["normal"] = "{rt8}加爾魯什·地獄咆哮{rt8}||[鐵穹]需躲；[心控]；P2[部落]；P3[虛空]全團||{rt1}必斷/速殺：無；躲鐵穹、P2應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["堕落的守护者"] = {
            type = "BOSS",
            name = "墮落的守護者",
            tipsByDifficulty = {
                ["normal"] = "{rt8}墮落的守護者{rt8}||[三守護]共享血量分邊；[心控]；[暗影]||{rt1}必斷/速殺：無；分邊集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["纳兹戈林将军"] = {
            type = "BOSS",
            name = "納茲戈林將軍",
            tipsByDifficulty = {
                ["normal"] = "{rt8}納茲戈林將軍{rt8}||[戰旗]需拔；[小怪]召喚；[狂暴]計時||{rt1}必斷/速殺：拔戰旗、清小怪；集火{rt1}||坦：拉；輸出：拔旗",
            },
        },
        ["迦拉卡斯"] = {
            type = "BOSS",
            name = "迦拉卡斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}迦拉卡斯{rt8}||[塔]需打塔觸發；[龍]階段；[小怪]||{rt1}必斷/速殺：無；打塔觸發、清小怪{rt1}||坦：分坦；輸出：打塔",
            },
        },
        ["螳螂妖英杰"] = {
            type = "BOSS",
            name = "螳螂妖英傑",
            tipsByDifficulty = {
                ["normal"] = "{rt8}螳螂妖英傑{rt8}||[英傑]輪流激活，需對應應對；[毒]||{rt1}必斷/速殺：按英傑機制；集火{rt1}||坦：拉；輸出：集火",
            },
        },
        ["钢铁战神"] = {
            type = "BOSS",
            name = "鋼鐵戰神",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鋼鐵戰神{rt8}||[炮]需打炮擊；[地雷]；[狂暴]計時||{rt1}必斷/速殺：無；操炮擊、躲雷{rt1}||坦：拉；輸出：操炮",
            },
        },
    },
    ["魔古山宝库"] = {
        name = "魔古山寶庫",
        ["皇帝的意志"] = {
            type = "BOSS",
            name = "皇帝的意志",
            tipsByDifficulty = {
                ["normal"] = "{rt8}皇帝的意志{rt8}||[傀儡]雙坦拉，[能量]滿需打斷；[狂暴]計時||{rt1}必斷/速殺：能量滿前打斷；集火{rt1}||坦：雙坦；輸出：速殺",
            },
        },
        ["伊拉贡"] = {
            type = "BOSS",
            name = "伊拉貢",
            tipsByDifficulty = {
                ["normal"] = "{rt8}伊拉貢{rt8}||[能量]需打[星]回能；[光束]；[勇者]階段||{rt1}必斷/速殺：無；打星迴能、躲光束{rt1}||坦：拉；輸出：打星",
            },
        },
        ["石头守卫"] = {
            type = "BOSS",
            name = "石頭守衛",
            tipsByDifficulty = {
                ["normal"] = "{rt8}石頭守衛{rt8}||[寶石]需按顏色激活對應；[寵物]坦接||{rt1}必斷/速殺：無；按寶石顏色激活{rt1}||坦：分坦；輸出：轉火",
            },
        },
        ["缚灵者戈拉亚"] = {
            type = "BOSS",
            name = "縛靈者戈拉亞",
            tipsByDifficulty = {
                ["normal"] = "{rt8}縛靈者戈拉亞{rt8}||[靈界]需進靈界救被抓者；[暗影]dot||{rt1}必斷/速殺：無；進靈界救隊友{rt1}||坦：拉；輸出：進靈界",
            },
        },
        ["灵魂王"] = {
            type = "BOSS",
            name = "靈魂王",
            tipsByDifficulty = {
                ["normal"] = "{rt8}靈魂王{rt8}||[四王]輪流激活，需打斷對應；[共享]||{rt1}必斷/速殺：按王打斷；逐個{rt1}||坦：拉；輸出：集火",
            },
        },
        ["受诅者冯"] = {
            type = "BOSS",
            name = "受詛者馮",
            tipsByDifficulty = {
                ["normal"] = "{rt8}受詛者馮{rt8}||[元素]火/電/冰輪流，需打斷對應；[階段]||{rt1}必斷/速殺：按元素打斷；集火{rt1}||坦：拉；輸出：轉火",
            },
        },
    },
    ["雷霆王座"] = {
        name = "雷霆王座",
        ["遗忘者杜鲁姆"] = {
            type = "BOSS",
            name = "遺忘者杜魯姆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}遺忘者杜魯姆{rt8}||[射線]需看[眼]走位；[紅/藍]點名；[狂暴]計時||{rt1}必斷/速殺：無；按射線走位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["吉库恩"] = {
            type = "BOSS",
            name = "吉庫恩",
            tipsByDifficulty = {
                ["normal"] = "{rt8}吉庫恩{rt8}||[蛋]需打蛋；[毒]落點；[俯衝]||{rt1}必斷/速殺：無；打蛋、躲毒{rt1}||坦：拉；輸出：打蛋",
            },
        },
        ["美拉盖拉"] = {
            type = "BOSS",
            name = "美拉蓋拉",
            tipsByDifficulty = {
                ["normal"] = "{rt8}美拉蓋拉{rt8}||[多頭]需打斷頭防復活；[酸液]；[狂暴]計時||{rt1}必斷/速殺：打斷頭防復活；集火{rt1}||坦：拉；輸出：斷頭",
            },
        },
        ["铁库昂"] = {
            type = "BOSS",
            name = "鐵庫昂",
            tipsByDifficulty = {
                ["normal"] = "{rt8}鐵庫昂{rt8}||[四階段]風/火/冰/電輪流，需對應站位；[狂暴]計時||{rt1}必斷/速殺：無；按階段換站位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["双后"] = {
            type = "BOSS",
            name = "雙後",
            tipsByDifficulty = {
                ["normal"] = "{rt8}雙後{rt8}||[雙子]需同時擊殺；[冰/火]混合；[心控]||{rt1}必斷/速殺：無；同時集火{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["雷神"] = {
            type = "BOSS",
            name = "雷神",
            tipsByDifficulty = {
                ["normal"] = "{rt8}雷神{rt8}||[平臺]多機制輪流，[鏈]；[電]全團；P3[無敵]||{rt1}必斷/速殺：無；按平臺機制應對{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["黑暗活化体"] = {
            type = "BOSS",
            name = "黑暗活化體",
            tipsByDifficulty = {
                ["normal"] = "{rt8}黑暗活化體{rt8}||[球]需拉[活化]進圈消除；[能量]；[狂暴]計時||{rt1}必斷/速殺：無；拉活化進圈{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["长者议会"] = {
            type = "BOSS",
            name = "長者議會",
            tipsByDifficulty = {
                ["normal"] = "{rt8}長者議會{rt8}||[四長者]需集火單隻防回血；[元素]混合||{rt1}必斷/速殺：無；集火單隻{rt1}||坦：分坦；輸出：集火",
            },
        },
        ["普利莫求斯"] = {
            type = "BOSS",
            name = "普利莫求斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}普利莫求斯{rt8}||[球]需喫[軟泥]變強；[突變]；[狂暴]計時||{rt1}必斷/速殺：無；喫軟泥變強{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["雷登"] = {
            type = "BOSS",
            name = "雷登",
            tipsByDifficulty = {
                ["normal"] = "{rt8}雷登{rt8}||[球]機制複雜，需按提示跑位；[狂暴]計時(隱藏)||{rt1}必斷/速殺：無；按提示跑位{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["破坏者金罗克"] = {
            type = "BOSS",
            name = "破壞者金羅克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}破壞者金羅克{rt8}||[水]點名需站水減傷；[電]全團；[狂暴]計時||{rt1}必斷/速殺：無；[水]被點名站水{rt1}||坦：拉；輸出：速殺",
            },
        },
        ["霍利顿"] = {
            type = "BOSS",
            name = "霍利頓",
            tipsByDifficulty = {
                ["normal"] = "{rt8}霍利頓{rt8}||[小怪]多門召喚需控；[狂暴]計時||{rt1}必斷/速殺：控/清門小怪；集火{rt1}||坦：拉；輸出：控小怪",
            },
        },
        ["托托斯"] = {
            type = "BOSS",
            name = "託託斯",
            tipsByDifficulty = {
                ["normal"] = "{rt8}託託斯{rt8}||[殼]需打露頭；[地震]；[小龜]需控||{rt1}必斷/速殺：無；打露頭、控小龜{rt1}||坦：拉；輸出：轉火",
            },
        },
    },
    ["恐惧之心"] = {
        name = "恐懼之心",
        ["琥珀塑形者昂绍克"] = {
            type = "BOSS",
            name = "琥珀塑形者昂紹克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}琥珀塑形者昂紹克{rt8}||[琥珀]吸收需打破；[構造體]階段；[劇毒]||{rt1}必斷/速殺：無；打琥珀構造體{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["帝国宰相佐拉洛克"] = {
            type = "BOSS",
            name = "帝國宰相佐拉洛克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}帝國宰相佐拉洛克{rt8}||[轉換]按房間機制切換需移動；[心控]；[衰減]||{rt1}必斷/速殺：無；按房間跑位{rt1}||坦：拉；輸出：轉火",
            },
        },
        ["加拉隆"] = {
            type = "BOSS",
            name = "加拉隆",
            tipsByDifficulty = {
                ["normal"] = "{rt8}加拉隆{rt8}||[腿]需打腿削弱本體；[踐踏]全團；[狂暴]計時||{rt1}必斷/速殺：無；打腿減傷{rt1}||坦：拉；輸出：打腿",
            },
        },
        ["风领主梅尔加拉克"] = {
            type = "BOSS",
            name = "風領主梅爾加拉克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}風領主梅爾加拉克{rt8}||[小怪]週期召喚需控；[旋風]；[狂暴]計時||{rt1}必斷/速殺：控/殺小怪；集火{rt1}||坦：拉；輸出：控小怪",
            },
        },
        ["女皇谢兹卡尔"] = {
            type = "BOSS",
            name = "女皇謝茲卡爾",
            tipsByDifficulty = {
                ["normal"] = "{rt8}女皇謝茲卡爾{rt8}||[毒]高傷dot需分散；[心控]點名；[狂暴]計時||{rt1}必斷/速殺：[心控]速斷救人；分散{rt1}||坦：拉；輸出：救人",
            },
        },
        ["剑圣塔亚克"] = {
            type = "BOSS",
            name = "劍聖塔亞克",
            tipsByDifficulty = {
                ["normal"] = "{rt8}劍聖塔亞克{rt8}||[疾風]推人；[刀]點名；[狂暴]計時||{rt1}必斷/速殺：無；躲疾風{rt1}||坦：拉；輸出：速殺",
            },
        },
    },
}
