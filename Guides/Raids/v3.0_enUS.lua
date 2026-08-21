-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["3.0"] = {
    ["红玉圣殿"] = {
        name = "Ruby Sanctum",
        ["海里昂"] = {
            type = "BOSS",
            name = "Halion",
            tipsByDifficulty = {
                ["lfr"] = "[Dual Space] real/dream, need enter portal hit clone; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus clone{rt1}||Tank: hold; DPS: enter portal",
                ["normal"] = "[Dual Space] real/dream, need enter portal hit clone; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus clone{rt1}||Tank: hold; DPS: enter portal",
                ["heroic"] = "[Dual Space] real/dream, need enter portal hit clone; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus clone{rt1}||Tank: hold; DPS: enter portal",
                ["mythic"] = "[Dual Space] real/dream, need enter portal hit clone; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus clone{rt1}||Tank: hold; DPS: enter portal",
                ["mythicplus"] = "[Dual Space] real/dream, need enter portal hit clone; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter portal focus clone{rt1}||Tank: hold; DPS: enter portal",
            },
        },
    },
    ["纳克萨玛斯"] = {
        name = "Naxxramas",
        ["黑女巫法琳娜"] = {
            type = "BOSS",
            name = "Black Witch Faline",
            tipsByDifficulty = {
                ["lfr"] = "[Frenzy] stacks then wipes raid, suppress by interrupting [Lash]||{rt1}Must interrupt/burst: [Lash] must be continuously interrupted to prevent frenzy{rt1}||Tank: hold; DPS: assign lash interrupts",
                ["normal"] = "[Frenzy] stacks then wipes raid, suppress by interrupting [Lash]||{rt1}Must interrupt/burst: [Lash] must be continuously interrupted to prevent frenzy{rt1}||Tank: hold; DPS: assign lash interrupts",
                ["heroic"] = "[Frenzy] stacks then wipes raid, suppress by interrupting [Lash]||{rt1}Must interrupt/burst: [Lash] must be continuously interrupted to prevent frenzy{rt1}||Tank: hold; DPS: assign lash interrupts",
                ["mythic"] = "[Frenzy] stacks then wipes raid, suppress by interrupting [Lash]||{rt1}Must interrupt/burst: [Lash] must be continuously interrupted to prevent frenzy{rt1}||Tank: hold; DPS: assign lash interrupts",
                ["mythicplus"] = "[Frenzy] stacks then wipes raid, suppress by interrupting [Lash]||{rt1}Must interrupt/burst: [Lash] must be continuously interrupted to prevent frenzy{rt1}||Tank: hold; DPS: assign lash interrupts",
            },
        },
        ["收割者戈提克"] = {
            type = "BOSS",
            name = "Gothik the Harvester",
            tipsByDifficulty = {
                ["lfr"] = "[Two Side Doors] living side and dead side, switch sides on rhythm to focus||{rt1}Must interrupt/burst: none; switch sides as directed{rt1}||Tank: split tanks; DPS: switch side focus",
                ["normal"] = "[Two Side Doors] living side and dead side, switch sides on rhythm to focus||{rt1}Must interrupt/burst: none; switch sides as directed{rt1}||Tank: split tanks; DPS: switch side focus",
                ["heroic"] = "[Two Side Doors] living side and dead side, switch sides on rhythm to focus||{rt1}Must interrupt/burst: none; switch sides as directed{rt1}||Tank: split tanks; DPS: switch side focus",
                ["mythic"] = "[Two Side Doors] living side and dead side, switch sides on rhythm to focus||{rt1}Must interrupt/burst: none; switch sides as directed{rt1}||Tank: split tanks; DPS: switch side focus",
                ["mythicplus"] = "[Two Side Doors] living side and dead side, switch sides on rhythm to focus||{rt1}Must interrupt/burst: none; switch sides as directed{rt1}||Tank: split tanks; DPS: switch side focus",
            },
        },
        ["肮脏的希尔盖"] = {
            type = "BOSS",
            name = "Heigan the Unclean",
            tipsByDifficulty = {
                ["lfr"] = "[Dance] classic positioning mechanic, stepping on death circle dies, need to move with rhythm||{rt1}Must interrupt/burst: none; strictly follow safe-circle positioning{rt1}||Tank: hold; DPS: output while moving",
                ["normal"] = "[Dance] classic positioning mechanic, stepping on death circle dies, need to move with rhythm||{rt1}Must interrupt/burst: none; strictly follow safe-circle positioning{rt1}||Tank: hold; DPS: output while moving",
                ["heroic"] = "[Dance] classic positioning mechanic, stepping on death circle dies, need to move with rhythm||{rt1}Must interrupt/burst: none; strictly follow safe-circle positioning{rt1}||Tank: hold; DPS: output while moving",
                ["mythic"] = "[Dance] classic positioning mechanic, stepping on death circle dies, need to move with rhythm||{rt1}Must interrupt/burst: none; strictly follow safe-circle positioning{rt1}||Tank: hold; DPS: output while moving",
                ["mythicplus"] = "[Dance] classic positioning mechanic, stepping on death circle dies, need to move with rhythm||{rt1}Must interrupt/burst: none; strictly follow safe-circle positioning{rt1}||Tank: hold; DPS: output while moving",
            },
        },
        ["萨菲隆"] = {
            type = "BOSS",
            name = "Sapphiron",
            tipsByDifficulty = {
                ["lfr"] = "[Ice Tomb] freeze mark needs to move away; [Deep Breath] sweep dodge to flank||{rt1}Must interrupt/burst: none; run away when marked by Ice Tomb, dodge Deep Breath to side{rt1}||Tank: hold; DPS: dodge mechanics",
                ["normal"] = "[Ice Tomb] freeze mark needs to move away; [Deep Breath] sweep dodge to flank||{rt1}Must interrupt/burst: none; run away when marked by Ice Tomb, dodge Deep Breath to side{rt1}||Tank: hold; DPS: dodge mechanics",
                ["heroic"] = "[Ice Tomb] freeze mark needs to move away; [Deep Breath] sweep dodge to flank||{rt1}Must interrupt/burst: none; run away when marked by Ice Tomb, dodge Deep Breath to side{rt1}||Tank: hold; DPS: dodge mechanics",
                ["mythic"] = "[Ice Tomb] freeze mark needs to move away; [Deep Breath] sweep dodge to flank||{rt1}Must interrupt/burst: none; run away when marked by Ice Tomb, dodge Deep Breath to side{rt1}||Tank: hold; DPS: dodge mechanics",
                ["mythicplus"] = "[Ice Tomb] freeze mark needs to move away; [Deep Breath] sweep dodge to flank||{rt1}Must interrupt/burst: none; run away when marked by Ice Tomb, dodge Deep Breath to side{rt1}||Tank: hold; DPS: dodge mechanics",
            },
        },
        ["教官拉苏维奥斯"] = {
            type = "BOSS",
            name = "Instructor Razuvious",
            tipsByDifficulty = {
                ["lfr"] = "[Need Apprentice] control adds to cast commands on him, otherwise wipe||{rt1}Must interrupt/burst: none; control adds use [Command] to interrupt boss{rt1}||Tank: boss controlled by student; DPS: control adds",
                ["normal"] = "[Need Apprentice] control adds to cast commands on him, otherwise wipe||{rt1}Must interrupt/burst: none; control adds use [Command] to interrupt boss{rt1}||Tank: boss controlled by student; DPS: control adds",
                ["heroic"] = "[Need Apprentice] control adds to cast commands on him, otherwise wipe||{rt1}Must interrupt/burst: none; control adds use [Command] to interrupt boss{rt1}||Tank: boss controlled by student; DPS: control adds",
                ["mythic"] = "[Need Apprentice] control adds to cast commands on him, otherwise wipe||{rt1}Must interrupt/burst: none; control adds use [Command] to interrupt boss{rt1}||Tank: boss controlled by student; DPS: control adds",
                ["mythicplus"] = "[Need Apprentice] control adds to cast commands on him, otherwise wipe||{rt1}Must interrupt/burst: none; control adds use [Command] to interrupt boss{rt1}||Tank: boss controlled by student; DPS: control adds",
            },
        },
        ["阿努布雷坎"] = {
            type = "BOSS",
            name = "Anub'Rekhan",
            tipsByDifficulty = {
                ["lfr"] = "[Locust Swarm] mark chases people needs continuous running; [Summon Crypt Guards] needs tank to pick up||{rt1}Must interrupt/burst: none; those chased by [Locust Swarm] run in circles{rt1}||Tank: pick up guards; DPS: clear bugs",
                ["normal"] = "[Locust Swarm] mark chases people needs continuous running; [Summon Crypt Guards] needs tank to pick up||{rt1}Must interrupt/burst: none; those chased by [Locust Swarm] run in circles{rt1}||Tank: pick up guards; DPS: clear bugs",
                ["heroic"] = "[Locust Swarm] mark chases people needs continuous running; [Summon Crypt Guards] needs tank to pick up||{rt1}Must interrupt/burst: none; those chased by [Locust Swarm] run in circles{rt1}||Tank: pick up guards; DPS: clear bugs",
                ["mythic"] = "[Locust Swarm] mark chases people needs continuous running; [Summon Crypt Guards] needs tank to pick up||{rt1}Must interrupt/burst: none; those chased by [Locust Swarm] run in circles{rt1}||Tank: pick up guards; DPS: clear bugs",
                ["mythicplus"] = "[Locust Swarm] mark chases people needs continuous running; [Summon Crypt Guards] needs tank to pick up||{rt1}Must interrupt/burst: none; those chased by [Locust Swarm] run in circles{rt1}||Tank: pick up guards; DPS: clear bugs",
            },
        },
        ["格拉斯"] = {
            type = "BOSS",
            name = "Gluth",
            tipsByDifficulty = {
                ["lfr"] = "[Decimate] devours adds to heal, need to control adds; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds to prevent healing{rt1}||Tank: hold; DPS: control adds",
                ["normal"] = "[Decimate] devours adds to heal, need to control adds; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds to prevent healing{rt1}||Tank: hold; DPS: control adds",
                ["heroic"] = "[Decimate] devours adds to heal, need to control adds; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds to prevent healing{rt1}||Tank: hold; DPS: control adds",
                ["mythic"] = "[Decimate] devours adds to heal, need to control adds; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds to prevent healing{rt1}||Tank: hold; DPS: control adds",
                ["mythicplus"] = "[Decimate] devours adds to heal, need to control adds; [Frenzy] timer||{rt1}Must interrupt/burst: control/kill adds to prevent healing{rt1}||Tank: hold; DPS: control adds",
            },
        },
        ["格罗布鲁斯"] = {
            type = "BOSS",
            name = "Grobbulus",
            tipsByDifficulty = {
                ["lfr"] = "[Poison Cloud] expands after placed, need to move while placing||{rt1}Must interrupt/burst: none; move while placing poison to avoid stacking clouds{rt1}||Tank: hold and move; DPS: follow movement",
                ["normal"] = "[Poison Cloud] expands after placed, need to move while placing||{rt1}Must interrupt/burst: none; move while placing poison to avoid stacking clouds{rt1}||Tank: hold and move; DPS: follow movement",
                ["heroic"] = "[Poison Cloud] expands after placed, need to move while placing||{rt1}Must interrupt/burst: none; move while placing poison to avoid stacking clouds{rt1}||Tank: hold and move; DPS: follow movement",
                ["mythic"] = "[Poison Cloud] expands after placed, need to move while placing||{rt1}Must interrupt/burst: none; move while placing poison to avoid stacking clouds{rt1}||Tank: hold and move; DPS: follow movement",
                ["mythicplus"] = "[Poison Cloud] expands after placed, need to move while placing||{rt1}Must interrupt/burst: none; move while placing poison to avoid stacking clouds{rt1}||Tank: hold and move; DPS: follow movement",
            },
        },
        ["迈克斯纳"] = {
            type = "BOSS",
            name = "Maexxna",
            tipsByDifficulty = {
                ["lfr"] = "[Web] root; [Poison] dot; [Spiders] spawn||{rt1}Must interrupt/burst: none; webbed wait for rescue{rt1}||Tank: hold; DPS: clear spiders",
                ["normal"] = "[Web] root; [Poison] dot; [Spiders] spawn||{rt1}Must interrupt/burst: none; webbed wait for rescue{rt1}||Tank: hold; DPS: clear spiders",
                ["heroic"] = "[Web] root; [Poison] dot; [Spiders] spawn||{rt1}Must interrupt/burst: none; webbed wait for rescue{rt1}||Tank: hold; DPS: clear spiders",
                ["mythic"] = "[Web] root; [Poison] dot; [Spiders] spawn||{rt1}Must interrupt/burst: none; webbed wait for rescue{rt1}||Tank: hold; DPS: clear spiders",
                ["mythicplus"] = "[Web] root; [Poison] dot; [Spiders] spawn||{rt1}Must interrupt/burst: none; webbed wait for rescue{rt1}||Tank: hold; DPS: clear spiders",
            },
        },
        ["药剂师诺斯"] = {
            type = "BOSS",
            name = "Apothecary Raz",
            tipsByDifficulty = {
                ["lfr"] = "[Teleport] reposition; [Frost] periodic raid-wide frost damage||{rt1}Must interrupt/burst: none; quickly find position after teleport{rt1}||Tank: hold; Healer: raid-heal frost",
                ["normal"] = "[Teleport] reposition; [Frost] periodic raid-wide frost damage||{rt1}Must interrupt/burst: none; quickly find position after teleport{rt1}||Tank: hold; Healer: raid-heal frost",
                ["heroic"] = "[Teleport] reposition; [Frost] periodic raid-wide frost damage||{rt1}Must interrupt/burst: none; quickly find position after teleport{rt1}||Tank: hold; Healer: raid-heal frost",
                ["mythic"] = "[Teleport] reposition; [Frost] periodic raid-wide frost damage||{rt1}Must interrupt/burst: none; quickly find position after teleport{rt1}||Tank: hold; Healer: raid-heal frost",
                ["mythicplus"] = "[Teleport] reposition; [Frost] periodic raid-wide frost damage||{rt1}Must interrupt/burst: none; quickly find position after teleport{rt1}||Tank: hold; Healer: raid-heal frost",
            },
        },
        ["塔迪乌斯"] = {
            type = "BOSS",
            name = "Thaddius",
            tipsByDifficulty = {
                ["lfr"] = "[Polarity] positive/negative charge, same polarity near takes damage, opposite heals, need to switch sides||{rt1}Must interrupt/burst: none; stand on side by polarity{rt1}||Tank: by polarity; DPS: switch sides",
                ["normal"] = "[Polarity] positive/negative charge, same polarity near takes damage, opposite heals, need to switch sides||{rt1}Must interrupt/burst: none; stand on side by polarity{rt1}||Tank: by polarity; DPS: switch sides",
                ["heroic"] = "[Polarity] positive/negative charge, same polarity near takes damage, opposite heals, need to switch sides||{rt1}Must interrupt/burst: none; stand on side by polarity{rt1}||Tank: by polarity; DPS: switch sides",
                ["mythic"] = "[Polarity] positive/negative charge, same polarity near takes damage, opposite heals, need to switch sides||{rt1}Must interrupt/burst: none; stand on side by polarity{rt1}||Tank: by polarity; DPS: switch sides",
                ["mythicplus"] = "[Polarity] positive/negative charge, same polarity near takes damage, opposite heals, need to switch sides||{rt1}Must interrupt/burst: none; stand on side by polarity{rt1}||Tank: by polarity; DPS: switch sides",
            },
        },
        ["天启四骑士"] = {
            type = "BOSS",
            name = "Four Horsemen",
            tipsByDifficulty = {
                ["lfr"] = "[Mark] stack swap tank, 4 tanks spread; shared threat mechanic||{rt1}Must interrupt/burst: none; mark stacks swap tank to avoid instant death{rt1}||Tank: 4 tanks spread swap; Healer: split sides",
                ["normal"] = "[Mark] stack swap tank, 4 tanks spread; shared threat mechanic||{rt1}Must interrupt/burst: none; mark stacks swap tank to avoid instant death{rt1}||Tank: 4 tanks spread swap; Healer: split sides",
                ["heroic"] = "[Mark] stack swap tank, 4 tanks spread; shared threat mechanic||{rt1}Must interrupt/burst: none; mark stacks swap tank to avoid instant death{rt1}||Tank: 4 tanks spread swap; Healer: split sides",
                ["mythic"] = "[Mark] stack swap tank, 4 tanks spread; shared threat mechanic||{rt1}Must interrupt/burst: none; mark stacks swap tank to avoid instant death{rt1}||Tank: 4 tanks spread swap; Healer: split sides",
                ["mythicplus"] = "[Mark] stack swap tank, 4 tanks spread; shared threat mechanic||{rt1}Must interrupt/burst: none; mark stacks swap tank to avoid instant death{rt1}||Tank: 4 tanks spread swap; Healer: split sides",
            },
        },
        ["克尔苏加德"] = {
            type = "BOSS",
            name = "Kel'Thuzad",
            tipsByDifficulty = {
                ["lfr"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["normal"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["heroic"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["mythic"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
                ["mythicplus"] = "P1[Adds]; P2[Frost] shield; P3[Mind Control] mark needs interrupt to rescue||{rt1}Must interrupt/burst: P3[Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: P1 clear adds, P3 rescue",
            },
        },
        ["帕奇维克"] = {
            type = "BOSS",
            name = "Patchwerk",
            tipsByDifficulty = {
                ["lfr"] = "[Frenzy] melee fight, high auto-attack; time-limited kill||{rt1}Must interrupt/burst: none; tank eats damage hard{rt1}||Tank: main tank tank hard; Healer: pre-cast",
                ["normal"] = "[Frenzy] melee fight, high auto-attack; time-limited kill||{rt1}Must interrupt/burst: none; tank eats damage hard{rt1}||Tank: main tank tank hard; Healer: pre-cast",
                ["heroic"] = "[Frenzy] melee fight, high auto-attack; time-limited kill||{rt1}Must interrupt/burst: none; tank eats damage hard{rt1}||Tank: main tank tank hard; Healer: pre-cast",
                ["mythic"] = "[Frenzy] melee fight, high auto-attack; time-limited kill||{rt1}Must interrupt/burst: none; tank eats damage hard{rt1}||Tank: main tank tank hard; Healer: pre-cast",
                ["mythicplus"] = "[Frenzy] melee fight, high auto-attack; time-limited kill||{rt1}Must interrupt/burst: none; tank eats damage hard{rt1}||Tank: main tank tank hard; Healer: pre-cast",
            },
        },
        ["洛欧塞布"] = {
            type = "BOSS",
            name = "Loatheb",
            tipsByDifficulty = {
                ["lfr"] = "[Spore] heal inside cloud; [Healing Inhibit] periodically forbids healing||{rt1}Must interrupt/burst: none; healers burst heal during spore window{rt1}||Tank: hold; Healer: burst during spore",
                ["normal"] = "[Spore] heal inside cloud; [Healing Inhibit] periodically forbids healing||{rt1}Must interrupt/burst: none; healers burst heal during spore window{rt1}||Tank: hold; Healer: burst during spore",
                ["heroic"] = "[Spore] heal inside cloud; [Healing Inhibit] periodically forbids healing||{rt1}Must interrupt/burst: none; healers burst heal during spore window{rt1}||Tank: hold; Healer: burst during spore",
                ["mythic"] = "[Spore] heal inside cloud; [Healing Inhibit] periodically forbids healing||{rt1}Must interrupt/burst: none; healers burst heal during spore window{rt1}||Tank: hold; Healer: burst during spore",
                ["mythicplus"] = "[Spore] heal inside cloud; [Healing Inhibit] periodically forbids healing||{rt1}Must interrupt/burst: none; healers burst heal during spore window{rt1}||Tank: hold; Healer: burst during spore",
            },
        },
    },
    ["冰冠堡垒"] = {
        name = "Icecrown Citadel",
        ["玛洛加尔领主"] = {
            type = "BOSS",
            name = "Lord Marrowgar",
            tipsByDifficulty = {
                ["lfr"] = "[Frost] raid periodic high damage; [Bone Spike] mark needs focus interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bone Spike] marked focus down{rt1}||Tank: hold; DPS: focus spike",
                ["normal"] = "[Frost] raid periodic high damage; [Bone Spike] mark needs focus interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bone Spike] marked focus down{rt1}||Tank: hold; DPS: focus spike",
                ["heroic"] = "[Frost] raid periodic high damage; [Bone Spike] mark needs focus interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bone Spike] marked focus down{rt1}||Tank: hold; DPS: focus spike",
                ["mythic"] = "[Frost] raid periodic high damage; [Bone Spike] mark needs focus interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bone Spike] marked focus down{rt1}||Tank: hold; DPS: focus spike",
                ["mythicplus"] = "[Frost] raid periodic high damage; [Bone Spike] mark needs focus interrupt; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bone Spike] marked focus down{rt1}||Tank: hold; DPS: focus spike",
            },
        },
        ["腐面"] = {
            type = "BOSS",
            name = "Festergut",
            tipsByDifficulty = {
                ["lfr"] = "[Plague] mark bomb needs away to detonate; [Ooze] spawn needs control||{rt1}Must interrupt/burst: none; [Plague] marked away from group{rt1}||Tank: hold; DPS: control ooze",
                ["normal"] = "[Plague] mark bomb needs away to detonate; [Ooze] spawn needs control||{rt1}Must interrupt/burst: none; [Plague] marked away from group{rt1}||Tank: hold; DPS: control ooze",
                ["heroic"] = "[Plague] mark bomb needs away to detonate; [Ooze] spawn needs control||{rt1}Must interrupt/burst: none; [Plague] marked away from group{rt1}||Tank: hold; DPS: control ooze",
                ["mythic"] = "[Plague] mark bomb needs away to detonate; [Ooze] spawn needs control||{rt1}Must interrupt/burst: none; [Plague] marked away from group{rt1}||Tank: hold; DPS: control ooze",
                ["mythicplus"] = "[Plague] mark bomb needs away to detonate; [Ooze] spawn needs control||{rt1}Must interrupt/burst: none; [Plague] marked away from group{rt1}||Tank: hold; DPS: control ooze",
            },
        },
        ["亡语者女士"] = {
            type = "BOSS",
            name = "Lady Deathwhisper",
            tipsByDifficulty = {
                ["lfr"] = "[Summon Wraith] phased summon needs clear; [Shadow] dot||{rt1}Must interrupt/burst: none; clear summoned wraiths{rt1}||Tank: hold; DPS: clear add",
                ["normal"] = "[Summon Wraith] phased summon needs clear; [Shadow] dot||{rt1}Must interrupt/burst: none; clear summoned wraiths{rt1}||Tank: hold; DPS: clear add",
                ["heroic"] = "[Summon Wraith] phased summon needs clear; [Shadow] dot||{rt1}Must interrupt/burst: none; clear summoned wraiths{rt1}||Tank: hold; DPS: clear add",
                ["mythic"] = "[Summon Wraith] phased summon needs clear; [Shadow] dot||{rt1}Must interrupt/burst: none; clear summoned wraiths{rt1}||Tank: hold; DPS: clear add",
                ["mythicplus"] = "[Summon Wraith] phased summon needs clear; [Shadow] dot||{rt1}Must interrupt/burst: none; clear summoned wraiths{rt1}||Tank: hold; DPS: clear add",
            },
        },
        ["死亡使者萨鲁法尔"] = {
            type = "BOSS",
            name = "Deathbringer Saurfang",
            tipsByDifficulty = {
                ["lfr"] = "[Blood Beast] mark chases healer needs tank pick up; [Rune] death leaves needs step; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Blood Beast] tank picks up, step rune{rt1}||Tank: pick up beast; DPS: step rune",
                ["normal"] = "[Blood Beast] mark chases healer needs tank pick up; [Rune] death leaves needs step; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Blood Beast] tank picks up, step rune{rt1}||Tank: pick up beast; DPS: step rune",
                ["heroic"] = "[Blood Beast] mark chases healer needs tank pick up; [Rune] death leaves needs step; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Blood Beast] tank picks up, step rune{rt1}||Tank: pick up beast; DPS: step rune",
                ["mythic"] = "[Blood Beast] mark chases healer needs tank pick up; [Rune] death leaves needs step; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Blood Beast] tank picks up, step rune{rt1}||Tank: pick up beast; DPS: step rune",
                ["mythicplus"] = "[Blood Beast] mark chases healer needs tank pick up; [Rune] death leaves needs step; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Blood Beast] tank picks up, step rune{rt1}||Tank: pick up beast; DPS: step rune",
            },
        },
        ["巫妖王"] = {
            type = "BOSS",
            name = "The Lich King",
            tipsByDifficulty = {
                ["lfr"] = "[Defile] mark place circle expands; [Soul] harvest needs dodge; [Parasite] dot; P3[Frost] raid-wide; P5[Invincible] phase||{rt1}Must interrupt/burst: none; [Defile] marked place circle, dodge harvest{rt1}||Tank: hold; Healer: raid heal",
                ["normal"] = "[Defile] mark place circle expands; [Soul] harvest needs dodge; [Parasite] dot; P3[Frost] raid-wide; P5[Invincible] phase||{rt1}Must interrupt/burst: none; [Defile] marked place circle, dodge harvest{rt1}||Tank: hold; Healer: raid heal",
                ["heroic"] = "[Defile] mark place circle expands; [Soul] harvest needs dodge; [Parasite] dot; P3[Frost] raid-wide; P5[Invincible] phase||{rt1}Must interrupt/burst: none; [Defile] marked place circle, dodge harvest{rt1}||Tank: hold; Healer: raid heal",
                ["mythic"] = "[Defile] mark place circle expands; [Soul] harvest needs dodge; [Parasite] dot; P3[Frost] raid-wide; P5[Invincible] phase||{rt1}Must interrupt/burst: none; [Defile] marked place circle, dodge harvest{rt1}||Tank: hold; Healer: raid heal",
                ["mythicplus"] = "[Defile] mark place circle expands; [Soul] harvest needs dodge; [Parasite] dot; P3[Frost] raid-wide; P5[Invincible] phase||{rt1}Must interrupt/burst: none; [Defile] marked place circle, dodge harvest{rt1}||Tank: hold; Healer: raid heal",
            },
        },
        ["普崔塞德教授"] = {
            type = "BOSS",
            name = "Professor Putricide",
            tipsByDifficulty = {
                ["lfr"] = "[Experiment] multi-phase, [Poison] and [Mutation] switch; [Acid Rain] place||{rt1}Must interrupt/burst: none; respond by experiment phase{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Experiment] multi-phase, [Poison] and [Mutation] switch; [Acid Rain] place||{rt1}Must interrupt/burst: none; respond by experiment phase{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Experiment] multi-phase, [Poison] and [Mutation] switch; [Acid Rain] place||{rt1}Must interrupt/burst: none; respond by experiment phase{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Experiment] multi-phase, [Poison] and [Mutation] switch; [Acid Rain] place||{rt1}Must interrupt/burst: none; respond by experiment phase{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Experiment] multi-phase, [Poison] and [Mutation] switch; [Acid Rain] place||{rt1}Must interrupt/burst: none; respond by experiment phase{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["鲜血女王兰娜瑟尔"] = {
            type = "BOSS",
            name = "Blood-Queen Lana'thel",
            tipsByDifficulty = {
                ["lfr"] = "[Bite] mark infect needs chain pass; [Blood Mirror] mirror; [Shadow] dot||{rt1}Must interrupt/burst: none; [Bite] chain pass in order{rt1}||Tank: hold; Healer: detox",
                ["normal"] = "[Bite] mark infect needs chain pass; [Blood Mirror] mirror; [Shadow] dot||{rt1}Must interrupt/burst: none; [Bite] chain pass in order{rt1}||Tank: hold; Healer: detox",
                ["heroic"] = "[Bite] mark infect needs chain pass; [Blood Mirror] mirror; [Shadow] dot||{rt1}Must interrupt/burst: none; [Bite] chain pass in order{rt1}||Tank: hold; Healer: detox",
                ["mythic"] = "[Bite] mark infect needs chain pass; [Blood Mirror] mirror; [Shadow] dot||{rt1}Must interrupt/burst: none; [Bite] chain pass in order{rt1}||Tank: hold; Healer: detox",
                ["mythicplus"] = "[Bite] mark infect needs chain pass; [Blood Mirror] mirror; [Shadow] dot||{rt1}Must interrupt/burst: none; [Bite] chain pass in order{rt1}||Tank: hold; Healer: detox",
            },
        },
        ["冰冠冰川炮舰战"] = {
            type = "BOSS",
            name = "Gunship Battle",
            tipsByDifficulty = {
                ["lfr"] = "[Gunship] two ships duel, need use cannon/bomb to hit opposite; [Ice] landing||{rt1}Must interrupt/burst: none; cannon hit opposite ship{rt1}||Tank: none; DPS: operate cannon",
                ["normal"] = "[Gunship] two ships duel, need use cannon/bomb to hit opposite; [Ice] landing||{rt1}Must interrupt/burst: none; cannon hit opposite ship{rt1}||Tank: none; DPS: operate cannon",
                ["heroic"] = "[Gunship] two ships duel, need use cannon/bomb to hit opposite; [Ice] landing||{rt1}Must interrupt/burst: none; cannon hit opposite ship{rt1}||Tank: none; DPS: operate cannon",
                ["mythic"] = "[Gunship] two ships duel, need use cannon/bomb to hit opposite; [Ice] landing||{rt1}Must interrupt/burst: none; cannon hit opposite ship{rt1}||Tank: none; DPS: operate cannon",
                ["mythicplus"] = "[Gunship] two ships duel, need use cannon/bomb to hit opposite; [Ice] landing||{rt1}Must interrupt/burst: none; cannon hit opposite ship{rt1}||Tank: none; DPS: operate cannon",
            },
        },
        ["辛达苟萨"] = {
            type = "BOSS",
            name = "Sindragosa",
            tipsByDifficulty = {
                ["lfr"] = "[Ice Tomb] mark freeze needs away; [Blistering] wind reduce numbers; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ice Tomb] marked run away{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Ice Tomb] mark freeze needs away; [Blistering] wind reduce numbers; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ice Tomb] marked run away{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Ice Tomb] mark freeze needs away; [Blistering] wind reduce numbers; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ice Tomb] marked run away{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Ice Tomb] mark freeze needs away; [Blistering] wind reduce numbers; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ice Tomb] marked run away{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Ice Tomb] mark freeze needs away; [Blistering] wind reduce numbers; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Ice Tomb] marked run away{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["烂肠"] = {
            type = "BOSS",
            name = "Rotface",
            tipsByDifficulty = {
                ["lfr"] = "[Gas] periodic raid needs eat [Mushroom] reduce damage; [Disease] stack||{rt1}Must interrupt/burst: none; eat mushroom reduce poison{rt1}||Tank: hold; Healer: raid heal",
                ["normal"] = "[Gas] periodic raid needs eat [Mushroom] reduce damage; [Disease] stack||{rt1}Must interrupt/burst: none; eat mushroom reduce poison{rt1}||Tank: hold; Healer: raid heal",
                ["heroic"] = "[Gas] periodic raid needs eat [Mushroom] reduce damage; [Disease] stack||{rt1}Must interrupt/burst: none; eat mushroom reduce poison{rt1}||Tank: hold; Healer: raid heal",
                ["mythic"] = "[Gas] periodic raid needs eat [Mushroom] reduce damage; [Disease] stack||{rt1}Must interrupt/burst: none; eat mushroom reduce poison{rt1}||Tank: hold; Healer: raid heal",
                ["mythicplus"] = "[Gas] periodic raid needs eat [Mushroom] reduce damage; [Disease] stack||{rt1}Must interrupt/burst: none; eat mushroom reduce poison{rt1}||Tank: hold; Healer: raid heal",
            },
        },
        ["鲜血王子议会"] = {
            type = "BOSS",
            name = "Blood Prince Council",
            tipsByDifficulty = {
                ["lfr"] = "[Three Princes] shared health split focus; [Shadow/Fire/Arcane] mixed; [Blood Drain] heal||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Princes] shared health split focus; [Shadow/Fire/Arcane] mixed; [Blood Drain] heal||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Princes] shared health split focus; [Shadow/Fire/Arcane] mixed; [Blood Drain] heal||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Princes] shared health split focus; [Shadow/Fire/Arcane] mixed; [Blood Drain] heal||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Princes] shared health split focus; [Shadow/Fire/Arcane] mixed; [Blood Drain] heal||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["踏梦者瓦莉瑟瑞娅"] = {
            type = "BOSS",
            name = "Valithria Dreamwalker",
            tipsByDifficulty = {
                ["lfr"] = "[Dream] body unattackable, need enter dream hit [Nightmare] portal to save; [Fire] raid-wide||{rt1}Must interrupt/burst: none; enter dream clear adds save body{rt1}||Tank: hold; DPS: enter dream",
                ["normal"] = "[Dream] body unattackable, need enter dream hit [Nightmare] portal to save; [Fire] raid-wide||{rt1}Must interrupt/burst: none; enter dream clear adds save body{rt1}||Tank: hold; DPS: enter dream",
                ["heroic"] = "[Dream] body unattackable, need enter dream hit [Nightmare] portal to save; [Fire] raid-wide||{rt1}Must interrupt/burst: none; enter dream clear adds save body{rt1}||Tank: hold; DPS: enter dream",
                ["mythic"] = "[Dream] body unattackable, need enter dream hit [Nightmare] portal to save; [Fire] raid-wide||{rt1}Must interrupt/burst: none; enter dream clear adds save body{rt1}||Tank: hold; DPS: enter dream",
                ["mythicplus"] = "[Dream] body unattackable, need enter dream hit [Nightmare] portal to save; [Fire] raid-wide||{rt1}Must interrupt/burst: none; enter dream clear adds save body{rt1}||Tank: hold; DPS: enter dream",
            },
        },
    },
    ["十字军的试炼"] = {
        name = "Trial of the Crusader",
        ["诺森德猛兽"] = {
            type = "BOSS",
            name = "Northrend Beasts",
            tipsByDifficulty = {
                ["lfr"] = "[Three Beasts] appear in turn, [Poison] and [Fire] mixed; [Interrupt] key||{rt1}Must interrupt/burst: interrupt by mechanic; kill in turn{rt1}||Tank: rotate; DPS: focus",
                ["normal"] = "[Three Beasts] appear in turn, [Poison] and [Fire] mixed; [Interrupt] key||{rt1}Must interrupt/burst: interrupt by mechanic; kill in turn{rt1}||Tank: rotate; DPS: focus",
                ["heroic"] = "[Three Beasts] appear in turn, [Poison] and [Fire] mixed; [Interrupt] key||{rt1}Must interrupt/burst: interrupt by mechanic; kill in turn{rt1}||Tank: rotate; DPS: focus",
                ["mythic"] = "[Three Beasts] appear in turn, [Poison] and [Fire] mixed; [Interrupt] key||{rt1}Must interrupt/burst: interrupt by mechanic; kill in turn{rt1}||Tank: rotate; DPS: focus",
                ["mythicplus"] = "[Three Beasts] appear in turn, [Poison] and [Fire] mixed; [Interrupt] key||{rt1}Must interrupt/burst: interrupt by mechanic; kill in turn{rt1}||Tank: rotate; DPS: focus",
            },
        },
        ["瓦格里双子"] = {
            type = "BOSS",
            name = "The Val'kyr Twins",
            tipsByDifficulty = {
                ["lfr"] = "[Light/Dark] need same-color positioning, opposite color hurt; [Shield]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["normal"] = "[Light/Dark] need same-color positioning, opposite color hurt; [Shield]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["heroic"] = "[Light/Dark] need same-color positioning, opposite color hurt; [Shield]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["mythic"] = "[Light/Dark] need same-color positioning, opposite color hurt; [Shield]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["mythicplus"] = "[Light/Dark] need same-color positioning, opposite color hurt; [Shield]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
            },
        },
        ["加拉克苏斯大王"] = {
            type = "BOSS",
            name = "Lord Jaraxxus",
            tipsByDifficulty = {
                ["lfr"] = "[Portal] need enter portal interrupt cast; [Incinerate] landing||{rt1}Must interrupt/burst: enter portal interrupt; dodge incinerate{rt1}||Tank: hold; DPS: enter portal",
                ["normal"] = "[Portal] need enter portal interrupt cast; [Incinerate] landing||{rt1}Must interrupt/burst: enter portal interrupt; dodge incinerate{rt1}||Tank: hold; DPS: enter portal",
                ["heroic"] = "[Portal] need enter portal interrupt cast; [Incinerate] landing||{rt1}Must interrupt/burst: enter portal interrupt; dodge incinerate{rt1}||Tank: hold; DPS: enter portal",
                ["mythic"] = "[Portal] need enter portal interrupt cast; [Incinerate] landing||{rt1}Must interrupt/burst: enter portal interrupt; dodge incinerate{rt1}||Tank: hold; DPS: enter portal",
                ["mythicplus"] = "[Portal] need enter portal interrupt cast; [Incinerate] landing||{rt1}Must interrupt/burst: enter portal interrupt; dodge incinerate{rt1}||Tank: hold; DPS: enter portal",
            },
        },
        ["部落的冠军"] = {
            type = "BOSS",
            name = "The Champions",
            tipsByDifficulty = {
                ["lfr"] = "[Multi Class] five enemy classes each have skills, need control one by one; [Mind Control]||{rt1}Must interrupt/burst: control/interrupt key; pick off one by one{rt1}||Tank: split tanks; DPS: control",
                ["normal"] = "[Multi Class] five enemy classes each have skills, need control one by one; [Mind Control]||{rt1}Must interrupt/burst: control/interrupt key; pick off one by one{rt1}||Tank: split tanks; DPS: control",
                ["heroic"] = "[Multi Class] five enemy classes each have skills, need control one by one; [Mind Control]||{rt1}Must interrupt/burst: control/interrupt key; pick off one by one{rt1}||Tank: split tanks; DPS: control",
                ["mythic"] = "[Multi Class] five enemy classes each have skills, need control one by one; [Mind Control]||{rt1}Must interrupt/burst: control/interrupt key; pick off one by one{rt1}||Tank: split tanks; DPS: control",
                ["mythicplus"] = "[Multi Class] five enemy classes each have skills, need control one by one; [Mind Control]||{rt1}Must interrupt/burst: control/interrupt key; pick off one by one{rt1}||Tank: split tanks; DPS: control",
            },
        },
        ["阿努巴拉克"] = {
            type = "BOSS",
            name = "Anub'arak",
            tipsByDifficulty = {
                ["lfr"] = "[Burrow] periodic burrow, need hit [Frost] block force emerge; [Spike] mark||{rt1}Must interrupt/burst: none; hit ice block force emerge{rt1}||Tank: hold; DPS: hit ice",
                ["normal"] = "[Burrow] periodic burrow, need hit [Frost] block force emerge; [Spike] mark||{rt1}Must interrupt/burst: none; hit ice block force emerge{rt1}||Tank: hold; DPS: hit ice",
                ["heroic"] = "[Burrow] periodic burrow, need hit [Frost] block force emerge; [Spike] mark||{rt1}Must interrupt/burst: none; hit ice block force emerge{rt1}||Tank: hold; DPS: hit ice",
                ["mythic"] = "[Burrow] periodic burrow, need hit [Frost] block force emerge; [Spike] mark||{rt1}Must interrupt/burst: none; hit ice block force emerge{rt1}||Tank: hold; DPS: hit ice",
                ["mythicplus"] = "[Burrow] periodic burrow, need hit [Frost] block force emerge; [Spike] mark||{rt1}Must interrupt/burst: none; hit ice block force emerge{rt1}||Tank: hold; DPS: hit ice",
            },
        },
    },
    ["奥杜尔"] = {
        name = "Ulduar",
        ["欧尔莉亚"] = {
            type = "BOSS",
            name = "Auriaya",
            tipsByDifficulty = {
                ["lfr"] = "[Sentinel] summon needs clear; [Light] mark||{rt1}Must interrupt/burst: none; clear sentinel{rt1}||Tank: hold; DPS: clear add",
                ["normal"] = "[Sentinel] summon needs clear; [Light] mark||{rt1}Must interrupt/burst: none; clear sentinel{rt1}||Tank: hold; DPS: clear add",
                ["heroic"] = "[Sentinel] summon needs clear; [Light] mark||{rt1}Must interrupt/burst: none; clear sentinel{rt1}||Tank: hold; DPS: clear add",
                ["mythic"] = "[Sentinel] summon needs clear; [Light] mark||{rt1}Must interrupt/burst: none; clear sentinel{rt1}||Tank: hold; DPS: clear add",
                ["mythicplus"] = "[Sentinel] summon needs clear; [Light] mark||{rt1}Must interrupt/burst: none; clear sentinel{rt1}||Tank: hold; DPS: clear add",
            },
        },
        ["托里姆"] = {
            type = "BOSS",
            name = "Thorim",
            tipsByDifficulty = {
                ["lfr"] = "[Two Sides] run channel trigger; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; run channel, dodge lightning{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Two Sides] run channel trigger; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; run channel, dodge lightning{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Two Sides] run channel trigger; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; run channel, dodge lightning{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Two Sides] run channel trigger; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; run channel, dodge lightning{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Two Sides] run channel trigger; [Lightning] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: none; run channel, dodge lightning{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["锋鳞"] = {
            type = "BOSS",
            name = "Razorscale",
            tipsByDifficulty = {
                ["lfr"] = "[Cannon] need hit in-field cannon to dragon; [Fire] dive||{rt1}Must interrupt/burst: none; cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["normal"] = "[Cannon] need hit in-field cannon to dragon; [Fire] dive||{rt1}Must interrupt/burst: none; cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["heroic"] = "[Cannon] need hit in-field cannon to dragon; [Fire] dive||{rt1}Must interrupt/burst: none; cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["mythic"] = "[Cannon] need hit in-field cannon to dragon; [Fire] dive||{rt1}Must interrupt/burst: none; cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
                ["mythicplus"] = "[Cannon] need hit in-field cannon to dragon; [Fire] dive||{rt1}Must interrupt/burst: none; cannon hit dragon{rt1}||Tank: hold; DPS: operate cannon",
            },
        },
        ["掌炉者伊格尼斯"] = {
            type = "BOSS",
            name = "Ignis the Furnace Master",
            tipsByDifficulty = {
                ["lfr"] = "[Iron Ball] needs water extinguish into [Ice] for tank to pull; [Fire]||{rt1}Must interrupt/burst: none; water into ice control{rt1}||Tank: pull ice; DPS: water",
                ["normal"] = "[Iron Ball] needs water extinguish into [Ice] for tank to pull; [Fire]||{rt1}Must interrupt/burst: none; water into ice control{rt1}||Tank: pull ice; DPS: water",
                ["heroic"] = "[Iron Ball] needs water extinguish into [Ice] for tank to pull; [Fire]||{rt1}Must interrupt/burst: none; water into ice control{rt1}||Tank: pull ice; DPS: water",
                ["mythic"] = "[Iron Ball] needs water extinguish into [Ice] for tank to pull; [Fire]||{rt1}Must interrupt/burst: none; water into ice control{rt1}||Tank: pull ice; DPS: water",
                ["mythicplus"] = "[Iron Ball] needs water extinguish into [Ice] for tank to pull; [Fire]||{rt1}Must interrupt/burst: none; water into ice control{rt1}||Tank: pull ice; DPS: water",
            },
        },
        ["霍迪尔"] = {
            type = "BOSS",
            name = "Hodir",
            tipsByDifficulty = {
                ["lfr"] = "[Frozen] periodic needs break ice rescue; [Fire] buff positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; break ice, eat fire stand{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Frozen] periodic needs break ice rescue; [Fire] buff positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; break ice, eat fire stand{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Frozen] periodic needs break ice rescue; [Fire] buff positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; break ice, eat fire stand{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Frozen] periodic needs break ice rescue; [Fire] buff positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; break ice, eat fire stand{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Frozen] periodic needs break ice rescue; [Fire] buff positioning; [Frenzy] timer||{rt1}Must interrupt/burst: none; break ice, eat fire stand{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["维扎克斯将军"] = {
            type = "BOSS",
            name = "General Vezax",
            tipsByDifficulty = {
                ["lfr"] = "[Black Puddle] mark circle high damage; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Puddle] marked spread{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Black Puddle] mark circle high damage; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Puddle] marked spread{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Black Puddle] mark circle high damage; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Puddle] marked spread{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Black Puddle] mark circle high damage; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Puddle] marked spread{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Black Puddle] mark circle high damage; [Shadow]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Black Puddle] marked spread{rt1}||Tank: hold; DPS: quick kill",
            },
        },
        ["烈焰巨兽"] = {
            type = "BOSS",
            name = "Flame Leviathan",
            tipsByDifficulty = {
                ["lfr"] = "[Vehicle] need drive siege vehicle to hit; [Fire] landing||{rt1}Must interrupt/burst: none; vehicle focus{rt1}||Tank: none; DPS: vehicle",
                ["normal"] = "[Vehicle] need drive siege vehicle to hit; [Fire] landing||{rt1}Must interrupt/burst: none; vehicle focus{rt1}||Tank: none; DPS: vehicle",
                ["heroic"] = "[Vehicle] need drive siege vehicle to hit; [Fire] landing||{rt1}Must interrupt/burst: none; vehicle focus{rt1}||Tank: none; DPS: vehicle",
                ["mythic"] = "[Vehicle] need drive siege vehicle to hit; [Fire] landing||{rt1}Must interrupt/burst: none; vehicle focus{rt1}||Tank: none; DPS: vehicle",
                ["mythicplus"] = "[Vehicle] need drive siege vehicle to hit; [Fire] landing||{rt1}Must interrupt/burst: none; vehicle focus{rt1}||Tank: none; DPS: vehicle",
            },
        },
        ["米米尔隆"] = {
            type = "BOSS",
            name = "Mimiron",
            tipsByDifficulty = {
                ["lfr"] = "[Three Phase] robot/volcano/head, [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Three Phase] robot/volcano/head, [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Three Phase] robot/volcano/head, [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Three Phase] robot/volcano/head, [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Three Phase] robot/volcano/head, [Bomb] mark; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["弗蕾亚"] = {
            type = "BOSS",
            name = "Freya",
            tipsByDifficulty = {
                ["lfr"] = "[Three Elders] need clear three elders then hit body; [Nature] dot||{rt1}Must interrupt/burst: none; clear three elders{rt1}||Tank: hold; DPS: clear elders",
                ["normal"] = "[Three Elders] need clear three elders then hit body; [Nature] dot||{rt1}Must interrupt/burst: none; clear three elders{rt1}||Tank: hold; DPS: clear elders",
                ["heroic"] = "[Three Elders] need clear three elders then hit body; [Nature] dot||{rt1}Must interrupt/burst: none; clear three elders{rt1}||Tank: hold; DPS: clear elders",
                ["mythic"] = "[Three Elders] need clear three elders then hit body; [Nature] dot||{rt1}Must interrupt/burst: none; clear three elders{rt1}||Tank: hold; DPS: clear elders",
                ["mythicplus"] = "[Three Elders] need clear three elders then hit body; [Nature] dot||{rt1}Must interrupt/burst: none; clear three elders{rt1}||Tank: hold; DPS: clear elders",
            },
        },
        ["观察者奥尔加隆"] = {
            type = "BOSS",
            name = "Algalon the Observer",
            tipsByDifficulty = {
                ["lfr"] = "[Cosmic] raid periodic high damage; [Star] mark; [Frenzy] very short timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; Healer: raid heal; DPS: quick kill",
                ["normal"] = "[Cosmic] raid periodic high damage; [Star] mark; [Frenzy] very short timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; Healer: raid heal; DPS: quick kill",
                ["heroic"] = "[Cosmic] raid periodic high damage; [Star] mark; [Frenzy] very short timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; Healer: raid heal; DPS: quick kill",
                ["mythic"] = "[Cosmic] raid periodic high damage; [Star] mark; [Frenzy] very short timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; Healer: raid heal; DPS: quick kill",
                ["mythicplus"] = "[Cosmic] raid periodic high damage; [Star] mark; [Frenzy] very short timer||{rt1}Must interrupt/burst: none; [Star] marked away{rt1}||Tank: hold; Healer: raid heal; DPS: quick kill",
            },
        },
        ["尤格-萨隆"] = {
            type = "BOSS",
            name = "Yogg-Saron",
            tipsByDifficulty = {
                ["lfr"] = "[Sanity] enter dream keep sanity; [Tentacle] needs hit; P3[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter dream hit tentacle{rt1}||Tank: hold; DPS: focus",
                ["normal"] = "[Sanity] enter dream keep sanity; [Tentacle] needs hit; P3[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter dream hit tentacle{rt1}||Tank: hold; DPS: focus",
                ["heroic"] = "[Sanity] enter dream keep sanity; [Tentacle] needs hit; P3[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter dream hit tentacle{rt1}||Tank: hold; DPS: focus",
                ["mythic"] = "[Sanity] enter dream keep sanity; [Tentacle] needs hit; P3[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter dream hit tentacle{rt1}||Tank: hold; DPS: focus",
                ["mythicplus"] = "[Sanity] enter dream keep sanity; [Tentacle] needs hit; P3[Body]; [Frenzy] timer||{rt1}Must interrupt/burst: none; enter dream hit tentacle{rt1}||Tank: hold; DPS: focus",
            },
        },
        ["XT-002拆解者"] = {
            type = "BOSS",
            name = "XT-002 Deconstructor",
            tipsByDifficulty = {
                ["lfr"] = "[Heart] periodic exposed needs focus; [Bomb] mark place circle; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle, focus heart{rt1}||Tank: hold; DPS: focus heart",
                ["normal"] = "[Heart] periodic exposed needs focus; [Bomb] mark place circle; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle, focus heart{rt1}||Tank: hold; DPS: focus heart",
                ["heroic"] = "[Heart] periodic exposed needs focus; [Bomb] mark place circle; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle, focus heart{rt1}||Tank: hold; DPS: focus heart",
                ["mythic"] = "[Heart] periodic exposed needs focus; [Bomb] mark place circle; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle, focus heart{rt1}||Tank: hold; DPS: focus heart",
                ["mythicplus"] = "[Heart] periodic exposed needs focus; [Bomb] mark place circle; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bomb] place circle, focus heart{rt1}||Tank: hold; DPS: focus heart",
            },
        },
        ["钢铁议会"] = {
            type = "BOSS",
            name = "Iron Council",
            tipsByDifficulty = {
                ["lfr"] = "[Three Dwarves] shared health, need focus in specified order; [Lightning]||{rt1}Must interrupt/burst: none; focus by order{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Three Dwarves] shared health, need focus in specified order; [Lightning]||{rt1}Must interrupt/burst: none; focus by order{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Three Dwarves] shared health, need focus in specified order; [Lightning]||{rt1}Must interrupt/burst: none; focus by order{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Three Dwarves] shared health, need focus in specified order; [Lightning]||{rt1}Must interrupt/burst: none; focus by order{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Three Dwarves] shared health, need focus in specified order; [Lightning]||{rt1}Must interrupt/burst: none; focus by order{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["科隆加恩"] = {
            type = "BOSS",
            name = "Kologarn",
            tipsByDifficulty = {
                ["lfr"] = "[Arm] separate needs destroy; [Rock] landing||{rt1}Must interrupt/burst: none; destroy arm{rt1}||Tank: hold; DPS: focus arm",
                ["normal"] = "[Arm] separate needs destroy; [Rock] landing||{rt1}Must interrupt/burst: none; destroy arm{rt1}||Tank: hold; DPS: focus arm",
                ["heroic"] = "[Arm] separate needs destroy; [Rock] landing||{rt1}Must interrupt/burst: none; destroy arm{rt1}||Tank: hold; DPS: focus arm",
                ["mythic"] = "[Arm] separate needs destroy; [Rock] landing||{rt1}Must interrupt/burst: none; destroy arm{rt1}||Tank: hold; DPS: focus arm",
                ["mythicplus"] = "[Arm] separate needs destroy; [Rock] landing||{rt1}Must interrupt/burst: none; destroy arm{rt1}||Tank: hold; DPS: focus arm",
            },
        },
    },
}
