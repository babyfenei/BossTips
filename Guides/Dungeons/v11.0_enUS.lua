-- ============================================================================
-- BossTips 11.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["11.0"] = {
    ["千丝之城"] = {
        name = "City of Threads",
        ["谢非提克"] = {
            type = "MOB",
            tips = "{rt8}Shef'tik{rt8}||key fight to find spy via pheromone: interrupt [Web Arrow], dodge [Perfume Toss] marked floor and [Net Barrage]",
        },
        ["女王之牙"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Queen's Tooth{rt8}||3 spies kill one by one: dodge [Void Smash] (after vanish jumps behind to drop head-front floor); [Void Rush] marked physical direct + spell DoT, cover cooldowns",
                ["normal"] = "{rt8}Queen's Tooth{rt8}||3 spies kill one by one: dodge [Void Smash] (after vanish jumps behind to drop head-front floor); [Void Rush] marked physical direct + spell DoT, cover cooldowns",
                ["heroic"] = "{rt8}Queen's Tooth{rt8}||3 spies kill one by one: dodge [Void Smash] (after vanish jumps behind to drop head-front floor); [Void Rush] marked physical direct + spell DoT, cover cooldowns",
                ["mythic"] = "{rt8}Queen's Tooth{rt8}||3 spies kill one by one: dodge [Void Smash] (after vanish jumps behind to drop head-front floor); [Void Rush] marked physical direct + spell DoT, cover cooldowns",
                ["mythicplus"] = "{rt8}Queen's Tooth{rt8}||3 spies kill one by one: dodge [Void Smash] (after vanish jumps behind to drop head-front floor); [Void Rush] marked physical direct + spell DoT, cover cooldowns",
            },
        },
        ["皇家虫群卫士"] = {
            type = "MOB",
            tips = "{rt8}Royal Swarmguard{rt8}||[Greedy Worm] group DoT 6s; dodge head-front cone [Earthshatter Smash]",
        },
        ["苏雷吉缚丝者"] = {
            type = "MOB",
            tips = "{rt8}Sureki Webber{rt8}||{rt1}must interrupt [Binding Strands]{rt1} (binds and continuous damage, completing channel stuns); [Web Arrow] if spare interrupt",
        },
        ["凝结聚合体"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Condensed Aggregation{rt8}||[Viscous Darkness] knocks back whole group and releases [Black Blood Orb]s from surrounding containers moving toward boss, {rt1}must ram all orbs at field edge{rt1}, each orb boss eats heals||ramming orbs gives absorb-heal debuff stacking, one ~2 orbs, don't be greedy||tank [Overflow Smash] (-30% healing taken) cooldowns; [Blood Surge] cast melee run out 8 yards and dodge black blood at feet||at full energy [Dark Pulse] whole-group AoE, cooldowns + burst heal; everyone except tank stay away from boss",
                ["normal"] = "{rt8}Condensed Aggregation{rt8}||[Viscous Darkness] knocks back whole group and releases [Black Blood Orb]s from surrounding containers moving toward boss, {rt1}must ram all orbs at field edge{rt1}, each orb boss eats heals||ramming orbs gives absorb-heal debuff stacking, one ~2 orbs, don't be greedy||tank [Overflow Smash] (-30% healing taken) cooldowns; [Blood Surge] cast melee run out 8 yards and dodge black blood at feet||at full energy [Dark Pulse] whole-group AoE, cooldowns + burst heal; everyone except tank stay away from boss",
                ["heroic"] = "{rt8}Condensed Aggregation{rt8}||[Viscous Darkness] knocks back whole group and releases [Black Blood Orb]s from surrounding containers moving toward boss, {rt1}must ram all orbs at field edge{rt1}, each orb boss eats heals||ramming orbs gives absorb-heal debuff stacking, one ~2 orbs, don't be greedy||tank [Overflow Smash] (-30% healing taken) cooldowns; [Blood Surge] cast melee run out 8 yards and dodge black blood at feet||at full energy [Dark Pulse] whole-group AoE, cooldowns + burst heal; everyone except tank stay away from boss",
                ["mythic"] = "{rt8}Condensed Aggregation{rt8}||[Viscous Darkness] knocks back whole group and releases [Black Blood Orb]s from surrounding containers moving toward boss, {rt1}must ram all orbs at field edge{rt1}, each orb boss eats heals||ramming orbs gives absorb-heal debuff stacking, one ~2 orbs, don't be greedy||tank [Overflow Smash] (-30% healing taken) cooldowns; [Blood Surge] cast melee run out 8 yards and dodge black blood at feet||at full energy [Dark Pulse] whole-group AoE, cooldowns + burst heal; everyone except tank stay away from boss",
                ["mythicplus"] = "{rt8}Condensed Aggregation{rt8}||[Viscous Darkness] knocks back whole group and releases [Black Blood Orb]s from surrounding containers moving toward boss, {rt1}must ram all orbs at field edge{rt1}, each orb boss eats heals||ramming orbs gives absorb-heal debuff stacking, one ~2 orbs, don't be greedy||tank [Overflow Smash] (-30% healing taken) cooldowns; [Blood Surge] cast melee run out 8 yards and dodge black blood at feet||at full energy [Dark Pulse] whole-group AoE, cooldowns + burst heal; everyone except tank stay away from boss",
            },
        },
        ["隐秘网士"] = {
            type = "MOB",
            tips = "{rt8}Covert Webber{rt8}||{rt1}must interrupt [Covert Blast] and [Healing Web]{rt1} (former bounces between players, latter channels heal)",
        },
        ["敏捷的追击者"] = {
            type = "MOB",
            tips = "{rt8}Swift Pursuer{rt8}||random marked flying dagger physical damage, watch health when low, controllable interruptible",
        },
        ["苏雷吉剧毒之刃"] = {
            type = "MOB",
            tips = "{rt8}Sureki Venomblade{rt8}||[Venomblade] hits tank direct + poison, this dungeon poison dispel top priority, dispel promptly",
        },
        ["掠网者"] = {
            type = "MOB",
            tips = "{rt8}Web Reaver{rt8}||hits tank with +10% damage for 30s, tank watch stacks and cooldown timing",
        },
        ["演说者基克斯威兹克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Speaker Kix'vizk{rt8}||whole fight locked by [Oppressive Chain] within 10-yard circle at boss feet, leaving circle over 1s drains health and pulls back, don't try to run out||tank [Suppress] (physical + shadow + slow) cooldowns, this fight pressure mainly on tank||[Deafening Indoctrination] 4s whole-group AoE then leaves growing [Lingering Influence] black water at boss feet: place circle by wall, after end whole group moves uniformly with tank||side-step dodge [Terrifying Glare] cone (hit fears 4s); [Shadow of Doubt] marks 2 players, marked stand still, end fires 5 orbs, {rt1}tank must not eat orbs{rt1} (stun easy to drop tank)",
                ["normal"] = "{rt8}Speaker Kix'vizk{rt8}||whole fight locked by [Oppressive Chain] within 10-yard circle at boss feet, leaving circle over 1s drains health and pulls back, don't try to run out||tank [Suppress] (physical + shadow + slow) cooldowns, this fight pressure mainly on tank||[Deafening Indoctrination] 4s whole-group AoE then leaves growing [Lingering Influence] black water at boss feet: place circle by wall, after end whole group moves uniformly with tank||side-step dodge [Terrifying Glare] cone (hit fears 4s); [Shadow of Doubt] marks 2 players, marked stand still, end fires 5 orbs, {rt1}tank must not eat orbs{rt1} (stun easy to drop tank)",
                ["heroic"] = "{rt8}Speaker Kix'vizk{rt8}||whole fight locked by [Oppressive Chain] within 10-yard circle at boss feet, leaving circle over 1s drains health and pulls back, don't try to run out||tank [Suppress] (physical + shadow + slow) cooldowns, this fight pressure mainly on tank||[Deafening Indoctrination] 4s whole-group AoE then leaves growing [Lingering Influence] black water at boss feet: place circle by wall, after end whole group moves uniformly with tank||side-step dodge [Terrifying Glare] cone (hit fears 4s); [Shadow of Doubt] marks 2 players, marked stand still, end fires 5 orbs, {rt1}tank must not eat orbs{rt1} (stun easy to drop tank)",
                ["mythic"] = "{rt8}Speaker Kix'vizk{rt8}||whole fight locked by [Oppressive Chain] within 10-yard circle at boss feet, leaving circle over 1s drains health and pulls back, don't try to run out||tank [Suppress] (physical + shadow + slow) cooldowns, this fight pressure mainly on tank||[Deafening Indoctrination] 4s whole-group AoE then leaves growing [Lingering Influence] black water at boss feet: place circle by wall, after end whole group moves uniformly with tank||side-step dodge [Terrifying Glare] cone (hit fears 4s); [Shadow of Doubt] marks 2 players, marked stand still, end fires 5 orbs, {rt1}tank must not eat orbs{rt1} (stun easy to drop tank)",
                ["mythicplus"] = "{rt8}Speaker Kix'vizk{rt8}||whole fight locked by [Oppressive Chain] within 10-yard circle at boss feet, leaving circle over 1s drains health and pulls back, don't try to run out||tank [Suppress] (physical + shadow + slow) cooldowns, this fight pressure mainly on tank||[Deafening Indoctrination] 4s whole-group AoE then leaves growing [Lingering Influence] black water at boss feet: place circle by wall, after end whole group moves uniformly with tank||side-step dodge [Terrifying Glare] cone (hit fears 4s); [Shadow of Doubt] marks 2 players, marked stand still, end fires 5 orbs, {rt1}tank must not eat orbs{rt1} (stun easy to drop tank)",
            },
        },
        ["安苏雷克的传令官"] = {
            type = "MOB",
            tips = "{rt8}Ansurek's Herald{rt8}||{rt1}must interrupt [Twisted Thoughts]{rt1} (marked high damage); [Shadow of Doubt] first leave group then dispel, dodge the 5 directional waves fired",
        },
        ["大捻接师艾佐"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Grand Fuse Master Ezo{rt8}||3 [Mutated Anomaly] orbs on field swap position every 9s, watch landing circle prep dodge, don't stand in flight path, tank pull boss backward||[Fuse] whole-group continuous shadow DoT, on read pre-lay cooldowns and group heal||[Quake Smash] avatar spider-lord slams, within 12 yards extra huge damage, melee run out fast; then {rt1}[Greedy Beetle] immediately group-control + switch{rt1} (chews 5 times then explodes and stuns 4s)||[Umbral Weave] whole group netted rooted 12s, group up to break net fast; then [Scrap Protocol] recalls all orbs one by one crushing, melee run out 10 yards, tank big cooldowns",
                ["normal"] = "{rt8}Grand Fuse Master Ezo{rt8}||3 [Mutated Anomaly] orbs on field swap position every 9s, watch landing circle prep dodge, don't stand in flight path, tank pull boss backward||[Fuse] whole-group continuous shadow DoT, on read pre-lay cooldowns and group heal||[Quake Smash] avatar spider-lord slams, within 12 yards extra huge damage, melee run out fast; then {rt1}[Greedy Beetle] immediately group-control + switch{rt1} (chews 5 times then explodes and stuns 4s)||[Umbral Weave] whole group netted rooted 12s, group up to break net fast; then [Scrap Protocol] recalls all orbs one by one crushing, melee run out 10 yards, tank big cooldowns",
                ["heroic"] = "{rt8}Grand Fuse Master Ezo{rt8}||3 [Mutated Anomaly] orbs on field swap position every 9s, watch landing circle prep dodge, don't stand in flight path, tank pull boss backward||[Fuse] whole-group continuous shadow DoT, on read pre-lay cooldowns and group heal||[Quake Smash] avatar spider-lord slams, within 12 yards extra huge damage, melee run out fast; then {rt1}[Greedy Beetle] immediately group-control + switch{rt1} (chews 5 times then explodes and stuns 4s)||[Umbral Weave] whole group netted rooted 12s, group up to break net fast; then [Scrap Protocol] recalls all orbs one by one crushing, melee run out 10 yards, tank big cooldowns",
                ["mythic"] = "{rt8}Grand Fuse Master Ezo{rt8}||3 [Mutated Anomaly] orbs on field swap position every 9s, watch landing circle prep dodge, don't stand in flight path, tank pull boss backward||[Fuse] whole-group continuous shadow DoT, on read pre-lay cooldowns and group heal||[Quake Smash] avatar spider-lord slams, within 12 yards extra huge damage, melee run out fast; then {rt1}[Greedy Beetle] immediately group-control + switch{rt1} (chews 5 times then explodes and stuns 4s)||[Umbral Weave] whole group netted rooted 12s, group up to break net fast; then [Scrap Protocol] recalls all orbs one by one crushing, melee run out 10 yards, tank big cooldowns",
                ["mythicplus"] = "{rt8}Grand Fuse Master Ezo{rt8}||3 [Mutated Anomaly] orbs on field swap position every 9s, watch landing circle prep dodge, don't stand in flight path, tank pull boss backward||[Fuse] whole-group continuous shadow DoT, on read pre-lay cooldowns and group heal||[Quake Smash] avatar spider-lord slams, within 12 yards extra huge damage, melee run out fast; then {rt1}[Greedy Beetle] immediately group-control + switch{rt1} (chews 5 times then explodes and stuns 4s)||[Umbral Weave] whole group netted rooted 12s, group up to break net fast; then [Scrap Protocol] recalls all orbs one by one crushing, melee run out 10 yards, tank big cooldowns",
            },
        },
    },
    ["矶石宝库"] = {
        name = "The Stonevault",
        ["被转化的代言人"] = {
            type = "MOB",
            tips = "{rt8}Transformed Mouthpiece{rt8}||[Silencing Gear] single silence, if spare interrupt break it, don't let healer be silenced",
        },
        ["熔炉装货工"] = {
            type = "MOB",
            tips = "{rt8}Furnace Loader{rt8}||dodge head-front fireball; [Magma Mortar] marked high damage, marked cooldowns",
        },
        ["机械大师"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mech Master{rt8}||{rt1}the two must die simultaneously{rt1}, else the later-dying enrages, even-health whole fight||[Mouthpiece Brokk]：{rt1}must interrupt [Molten Water]{rt1} (whole-group AoE + slow); [Waste Chant] jumps to field edge pushing mud truck across center, absolutely don't stand in middle straight lane||[Mouthpiece Dolyta]：dodge head-front [Magma Discharge] fireball, tank cover [Magma Hammer] cooldowns; [Dismantle] pull waste block to center spawn 40-yard fire circle, stand field top / bottom to dodge explosion and following 4 magma waves||[Activate Ventilation] activate three at corners, tank bring two bosses to the vent not spewing fire",
                ["normal"] = "{rt8}Mech Master{rt8}||{rt1}the two must die simultaneously{rt1}, else the later-dying enrages, even-health whole fight||[Mouthpiece Brokk]：{rt1}must interrupt [Molten Water]{rt1} (whole-group AoE + slow); [Waste Chant] jumps to field edge pushing mud truck across center, absolutely don't stand in middle straight lane||[Mouthpiece Dolyta]：dodge head-front [Magma Discharge] fireball, tank cover [Magma Hammer] cooldowns; [Dismantle] pull waste block to center spawn 40-yard fire circle, stand field top / bottom to dodge explosion and following 4 magma waves||[Activate Ventilation] activate three at corners, tank bring two bosses to the vent not spewing fire",
                ["heroic"] = "{rt8}Mech Master{rt8}||{rt1}the two must die simultaneously{rt1}, else the later-dying enrages, even-health whole fight||[Mouthpiece Brokk]：{rt1}must interrupt [Molten Water]{rt1} (whole-group AoE + slow); [Waste Chant] jumps to field edge pushing mud truck across center, absolutely don't stand in middle straight lane||[Mouthpiece Dolyta]：dodge head-front [Magma Discharge] fireball, tank cover [Magma Hammer] cooldowns; [Dismantle] pull waste block to center spawn 40-yard fire circle, stand field top / bottom to dodge explosion and following 4 magma waves||[Activate Ventilation] activate three at corners, tank bring two bosses to the vent not spewing fire",
                ["mythic"] = "{rt8}Mech Master{rt8}||{rt1}the two must die simultaneously{rt1}, else the later-dying enrages, even-health whole fight||[Mouthpiece Brokk]：{rt1}must interrupt [Molten Water]{rt1} (whole-group AoE + slow); [Waste Chant] jumps to field edge pushing mud truck across center, absolutely don't stand in middle straight lane||[Mouthpiece Dolyta]：dodge head-front [Magma Discharge] fireball, tank cover [Magma Hammer] cooldowns; [Dismantle] pull waste block to center spawn 40-yard fire circle, stand field top / bottom to dodge explosion and following 4 magma waves||[Activate Ventilation] activate three at corners, tank bring two bosses to the vent not spewing fire",
                ["mythicplus"] = "{rt8}Mech Master{rt8}||{rt1}the two must die simultaneously{rt1}, else the later-dying enrages, even-health whole fight||[Mouthpiece Brokk]：{rt1}must interrupt [Molten Water]{rt1} (whole-group AoE + slow); [Waste Chant] jumps to field edge pushing mud truck across center, absolutely don't stand in middle straight lane||[Mouthpiece Dolyta]：dodge head-front [Magma Discharge] fireball, tank cover [Magma Hammer] cooldowns; [Dismantle] pull waste block to center spawn 40-yard fire circle, stand field top / bottom to dodge explosion and following 4 magma waves||[Activate Ventilation] activate three at corners, tank bring two bosses to the vent not spewing fire",
            },
        },
        ["炉铸愈疗者"] = {
            type = "MOB",
            tips = "{rt8}Forge Healer{rt8}||{rt1}must interrupt [Mend Metal]{rt1} (heals ally 40% health)",
        },
        ["大地注能魔像"] = {
            type = "MOB",
            tips = "{rt8}Earthcharged Golem{rt8}||[Earthshatter] whole-group AoE cooldowns; dodge head-front [Earthquake Wave]",
        },
        ["虚空代言人艾里克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Erik the Voidcaller{rt8}||[Entropic Reckoning] marks everyone, end leaves black water at feet: whole group gather stack to place to save field, then leave together||dodge head-front huge cone [Unbounded Void], closer to boss easier dodge||{rt1}[Void Corruption] DoT +25% damage every 3s, only within 15 yards of [Void Bloom] rift can clear{rt1}; each clear black hole shifts, whole group go to same hole instant clear, watch not sucked within 3 yards (instant death), keep movement to escape",
                ["normal"] = "{rt8}Erik the Voidcaller{rt8}||[Entropic Reckoning] marks everyone, end leaves black water at feet: whole group gather stack to place to save field, then leave together||dodge head-front huge cone [Unbounded Void], closer to boss easier dodge||{rt1}[Void Corruption] DoT +25% damage every 3s, only within 15 yards of [Void Bloom] rift can clear{rt1}; each clear black hole shifts, whole group go to same hole instant clear, watch not sucked within 3 yards (instant death), keep movement to escape",
                ["heroic"] = "{rt8}Erik the Voidcaller{rt8}||[Entropic Reckoning] marks everyone, end leaves black water at feet: whole group gather stack to place to save field, then leave together||dodge head-front huge cone [Unbounded Void], closer to boss easier dodge||{rt1}[Void Corruption] DoT +25% damage every 3s, only within 15 yards of [Void Bloom] rift can clear{rt1}; each clear black hole shifts, whole group go to same hole instant clear, watch not sucked within 3 yards (instant death), keep movement to escape",
                ["mythic"] = "{rt8}Erik the Voidcaller{rt8}||[Entropic Reckoning] marks everyone, end leaves black water at feet: whole group gather stack to place to save field, then leave together||dodge head-front huge cone [Unbounded Void], closer to boss easier dodge||{rt1}[Void Corruption] DoT +25% damage every 3s, only within 15 yards of [Void Bloom] rift can clear{rt1}; each clear black hole shifts, whole group go to same hole instant clear, watch not sucked within 3 yards (instant death), keep movement to escape",
                ["mythicplus"] = "{rt8}Erik the Voidcaller{rt8}||[Entropic Reckoning] marks everyone, end leaves black water at feet: whole group gather stack to place to save field, then leave together||dodge head-front huge cone [Unbounded Void], closer to boss easier dodge||{rt1}[Void Corruption] DoT +25% damage every 3s, only within 15 yards of [Void Bloom] rift can clear{rt1}; each clear black hole shifts, whole group go to same hole instant clear, watch not sucked within 3 yards (instant death), keep movement to escape",
            },
        },
        ["斯卡莫拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Skarmorak{rt8}||[Crystalline Smash] hits tank then leaves purple circle and spawns [Crystal Shard], {rt1}prioritize switch to shards{rt1} (tank can pull boss over for cleave), each alive shard gives [Disintegration Shell] shield; don't detonate multiple at once, watch cooldowns heal||[Unstable Crush] dodge big circle near boss, then floor circle spawns black [Void Shard] energy orb, eating orb +50% damage to shield with DoT, tanky / cooldowned eat more||[Recycle] sucks remaining crystals into shield and starts [Void Release] more AoE more pain, full burst break shield fast",
                ["normal"] = "{rt8}Skarmorak{rt8}||[Crystalline Smash] hits tank then leaves purple circle and spawns [Crystal Shard], {rt1}prioritize switch to shards{rt1} (tank can pull boss over for cleave), each alive shard gives [Disintegration Shell] shield; don't detonate multiple at once, watch cooldowns heal||[Unstable Crush] dodge big circle near boss, then floor circle spawns black [Void Shard] energy orb, eating orb +50% damage to shield with DoT, tanky / cooldowned eat more||[Recycle] sucks remaining crystals into shield and starts [Void Release] more AoE more pain, full burst break shield fast",
                ["heroic"] = "{rt8}Skarmorak{rt8}||[Crystalline Smash] hits tank then leaves purple circle and spawns [Crystal Shard], {rt1}prioritize switch to shards{rt1} (tank can pull boss over for cleave), each alive shard gives [Disintegration Shell] shield; don't detonate multiple at once, watch cooldowns heal||[Unstable Crush] dodge big circle near boss, then floor circle spawns black [Void Shard] energy orb, eating orb +50% damage to shield with DoT, tanky / cooldowned eat more||[Recycle] sucks remaining crystals into shield and starts [Void Release] more AoE more pain, full burst break shield fast",
                ["mythic"] = "{rt8}Skarmorak{rt8}||[Crystalline Smash] hits tank then leaves purple circle and spawns [Crystal Shard], {rt1}prioritize switch to shards{rt1} (tank can pull boss over for cleave), each alive shard gives [Disintegration Shell] shield; don't detonate multiple at once, watch cooldowns heal||[Unstable Crush] dodge big circle near boss, then floor circle spawns black [Void Shard] energy orb, eating orb +50% damage to shield with DoT, tanky / cooldowned eat more||[Recycle] sucks remaining crystals into shield and starts [Void Release] more AoE more pain, full burst break shield fast",
                ["mythicplus"] = "{rt8}Skarmorak{rt8}||[Crystalline Smash] hits tank then leaves purple circle and spawns [Crystal Shard], {rt1}prioritize switch to shards{rt1} (tank can pull boss over for cleave), each alive shard gives [Disintegration Shell] shield; don't detonate multiple at once, watch cooldowns heal||[Unstable Crush] dodge big circle near boss, then floor circle spawns black [Void Shard] energy orb, eating orb +50% damage to shield with DoT, tanky / cooldowned eat more||[Recycle] sucks remaining crystals into shield and starts [Void Release] more AoE more pain, full burst break shield fast",
            },
        },
        ["咒炉荣誉卫兵"] = {
            type = "MOB",
            tips = "{rt8}Curge Forge Honor Guard{rt8}||dodge blue charge path; tank [Riftstone Strike] cooldowns",
        },
        ["击石者"] = {
            type = "MOB",
            tips = "{rt8}Stonebreaker{rt8}||{rt1}key focus target{rt1}; [Boulder Crush] whole-group AoE + knockback, cooldowns and don't get pushed into danger",
        },
        ["E.D.N.A."] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}E.D.N.A.{rt8}||spread; periodically marks 3 players feet spawn [Unstable Spike], dodge spawn circle, anyone within 4 yards triggers (melee easy one-shot)||[Refraction Ray] one per line pull apart, aim ray at spike to detonate, don't 1-through-N; keep field spikes under 2 or [Earth Rupture] detonates whole-field damage spikes, whole-group cooldowns||tank [Earthshatter Smash] cooldowns, then [Earthshatter Echo] DoT dispel gives tank [Earth Shield] damage reduction, whole group help dispel",
                ["normal"] = "{rt8}E.D.N.A.{rt8}||spread; periodically marks 3 players feet spawn [Unstable Spike], dodge spawn circle, anyone within 4 yards triggers (melee easy one-shot)||[Refraction Ray] one per line pull apart, aim ray at spike to detonate, don't 1-through-N; keep field spikes under 2 or [Earth Rupture] detonates whole-field damage spikes, whole-group cooldowns||tank [Earthshatter Smash] cooldowns, then [Earthshatter Echo] DoT dispel gives tank [Earth Shield] damage reduction, whole group help dispel",
                ["heroic"] = "{rt8}E.D.N.A.{rt8}||spread; periodically marks 3 players feet spawn [Unstable Spike], dodge spawn circle, anyone within 4 yards triggers (melee easy one-shot)||[Refraction Ray] one per line pull apart, aim ray at spike to detonate, don't 1-through-N; keep field spikes under 2 or [Earth Rupture] detonates whole-field damage spikes, whole-group cooldowns||tank [Earthshatter Smash] cooldowns, then [Earthshatter Echo] DoT dispel gives tank [Earth Shield] damage reduction, whole group help dispel",
                ["mythic"] = "{rt8}E.D.N.A.{rt8}||spread; periodically marks 3 players feet spawn [Unstable Spike], dodge spawn circle, anyone within 4 yards triggers (melee easy one-shot)||[Refraction Ray] one per line pull apart, aim ray at spike to detonate, don't 1-through-N; keep field spikes under 2 or [Earth Rupture] detonates whole-field damage spikes, whole-group cooldowns||tank [Earthshatter Smash] cooldowns, then [Earthshatter Echo] DoT dispel gives tank [Earth Shield] damage reduction, whole group help dispel",
                ["mythicplus"] = "{rt8}E.D.N.A.{rt8}||spread; periodically marks 3 players feet spawn [Unstable Spike], dodge spawn circle, anyone within 4 yards triggers (melee easy one-shot)||[Refraction Ray] one per line pull apart, aim ray at spike to detonate, don't 1-through-N; keep field spikes under 2 or [Earth Rupture] detonates whole-field damage spikes, whole-group cooldowns||tank [Earthshatter Smash] cooldowns, then [Earthshatter Echo] DoT dispel gives tank [Earth Shield] damage reduction, whole group help dispel",
            },
        },
        ["咒心入侵者"] = {
            type = "MOB",
            tips = "{rt8}Curseheart Invader{rt8}||{rt1}must interrupt [Fear Roar]{rt1} (whole-group fear 4s); [Void Infection] curse stacks, group / single dispel promptly",
        },
        ["虚缚恐狼"] = {
            type = "MOB",
            tips = "{rt8}Voidbound Dreadwolf{rt8}||[Void Storm] 6s continuous AoE, pre-cooldowns, group-control quick kill",
        },
        ["上进的铸手"] = {
            type = "MOB",
            tips = "{rt8}Ambitious Forgehand{rt8}||[Shatter Strike] / [Rupture] stacks vulnerability on tank, tank cooldowns, don't hard-take multiple layers",
        },
        ["咒炉塑石者"] = {
            type = "MOB",
            tips = "{rt8}Curseforge Stoneformer{rt8}||{rt1}[Shatter Totem] kill immediately{rt1}, unhandled = direct wipe",
        },
    },
    ["破晨号"] = {
        name = "The Dawnbreaker",
        ["夜幕战略家"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Strategist{rt8}||Dodge the purple cone ground of [Black Blade Edge] in front",
        },
        ["夜幕咒刃"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Curseblade{rt8}||[Dark Blade] hits tank and stacks attack speed on itself—tank watch stacks and mitigation timing",
        },
        ["夜幕祭师"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Ritualist{rt8}||[Agonizing Beam] randomly marks 2 players with DoT—use mitigation; [Stygian Seed] marks a magic DoT that must be dispelled and explodes 8 yards—leave group first then dispel",
        },
        ["夜幕黑暗建筑师"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Dark Architect{rt8}||{rt1}[Agonizing Eruption] marks 2 players with a centered AOE, extremely high damage—stay spread at all times{rt1}; taking two at once is lethal; [Summon Reinforcements] calls several curseblades and shadowcasters—interrupt [Snare Shadow] well",
        },
        ["代言人夏多克朗"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Speaker Shadowcrown{rt8}||Tank should pull the boss away from the black-water zone for easier dodging of beams later||[Obsidian Beam] first hits the tank hard (use mitigation), then 3-4 straight laser beams start rotating—rotate together with them to dodge, blink-type spells cannot pass through||[Collapsing Night] marks a ranged player, black water gradually expands under them—move away from the boss before the mark to place the water far||[Burning Shadow] marks a DoT + slow {rt1}prioritize dispelling{rt1}; after dispel grants 4 players [Shadow Veil] absorb shield—healers clear it fast; try to interrupt [Shadow Bolt]||{rt1}At 50% and 1% when casting [Descend into Darkness], immediately mount a flying mount and fly off the ship{rt1} (staying on board means certain death), eat [Light Remnant] outside to maintain [Radiant], fly back after the cast; don't leave with the absorb shield",
                ["normal"] = "{rt8}Speaker Shadowcrown{rt8}||Tank should pull the boss away from the black-water zone for easier dodging of beams later||[Obsidian Beam] first hits the tank hard (use mitigation), then 3-4 straight laser beams start rotating—rotate together with them to dodge, blink-type spells cannot pass through||[Collapsing Night] marks a ranged player, black water gradually expands under them—move away from the boss before the mark to place the water far||[Burning Shadow] marks a DoT + slow {rt1}prioritize dispelling{rt1}; after dispel grants 4 players [Shadow Veil] absorb shield—healers clear it fast; try to interrupt [Shadow Bolt]||{rt1}At 50% and 1% when casting [Descend into Darkness], immediately mount a flying mount and fly off the ship{rt1} (staying on board means certain death), eat [Light Remnant] outside to maintain [Radiant], fly back after the cast; don't leave with the absorb shield",
                ["heroic"] = "{rt8}Speaker Shadowcrown{rt8}||Tank should pull the boss away from the black-water zone for easier dodging of beams later||[Obsidian Beam] first hits the tank hard (use mitigation), then 3-4 straight laser beams start rotating—rotate together with them to dodge, blink-type spells cannot pass through||[Collapsing Night] marks a ranged player, black water gradually expands under them—move away from the boss before the mark to place the water far||[Burning Shadow] marks a DoT + slow {rt1}prioritize dispelling{rt1}; after dispel grants 4 players [Shadow Veil] absorb shield—healers clear it fast; try to interrupt [Shadow Bolt]||{rt1}At 50% and 1% when casting [Descend into Darkness], immediately mount a flying mount and fly off the ship{rt1} (staying on board means certain death), eat [Light Remnant] outside to maintain [Radiant], fly back after the cast; don't leave with the absorb shield",
                ["mythic"] = "{rt8}Speaker Shadowcrown{rt8}||Tank should pull the boss away from the black-water zone for easier dodging of beams later||[Obsidian Beam] first hits the tank hard (use mitigation), then 3-4 straight laser beams start rotating—rotate together with them to dodge, blink-type spells cannot pass through||[Collapsing Night] marks a ranged player, black water gradually expands under them—move away from the boss before the mark to place the water far||[Burning Shadow] marks a DoT + slow {rt1}prioritize dispelling{rt1}; after dispel grants 4 players [Shadow Veil] absorb shield—healers clear it fast; try to interrupt [Shadow Bolt]||{rt1}At 50% and 1% when casting [Descend into Darkness], immediately mount a flying mount and fly off the ship{rt1} (staying on board means certain death), eat [Light Remnant] outside to maintain [Radiant], fly back after the cast; don't leave with the absorb shield",
                ["mythicplus"] = "{rt8}Speaker Shadowcrown{rt8}||Tank should pull the boss away from the black-water zone for easier dodging of beams later||[Obsidian Beam] first hits the tank hard (use mitigation), then 3-4 straight laser beams start rotating—rotate together with them to dodge, blink-type spells cannot pass through||[Collapsing Night] marks a ranged player, black water gradually expands under them—move away from the boss before the mark to place the water far||[Burning Shadow] marks a DoT + slow {rt1}prioritize dispelling{rt1}; after dispel grants 4 players [Shadow Veil] absorb shield—healers clear it fast; try to interrupt [Shadow Bolt]||{rt1}At 50% and 1% when casting [Descend into Darkness], immediately mount a flying mount and fly off the ship{rt1} (staying on board means certain death), eat [Light Remnant] outside to maintain [Radiant], fly back after the cast; don't leave with the absorb shield",
            },
        },
        ["暗影具象"] = {
            type = "MOB",
            tips = "{rt8}Shadow Manifestation{rt8}||[Abyssal Decay] marks an 8-second DoT; dodge [Dark Mist] purple ground circle; after low health begins [Dark Surge] 5-second raid-wide AOE—use mitigation",
        },
        ["夜幕司令官"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Commander{rt8}||{rt1}Must interrupt [Abyssal Howl]{rt1} (shields nearby adds and AOE); [Defiled Strike] hits tank with bleed—tank watch mitigation",
        },
        ["苏雷吉网法师"] = {
            type = "MOB",
            tips = "{rt8}Sureki Webmage{rt8}||[Burgeoning Coccoon] after mark has a white circle around—others don't enter; marked player leaves group within 6s + mitigation + dispel; [Web Bolt] only hits tank, interrupt if possible",
        },
        ["拉夏南"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rasha'nan{rt8}||P1: Dodge the two lines of [Web Spray]; for [Acid Turmoil] check which side (left/right) is light green and throw the wave toward the empty side (hit causes stun); [Erosive Spout] is a 2-second raid-wide AOE + stacking DoT—mitigate and dispel||{rt1}Pick up [Arathi Bomb] and throw it at melee range of the boss{rt1}, collect 6 to phase; holding too long applies a DoT to the raid||During the transition, fly with the lightbearer skiff linked to you, eat [Light Remnant] along the way—without the orb you die in ~24 seconds||P2: [Spray Thread] marks 2 players—move away from boss and group to enlarge the circle; pulling apart after being tethered triggers [Web Tear Burst] raid-wide AOE, use mitigation; use [Acid Turmoil] waves to burn ground [Sticky Webs] into [Acid Pools] to clear—don't step in them||No one at melee range triggers [Viscous Burst]",
                ["normal"] = "{rt8}Rasha'nan{rt8}||P1: Dodge the two lines of [Web Spray]; for [Acid Turmoil] check which side (left/right) is light green and throw the wave toward the empty side (hit causes stun); [Erosive Spout] is a 2-second raid-wide AOE + stacking DoT—mitigate and dispel||{rt1}Pick up [Arathi Bomb] and throw it at melee range of the boss{rt1}, collect 6 to phase; holding too long applies a DoT to the raid||During the transition, fly with the lightbearer skiff linked to you, eat [Light Remnant] along the way—without the orb you die in ~24 seconds||P2: [Spray Thread] marks 2 players—move away from boss and group to enlarge the circle; pulling apart after being tethered triggers [Web Tear Burst] raid-wide AOE, use mitigation; use [Acid Turmoil] waves to burn ground [Sticky Webs] into [Acid Pools] to clear—don't step in them||No one at melee range triggers [Viscous Burst]",
                ["heroic"] = "{rt8}Rasha'nan{rt8}||P1: Dodge the two lines of [Web Spray]; for [Acid Turmoil] check which side (left/right) is light green and throw the wave toward the empty side (hit causes stun); [Erosive Spout] is a 2-second raid-wide AOE + stacking DoT—mitigate and dispel||{rt1}Pick up [Arathi Bomb] and throw it at melee range of the boss{rt1}, collect 6 to phase; holding too long applies a DoT to the raid||During the transition, fly with the lightbearer skiff linked to you, eat [Light Remnant] along the way—without the orb you die in ~24 seconds||P2: [Spray Thread] marks 2 players—move away from boss and group to enlarge the circle; pulling apart after being tethered triggers [Web Tear Burst] raid-wide AOE, use mitigation; use [Acid Turmoil] waves to burn ground [Sticky Webs] into [Acid Pools] to clear—don't step in them||No one at melee range triggers [Viscous Burst]",
                ["mythic"] = "{rt8}Rasha'nan{rt8}||P1: Dodge the two lines of [Web Spray]; for [Acid Turmoil] check which side (left/right) is light green and throw the wave toward the empty side (hit causes stun); [Erosive Spout] is a 2-second raid-wide AOE + stacking DoT—mitigate and dispel||{rt1}Pick up [Arathi Bomb] and throw it at melee range of the boss{rt1}, collect 6 to phase; holding too long applies a DoT to the raid||During the transition, fly with the lightbearer skiff linked to you, eat [Light Remnant] along the way—without the orb you die in ~24 seconds||P2: [Spray Thread] marks 2 players—move away from boss and group to enlarge the circle; pulling apart after being tethered triggers [Web Tear Burst] raid-wide AOE, use mitigation; use [Acid Turmoil] waves to burn ground [Sticky Webs] into [Acid Pools] to clear—don't step in them||No one at melee range triggers [Viscous Burst]",
                ["mythicplus"] = "{rt8}Rasha'nan{rt8}||P1: Dodge the two lines of [Web Spray]; for [Acid Turmoil] check which side (left/right) is light green and throw the wave toward the empty side (hit causes stun); [Erosive Spout] is a 2-second raid-wide AOE + stacking DoT—mitigate and dispel||{rt1}Pick up [Arathi Bomb] and throw it at melee range of the boss{rt1}, collect 6 to phase; holding too long applies a DoT to the raid||During the transition, fly with the lightbearer skiff linked to you, eat [Light Remnant] along the way—without the orb you die in ~24 seconds||P2: [Spray Thread] marks 2 players—move away from boss and group to enlarge the circle; pulling apart after being tethered triggers [Web Tear Burst] raid-wide AOE, use mitigation; use [Acid Turmoil] waves to burn ground [Sticky Webs] into [Acid Pools] to clear—don't step in them||No one at melee range triggers [Viscous Burst]",
            },
        },
        ["夜幕影行者"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Shadowstalker{rt8}||[Shadow Assault] hits tank hard—tank must use mitigation",
        },
        ["夜幕影法师"] = {
            type = "MOB",
            tips = "{rt8}Nightfall Shadowcaster{rt8}||{rt1}Must interrupt [Snare Shadow]{rt1} (high damage + curse DoT + slow); if failed, dispel the curse; [Dark Night Arrow] interrupt if you have spare",
        },
        ["阿努布伊卡基"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Anub'iakah{rt8}||{rt1}Before engaging boss must separately clear the 3 lieutenants{rt1} [Ascendant Vyskaria]/[Deathcrier Ek'tak]/[Indomitable Ixtla'ket], otherwise boss gains [Empowered Might]||[Dark Orb] mark has a purple line—marked player faces away toward open space (lead into the corridor) so the orb flies as far as possible, damage decreases with distance, don't touch the orb||[Gloom Decay] 3-second raid-wide high-damage AOE—use raid mitigation||Tank is knocked back by [Terrifying Smash] and nearby allies are feared—tank stands against wall, others avoid the big purple circle at tank's feet||[Living Shadow] summons slimes—marked player approaches tank to let tank pick up, use AoE CC to kill together; after boss dies the adds don't disappear, must also be cleared",
                ["normal"] = "{rt8}Anub'iakah{rt8}||{rt1}Before engaging boss must separately clear the 3 lieutenants{rt1} [Ascendant Vyskaria]/[Deathcrier Ek'tak]/[Indomitable Ixtla'ket], otherwise boss gains [Empowered Might]||[Dark Orb] mark has a purple line—marked player faces away toward open space (lead into the corridor) so the orb flies as far as possible, damage decreases with distance, don't touch the orb||[Gloom Decay] 3-second raid-wide high-damage AOE—use raid mitigation||Tank is knocked back by [Terrifying Smash] and nearby allies are feared—tank stands against wall, others avoid the big purple circle at tank's feet||[Living Shadow] summons slimes—marked player approaches tank to let tank pick up, use AoE CC to kill together; after boss dies the adds don't disappear, must also be cleared",
                ["heroic"] = "{rt8}Anub'iakah{rt8}||{rt1}Before engaging boss must separately clear the 3 lieutenants{rt1} [Ascendant Vyskaria]/[Deathcrier Ek'tak]/[Indomitable Ixtla'ket], otherwise boss gains [Empowered Might]||[Dark Orb] mark has a purple line—marked player faces away toward open space (lead into the corridor) so the orb flies as far as possible, damage decreases with distance, don't touch the orb||[Gloom Decay] 3-second raid-wide high-damage AOE—use raid mitigation||Tank is knocked back by [Terrifying Smash] and nearby allies are feared—tank stands against wall, others avoid the big purple circle at tank's feet||[Living Shadow] summons slimes—marked player approaches tank to let tank pick up, use AoE CC to kill together; after boss dies the adds don't disappear, must also be cleared",
                ["mythic"] = "{rt8}Anub'iakah{rt8}||{rt1}Before engaging boss must separately clear the 3 lieutenants{rt1} [Ascendant Vyskaria]/[Deathcrier Ek'tak]/[Indomitable Ixtla'ket], otherwise boss gains [Empowered Might]||[Dark Orb] mark has a purple line—marked player faces away toward open space (lead into the corridor) so the orb flies as far as possible, damage decreases with distance, don't touch the orb||[Gloom Decay] 3-second raid-wide high-damage AOE—use raid mitigation||Tank is knocked back by [Terrifying Smash] and nearby allies are feared—tank stands against wall, others avoid the big purple circle at tank's feet||[Living Shadow] summons slimes—marked player approaches tank to let tank pick up, use AoE CC to kill together; after boss dies the adds don't disappear, must also be cleared",
                ["mythicplus"] = "{rt8}Anub'iakah{rt8}||{rt1}Before engaging boss must separately clear the 3 lieutenants{rt1} [Ascendant Vyskaria]/[Deathcrier Ek'tak]/[Indomitable Ixtla'ket], otherwise boss gains [Empowered Might]||[Dark Orb] mark has a purple line—marked player faces away toward open space (lead into the corridor) so the orb flies as far as possible, damage decreases with distance, don't touch the orb||[Gloom Decay] 3-second raid-wide high-damage AOE—use raid mitigation||Tank is knocked back by [Terrifying Smash] and nearby allies are feared—tank stands against wall, others avoid the big purple circle at tank's feet||[Living Shadow] summons slimes—marked player approaches tank to let tank pick up, use AoE CC to kill together; after boss dies the adds don't disappear, must also be cleared",
            },
        },
    },
    ["驭雷栖巢"] = {
        name = "The Rookery",
        ["被腐化的先知"] = {
            type = "MOB",
            tips = "{rt8}Corrupted Prophet{rt8}||{rt1}must interrupt [Void Arrow]{rt1}; healer promptly dispel [Seeping Corruption]",
        },
        ["虚咒碾压者"] = {
            type = "MOB",
            tips = "{rt8}Void Curse Crusher{rt8}||marks jump player, at jump instant back-jump or root can avoid; stacks heal-reduction debuff, prioritize control kill",
        },
        ["被诅咒的雷霆使"] = {
            type = "MOB",
            tips = "{rt8}Cursed Thundercaller{rt8}||{rt1}must interrupt [Lightning Bolt]{rt1}; two hits in a row without cooldowns basically must fall, waves with this mob must assign interrupt chain",
        },
        ["雷卫戈伦"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Thunderguard Goren{rt8}||core [Chaotic Corruption]: 4-layer void mark, end jumps to nearest and explodes 6 yards; the one who took it immediately move away, {rt1}carrying [Chaotic Frail] must not take again{rt1} (+300% damage taken)||[Dark Gravity] pulls, after channel 8 yards explode knockback, after cast run outward||[Shatter Reality] jumps player then extends [Reality Rift] and leaves 2-min [Lingering Void], place water at field edge",
                ["normal"] = "{rt8}Thunderguard Goren{rt8}||core [Chaotic Corruption]: 4-layer void mark, end jumps to nearest and explodes 6 yards; the one who took it immediately move away, {rt1}carrying [Chaotic Frail] must not take again{rt1} (+300% damage taken)||[Dark Gravity] pulls, after channel 8 yards explode knockback, after cast run outward||[Shatter Reality] jumps player then extends [Reality Rift] and leaves 2-min [Lingering Void], place water at field edge",
                ["heroic"] = "{rt8}Thunderguard Goren{rt8}||core [Chaotic Corruption]: 4-layer void mark, end jumps to nearest and explodes 6 yards; the one who took it immediately move away, {rt1}carrying [Chaotic Frail] must not take again{rt1} (+300% damage taken)||[Dark Gravity] pulls, after channel 8 yards explode knockback, after cast run outward||[Shatter Reality] jumps player then extends [Reality Rift] and leaves 2-min [Lingering Void], place water at field edge",
                ["mythic"] = "{rt8}Thunderguard Goren{rt8}||core [Chaotic Corruption]: 4-layer void mark, end jumps to nearest and explodes 6 yards; the one who took it immediately move away, {rt1}carrying [Chaotic Frail] must not take again{rt1} (+300% damage taken)||[Dark Gravity] pulls, after channel 8 yards explode knockback, after cast run outward||[Shatter Reality] jumps player then extends [Reality Rift] and leaves 2-min [Lingering Void], place water at field edge",
                ["mythicplus"] = "{rt8}Thunderguard Goren{rt8}||core [Chaotic Corruption]: 4-layer void mark, end jumps to nearest and explodes 6 yards; the one who took it immediately move away, {rt1}carrying [Chaotic Frail] must not take again{rt1} (+300% damage taken)||[Dark Gravity] pulls, after channel 8 yards explode knockback, after cast run outward||[Shatter Reality] jumps player then extends [Reality Rift] and leaves 2-min [Lingering Void], place water at field edge",
            },
        },
        ["诅咒的雷鸫守卫"] = {
            type = "MOB",
            tips = "{rt8}Cursed Thunderowl Guard{rt8}||has own haste buff, dispellable / spellsteal, else attack speed and damage surge",
        },
        ["虚空石畸体"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Voidstone Aberration{rt8}||tank and melee left, healer center, ranged right separate; [Release Corruption] DoT dispel leaves [Seeping Corruption] black water on ground and grows, don't place at boss feet||[Void Subversion] summons [Void Shard], marked [Stormcaller Charge] person cover with circle to detonate, don't let it [Reshape] into [Awakened Voidstone]||after breaking [Void Shell] Vokmar [Storm Vengeance] stuns and +100% damage taken, full burst; melee position must have someone or triggers [Entropy], dodge [Annihilation Wave] line",
                ["normal"] = "{rt8}Voidstone Aberration{rt8}||tank and melee left, healer center, ranged right separate; [Release Corruption] DoT dispel leaves [Seeping Corruption] black water on ground and grows, don't place at boss feet||[Void Subversion] summons [Void Shard], marked [Stormcaller Charge] person cover with circle to detonate, don't let it [Reshape] into [Awakened Voidstone]||after breaking [Void Shell] Vokmar [Storm Vengeance] stuns and +100% damage taken, full burst; melee position must have someone or triggers [Entropy], dodge [Annihilation Wave] line",
                ["heroic"] = "{rt8}Voidstone Aberration{rt8}||tank and melee left, healer center, ranged right separate; [Release Corruption] DoT dispel leaves [Seeping Corruption] black water on ground and grows, don't place at boss feet||[Void Subversion] summons [Void Shard], marked [Stormcaller Charge] person cover with circle to detonate, don't let it [Reshape] into [Awakened Voidstone]||after breaking [Void Shell] Vokmar [Storm Vengeance] stuns and +100% damage taken, full burst; melee position must have someone or triggers [Entropy], dodge [Annihilation Wave] line",
                ["mythic"] = "{rt8}Voidstone Aberration{rt8}||tank and melee left, healer center, ranged right separate; [Release Corruption] DoT dispel leaves [Seeping Corruption] black water on ground and grows, don't place at boss feet||[Void Subversion] summons [Void Shard], marked [Stormcaller Charge] person cover with circle to detonate, don't let it [Reshape] into [Awakened Voidstone]||after breaking [Void Shell] Vokmar [Storm Vengeance] stuns and +100% damage taken, full burst; melee position must have someone or triggers [Entropy], dodge [Annihilation Wave] line",
                ["mythicplus"] = "{rt8}Voidstone Aberration{rt8}||tank and melee left, healer center, ranged right separate; [Release Corruption] DoT dispel leaves [Seeping Corruption] black water on ground and grows, don't place at boss feet||[Void Subversion] summons [Void Shard], marked [Stormcaller Charge] person cover with circle to detonate, don't let it [Reshape] into [Awakened Voidstone]||after breaking [Void Shell] Vokmar [Storm Vengeance] stuns and +100% damage taken, full burst; melee position must have someone or triggers [Entropy], dodge [Annihilation Wave] line",
            },
        },
        ["驭虚者"] = {
            type = "MOB",
            tips = "{rt8}Voidbinder{rt8}||dodge cross-shaped floor; [Localized Storm] continuous medium AoE on whole group, healer pre-lay health, melee cooldowns",
        },
        ["凝虚散播者"] = {
            type = "MOB",
            tips = "{rt8}Condensed Voidspreader{rt8}||[Gathering Shadows] pulls whole group into vortex continuous damage, immediately run outward; [Arc Void] marked big circle don't trap teammates, cooldowns",
        },
        ["凯里欧斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kyrioss{rt8}||P1 whole group 8+ yards spread dodge [Disintegrate Lightning] circle, [Wild Lightning] along straight line toward player, side-step left/right||at full energy fly center drop [Lightning Surge]: 4 rays clockwise / counterclockwise sweep, watch boss body glow point for start direction, whole group huddle together same direction circle and dodge [Rooting Thunder] small circle||end [Lightning Dash] landing big circle dodge; rooted dispellable",
                ["normal"] = "{rt8}Kyrioss{rt8}||P1 whole group 8+ yards spread dodge [Disintegrate Lightning] circle, [Wild Lightning] along straight line toward player, side-step left/right||at full energy fly center drop [Lightning Surge]: 4 rays clockwise / counterclockwise sweep, watch boss body glow point for start direction, whole group huddle together same direction circle and dodge [Rooting Thunder] small circle||end [Lightning Dash] landing big circle dodge; rooted dispellable",
                ["heroic"] = "{rt8}Kyrioss{rt8}||P1 whole group 8+ yards spread dodge [Disintegrate Lightning] circle, [Wild Lightning] along straight line toward player, side-step left/right||at full energy fly center drop [Lightning Surge]: 4 rays clockwise / counterclockwise sweep, watch boss body glow point for start direction, whole group huddle together same direction circle and dodge [Rooting Thunder] small circle||end [Lightning Dash] landing big circle dodge; rooted dispellable",
                ["mythic"] = "{rt8}Kyrioss{rt8}||P1 whole group 8+ yards spread dodge [Disintegrate Lightning] circle, [Wild Lightning] along straight line toward player, side-step left/right||at full energy fly center drop [Lightning Surge]: 4 rays clockwise / counterclockwise sweep, watch boss body glow point for start direction, whole group huddle together same direction circle and dodge [Rooting Thunder] small circle||end [Lightning Dash] landing big circle dodge; rooted dispellable",
                ["mythicplus"] = "{rt8}Kyrioss{rt8}||P1 whole group 8+ yards spread dodge [Disintegrate Lightning] circle, [Wild Lightning] along straight line toward player, side-step left/right||at full energy fly center drop [Lightning Surge]: 4 rays clockwise / counterclockwise sweep, watch boss body glow point for start direction, whole group huddle together same direction circle and dodge [Rooting Thunder] small circle||end [Lightning Dash] landing big circle dodge; rooted dispellable",
            },
        },
        ["军需官科拉泰特"] = {
            type = "MOB",
            tips = "{rt8}Quartermaster Korathet{rt8}||stand sideways, head-front summoned orb don't eat and retracts back; during [Entropic Shield] don't hit frontal (deflects), go behind to DPS",
        },
    },
    ["水闸行动"] = {
        name = "Operation: Floodgate",
        ["被惊扰的海藻"] = {
            type = "MOB",
            tips = "{rt8}Disturbed Kelp{rt8}||{rt1}must interrupt [Discard Kelp]{rt1} cast whole-group AoE, group-control only stun can interrupt, slow means lose members||[Renew] heal dispel / interrupt, keep full burst to melt fast to prevent control chain break",
        },
        ["风险投资公司电工"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. Electrician{rt8}||{rt1}must interrupt [Lightning Bolt]{rt1} two hits one-shot||[Overload] magic DoT not dispelled stuns 5s, instant dispel (like dispel-1-refresh-1)",
        },
        ["无人机狙击手"] = {
            type = "MOB",
            tips = "{rt8}Drone Sniper{rt8}||{rt1}must interrupt [Trick Shot]{rt1} 3s cast spell AoE bounce, high layer missed interrupt easy wipe||auto-attack [Snipe] random marked hurt, marked cooldowns; not controllable can pull / stun interrupt",
        },
        ["吉泽尔·超震"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Geezle Gigazap{rt8}||[Turbo Boost] returns to spot drop [Turbo Thunder] beam, dodge [Dam Spall] falling rock and [Dam Seep] water puddle||[Agitated Water] charged water don't step (stun 4s); [Jumping Spark] lead to clean puddle then spread {rt1}must interrupt [Hyper Shock] type electric DoT{rt1}||[Thunder Punch] knockback tank cooldowns, [Spark Smash] tank frontal heavy cooldowns",
                ["normal"] = "{rt8}Geezle Gigazap{rt8}||[Turbo Boost] returns to spot drop [Turbo Thunder] beam, dodge [Dam Spall] falling rock and [Dam Seep] water puddle||[Agitated Water] charged water don't step (stun 4s); [Jumping Spark] lead to clean puddle then spread {rt1}must interrupt [Hyper Shock] type electric DoT{rt1}||[Thunder Punch] knockback tank cooldowns, [Spark Smash] tank frontal heavy cooldowns",
                ["heroic"] = "{rt8}Geezle Gigazap{rt8}||[Turbo Boost] returns to spot drop [Turbo Thunder] beam, dodge [Dam Spall] falling rock and [Dam Seep] water puddle||[Agitated Water] charged water don't step (stun 4s); [Jumping Spark] lead to clean puddle then spread {rt1}must interrupt [Hyper Shock] type electric DoT{rt1}||[Thunder Punch] knockback tank cooldowns, [Spark Smash] tank frontal heavy cooldowns",
                ["mythic"] = "{rt8}Geezle Gigazap{rt8}||[Turbo Boost] returns to spot drop [Turbo Thunder] beam, dodge [Dam Spall] falling rock and [Dam Seep] water puddle||[Agitated Water] charged water don't step (stun 4s); [Jumping Spark] lead to clean puddle then spread {rt1}must interrupt [Hyper Shock] type electric DoT{rt1}||[Thunder Punch] knockback tank cooldowns, [Spark Smash] tank frontal heavy cooldowns",
                ["mythicplus"] = "{rt8}Geezle Gigazap{rt8}||[Turbo Boost] returns to spot drop [Turbo Thunder] beam, dodge [Dam Spall] falling rock and [Dam Seep] water puddle||[Agitated Water] charged water don't step (stun 4s); [Jumping Spark] lead to clean puddle then spread {rt1}must interrupt [Hyper Shock] type electric DoT{rt1}||[Thunder Punch] knockback tank cooldowns, [Spark Smash] tank frontal heavy cooldowns",
            },
        },
        ["暗索扭血者"] = {
            type = "MOB",
            tips = "{rt8}Darkstrand Bloodweaver{rt8}||{rt1}must interrupt [Bloodthirsty Arrow]{rt1} missed interrupt easy to one-shot tank||[Warped Blood] whole-group drain-heal shield can't LOS, healer pre-lay + whole-group cooldowns hard heal; don't pull too high a layer",
        },
        ["老大娘"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Old Lady{rt8}||quick kill 4 [Darkstrand Drone]s to trigger [Quick Start] vulnerability; MUST NOT let body open [Deadly Lockdown Barrier] (-80% reduction + whole-group AoE){rt1}must interrupt drone [Ultimate Distortion]{rt1}||[Sonic Boom] marked lead toward outside, hit wall 7-yard explosion knockback silence; [Electrical Crush] tank cooldowns||[Destroyer Storm] dodge line; after vulnerability ends leaves [Overcharged Electrified] electric water, pull to edge to keep field",
                ["normal"] = "{rt8}Old Lady{rt8}||quick kill 4 [Darkstrand Drone]s to trigger [Quick Start] vulnerability; MUST NOT let body open [Deadly Lockdown Barrier] (-80% reduction + whole-group AoE){rt1}must interrupt drone [Ultimate Distortion]{rt1}||[Sonic Boom] marked lead toward outside, hit wall 7-yard explosion knockback silence; [Electrical Crush] tank cooldowns||[Destroyer Storm] dodge line; after vulnerability ends leaves [Overcharged Electrified] electric water, pull to edge to keep field",
                ["heroic"] = "{rt8}Old Lady{rt8}||quick kill 4 [Darkstrand Drone]s to trigger [Quick Start] vulnerability; MUST NOT let body open [Deadly Lockdown Barrier] (-80% reduction + whole-group AoE){rt1}must interrupt drone [Ultimate Distortion]{rt1}||[Sonic Boom] marked lead toward outside, hit wall 7-yard explosion knockback silence; [Electrical Crush] tank cooldowns||[Destroyer Storm] dodge line; after vulnerability ends leaves [Overcharged Electrified] electric water, pull to edge to keep field",
                ["mythic"] = "{rt8}Old Lady{rt8}||quick kill 4 [Darkstrand Drone]s to trigger [Quick Start] vulnerability; MUST NOT let body open [Deadly Lockdown Barrier] (-80% reduction + whole-group AoE){rt1}must interrupt drone [Ultimate Distortion]{rt1}||[Sonic Boom] marked lead toward outside, hit wall 7-yard explosion knockback silence; [Electrical Crush] tank cooldowns||[Destroyer Storm] dodge line; after vulnerability ends leaves [Overcharged Electrified] electric water, pull to edge to keep field",
                ["mythicplus"] = "{rt8}Old Lady{rt8}||quick kill 4 [Darkstrand Drone]s to trigger [Quick Start] vulnerability; MUST NOT let body open [Deadly Lockdown Barrier] (-80% reduction + whole-group AoE){rt1}must interrupt drone [Ultimate Distortion]{rt1}||[Sonic Boom] marked lead toward outside, hit wall 7-yard explosion knockback silence; [Electrical Crush] tank cooldowns||[Destroyer Storm] dodge line; after vulnerability ends leaves [Overcharged Electrified] electric water, pull to edge to keep field",
            },
        },
        ["风险投资公司建筑师"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. Architect{rt8}||first dismantle [Scaffold] or architect nearly invulnerable||[Nail Gun] root + bleed, freedom / root-break, don't pull more than 2 at once to avoid combo",
        },
        ["撕碎王3000型"] = {
            type = "MOB",
            tips = "{rt8}Shredder 3000{rt8}||[Shred] cast end each player feet spawns chainsaw, the moment cast stops immediately side-step dodge first jump||[Flame Thrower] clockwise / counterclockwise circle head-front fire, dodge head-front and don't stand on floor saw",
        },
        ["沼面"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mireface{rt8}||[Garrote Vines] pair-bound, over 14 yards pulled back, paired walk together (usually clockwise)||[Mudslide] head front dodge, [Surging Torrent] wave knockback, [Awakened Mire] whole-group cooldowns||tank [Mud Claw] drain heal cooldowns, healer pre-lay all abilities",
                ["normal"] = "{rt8}Mireface{rt8}||[Garrote Vines] pair-bound, over 14 yards pulled back, paired walk together (usually clockwise)||[Mudslide] head front dodge, [Surging Torrent] wave knockback, [Awakened Mire] whole-group cooldowns||tank [Mud Claw] drain heal cooldowns, healer pre-lay all abilities",
                ["heroic"] = "{rt8}Mireface{rt8}||[Garrote Vines] pair-bound, over 14 yards pulled back, paired walk together (usually clockwise)||[Mudslide] head front dodge, [Surging Torrent] wave knockback, [Awakened Mire] whole-group cooldowns||tank [Mud Claw] drain heal cooldowns, healer pre-lay all abilities",
                ["mythic"] = "{rt8}Mireface{rt8}||[Garrote Vines] pair-bound, over 14 yards pulled back, paired walk together (usually clockwise)||[Mudslide] head front dodge, [Surging Torrent] wave knockback, [Awakened Mire] whole-group cooldowns||tank [Mud Claw] drain heal cooldowns, healer pre-lay all abilities",
                ["mythicplus"] = "{rt8}Mireface{rt8}||[Garrote Vines] pair-bound, over 14 yards pulled back, paired walk together (usually clockwise)||[Mudslide] head front dodge, [Surging Torrent] wave knockback, [Awakened Mire] whole-group cooldowns||tank [Mud Claw] drain heal cooldowns, healer pre-lay all abilities",
            },
        },
        ["风险投资公司勘探员"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. Prospector{rt8}||{rt1}interrupt [Survey Beam]{rt1} channel slows and leaves lava pool at feet, after mark immediately run away||[Easy Throw Bomb] dodge landing don't step mine; nearby [Coyote] bloodlust grin can interrupt / dispel enrage",
        },
        ["破拆双人组"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Demolition Duo{rt8}||twins even-health kill together! single death triggers [Apart] other +20% dmg every 4s||Bront [Barrel Roll Charge] path through bombs clear mines (first two random last one must hit tank); marked [Kinetic Gel Explosive] pre-stand on bomb then healer dispel detonate {rt1}[Skyfall Mine] bomb 30s expiry whole-group AoE, clear via charge / gel{rt1}||[Heavy Strike] tank cooldowns, [B.B.B.F.G.] dodge beam, [Quick Shot] random hurt",
                ["normal"] = "{rt8}Demolition Duo{rt8}||twins even-health kill together! single death triggers [Apart] other +20% dmg every 4s||Bront [Barrel Roll Charge] path through bombs clear mines (first two random last one must hit tank); marked [Kinetic Gel Explosive] pre-stand on bomb then healer dispel detonate {rt1}[Skyfall Mine] bomb 30s expiry whole-group AoE, clear via charge / gel{rt1}||[Heavy Strike] tank cooldowns, [B.B.B.F.G.] dodge beam, [Quick Shot] random hurt",
                ["heroic"] = "{rt8}Demolition Duo{rt8}||twins even-health kill together! single death triggers [Apart] other +20% dmg every 4s||Bront [Barrel Roll Charge] path through bombs clear mines (first two random last one must hit tank); marked [Kinetic Gel Explosive] pre-stand on bomb then healer dispel detonate {rt1}[Skyfall Mine] bomb 30s expiry whole-group AoE, clear via charge / gel{rt1}||[Heavy Strike] tank cooldowns, [B.B.B.F.G.] dodge beam, [Quick Shot] random hurt",
                ["mythic"] = "{rt8}Demolition Duo{rt8}||twins even-health kill together! single death triggers [Apart] other +20% dmg every 4s||Bront [Barrel Roll Charge] path through bombs clear mines (first two random last one must hit tank); marked [Kinetic Gel Explosive] pre-stand on bomb then healer dispel detonate {rt1}[Skyfall Mine] bomb 30s expiry whole-group AoE, clear via charge / gel{rt1}||[Heavy Strike] tank cooldowns, [B.B.B.F.G.] dodge beam, [Quick Shot] random hurt",
                ["mythicplus"] = "{rt8}Demolition Duo{rt8}||twins even-health kill together! single death triggers [Apart] other +20% dmg every 4s||Bront [Barrel Roll Charge] path through bombs clear mines (first two random last one must hit tank); marked [Kinetic Gel Explosive] pre-stand on bomb then healer dispel detonate {rt1}[Skyfall Mine] bomb 30s expiry whole-group AoE, clear via charge / gel{rt1}||[Heavy Strike] tank cooldowns, [B.B.B.F.G.] dodge beam, [Quick Shot] random hurt",
            },
        },
        ["暗索调查员"] = {
            type = "MOB",
            tips = "{rt8}Darkstrand Surveyor{rt8}||[Assault Survey] blinks behind player drops cone head-front, with many mobs the purple effect is hard to see—be careful||use control to interrupt cast, marked dodge teammates to avoid combo",
        },
        ["风险投资公司潜水员"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. Diver{rt8}||[Blasting Salt Bomb] ground planted mine dodge don't step||[Harpoon] pull + bleed dispellable, hooked open cooldowns",
        },
    },
    ["燧酿酒庄"] = {
        name = "Cinderbrew Meadery",
        ["粗心的酒花大地精"] = {
            type = "MOB",
            tips = "{rt8}Careless Hops Groundling{rt8}||Hallway elite: pull it where it's not too far/not too close to wall so it hits the wall—charging too far causes adds; dodge [Charge] path",
        },
        ["艾帕"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Epa{rt8}||{rt1}[Gushing Brews] spawned [Droplets] must be controlled and burst immediately{rt1}, letting it touch boss triggers [Top Off] (raid-wide big AOE + 20% max health shield)||[Burning Fermentation] high fire DoT dispellable, if not dispelled use mitigation; tank mitigation on [Cheers Jab] to avoid knockback||Droplets leave [Surging Honey] after death—extremely tests tank positioning, keep pulling boss to clean ground, not near walls",
                ["normal"] = "{rt8}Epa{rt8}||{rt1}[Gushing Brews] spawned [Droplets] must be controlled and burst immediately{rt1}, letting it touch boss triggers [Top Off] (raid-wide big AOE + 20% max health shield)||[Burning Fermentation] high fire DoT dispellable, if not dispelled use mitigation; tank mitigation on [Cheers Jab] to avoid knockback||Droplets leave [Surging Honey] after death—extremely tests tank positioning, keep pulling boss to clean ground, not near walls",
                ["heroic"] = "{rt8}Epa{rt8}||{rt1}[Gushing Brews] spawned [Droplets] must be controlled and burst immediately{rt1}, letting it touch boss triggers [Top Off] (raid-wide big AOE + 20% max health shield)||[Burning Fermentation] high fire DoT dispellable, if not dispelled use mitigation; tank mitigation on [Cheers Jab] to avoid knockback||Droplets leave [Surging Honey] after death—extremely tests tank positioning, keep pulling boss to clean ground, not near walls",
                ["mythic"] = "{rt8}Epa{rt8}||{rt1}[Gushing Brews] spawned [Droplets] must be controlled and burst immediately{rt1}, letting it touch boss triggers [Top Off] (raid-wide big AOE + 20% max health shield)||[Burning Fermentation] high fire DoT dispellable, if not dispelled use mitigation; tank mitigation on [Cheers Jab] to avoid knockback||Droplets leave [Surging Honey] after death—extremely tests tank positioning, keep pulling boss to clean ground, not near walls",
                ["mythicplus"] = "{rt8}Epa{rt8}||{rt1}[Gushing Brews] spawned [Droplets] must be controlled and burst immediately{rt1}, letting it touch boss triggers [Top Off] (raid-wide big AOE + 20% max health shield)||[Burning Fermentation] high fire DoT dispellable, if not dispelled use mitigation; tank mitigation on [Cheers Jab] to avoid knockback||Droplets leave [Surging Honey] after death—extremely tests tank positioning, keep pulling boss to clean ground, not near walls",
            },
        },
        ["蜜蜂驯养师"] = {
            type = "MOB",
            tips = "{rt8}Bee Wrangler{rt8}||{rt1}Must interrupt [Bee Frenzy]{rt1}",
        },
        ["风味科学家"] = {
            type = "MOB",
            tips = "{rt8}Flavor Scientist{rt8}||{rt1}Must interrupt [Healing Honey]{rt1} (spellstealable); {rt1}[Failed Batch] summon's 10-second cast success means raid-wide big AOE—immediately focus and burst it down{rt1}",
        },
        ["本克·鸣蜂"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Benk Buzzbee{rt8}||[Snack Time] after summoning honey kegs, {rt1}kill [Greedy Cinderbee] and ride it to use [Bee Line!] to crash all kegs{rt1}, missing kegs wipes||Tank marked by [Honey Batter] places flame honey pool at edge; pull bees out of water immediately, those dead in water wait for revive then kill||[Worker Bee]'s [Shredding Sting] bleed stacks high needs mitigation or directly dispel",
                ["normal"] = "{rt8}Benk Buzzbee{rt8}||[Snack Time] after summoning honey kegs, {rt1}kill [Greedy Cinderbee] and ride it to use [Bee Line!] to crash all kegs{rt1}, missing kegs wipes||Tank marked by [Honey Batter] places flame honey pool at edge; pull bees out of water immediately, those dead in water wait for revive then kill||[Worker Bee]'s [Shredding Sting] bleed stacks high needs mitigation or directly dispel",
                ["heroic"] = "{rt8}Benk Buzzbee{rt8}||[Snack Time] after summoning honey kegs, {rt1}kill [Greedy Cinderbee] and ride it to use [Bee Line!] to crash all kegs{rt1}, missing kegs wipes||Tank marked by [Honey Batter] places flame honey pool at edge; pull bees out of water immediately, those dead in water wait for revive then kill||[Worker Bee]'s [Shredding Sting] bleed stacks high needs mitigation or directly dispel",
                ["mythic"] = "{rt8}Benk Buzzbee{rt8}||[Snack Time] after summoning honey kegs, {rt1}kill [Greedy Cinderbee] and ride it to use [Bee Line!] to crash all kegs{rt1}, missing kegs wipes||Tank marked by [Honey Batter] places flame honey pool at edge; pull bees out of water immediately, those dead in water wait for revive then kill||[Worker Bee]'s [Shredding Sting] bleed stacks high needs mitigation or directly dispel",
                ["mythicplus"] = "{rt8}Benk Buzzbee{rt8}||[Snack Time] after summoning honey kegs, {rt1}kill [Greedy Cinderbee] and ride it to use [Bee Line!] to crash all kegs{rt1}, missing kegs wipes||Tank marked by [Honey Batter] places flame honey pool at edge; pull bees out of water immediately, those dead in water wait for revive then kill||[Worker Bee]'s [Shredding Sting] bleed stacks high needs mitigation or directly dispel",
            },
        },
        ["品尝师"] = {
            type = "MOB",
            tips = "{rt8}Taster{rt8}||{rt1}Must interrupt [Free Sample?]{rt1}; enrage effect on body can be dispelled",
        },
        ["戈尔迪·底爵"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Goldie Bottom{rt8}||Large and small powder kegs spawn: tank uses front [Coin Cannon] (always locks tank) to detonate big kegs, DPS named fire circles supplement, {rt1}prioritize clearing big kegs{rt1}||At full energy [Sky Darkening!] detonates all remaining kegs + raid-wide AOE—must mitigate, and tank must pull boss away from kegs to avoid instant death||After each keg explosion cross-shaped fire waves scatter—dodge in time; [Tinder Wound] over 1 stack use mitigation",
                ["normal"] = "{rt8}Goldie Bottom{rt8}||Large and small powder kegs spawn: tank uses front [Coin Cannon] (always locks tank) to detonate big kegs, DPS named fire circles supplement, {rt1}prioritize clearing big kegs{rt1}||At full energy [Sky Darkening!] detonates all remaining kegs + raid-wide AOE—must mitigate, and tank must pull boss away from kegs to avoid instant death||After each keg explosion cross-shaped fire waves scatter—dodge in time; [Tinder Wound] over 1 stack use mitigation",
                ["heroic"] = "{rt8}Goldie Bottom{rt8}||Large and small powder kegs spawn: tank uses front [Coin Cannon] (always locks tank) to detonate big kegs, DPS named fire circles supplement, {rt1}prioritize clearing big kegs{rt1}||At full energy [Sky Darkening!] detonates all remaining kegs + raid-wide AOE—must mitigate, and tank must pull boss away from kegs to avoid instant death||After each keg explosion cross-shaped fire waves scatter—dodge in time; [Tinder Wound] over 1 stack use mitigation",
                ["mythic"] = "{rt8}Goldie Bottom{rt8}||Large and small powder kegs spawn: tank uses front [Coin Cannon] (always locks tank) to detonate big kegs, DPS named fire circles supplement, {rt1}prioritize clearing big kegs{rt1}||At full energy [Sky Darkening!] detonates all remaining kegs + raid-wide AOE—must mitigate, and tank must pull boss away from kegs to avoid instant death||After each keg explosion cross-shaped fire waves scatter—dodge in time; [Tinder Wound] over 1 stack use mitigation",
                ["mythicplus"] = "{rt8}Goldie Bottom{rt8}||Large and small powder kegs spawn: tank uses front [Coin Cannon] (always locks tank) to detonate big kegs, DPS named fire circles supplement, {rt1}prioritize clearing big kegs{rt1}||At full energy [Sky Darkening!] detonates all remaining kegs + raid-wide AOE—must mitigate, and tank must pull boss away from kegs to avoid instant death||After each keg explosion cross-shaped fire waves scatter—dodge in time; [Tinder Wound] over 1 stack use mitigation",
            },
        },
        ["雇佣打手"] = {
            type = "MOB",
            tips = "{rt8}Hired Thug{rt8}||[Thrown Chair] marks high physical—before being marked keep full health and ready big mitigation",
        },
        ["皇家果酱供应商"] = {
            type = "MOB",
            tips = "{rt8}Royal Jam Supplier{rt8}||{rt1}Must interrupt [Honey Volley]{rt1}",
        },
        ["酿造大师阿德里尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Brewmaster Aldryr{rt8}||Dodge the [Heated Belch] cone in front (turns toward random player); marked by [Thrown Ember Brew] has clear trajectory—run away immediately, don't leave [Scalding Honey] at melee||At 66%/33% enters [Happy Hour], boss takes [Dismissive] 99% reduced damage: one DPS carries a cup, tank carries two to feed [Thirsty Patron] to stop [Raucous Clamor]||Tank use mitigation on [Drunken Toss] to avoid being knocked into poison water; at mythic end [Brawl] explodes—don't stand randomly or get stunned",
                ["normal"] = "{rt8}Brewmaster Aldryr{rt8}||Dodge the [Heated Belch] cone in front (turns toward random player); marked by [Thrown Ember Brew] has clear trajectory—run away immediately, don't leave [Scalding Honey] at melee||At 66%/33% enters [Happy Hour], boss takes [Dismissive] 99% reduced damage: one DPS carries a cup, tank carries two to feed [Thirsty Patron] to stop [Raucous Clamor]||Tank use mitigation on [Drunken Toss] to avoid being knocked into poison water; at mythic end [Brawl] explodes—don't stand randomly or get stunned",
                ["heroic"] = "{rt8}Brewmaster Aldryr{rt8}||Dodge the [Heated Belch] cone in front (turns toward random player); marked by [Thrown Ember Brew] has clear trajectory—run away immediately, don't leave [Scalding Honey] at melee||At 66%/33% enters [Happy Hour], boss takes [Dismissive] 99% reduced damage: one DPS carries a cup, tank carries two to feed [Thirsty Patron] to stop [Raucous Clamor]||Tank use mitigation on [Drunken Toss] to avoid being knocked into poison water; at mythic end [Brawl] explodes—don't stand randomly or get stunned",
                ["mythic"] = "{rt8}Brewmaster Aldryr{rt8}||Dodge the [Heated Belch] cone in front (turns toward random player); marked by [Thrown Ember Brew] has clear trajectory—run away immediately, don't leave [Scalding Honey] at melee||At 66%/33% enters [Happy Hour], boss takes [Dismissive] 99% reduced damage: one DPS carries a cup, tank carries two to feed [Thirsty Patron] to stop [Raucous Clamor]||Tank use mitigation on [Drunken Toss] to avoid being knocked into poison water; at mythic end [Brawl] explodes—don't stand randomly or get stunned",
                ["mythicplus"] = "{rt8}Brewmaster Aldryr{rt8}||Dodge the [Heated Belch] cone in front (turns toward random player); marked by [Thrown Ember Brew] has clear trajectory—run away immediately, don't leave [Scalding Honey] at melee||At 66%/33% enters [Happy Hour], boss takes [Dismissive] 99% reduced damage: one DPS carries a cup, tank carries two to feed [Thirsty Patron] to stop [Raucous Clamor]||Tank use mitigation on [Drunken Toss] to avoid being knocked into poison water; at mythic end [Brawl] explodes—don't stand randomly or get stunned",
            },
        },
        ["风险投资公司纵火狂"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. Arsonist{rt8}||{rt1}Must interrupt [Boiling Flame]{rt1}; [Bursting Hellfire] marks fire DoT prioritize dispel, if not dispelled use mitigation",
        },
        ["风险公司蜂蜜采集者"] = {
            type = "MOB",
            tips = "{rt8}Risco Co. Honey Harvester{rt8}||[Swarm Surprise] damage increases each cast—try to control/interrupt and burst down; below 25% big bees cast [Fatal Sting]—control/interrupt or mitigate",
        },
    },
    ["圣焰隐修院"] = {
        name = "Priory of the Sacred Flame",
        ["歇尼麦尔中士"] = {
            type = "MOB",
            tips = "{rt8}Sergeant Shanniel{rt8}||Dodge [Leaping Strike] landing, tank use mitigation on [Brute Smash]; pull out alone to fight, never stack with other loyal guards",
        },
        ["泰纳·杜尔玛"] = {
            type = "MOB",
            tips = "{rt8}Tayna Durma{rt8}||{rt1}Must interrupt [Fireball] and [Ember Blast]{rt1}; dodge [Ember Storm] ground",
        },
        ["戴尔克莱上尉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Captain Delkray{rt8}||{rt1}Must interrupt [Battle Rally]{rt1} (self and all allies damage boost); spread to dodge [Shatter Spear] line, actual range larger than visual||Person pinned by [Brutal Pulverize] rescued by teammates focus-firing [Emberclaw]; tank on [Armor Piercing] bleed vulnerability use mitigation, healers dispel promptly",
                ["normal"] = "{rt8}Captain Delkray{rt8}||{rt1}Must interrupt [Battle Rally]{rt1} (self and all allies damage boost); spread to dodge [Shatter Spear] line, actual range larger than visual||Person pinned by [Brutal Pulverize] rescued by teammates focus-firing [Emberclaw]; tank on [Armor Piercing] bleed vulnerability use mitigation, healers dispel promptly",
                ["heroic"] = "{rt8}Captain Delkray{rt8}||{rt1}Must interrupt [Battle Rally]{rt1} (self and all allies damage boost); spread to dodge [Shatter Spear] line, actual range larger than visual||Person pinned by [Brutal Pulverize] rescued by teammates focus-firing [Emberclaw]; tank on [Armor Piercing] bleed vulnerability use mitigation, healers dispel promptly",
                ["mythic"] = "{rt8}Captain Delkray{rt8}||{rt1}Must interrupt [Battle Rally]{rt1} (self and all allies damage boost); spread to dodge [Shatter Spear] line, actual range larger than visual||Person pinned by [Brutal Pulverize] rescued by teammates focus-firing [Emberclaw]; tank on [Armor Piercing] bleed vulnerability use mitigation, healers dispel promptly",
                ["mythicplus"] = "{rt8}Captain Delkray{rt8}||{rt1}Must interrupt [Battle Rally]{rt1} (self and all allies damage boost); spread to dodge [Shatter Spear] line, actual range larger than visual||Person pinned by [Brutal Pulverize] rescued by teammates focus-firing [Emberclaw]; tank on [Armor Piercing] bleed vulnerability use mitigation, healers dispel promptly",
            },
        },
        ["锻造大师达米安"] = {
            type = "MOB",
            tips = "{rt8}Forgemaster Damien{rt8}||North-side mini-boss, killing it spawns [Alena Amboranz]; after killing 2 loyal guards Delkray comes out with the last one",
        },
        ["隐修院长穆普雷"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Prior Muphre{rt8}||Try to interrupt [Holy Smite]; dodge [Holy Flame] fire pillars and residual [Hallowed Ground], marked by tracking immediately run away don't pass through people||[Blinding Light] face away from boss and use mitigation to avoid confusion; [Inner Fire] period healers burst||At 50% go upstairs and open [Light Barrier], after full burst breaks shield {rt1}must interrupt [Embrace Light]{rt1}; [Arathi Recruit] has no threat—gather to one side slow-kite, rely on [Extraordinary Power] self-damage to drain",
                ["normal"] = "{rt8}Prior Muphre{rt8}||Try to interrupt [Holy Smite]; dodge [Holy Flame] fire pillars and residual [Hallowed Ground], marked by tracking immediately run away don't pass through people||[Blinding Light] face away from boss and use mitigation to avoid confusion; [Inner Fire] period healers burst||At 50% go upstairs and open [Light Barrier], after full burst breaks shield {rt1}must interrupt [Embrace Light]{rt1}; [Arathi Recruit] has no threat—gather to one side slow-kite, rely on [Extraordinary Power] self-damage to drain",
                ["heroic"] = "{rt8}Prior Muphre{rt8}||Try to interrupt [Holy Smite]; dodge [Holy Flame] fire pillars and residual [Hallowed Ground], marked by tracking immediately run away don't pass through people||[Blinding Light] face away from boss and use mitigation to avoid confusion; [Inner Fire] period healers burst||At 50% go upstairs and open [Light Barrier], after full burst breaks shield {rt1}must interrupt [Embrace Light]{rt1}; [Arathi Recruit] has no threat—gather to one side slow-kite, rely on [Extraordinary Power] self-damage to drain",
                ["mythic"] = "{rt8}Prior Muphre{rt8}||Try to interrupt [Holy Smite]; dodge [Holy Flame] fire pillars and residual [Hallowed Ground], marked by tracking immediately run away don't pass through people||[Blinding Light] face away from boss and use mitigation to avoid confusion; [Inner Fire] period healers burst||At 50% go upstairs and open [Light Barrier], after full burst breaks shield {rt1}must interrupt [Embrace Light]{rt1}; [Arathi Recruit] has no threat—gather to one side slow-kite, rely on [Extraordinary Power] self-damage to drain",
                ["mythicplus"] = "{rt8}Prior Muphre{rt8}||Try to interrupt [Holy Smite]; dodge [Holy Flame] fire pillars and residual [Hallowed Ground], marked by tracking immediately run away don't pass through people||[Blinding Light] face away from boss and use mitigation to avoid confusion; [Inner Fire] period healers burst||At 50% go upstairs and open [Light Barrier], after full burst breaks shield {rt1}must interrupt [Embrace Light]{rt1}; [Arathi Recruit] has no threat—gather to one side slow-kite, rely on [Extraordinary Power] self-damage to drain",
            },
        },
        ["布朗派克男爵"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Baron Brownpike{rt8}||{rt1}Must interrupt [Searing Light]{rt1} (raid damage and heals boss); at full energy [Wrath of Retribution] empowers all spells—stack mitigation||Gather to place [Condemner's Shield] landing, after circle leave follow tank unified reposition to dodge [Condemner's Blast]; [Sacrificial Funeral Pyre] light orbs ram one by one in turn, don't all eat at once overloading healers",
                ["normal"] = "{rt8}Baron Brownpike{rt8}||{rt1}Must interrupt [Searing Light]{rt1} (raid damage and heals boss); at full energy [Wrath of Retribution] empowers all spells—stack mitigation||Gather to place [Condemner's Shield] landing, after circle leave follow tank unified reposition to dodge [Condemner's Blast]; [Sacrificial Funeral Pyre] light orbs ram one by one in turn, don't all eat at once overloading healers",
                ["heroic"] = "{rt8}Baron Brownpike{rt8}||{rt1}Must interrupt [Searing Light]{rt1} (raid damage and heals boss); at full energy [Wrath of Retribution] empowers all spells—stack mitigation||Gather to place [Condemner's Shield] landing, after circle leave follow tank unified reposition to dodge [Condemner's Blast]; [Sacrificial Funeral Pyre] light orbs ram one by one in turn, don't all eat at once overloading healers",
                ["mythic"] = "{rt8}Baron Brownpike{rt8}||{rt1}Must interrupt [Searing Light]{rt1} (raid damage and heals boss); at full energy [Wrath of Retribution] empowers all spells—stack mitigation||Gather to place [Condemner's Shield] landing, after circle leave follow tank unified reposition to dodge [Condemner's Blast]; [Sacrificial Funeral Pyre] light orbs ram one by one in turn, don't all eat at once overloading healers",
                ["mythicplus"] = "{rt8}Baron Brownpike{rt8}||{rt1}Must interrupt [Searing Light]{rt1} (raid damage and heals boss); at full energy [Wrath of Retribution] empowers all spells—stack mitigation||Gather to place [Condemner's Shield] landing, after circle leave follow tank unified reposition to dodge [Condemner's Blast]; [Sacrificial Funeral Pyre] light orbs ram one by one in turn, don't all eat at once overloading healers",
            },
        },
        ["虔诚的牧师"] = {
            type = "MOB",
            tips = "{rt8}Devout Priest{rt8}||{rt1}Must interrupt [Holy Smite]{rt1} (high single target); often multiple appear at once—must assign interrupt chain well",
        },
        ["高阶牧师艾姆雅"] = {
            type = "MOB",
            tips = "{rt8}High Priestess Am'ya{rt8}||{rt1}Must interrupt [Holy Smite]{rt1}; killing her spawns [Tayna Durma]",
        },
        ["光明之魂"] = {
            type = "MOB",
            tips = "{rt8}Radiant Soul{rt8}||At low health casts [Radiant Burst] healing nearby enemies—tank pull other mobs away early or directly control/interrupt",
        },
        ["卫队长苏雷曼"] = {
            type = "MOB",
            tips = "{rt8}Guard Captain Suleiman{rt8}||Center-field mini-boss, killing it spawns [Sergeant Shanniel]; loyal guards near each other have [Strength in Numbers] (each +200% damage)—must pull and kill separately one by one",
        },
        ["狂热圣殿骑士"] = {
            type = "MOB",
            tips = "{rt8}Fanatic Templar{rt8}||[Lightfury Seal] main threat to tank, tank use mitigation; if spellsteal/offensive dispel available, remove [Templar's Wrath] buff, don't stand on [Consecration] ground",
        },
        ["艾蕾娜·安博兰兹"] = {
            type = "MOB",
            tips = "{rt8}Alena Amboranz{rt8}||[Light Gleam] buff dispellable/spellstealable; dodge [Holy Judgment] marked ground",
        },
    },
    ["暗焰裂口"] = {
        name = "Darkflame Cleft",
        ["漫游蜡烛"] = {
            type = "MOB",
            tips = "{rt8}Roaming Candle{rt8}||[Candle-Quench Shock] is 30-yard hard-eat whole-group AoE, can corner / ranged go far to avoid, melee pre-cooldowns; dodge [Surging Flame] fire circle and pull mob away from fire circle",
        },
        ["鼹鼠倌"] = {
            type = "MOB",
            tips = "{rt8}Moleherd{rt8}||{rt1}Prioritize killing and interrupting [Mole Frenzy]{rt1}; the big kobold's knockback scatters the adds causing more adds—tank should gather the whole pack into a corner",
        },
        ["布雷炙孔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Burning Brazier{rt8}||core is candle: more lit = lower environmental AoE. [Wick Barrage] marked immediately run to field edge, use fire circle at feet to light as many candles as possible (each ~2), start by lighting candle then burst||[Fire-Extinguish Gust] / [Extinguish Breath] lead to field edge only extinguish 1, leave a clean footing; [Flaming Inferno] relights all candles and deals damage along path, pre-cooldowns||dodge [Ignite] spreading embers; melee range must have someone or triggers [Blazing Storm]",
                ["normal"] = "{rt8}Burning Brazier{rt8}||core is candle: more lit = lower environmental AoE. [Wick Barrage] marked immediately run to field edge, use fire circle at feet to light as many candles as possible (each ~2), start by lighting candle then burst||[Fire-Extinguish Gust] / [Extinguish Breath] lead to field edge only extinguish 1, leave a clean footing; [Flaming Inferno] relights all candles and deals damage along path, pre-cooldowns||dodge [Ignite] spreading embers; melee range must have someone or triggers [Blazing Storm]",
                ["heroic"] = "{rt8}Burning Brazier{rt8}||core is candle: more lit = lower environmental AoE. [Wick Barrage] marked immediately run to field edge, use fire circle at feet to light as many candles as possible (each ~2), start by lighting candle then burst||[Fire-Extinguish Gust] / [Extinguish Breath] lead to field edge only extinguish 1, leave a clean footing; [Flaming Inferno] relights all candles and deals damage along path, pre-cooldowns||dodge [Ignite] spreading embers; melee range must have someone or triggers [Blazing Storm]",
                ["mythic"] = "{rt8}Burning Brazier{rt8}||core is candle: more lit = lower environmental AoE. [Wick Barrage] marked immediately run to field edge, use fire circle at feet to light as many candles as possible (each ~2), start by lighting candle then burst||[Fire-Extinguish Gust] / [Extinguish Breath] lead to field edge only extinguish 1, leave a clean footing; [Flaming Inferno] relights all candles and deals damage along path, pre-cooldowns||dodge [Ignite] spreading embers; melee range must have someone or triggers [Blazing Storm]",
                ["mythicplus"] = "{rt8}Burning Brazier{rt8}||core is candle: more lit = lower environmental AoE. [Wick Barrage] marked immediately run to field edge, use fire circle at feet to light as many candles as possible (each ~2), start by lighting candle then burst||[Fire-Extinguish Gust] / [Extinguish Breath] lead to field edge only extinguish 1, leave a clean footing; [Flaming Inferno] relights all candles and deals damage along path, pre-cooldowns||dodge [Ignite] spreading embers; melee range must have someone or triggers [Blazing Storm]",
            },
        },
        ["卑微的劳工"] = {
            type = "MOB",
            tips = "{rt8}Lowly Laborer{rt8}||during Old Waxybeard fight continuously spawns, [Crude Weapon] stacks don't hard-take; use mine cart [High-Speed Collision] and [Reckless Charge] path to clear at once, when [Luring Candleflame] marked first kite",
        },
        ["点芯者"] = {
            type = "MOB",
            tips = "{rt8}Coreslinger{rt8}||{rt1}Must interrupt [Core Bolt]{rt1}; casts very frequently—set up an interrupt chain together with [Clank!]",
        },
        ["蜡烛之王"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Candle King{rt8}||[Wax Mold] makes wax figure for each person, more figures on field = higher whole-group AoE, each round must clear: whole group small-range gather to place figures||single [Darkflame Hoe] arrow marked, stand behind lone wax figure to crush it via pierce; group [Throw Darkflame] circle cover multiple figures||{rt1}must interrupt [Paranoid Madness]{rt1} (fear, very frequent cast); [Throw Darkflame] marked cooldowns, healer whole fight continuous heal",
                ["normal"] = "{rt8}Candle King{rt8}||[Wax Mold] makes wax figure for each person, more figures on field = higher whole-group AoE, each round must clear: whole group small-range gather to place figures||single [Darkflame Hoe] arrow marked, stand behind lone wax figure to crush it via pierce; group [Throw Darkflame] circle cover multiple figures||{rt1}must interrupt [Paranoid Madness]{rt1} (fear, very frequent cast); [Throw Darkflame] marked cooldowns, healer whole fight continuous heal",
                ["heroic"] = "{rt8}Candle King{rt8}||[Wax Mold] makes wax figure for each person, more figures on field = higher whole-group AoE, each round must clear: whole group small-range gather to place figures||single [Darkflame Hoe] arrow marked, stand behind lone wax figure to crush it via pierce; group [Throw Darkflame] circle cover multiple figures||{rt1}must interrupt [Paranoid Madness]{rt1} (fear, very frequent cast); [Throw Darkflame] marked cooldowns, healer whole fight continuous heal",
                ["mythic"] = "{rt8}Candle King{rt8}||[Wax Mold] makes wax figure for each person, more figures on field = higher whole-group AoE, each round must clear: whole group small-range gather to place figures||single [Darkflame Hoe] arrow marked, stand behind lone wax figure to crush it via pierce; group [Throw Darkflame] circle cover multiple figures||{rt1}must interrupt [Paranoid Madness]{rt1} (fear, very frequent cast); [Throw Darkflame] marked cooldowns, healer whole fight continuous heal",
                ["mythicplus"] = "{rt8}Candle King{rt8}||[Wax Mold] makes wax figure for each person, more figures on field = higher whole-group AoE, each round must clear: whole group small-range gather to place figures||single [Darkflame Hoe] arrow marked, stand behind lone wax figure to crush it via pierce; group [Throw Darkflame] circle cover multiple figures||{rt1}must interrupt [Paranoid Madness]{rt1} (fear, very frequent cast); [Throw Darkflame] marked cooldowns, healer whole fight continuous heal",
            },
        },
        ["狗头人履职者"] = {
            type = "MOB",
            tips = "{rt8}Kobold Fulfiller{rt8}||{rt1}control-interrupt [Bang!]{rt1} (stun 3s, stunned in fire circle basically dies); dodge the small yellow circle it drops",
        },
        ["炽焰魔"] = {
            type = "MOB",
            tips = "{rt8}Flamewraith{rt8}||{rt1}Must interrupt [Explosive Flame]{rt1}; failing to interrupt causes a raid-wide AOE and stacks an accumulating vulnerability; when multiple are up, set up an interrupt chain or use AoE CC to burst them down",
        },
        ["黑暗之主"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Dark Master{rt8}||{rt1}must stand within [Candlelight] range to DPS{rt1}, in darkness damage and healing greatly reduced; when healer can't keep up others help carry small candles to charge big candle||marked purple circle run out of group + cooldowns, by the way bring a small candle back to recharge, don't use circle to trap teammates or candle||tank hold candle dodge head-front [Shadow Cleave], don't let it sweep candle drop energy||{rt1}instant interrupt [Summon Dark Spawn] and dark spawn's [Drain Light]{rt1}; [Eternal Darkness] whole-group AoE cooldowns",
                ["normal"] = "{rt8}The Dark Master{rt8}||{rt1}must stand within [Candlelight] range to DPS{rt1}, in darkness damage and healing greatly reduced; when healer can't keep up others help carry small candles to charge big candle||marked purple circle run out of group + cooldowns, by the way bring a small candle back to recharge, don't use circle to trap teammates or candle||tank hold candle dodge head-front [Shadow Cleave], don't let it sweep candle drop energy||{rt1}instant interrupt [Summon Dark Spawn] and dark spawn's [Drain Light]{rt1}; [Eternal Darkness] whole-group AoE cooldowns",
                ["heroic"] = "{rt8}The Dark Master{rt8}||{rt1}must stand within [Candlelight] range to DPS{rt1}, in darkness damage and healing greatly reduced; when healer can't keep up others help carry small candles to charge big candle||marked purple circle run out of group + cooldowns, by the way bring a small candle back to recharge, don't use circle to trap teammates or candle||tank hold candle dodge head-front [Shadow Cleave], don't let it sweep candle drop energy||{rt1}instant interrupt [Summon Dark Spawn] and dark spawn's [Drain Light]{rt1}; [Eternal Darkness] whole-group AoE cooldowns",
                ["mythic"] = "{rt8}The Dark Master{rt8}||{rt1}must stand within [Candlelight] range to DPS{rt1}, in darkness damage and healing greatly reduced; when healer can't keep up others help carry small candles to charge big candle||marked purple circle run out of group + cooldowns, by the way bring a small candle back to recharge, don't use circle to trap teammates or candle||tank hold candle dodge head-front [Shadow Cleave], don't let it sweep candle drop energy||{rt1}instant interrupt [Summon Dark Spawn] and dark spawn's [Drain Light]{rt1}; [Eternal Darkness] whole-group AoE cooldowns",
                ["mythicplus"] = "{rt8}The Dark Master{rt8}||{rt1}must stand within [Candlelight] range to DPS{rt1}, in darkness damage and healing greatly reduced; when healer can't keep up others help carry small candles to charge big candle||marked purple circle run out of group + cooldowns, by the way bring a small candle back to recharge, don't use circle to trap teammates or candle||tank hold candle dodge head-front [Shadow Cleave], don't let it sweep candle drop energy||{rt1}instant interrupt [Summon Dark Spawn] and dark spawn's [Drain Light]{rt1}; [Eternal Darkness] whole-group AoE cooldowns",
            },
        },
        ["老蜡须"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Old Waxybeard{rt8}||don't stand on rails; rails glow / [Dastardly Rail] then {rt1}immediately switch to yellow-named explosive mine cart{rt1}, [High-Speed Collision] clear [Lowly Laborer] along the way||[Reckless Charge] marks farthest person, keep person-BOSS-nearby wall pillar three points a line to make it charge short, dodge path and avoid following [Cave-in Point] falling rock (knockback + falling rock easy chain kill)||[Luring Candleflame] marked all laborers chase, control + cooldowns kite; tank [Rock Drill] (+25% physical vulnerability) cooldowns",
                ["normal"] = "{rt8}Old Waxybeard{rt8}||don't stand on rails; rails glow / [Dastardly Rail] then {rt1}immediately switch to yellow-named explosive mine cart{rt1}, [High-Speed Collision] clear [Lowly Laborer] along the way||[Reckless Charge] marks farthest person, keep person-BOSS-nearby wall pillar three points a line to make it charge short, dodge path and avoid following [Cave-in Point] falling rock (knockback + falling rock easy chain kill)||[Luring Candleflame] marked all laborers chase, control + cooldowns kite; tank [Rock Drill] (+25% physical vulnerability) cooldowns",
                ["heroic"] = "{rt8}Old Waxybeard{rt8}||don't stand on rails; rails glow / [Dastardly Rail] then {rt1}immediately switch to yellow-named explosive mine cart{rt1}, [High-Speed Collision] clear [Lowly Laborer] along the way||[Reckless Charge] marks farthest person, keep person-BOSS-nearby wall pillar three points a line to make it charge short, dodge path and avoid following [Cave-in Point] falling rock (knockback + falling rock easy chain kill)||[Luring Candleflame] marked all laborers chase, control + cooldowns kite; tank [Rock Drill] (+25% physical vulnerability) cooldowns",
                ["mythic"] = "{rt8}Old Waxybeard{rt8}||don't stand on rails; rails glow / [Dastardly Rail] then {rt1}immediately switch to yellow-named explosive mine cart{rt1}, [High-Speed Collision] clear [Lowly Laborer] along the way||[Reckless Charge] marks farthest person, keep person-BOSS-nearby wall pillar three points a line to make it charge short, dodge path and avoid following [Cave-in Point] falling rock (knockback + falling rock easy chain kill)||[Luring Candleflame] marked all laborers chase, control + cooldowns kite; tank [Rock Drill] (+25% physical vulnerability) cooldowns",
                ["mythicplus"] = "{rt8}Old Waxybeard{rt8}||don't stand on rails; rails glow / [Dastardly Rail] then {rt1}immediately switch to yellow-named explosive mine cart{rt1}, [High-Speed Collision] clear [Lowly Laborer] along the way||[Reckless Charge] marks farthest person, keep person-BOSS-nearby wall pillar three points a line to make it charge short, dodge path and avoid following [Cave-in Point] falling rock (knockback + falling rock easy chain kill)||[Luring Candleflame] marked all laborers chase, control + cooldowns kite; tank [Rock Drill] (+25% physical vulnerability) cooldowns",
            },
        },
    },
    ["艾拉-卡拉，回响之城"] = {
        name = "Ara-Kara, City of Echoes",
        ["魁梧的血卫"] = {
            type = "MOB",
            tips = "{rt8}Stout Bloodguard{rt8}||{rt1}While present, prioritize as main target to kill{rt1} (gives aura to nearby allies); dodge [Pierce] cone and [Savage Slam] (AOE + 1s stun), [Intensity] each stack +10% damage",
        },
        ["鲜血监督者"] = {
            type = "MOB",
            tips = "{rt8}Blood Overseer{rt8}||{rt1}Must interrupt [Venom Volley]{rt1} (high AOE + DoT); dodge [Bursting Webs] ground",
        },
        ["阿努布泽克特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Anub'zeket{rt8}||Tank keeps boss facing away from allies—[Pierce] is a long cone toward current target||Marked by [Infect] use mitigation, leaves [Relentless Swarm] at location—try to drop it outside; dodge the wandering purple circles at start (stacks [Festering Wound])||[Burrow Strike] dodge as far from boss as possible, don't stand in the landing circle where it emerges, followed by a long cone after surfacing||Summoned [Bloodied Webmage] {rt1}burst down and interrupt [Filament Bind]{rt1}||At full energy [Swarm Eye] covers whole field with swarm—enter the moving white safe circle; during this phase beware [Pierce] and [Infect] more",
                ["normal"] = "{rt8}Anub'zeket{rt8}||Tank keeps boss facing away from allies—[Pierce] is a long cone toward current target||Marked by [Infect] use mitigation, leaves [Relentless Swarm] at location—try to drop it outside; dodge the wandering purple circles at start (stacks [Festering Wound])||[Burrow Strike] dodge as far from boss as possible, don't stand in the landing circle where it emerges, followed by a long cone after surfacing||Summoned [Bloodied Webmage] {rt1}burst down and interrupt [Filament Bind]{rt1}||At full energy [Swarm Eye] covers whole field with swarm—enter the moving white safe circle; during this phase beware [Pierce] and [Infect] more",
                ["heroic"] = "{rt8}Anub'zeket{rt8}||Tank keeps boss facing away from allies—[Pierce] is a long cone toward current target||Marked by [Infect] use mitigation, leaves [Relentless Swarm] at location—try to drop it outside; dodge the wandering purple circles at start (stacks [Festering Wound])||[Burrow Strike] dodge as far from boss as possible, don't stand in the landing circle where it emerges, followed by a long cone after surfacing||Summoned [Bloodied Webmage] {rt1}burst down and interrupt [Filament Bind]{rt1}||At full energy [Swarm Eye] covers whole field with swarm—enter the moving white safe circle; during this phase beware [Pierce] and [Infect] more",
                ["mythic"] = "{rt8}Anub'zeket{rt8}||Tank keeps boss facing away from allies—[Pierce] is a long cone toward current target||Marked by [Infect] use mitigation, leaves [Relentless Swarm] at location—try to drop it outside; dodge the wandering purple circles at start (stacks [Festering Wound])||[Burrow Strike] dodge as far from boss as possible, don't stand in the landing circle where it emerges, followed by a long cone after surfacing||Summoned [Bloodied Webmage] {rt1}burst down and interrupt [Filament Bind]{rt1}||At full energy [Swarm Eye] covers whole field with swarm—enter the moving white safe circle; during this phase beware [Pierce] and [Infect] more",
                ["mythicplus"] = "{rt8}Anub'zeket{rt8}||Tank keeps boss facing away from allies—[Pierce] is a long cone toward current target||Marked by [Infect] use mitigation, leaves [Relentless Swarm] at location—try to drop it outside; dodge the wandering purple circles at start (stacks [Festering Wound])||[Burrow Strike] dodge as far from boss as possible, don't stand in the landing circle where it emerges, followed by a long cone after surfacing||Summoned [Bloodied Webmage] {rt1}burst down and interrupt [Filament Bind]{rt1}||At full energy [Swarm Eye] covers whole field with swarm—enter the moving white safe circle; during this phase beware [Pierce] and [Infect] more",
            },
        },
        ["伊克辛"] = {
            type = "MOB",
            tips = "{rt8}Ik'sinx{rt8}||{rt1}Must interrupt [Terrifying Screech]{rt1} (fears whole team 6s); dodge the [Web Spray] cone in front; [Web Bolt] interrupt if possible",
        },
        ["阿提克"] = {
            type = "MOB",
            tips = "{rt8}Atik{rt8}||[Venom Bolt] only hits tank; dodge [Poison Cloud] green circle and the [Web Spray] cone in front",
        },
        ["颤声侍从"] = {
            type = "MOB",
            tips = "{rt8}Quivering Attendant{rt8}||{rt1}Must interrupt [Resonant Barrage]{rt1} (high raid-wide AOE); [Web Bolt] interrupt if spare—don't waste CC on it while tank is kiting",
        },
        ["充血的爬行者"] = {
            type = "MOB",
            tips = "{rt8}Engorged Crawler{rt8}||[Toxic Spray] poison dispel on CD; at low health casts [Virulent Rupture] to self-destruct—use AoE CC chain to stagger detonation timing and stay away from green circle",
        },
        ["哨兵鹿壳虫"] = {
            type = "MOB",
            tips = "{rt8}Sentinel Stagbeetle{rt8}||{rt1}[Warning Screech] 10-second long cast must be controlled/interrupted{rt1}, missing it is extremely high wipe risk; once every 10s—set up a control chain",
        },
        ["收割者吉卡塔尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Reaper Jikatal{rt8}||[Venom Rain] and [Cultivate Poison] are group poison DoTs, {rt1}prioritize dispelling poison{rt1}; [Cultivate Poison] ending fires poison waves from each player to both sides—stay spread and don't face teammates||Dodge [Bursting Webs] ground circle||[Bloodworker] on damage drops black blood—stepping on [Grasping Blood] roots for 1 minute, control/interrupt the black-blood add to rescue||{rt1}[Cosmic Singularity] drags the whole team toward the boss—must leave the circle at your feet before cast ends or instant death{rt1}----no movement ability means step on black water to root yourself early, or use movement at the last moment to jump out",
                ["normal"] = "{rt8}Reaper Jikatal{rt8}||[Venom Rain] and [Cultivate Poison] are group poison DoTs, {rt1}prioritize dispelling poison{rt1}; [Cultivate Poison] ending fires poison waves from each player to both sides—stay spread and don't face teammates||Dodge [Bursting Webs] ground circle||[Bloodworker] on damage drops black blood—stepping on [Grasping Blood] roots for 1 minute, control/interrupt the black-blood add to rescue||{rt1}[Cosmic Singularity] drags the whole team toward the boss—must leave the circle at your feet before cast ends or instant death{rt1}----no movement ability means step on black water to root yourself early, or use movement at the last moment to jump out",
                ["heroic"] = "{rt8}Reaper Jikatal{rt8}||[Venom Rain] and [Cultivate Poison] are group poison DoTs, {rt1}prioritize dispelling poison{rt1}; [Cultivate Poison] ending fires poison waves from each player to both sides—stay spread and don't face teammates||Dodge [Bursting Webs] ground circle||[Bloodworker] on damage drops black blood—stepping on [Grasping Blood] roots for 1 minute, control/interrupt the black-blood add to rescue||{rt1}[Cosmic Singularity] drags the whole team toward the boss—must leave the circle at your feet before cast ends or instant death{rt1}----no movement ability means step on black water to root yourself early, or use movement at the last moment to jump out",
                ["mythic"] = "{rt8}Reaper Jikatal{rt8}||[Venom Rain] and [Cultivate Poison] are group poison DoTs, {rt1}prioritize dispelling poison{rt1}; [Cultivate Poison] ending fires poison waves from each player to both sides—stay spread and don't face teammates||Dodge [Bursting Webs] ground circle||[Bloodworker] on damage drops black blood—stepping on [Grasping Blood] roots for 1 minute, control/interrupt the black-blood add to rescue||{rt1}[Cosmic Singularity] drags the whole team toward the boss—must leave the circle at your feet before cast ends or instant death{rt1}----no movement ability means step on black water to root yourself early, or use movement at the last moment to jump out",
                ["mythicplus"] = "{rt8}Reaper Jikatal{rt8}||[Venom Rain] and [Cultivate Poison] are group poison DoTs, {rt1}prioritize dispelling poison{rt1}; [Cultivate Poison] ending fires poison waves from each player to both sides—stay spread and don't face teammates||Dodge [Bursting Webs] ground circle||[Bloodworker] on damage drops black blood—stepping on [Grasping Blood] roots for 1 minute, control/interrupt the black-blood add to rescue||{rt1}[Cosmic Singularity] drags the whole team toward the boss—must leave the circle at your feet before cast ends or instant death{rt1}----no movement ability means step on black water to root yourself early, or use movement at the last moment to jump out",
            },
        },
        ["阿瓦诺克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Avanoxx{rt8}||Must first clear the 3 gatekeeper mini-bosses [Ik'sinx]/[Nakt]/[Atik] before it appears||[Warning Screech] 3-second sustained AOE extremely high damage—pre-place raid mitigation; meanwhile [Hungry Crawler] hatch from eggs, {rt1}control and swap to them immediately, never bring to boss melee{rt1}----being swallowed triggers [Insatiable] permanent +50% damage stacking||[Web Strand Assault] 5-second AOE with [Evil Cocoon] placed under each player—whole team gather and walk same direction to save space, web stacking 10 layers becomes [Shroud Web] paralyzed 10s||Tank use mitigation on [Ravenous Bite] (3-hit +50% vulnerability)",
                ["normal"] = "{rt8}Avanoxx{rt8}||Must first clear the 3 gatekeeper mini-bosses [Ik'sinx]/[Nakt]/[Atik] before it appears||[Warning Screech] 3-second sustained AOE extremely high damage—pre-place raid mitigation; meanwhile [Hungry Crawler] hatch from eggs, {rt1}control and swap to them immediately, never bring to boss melee{rt1}----being swallowed triggers [Insatiable] permanent +50% damage stacking||[Web Strand Assault] 5-second AOE with [Evil Cocoon] placed under each player—whole team gather and walk same direction to save space, web stacking 10 layers becomes [Shroud Web] paralyzed 10s||Tank use mitigation on [Ravenous Bite] (3-hit +50% vulnerability)",
                ["heroic"] = "{rt8}Avanoxx{rt8}||Must first clear the 3 gatekeeper mini-bosses [Ik'sinx]/[Nakt]/[Atik] before it appears||[Warning Screech] 3-second sustained AOE extremely high damage—pre-place raid mitigation; meanwhile [Hungry Crawler] hatch from eggs, {rt1}control and swap to them immediately, never bring to boss melee{rt1}----being swallowed triggers [Insatiable] permanent +50% damage stacking||[Web Strand Assault] 5-second AOE with [Evil Cocoon] placed under each player—whole team gather and walk same direction to save space, web stacking 10 layers becomes [Shroud Web] paralyzed 10s||Tank use mitigation on [Ravenous Bite] (3-hit +50% vulnerability)",
                ["mythic"] = "{rt8}Avanoxx{rt8}||Must first clear the 3 gatekeeper mini-bosses [Ik'sinx]/[Nakt]/[Atik] before it appears||[Warning Screech] 3-second sustained AOE extremely high damage—pre-place raid mitigation; meanwhile [Hungry Crawler] hatch from eggs, {rt1}control and swap to them immediately, never bring to boss melee{rt1}----being swallowed triggers [Insatiable] permanent +50% damage stacking||[Web Strand Assault] 5-second AOE with [Evil Cocoon] placed under each player—whole team gather and walk same direction to save space, web stacking 10 layers becomes [Shroud Web] paralyzed 10s||Tank use mitigation on [Ravenous Bite] (3-hit +50% vulnerability)",
                ["mythicplus"] = "{rt8}Avanoxx{rt8}||Must first clear the 3 gatekeeper mini-bosses [Ik'sinx]/[Nakt]/[Atik] before it appears||[Warning Screech] 3-second sustained AOE extremely high damage—pre-place raid mitigation; meanwhile [Hungry Crawler] hatch from eggs, {rt1}control and swap to them immediately, never bring to boss melee{rt1}----being swallowed triggers [Insatiable] permanent +50% damage stacking||[Web Strand Assault] 5-second AOE with [Evil Cocoon] placed under each player—whole team gather and walk same direction to save space, web stacking 10 layers becomes [Shroud Web] paralyzed 10s||Tank use mitigation on [Ravenous Bite] (3-hit +50% vulnerability)",
            },
        },
        ["纳克特"] = {
            type = "MOB",
            tips = "{rt8}Nakt{rt8}||[Call of the Brood] uninterruptible high-damage AOE with fast cast, {rt1}must pre-cast raid/personal mitigation{rt1}; dodge the [Web Spray] in front",
        },
        ["蛛魔搬运者"] = {
            type = "MOB",
            tips = "{rt8}Nerubian Hauler{rt8}||Dodge the [Pierce] cone and [Savage Slam] (1s stun) in front; [Intensity] stacks increase damage—prioritize focus fire to suppress",
        },
        ["沾血的助手"] = {
            type = "MOB",
            tips = "{rt8}Bloodied Assistant{rt8}||[Deep Dig Strike] hits tank, on hit heals itself and increases damage—tank dodge or use mitigation",
        },
        ["飞翼运输者"] = {
            type = "MOB",
            tips = "{rt8}Winged Transporter{rt8}||Landing leaves [Black Blood] black water—don't step in; [Charge] randomly marks—avoid the path",
        },
        ["沾血的网法师"] = {
            type = "MOB",
            tips = "{rt8}Bloodied Webmage{rt8}||{rt1}Must interrupt [Fetid Volley]{rt1}, missing it applies a pain DoT to whole raid; [Web Bolt] optional interrupt",
        },
    },
}
