-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["4.0"] = {
    ["风神王座"] = {
        name = "Throne of the Four Winds",
        ["奥拉基尔"] = {
            type = "BOSS",
            name = "Al'Akir",
            tipsByDifficulty = {
                ["lfr"] = "[Phase] wind/lightning/ice/earth rotate, [Lightning] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Phase] wind/lightning/ice/earth rotate, [Lightning] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Phase] wind/lightning/ice/earth rotate, [Lightning] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Phase] wind/lightning/ice/earth rotate, [Lightning] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Phase] wind/lightning/ice/earth rotate, [Lightning] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by phase{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["风之议会"] = {
            type = "BOSS",
            name = "Conclave of Wind",
            tipsByDifficulty = {
                ["lfr"] = "[Three Elements] need kill simultaneously prevent heal; [Wind/Lightning/Ice] mixed||{rt1}Must interrupt/burst: none; focus three elements together{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Elements] need kill simultaneously prevent heal; [Wind/Lightning/Ice] mixed||{rt1}Must interrupt/burst: none; focus three elements together{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Elements] need kill simultaneously prevent heal; [Wind/Lightning/Ice] mixed||{rt1}Must interrupt/burst: none; focus three elements together{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Elements] need kill simultaneously prevent heal; [Wind/Lightning/Ice] mixed||{rt1}Must interrupt/burst: none; focus three elements together{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Elements] need kill simultaneously prevent heal; [Wind/Lightning/Ice] mixed||{rt1}Must interrupt/burst: none; focus three elements together{rt1}||Tank: split tanks; DPS: focus",
            },
        },
    },
    ["巨龙之魂"] = {
        name = "Dragon Soul",
        ["莫卓克"] = {
            type = "BOSS",
            name = "Morchok",
            tipsByDifficulty = {
                ["lfr"] = "[Crystal] mark needs hit crystal share; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Crystal] marked hit crystal share{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Crystal] mark needs hit crystal share; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Crystal] marked hit crystal share{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Crystal] mark needs hit crystal share; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Crystal] marked hit crystal share{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Crystal] mark needs hit crystal share; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Crystal] marked hit crystal share{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Crystal] mark needs hit crystal share; [Stomp] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Crystal] marked hit crystal share{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["督军佐诺兹"] = {
            type = "BOSS",
            name = "Warlord Zon'ozz",
            tipsByDifficulty = {
                ["lfr"] = "[Black Ball] mark needs hit ball share; [Shadow] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Ball] marked hit ball{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Black Ball] mark needs hit ball share; [Shadow] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Ball] marked hit ball{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Black Ball] mark needs hit ball share; [Shadow] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Ball] marked hit ball{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Black Ball] mark needs hit ball share; [Shadow] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Ball] marked hit ball{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Black Ball] mark needs hit ball share; [Shadow] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Ball] marked hit ball{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["黑角"] = {
            type = "BOSS",
            name = "Blackhorn",
            tipsByDifficulty = {
                ["lfr"] = "[Ship Battle] need cannon hit dragon; [Descent] landing phase; [Transport]||{rt1}Must interrupt/burst: none; operate cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["normal"] = "[Ship Battle] need cannon hit dragon; [Descent] landing phase; [Transport]||{rt1}Must interrupt/burst: none; operate cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["heroic"] = "[Ship Battle] need cannon hit dragon; [Descent] landing phase; [Transport]||{rt1}Must interrupt/burst: none; operate cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["mythic"] = "[Ship Battle] need cannon hit dragon; [Descent] landing phase; [Transport]||{rt1}Must interrupt/burst: none; operate cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["mythicplus"] = "[Ship Battle] need cannon hit dragon; [Descent] landing phase; [Transport]||{rt1}Must interrupt/burst: none; operate cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
            },
        },
        ["不眠的约沙伊"] = {
            type = "BOSS",
            name = "Ultraxion",
            tipsByDifficulty = {
                ["lfr"] = "[Time] by sequence dodge [Twilight]; [Heroic] phase needs burst; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by time mechanic{rt1}||Tank: hold; DPS: heroic phase burst",
                ["normal"] = "[Time] by sequence dodge [Twilight]; [Heroic] phase needs burst; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by time mechanic{rt1}||Tank: hold; DPS: heroic phase burst",
                ["heroic"] = "[Time] by sequence dodge [Twilight]; [Heroic] phase needs burst; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by time mechanic{rt1}||Tank: hold; DPS: heroic phase burst",
                ["mythic"] = "[Time] by sequence dodge [Twilight]; [Heroic] phase needs burst; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by time mechanic{rt1}||Tank: hold; DPS: heroic phase burst",
                ["mythicplus"] = "[Time] by sequence dodge [Twilight]; [Heroic] phase needs burst; [Frenzy] timer||{rt1}Must interrupt/burst: none; move by time mechanic{rt1}||Tank: hold; DPS: heroic phase burst",
            },
        },
        ["死亡之翼的疯狂"] = {
            type = "BOSS",
            name = "The Madness of Deathwing",
            tipsByDifficulty = {
                ["lfr"] = "[Platform] multiple platforms rotate, [Blood] mark needs share; [Scorching]; P4[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Platform] multiple platforms rotate, [Blood] mark needs share; [Scorching]; P4[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Platform] multiple platforms rotate, [Blood] mark needs share; [Scorching]; P4[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Platform] multiple platforms rotate, [Blood] mark needs share; [Scorching]; P4[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Platform] multiple platforms rotate, [Blood] mark needs share; [Scorching]; P4[Body]||{rt1}Must interrupt/burst: none; [Blood] marked share{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["奥特拉希昂"] = {
            type = "BOSS",
            name = "Yor'sahj the Unsleeping",
            tipsByDifficulty = {
                ["lfr"] = "[Pus] by color decide kill order (red priority); [Tentacle]||{rt1}Must interrupt/burst: none; focus by color order{rt1}||Tank: hold; DPS: focus by color",
                ["normal"] = "[Pus] by color decide kill order (red priority); [Tentacle]||{rt1}Must interrupt/burst: none; focus by color order{rt1}||Tank: hold; DPS: focus by color",
                ["heroic"] = "[Pus] by color decide kill order (red priority); [Tentacle]||{rt1}Must interrupt/burst: none; focus by color order{rt1}||Tank: hold; DPS: focus by color",
                ["mythic"] = "[Pus] by color decide kill order (red priority); [Tentacle]||{rt1}Must interrupt/burst: none; focus by color order{rt1}||Tank: hold; DPS: focus by color",
                ["mythicplus"] = "[Pus] by color decide kill order (red priority); [Tentacle]||{rt1}Must interrupt/burst: none; focus by color order{rt1}||Tank: hold; DPS: focus by color",
            },
        },
        ["哈加拉·风暴绑缚者"] = {
            type = "BOSS",
            name = "Hagara the Stormbinder",
            tipsByDifficulty = {
                ["lfr"] = "[Ice/Lightning] two phase switch, ice needs [Ice Chain] link, lightning needs spread; [Storm]||{rt1}Must interrupt/burst: none; ice phase link chain lightning phase spread{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Ice/Lightning] two phase switch, ice needs [Ice Chain] link, lightning needs spread; [Storm]||{rt1}Must interrupt/burst: none; ice phase link chain lightning phase spread{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Ice/Lightning] two phase switch, ice needs [Ice Chain] link, lightning needs spread; [Storm]||{rt1}Must interrupt/burst: none; ice phase link chain lightning phase spread{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Ice/Lightning] two phase switch, ice needs [Ice Chain] link, lightning needs spread; [Storm]||{rt1}Must interrupt/burst: none; ice phase link chain lightning phase spread{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Ice/Lightning] two phase switch, ice needs [Ice Chain] link, lightning needs spread; [Storm]||{rt1}Must interrupt/burst: none; ice phase link chain lightning phase spread{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["死亡之翼的脊背"] = {
            type = "BOSS",
            name = "The Spine of Deathwing",
            tipsByDifficulty = {
                ["lfr"] = "[Armor] need hit corruption plate and [Bind] fix; [Tentacle] needs pull away; vehicle phase||{rt1}Must interrupt/burst: none; hit plate bind tentacle{rt1}||Tank: pull tentacle; DPS: hit plate",
                ["normal"] = "[Armor] need hit corruption plate and [Bind] fix; [Tentacle] needs pull away; vehicle phase||{rt1}Must interrupt/burst: none; hit plate bind tentacle{rt1}||Tank: pull tentacle; DPS: hit plate",
                ["heroic"] = "[Armor] need hit corruption plate and [Bind] fix; [Tentacle] needs pull away; vehicle phase||{rt1}Must interrupt/burst: none; hit plate bind tentacle{rt1}||Tank: pull tentacle; DPS: hit plate",
                ["mythic"] = "[Armor] need hit corruption plate and [Bind] fix; [Tentacle] needs pull away; vehicle phase||{rt1}Must interrupt/burst: none; hit plate bind tentacle{rt1}||Tank: pull tentacle; DPS: hit plate",
                ["mythicplus"] = "[Armor] need hit corruption plate and [Bind] fix; [Tentacle] needs pull away; vehicle phase||{rt1}Must interrupt/burst: none; hit plate bind tentacle{rt1}||Tank: pull tentacle; DPS: hit plate",
            },
        },
    },
    ["暮光堡垒"] = {
        name = "Bastion of Twilight",
        ["古加尔"] = {
            type = "BOSS",
            name = "Cho'gall",
            tipsByDifficulty = {
                ["lfr"] = "[Parasite] mark; [Shadow] dot; [Fire]; P2[Frenzy] speed up||{rt1}Must interrupt/burst: none; [Parasite] marked away{rt1}||Tank: hold; Healer: detox",
                ["normal"] = "[Parasite] mark; [Shadow] dot; [Fire]; P2[Frenzy] speed up||{rt1}Must interrupt/burst: none; [Parasite] marked away{rt1}||Tank: hold; Healer: detox",
                ["heroic"] = "[Parasite] mark; [Shadow] dot; [Fire]; P2[Frenzy] speed up||{rt1}Must interrupt/burst: none; [Parasite] marked away{rt1}||Tank: hold; Healer: detox",
                ["mythic"] = "[Parasite] mark; [Shadow] dot; [Fire]; P2[Frenzy] speed up||{rt1}Must interrupt/burst: none; [Parasite] marked away{rt1}||Tank: hold; Healer: detox",
                ["mythicplus"] = "[Parasite] mark; [Shadow] dot; [Fire]; P2[Frenzy] speed up||{rt1}Must interrupt/burst: none; [Parasite] marked away{rt1}||Tank: hold; Healer: detox",
            },
        },
        ["辛奈丝特拉"] = {
            type = "BOSS",
            name = "Sinestra",
            tipsByDifficulty = {
                ["lfr"] = "[Hatch] summon whelps needs clear; [Shadow] high damage; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear whelps{rt1}||Tank: hold; DPS: clear whelps",
                ["normal"] = "[Hatch] summon whelps needs clear; [Shadow] high damage; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear whelps{rt1}||Tank: hold; DPS: clear whelps",
                ["heroic"] = "[Hatch] summon whelps needs clear; [Shadow] high damage; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear whelps{rt1}||Tank: hold; DPS: clear whelps",
                ["mythic"] = "[Hatch] summon whelps needs clear; [Shadow] high damage; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear whelps{rt1}||Tank: hold; DPS: clear whelps",
                ["mythicplus"] = "[Hatch] summon whelps needs clear; [Shadow] high damage; [Frenzy] timer||{rt1}Must interrupt/burst: none; clear whelps{rt1}||Tank: hold; DPS: clear whelps",
            },
        },
        ["瓦里奥娜与瑟拉利昂"] = {
            type = "BOSS",
            name = "Valiona and Theralion",
            tipsByDifficulty = {
                ["lfr"] = "[Two Dragons] take turns enter, [Deep Breath] and [Meteor] need dodge; [Shadow] dot||{rt1}Must interrupt/burst: none; dodge deep breath and meteor{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Two Dragons] take turns enter, [Deep Breath] and [Meteor] need dodge; [Shadow] dot||{rt1}Must interrupt/burst: none; dodge deep breath and meteor{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Two Dragons] take turns enter, [Deep Breath] and [Meteor] need dodge; [Shadow] dot||{rt1}Must interrupt/burst: none; dodge deep breath and meteor{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Two Dragons] take turns enter, [Deep Breath] and [Meteor] need dodge; [Shadow] dot||{rt1}Must interrupt/burst: none; dodge deep breath and meteor{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Two Dragons] take turns enter, [Deep Breath] and [Meteor] need dodge; [Shadow] dot||{rt1}Must interrupt/burst: none; dodge deep breath and meteor{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["晋升者议会"] = {
            type = "BOSS",
            name = "Council of Exarchs",
            tipsByDifficulty = {
                ["lfr"] = "[Four Elements] fire/ice/earth/wind phase, need interrupt corresponding; [Fusion]||{rt1}Must interrupt/burst: interrupt by element; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Four Elements] fire/ice/earth/wind phase, need interrupt corresponding; [Fusion]||{rt1}Must interrupt/burst: interrupt by element; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Four Elements] fire/ice/earth/wind phase, need interrupt corresponding; [Fusion]||{rt1}Must interrupt/burst: interrupt by element; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Four Elements] fire/ice/earth/wind phase, need interrupt corresponding; [Fusion]||{rt1}Must interrupt/burst: interrupt by element; split focus{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Four Elements] fire/ice/earth/wind phase, need interrupt corresponding; [Fusion]||{rt1}Must interrupt/burst: interrupt by element; split focus{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["哈尔弗斯·碎龙者"] = {
            type = "BOSS",
            name = "Halfus Wyrmbreaker",
            tipsByDifficulty = {
                ["lfr"] = "[Dragons] bound different dragons give buff, need kill corresponding dragon first weaken; [Timer] timer||{rt1}Must interrupt/burst: none; by dragon buff decide kill order{rt1}||Tank: hold; DPS: focus dragon",
                ["normal"] = "[Dragons] bound different dragons give buff, need kill corresponding dragon first weaken; [Timer] timer||{rt1}Must interrupt/burst: none; by dragon buff decide kill order{rt1}||Tank: hold; DPS: focus dragon",
                ["heroic"] = "[Dragons] bound different dragons give buff, need kill corresponding dragon first weaken; [Timer] timer||{rt1}Must interrupt/burst: none; by dragon buff decide kill order{rt1}||Tank: hold; DPS: focus dragon",
                ["mythic"] = "[Dragons] bound different dragons give buff, need kill corresponding dragon first weaken; [Timer] timer||{rt1}Must interrupt/burst: none; by dragon buff decide kill order{rt1}||Tank: hold; DPS: focus dragon",
                ["mythicplus"] = "[Dragons] bound different dragons give buff, need kill corresponding dragon first weaken; [Timer] timer||{rt1}Must interrupt/burst: none; by dragon buff decide kill order{rt1}||Tank: hold; DPS: focus dragon",
            },
        },
    },
    ["黑翼血环"] = {
        name = "Blackwing Descent",
        ["欧姆诺顿防御系统"] = {
            type = "BOSS",
            name = "Omnotron Defense System",
            tipsByDifficulty = {
                ["lfr"] = "[Four Robots] poison/fire/ice/lightning rotate activate, need corresponding respond; [Switch]||{rt1}Must interrupt/burst: interrupt by active robot; focus{rt1}||Tank: hold; DPS: focus by active",
                ["normal"] = "[Four Robots] poison/fire/ice/lightning rotate activate, need corresponding respond; [Switch]||{rt1}Must interrupt/burst: interrupt by active robot; focus{rt1}||Tank: hold; DPS: focus by active",
                ["heroic"] = "[Four Robots] poison/fire/ice/lightning rotate activate, need corresponding respond; [Switch]||{rt1}Must interrupt/burst: interrupt by active robot; focus{rt1}||Tank: hold; DPS: focus by active",
                ["mythic"] = "[Four Robots] poison/fire/ice/lightning rotate activate, need corresponding respond; [Switch]||{rt1}Must interrupt/burst: interrupt by active robot; focus{rt1}||Tank: hold; DPS: focus by active",
                ["mythicplus"] = "[Four Robots] poison/fire/ice/lightning rotate activate, need corresponding respond; [Switch]||{rt1}Must interrupt/burst: interrupt by active robot; focus{rt1}||Tank: hold; DPS: focus by active",
            },
        },
        ["玛格玛尔"] = {
            type = "BOSS",
            name = "Magmaw",
            tipsByDifficulty = {
                ["lfr"] = "[Chain] need pull head to [Spike] pin reduce damage; [Flame] front||{rt1}Must interrupt/burst: none; pull head pin{rt1}||Tank: pull head; DPS: pin",
                ["normal"] = "[Chain] need pull head to [Spike] pin reduce damage; [Flame] front||{rt1}Must interrupt/burst: none; pull head pin{rt1}||Tank: pull head; DPS: pin",
                ["heroic"] = "[Chain] need pull head to [Spike] pin reduce damage; [Flame] front||{rt1}Must interrupt/burst: none; pull head pin{rt1}||Tank: pull head; DPS: pin",
                ["mythic"] = "[Chain] need pull head to [Spike] pin reduce damage; [Flame] front||{rt1}Must interrupt/burst: none; pull head pin{rt1}||Tank: pull head; DPS: pin",
                ["mythicplus"] = "[Chain] need pull head to [Spike] pin reduce damage; [Flame] front||{rt1}Must interrupt/burst: none; pull head pin{rt1}||Tank: pull head; DPS: pin",
            },
        },
        ["奇美隆"] = {
            type = "BOSS",
            name = "Chimaeron",
            tipsByDifficulty = {
                ["lfr"] = "[Double Attack] lethal needs dual tank; [Annihilation] raid wipe needs heal up; [Toxic] dot||{rt1}Must interrupt/burst: none; [Annihilation] all survive{rt1}||Tank: dual tank; Healer: annihilation burst",
                ["normal"] = "[Double Attack] lethal needs dual tank; [Annihilation] raid wipe needs heal up; [Toxic] dot||{rt1}Must interrupt/burst: none; [Annihilation] all survive{rt1}||Tank: dual tank; Healer: annihilation burst",
                ["heroic"] = "[Double Attack] lethal needs dual tank; [Annihilation] raid wipe needs heal up; [Toxic] dot||{rt1}Must interrupt/burst: none; [Annihilation] all survive{rt1}||Tank: dual tank; Healer: annihilation burst",
                ["mythic"] = "[Double Attack] lethal needs dual tank; [Annihilation] raid wipe needs heal up; [Toxic] dot||{rt1}Must interrupt/burst: none; [Annihilation] all survive{rt1}||Tank: dual tank; Healer: annihilation burst",
                ["mythicplus"] = "[Double Attack] lethal needs dual tank; [Annihilation] raid wipe needs heal up; [Toxic] dot||{rt1}Must interrupt/burst: none; [Annihilation] all survive{rt1}||Tank: dual tank; Healer: annihilation burst",
            },
        },
        ["阿特拉米德"] = {
            type = "BOSS",
            name = "Atramedes",
            tipsByDifficulty = {
                ["lfr"] = "[Sound Wave] needs watch ground circle dodge; [Tracking] mark; [Silence]||{rt1}Must interrupt/burst: none; dodge sound circle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Sound Wave] needs watch ground circle dodge; [Tracking] mark; [Silence]||{rt1}Must interrupt/burst: none; dodge sound circle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Sound Wave] needs watch ground circle dodge; [Tracking] mark; [Silence]||{rt1}Must interrupt/burst: none; dodge sound circle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Sound Wave] needs watch ground circle dodge; [Tracking] mark; [Silence]||{rt1}Must interrupt/burst: none; dodge sound circle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Sound Wave] needs watch ground circle dodge; [Tracking] mark; [Silence]||{rt1}Must interrupt/burst: none; dodge sound circle{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["奈法利安"] = {
            type = "BOSS",
            name = "Nefarian",
            tipsByDifficulty = {
                ["lfr"] = "[Class Debuff] randomly gives a class negative; P2[Revived Paladin] needs handling at bone pile||{rt1}Must interrupt/burst: none; P2 prioritize clearing revived bone pile{rt1}||Tank: hold; DPS: P2 focus bone pile",
                ["normal"] = "[Class Debuff] randomly gives a class negative; P2[Revived Paladin] needs handling at bone pile||{rt1}Must interrupt/burst: none; P2 prioritize clearing revived bone pile{rt1}||Tank: hold; DPS: P2 focus bone pile",
                ["heroic"] = "[Class Debuff] randomly gives a class negative; P2[Revived Paladin] needs handling at bone pile||{rt1}Must interrupt/burst: none; P2 prioritize clearing revived bone pile{rt1}||Tank: hold; DPS: P2 focus bone pile",
                ["mythic"] = "[Class Debuff] randomly gives a class negative; P2[Revived Paladin] needs handling at bone pile||{rt1}Must interrupt/burst: none; P2 prioritize clearing revived bone pile{rt1}||Tank: hold; DPS: P2 focus bone pile",
                ["mythicplus"] = "[Class Debuff] randomly gives a class negative; P2[Revived Paladin] needs handling at bone pile||{rt1}Must interrupt/burst: none; P2 prioritize clearing revived bone pile{rt1}||Tank: hold; DPS: P2 focus bone pile",
            },
        },
        ["玛洛拉克"] = {
            type = "BOSS",
            name = "Malorak",
            tipsByDifficulty = {
                ["lfr"] = "[Test Tube] need by color interrupt corresponding; [Release] phase; [Fire/Ice]||{rt1}Must interrupt/burst: interrupt by tube color; focus{rt1}||Tank: hold; DPS: control tube",
                ["normal"] = "[Test Tube] need by color interrupt corresponding; [Release] phase; [Fire/Ice]||{rt1}Must interrupt/burst: interrupt by tube color; focus{rt1}||Tank: hold; DPS: control tube",
                ["heroic"] = "[Test Tube] need by color interrupt corresponding; [Release] phase; [Fire/Ice]||{rt1}Must interrupt/burst: interrupt by tube color; focus{rt1}||Tank: hold; DPS: control tube",
                ["mythic"] = "[Test Tube] need by color interrupt corresponding; [Release] phase; [Fire/Ice]||{rt1}Must interrupt/burst: interrupt by tube color; focus{rt1}||Tank: hold; DPS: control tube",
                ["mythicplus"] = "[Test Tube] need by color interrupt corresponding; [Release] phase; [Fire/Ice]||{rt1}Must interrupt/burst: interrupt by tube color; focus{rt1}||Tank: hold; DPS: control tube",
            },
        },
    },
    ["火焰之地"] = {
        name = "Firelands",
        ["奥利瑟拉佐尔"] = {
            type = "BOSS",
            name = "Alysrazor",
            tipsByDifficulty = {
                ["lfr"] = "[Flight] phase needs eat [Ash] keep fire; [Dive]; [Reborn]||{rt1}Must interrupt/burst: none; eat ash maintain, dodge dive{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Flight] phase needs eat [Ash] keep fire; [Dive]; [Reborn]||{rt1}Must interrupt/burst: none; eat ash maintain, dodge dive{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Flight] phase needs eat [Ash] keep fire; [Dive]; [Reborn]||{rt1}Must interrupt/burst: none; eat ash maintain, dodge dive{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Flight] phase needs eat [Ash] keep fire; [Dive]; [Reborn]||{rt1}Must interrupt/burst: none; eat ash maintain, dodge dive{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Flight] phase needs eat [Ash] keep fire; [Dive]; [Reborn]||{rt1}Must interrupt/burst: none; eat ash maintain, dodge dive{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["贝丝蒂拉克"] = {
            type = "BOSS",
            name = "Beth'tilac",
            tipsByDifficulty = {
                ["lfr"] = "[Web] go up spider web hit eggs; [Drop] phase land; [Poison] dot||{rt1}Must interrupt/burst: none; web clear eggs, land focus{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Web] go up spider web hit eggs; [Drop] phase land; [Poison] dot||{rt1}Must interrupt/burst: none; web clear eggs, land focus{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Web] go up spider web hit eggs; [Drop] phase land; [Poison] dot||{rt1}Must interrupt/burst: none; web clear eggs, land focus{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Web] go up spider web hit eggs; [Drop] phase land; [Poison] dot||{rt1}Must interrupt/burst: none; web clear eggs, land focus{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Web] go up spider web hit eggs; [Drop] phase land; [Poison] dot||{rt1}Must interrupt/burst: none; web clear eggs, land focus{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["大管家斯塔格海尔"] = {
            type = "BOSS",
            name = "Fandral Staghelm",
            tipsByDifficulty = {
                ["lfr"] = "[Poison/Fire] two form switch needs change positioning; [Scorpion] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; change positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Poison/Fire] two form switch needs change positioning; [Scorpion] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; change positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Poison/Fire] two form switch needs change positioning; [Scorpion] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; change positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Poison/Fire] two form switch needs change positioning; [Scorpion] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; change positioning by form{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Poison/Fire] two form switch needs change positioning; [Scorpion] phase; [Frenzy] timer||{rt1}Must interrupt/burst: none; change positioning by form{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["拉格纳罗斯"] = {
            type = "BOSS",
            name = "Ragnaros",
            tipsByDifficulty = {
                ["lfr"] = "[Living Bomb] mark then explodes needs away; [Knockback] periodic knock tank; P2[Sons] need focus||{rt1}Must interrupt/burst: none; [Living Bomb] marked run out of group{rt1}||Tank: return after knockback; DPS: P2 focus sons",
                ["normal"] = "[Living Bomb] mark then explodes needs away; [Knockback] periodic knock tank; P2[Sons] need focus||{rt1}Must interrupt/burst: none; [Living Bomb] marked run out of group{rt1}||Tank: return after knockback; DPS: P2 focus sons",
                ["heroic"] = "[Living Bomb] mark then explodes needs away; [Knockback] periodic knock tank; P2[Sons] need focus||{rt1}Must interrupt/burst: none; [Living Bomb] marked run out of group{rt1}||Tank: return after knockback; DPS: P2 focus sons",
                ["mythic"] = "[Living Bomb] mark then explodes needs away; [Knockback] periodic knock tank; P2[Sons] need focus||{rt1}Must interrupt/burst: none; [Living Bomb] marked run out of group{rt1}||Tank: return after knockback; DPS: P2 focus sons",
                ["mythicplus"] = "[Living Bomb] mark then explodes needs away; [Knockback] periodic knock tank; P2[Sons] need focus||{rt1}Must interrupt/burst: none; [Living Bomb] marked run out of group{rt1}||Tank: return after knockback; DPS: P2 focus sons",
            },
        },
        ["沙诺克斯"] = {
            type = "BOSS",
            name = "Shannox",
            tipsByDifficulty = {
                ["lfr"] = "[Trap] place needs pull dog step; [Frenzy] dog; [Fire]||{rt1}Must interrupt/burst: none; pull dog step trap{rt1}||Tank: hold; DPS: control dog",
                ["normal"] = "[Trap] place needs pull dog step; [Frenzy] dog; [Fire]||{rt1}Must interrupt/burst: none; pull dog step trap{rt1}||Tank: hold; DPS: control dog",
                ["heroic"] = "[Trap] place needs pull dog step; [Frenzy] dog; [Fire]||{rt1}Must interrupt/burst: none; pull dog step trap{rt1}||Tank: hold; DPS: control dog",
                ["mythic"] = "[Trap] place needs pull dog step; [Frenzy] dog; [Fire]||{rt1}Must interrupt/burst: none; pull dog step trap{rt1}||Tank: hold; DPS: control dog",
                ["mythicplus"] = "[Trap] place needs pull dog step; [Frenzy] dog; [Fire]||{rt1}Must interrupt/burst: none; pull dog step trap{rt1}||Tank: hold; DPS: control dog",
            },
        },
        ["莱诺斯领主"] = {
            type = "BOSS",
            name = "Lord Rhyolith",
            tipsByDifficulty = {
                ["lfr"] = "[Foot] needs hit leg control move; [Lava] landing||{rt1}Must interrupt/burst: none; hit leg limit move{rt1}||Tank: hold; DPS: hit leg",
                ["normal"] = "[Foot] needs hit leg control move; [Lava] landing||{rt1}Must interrupt/burst: none; hit leg limit move{rt1}||Tank: hold; DPS: hit leg",
                ["heroic"] = "[Foot] needs hit leg control move; [Lava] landing||{rt1}Must interrupt/burst: none; hit leg limit move{rt1}||Tank: hold; DPS: hit leg",
                ["mythic"] = "[Foot] needs hit leg control move; [Lava] landing||{rt1}Must interrupt/burst: none; hit leg limit move{rt1}||Tank: hold; DPS: hit leg",
                ["mythicplus"] = "[Foot] needs hit leg control move; [Lava] landing||{rt1}Must interrupt/burst: none; hit leg limit move{rt1}||Tank: hold; DPS: hit leg",
            },
        },
        ["巴拉克雷斯"] = {
            type = "BOSS",
            name = "Baleroc",
            tipsByDifficulty = {
                ["lfr"] = "[Shield] needs focus break; [Blade] mark; [Healer] add||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: control add",
                ["normal"] = "[Shield] needs focus break; [Blade] mark; [Healer] add||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: control add",
                ["heroic"] = "[Shield] needs focus break; [Blade] mark; [Healer] add||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: control add",
                ["mythic"] = "[Shield] needs focus break; [Blade] mark; [Healer] add||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: control add",
                ["mythicplus"] = "[Shield] needs focus break; [Blade] mark; [Healer] add||{rt1}Must interrupt/burst: none; focus break shield{rt1}||Tank: hold; DPS: control add",
            },
        },
    },
}
