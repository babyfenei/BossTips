-- ============================================================================
-- BossTips 7.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["7.0"] = {
    ["魔法回廊"] = {
        name = "The Arcway",
        ["科蒂拉克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Corterax{rt8}||[Imprison] marked hide in cage, [Purifying Touch] dispel; step on [Speed Floor] for buff||",
                ["normal"] = "{rt8}Corterax{rt8}||[Imprison] marked hide in cage, [Purifying Touch] dispel; step on [Speed Floor] for buff||",
                ["heroic"] = "{rt8}Corterax{rt8}||[Imprison] marked hide in cage, [Purifying Touch] dispel; step on [Speed Floor] for buff||",
                ["mythic"] = "{rt8}Corterax{rt8}||[Imprison] marked hide in cage, [Purifying Touch] dispel; step on [Speed Floor] for buff||",
                ["mythicplus"] = "{rt8}Corterax{rt8}||[Imprison] marked hide in cage, [Purifying Touch] dispel; step on [Speed Floor] for buff||",
            },
        },
        ["纳尔提拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Naltira{rt8}||dodge [Web] and [Venom]; clear small spiders fast, the marked runs away to avoid hitting teammates||",
                ["normal"] = "{rt8}Naltira{rt8}||dodge [Web] and [Venom]; clear small spiders fast, the marked runs away to avoid hitting teammates||",
                ["heroic"] = "{rt8}Naltira{rt8}||dodge [Web] and [Venom]; clear small spiders fast, the marked runs away to avoid hitting teammates||",
                ["mythic"] = "{rt8}Naltira{rt8}||dodge [Web] and [Venom]; clear small spiders fast, the marked runs away to avoid hitting teammates||",
                ["mythicplus"] = "{rt8}Naltira{rt8}||dodge [Web] and [Venom]; clear small spiders fast, the marked runs away to avoid hitting teammates||",
            },
        },
        ["萨卡尔将军"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}General Xakal{rt8}||[Shadow Blade] marked dodge, clear summoned imps fast; dodge [Cleave] frontal, {rt1}interrupt Shadow Bolt{rt1}||",
                ["normal"] = "{rt8}General Xakal{rt8}||[Shadow Blade] marked dodge, clear summoned imps fast; dodge [Cleave] frontal, {rt1}interrupt Shadow Bolt{rt1}||",
                ["heroic"] = "{rt8}General Xakal{rt8}||[Shadow Blade] marked dodge, clear summoned imps fast; dodge [Cleave] frontal, {rt1}interrupt Shadow Bolt{rt1}||",
                ["mythic"] = "{rt8}General Xakal{rt8}||[Shadow Blade] marked dodge, clear summoned imps fast; dodge [Cleave] frontal, {rt1}interrupt Shadow Bolt{rt1}||",
                ["mythicplus"] = "{rt8}General Xakal{rt8}||[Shadow Blade] marked dodge, clear summoned imps fast; dodge [Cleave] frontal, {rt1}interrupt Shadow Bolt{rt1}||",
            },
        },
        ["伊凡尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ivanyr{rt8}||dodge [Unstable Mana] blue circles and [Arcane Orbital]; [Arcane Burst] marked spread, {rt1}interrupt casts{rt1}||",
                ["normal"] = "{rt8}Ivanyr{rt8}||dodge [Unstable Mana] blue circles and [Arcane Orbital]; [Arcane Burst] marked spread, {rt1}interrupt casts{rt1}||",
                ["heroic"] = "{rt8}Ivanyr{rt8}||dodge [Unstable Mana] blue circles and [Arcane Orbital]; [Arcane Burst] marked spread, {rt1}interrupt casts{rt1}||",
                ["mythic"] = "{rt8}Ivanyr{rt8}||dodge [Unstable Mana] blue circles and [Arcane Orbital]; [Arcane Burst] marked spread, {rt1}interrupt casts{rt1}||",
                ["mythicplus"] = "{rt8}Ivanyr{rt8}||dodge [Unstable Mana] blue circles and [Arcane Orbital]; [Arcane Burst] marked spread, {rt1}interrupt casts{rt1}||",
            },
        },
        ["顾问凡多斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Advisor Vandros{rt8}||[Time Fragment] explodes 10 yards after 8s—spread and leave in time; [Force Bomb] explosion spawns [Force Nova] ring push—stand between the two bombs or run far early||{rt1}Must interrupt: [Acceleration Surge] (stacks damage and haste, assign interrupt chain){rt1}||at 50% reads [Temporal Exile] whole group teleported, return to boss within 2 min; along the way [Eternal Wraith] group stun, stay spread, kill fast after interrupt",
                ["normal"] = "{rt8}Advisor Vandros{rt8}||[Time Fragment] explodes 10 yards after 8s—spread and leave in time; [Force Bomb] explosion spawns [Force Nova] ring push—stand between the two bombs or run far early||{rt1}Must interrupt: [Acceleration Surge] (stacks damage and haste, assign interrupt chain){rt1}||at 50% reads [Temporal Exile] whole group teleported, return to boss within 2 min; along the way [Eternal Wraith] group stun, stay spread, kill fast after interrupt",
                ["heroic"] = "{rt8}Advisor Vandros{rt8}||[Time Fragment] explodes 10 yards after 8s—spread and leave in time; [Force Bomb] explosion spawns [Force Nova] ring push—stand between the two bombs or run far early||{rt1}Must interrupt: [Acceleration Surge] (stacks damage and haste, assign interrupt chain){rt1}||at 50% reads [Temporal Exile] whole group teleported, return to boss within 2 min; along the way [Eternal Wraith] group stun, stay spread, kill fast after interrupt",
                ["mythic"] = "{rt8}Advisor Vandros{rt8}||[Time Fragment] explodes 10 yards after 8s—spread and leave in time; [Force Bomb] explosion spawns [Force Nova] ring push—stand between the two bombs or run far early||{rt1}Must interrupt: [Acceleration Surge] (stacks damage and haste, assign interrupt chain){rt1}||at 50% reads [Temporal Exile] whole group teleported, return to boss within 2 min; along the way [Eternal Wraith] group stun, stay spread, kill fast after interrupt",
                ["mythicplus"] = "{rt8}Advisor Vandros{rt8}||[Time Fragment] explodes 10 yards after 8s—spread and leave in time; [Force Bomb] explosion spawns [Force Nova] ring push—stand between the two bombs or run far early||{rt1}Must interrupt: [Acceleration Surge] (stacks damage and haste, assign interrupt chain){rt1}||at 50% reads [Temporal Exile] whole group teleported, return to boss within 2 min; along the way [Eternal Wraith] group stun, stay spread, kill fast after interrupt",
            },
        },
        ["重点·不稳定能量球"] = {
            type = "MOB",
            tips = "{rt8}Unstable Energy Orb{rt8}||Ivanyr's room energy orb [Unstable Mana]—dodge before it explodes||",
        },
        ["重点·邪能小鬼"] = {
            type = "MOB",
            tips = "{rt8}Fel Imp{rt8}||imps summoned by Naltira self-detonate—clear fast and stay spread||",
        },
    },
    ["噬魂之喉"] = {
        name = "Maw of Souls",
        ["海拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hela{rt8}||dodge [Decaying Tendril] green circles and [Ravenous Tendril]; P2 tendril marked move away, tank faces [Corrosive Spray], {rt1}interrupt casts{rt1}||",
                ["normal"] = "{rt8}Hela{rt8}||dodge [Decaying Tendril] green circles and [Ravenous Tendril]; P2 tendril marked move away, tank faces [Corrosive Spray], {rt1}interrupt casts{rt1}||",
                ["heroic"] = "{rt8}Hela{rt8}||dodge [Decaying Tendril] green circles and [Ravenous Tendril]; P2 tendril marked move away, tank faces [Corrosive Spray], {rt1}interrupt casts{rt1}||",
                ["mythic"] = "{rt8}Hela{rt8}||dodge [Decaying Tendril] green circles and [Ravenous Tendril]; P2 tendril marked move away, tank faces [Corrosive Spray], {rt1}interrupt casts{rt1}||",
                ["mythicplus"] = "{rt8}Hela{rt8}||dodge [Decaying Tendril] green circles and [Ravenous Tendril]; P2 tendril marked move away, tank faces [Corrosive Spray], {rt1}interrupt casts{rt1}||",
            },
        },
        ["堕落君王伊米隆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Fallen King Ymiron{rt8}||stay away from boss to dodge [Wail of the Dead] fear; priority kill [Risen Dead] adds; dodge [Blight] of... essence and dispel fear||",
                ["normal"] = "{rt8}Fallen King Ymiron{rt8}||stay away from boss to dodge [Wail of the Dead] fear; priority kill [Risen Dead] adds; dodge [Blight] of... essence and dispel fear||",
                ["heroic"] = "{rt8}Fallen King Ymiron{rt8}||stay away from boss to dodge [Wail of the Dead] fear; priority kill [Risen Dead] adds; dodge [Blight] of... essence and dispel fear||",
                ["mythic"] = "{rt8}Fallen King Ymiron{rt8}||stay away from boss to dodge [Wail of the Dead] fear; priority kill [Risen Dead] adds; dodge [Blight] of... essence and dispel fear||",
                ["mythicplus"] = "{rt8}Fallen King Ymiron{rt8}||stay away from boss to dodge [Wail of the Dead] fear; priority kill [Risen Dead] adds; dodge [Blight] of... essence and dispel fear||",
            },
        },
        ["重点·纳格法尔号甲板"] = {
            type = "MOB",
            tips = "{rt8}Naglfar Deck{rt8}||moving ship fight—watch positioning, avoid being knocked into the sea by [Northwind] etc.||",
        },
        ["哈布隆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Habron{rt8}||{rt1}interrupt Void Rift{rt1} and defeat the summoned servants; [Shard] target takes high damage—heal, dodge [Spatial Scythe] and [Void Tear]||",
                ["normal"] = "{rt8}Habron{rt8}||{rt1}interrupt Void Rift{rt1} and defeat the summoned servants; [Shard] target takes high damage—heal, dodge [Spatial Scythe] and [Void Tear]||",
                ["heroic"] = "{rt8}Habron{rt8}||{rt1}interrupt Void Rift{rt1} and defeat the summoned servants; [Shard] target takes high damage—heal, dodge [Spatial Scythe] and [Void Tear]||",
                ["mythic"] = "{rt8}Habron{rt8}||{rt1}interrupt Void Rift{rt1} and defeat the summoned servants; [Shard] target takes high damage—heal, dodge [Spatial Scythe] and [Void Tear]||",
                ["mythicplus"] = "{rt8}Habron{rt8}||{rt1}interrupt Void Rift{rt1} and defeat the summoned servants; [Shard] target takes high damage—heal, dodge [Spatial Scythe] and [Void Tear]||",
            },
        },
        ["重点·被诅咒灵魂"] = {
            type = "MOB",
            tips = "{rt8}Cursed Soul{rt8}||shipboard ghosts and imps—{rt1}interrupt Void Rift{rt1} and clear soul shards||",
        },
    },
    ["黑心林地"] = {
        name = "Darkheart Thicket",
        ["橡树之心"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Oakheart{rt8}||tank pre-pop cooldowns to eat [Crushing Grip]; red circle [Root Entangle] dodge first, [Controlled] clear adds fast||",
                ["normal"] = "{rt8}Oakheart{rt8}||tank pre-pop cooldowns to eat [Crushing Grip]; red circle [Root Entangle] dodge first, [Controlled] clear adds fast||",
                ["heroic"] = "{rt8}Oakheart{rt8}||tank pre-pop cooldowns to eat [Crushing Grip]; red circle [Root Entangle] dodge first, [Controlled] clear adds fast||",
                ["mythic"] = "{rt8}Oakheart{rt8}||tank pre-pop cooldowns to eat [Crushing Grip]; red circle [Root Entangle] dodge first, [Controlled] clear adds fast||",
                ["mythicplus"] = "{rt8}Oakheart{rt8}||tank pre-pop cooldowns to eat [Crushing Grip]; red circle [Root Entangle] dodge first, [Controlled] clear adds fast||",
            },
        },
        ["重点·腐化绿水"] = {
            type = "MOB",
            tips = "{rt8}Corrupt Green Water{rt8}||ground corrupt green water—stepping in it drains health and slows; go around||",
        },
        ["重点·梦魇生物"] = {
            type = "MOB",
            tips = "{rt8}Nightmare Creature{rt8}||nightmare adds summoned by each boss—tank holds and focus AoE; avoid stacking||",
        },
        ["德萨隆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Dresaron{rt8}||ground [Sand Circle] dodge promptly; wyrmlings tank pulls and focus AoE; dodge [Dragon Breath] frontal||",
                ["normal"] = "{rt8}Dresaron{rt8}||ground [Sand Circle] dodge promptly; wyrmlings tank pulls and focus AoE; dodge [Dragon Breath] frontal||",
                ["heroic"] = "{rt8}Dresaron{rt8}||ground [Sand Circle] dodge promptly; wyrmlings tank pulls and focus AoE; dodge [Dragon Breath] frontal||",
                ["mythic"] = "{rt8}Dresaron{rt8}||ground [Sand Circle] dodge promptly; wyrmlings tank pulls and focus AoE; dodge [Dragon Breath] frontal||",
                ["mythicplus"] = "{rt8}Dresaron{rt8}||ground [Sand Circle] dodge promptly; wyrmlings tank pulls and focus AoE; dodge [Dragon Breath] frontal||",
            },
        },
        ["萨维斯之影"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Xavius's Echo{rt8}||whole group spreads to avoid [Induced Paranoia] fear; [Nightmare Awakening] stand near a teammate to avoid silence, prioritize the [Survival of the Fittest] target||",
                ["normal"] = "{rt8}Xavius's Echo{rt8}||whole group spreads to avoid [Induced Paranoia] fear; [Nightmare Awakening] stand near a teammate to avoid silence, prioritize the [Survival of the Fittest] target||",
                ["heroic"] = "{rt8}Xavius's Echo{rt8}||whole group spreads to avoid [Induced Paranoia] fear; [Nightmare Awakening] stand near a teammate to avoid silence, prioritize the [Survival of the Fittest] target||",
                ["mythic"] = "{rt8}Xavius's Echo{rt8}||whole group spreads to avoid [Induced Paranoia] fear; [Nightmare Awakening] stand near a teammate to avoid silence, prioritize the [Survival of the Fittest] target||",
                ["mythicplus"] = "{rt8}Xavius's Echo{rt8}||whole group spreads to avoid [Induced Paranoia] fear; [Nightmare Awakening] stand near a teammate to avoid silence, prioritize the [Survival of the Fittest] target||",
            },
        },
        ["大德鲁伊格兰达里斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Arch-Druid Glaidalis{rt8}||spread to reduce [Nightfall] damage; [Painful Thrash] healer watch, {rt1}interrupt Moonfire-type casts{rt1}, adds tank pulls||",
                ["normal"] = "{rt8}Arch-Druid Glaidalis{rt8}||spread to reduce [Nightfall] damage; [Painful Thrash] healer watch, {rt1}interrupt Moonfire-type casts{rt1}, adds tank pulls||",
                ["heroic"] = "{rt8}Arch-Druid Glaidalis{rt8}||spread to reduce [Nightfall] damage; [Painful Thrash] healer watch, {rt1}interrupt Moonfire-type casts{rt1}, adds tank pulls||",
                ["mythic"] = "{rt8}Arch-Druid Glaidalis{rt8}||spread to reduce [Nightfall] damage; [Painful Thrash] healer watch, {rt1}interrupt Moonfire-type casts{rt1}, adds tank pulls||",
                ["mythicplus"] = "{rt8}Arch-Druid Glaidalis{rt8}||spread to reduce [Nightfall] damage; [Painful Thrash] healer watch, {rt1}interrupt Moonfire-type casts{rt1}, adds tank pulls||",
            },
        },
    },
    ["重返卡拉赞"] = {
        name = "Return to Karazhan",
        ["贞节圣女"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Maiden of Virtue{rt8}||spread 8 yards to avoid [Holy Wrath] chain; dispel [Holy Fire] promptly; before [Repentance] step into [Holy Ground] to clear||",
                ["normal"] = "{rt8}Maiden of Virtue{rt8}||spread 8 yards to avoid [Holy Wrath] chain; dispel [Holy Fire] promptly; before [Repentance] step into [Holy Ground] to clear||",
                ["heroic"] = "{rt8}Maiden of Virtue{rt8}||spread 8 yards to avoid [Holy Wrath] chain; dispel [Holy Fire] promptly; before [Repentance] step into [Holy Ground] to clear||",
                ["mythic"] = "{rt8}Maiden of Virtue{rt8}||spread 8 yards to avoid [Holy Wrath] chain; dispel [Holy Fire] promptly; before [Repentance] step into [Holy Ground] to clear||",
                ["mythicplus"] = "{rt8}Maiden of Virtue{rt8}||spread 8 yards to avoid [Holy Wrath] chain; dispel [Holy Fire] promptly; before [Repentance] step into [Holy Ground] to clear||",
            },
        },
        ["歌剧院：西部故事"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Opera: Westfall Story{rt8}||P1 first clear 3 [Gang Ruffians] then fight Tony, dodge [Sweeping Flame Gust] leaving fire whirlwinds, melee away from [Burning Sweep]; P2 Maggie's [Wash] water wave sweeps from both sides—predict and dodge||{rt1}Must interrupt / clear: [Coast Tidecaller]'s [Bubble Burst]{rt1}||when marked by [Thunder Ritual] whole group spreads 5+ yards; P3 two bosses together no more adds—focus Tony",
                ["normal"] = "{rt8}Opera: Westfall Story{rt8}||P1 first clear 3 [Gang Ruffians] then fight Tony, dodge [Sweeping Flame Gust] leaving fire whirlwinds, melee away from [Burning Sweep]; P2 Maggie's [Wash] water wave sweeps from both sides—predict and dodge||{rt1}Must interrupt / clear: [Coast Tidecaller]'s [Bubble Burst]{rt1}||when marked by [Thunder Ritual] whole group spreads 5+ yards; P3 two bosses together no more adds—focus Tony",
                ["heroic"] = "{rt8}Opera: Westfall Story{rt8}||P1 first clear 3 [Gang Ruffians] then fight Tony, dodge [Sweeping Flame Gust] leaving fire whirlwinds, melee away from [Burning Sweep]; P2 Maggie's [Wash] water wave sweeps from both sides—predict and dodge||{rt1}Must interrupt / clear: [Coast Tidecaller]'s [Bubble Burst]{rt1}||when marked by [Thunder Ritual] whole group spreads 5+ yards; P3 two bosses together no more adds—focus Tony",
                ["mythic"] = "{rt8}Opera: Westfall Story{rt8}||P1 first clear 3 [Gang Ruffians] then fight Tony, dodge [Sweeping Flame Gust] leaving fire whirlwinds, melee away from [Burning Sweep]; P2 Maggie's [Wash] water wave sweeps from both sides—predict and dodge||{rt1}Must interrupt / clear: [Coast Tidecaller]'s [Bubble Burst]{rt1}||when marked by [Thunder Ritual] whole group spreads 5+ yards; P3 two bosses together no more adds—focus Tony",
                ["mythicplus"] = "{rt8}Opera: Westfall Story{rt8}||P1 first clear 3 [Gang Ruffians] then fight Tony, dodge [Sweeping Flame Gust] leaving fire whirlwinds, melee away from [Burning Sweep]; P2 Maggie's [Wash] water wave sweeps from both sides—predict and dodge||{rt1}Must interrupt / clear: [Coast Tidecaller]'s [Bubble Burst]{rt1}||when marked by [Thunder Ritual] whole group spreads 5+ yards; P3 two bosses together no more adds—focus Tony",
            },
        },
        ["麦迪文之影"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Medivh's Echo{rt8}||{rt1}interrupt Frostbolt / Fireball{rt1}, dodge [Blizzard] and [Ring of Fire] (stand in circle, don't move); clear elementals||",
                ["normal"] = "{rt8}Medivh's Echo{rt8}||{rt1}interrupt Frostbolt / Fireball{rt1}, dodge [Blizzard] and [Ring of Fire] (stand in circle, don't move); clear elementals||",
                ["heroic"] = "{rt8}Medivh's Echo{rt8}||{rt1}interrupt Frostbolt / Fireball{rt1}, dodge [Blizzard] and [Ring of Fire] (stand in circle, don't move); clear elementals||",
                ["mythic"] = "{rt8}Medivh's Echo{rt8}||{rt1}interrupt Frostbolt / Fireball{rt1}, dodge [Blizzard] and [Ring of Fire] (stand in circle, don't move); clear elementals||",
                ["mythicplus"] = "{rt8}Medivh's Echo{rt8}||{rt1}interrupt Frostbolt / Fireball{rt1}, dodge [Blizzard] and [Ring of Fire] (stand in circle, don't move); clear elementals||",
            },
        },
        ["魔力吞噬者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mana Devourer{rt8}||before fight shrunk—clear spiders and rats; kill [Mana Worm] to restore size; dodge [Mana Drain]||",
                ["normal"] = "{rt8}Mana Devourer{rt8}||before fight shrunk—clear spiders and rats; kill [Mana Worm] to restore size; dodge [Mana Drain]||",
                ["heroic"] = "{rt8}Mana Devourer{rt8}||before fight shrunk—clear spiders and rats; kill [Mana Worm] to restore size; dodge [Mana Drain]||",
                ["mythic"] = "{rt8}Mana Devourer{rt8}||before fight shrunk—clear spiders and rats; kill [Mana Worm] to restore size; dodge [Mana Drain]||",
                ["mythicplus"] = "{rt8}Mana Devourer{rt8}||before fight shrunk—clear spiders and rats; kill [Mana Worm] to restore size; dodge [Mana Drain]||",
            },
        },
        ["歌剧院：美女与野兽"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Opera: Beauty and the Beast{rt8}||while stewards alive the stove Coggleston is immune—must kill them one by one; each death others full-heal and +25% damage stacking—no random AoE||{rt1}Must interrupt: Luminaire's [Heat Wave]; order Broom Babbrit > Luminaire > Lady Coggleston's Cauldron > Coggleston{rt1}||the [Dusty Air] marked kites the broom and don't cross fire (gains speed buff—can attack, dispel); when [Soaked] slow step on [Burning Ground] to extinguish; Coggleston's [Silver Fork] control and clear fast, tank ready cooldowns",
                ["normal"] = "{rt8}Opera: Beauty and the Beast{rt8}||while stewards alive the stove Coggleston is immune—must kill them one by one; each death others full-heal and +25% damage stacking—no random AoE||{rt1}Must interrupt: Luminaire's [Heat Wave]; order Broom Babbrit > Luminaire > Lady Coggleston's Cauldron > Coggleston{rt1}||the [Dusty Air] marked kites the broom and don't cross fire (gains speed buff—can attack, dispel); when [Soaked] slow step on [Burning Ground] to extinguish; Coggleston's [Silver Fork] control and clear fast, tank ready cooldowns",
                ["heroic"] = "{rt8}Opera: Beauty and the Beast{rt8}||while stewards alive the stove Coggleston is immune—must kill them one by one; each death others full-heal and +25% damage stacking—no random AoE||{rt1}Must interrupt: Luminaire's [Heat Wave]; order Broom Babbrit > Luminaire > Lady Coggleston's Cauldron > Coggleston{rt1}||the [Dusty Air] marked kites the broom and don't cross fire (gains speed buff—can attack, dispel); when [Soaked] slow step on [Burning Ground] to extinguish; Coggleston's [Silver Fork] control and clear fast, tank ready cooldowns",
                ["mythic"] = "{rt8}Opera: Beauty and the Beast{rt8}||while stewards alive the stove Coggleston is immune—must kill them one by one; each death others full-heal and +25% damage stacking—no random AoE||{rt1}Must interrupt: Luminaire's [Heat Wave]; order Broom Babbrit > Luminaire > Lady Coggleston's Cauldron > Coggleston{rt1}||the [Dusty Air] marked kites the broom and don't cross fire (gains speed buff—can attack, dispel); when [Soaked] slow step on [Burning Ground] to extinguish; Coggleston's [Silver Fork] control and clear fast, tank ready cooldowns",
                ["mythicplus"] = "{rt8}Opera: Beauty and the Beast{rt8}||while stewards alive the stove Coggleston is immune—must kill them one by one; each death others full-heal and +25% damage stacking—no random AoE||{rt1}Must interrupt: Luminaire's [Heat Wave]; order Broom Babbrit > Luminaire > Lady Coggleston's Cauldron > Coggleston{rt1}||the [Dusty Air] marked kites the broom and don't cross fire (gains speed buff—can attack, dispel); when [Soaked] slow step on [Burning Ground] to extinguish; Coggleston's [Silver Fork] control and clear fast, tank ready cooldowns",
            },
        },
        ["歌剧院"] = {
            type = "MOB",
            tips = "{rt8}Opera House{rt8}||random script each week (Beauty and the Beast / Westfall / Wizard of Oz), talk to Barnes to confirm then handle by the matching mechanic||",
        },
        ["馆长"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Curator{rt8}||priority kill [Astral Flare] adds; during boss [Evocate] burst inside the circle; tank holds center||",
                ["normal"] = "{rt8}The Curator{rt8}||priority kill [Astral Flare] adds; during boss [Evocate] burst inside the circle; tank holds center||",
                ["heroic"] = "{rt8}The Curator{rt8}||priority kill [Astral Flare] adds; during boss [Evocate] burst inside the circle; tank holds center||",
                ["mythic"] = "{rt8}The Curator{rt8}||priority kill [Astral Flare] adds; during boss [Evocate] burst inside the circle; tank holds center||",
                ["mythicplus"] = "{rt8}The Curator{rt8}||priority kill [Astral Flare] adds; during boss [Evocate] burst inside the circle; tank holds center||",
            },
        },
        ["歌剧院：魔法坏女巫"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Opera: The Witch{rt8}||Elifira and Garella share health—pull together and single-target; [Anti-Gravity] black-purple circles don't step normally, [Magic Radiance] 4-yard explosion appears at tank's feet—move away immediately||{rt1}Must interrupt / clear: [Melancholy Blade] and the flying monkey helpers from [Summon Assistant]{rt1}||when Garella reads [Magic Prestige] the whole group steps on circles together at the end of cast to be knocked away—don't step early and remove circles leaving teammates none",
                ["normal"] = "{rt8}Opera: The Witch{rt8}||Elifira and Garella share health—pull together and single-target; [Anti-Gravity] black-purple circles don't step normally, [Magic Radiance] 4-yard explosion appears at tank's feet—move away immediately||{rt1}Must interrupt / clear: [Melancholy Blade] and the flying monkey helpers from [Summon Assistant]{rt1}||when Garella reads [Magic Prestige] the whole group steps on circles together at the end of cast to be knocked away—don't step early and remove circles leaving teammates none",
                ["heroic"] = "{rt8}Opera: The Witch{rt8}||Elifira and Garella share health—pull together and single-target; [Anti-Gravity] black-purple circles don't step normally, [Magic Radiance] 4-yard explosion appears at tank's feet—move away immediately||{rt1}Must interrupt / clear: [Melancholy Blade] and the flying monkey helpers from [Summon Assistant]{rt1}||when Garella reads [Magic Prestige] the whole group steps on circles together at the end of cast to be knocked away—don't step early and remove circles leaving teammates none",
                ["mythic"] = "{rt8}Opera: The Witch{rt8}||Elifira and Garella share health—pull together and single-target; [Anti-Gravity] black-purple circles don't step normally, [Magic Radiance] 4-yard explosion appears at tank's feet—move away immediately||{rt1}Must interrupt / clear: [Melancholy Blade] and the flying monkey helpers from [Summon Assistant]{rt1}||when Garella reads [Magic Prestige] the whole group steps on circles together at the end of cast to be knocked away—don't step early and remove circles leaving teammates none",
                ["mythicplus"] = "{rt8}Opera: The Witch{rt8}||Elifira and Garella share health—pull together and single-target; [Anti-Gravity] black-purple circles don't step normally, [Magic Radiance] 4-yard explosion appears at tank's feet—move away immediately||{rt1}Must interrupt / clear: [Melancholy Blade] and the flying monkey helpers from [Summon Assistant]{rt1}||when Garella reads [Magic Prestige] the whole group steps on circles together at the end of cast to be knocked away—don't step early and remove circles leaving teammates none",
            },
        },
        ["莫罗斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Moroes{rt8}||CC the four stewards (prioritize healer / mana-burn); {rt1}interrupt healing and mana burn{rt1}; dispel [Garrote] poison||",
                ["normal"] = "{rt8}Moroes{rt8}||CC the four stewards (prioritize healer / mana-burn); {rt1}interrupt healing and mana burn{rt1}; dispel [Garrote] poison||",
                ["heroic"] = "{rt8}Moroes{rt8}||CC the four stewards (prioritize healer / mana-burn); {rt1}interrupt healing and mana burn{rt1}; dispel [Garrote] poison||",
                ["mythic"] = "{rt8}Moroes{rt8}||CC the four stewards (prioritize healer / mana-burn); {rt1}interrupt healing and mana burn{rt1}; dispel [Garrote] poison||",
                ["mythicplus"] = "{rt8}Moroes{rt8}||CC the four stewards (prioritize healer / mana-burn); {rt1}interrupt healing and mana burn{rt1}; dispel [Garrote] poison||",
            },
        },
        ["猎手阿图门"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Huntsman Atumen{rt8}||first kill [Midnight] the horse; after merge tank faces away from group to avoid [Shadow Cleave]; dodge [Charge] and [Trample]||",
                ["normal"] = "{rt8}Huntsman Atumen{rt8}||first kill [Midnight] the horse; after merge tank faces away from group to avoid [Shadow Cleave]; dodge [Charge] and [Trample]||",
                ["heroic"] = "{rt8}Huntsman Atumen{rt8}||first kill [Midnight] the horse; after merge tank faces away from group to avoid [Shadow Cleave]; dodge [Charge] and [Trample]||",
                ["mythic"] = "{rt8}Huntsman Atumen{rt8}||first kill [Midnight] the horse; after merge tank faces away from group to avoid [Shadow Cleave]; dodge [Charge] and [Trample]||",
                ["mythicplus"] = "{rt8}Huntsman Atumen{rt8}||first kill [Midnight] the horse; after merge tank faces away from group to avoid [Shadow Cleave]; dodge [Charge] and [Trample]||",
            },
        },
        ["监视者维兹艾德姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Watcher Wiriethan{rt8}||multi-phase dodge [Fel Bombardment] and [Void] circles; prioritize {rt1}interrupt casting{rt1}, stand at safe point to DPS||",
                ["normal"] = "{rt8}Watcher Wiriethan{rt8}||multi-phase dodge [Fel Bombardment] and [Void] circles; prioritize {rt1}interrupt casting{rt1}, stand at safe point to DPS||",
                ["heroic"] = "{rt8}Watcher Wiriethan{rt8}||multi-phase dodge [Fel Bombardment] and [Void] circles; prioritize {rt1}interrupt casting{rt1}, stand at safe point to DPS||",
                ["mythic"] = "{rt8}Watcher Wiriethan{rt8}||multi-phase dodge [Fel Bombardment] and [Void] circles; prioritize {rt1}interrupt casting{rt1}, stand at safe point to DPS||",
                ["mythicplus"] = "{rt8}Watcher Wiriethan{rt8}||multi-phase dodge [Fel Bombardment] and [Void] circles; prioritize {rt1}interrupt casting{rt1}, stand at safe point to DPS||",
            },
        },
        ["重点·歌剧院剧本"] = {
            type = "MOB",
            tips = "{rt8}Opera Script{rt8}||Red Riding Hood: the marked runs around the field; Westfall: kill in order Dorothy/Lion/Scarecrow/Tin Man; Green: spread to dodge chains||",
        },
        ["重点·逆法陷阱"] = {
            type = "MOB",
            tips = "{rt8}Counter-Spell Trap{rt8}||ghost traps on the way and trash before the mana worm—use rogue / engineering interact to skip or clear fast||",
        },
    },
    ["艾萨拉之眼"] = {
        name = "Eye of Azshara",
        ["积怨夫人"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Wrath-Lady{rt8}||when the boss discharges into the sea stand on the dune; the [Vortex] at your feet becomes a chasing whirlwind in a few seconds—lure it into the sea if possible||",
                ["normal"] = "{rt8}Wrath-Lady{rt8}||when the boss discharges into the sea stand on the dune; the [Vortex] at your feet becomes a chasing whirlwind in a few seconds—lure it into the sea if possible||",
                ["heroic"] = "{rt8}Wrath-Lady{rt8}||when the boss discharges into the sea stand on the dune; the [Vortex] at your feet becomes a chasing whirlwind in a few seconds—lure it into the sea if possible||",
                ["mythic"] = "{rt8}Wrath-Lady{rt8}||when the boss discharges into the sea stand on the dune; the [Vortex] at your feet becomes a chasing whirlwind in a few seconds—lure it into the sea if possible||",
                ["mythicplus"] = "{rt8}Wrath-Lady{rt8}||when the boss discharges into the sea stand on the dune; the [Vortex] at your feet becomes a chasing whirlwind in a few seconds—lure it into the sea if possible||",
            },
        },
        ["深须国王"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}King Deepbeard{rt8}||while [Bubble] shield is up, take ground damage to consume it; if not consumed when bubble ends, whole-group AoE; dodge [Aftershock]||",
                ["normal"] = "{rt8}King Deepbeard{rt8}||while [Bubble] shield is up, take ground damage to consume it; if not consumed when bubble ends, whole-group AoE; dodge [Aftershock]||",
                ["heroic"] = "{rt8}King Deepbeard{rt8}||while [Bubble] shield is up, take ground damage to consume it; if not consumed when bubble ends, whole-group AoE; dodge [Aftershock]||",
                ["mythic"] = "{rt8}King Deepbeard{rt8}||while [Bubble] shield is up, take ground damage to consume it; if not consumed when bubble ends, whole-group AoE; dodge [Aftershock]||",
                ["mythicplus"] = "{rt8}King Deepbeard{rt8}||while [Bubble] shield is up, take ground damage to consume it; if not consumed when bubble ends, whole-group AoE; dodge [Aftershock]||",
            },
        },
        ["艾萨拉之怒"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Azshara's Wrath{rt8}||promptly [dispel Arcane Bomb]; dodge [Cyclonic Wave] and [Lightning], stay away from any environmental effect||",
                ["normal"] = "{rt8}Azshara's Wrath{rt8}||promptly [dispel Arcane Bomb]; dodge [Cyclonic Wave] and [Lightning], stay away from any environmental effect||",
                ["heroic"] = "{rt8}Azshara's Wrath{rt8}||promptly [dispel Arcane Bomb]; dodge [Cyclonic Wave] and [Lightning], stay away from any environmental effect||",
                ["mythic"] = "{rt8}Azshara's Wrath{rt8}||promptly [dispel Arcane Bomb]; dodge [Cyclonic Wave] and [Lightning], stay away from any environmental effect||",
                ["mythicplus"] = "{rt8}Azshara's Wrath{rt8}||promptly [dispel Arcane Bomb]; dodge [Cyclonic Wave] and [Lightning], stay away from any environmental effect||",
            },
        },
        ["重点·天气恶化"] = {
            type = "MOB",
            tips = "{rt8}Weather Worsening{rt8}||each outer boss killed makes the center weather worse (lightning / gale / tide)—watch positioning to avoid lightning||",
        },
        ["瑟芬崔斯克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Serpentrix{rt8}||green head body; P2 spawns blue / red small heads—priority kill; interrupt {rt1}its casts{rt1} as much as possible||",
                ["normal"] = "{rt8}Serpentrix{rt8}||green head body; P2 spawns blue / red small heads—priority kill; interrupt {rt1}its casts{rt1} as much as possible||",
                ["heroic"] = "{rt8}Serpentrix{rt8}||green head body; P2 spawns blue / red small heads—priority kill; interrupt {rt1}its casts{rt1} as much as possible||",
                ["mythic"] = "{rt8}Serpentrix{rt8}||green head body; P2 spawns blue / red small heads—priority kill; interrupt {rt1}its casts{rt1} as much as possible||",
                ["mythicplus"] = "{rt8}Serpentrix{rt8}||green head body; P2 spawns blue / red small heads—priority kill; interrupt {rt1}its casts{rt1} as much as possible||",
            },
        },
        ["重点·积怨导魔者"] = {
            type = "MOB",
            tips = "{rt8}Wrath-Collector{rt8}||the summoner before Azshara's Wrath—{rt1}interrupt its casting{rt1} to avoid the fight being strengthened||",
        },
        ["督军帕杰什"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warmonger Pazjesh{rt8}||[Spear Throw] marked stands behind a mob to kill it with the spear; {rt1}interrupt mob healing and [Low Rumble]{rt1}||",
                ["normal"] = "{rt8}Warmonger Pazjesh{rt8}||[Spear Throw] marked stands behind a mob to kill it with the spear; {rt1}interrupt mob healing and [Low Rumble]{rt1}||",
                ["heroic"] = "{rt8}Warmonger Pazjesh{rt8}||[Spear Throw] marked stands behind a mob to kill it with the spear; {rt1}interrupt mob healing and [Low Rumble]{rt1}||",
                ["mythic"] = "{rt8}Warmonger Pazjesh{rt8}||[Spear Throw] marked stands behind a mob to kill it with the spear; {rt1}interrupt mob healing and [Low Rumble]{rt1}||",
                ["mythicplus"] = "{rt8}Warmonger Pazjesh{rt8}||[Spear Throw] marked stands behind a mob to kill it with the spear; {rt1}interrupt mob healing and [Low Rumble]{rt1}||",
            },
        },
    },
    ["奈萨里奥的巢穴"] = {
        name = "Neltharion's Lair",
        ["乌拉罗格·塑山"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ularogg Cragshaper{rt8}||[Reshape Earth] while casting move away from red circles; during transition [Shatter] dodge||{rt1}interrupt [Whisper of the Deep]{rt1}||can be lured to smash into stone pillars",
                ["normal"] = "{rt8}Ularogg Cragshaper{rt8}||[Reshape Earth] while casting move away from red circles; during transition [Shatter] dodge||{rt1}interrupt [Whisper of the Deep]{rt1}||can be lured to smash into stone pillars",
                ["heroic"] = "{rt8}Ularogg Cragshaper{rt8}||[Reshape Earth] while casting move away from red circles; during transition [Shatter] dodge||{rt1}interrupt [Whisper of the Deep]{rt1}||can be lured to smash into stone pillars",
                ["mythic"] = "{rt8}Ularogg Cragshaper{rt8}||[Reshape Earth] while casting move away from red circles; during transition [Shatter] dodge||{rt1}interrupt [Whisper of the Deep]{rt1}||can be lured to smash into stone pillars",
                ["mythicplus"] = "{rt8}Ularogg Cragshaper{rt8}||[Reshape Earth] while casting move away from red circles; during transition [Shatter] dodge||{rt1}interrupt [Whisper of the Deep]{rt1}||can be lured to smash into stone pillars",
            },
        },
        ["纳拉萨斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Narassus{rt8}||dodge [Acid Spray] frontal and [Corrosive Breath]; [Nest Egg] adds clear fast, dispel poison promptly||",
                ["normal"] = "{rt8}Narassus{rt8}||dodge [Acid Spray] frontal and [Corrosive Breath]; [Nest Egg] adds clear fast, dispel poison promptly||",
                ["heroic"] = "{rt8}Narassus{rt8}||dodge [Acid Spray] frontal and [Corrosive Breath]; [Nest Egg] adds clear fast, dispel poison promptly||",
                ["mythic"] = "{rt8}Narassus{rt8}||dodge [Acid Spray] frontal and [Corrosive Breath]; [Nest Egg] adds clear fast, dispel poison promptly||",
                ["mythicplus"] = "{rt8}Narassus{rt8}||dodge [Acid Spray] frontal and [Corrosive Breath]; [Nest Egg] adds clear fast, dispel poison promptly||",
            },
        },
        ["重点·岩浆波"] = {
            type = "MOB",
            tips = "{rt8}Magma Wave{rt8}||dungeon magma advances periodically along the waterway; use waterwheel platforms or leave the waterway to avoid—don't stand in water long||",
        },
        ["重点·水晶爪牙"] = {
            type = "MOB",
            tips = "{rt8}Crystal Minion{rt8}||the small crystals from Lock'morra's shatter self-detonate—stay away from the blast and clear fast||",
        },
        ["洛克莫拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lock'morra{rt8}||dodge [Crystal Shock] landing; shards spawn—stay away from small crystals; tank steps on [Unstable Ground]||{rt1}interrupt [Crystal Spike]{rt1}||",
                ["normal"] = "{rt8}Lock'morra{rt8}||dodge [Crystal Shock] landing; shards spawn—stay away from small crystals; tank steps on [Unstable Ground]||{rt1}interrupt [Crystal Spike]{rt1}||",
                ["heroic"] = "{rt8}Lock'morra{rt8}||dodge [Crystal Shock] landing; shards spawn—stay away from small crystals; tank steps on [Unstable Ground]||{rt1}interrupt [Crystal Spike]{rt1}||",
                ["mythic"] = "{rt8}Lock'morra{rt8}||dodge [Crystal Shock] landing; shards spawn—stay away from small crystals; tank steps on [Unstable Ground]||{rt1}interrupt [Crystal Spike]{rt1}||",
                ["mythicplus"] = "{rt8}Lock'morra{rt8}||dodge [Crystal Shock] landing; shards spawn—stay away from small crystals; tank steps on [Unstable Ground]||{rt1}interrupt [Crystal Spike]{rt1}||",
            },
        },
        ["地底之王达古尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Earthwarden Dugal{rt8}||[Hammer of Khaz'goroth] slam dodge circles; summon big add, lure it to smash [Crystal Pillar] for stun; dodge [Magma Wave]||",
                ["normal"] = "{rt8}Earthwarden Dugal{rt8}||[Hammer of Khaz'goroth] slam dodge circles; summon big add, lure it to smash [Crystal Pillar] for stun; dodge [Magma Wave]||",
                ["heroic"] = "{rt8}Earthwarden Dugal{rt8}||[Hammer of Khaz'goroth] slam dodge circles; summon big add, lure it to smash [Crystal Pillar] for stun; dodge [Magma Wave]||",
                ["mythic"] = "{rt8}Earthwarden Dugal{rt8}||[Hammer of Khaz'goroth] slam dodge circles; summon big add, lure it to smash [Crystal Pillar] for stun; dodge [Magma Wave]||",
                ["mythicplus"] = "{rt8}Earthwarden Dugal{rt8}||[Hammer of Khaz'goroth] slam dodge circles; summon big add, lure it to smash [Crystal Pillar] for stun; dodge [Magma Wave]||",
            },
        },
    },
    ["守望者地窟"] = {
        name = "Vault of the Wardens",
        ["格雷泽"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Glazer{rt8}||[Gaze] beam reflect / interrupt or side-step away; the marked runs from group, mirror phase clear images||",
                ["normal"] = "{rt8}Glazer{rt8}||[Gaze] beam reflect / interrupt or side-step away; the marked runs from group, mirror phase clear images||",
                ["heroic"] = "{rt8}Glazer{rt8}||[Gaze] beam reflect / interrupt or side-step away; the marked runs from group, mirror phase clear images||",
                ["mythic"] = "{rt8}Glazer{rt8}||[Gaze] beam reflect / interrupt or side-step away; the marked runs from group, mirror phase clear images||",
                ["mythicplus"] = "{rt8}Glazer{rt8}||[Gaze] beam reflect / interrupt or side-step away; the marked runs from group, mirror phase clear images||",
            },
        },
        ["重点·邪能镜像"] = {
            type = "MOB",
            tips = "{rt8}Fel Mirror{rt8}||Kor'dana's mirror image casts shadow spells—prioritize interrupt and clear||",
        },
        ["提拉宋·萨瑟利尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Tirathon Satheril{rt8}||{rt1}interrupt Fel Chain{rt1}, clear adds fast; dodge [Shadow Nova], the [Flame Touch] marked runs away||",
                ["normal"] = "{rt8}Tirathon Satheril{rt8}||{rt1}interrupt Fel Chain{rt1}, clear adds fast; dodge [Shadow Nova], the [Flame Touch] marked runs away||",
                ["heroic"] = "{rt8}Tirathon Satheril{rt8}||{rt1}interrupt Fel Chain{rt1}, clear adds fast; dodge [Shadow Nova], the [Flame Touch] marked runs away||",
                ["mythic"] = "{rt8}Tirathon Satheril{rt8}||{rt1}interrupt Fel Chain{rt1}, clear adds fast; dodge [Shadow Nova], the [Flame Touch] marked runs away||",
                ["mythicplus"] = "{rt8}Tirathon Satheril{rt8}||{rt1}interrupt Fel Chain{rt1}, clear adds fast; dodge [Shadow Nova], the [Flame Touch] marked runs away||",
            },
        },
        ["重点·炽热余烬"] = {
            type = "MOB",
            tips = "{rt8}Glowing Ember{rt8}||embers summoned by Ashgrom self-detonate when close—clear fast and keep distance||",
        },
        ["科达娜·邪歌"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kor'dana Bloodsong{rt8}||dodge [Shadow Blade] swords and [Fel Explosion]; split {rt1}interrupt casting{rt1}, the marked runs away, P2 protect Illidan's Echo||",
                ["normal"] = "{rt8}Kor'dana Bloodsong{rt8}||dodge [Shadow Blade] swords and [Fel Explosion]; split {rt1}interrupt casting{rt1}, the marked runs away, P2 protect Illidan's Echo||",
                ["heroic"] = "{rt8}Kor'dana Bloodsong{rt8}||dodge [Shadow Blade] swords and [Fel Explosion]; split {rt1}interrupt casting{rt1}, the marked runs away, P2 protect Illidan's Echo||",
                ["mythic"] = "{rt8}Kor'dana Bloodsong{rt8}||dodge [Shadow Blade] swords and [Fel Explosion]; split {rt1}interrupt casting{rt1}, the marked runs away, P2 protect Illidan's Echo||",
                ["mythicplus"] = "{rt8}Kor'dana Bloodsong{rt8}||dodge [Shadow Blade] swords and [Fel Explosion]; split {rt1}interrupt casting{rt1}, the marked runs away, P2 protect Illidan's Echo||",
            },
        },
        ["审判官托蒙托鲁姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Inquisitor Trombertum{rt8}||[Mind Shatter] mark move away; dodge [Void Rift], transition clear adds and dispel fear||",
                ["normal"] = "{rt8}Inquisitor Trombertum{rt8}||[Mind Shatter] mark move away; dodge [Void Rift], transition clear adds and dispel fear||",
                ["heroic"] = "{rt8}Inquisitor Trombertum{rt8}||[Mind Shatter] mark move away; dodge [Void Rift], transition clear adds and dispel fear||",
                ["mythic"] = "{rt8}Inquisitor Trombertum{rt8}||[Mind Shatter] mark move away; dodge [Void Rift], transition clear adds and dispel fear||",
                ["mythicplus"] = "{rt8}Inquisitor Trombertum{rt8}||[Mind Shatter] mark move away; dodge [Void Rift], transition clear adds and dispel fear||",
            },
        },
        ["阿什高姆"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ashgrom{rt8}||[Lava Smash] tank cooldowns, dodge [Burning Ground] fire circles; clear embers fast to avoid self-detonate||",
                ["normal"] = "{rt8}Ashgrom{rt8}||[Lava Smash] tank cooldowns, dodge [Burning Ground] fire circles; clear embers fast to avoid self-detonate||",
                ["heroic"] = "{rt8}Ashgrom{rt8}||[Lava Smash] tank cooldowns, dodge [Burning Ground] fire circles; clear embers fast to avoid self-detonate||",
                ["mythic"] = "{rt8}Ashgrom{rt8}||[Lava Smash] tank cooldowns, dodge [Burning Ground] fire circles; clear embers fast to avoid self-detonate||",
                ["mythicplus"] = "{rt8}Ashgrom{rt8}||[Lava Smash] tank cooldowns, dodge [Burning Ground] fire circles; clear embers fast to avoid self-detonate||",
            },
        },
    },
    ["永夜大教堂"] = {
        name = "Cathedral of Eternal Night",
        ["重点·魔法典籍"] = {
            type = "MOB",
            tips = "{rt8}Spellbound Tome{rt8}||library ground spellbooks trigger random effects—check the buff / debuff before stepping||",
        },
        ["蔑齿"] = {
            type = "MOB",
            tips = "{rt8}Smolderfist{rt8}||[Sweep] large range—dodge; lure him to cling to a bigger target to throw him off balance; check [Spellbound Tome] effect before stepping||",
        },
        ["轻蔑的萨什比特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sassbit the Scornful{rt8}||during [Crushing Blow] whole group retreats 15 yards from boss; [Throwing Maul] flies a loop along the library's outer edge—immediately return to the inner field||{rt1}Priority kill: smash the bookshelves to spawn [Living Books] (silence / slow / mind-control){rt1}||the [Scornful Gaze] marked puts a bookshelf between self and boss, others clear the [Scornful Charge] path; limited bookshelves = soft enrage, watch DPS pace",
                ["normal"] = "{rt8}Sassbit the Scornful{rt8}||during [Crushing Blow] whole group retreats 15 yards from boss; [Throwing Maul] flies a loop along the library's outer edge—immediately return to the inner field||{rt1}Priority kill: smash the bookshelves to spawn [Living Books] (silence / slow / mind-control){rt1}||the [Scornful Gaze] marked puts a bookshelf between self and boss, others clear the [Scornful Charge] path; limited bookshelves = soft enrage, watch DPS pace",
                ["heroic"] = "{rt8}Sassbit the Scornful{rt8}||during [Crushing Blow] whole group retreats 15 yards from boss; [Throwing Maul] flies a loop along the library's outer edge—immediately return to the inner field||{rt1}Priority kill: smash the bookshelves to spawn [Living Books] (silence / slow / mind-control){rt1}||the [Scornful Gaze] marked puts a bookshelf between self and boss, others clear the [Scornful Charge] path; limited bookshelves = soft enrage, watch DPS pace",
                ["mythic"] = "{rt8}Sassbit the Scornful{rt8}||during [Crushing Blow] whole group retreats 15 yards from boss; [Throwing Maul] flies a loop along the library's outer edge—immediately return to the inner field||{rt1}Priority kill: smash the bookshelves to spawn [Living Books] (silence / slow / mind-control){rt1}||the [Scornful Gaze] marked puts a bookshelf between self and boss, others clear the [Scornful Charge] path; limited bookshelves = soft enrage, watch DPS pace",
                ["mythicplus"] = "{rt8}Sassbit the Scornful{rt8}||during [Crushing Blow] whole group retreats 15 yards from boss; [Throwing Maul] flies a loop along the library's outer edge—immediately return to the inner field||{rt1}Priority kill: smash the bookshelves to spawn [Living Books] (silence / slow / mind-control){rt1}||the [Scornful Gaze] marked puts a bookshelf between self and boss, others clear the [Scornful Charge] path; limited bookshelves = soft enrage, watch DPS pace",
            },
        },
        ["阿格洛诺克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Agronox{rt8}||priority kill [Lasher] adds to avoid being overwhelmed; dodge [Suffocating Vines], [Toxic Spore] DoT gradually hurts—dispel promptly||",
                ["normal"] = "{rt8}Agronox{rt8}||priority kill [Lasher] adds to avoid being overwhelmed; dodge [Suffocating Vines], [Toxic Spore] DoT gradually hurts—dispel promptly||",
                ["heroic"] = "{rt8}Agronox{rt8}||priority kill [Lasher] adds to avoid being overwhelmed; dodge [Suffocating Vines], [Toxic Spore] DoT gradually hurts—dispel promptly||",
                ["mythic"] = "{rt8}Agronox{rt8}||priority kill [Lasher] adds to avoid being overwhelmed; dodge [Suffocating Vines], [Toxic Spore] DoT gradually hurts—dispel promptly||",
                ["mythicplus"] = "{rt8}Agronox{rt8}||priority kill [Lasher] adds to avoid being overwhelmed; dodge [Suffocating Vines], [Toxic Spore] DoT gradually hurts—dispel promptly||",
            },
        },
        ["孟菲斯托斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mephistroth{rt8}||after energy fills he vanishes into shadow—use [Shield of Aggramar] to protect [Illidan] until he drags out the dreadlord; dodge shadow||",
                ["normal"] = "{rt8}Mephistroth{rt8}||after energy fills he vanishes into shadow—use [Shield of Aggramar] to protect [Illidan] until he drags out the dreadlord; dodge shadow||",
                ["heroic"] = "{rt8}Mephistroth{rt8}||after energy fills he vanishes into shadow—use [Shield of Aggramar] to protect [Illidan] until he drags out the dreadlord; dodge shadow||",
                ["mythic"] = "{rt8}Mephistroth{rt8}||after energy fills he vanishes into shadow—use [Shield of Aggramar] to protect [Illidan] until he drags out the dreadlord; dodge shadow||",
                ["mythicplus"] = "{rt8}Mephistroth{rt8}||after energy fills he vanishes into shadow—use [Shield of Aggramar] to protect [Illidan] until he drags out the dreadlord; dodge shadow||",
            },
        },
        ["重点·阿格拉玛之盾"] = {
            type = "MOB",
            tips = "{rt8}Shield of Aggramar{rt8}||when shield energy depletes the aura vanishes—whole group stands inside the shield to avoid AoE and protect Illidan||",
        },
        ["多玛塔克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Domatrax{rt8}||at 90%/50% opens door summoning reinforcements—clear fast; keep [Shield of Aggramar] energy up, stand inside to avoid Legion AoE||",
                ["normal"] = "{rt8}Domatrax{rt8}||at 90%/50% opens door summoning reinforcements—clear fast; keep [Shield of Aggramar] energy up, stand inside to avoid Legion AoE||",
                ["heroic"] = "{rt8}Domatrax{rt8}||at 90%/50% opens door summoning reinforcements—clear fast; keep [Shield of Aggramar] energy up, stand inside to avoid Legion AoE||",
                ["mythic"] = "{rt8}Domatrax{rt8}||at 90%/50% opens door summoning reinforcements—clear fast; keep [Shield of Aggramar] energy up, stand inside to avoid Legion AoE||",
                ["mythicplus"] = "{rt8}Domatrax{rt8}||at 90%/50% opens door summoning reinforcements—clear fast; keep [Shield of Aggramar] energy up, stand inside to avoid Legion AoE||",
            },
        },
    },
    ["群星庭院"] = {
        name = "Court of Stars",
        ["重点·魔焰使徒"] = {
            type = "MOB",
            tips = "{rt8}Fel-Infused Apostle{rt8}||Talixae's apostles buff each other—use class interaction to lure one away then kill to reduce pressure||",
        },
        ["重点·奥秘灯塔"] = {
            type = "MOB",
            tips = "{rt8}Arcane Beacon{rt8}||before Jardo must close 3 beacons or they summon [Vigilance] reinforcements during the fight||",
        },
        ["巡逻队长加多"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Patrol Captain Jado{rt8}||before engaging turn off 3 [Arcane Beacons] to avoid reinforcements; [Resonant Strike] side-step dodge and clear stun, [Arcane Bind] jump three times to release||",
                ["normal"] = "{rt8}Patrol Captain Jado{rt8}||before engaging turn off 3 [Arcane Beacons] to avoid reinforcements; [Resonant Strike] side-step dodge and clear stun, [Arcane Bind] jump three times to release||",
                ["heroic"] = "{rt8}Patrol Captain Jado{rt8}||before engaging turn off 3 [Arcane Beacons] to avoid reinforcements; [Resonant Strike] side-step dodge and clear stun, [Arcane Bind] jump three times to release||",
                ["mythic"] = "{rt8}Patrol Captain Jado{rt8}||before engaging turn off 3 [Arcane Beacons] to avoid reinforcements; [Resonant Strike] side-step dodge and clear stun, [Arcane Bind] jump three times to release||",
                ["mythicplus"] = "{rt8}Patrol Captain Jado{rt8}||before engaging turn off 3 [Arcane Beacons] to avoid reinforcements; [Resonant Strike] side-step dodge and clear stun, [Arcane Bind] jump three times to release||",
            },
        },
        ["塔丽克萨·火冠"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Talixae Flamewreath{rt8}||use scene interaction to lure away apostles to reduce numbers before fighting; prioritize {rt1}interrupt fire casts{rt1}, clear imps fast||",
                ["normal"] = "{rt8}Talixae Flamewreath{rt8}||use scene interaction to lure away apostles to reduce numbers before fighting; prioritize {rt1}interrupt fire casts{rt1}, clear imps fast||",
                ["heroic"] = "{rt8}Talixae Flamewreath{rt8}||use scene interaction to lure away apostles to reduce numbers before fighting; prioritize {rt1}interrupt fire casts{rt1}, clear imps fast||",
                ["mythic"] = "{rt8}Talixae Flamewreath{rt8}||use scene interaction to lure away apostles to reduce numbers before fighting; prioritize {rt1}interrupt fire casts{rt1}, clear imps fast||",
                ["mythicplus"] = "{rt8}Talixae Flamewreath{rt8}||use scene interaction to lure away apostles to reduce numbers before fighting; prioritize {rt1}interrupt fire casts{rt1}, clear imps fast||",
            },
        },
        ["顾问麦兰杜斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Advisor Melandrus{rt8}||[Blade Surge] charges toward ranged leaving afterimages—whole group 5 yards apart to avoid bleed chains; afterimages copy [Piercing Storm] line and [Cutting Vortex]||{rt1}avoid: [Piercing Storm] side-step the line, [Cutting Vortex] stay 7 yards from body and afterimage{rt1}||fix one person in the same corner to bait the charge and stack afterimages; [Surrounding Wind] whirlwind stuns on contact—dispel and pre-avoid",
                ["normal"] = "{rt8}Advisor Melandrus{rt8}||[Blade Surge] charges toward ranged leaving afterimages—whole group 5 yards apart to avoid bleed chains; afterimages copy [Piercing Storm] line and [Cutting Vortex]||{rt1}avoid: [Piercing Storm] side-step the line, [Cutting Vortex] stay 7 yards from body and afterimage{rt1}||fix one person in the same corner to bait the charge and stack afterimages; [Surrounding Wind] whirlwind stuns on contact—dispel and pre-avoid",
                ["heroic"] = "{rt8}Advisor Melandrus{rt8}||[Blade Surge] charges toward ranged leaving afterimages—whole group 5 yards apart to avoid bleed chains; afterimages copy [Piercing Storm] line and [Cutting Vortex]||{rt1}avoid: [Piercing Storm] side-step the line, [Cutting Vortex] stay 7 yards from body and afterimage{rt1}||fix one person in the same corner to bait the charge and stack afterimages; [Surrounding Wind] whirlwind stuns on contact—dispel and pre-avoid",
                ["mythic"] = "{rt8}Advisor Melandrus{rt8}||[Blade Surge] charges toward ranged leaving afterimages—whole group 5 yards apart to avoid bleed chains; afterimages copy [Piercing Storm] line and [Cutting Vortex]||{rt1}avoid: [Piercing Storm] side-step the line, [Cutting Vortex] stay 7 yards from body and afterimage{rt1}||fix one person in the same corner to bait the charge and stack afterimages; [Surrounding Wind] whirlwind stuns on contact—dispel and pre-avoid",
                ["mythicplus"] = "{rt8}Advisor Melandrus{rt8}||[Blade Surge] charges toward ranged leaving afterimages—whole group 5 yards apart to avoid bleed chains; afterimages copy [Piercing Storm] line and [Cutting Vortex]||{rt1}avoid: [Piercing Storm] side-step the line, [Cutting Vortex] stay 7 yards from body and afterimage{rt1}||fix one person in the same corner to bait the charge and stack afterimages; [Surrounding Wind] whirlwind stuns on contact—dispel and pre-avoid",
            },
        },
    },
    ["英灵殿"] = {
        name = "Halls of Valor",
        ["奥丁"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Odin{rt8}||[Spear of Light] marked leave the mark line, immediately {rt1}kill Stormforged Annihilator and interrupt the impact{rt1}; [Rune Brand] run to the matching-color rune for buff||",
                ["normal"] = "{rt8}Odin{rt8}||[Spear of Light] marked leave the mark line, immediately {rt1}kill Stormforged Annihilator and interrupt the impact{rt1}; [Rune Brand] run to the matching-color rune for buff||",
                ["heroic"] = "{rt8}Odin{rt8}||[Spear of Light] marked leave the mark line, immediately {rt1}kill Stormforged Annihilator and interrupt the impact{rt1}; [Rune Brand] run to the matching-color rune for buff||",
                ["mythic"] = "{rt8}Odin{rt8}||[Spear of Light] marked leave the mark line, immediately {rt1}kill Stormforged Annihilator and interrupt the impact{rt1}; [Rune Brand] run to the matching-color rune for buff||",
                ["mythicplus"] = "{rt8}Odin{rt8}||[Spear of Light] marked leave the mark line, immediately {rt1}kill Stormforged Annihilator and interrupt the impact{rt1}; [Rune Brand] run to the matching-color rune for buff||",
            },
        },
        ["海姆达尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hymdall{rt8}||dodge [Bloodletting Sweep] frontal and spinning [Dancing Blade]; {rt1}Horn{rt1} summons storm wyrmlings spitting lightning—watch platform edge lightning landings and avoid early||",
                ["normal"] = "{rt8}Hymdall{rt8}||dodge [Bloodletting Sweep] frontal and spinning [Dancing Blade]; {rt1}Horn{rt1} summons storm wyrmlings spitting lightning—watch platform edge lightning landings and avoid early||",
                ["heroic"] = "{rt8}Hymdall{rt8}||dodge [Bloodletting Sweep] frontal and spinning [Dancing Blade]; {rt1}Horn{rt1} summons storm wyrmlings spitting lightning—watch platform edge lightning landings and avoid early||",
                ["mythic"] = "{rt8}Hymdall{rt8}||dodge [Bloodletting Sweep] frontal and spinning [Dancing Blade]; {rt1}Horn{rt1} summons storm wyrmlings spitting lightning—watch platform edge lightning landings and avoid early||",
                ["mythicplus"] = "{rt8}Hymdall{rt8}||dodge [Bloodletting Sweep] frontal and spinning [Dancing Blade]; {rt1}Horn{rt1} summons storm wyrmlings spitting lightning—watch platform edge lightning landings and avoid early||",
            },
        },
        ["重点·四王"] = {
            type = "MOB",
            tips = "{rt8}Four Kings (Haldor / Ranulf / Bjorn / Tor){rt8}||kill one by one; after a kill the buff passes to survivors; first kill the one that empowers enemies, last both kings together||",
        },
        ["重点·瓦拉加尔勇士"] = {
            type = "MOB",
            tips = "{rt8}Valarjar Aspirant{rt8}||champions summoned by Skovald mark and chase—priority kill and dodge ground fel-fire circles||",
        },
        ["赫娅"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hyrja{rt8}||stand in purple circle (storm) for damage reduction; yellow circle [Expel Light] marked run from group, dodge [Sanctify] orb; tank uses frontal [Shield of Light]||",
                ["normal"] = "{rt8}Hyrja{rt8}||stand in purple circle (storm) for damage reduction; yellow circle [Expel Light] marked run from group, dodge [Sanctify] orb; tank uses frontal [Shield of Light]||",
                ["heroic"] = "{rt8}Hyrja{rt8}||stand in purple circle (storm) for damage reduction; yellow circle [Expel Light] marked run from group, dodge [Sanctify] orb; tank uses frontal [Shield of Light]||",
                ["mythic"] = "{rt8}Hyrja{rt8}||stand in purple circle (storm) for damage reduction; yellow circle [Expel Light] marked run from group, dodge [Sanctify] orb; tank uses frontal [Shield of Light]||",
                ["mythicplus"] = "{rt8}Hyrja{rt8}||stand in purple circle (storm) for damage reduction; yellow circle [Expel Light] marked run from group, dodge [Sanctify] orb; tank uses frontal [Shield of Light]||",
            },
        },
        ["芬雷尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Fenryr{rt8}||P1 [Ravenous Leap] nearby share; [Ravenous Leap] spread to avoid bleed; the [Bloodletting Scent] marked runs in circles, {rt1}interrupt Howl{rt1}||",
                ["normal"] = "{rt8}Fenryr{rt8}||P1 [Ravenous Leap] nearby share; [Ravenous Leap] spread to avoid bleed; the [Bloodletting Scent] marked runs in circles, {rt1}interrupt Howl{rt1}||",
                ["heroic"] = "{rt8}Fenryr{rt8}||P1 [Ravenous Leap] nearby share; [Ravenous Leap] spread to avoid bleed; the [Bloodletting Scent] marked runs in circles, {rt1}interrupt Howl{rt1}||",
                ["mythic"] = "{rt8}Fenryr{rt8}||P1 [Ravenous Leap] nearby share; [Ravenous Leap] spread to avoid bleed; the [Bloodletting Scent] marked runs in circles, {rt1}interrupt Howl{rt1}||",
                ["mythicplus"] = "{rt8}Fenryr{rt8}||P1 [Ravenous Leap] nearby share; [Ravenous Leap] spread to avoid bleed; the [Bloodletting Scent] marked runs in circles, {rt1}interrupt Howl{rt1}||",
            },
        },
        ["神王斯科瓦尔德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}God-King Skovald{rt8}||tank picks up [Shield of Aggramar] to block [Ragnarok]; [Fel Charge] marked move away, dodge fire circles and priority kill summoned champions||",
                ["normal"] = "{rt8}God-King Skovald{rt8}||tank picks up [Shield of Aggramar] to block [Ragnarok]; [Fel Charge] marked move away, dodge fire circles and priority kill summoned champions||",
                ["heroic"] = "{rt8}God-King Skovald{rt8}||tank picks up [Shield of Aggramar] to block [Ragnarok]; [Fel Charge] marked move away, dodge fire circles and priority kill summoned champions||",
                ["mythic"] = "{rt8}God-King Skovald{rt8}||tank picks up [Shield of Aggramar] to block [Ragnarok]; [Fel Charge] marked move away, dodge fire circles and priority kill summoned champions||",
                ["mythicplus"] = "{rt8}God-King Skovald{rt8}||tank picks up [Shield of Aggramar] to block [Ragnarok]; [Fel Charge] marked move away, dodge fire circles and priority kill summoned champions||",
            },
        },
    },
}
