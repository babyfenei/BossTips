-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["2.0"] = {
    ["卡拉赞"] = {
        name = "Karazhan",
        ["埃兰之影"] = {
            type = "BOSS",
            name = "Shade of Aran",
            tipsByDifficulty = {
                ["lfr"] = "[Three Spells] fire/ice/arcane rotate cast needs corresponding interrupt; [Blink] reposition||{rt1}Must interrupt/burst: [Spell] must interrupt{rt1}||Tank: hold",
                ["normal"] = "[Three Spells] fire/ice/arcane rotate cast needs corresponding interrupt; [Blink] reposition||{rt1}Must interrupt/burst: [Spell] must interrupt{rt1}||Tank: hold",
                ["heroic"] = "[Three Spells] fire/ice/arcane rotate cast needs corresponding interrupt; [Blink] reposition||{rt1}Must interrupt/burst: [Spell] must interrupt{rt1}||Tank: hold",
                ["mythic"] = "[Three Spells] fire/ice/arcane rotate cast needs corresponding interrupt; [Blink] reposition||{rt1}Must interrupt/burst: [Spell] must interrupt{rt1}||Tank: hold",
                ["mythicplus"] = "[Three Spells] fire/ice/arcane rotate cast needs corresponding interrupt; [Blink] reposition||{rt1}Must interrupt/burst: [Spell] must interrupt{rt1}||Tank: hold",
            },
        },
        ["莫罗斯"] = {
            type = "BOSS",
            name = "Moroes",
            tipsByDifficulty = {
                ["lfr"] = "[Summon Retainer] periodic summon needs control; [Blind] current tank||{rt1}Must interrupt/burst: control/kill retainer{rt1}||Tank: dual tank; DPS: control adds",
                ["normal"] = "[Summon Retainer] periodic summon needs control; [Blind] current tank||{rt1}Must interrupt/burst: control/kill retainer{rt1}||Tank: dual tank; DPS: control adds",
                ["heroic"] = "[Summon Retainer] periodic summon needs control; [Blind] current tank||{rt1}Must interrupt/burst: control/kill retainer{rt1}||Tank: dual tank; DPS: control adds",
                ["mythic"] = "[Summon Retainer] periodic summon needs control; [Blind] current tank||{rt1}Must interrupt/burst: control/kill retainer{rt1}||Tank: dual tank; DPS: control adds",
                ["mythicplus"] = "[Summon Retainer] periodic summon needs control; [Blind] current tank||{rt1}Must interrupt/burst: control/kill retainer{rt1}||Tank: dual tank; DPS: control adds",
            },
        },
        ["猎手阿图门"] = {
            type = "BOSS",
            name = "Attumen the Huntsman",
            tipsByDifficulty = {
                ["lfr"] = "[Horse and Hunter] separate phase, need pull apart and kill separately; [Charge]||{rt1}Must interrupt/burst: none; pull horse and hunter apart hit separately{rt1}||Tank: hold horse",
                ["normal"] = "[Horse and Hunter] separate phase, need pull apart and kill separately; [Charge]||{rt1}Must interrupt/burst: none; pull horse and hunter apart hit separately{rt1}||Tank: hold horse",
                ["heroic"] = "[Horse and Hunter] separate phase, need pull apart and kill separately; [Charge]||{rt1}Must interrupt/burst: none; pull horse and hunter apart hit separately{rt1}||Tank: hold horse",
                ["mythic"] = "[Horse and Hunter] separate phase, need pull apart and kill separately; [Charge]||{rt1}Must interrupt/burst: none; pull horse and hunter apart hit separately{rt1}||Tank: hold horse",
                ["mythicplus"] = "[Horse and Hunter] separate phase, need pull apart and kill separately; [Charge]||{rt1}Must interrupt/burst: none; pull horse and hunter apart hit separately{rt1}||Tank: hold horse",
            },
        },
        ["大灰狼"] = {
            type = "BOSS",
            name = "Big Bad Wolf",
            tipsByDifficulty = {
                ["lfr"] = "[Little Red Riding Hood] mark chases needs kite around pillar; [Devour] instakill chased||{rt1}Must interrupt/burst: none; [Little Red] marked run around pillar{rt1}||Tank: hold",
                ["normal"] = "[Little Red Riding Hood] mark chases needs kite around pillar; [Devour] instakill chased||{rt1}Must interrupt/burst: none; [Little Red] marked run around pillar{rt1}||Tank: hold",
                ["heroic"] = "[Little Red Riding Hood] mark chases needs kite around pillar; [Devour] instakill chased||{rt1}Must interrupt/burst: none; [Little Red] marked run around pillar{rt1}||Tank: hold",
                ["mythic"] = "[Little Red Riding Hood] mark chases needs kite around pillar; [Devour] instakill chased||{rt1}Must interrupt/burst: none; [Little Red] marked run around pillar{rt1}||Tank: hold",
                ["mythicplus"] = "[Little Red Riding Hood] mark chases needs kite around pillar; [Devour] instakill chased||{rt1}Must interrupt/burst: none; [Little Red] marked run around pillar{rt1}||Tank: hold",
            },
        },
        ["罗密欧与朱丽叶"] = {
            type = "BOSS",
            name = "Romeo and Juliet",
            tipsByDifficulty = {
                ["lfr"] = "[Two People] shared health needs simultaneous focus; [Mind Control] mark||{rt1}Must interrupt/burst: none; press both targets together{rt1}||Tank: split tanks",
                ["normal"] = "[Two People] shared health needs simultaneous focus; [Mind Control] mark||{rt1}Must interrupt/burst: none; press both targets together{rt1}||Tank: split tanks",
                ["heroic"] = "[Two People] shared health needs simultaneous focus; [Mind Control] mark||{rt1}Must interrupt/burst: none; press both targets together{rt1}||Tank: split tanks",
                ["mythic"] = "[Two People] shared health needs simultaneous focus; [Mind Control] mark||{rt1}Must interrupt/burst: none; press both targets together{rt1}||Tank: split tanks",
                ["mythicplus"] = "[Two People] shared health needs simultaneous focus; [Mind Control] mark||{rt1}Must interrupt/burst: none; press both targets together{rt1}||Tank: split tanks",
            },
        },
        ["馆长"] = {
            type = "BOSS",
            name = "The Curator",
            tipsByDifficulty = {
                ["lfr"] = "[Blue Ball] energy ball needs hit to restore mana; [Arc] raid-wide; [Frenzy] energy full||{rt1}Must interrupt/burst: none; [Blue Ball] hit to prevent frenzy{rt1}||Tank: hold",
                ["normal"] = "[Blue Ball] energy ball needs hit to restore mana; [Arc] raid-wide; [Frenzy] energy full||{rt1}Must interrupt/burst: none; [Blue Ball] hit to prevent frenzy{rt1}||Tank: hold",
                ["heroic"] = "[Blue Ball] energy ball needs hit to restore mana; [Arc] raid-wide; [Frenzy] energy full||{rt1}Must interrupt/burst: none; [Blue Ball] hit to prevent frenzy{rt1}||Tank: hold",
                ["mythic"] = "[Blue Ball] energy ball needs hit to restore mana; [Arc] raid-wide; [Frenzy] energy full||{rt1}Must interrupt/burst: none; [Blue Ball] hit to prevent frenzy{rt1}||Tank: hold",
                ["mythicplus"] = "[Blue Ball] energy ball needs hit to restore mana; [Arc] raid-wide; [Frenzy] energy full||{rt1}Must interrupt/burst: none; [Blue Ball] hit to prevent frenzy{rt1}||Tank: hold",
            },
        },
        ["贞节圣女"] = {
            type = "BOSS",
            name = "Maiden of Virtue",
            tipsByDifficulty = {
                ["lfr"] = "[Holy] heal cast reflects damage; [Penance] mark root||{rt1}Must interrupt/burst: none; [Penance] marked away{rt1}||Tank: hold; Healer: no cast",
                ["normal"] = "[Holy] heal cast reflects damage; [Penance] mark root||{rt1}Must interrupt/burst: none; [Penance] marked away{rt1}||Tank: hold; Healer: no cast",
                ["heroic"] = "[Holy] heal cast reflects damage; [Penance] mark root||{rt1}Must interrupt/burst: none; [Penance] marked away{rt1}||Tank: hold; Healer: no cast",
                ["mythic"] = "[Holy] heal cast reflects damage; [Penance] mark root||{rt1}Must interrupt/burst: none; [Penance] marked away{rt1}||Tank: hold; Healer: no cast",
                ["mythicplus"] = "[Holy] heal cast reflects damage; [Penance] mark root||{rt1}Must interrupt/burst: none; [Penance] marked away{rt1}||Tank: hold; Healer: no cast",
            },
        },
        ["特雷斯坦·邪蹄"] = {
            type = "BOSS",
            name = "Terestian Illhoof",
            tipsByDifficulty = {
                ["lfr"] = "[Mind Control] mark turns to demon needs interrupt rescue; [Fire]||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Mind Control] mark turns to demon needs interrupt rescue; [Fire]||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Mind Control] mark turns to demon needs interrupt rescue; [Fire]||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Mind Control] mark turns to demon needs interrupt rescue; [Fire]||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Mind Control] mark turns to demon needs interrupt rescue; [Fire]||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["老巫婆"] = {
            type = "BOSS",
            name = "The Crone",
            tipsByDifficulty = {
                ["lfr"] = "[Moon/Star] phase switch needs corresponding positioning; [Fire/Ice] mixed||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold",
                ["normal"] = "[Moon/Star] phase switch needs corresponding positioning; [Fire/Ice] mixed||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold",
                ["heroic"] = "[Moon/Star] phase switch needs corresponding positioning; [Fire/Ice] mixed||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold",
                ["mythic"] = "[Moon/Star] phase switch needs corresponding positioning; [Fire/Ice] mixed||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold",
                ["mythicplus"] = "[Moon/Star] phase switch needs corresponding positioning; [Fire/Ice] mixed||{rt1}Must interrupt/burst: none; switch positioning by phase{rt1}||Tank: hold",
            },
        },
        ["夜之魇"] = {
            type = "BOSS",
            name = "Nightbane",
            tipsByDifficulty = {
                ["lfr"] = "[Summon] needs cast at graveyard to summon; [Bone Rain] raid high damage; [Debuff] mark needs fly up dodge||{rt1}Must interrupt/burst: none; [Debuff] marked fly up dodge{rt1}||Tank: hold",
                ["normal"] = "[Summon] needs cast at graveyard to summon; [Bone Rain] raid high damage; [Debuff] mark needs fly up dodge||{rt1}Must interrupt/burst: none; [Debuff] marked fly up dodge{rt1}||Tank: hold",
                ["heroic"] = "[Summon] needs cast at graveyard to summon; [Bone Rain] raid high damage; [Debuff] mark needs fly up dodge||{rt1}Must interrupt/burst: none; [Debuff] marked fly up dodge{rt1}||Tank: hold",
                ["mythic"] = "[Summon] needs cast at graveyard to summon; [Bone Rain] raid high damage; [Debuff] mark needs fly up dodge||{rt1}Must interrupt/burst: none; [Debuff] marked fly up dodge{rt1}||Tank: hold",
                ["mythicplus"] = "[Summon] needs cast at graveyard to summon; [Bone Rain] raid high damage; [Debuff] mark needs fly up dodge||{rt1}Must interrupt/burst: none; [Debuff] marked fly up dodge{rt1}||Tank: hold",
            },
        },
        ["虚空幽龙"] = {
            type = "BOSS",
            name = "Netherspite",
            tipsByDifficulty = {
                ["lfr"] = "[Color] red/blue/green/bronze, need corresponding positioning for buff; [Mark]||{rt1}Must interrupt/burst: none; position by color{rt1}||Tank: hold",
                ["normal"] = "[Color] red/blue/green/bronze, need corresponding positioning for buff; [Mark]||{rt1}Must interrupt/burst: none; position by color{rt1}||Tank: hold",
                ["heroic"] = "[Color] red/blue/green/bronze, need corresponding positioning for buff; [Mark]||{rt1}Must interrupt/burst: none; position by color{rt1}||Tank: hold",
                ["mythic"] = "[Color] red/blue/green/bronze, need corresponding positioning for buff; [Mark]||{rt1}Must interrupt/burst: none; position by color{rt1}||Tank: hold",
                ["mythicplus"] = "[Color] red/blue/green/bronze, need corresponding positioning for buff; [Mark]||{rt1}Must interrupt/burst: none; position by color{rt1}||Tank: hold",
            },
        },
        ["玛克扎尔王子"] = {
            type = "BOSS",
            name = "Prince Malchezaar",
            tipsByDifficulty = {
                ["lfr"] = "[Mirror] clone needs focus real; [Fire]; [Orange Staff] phase||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold",
                ["normal"] = "[Mirror] clone needs focus real; [Fire]; [Orange Staff] phase||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold",
                ["heroic"] = "[Mirror] clone needs focus real; [Fire]; [Orange Staff] phase||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold",
                ["mythic"] = "[Mirror] clone needs focus real; [Fire]; [Orange Staff] phase||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold",
                ["mythicplus"] = "[Mirror] clone needs focus real; [Fire]; [Orange Staff] phase||{rt1}Must interrupt/burst: none; focus real{rt1}||Tank: hold",
            },
        },
        ["仆役宿舍"] = {
            type = "BOSS",
            name = "The Servant's Quarters",
            tipsByDifficulty = {
                ["lfr"] = "[Multiple Waves] continuous spawn needs control; [Fear] mark||{rt1}Must interrupt/burst: control/interrupt fear; clear adds by wave{rt1}||Tank: group pull; DPS: control adds",
                ["normal"] = "[Multiple Waves] continuous spawn needs control; [Fear] mark||{rt1}Must interrupt/burst: control/interrupt fear; clear adds by wave{rt1}||Tank: group pull; DPS: control adds",
                ["heroic"] = "[Multiple Waves] continuous spawn needs control; [Fear] mark||{rt1}Must interrupt/burst: control/interrupt fear; clear adds by wave{rt1}||Tank: group pull; DPS: control adds",
                ["mythic"] = "[Multiple Waves] continuous spawn needs control; [Fear] mark||{rt1}Must interrupt/burst: control/interrupt fear; clear adds by wave{rt1}||Tank: group pull; DPS: control adds",
                ["mythicplus"] = "[Multiple Waves] continuous spawn needs control; [Fear] mark||{rt1}Must interrupt/burst: control/interrupt fear; clear adds by wave{rt1}||Tank: group pull; DPS: control adds",
            },
        },
    },
    ["海加尔山之战"] = {
        name = "Battle for Mount Hyjal",
        ["阿兹加洛"] = {
            type = "BOSS",
            name = "Azgalor",
            tipsByDifficulty = {
                ["lfr"] = "[Fire Rain] place circle needs dodge; [Cleave]||{rt1}Must interrupt/burst: none; dodge fire rain{rt1}||Tank: hold",
                ["normal"] = "[Fire Rain] place circle needs dodge; [Cleave]||{rt1}Must interrupt/burst: none; dodge fire rain{rt1}||Tank: hold",
                ["heroic"] = "[Fire Rain] place circle needs dodge; [Cleave]||{rt1}Must interrupt/burst: none; dodge fire rain{rt1}||Tank: hold",
                ["mythic"] = "[Fire Rain] place circle needs dodge; [Cleave]||{rt1}Must interrupt/burst: none; dodge fire rain{rt1}||Tank: hold",
                ["mythicplus"] = "[Fire Rain] place circle needs dodge; [Cleave]||{rt1}Must interrupt/burst: none; dodge fire rain{rt1}||Tank: hold",
            },
        },
        ["卡兹洛加"] = {
            type = "BOSS",
            name = "Kaz'rogal",
            tipsByDifficulty = {
                ["lfr"] = "[Heavy Wound] high auto-attack; [Fire] direct damage||{rt1}Must interrupt/burst: none{rt1}||Tank: hard tank; Healer: pre-cast",
                ["normal"] = "[Heavy Wound] high auto-attack; [Fire] direct damage||{rt1}Must interrupt/burst: none{rt1}||Tank: hard tank; Healer: pre-cast",
                ["heroic"] = "[Heavy Wound] high auto-attack; [Fire] direct damage||{rt1}Must interrupt/burst: none{rt1}||Tank: hard tank; Healer: pre-cast",
                ["mythic"] = "[Heavy Wound] high auto-attack; [Fire] direct damage||{rt1}Must interrupt/burst: none{rt1}||Tank: hard tank; Healer: pre-cast",
                ["mythicplus"] = "[Heavy Wound] high auto-attack; [Fire] direct damage||{rt1}Must interrupt/burst: none{rt1}||Tank: hard tank; Healer: pre-cast",
            },
        },
        ["安纳塞隆"] = {
            type = "BOSS",
            name = "Anetheron",
            tipsByDifficulty = {
                ["lfr"] = "[Sleep] mark sleeps needs wake; [Poison] dot||{rt1}Must interrupt/burst: none; [Sleep] marked wake{rt1}||Tank: hold",
                ["normal"] = "[Sleep] mark sleeps needs wake; [Poison] dot||{rt1}Must interrupt/burst: none; [Sleep] marked wake{rt1}||Tank: hold",
                ["heroic"] = "[Sleep] mark sleeps needs wake; [Poison] dot||{rt1}Must interrupt/burst: none; [Sleep] marked wake{rt1}||Tank: hold",
                ["mythic"] = "[Sleep] mark sleeps needs wake; [Poison] dot||{rt1}Must interrupt/burst: none; [Sleep] marked wake{rt1}||Tank: hold",
                ["mythicplus"] = "[Sleep] mark sleeps needs wake; [Poison] dot||{rt1}Must interrupt/burst: none; [Sleep] marked wake{rt1}||Tank: hold",
            },
        },
        ["雷基·冬寒"] = {
            type = "BOSS",
            name = "Rage Winterchill",
            tipsByDifficulty = {
                ["lfr"] = "[Frost] high damage; [Ice Tomb] mark freeze needs ally rescue||{rt1}Must interrupt/burst: none; [Ice Tomb] marked rescue{rt1}||Tank: hold",
                ["normal"] = "[Frost] high damage; [Ice Tomb] mark freeze needs ally rescue||{rt1}Must interrupt/burst: none; [Ice Tomb] marked rescue{rt1}||Tank: hold",
                ["heroic"] = "[Frost] high damage; [Ice Tomb] mark freeze needs ally rescue||{rt1}Must interrupt/burst: none; [Ice Tomb] marked rescue{rt1}||Tank: hold",
                ["mythic"] = "[Frost] high damage; [Ice Tomb] mark freeze needs ally rescue||{rt1}Must interrupt/burst: none; [Ice Tomb] marked rescue{rt1}||Tank: hold",
                ["mythicplus"] = "[Frost] high damage; [Ice Tomb] mark freeze needs ally rescue||{rt1}Must interrupt/burst: none; [Ice Tomb] marked rescue{rt1}||Tank: hold",
            },
        },
        ["阿克蒙德"] = {
            type = "BOSS",
            name = "Archimonde",
            tipsByDifficulty = {
                ["lfr"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["normal"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["heroic"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["mythic"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
                ["mythicplus"] = "[Finger of Death] mark instakill needs immediately away; [Fire] raid-wide; [Frenzy] timer||{rt1}Must interrupt/burst: [Finger of Death] marked away from group{rt1}||Tank: hold; DPS: quick kill",
            },
        },
    },
    ["太阳之井高地"] = {
        name = "Sunwell Plateau",
        ["布鲁塔卢斯"] = {
            type = "BOSS",
            name = "Brutallus",
            tipsByDifficulty = {
                ["lfr"] = "[Burn] high dot; [Knockback]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Burn] marked away{rt1}||Tank: hard tank; Healer: raid heal",
                ["normal"] = "[Burn] high dot; [Knockback]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Burn] marked away{rt1}||Tank: hard tank; Healer: raid heal",
                ["heroic"] = "[Burn] high dot; [Knockback]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Burn] marked away{rt1}||Tank: hard tank; Healer: raid heal",
                ["mythic"] = "[Burn] high dot; [Knockback]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Burn] marked away{rt1}||Tank: hard tank; Healer: raid heal",
                ["mythicplus"] = "[Burn] high dot; [Knockback]; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Burn] marked away{rt1}||Tank: hard tank; Healer: raid heal",
            },
        },
        ["基尔加丹"] = {
            type = "BOSS",
            name = "Kil'jaeden",
            tipsByDifficulty = {
                ["lfr"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["normal"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["heroic"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["mythic"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
                ["mythicplus"] = "[Mirror] clone; [Flame] raid-wide; [Hand] mark instakill; P5[Shadow]||{rt1}Must interrupt/burst: none; dodge [Hand] hit clones{rt1}||Tank: hold; DPS: dodge mechanic",
            },
        },
        ["卡雷苟斯"] = {
            type = "BOSS",
            name = "Kalecgos",
            tipsByDifficulty = {
                ["lfr"] = "[Blue Dragon/Demon] dual space, need enter portal to hit demon; [Mark]||{rt1}Must interrupt/burst: none; enter portal focus demon{rt1}||Tank: hold dragon",
                ["normal"] = "[Blue Dragon/Demon] dual space, need enter portal to hit demon; [Mark]||{rt1}Must interrupt/burst: none; enter portal focus demon{rt1}||Tank: hold dragon",
                ["heroic"] = "[Blue Dragon/Demon] dual space, need enter portal to hit demon; [Mark]||{rt1}Must interrupt/burst: none; enter portal focus demon{rt1}||Tank: hold dragon",
                ["mythic"] = "[Blue Dragon/Demon] dual space, need enter portal to hit demon; [Mark]||{rt1}Must interrupt/burst: none; enter portal focus demon{rt1}||Tank: hold dragon",
                ["mythicplus"] = "[Blue Dragon/Demon] dual space, need enter portal to hit demon; [Mark]||{rt1}Must interrupt/burst: none; enter portal focus demon{rt1}||Tank: hold dragon",
            },
        },
        ["穆鲁"] = {
            type = "BOSS",
            name = "M'uru",
            tipsByDifficulty = {
                ["lfr"] = "[Void] phase summons adds needs clear; [Shadow]; P2[Entropy] body||{rt1}Must interrupt/burst: none; clear void adds{rt1}||Tank: hold; DPS: clear adds",
                ["normal"] = "[Void] phase summons adds needs clear; [Shadow]; P2[Entropy] body||{rt1}Must interrupt/burst: none; clear void adds{rt1}||Tank: hold; DPS: clear adds",
                ["heroic"] = "[Void] phase summons adds needs clear; [Shadow]; P2[Entropy] body||{rt1}Must interrupt/burst: none; clear void adds{rt1}||Tank: hold; DPS: clear adds",
                ["mythic"] = "[Void] phase summons adds needs clear; [Shadow]; P2[Entropy] body||{rt1}Must interrupt/burst: none; clear void adds{rt1}||Tank: hold; DPS: clear adds",
                ["mythicplus"] = "[Void] phase summons adds needs clear; [Shadow]; P2[Entropy] body||{rt1}Must interrupt/burst: none; clear void adds{rt1}||Tank: hold; DPS: clear adds",
            },
        },
        ["艾瑞达双子"] = {
            type = "BOSS",
            name = "Eredar Twins",
            tipsByDifficulty = {
                ["lfr"] = "[Fire/Shadow] twins shared health needs same-color positioning; [Aura]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["normal"] = "[Fire/Shadow] twins shared health needs same-color positioning; [Aura]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["heroic"] = "[Fire/Shadow] twins shared health needs same-color positioning; [Aura]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["mythic"] = "[Fire/Shadow] twins shared health needs same-color positioning; [Aura]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
                ["mythicplus"] = "[Fire/Shadow] twins shared health needs same-color positioning; [Aura]||{rt1}Must interrupt/burst: none; same-color positioning focus{rt1}||Tank: split tanks",
            },
        },
        ["菲米丝"] = {
            type = "BOSS",
            name = "Felmyst",
            tipsByDifficulty = {
                ["lfr"] = "[Gas] raid needs dodge cloud; [Gas] nova; [Dive]||{rt1}Must interrupt/burst: none; dodge poison cloud{rt1}||Tank: hold",
                ["normal"] = "[Gas] raid needs dodge cloud; [Gas] nova; [Dive]||{rt1}Must interrupt/burst: none; dodge poison cloud{rt1}||Tank: hold",
                ["heroic"] = "[Gas] raid needs dodge cloud; [Gas] nova; [Dive]||{rt1}Must interrupt/burst: none; dodge poison cloud{rt1}||Tank: hold",
                ["mythic"] = "[Gas] raid needs dodge cloud; [Gas] nova; [Dive]||{rt1}Must interrupt/burst: none; dodge poison cloud{rt1}||Tank: hold",
                ["mythicplus"] = "[Gas] raid needs dodge cloud; [Gas] nova; [Dive]||{rt1}Must interrupt/burst: none; dodge poison cloud{rt1}||Tank: hold",
            },
        },
    },
    ["毒蛇神殿"] = {
        name = "Serpentshrine Cavern",
        ["不稳定的海度斯"] = {
            type = "BOSS",
            name = "Hydross the Unstable",
            tipsByDifficulty = {
                ["lfr"] = "[Nature/Frost] dual form switch needs corresponding resist; [Poison] dot||{rt1}Must interrupt/burst: none; switch resist by form{rt1}||Tank: hold",
                ["normal"] = "[Nature/Frost] dual form switch needs corresponding resist; [Poison] dot||{rt1}Must interrupt/burst: none; switch resist by form{rt1}||Tank: hold",
                ["heroic"] = "[Nature/Frost] dual form switch needs corresponding resist; [Poison] dot||{rt1}Must interrupt/burst: none; switch resist by form{rt1}||Tank: hold",
                ["mythic"] = "[Nature/Frost] dual form switch needs corresponding resist; [Poison] dot||{rt1}Must interrupt/burst: none; switch resist by form{rt1}||Tank: hold",
                ["mythicplus"] = "[Nature/Frost] dual form switch needs corresponding resist; [Poison] dot||{rt1}Must interrupt/burst: none; switch resist by form{rt1}||Tank: hold",
            },
        },
        ["盲眼者莱欧瑟拉斯"] = {
            type = "BOSS",
            name = "Leotheras the Blind",
            tipsByDifficulty = {
                ["lfr"] = "[Two Hearts] shared health needs press together; [Whirlwind]||{rt1}Must interrupt/burst: none; focus both hearts together{rt1}||Tank: dual tanks",
                ["normal"] = "[Two Hearts] shared health needs press together; [Whirlwind]||{rt1}Must interrupt/burst: none; focus both hearts together{rt1}||Tank: dual tanks",
                ["heroic"] = "[Two Hearts] shared health needs press together; [Whirlwind]||{rt1}Must interrupt/burst: none; focus both hearts together{rt1}||Tank: dual tanks",
                ["mythic"] = "[Two Hearts] shared health needs press together; [Whirlwind]||{rt1}Must interrupt/burst: none; focus both hearts together{rt1}||Tank: dual tanks",
                ["mythicplus"] = "[Two Hearts] shared health needs press together; [Whirlwind]||{rt1}Must interrupt/burst: none; focus both hearts together{rt1}||Tank: dual tanks",
            },
        },
        ["深水领主卡拉瑟雷斯"] = {
            type = "BOSS",
            name = "Fathom-Lord Karathress",
            tipsByDifficulty = {
                ["lfr"] = "[Four Advisors] water/fire/earth/air split focus; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["normal"] = "[Four Advisors] water/fire/earth/air split focus; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["heroic"] = "[Four Advisors] water/fire/earth/air split focus; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["mythic"] = "[Four Advisors] water/fire/earth/air split focus; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["mythicplus"] = "[Four Advisors] water/fire/earth/air split focus; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
            },
        },
        ["鱼斯拉"] = {
            type = "BOSS",
            name = "The Lurker Below",
            tipsByDifficulty = {
                ["lfr"] = "[Spit] rotating sweep needs dodge to side; [Submarine] phase needs sink submarine||{rt1}Must interrupt/burst: none; dodge spit hit submarine{rt1}||Tank: hold",
                ["normal"] = "[Spit] rotating sweep needs dodge to side; [Submarine] phase needs sink submarine||{rt1}Must interrupt/burst: none; dodge spit hit submarine{rt1}||Tank: hold",
                ["heroic"] = "[Spit] rotating sweep needs dodge to side; [Submarine] phase needs sink submarine||{rt1}Must interrupt/burst: none; dodge spit hit submarine{rt1}||Tank: hold",
                ["mythic"] = "[Spit] rotating sweep needs dodge to side; [Submarine] phase needs sink submarine||{rt1}Must interrupt/burst: none; dodge spit hit submarine{rt1}||Tank: hold",
                ["mythicplus"] = "[Spit] rotating sweep needs dodge to side; [Submarine] phase needs sink submarine||{rt1}Must interrupt/burst: none; dodge spit hit submarine{rt1}||Tank: hold",
            },
        },
        ["瓦丝琪"] = {
            type = "BOSS",
            name = "Lady Vashj",
            tipsByDifficulty = {
                ["lfr"] = "[Three Phase] P1 adds/P2[Poison] needs detox/P3[Shock] dodge; [Elemental] needs hit||{rt1}Must interrupt/burst: none; P2 detox P3 dodge shock{rt1}||Tank: hold; Healer: detox",
                ["normal"] = "[Three Phase] P1 adds/P2[Poison] needs detox/P3[Shock] dodge; [Elemental] needs hit||{rt1}Must interrupt/burst: none; P2 detox P3 dodge shock{rt1}||Tank: hold; Healer: detox",
                ["heroic"] = "[Three Phase] P1 adds/P2[Poison] needs detox/P3[Shock] dodge; [Elemental] needs hit||{rt1}Must interrupt/burst: none; P2 detox P3 dodge shock{rt1}||Tank: hold; Healer: detox",
                ["mythic"] = "[Three Phase] P1 adds/P2[Poison] needs detox/P3[Shock] dodge; [Elemental] needs hit||{rt1}Must interrupt/burst: none; P2 detox P3 dodge shock{rt1}||Tank: hold; Healer: detox",
                ["mythicplus"] = "[Three Phase] P1 adds/P2[Poison] needs detox/P3[Shock] dodge; [Elemental] needs hit||{rt1}Must interrupt/burst: none; P2 detox P3 dodge shock{rt1}||Tank: hold; Healer: detox",
            },
        },
        ["莫洛格里·踏潮者"] = {
            type = "BOSS",
            name = "Morogrim Tidewalker",
            tipsByDifficulty = {
                ["lfr"] = "[Watery Grave] mark circle high damage needs spread; [Healer] add needs control||{rt1}Must interrupt/burst: none; [Watery Grave] marked spread{rt1}||Tank: hold; DPS: control add",
                ["normal"] = "[Watery Grave] mark circle high damage needs spread; [Healer] add needs control||{rt1}Must interrupt/burst: none; [Watery Grave] marked spread{rt1}||Tank: hold; DPS: control add",
                ["heroic"] = "[Watery Grave] mark circle high damage needs spread; [Healer] add needs control||{rt1}Must interrupt/burst: none; [Watery Grave] marked spread{rt1}||Tank: hold; DPS: control add",
                ["mythic"] = "[Watery Grave] mark circle high damage needs spread; [Healer] add needs control||{rt1}Must interrupt/burst: none; [Watery Grave] marked spread{rt1}||Tank: hold; DPS: control add",
                ["mythicplus"] = "[Watery Grave] mark circle high damage needs spread; [Healer] add needs control||{rt1}Must interrupt/burst: none; [Watery Grave] marked spread{rt1}||Tank: hold; DPS: control add",
            },
        },
    },
    ["祖阿曼"] = {
        name = "Zul'Aman",
        ["加亚莱"] = {
            type = "BOSS",
            name = "Jan'alai",
            tipsByDifficulty = {
                ["lfr"] = "[Dragon] fire damage; [Egg] needs destroy to prevent hatch||{rt1}Must interrupt/burst: none; destroy eggs{rt1}||Tank: hold",
                ["normal"] = "[Dragon] fire damage; [Egg] needs destroy to prevent hatch||{rt1}Must interrupt/burst: none; destroy eggs{rt1}||Tank: hold",
                ["heroic"] = "[Dragon] fire damage; [Egg] needs destroy to prevent hatch||{rt1}Must interrupt/burst: none; destroy eggs{rt1}||Tank: hold",
                ["mythic"] = "[Dragon] fire damage; [Egg] needs destroy to prevent hatch||{rt1}Must interrupt/burst: none; destroy eggs{rt1}||Tank: hold",
                ["mythicplus"] = "[Dragon] fire damage; [Egg] needs destroy to prevent hatch||{rt1}Must interrupt/burst: none; destroy eggs{rt1}||Tank: hold",
            },
        },
        ["哈尔拉兹"] = {
            type = "BOSS",
            name = "Halazzi",
            tipsByDifficulty = {
                ["lfr"] = "[Tiger] charge; [Summon] adds||{rt1}Must interrupt/burst: none{rt1}||Tank: hold",
                ["normal"] = "[Tiger] charge; [Summon] adds||{rt1}Must interrupt/burst: none{rt1}||Tank: hold",
                ["heroic"] = "[Tiger] charge; [Summon] adds||{rt1}Must interrupt/burst: none{rt1}||Tank: hold",
                ["mythic"] = "[Tiger] charge; [Summon] adds||{rt1}Must interrupt/burst: none{rt1}||Tank: hold",
                ["mythicplus"] = "[Tiger] charge; [Summon] adds||{rt1}Must interrupt/burst: none{rt1}||Tank: hold",
            },
        },
        ["祖尔金"] = {
            type = "BOSS",
            name = "Zul'jin",
            tipsByDifficulty = {
                ["lfr"] = "[Bear/Eagle/Dragon/Lynx] four forms rotate each mechanic; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by form{rt1}||Tank: hold",
                ["normal"] = "[Bear/Eagle/Dragon/Lynx] four forms rotate each mechanic; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by form{rt1}||Tank: hold",
                ["heroic"] = "[Bear/Eagle/Dragon/Lynx] four forms rotate each mechanic; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by form{rt1}||Tank: hold",
                ["mythic"] = "[Bear/Eagle/Dragon/Lynx] four forms rotate each mechanic; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by form{rt1}||Tank: hold",
                ["mythicplus"] = "[Bear/Eagle/Dragon/Lynx] four forms rotate each mechanic; [Frenzy] timer||{rt1}Must interrupt/burst: none; respond by form{rt1}||Tank: hold",
            },
        },
        ["埃基尔松"] = {
            type = "BOSS",
            name = "Akil'zon",
            tipsByDifficulty = {
                ["lfr"] = "[Lightning] mark; [Bird] phase dive||{rt1}Must interrupt/burst: none; dodge lightning{rt1}||Tank: hold",
                ["normal"] = "[Lightning] mark; [Bird] phase dive||{rt1}Must interrupt/burst: none; dodge lightning{rt1}||Tank: hold",
                ["heroic"] = "[Lightning] mark; [Bird] phase dive||{rt1}Must interrupt/burst: none; dodge lightning{rt1}||Tank: hold",
                ["mythic"] = "[Lightning] mark; [Bird] phase dive||{rt1}Must interrupt/burst: none; dodge lightning{rt1}||Tank: hold",
                ["mythicplus"] = "[Lightning] mark; [Bird] phase dive||{rt1}Must interrupt/burst: none; dodge lightning{rt1}||Tank: hold",
            },
        },
        ["妖术领主玛拉卡斯"] = {
            type = "BOSS",
            name = "Hex Lord Malacrass",
            tipsByDifficulty = {
                ["lfr"] = "[Hex] turn to animal mark; [Healer] add||{rt1}Must interrupt/burst: [Hex] quick rescue{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Hex] turn to animal mark; [Healer] add||{rt1}Must interrupt/burst: [Hex] quick rescue{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Hex] turn to animal mark; [Healer] add||{rt1}Must interrupt/burst: [Hex] quick rescue{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Hex] turn to animal mark; [Healer] add||{rt1}Must interrupt/burst: [Hex] quick rescue{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Hex] turn to animal mark; [Healer] add||{rt1}Must interrupt/burst: [Hex] quick rescue{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["纳洛拉克"] = {
            type = "BOSS",
            name = "Nalorakk",
            tipsByDifficulty = {
                ["lfr"] = "[Bear/Eagle] dual form switch; [Charge]||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold",
                ["normal"] = "[Bear/Eagle] dual form switch; [Charge]||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold",
                ["heroic"] = "[Bear/Eagle] dual form switch; [Charge]||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold",
                ["mythic"] = "[Bear/Eagle] dual form switch; [Charge]||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold",
                ["mythicplus"] = "[Bear/Eagle] dual form switch; [Charge]||{rt1}Must interrupt/burst: none; switch positioning by form{rt1}||Tank: hold",
            },
        },
    },
    ["黑暗神殿"] = {
        name = "Black Temple",
        ["莎赫拉丝主母"] = {
            type = "BOSS",
            name = "Mother Shahraz",
            tipsByDifficulty = {
                ["lfr"] = "[Cleave]; [Mortal Strike]; [Mind Control] mark turns to demon needs interrupt rescue||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["normal"] = "[Cleave]; [Mortal Strike]; [Mind Control] mark turns to demon needs interrupt rescue||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["heroic"] = "[Cleave]; [Mortal Strike]; [Mind Control] mark turns to demon needs interrupt rescue||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["mythic"] = "[Cleave]; [Mortal Strike]; [Mind Control] mark turns to demon needs interrupt rescue||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
                ["mythicplus"] = "[Cleave]; [Mortal Strike]; [Mind Control] mark turns to demon needs interrupt rescue||{rt1}Must interrupt/burst: [Mind Control] quickly interrupt to save people{rt1}||Tank: hold; DPS: rescue",
            },
        },
        ["苏普雷姆斯"] = {
            type = "BOSS",
            name = "Supremus",
            tipsByDifficulty = {
                ["lfr"] = "[Burn] tracking red circle needs continuous movement; [Spark] randomly targets chaser||{rt1}Must interrupt/burst: none; [Burn] marked move away from group{rt1}||Tank: hold; DPS: dodge spark",
                ["normal"] = "[Burn] tracking red circle needs continuous movement; [Spark] randomly targets chaser||{rt1}Must interrupt/burst: none; [Burn] marked move away from group{rt1}||Tank: hold; DPS: dodge spark",
                ["heroic"] = "[Burn] tracking red circle needs continuous movement; [Spark] randomly targets chaser||{rt1}Must interrupt/burst: none; [Burn] marked move away from group{rt1}||Tank: hold; DPS: dodge spark",
                ["mythic"] = "[Burn] tracking red circle needs continuous movement; [Spark] randomly targets chaser||{rt1}Must interrupt/burst: none; [Burn] marked move away from group{rt1}||Tank: hold; DPS: dodge spark",
                ["mythicplus"] = "[Burn] tracking red circle needs continuous movement; [Spark] randomly targets chaser||{rt1}Must interrupt/burst: none; [Burn] marked move away from group{rt1}||Tank: hold; DPS: dodge spark",
            },
        },
        ["阿卡玛之影"] = {
            type = "BOSS",
            name = "Akama's Shadow",
            tipsByDifficulty = {
                ["lfr"] = "[Phase] phased progression, P2 needs protect Akama from adds killing him; [Shadow] dot||{rt1}Must interrupt/burst: none; P2 prioritize clearing adds threatening Akama{rt1}||Tank: hold; DPS: clear adds",
                ["normal"] = "[Phase] phased progression, P2 needs protect Akama from adds killing him; [Shadow] dot||{rt1}Must interrupt/burst: none; P2 prioritize clearing adds threatening Akama{rt1}||Tank: hold; DPS: clear adds",
                ["heroic"] = "[Phase] phased progression, P2 needs protect Akama from adds killing him; [Shadow] dot||{rt1}Must interrupt/burst: none; P2 prioritize clearing adds threatening Akama{rt1}||Tank: hold; DPS: clear adds",
                ["mythic"] = "[Phase] phased progression, P2 needs protect Akama from adds killing him; [Shadow] dot||{rt1}Must interrupt/burst: none; P2 prioritize clearing adds threatening Akama{rt1}||Tank: hold; DPS: clear adds",
                ["mythicplus"] = "[Phase] phased progression, P2 needs protect Akama from adds killing him; [Shadow] dot||{rt1}Must interrupt/burst: none; P2 prioritize clearing adds threatening Akama{rt1}||Tank: hold; DPS: clear adds",
            },
        },
        ["古尔图格·血沸"] = {
            type = "BOSS",
            name = "Gurtogg Bloodboil",
            tipsByDifficulty = {
                ["lfr"] = "[Bloodboil] periodic raid-wide high damage needs dual tank swap; [Acidic] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bloodboil] swap tank share{rt1}||Tank: dual tank rotate; Healer: raid heal",
                ["normal"] = "[Bloodboil] periodic raid-wide high damage needs dual tank swap; [Acidic] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bloodboil] swap tank share{rt1}||Tank: dual tank rotate; Healer: raid heal",
                ["heroic"] = "[Bloodboil] periodic raid-wide high damage needs dual tank swap; [Acidic] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bloodboil] swap tank share{rt1}||Tank: dual tank rotate; Healer: raid heal",
                ["mythic"] = "[Bloodboil] periodic raid-wide high damage needs dual tank swap; [Acidic] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bloodboil] swap tank share{rt1}||Tank: dual tank rotate; Healer: raid heal",
                ["mythicplus"] = "[Bloodboil] periodic raid-wide high damage needs dual tank swap; [Acidic] dot; [Frenzy] timer||{rt1}Must interrupt/burst: none; [Bloodboil] swap tank share{rt1}||Tank: dual tank rotate; Healer: raid heal",
            },
        },
        ["伊利丹·怒风"] = {
            type = "BOSS",
            name = "Illidan Stormrage",
            tipsByDifficulty = {
                ["lfr"] = "[Shear] mark turns to demon needs ally rescue; [Flame Wrath] place circle dodge; [Shadow] clone; P3[Demon Form] raid-wide fire damage||{rt1}Must interrupt/burst: none; [Shear] marked move away wait rescue{rt1}||Tank: hold; Healer: rescue; DPS: dodge mechanic",
                ["normal"] = "[Shear] mark turns to demon needs ally rescue; [Flame Wrath] place circle dodge; [Shadow] clone; P3[Demon Form] raid-wide fire damage||{rt1}Must interrupt/burst: none; [Shear] marked move away wait rescue{rt1}||Tank: hold; Healer: rescue; DPS: dodge mechanic",
                ["heroic"] = "[Shear] mark turns to demon needs ally rescue; [Flame Wrath] place circle dodge; [Shadow] clone; P3[Demon Form] raid-wide fire damage||{rt1}Must interrupt/burst: none; [Shear] marked move away wait rescue{rt1}||Tank: hold; Healer: rescue; DPS: dodge mechanic",
                ["mythic"] = "[Shear] mark turns to demon needs ally rescue; [Flame Wrath] place circle dodge; [Shadow] clone; P3[Demon Form] raid-wide fire damage||{rt1}Must interrupt/burst: none; [Shear] marked move away wait rescue{rt1}||Tank: hold; Healer: rescue; DPS: dodge mechanic",
                ["mythicplus"] = "[Shear] mark turns to demon needs ally rescue; [Flame Wrath] place circle dodge; [Shadow] clone; P3[Demon Form] raid-wide fire damage||{rt1}Must interrupt/burst: none; [Shear] marked move away wait rescue{rt1}||Tank: hold; Healer: rescue; DPS: dodge mechanic",
            },
        },
        ["伊利达雷议会"] = {
            type = "BOSS",
            name = "Illidari Council",
            tipsByDifficulty = {
                ["lfr"] = "[Four Advisors] fight together shared health, need spread positioning pick off one by one; mixed fire/ice/shadow||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["normal"] = "[Four Advisors] fight together shared health, need spread positioning pick off one by one; mixed fire/ice/shadow||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["heroic"] = "[Four Advisors] fight together shared health, need spread positioning pick off one by one; mixed fire/ice/shadow||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["mythic"] = "[Four Advisors] fight together shared health, need spread positioning pick off one by one; mixed fire/ice/shadow||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
                ["mythicplus"] = "[Four Advisors] fight together shared health, need spread positioning pick off one by one; mixed fire/ice/shadow||{rt1}Must interrupt/burst: none; split focus single{rt1}||Tank: split tanks; DPS: focus",
            },
        },
        ["高阶督军纳因图斯"] = {
            type = "BOSS",
            name = "High Warlord Naj'entus",
            tipsByDifficulty = {
                ["lfr"] = "[Impale] mark then marked needs ally step water circle to rescue; [Whirlwind] melee takes damage; kill drops [Vial of Vashj]||{rt1}Must interrupt/burst: none; [Impale] marked then ally use water circle to rescue{rt1}||Tank: hold; Healer: rescue; DPS: focus",
                ["normal"] = "[Impale] mark then marked needs ally step water circle to rescue; [Whirlwind] melee takes damage; kill drops [Vial of Vashj]||{rt1}Must interrupt/burst: none; [Impale] marked then ally use water circle to rescue{rt1}||Tank: hold; Healer: rescue; DPS: focus",
                ["heroic"] = "[Impale] mark then marked needs ally step water circle to rescue; [Whirlwind] melee takes damage; kill drops [Vial of Vashj]||{rt1}Must interrupt/burst: none; [Impale] marked then ally use water circle to rescue{rt1}||Tank: hold; Healer: rescue; DPS: focus",
                ["mythic"] = "[Impale] mark then marked needs ally step water circle to rescue; [Whirlwind] melee takes damage; kill drops [Vial of Vashj]||{rt1}Must interrupt/burst: none; [Impale] marked then ally use water circle to rescue{rt1}||Tank: hold; Healer: rescue; DPS: focus",
                ["mythicplus"] = "[Impale] mark then marked needs ally step water circle to rescue; [Whirlwind] melee takes damage; kill drops [Vial of Vashj]||{rt1}Must interrupt/burst: none; [Impale] marked then ally use water circle to rescue{rt1}||Tank: hold; Healer: rescue; DPS: focus",
            },
        },
        ["灵魂之匣"] = {
            type = "BOSS",
            name = "Reliquary of Souls",
            tipsByDifficulty = {
                ["lfr"] = "[Three Phase] anger/desire/suffering rotate, each phase needs corresponding interrupt and assignment; [Mana Drain] mana drained||{rt1}Must interrupt/burst: by phase assign interrupt corresponding spell{rt1}||Tank: hold; DPS: control mana",
                ["normal"] = "[Three Phase] anger/desire/suffering rotate, each phase needs corresponding interrupt and assignment; [Mana Drain] mana drained||{rt1}Must interrupt/burst: by phase assign interrupt corresponding spell{rt1}||Tank: hold; DPS: control mana",
                ["heroic"] = "[Three Phase] anger/desire/suffering rotate, each phase needs corresponding interrupt and assignment; [Mana Drain] mana drained||{rt1}Must interrupt/burst: by phase assign interrupt corresponding spell{rt1}||Tank: hold; DPS: control mana",
                ["mythic"] = "[Three Phase] anger/desire/suffering rotate, each phase needs corresponding interrupt and assignment; [Mana Drain] mana drained||{rt1}Must interrupt/burst: by phase assign interrupt corresponding spell{rt1}||Tank: hold; DPS: control mana",
                ["mythicplus"] = "[Three Phase] anger/desire/suffering rotate, each phase needs corresponding interrupt and assignment; [Mana Drain] mana drained||{rt1}Must interrupt/burst: by phase assign interrupt corresponding spell{rt1}||Tank: hold; DPS: control mana",
            },
        },
        ["塔隆·血魔"] = {
            type = "BOSS",
            name = "Teron Gorefiend",
            tipsByDifficulty = {
                ["lfr"] = "[Soul] mark then death turns to soul, needs shatter [Soul Vessel] in field or wipe; [Flame] dot||{rt1}Must interrupt/burst: none; [Soul] marked immediately go shatter the vessel{rt1}||Tank: hold; Healer: rescue soul; DPS: rescue soul",
                ["normal"] = "[Soul] mark then death turns to soul, needs shatter [Soul Vessel] in field or wipe; [Flame] dot||{rt1}Must interrupt/burst: none; [Soul] marked immediately go shatter the vessel{rt1}||Tank: hold; Healer: rescue soul; DPS: rescue soul",
                ["heroic"] = "[Soul] mark then death turns to soul, needs shatter [Soul Vessel] in field or wipe; [Flame] dot||{rt1}Must interrupt/burst: none; [Soul] marked immediately go shatter the vessel{rt1}||Tank: hold; Healer: rescue soul; DPS: rescue soul",
                ["mythic"] = "[Soul] mark then death turns to soul, needs shatter [Soul Vessel] in field or wipe; [Flame] dot||{rt1}Must interrupt/burst: none; [Soul] marked immediately go shatter the vessel{rt1}||Tank: hold; Healer: rescue soul; DPS: rescue soul",
                ["mythicplus"] = "[Soul] mark then death turns to soul, needs shatter [Soul Vessel] in field or wipe; [Flame] dot||{rt1}Must interrupt/burst: none; [Soul] marked immediately go shatter the vessel{rt1}||Tank: hold; Healer: rescue soul; DPS: rescue soul",
            },
        },
    },
    ["风暴要塞"] = {
        name = "Tempest Keep",
        ["空灵机甲"] = {
            type = "BOSS",
            name = "Al'ar",
            tipsByDifficulty = {
                ["lfr"] = "[Four Advisors] arcane/fire/ice/shadow split focus shared health; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["normal"] = "[Four Advisors] arcane/fire/ice/shadow split focus shared health; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["heroic"] = "[Four Advisors] arcane/fire/ice/shadow split focus shared health; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["mythic"] = "[Four Advisors] arcane/fire/ice/shadow split focus shared health; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
                ["mythicplus"] = "[Four Advisors] arcane/fire/ice/shadow split focus shared health; [Revive]||{rt1}Must interrupt/burst: none; split focus{rt1}||Tank: split tanks",
            },
        },
        ["大星术师索兰莉安"] = {
            type = "BOSS",
            name = "High Astromancer Solarian",
            tipsByDifficulty = {
                ["lfr"] = "[Spell] fire/ice/arcane needs interrupt; [Summon] adds||{rt1}Must interrupt/burst: interrupt [Spell]{rt1}||Tank: hold; DPS: clear adds",
                ["normal"] = "[Spell] fire/ice/arcane needs interrupt; [Summon] adds||{rt1}Must interrupt/burst: interrupt [Spell]{rt1}||Tank: hold; DPS: clear adds",
                ["heroic"] = "[Spell] fire/ice/arcane needs interrupt; [Summon] adds||{rt1}Must interrupt/burst: interrupt [Spell]{rt1}||Tank: hold; DPS: clear adds",
                ["mythic"] = "[Spell] fire/ice/arcane needs interrupt; [Summon] adds||{rt1}Must interrupt/burst: interrupt [Spell]{rt1}||Tank: hold; DPS: clear adds",
                ["mythicplus"] = "[Spell] fire/ice/arcane needs interrupt; [Summon] adds||{rt1}Must interrupt/burst: interrupt [Spell]{rt1}||Tank: hold; DPS: clear adds",
            },
        },
        ["凯尔萨斯·逐日者"] = {
            type = "BOSS",
            name = "Kael'thas Sunstrider",
            tipsByDifficulty = {
                ["lfr"] = "[Advisors] multiple waves; [Weapons] need pick corresponding weapon to break shield; [Fire]||{rt1}Must interrupt/burst: none; pick weapon break shield focus{rt1}||Tank: hold",
                ["normal"] = "[Advisors] multiple waves; [Weapons] need pick corresponding weapon to break shield; [Fire]||{rt1}Must interrupt/burst: none; pick weapon break shield focus{rt1}||Tank: hold",
                ["heroic"] = "[Advisors] multiple waves; [Weapons] need pick corresponding weapon to break shield; [Fire]||{rt1}Must interrupt/burst: none; pick weapon break shield focus{rt1}||Tank: hold",
                ["mythic"] = "[Advisors] multiple waves; [Weapons] need pick corresponding weapon to break shield; [Fire]||{rt1}Must interrupt/burst: none; pick weapon break shield focus{rt1}||Tank: hold",
                ["mythicplus"] = "[Advisors] multiple waves; [Weapons] need pick corresponding weapon to break shield; [Fire]||{rt1}Must interrupt/burst: none; pick weapon break shield focus{rt1}||Tank: hold",
            },
        },
        ["奥"] = {
            type = "BOSS",
            name = "Void Reaver",
            tipsByDifficulty = {
                ["lfr"] = "[Bomb] mark place circle; [Charge] high damage; [Flying] phase||{rt1}Must interrupt/burst: none; [Bomb] marked place circle{rt1}||Tank: hold",
                ["normal"] = "[Bomb] mark place circle; [Charge] high damage; [Flying] phase||{rt1}Must interrupt/burst: none; [Bomb] marked place circle{rt1}||Tank: hold",
                ["heroic"] = "[Bomb] mark place circle; [Charge] high damage; [Flying] phase||{rt1}Must interrupt/burst: none; [Bomb] marked place circle{rt1}||Tank: hold",
                ["mythic"] = "[Bomb] mark place circle; [Charge] high damage; [Flying] phase||{rt1}Must interrupt/burst: none; [Bomb] marked place circle{rt1}||Tank: hold",
                ["mythicplus"] = "[Bomb] mark place circle; [Charge] high damage; [Flying] phase||{rt1}Must interrupt/burst: none; [Bomb] marked place circle{rt1}||Tank: hold",
            },
        },
    },
}
