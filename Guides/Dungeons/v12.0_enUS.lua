-- ============================================================================
-- BossTips 12.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["12.0"] = {
    ["虚空之痕竞技场"] = {
        name = "Voidscar Arena",
        ["塔兹拉尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Tazral{rt8}||Stay away from [Dark Rift] suction circle||{rt1}Tank [Cosmic Spike] mitigation, [Aggregate Shadow] summons [Ethereal Shadow] quick kill{rt1}||Dodge [Void Charge] line; [Ethereal Shard] spread to avoid same person eating two; after [Astral Recall] adjust positioning",
                ["normal"] = "{rt8}Tazral{rt8}||Stay away from [Dark Rift] suction circle||{rt1}Tank [Cosmic Spike] mitigation, [Aggregate Shadow] summons [Ethereal Shadow] quick kill{rt1}||Dodge [Void Charge] line; [Ethereal Shard] spread to avoid same person eating two; after [Astral Recall] adjust positioning",
                ["heroic"] = "{rt8}Tazral{rt8}||Stay away from [Dark Rift] suction circle||{rt1}Tank [Cosmic Spike] mitigation, [Aggregate Shadow] summons [Ethereal Shadow] quick kill{rt1}||Dodge [Void Charge] line; [Ethereal Shard] spread to avoid same person eating two; after [Astral Recall] adjust positioning",
                ["mythic"] = "{rt8}Tazral{rt8}||Stay away from [Dark Rift] suction circle||{rt1}Tank [Cosmic Spike] mitigation, [Aggregate Shadow] summons [Ethereal Shadow] quick kill{rt1}||Dodge [Void Charge] line; [Ethereal Shard] spread to avoid same person eating two; after [Astral Recall] adjust positioning",
                ["mythicplus"] = "{rt8}Tazral{rt8}||Stay away from [Dark Rift] suction circle||{rt1}Tank [Cosmic Spike] mitigation, [Aggregate Shadow] summons [Ethereal Shadow] quick kill{rt1}||Dodge [Void Charge] line; [Ethereal Shard] spread to avoid same person eating two; after [Astral Recall] adjust positioning",
            },
        },
        ["法术风暴拉杰克斯"] = {
            type = "MOB",
            tips = "{rt8}Spellstorm Rajek (priority){rt8}||[Thunderstorm] random lightning||{rt1}[Disrupting Orb] not killed in time lowers whole team haste{rt1}||Removed enrage typhoon",
        },
        ["阿特洛苏斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Atross{rt8}||Dodge [Venomous Breath] front cone||{rt1}[Beastly Roar] tank mitigation, summons [Venomous Crawler] quick clear{rt1}||Stepping [Venom Spatter] poison pool loses health, pull mobs around clean ground; keep moving to avoid knockback",
                ["normal"] = "{rt8}Atross{rt8}||Dodge [Venomous Breath] front cone||{rt1}[Beastly Roar] tank mitigation, summons [Venomous Crawler] quick clear{rt1}||Stepping [Venom Spatter] poison pool loses health, pull mobs around clean ground; keep moving to avoid knockback",
                ["heroic"] = "{rt8}Atross{rt8}||Dodge [Venomous Breath] front cone||{rt1}[Beastly Roar] tank mitigation, summons [Venomous Crawler] quick clear{rt1}||Stepping [Venom Spatter] poison pool loses health, pull mobs around clean ground; keep moving to avoid knockback",
                ["mythic"] = "{rt8}Atross{rt8}||Dodge [Venomous Breath] front cone||{rt1}[Beastly Roar] tank mitigation, summons [Venomous Crawler] quick clear{rt1}||Stepping [Venom Spatter] poison pool loses health, pull mobs around clean ground; keep moving to avoid knockback",
                ["mythicplus"] = "{rt8}Atross{rt8}||Dodge [Venomous Breath] front cone||{rt1}[Beastly Roar] tank mitigation, summons [Venomous Crawler] quick clear{rt1}||Stepping [Venom Spatter] poison pool loses health, pull mobs around clean ground; keep moving to avoid knockback",
            },
        },
        ["防御龟"] = {
            type = "MOB",
            tips = "{rt8}Defender Turtle (priority){rt8}||[Turtle Shell Defense] channel limited||{rt1}After channel stunned and takes extra damage, burst then{rt1}||Focus window",
        },
        ["煞戎努斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Shar'ronnus{rt8}||Lead [Gravity Orb] to within 6 yards of [Unstable Singularity] to destroy||{rt1}[Condensed Mass] stacking slow needs distance control{rt1}||[Void Torrent]/[Cosmic Smash] knockback dodge lines; new [Dark Tide] targets tank",
                ["normal"] = "{rt8}Shar'ronnus{rt8}||Lead [Gravity Orb] to within 6 yards of [Unstable Singularity] to destroy||{rt1}[Condensed Mass] stacking slow needs distance control{rt1}||[Void Torrent]/[Cosmic Smash] knockback dodge lines; new [Dark Tide] targets tank",
                ["heroic"] = "{rt8}Shar'ronnus{rt8}||Lead [Gravity Orb] to within 6 yards of [Unstable Singularity] to destroy||{rt1}[Condensed Mass] stacking slow needs distance control{rt1}||[Void Torrent]/[Cosmic Smash] knockback dodge lines; new [Dark Tide] targets tank",
                ["mythic"] = "{rt8}Shar'ronnus{rt8}||Lead [Gravity Orb] to within 6 yards of [Unstable Singularity] to destroy||{rt1}[Condensed Mass] stacking slow needs distance control{rt1}||[Void Torrent]/[Cosmic Smash] knockback dodge lines; new [Dark Tide] targets tank",
                ["mythicplus"] = "{rt8}Shar'ronnus{rt8}||Lead [Gravity Orb] to within 6 yards of [Unstable Singularity] to destroy||{rt1}[Condensed Mass] stacking slow needs distance control{rt1}||[Void Torrent]/[Cosmic Smash] knockback dodge lines; new [Dark Tide] targets tank",
            },
        },
        ["笼控者"] = {
            type = "MOB",
            tips = "{rt8}Cage Controller (priority){rt8}||Cages around constantly spawn mobs||{rt1}Prioritize killing [Cage Controller] to stop spawning{rt1}||Otherwise infinitely clear same wave",
        },
    },
    ["纳洛拉克的洞穴"] = {
        name = "Nalorakk's Den",
        ["寒冬哨兵"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Winter Sentinel{rt8}||Dodge [Furious Gale] and [Shattering Cold Core]||{rt1}[Frost Storm] stay within 10 yards of Boss safe zone to break shield, prevent knockback{rt1}||[Glacial Torment] magic dispellable, [Winter Veil] stacking damage needs distance control; snow piles prevent slipping",
                ["normal"] = "{rt8}Winter Sentinel{rt8}||Dodge [Furious Gale] and [Shattering Cold Core]||{rt1}[Frost Storm] stay within 10 yards of Boss safe zone to break shield, prevent knockback{rt1}||[Glacial Torment] magic dispellable, [Winter Veil] stacking damage needs distance control; snow piles prevent slipping",
                ["heroic"] = "{rt8}Winter Sentinel{rt8}||Dodge [Furious Gale] and [Shattering Cold Core]||{rt1}[Frost Storm] stay within 10 yards of Boss safe zone to break shield, prevent knockback{rt1}||[Glacial Torment] magic dispellable, [Winter Veil] stacking damage needs distance control; snow piles prevent slipping",
                ["mythic"] = "{rt8}Winter Sentinel{rt8}||Dodge [Furious Gale] and [Shattering Cold Core]||{rt1}[Frost Storm] stay within 10 yards of Boss safe zone to break shield, prevent knockback{rt1}||[Glacial Torment] magic dispellable, [Winter Veil] stacking damage needs distance control; snow piles prevent slipping",
                ["mythicplus"] = "{rt8}Winter Sentinel{rt8}||Dodge [Furious Gale] and [Shattering Cold Core]||{rt1}[Frost Storm] stay within 10 yards of Boss safe zone to break shield, prevent knockback{rt1}||[Glacial Torment] magic dispellable, [Winter Veil] stacking damage needs distance control; snow piles prevent slipping",
            },
        },
        ["凛风隘口"] = {
            type = "MOB",
            tips = "{rt8}Gale Pass (priority){rt8}||Hide behind snow piles to avoid [Harsh Wind] push||{rt1}Defeat [Winter Storm] stops the area's harsh wind, snow piles prevent ice slipping{rt1}||Low priority can bypass",
        },
        ["囤宝狂人"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hoarder Grimsar{rt8}||Tank centered; [Resource Measures] at 90/70/40% empowers skills||{rt1}Mushroom pile [Rotten Mushroom] must be stepped within 12s or [Foul Burst]{rt1}||Flesh->[Mighty Roar] knockback + DoT group heal, bone pile->[Bone Spike Smash] dodge circle; [Toxic Spore] dispel poison",
                ["normal"] = "{rt8}Hoarder Grimsar{rt8}||Tank centered; [Resource Measures] at 90/70/40% empowers skills||{rt1}Mushroom pile [Rotten Mushroom] must be stepped within 12s or [Foul Burst]{rt1}||Flesh->[Mighty Roar] knockback + DoT group heal, bone pile->[Bone Spike Smash] dodge circle; [Toxic Spore] dispel poison",
                ["heroic"] = "{rt8}Hoarder Grimsar{rt8}||Tank centered; [Resource Measures] at 90/70/40% empowers skills||{rt1}Mushroom pile [Rotten Mushroom] must be stepped within 12s or [Foul Burst]{rt1}||Flesh->[Mighty Roar] knockback + DoT group heal, bone pile->[Bone Spike Smash] dodge circle; [Toxic Spore] dispel poison",
                ["mythic"] = "{rt8}Hoarder Grimsar{rt8}||Tank centered; [Resource Measures] at 90/70/40% empowers skills||{rt1}Mushroom pile [Rotten Mushroom] must be stepped within 12s or [Foul Burst]{rt1}||Flesh->[Mighty Roar] knockback + DoT group heal, bone pile->[Bone Spike Smash] dodge circle; [Toxic Spore] dispel poison",
                ["mythicplus"] = "{rt8}Hoarder Grimsar{rt8}||Tank centered; [Resource Measures] at 90/70/40% empowers skills||{rt1}Mushroom pile [Rotten Mushroom] must be stepped within 12s or [Foul Burst]{rt1}||Flesh->[Mighty Roar] knockback + DoT group heal, bone pile->[Bone Spike Smash] dodge circle; [Toxic Spore] dispel poison",
            },
        },
        ["纳洛拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Nalorakk{rt8}||[Warrior's Rage/Overwhelming Assault] is a group mechanic, Zul'gath jumps behind tank opens defensive stance||{rt1}[Echo] clones placed at edge, marked stay away{rt1}||[Mighty Roar] knockback position so not pushed into danger; tank [Mighty Smash] watch impact zone",
                ["normal"] = "{rt8}Nalorakk{rt8}||[Warrior's Rage/Overwhelming Assault] is a group mechanic, Zul'gath jumps behind tank opens defensive stance||{rt1}[Echo] clones placed at edge, marked stay away{rt1}||[Mighty Roar] knockback position so not pushed into danger; tank [Mighty Smash] watch impact zone",
                ["heroic"] = "{rt8}Nalorakk{rt8}||[Warrior's Rage/Overwhelming Assault] is a group mechanic, Zul'gath jumps behind tank opens defensive stance||{rt1}[Echo] clones placed at edge, marked stay away{rt1}||[Mighty Roar] knockback position so not pushed into danger; tank [Mighty Smash] watch impact zone",
                ["mythic"] = "{rt8}Nalorakk{rt8}||[Warrior's Rage/Overwhelming Assault] is a group mechanic, Zul'gath jumps behind tank opens defensive stance||{rt1}[Echo] clones placed at edge, marked stay away{rt1}||[Mighty Roar] knockback position so not pushed into danger; tank [Mighty Smash] watch impact zone",
                ["mythicplus"] = "{rt8}Nalorakk{rt8}||[Warrior's Rage/Overwhelming Assault] is a group mechanic, Zul'gath jumps behind tank opens defensive stance||{rt1}[Echo] clones placed at edge, marked stay away{rt1}||[Mighty Roar] knockback position so not pushed into danger; tank [Mighty Smash] watch impact zone",
            },
        },
        ["饥渴之灵"] = {
            type = "MOB",
            tips = "{rt8}Ravenous Spirit (priority){rt8}||Immune to CC||{rt1}Prioritize killing [Hunger Idol], [Agony Feast] cast group heal{rt1}||[Hunger Curse] curse dispel, CC kill",
        },
        ["献祭供奉"] = {
            type = "MOB",
            tips = "{rt8}Sacrificial Offering (priority){rt8}||Collect 6 offerings (berries/fishing/apple barrel) along the way to summon Hoarder||{rt1}Bear druid/alchemy 25 points can light incense +1% versatility, snowfield supply eat [Anchor Rune] -50% push{rt1}||Plan route ahead",
        },
    },
    ["夺目谷"] = {
        name = "Dazzling Valley",
        ["护光者鲁伊亚"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lightkeeper Ru'iya{rt8}||Moonstag form dodge [Lightfall] circles and [Lightflame] beams||{rt1}[Warder's Wrath] must interrupt{rt1}||Bear form [Shatter Strike] spread, [Agonizing Bite] stacking bleed needs full heal to clear; 40% [Grain Spirit] full skill cycle open burst",
                ["normal"] = "{rt8}Lightkeeper Ru'iya{rt8}||Moonstag form dodge [Lightfall] circles and [Lightflame] beams||{rt1}[Warder's Wrath] must interrupt{rt1}||Bear form [Shatter Strike] spread, [Agonizing Bite] stacking bleed needs full heal to clear; 40% [Grain Spirit] full skill cycle open burst",
                ["heroic"] = "{rt8}Lightkeeper Ru'iya{rt8}||Moonstag form dodge [Lightfall] circles and [Lightflame] beams||{rt1}[Warder's Wrath] must interrupt{rt1}||Bear form [Shatter Strike] spread, [Agonizing Bite] stacking bleed needs full heal to clear; 40% [Grain Spirit] full skill cycle open burst",
                ["mythic"] = "{rt8}Lightkeeper Ru'iya{rt8}||Moonstag form dodge [Lightfall] circles and [Lightflame] beams||{rt1}[Warder's Wrath] must interrupt{rt1}||Bear form [Shatter Strike] spread, [Agonizing Bite] stacking bleed needs full heal to clear; 40% [Grain Spirit] full skill cycle open burst",
                ["mythicplus"] = "{rt8}Lightkeeper Ru'iya{rt8}||Moonstag form dodge [Lightfall] circles and [Lightflame] beams||{rt1}[Warder's Wrath] must interrupt{rt1}||Bear form [Shatter Strike] spread, [Agonizing Bite] stacking bleed needs full heal to clear; 40% [Grain Spirit] full skill cycle open burst",
            },
        },
        ["辉光棘颚"] = {
            type = "MOB",
            tips = "{rt8}Radiant Spinejaw (priority){rt8}||Immune to CC||{rt1}[Agonizing Bite] tank bleed needs cleanse, dodge [Sunflare Breath] front{rt1}||Prioritize CC kill",
        },
        ["薯蛙主母"] = {
            type = "MOB",
            tips = "{rt8}Spud Frog Matron (priority){rt8}||[Tongue Lash] throws tank flying watch positioning||{rt1}[Virulent Spit] group poison dispel, quick clear [Toad Eggs] to prevent hatchlings{rt1}||[Newborn Spud Frog] knockback watch",
        },
        ["兹欧凯特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Z'okket{rt8}||Quick kill [Lightspawn Lashling] to prevent sneaking into dormancy||{rt1}[Radiant Flower Essence] orbs evenly split people to step preventing Boss gaining shield{rt1}||Use [Condensed Beam] front to clear dormant lashlings (leave puddle at edge); tank [Thorn] mitigation, [Seeping Wood] group heal",
                ["normal"] = "{rt8}Z'okket{rt8}||Quick kill [Lightspawn Lashling] to prevent sneaking into dormancy||{rt1}[Radiant Flower Essence] orbs evenly split people to step preventing Boss gaining shield{rt1}||Use [Condensed Beam] front to clear dormant lashlings (leave puddle at edge); tank [Thorn] mitigation, [Seeping Wood] group heal",
                ["heroic"] = "{rt8}Z'okket{rt8}||Quick kill [Lightspawn Lashling] to prevent sneaking into dormancy||{rt1}[Radiant Flower Essence] orbs evenly split people to step preventing Boss gaining shield{rt1}||Use [Condensed Beam] front to clear dormant lashlings (leave puddle at edge); tank [Thorn] mitigation, [Seeping Wood] group heal",
                ["mythic"] = "{rt8}Z'okket{rt8}||Quick kill [Lightspawn Lashling] to prevent sneaking into dormancy||{rt1}[Radiant Flower Essence] orbs evenly split people to step preventing Boss gaining shield{rt1}||Use [Condensed Beam] front to clear dormant lashlings (leave puddle at edge); tank [Thorn] mitigation, [Seeping Wood] group heal",
                ["mythicplus"] = "{rt8}Z'okket{rt8}||Quick kill [Lightspawn Lashling] to prevent sneaking into dormancy||{rt1}[Radiant Flower Essence] orbs evenly split people to step preventing Boss gaining shield{rt1}||Use [Condensed Beam] front to clear dormant lashlings (leave puddle at edge); tank [Thorn] mitigation, [Seeping Wood] group heal",
            },
        },
        ["光明众花"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Radiant Brood (Medik/Lexi/Kezkit){rt8}||Three share health balanced output; [Foundation Slam] tank mitigation and dodge [Fertile Soil]||{rt1}[Beam] must interrupt, stand in [Radiant Flower Beam] to block [Light Satiation] stacks{rt1}||Prevent [Radiant Flower Overgrowth] raid AoE; [Thorn Fan] spread, [Thorn Blade] bleed group heal",
                ["normal"] = "{rt8}Radiant Brood (Medik/Lexi/Kezkit){rt8}||Three share health balanced output; [Foundation Slam] tank mitigation and dodge [Fertile Soil]||{rt1}[Beam] must interrupt, stand in [Radiant Flower Beam] to block [Light Satiation] stacks{rt1}||Prevent [Radiant Flower Overgrowth] raid AoE; [Thorn Fan] spread, [Thorn Blade] bleed group heal",
                ["heroic"] = "{rt8}Radiant Brood (Medik/Lexi/Kezkit){rt8}||Three share health balanced output; [Foundation Slam] tank mitigation and dodge [Fertile Soil]||{rt1}[Beam] must interrupt, stand in [Radiant Flower Beam] to block [Light Satiation] stacks{rt1}||Prevent [Radiant Flower Overgrowth] raid AoE; [Thorn Fan] spread, [Thorn Blade] bleed group heal",
                ["mythic"] = "{rt8}Radiant Brood (Medik/Lexi/Kezkit){rt8}||Three share health balanced output; [Foundation Slam] tank mitigation and dodge [Fertile Soil]||{rt1}[Beam] must interrupt, stand in [Radiant Flower Beam] to block [Light Satiation] stacks{rt1}||Prevent [Radiant Flower Overgrowth] raid AoE; [Thorn Fan] spread, [Thorn Blade] bleed group heal",
                ["mythicplus"] = "{rt8}Radiant Brood (Medik/Lexi/Kezkit){rt8}||Three share health balanced output; [Foundation Slam] tank mitigation and dodge [Fertile Soil]||{rt1}[Beam] must interrupt, stand in [Radiant Flower Beam] to block [Light Satiation] stacks{rt1}||Prevent [Radiant Flower Overgrowth] raid AoE; [Thorn Fan] spread, [Thorn Blade] bleed group heal",
            },
        },
        ["圣光猎手伊库兹"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Light Hunter Ikuz{rt8}||Clear/dodge [Bloodthorn Roots] to avoid root||{rt1}[Verdant Stomp] knockback away from edge, [Bloodthirsty Gaze] marked run to lead Boss over roots to destroy{rt1}||[Thorn Caller's Roar] group heal; 50% [Light Berserk Rage] open burst",
                ["normal"] = "{rt8}Light Hunter Ikuz{rt8}||Clear/dodge [Bloodthorn Roots] to avoid root||{rt1}[Verdant Stomp] knockback away from edge, [Bloodthirsty Gaze] marked run to lead Boss over roots to destroy{rt1}||[Thorn Caller's Roar] group heal; 50% [Light Berserk Rage] open burst",
                ["heroic"] = "{rt8}Light Hunter Ikuz{rt8}||Clear/dodge [Bloodthorn Roots] to avoid root||{rt1}[Verdant Stomp] knockback away from edge, [Bloodthirsty Gaze] marked run to lead Boss over roots to destroy{rt1}||[Thorn Caller's Roar] group heal; 50% [Light Berserk Rage] open burst",
                ["mythic"] = "{rt8}Light Hunter Ikuz{rt8}||Clear/dodge [Bloodthorn Roots] to avoid root||{rt1}[Verdant Stomp] knockback away from edge, [Bloodthirsty Gaze] marked run to lead Boss over roots to destroy{rt1}||[Thorn Caller's Roar] group heal; 50% [Light Berserk Rage] open burst",
                ["mythicplus"] = "{rt8}Light Hunter Ikuz{rt8}||Clear/dodge [Bloodthorn Roots] to avoid root||{rt1}[Verdant Stomp] knockback away from edge, [Bloodthirsty Gaze] marked run to lead Boss over roots to destroy{rt1}||[Thorn Caller's Roar] group heal; 50% [Light Berserk Rage] open burst",
            },
        },
    },
    ["密谋小径"] = {
        name = "Plotshear Path",
        ["酒馆事件"] = {
            type = "MOB",
            tips = "{rt8}Tavern Event (priority){rt8}||Time-limited 5 stars, clearing mobs accumulates progress reaching 5 stars ends and grants buff||{rt1}During event don't switch characters, focus fire to reach quickly{rt1}||Reaching 5 stars progress reduced 20%, buff lasts 4 minutes",
        },
        ["利希尔·烬怒"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lish'ru Emberrage{rt8}||[Gul'dan's Hand] summons imps then walk [Demon Gate] through [Fel Wave] immune||{rt1}[Chaos Bolt] highest priority interrupt{rt1}||Tank picks up [Dreadlord] focus fire, [Fel Wave] buff surviving demons 100% haste must clear first; [Fel Shield] damage reduction ignored",
                ["normal"] = "{rt8}Lish'ru Emberrage{rt8}||[Gul'dan's Hand] summons imps then walk [Demon Gate] through [Fel Wave] immune||{rt1}[Chaos Bolt] highest priority interrupt{rt1}||Tank picks up [Dreadlord] focus fire, [Fel Wave] buff surviving demons 100% haste must clear first; [Fel Shield] damage reduction ignored",
                ["heroic"] = "{rt8}Lish'ru Emberrage{rt8}||[Gul'dan's Hand] summons imps then walk [Demon Gate] through [Fel Wave] immune||{rt1}[Chaos Bolt] highest priority interrupt{rt1}||Tank picks up [Dreadlord] focus fire, [Fel Wave] buff surviving demons 100% haste must clear first; [Fel Shield] damage reduction ignored",
                ["mythic"] = "{rt8}Lish'ru Emberrage{rt8}||[Gul'dan's Hand] summons imps then walk [Demon Gate] through [Fel Wave] immune||{rt1}[Chaos Bolt] highest priority interrupt{rt1}||Tank picks up [Dreadlord] focus fire, [Fel Wave] buff surviving demons 100% haste must clear first; [Fel Shield] damage reduction ignored",
                ["mythicplus"] = "{rt8}Lish'ru Emberrage{rt8}||[Gul'dan's Hand] summons imps then walk [Demon Gate] through [Fel Wave] immune||{rt1}[Chaos Bolt] highest priority interrupt{rt1}||Tank picks up [Dreadlord] focus fire, [Fel Wave] buff surviving demons 100% haste must clear first; [Fel Shield] damage reduction ignored",
            },
        },
        ["凯斯媞亚·魔力之心"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kestia Heartofmana{rt8}||Tank and pet [Nom] swap tank, quick kill pet triggers petrification weakening Boss||{rt1}[Mirror Image] appears immediately CC and focus fire, [Felstorm] must interrupt{rt1}||[Chaos Barrage] dodge front, tank mitigation",
                ["normal"] = "{rt8}Kestia Heartofmana{rt8}||Tank and pet [Nom] swap tank, quick kill pet triggers petrification weakening Boss||{rt1}[Mirror Image] appears immediately CC and focus fire, [Felstorm] must interrupt{rt1}||[Chaos Barrage] dodge front, tank mitigation",
                ["heroic"] = "{rt8}Kestia Heartofmana{rt8}||Tank and pet [Nom] swap tank, quick kill pet triggers petrification weakening Boss||{rt1}[Mirror Image] appears immediately CC and focus fire, [Felstorm] must interrupt{rt1}||[Chaos Barrage] dodge front, tank mitigation",
                ["mythic"] = "{rt8}Kestia Heartofmana{rt8}||Tank and pet [Nom] swap tank, quick kill pet triggers petrification weakening Boss||{rt1}[Mirror Image] appears immediately CC and focus fire, [Felstorm] must interrupt{rt1}||[Chaos Barrage] dodge front, tank mitigation",
                ["mythicplus"] = "{rt8}Kestia Heartofmana{rt8}||Tank and pet [Nom] swap tank, quick kill pet triggers petrification weakening Boss||{rt1}[Mirror Image] appears immediately CC and focus fire, [Felstorm] must interrupt{rt1}||[Chaos Barrage] dodge front, tank mitigation",
            },
        },
        ["腐化的术士"] = {
            type = "MOB",
            tips = "{rt8}Corrupted Warlock (priority){rt8}||[Curse of Doom] whole team split damage||{rt1}Curse dispel promptly/heal{rt1}||Prioritize CC kill to reduce stacks",
        },
        ["赞恩·刃悲"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Zane Bladesorrow{rt8}||[Virulent Poison] tank timely dispel/self-heal||{rt1}[Same-Day Delivery] barrel-throwing phase full rush{rt1}||Assign people to step [Fel Barrel] to remove, unopened barrel can block pistol; [Kill Feast] group heal",
                ["normal"] = "{rt8}Zane Bladesorrow{rt8}||[Virulent Poison] tank timely dispel/self-heal||{rt1}[Same-Day Delivery] barrel-throwing phase full rush{rt1}||Assign people to step [Fel Barrel] to remove, unopened barrel can block pistol; [Kill Feast] group heal",
                ["heroic"] = "{rt8}Zane Bladesorrow{rt8}||[Virulent Poison] tank timely dispel/self-heal||{rt1}[Same-Day Delivery] barrel-throwing phase full rush{rt1}||Assign people to step [Fel Barrel] to remove, unopened barrel can block pistol; [Kill Feast] group heal",
                ["mythic"] = "{rt8}Zane Bladesorrow{rt8}||[Virulent Poison] tank timely dispel/self-heal||{rt1}[Same-Day Delivery] barrel-throwing phase full rush{rt1}||Assign people to step [Fel Barrel] to remove, unopened barrel can block pistol; [Kill Feast] group heal",
                ["mythicplus"] = "{rt8}Zane Bladesorrow{rt8}||[Virulent Poison] tank timely dispel/self-heal||{rt1}[Same-Day Delivery] barrel-throwing phase full rush{rt1}||Assign people to step [Fel Barrel] to remove, unopened barrel can block pistol; [Kill Feast] group heal",
            },
        },
        ["歼灭者萨祖克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Annihilator Sazzox{rt8}||Dodge front axe, keep moving||{rt1}Marked spawns [Great Axe] quick dismantle to prevent damage boost{rt1}||Tank centered, [Demonfury] open big mitigation positioning dodge [Fel Pool]; [Burning Steps] long duration tests movement",
                ["normal"] = "{rt8}Annihilator Sazzox{rt8}||Dodge front axe, keep moving||{rt1}Marked spawns [Great Axe] quick dismantle to prevent damage boost{rt1}||Tank centered, [Demonfury] open big mitigation positioning dodge [Fel Pool]; [Burning Steps] long duration tests movement",
                ["heroic"] = "{rt8}Annihilator Sazzox{rt8}||Dodge front axe, keep moving||{rt1}Marked spawns [Great Axe] quick dismantle to prevent damage boost{rt1}||Tank centered, [Demonfury] open big mitigation positioning dodge [Fel Pool]; [Burning Steps] long duration tests movement",
                ["mythic"] = "{rt8}Annihilator Sazzox{rt8}||Dodge front axe, keep moving||{rt1}Marked spawns [Great Axe] quick dismantle to prevent damage boost{rt1}||Tank centered, [Demonfury] open big mitigation positioning dodge [Fel Pool]; [Burning Steps] long duration tests movement",
                ["mythicplus"] = "{rt8}Annihilator Sazzox{rt8}||Dodge front axe, keep moving||{rt1}Marked spawns [Great Axe] quick dismantle to prevent damage boost{rt1}||Tank centered, [Demonfury] open big mitigation positioning dodge [Fel Pool]; [Burning Steps] long duration tests movement",
            },
        },
    },
    ["毒牙祭坛"] = {
        name = "Venomfang Altar",
        ["双毒牙劫掠者"] = {
            type = "MOB",
            tips = "{rt8}Twin Fang Pillager (priority){rt8}||Immune to CC, [Crippling Shot] needs magic dispel/freedom||{rt1}Face [Venom Breath] outward, [Double Strike] tank use mitigation{rt1}||High melee damage, stay away from front",
        },
        ["腐蚀迷雾图腾"] = {
            type = "MOB",
            tips = "{rt8}Corrosive Mist Totem (priority){rt8}||6 totems in first zone, interact to destroy to open door; taking damage no longer interrupts destruction||{rt1}Quickly interact spaced destruction, avoid [Unstable Totem] sustained poison{rt1}||Interaction range increased, prioritize clearing guard mobs",
        },
        ["扭缠盘蛇"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Coiling Serpent{rt8}||[Sync Venom] constant health drain throughout needs group heal||{rt1}[Toxic Atrophy] three consecutive must interrupt each time{rt1}||[Vengeful Assault] walk out of [Burrow Charge] line, lead [Venom Spray] front away from group; [Tail Blade] tank mitigation",
                ["normal"] = "{rt8}Coiling Serpent{rt8}||[Sync Venom] constant health drain throughout needs group heal||{rt1}[Toxic Atrophy] three consecutive must interrupt each time{rt1}||[Vengeful Assault] walk out of [Burrow Charge] line, lead [Venom Spray] front away from group; [Tail Blade] tank mitigation",
                ["heroic"] = "{rt8}Coiling Serpent{rt8}||[Sync Venom] constant health drain throughout needs group heal||{rt1}[Toxic Atrophy] three consecutive must interrupt each time{rt1}||[Vengeful Assault] walk out of [Burrow Charge] line, lead [Venom Spray] front away from group; [Tail Blade] tank mitigation",
                ["mythic"] = "{rt8}Coiling Serpent{rt8}||[Sync Venom] constant health drain throughout needs group heal||{rt1}[Toxic Atrophy] three consecutive must interrupt each time{rt1}||[Vengeful Assault] walk out of [Burrow Charge] line, lead [Venom Spray] front away from group; [Tail Blade] tank mitigation",
                ["mythicplus"] = "{rt8}Coiling Serpent{rt8}||[Sync Venom] constant health drain throughout needs group heal||{rt1}[Toxic Atrophy] three consecutive must interrupt each time{rt1}||[Vengeful Assault] walk out of [Burrow Charge] line, lead [Venom Spray] front away from group; [Tail Blade] tank mitigation",
            },
        },
        ["祖尔加"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Zul'gath{rt8}||[Ritual Venom] appears even non-mythic, split/self-heal||{rt1}Interrupt/block [Venomfang Ritual] beam, those buffed by [Venomfang Empower] prioritize kill to avoid{rt1}||[Cleaver] dodge flying axes by red arrow, [Boneripper] sustained damage dispel/mitigate",
                ["normal"] = "{rt8}Zul'gath{rt8}||[Ritual Venom] appears even non-mythic, split/self-heal||{rt1}Interrupt/block [Venomfang Ritual] beam, those buffed by [Venomfang Empower] prioritize kill to avoid{rt1}||[Cleaver] dodge flying axes by red arrow, [Boneripper] sustained damage dispel/mitigate",
                ["heroic"] = "{rt8}Zul'gath{rt8}||[Ritual Venom] appears even non-mythic, split/self-heal||{rt1}Interrupt/block [Venomfang Ritual] beam, those buffed by [Venomfang Empower] prioritize kill to avoid{rt1}||[Cleaver] dodge flying axes by red arrow, [Boneripper] sustained damage dispel/mitigate",
                ["mythic"] = "{rt8}Zul'gath{rt8}||[Ritual Venom] appears even non-mythic, split/self-heal||{rt1}Interrupt/block [Venomfang Ritual] beam, those buffed by [Venomfang Empower] prioritize kill to avoid{rt1}||[Cleaver] dodge flying axes by red arrow, [Boneripper] sustained damage dispel/mitigate",
                ["mythicplus"] = "{rt8}Zul'gath{rt8}||[Ritual Venom] appears even non-mythic, split/self-heal||{rt1}Interrupt/block [Venomfang Ritual] beam, those buffed by [Venomfang Empower] prioritize kill to avoid{rt1}||[Cleaver] dodge flying axes by red arrow, [Boneripper] sustained damage dispel/mitigate",
            },
        },
        ["拉维"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ravi{rt8}||At start interact to destroy 6 [Corrosive Mist Totem] to open door; during [Feeding Frenzy] phase pull boss toward flesh piles without corpses, whole team step on [Filth Eater] to break shield||{rt1}[Regurgitate] disease needs dispel and dodge wave, [Triple Spit] loose positioning{rt1}||Before [Carrion Eruption] top off health; [Scent of Blood] near flesh piles raises attack speed; tank [Water Slam] heavy damage use mitigation",
                ["normal"] = "{rt8}Ravi{rt8}||At start interact to destroy 6 [Corrosive Mist Totem] to open door; during [Feeding Frenzy] phase pull boss toward flesh piles without corpses, whole team step on [Filth Eater] to break shield||{rt1}[Regurgitate] disease needs dispel and dodge wave, [Triple Spit] loose positioning{rt1}||Before [Carrion Eruption] top off health; [Scent of Blood] near flesh piles raises attack speed; tank [Water Slam] heavy damage use mitigation",
                ["heroic"] = "{rt8}Ravi{rt8}||At start interact to destroy 6 [Corrosive Mist Totem] to open door; during [Feeding Frenzy] phase pull boss toward flesh piles without corpses, whole team step on [Filth Eater] to break shield||{rt1}[Regurgitate] disease needs dispel and dodge wave, [Triple Spit] loose positioning{rt1}||Before [Carrion Eruption] top off health; [Scent of Blood] near flesh piles raises attack speed; tank [Water Slam] heavy damage use mitigation",
                ["mythic"] = "{rt8}Ravi{rt8}||At start interact to destroy 6 [Corrosive Mist Totem] to open door; during [Feeding Frenzy] phase pull boss toward flesh piles without corpses, whole team step on [Filth Eater] to break shield||{rt1}[Regurgitate] disease needs dispel and dodge wave, [Triple Spit] loose positioning{rt1}||Before [Carrion Eruption] top off health; [Scent of Blood] near flesh piles raises attack speed; tank [Water Slam] heavy damage use mitigation",
                ["mythicplus"] = "{rt8}Ravi{rt8}||At start interact to destroy 6 [Corrosive Mist Totem] to open door; during [Feeding Frenzy] phase pull boss toward flesh piles without corpses, whole team step on [Filth Eater] to break shield||{rt1}[Regurgitate] disease needs dispel and dodge wave, [Triple Spit] loose positioning{rt1}||Before [Carrion Eruption] top off health; [Scent of Blood] near flesh piles raises attack speed; tank [Water Slam] heavy damage use mitigation",
            },
        },
        ["高阶进化者"] = {
            type = "MOB",
            tips = "{rt8}High Evolver (priority){rt8}||[Poison Damage] cast must interrupt, poison dispellable||{rt1}Use CC to interrupt [Evolve] cast, prevent it becoming [Mass Poison Damage]{rt1}||Prioritize CC kill",
        },
        ["晋升之蛇"] = {
            type = "MOB",
            tips = "{rt8}Ascendant Serpent (priority){rt8}||[Infect] summons larvae, disappear after defeated||{rt1}[Piercing Hiss] must interrupt{rt1}||Quickly clear [Larvae] to prevent berserk, avoid stepping on virulent cyclone",
        },
    },
}
