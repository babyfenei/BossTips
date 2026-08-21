-- ============================================================================
-- BossTips 5.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["5.0"] = {
    ["魔古山宫殿"] = {
        name = "Mogu'shan Palace",
        ["杰翰"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Jehan{rt8}||priority kill the most dangerous ADD: [Glintrok Wizard] must interrupt, [Iron Skin] high damage reduction{rt1}Must interrupt: [Glintrok Wizard] control skill{rt1}||after clearing adds, burst Jehan, prevent his [Reckless Inspiration] enrage buff",
                ["normal"] = "{rt8}Jehan{rt8}||priority kill the most dangerous ADD: [Glintrok Wizard] must interrupt, [Iron Skin] high damage reduction{rt1}Must interrupt: [Glintrok Wizard] control skill{rt1}||after clearing adds, burst Jehan, prevent his [Reckless Inspiration] enrage buff",
                ["heroic"] = "{rt8}Jehan{rt8}||priority kill the most dangerous ADD: [Glintrok Wizard] must interrupt, [Iron Skin] high damage reduction{rt1}Must interrupt: [Glintrok Wizard] control skill{rt1}||after clearing adds, burst Jehan, prevent his [Reckless Inspiration] enrage buff",
                ["mythic"] = "{rt8}Jehan{rt8}||priority kill the most dangerous ADD: [Glintrok Wizard] must interrupt, [Iron Skin] high damage reduction{rt1}Must interrupt: [Glintrok Wizard] control skill{rt1}||after clearing adds, burst Jehan, prevent his [Reckless Inspiration] enrage buff",
                ["mythicplus"] = "{rt8}Jehan{rt8}||priority kill the most dangerous ADD: [Glintrok Wizard] must interrupt, [Iron Skin] high damage reduction{rt1}Must interrupt: [Glintrok Wizard] control skill{rt1}||after clearing adds, burst Jehan, prevent his [Reckless Inspiration] enrage buff",
            },
        },
        ["君王的试炼"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The King's Trial (Kuu'ai / Ming Guzi / Ha'i Yan){rt8}||kill the three tribal leaders in sequence; first kill [Musha'ba]'s pet to avoid DoT{rt1}Must interrupt: casts{rt1}||[Shockwave] dodge cone, [Whirlwind] dodge tornado; [Burnout] keep distance, [Meteor] group up to share",
                ["normal"] = "{rt8}The King's Trial (Kuu'ai / Ming Guzi / Ha'i Yan){rt8}||kill the three tribal leaders in sequence; first kill [Musha'ba]'s pet to avoid DoT{rt1}Must interrupt: casts{rt1}||[Shockwave] dodge cone, [Whirlwind] dodge tornado; [Burnout] keep distance, [Meteor] group up to share",
                ["heroic"] = "{rt8}The King's Trial (Kuu'ai / Ming Guzi / Ha'i Yan){rt8}||kill the three tribal leaders in sequence; first kill [Musha'ba]'s pet to avoid DoT{rt1}Must interrupt: casts{rt1}||[Shockwave] dodge cone, [Whirlwind] dodge tornado; [Burnout] keep distance, [Meteor] group up to share",
                ["mythic"] = "{rt8}The King's Trial (Kuu'ai / Ming Guzi / Ha'i Yan){rt8}||kill the three tribal leaders in sequence; first kill [Musha'ba]'s pet to avoid DoT{rt1}Must interrupt: casts{rt1}||[Shockwave] dodge cone, [Whirlwind] dodge tornado; [Burnout] keep distance, [Meteor] group up to share",
                ["mythicplus"] = "{rt8}The King's Trial (Kuu'ai / Ming Guzi / Ha'i Yan){rt8}||kill the three tribal leaders in sequence; first kill [Musha'ba]'s pet to avoid DoT{rt1}Must interrupt: casts{rt1}||[Shockwave] dodge cone, [Whirlwind] dodge tornado; [Burnout] keep distance, [Meteor] group up to share",
            },
        },
        ["武器大师席恩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Weaponsmaster Xian{rt8}||pull to the door corner; during [Earthshatter] switch left/right; step out of [Ring of Fire] immediately{rt1}none{rt1}||at 66% [Blade Tempest] stand parallel along the wall and don't move; at 33% [Rain of Death] is inherent damage—hard heal; dodge [Whirling Axe]",
                ["normal"] = "{rt8}Weaponsmaster Xian{rt8}||pull to the door corner; during [Earthshatter] switch left/right; step out of [Ring of Fire] immediately{rt1}none{rt1}||at 66% [Blade Tempest] stand parallel along the wall and don't move; at 33% [Rain of Death] is inherent damage—hard heal; dodge [Whirling Axe]",
                ["heroic"] = "{rt8}Weaponsmaster Xian{rt8}||pull to the door corner; during [Earthshatter] switch left/right; step out of [Ring of Fire] immediately{rt1}none{rt1}||at 66% [Blade Tempest] stand parallel along the wall and don't move; at 33% [Rain of Death] is inherent damage—hard heal; dodge [Whirling Axe]",
                ["mythic"] = "{rt8}Weaponsmaster Xian{rt8}||pull to the door corner; during [Earthshatter] switch left/right; step out of [Ring of Fire] immediately{rt1}none{rt1}||at 66% [Blade Tempest] stand parallel along the wall and don't move; at 33% [Rain of Death] is inherent damage—hard heal; dodge [Whirling Axe]",
                ["mythicplus"] = "{rt8}Weaponsmaster Xian{rt8}||pull to the door corner; during [Earthshatter] switch left/right; step out of [Ring of Fire] immediately{rt1}none{rt1}||at 66% [Blade Tempest] stand parallel along the wall and don't move; at 33% [Rain of Death] is inherent damage—hard heal; dodge [Whirling Axe]",
            },
        },
        ["格林托克斥候"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Glintrok Scout (Jehan district){rt8}||after being spotted by the scout, kill Jehan within 5 min (achievement){rt1}Must interrupt: control and casts{rt1}||clear the route in advance to avoid ADD overload triggering [Reckless Inspiration]",
        },
    },
    ["风暴烈酒酿造厂"] = {
        name = "Stormstout Brewery",
        ["跳跳大王"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ook-Ook{rt8}||stand behind, dodge [Carrot Breath] rotating cone; stay away from [Sweeping Wind] whirlwind{rt1}Must interrupt: none{rt1}||pick up [Bopper]'s dropped [Mallet] to instantly clear bunnies; prioritize AoE trash to avoid being crushed",
                ["normal"] = "{rt8}Ook-Ook{rt8}||stand behind, dodge [Carrot Breath] rotating cone; stay away from [Sweeping Wind] whirlwind{rt1}Must interrupt: none{rt1}||pick up [Bopper]'s dropped [Mallet] to instantly clear bunnies; prioritize AoE trash to avoid being crushed",
                ["heroic"] = "{rt8}Ook-Ook{rt8}||stand behind, dodge [Carrot Breath] rotating cone; stay away from [Sweeping Wind] whirlwind{rt1}Must interrupt: none{rt1}||pick up [Bopper]'s dropped [Mallet] to instantly clear bunnies; prioritize AoE trash to avoid being crushed",
                ["mythic"] = "{rt8}Ook-Ook{rt8}||stand behind, dodge [Carrot Breath] rotating cone; stay away from [Sweeping Wind] whirlwind{rt1}Must interrupt: none{rt1}||pick up [Bopper]'s dropped [Mallet] to instantly clear bunnies; prioritize AoE trash to avoid being crushed",
                ["mythicplus"] = "{rt8}Ook-Ook{rt8}||stand behind, dodge [Carrot Breath] rotating cone; stay away from [Sweeping Wind] whirlwind{rt1}Must interrupt: none{rt1}||pick up [Bopper]'s dropped [Mallet] to instantly clear bunnies; prioritize AoE trash to avoid being crushed",
            },
        },
        ["破桶而出的炎诛"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Yan-Zhu the Uncasked (barrel burst){rt8}||always keep someone close to the BOSS or it reads [Brew Bolt] whole-group high damage{rt1}Must interrupt: phase-switch cast{rt1}||[Dark Brew] stacks—keep moving to clear; [Expand] mark move away from group and self-detonate",
                ["normal"] = "{rt8}Yan-Zhu the Uncasked (barrel burst){rt8}||always keep someone close to the BOSS or it reads [Brew Bolt] whole-group high damage{rt1}Must interrupt: phase-switch cast{rt1}||[Dark Brew] stacks—keep moving to clear; [Expand] mark move away from group and self-detonate",
                ["heroic"] = "{rt8}Yan-Zhu the Uncasked (barrel burst){rt8}||always keep someone close to the BOSS or it reads [Brew Bolt] whole-group high damage{rt1}Must interrupt: phase-switch cast{rt1}||[Dark Brew] stacks—keep moving to clear; [Expand] mark move away from group and self-detonate",
                ["mythic"] = "{rt8}Yan-Zhu the Uncasked (barrel burst){rt8}||always keep someone close to the BOSS or it reads [Brew Bolt] whole-group high damage{rt1}Must interrupt: phase-switch cast{rt1}||[Dark Brew] stacks—keep moving to clear; [Expand] mark move away from group and self-detonate",
                ["mythicplus"] = "{rt8}Yan-Zhu the Uncasked (barrel burst){rt8}||always keep someone close to the BOSS or it reads [Brew Bolt] whole-group high damage{rt1}Must interrupt: phase-switch cast{rt1}||[Dark Brew] stacks—keep moving to clear; [Expand] mark move away from group and self-detonate",
            },
        },
        ["携雷兔妖"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Hopping Bunny swarm (to B2 corridor){rt8}||[Shrill Shriek] summons bunnies—pick up [Mallet] to AoE-clear{rt1}Must interrupt: Bomb cast{rt1}||keep moving to dodge carrot juice and whirlwind, don't let bunnies stack",
        },
        ["乌克乌克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hoptallus{rt8}||tank pulls facing away from group, dodge [Earthshaker] cone; ram the boss with [Keg] to stack vulnerability{rt1}Must interrupt: none{rt1}||at 90/60/30% [Madness] spawns kegs, DPS step on kegs to ram boss and speed kill",
                ["normal"] = "{rt8}Hoptallus{rt8}||tank pulls facing away from group, dodge [Earthshaker] cone; ram the boss with [Keg] to stack vulnerability{rt1}Must interrupt: none{rt1}||at 90/60/30% [Madness] spawns kegs, DPS step on kegs to ram boss and speed kill",
                ["heroic"] = "{rt8}Hoptallus{rt8}||tank pulls facing away from group, dodge [Earthshaker] cone; ram the boss with [Keg] to stack vulnerability{rt1}Must interrupt: none{rt1}||at 90/60/30% [Madness] spawns kegs, DPS step on kegs to ram boss and speed kill",
                ["mythic"] = "{rt8}Hoptallus{rt8}||tank pulls facing away from group, dodge [Earthshaker] cone; ram the boss with [Keg] to stack vulnerability{rt1}Must interrupt: none{rt1}||at 90/60/30% [Madness] spawns kegs, DPS step on kegs to ram boss and speed kill",
                ["mythicplus"] = "{rt8}Hoptallus{rt8}||tank pulls facing away from group, dodge [Earthshaker] cone; ram the boss with [Keg] to stack vulnerability{rt1}Must interrupt: none{rt1}||at 90/60/30% [Madness] spawns kegs, DPS step on kegs to ram boss and speed kill",
            },
        },
    },
    ["围攻砮皂寺"] = {
        name = "Siege of Niuzao Temple",
        ["希克提克琥珀飞翼"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Hik'tik Swarm / Amber Wing (on the way){rt8}||[Bomb] random fire circles—keep moving; [Unstable Explosion] dies self-detonate—stay away{rt1}Must interrupt: Bomb{rt1}||achievement needs to kill [Amber Wing] first then defeat Vojak",
        },
        ["宰相金巴卡"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Chancellor Jin'baka{rt8}||step on corrosive poison to shrink the pool and stack [Resin Residue] damage buff; priority kill [Corrosive Blood Orb] to prevent pool growth{rt1}none{rt1}||[Detonate] damage scales with pool area—burst the BOSS down or take turns stepping in water to control area",
                ["normal"] = "{rt8}Chancellor Jin'baka{rt8}||step on corrosive poison to shrink the pool and stack [Resin Residue] damage buff; priority kill [Corrosive Blood Orb] to prevent pool growth{rt1}none{rt1}||[Detonate] damage scales with pool area—burst the BOSS down or take turns stepping in water to control area",
                ["heroic"] = "{rt8}Chancellor Jin'baka{rt8}||step on corrosive poison to shrink the pool and stack [Resin Residue] damage buff; priority kill [Corrosive Blood Orb] to prevent pool growth{rt1}none{rt1}||[Detonate] damage scales with pool area—burst the BOSS down or take turns stepping in water to control area",
                ["mythic"] = "{rt8}Chancellor Jin'baka{rt8}||step on corrosive poison to shrink the pool and stack [Resin Residue] damage buff; priority kill [Corrosive Blood Orb] to prevent pool growth{rt1}none{rt1}||[Detonate] damage scales with pool area—burst the BOSS down or take turns stepping in water to control area",
                ["mythicplus"] = "{rt8}Chancellor Jin'baka{rt8}||step on corrosive poison to shrink the pool and stack [Resin Residue] damage buff; priority kill [Corrosive Blood Orb] to prevent pool growth{rt1}none{rt1}||[Detonate] damage scales with pool area—burst the BOSS down or take turns stepping in water to control area",
            },
        },
        ["翼虫首领尼诺洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Wing Leader Nino-Rok{rt8}||[Quick-Dry Resin] mark keep moving / jump to clear or get rooted{rt1}none{rt1}||[Strong Wind] when retreating, walk into the wind; dodge red circle [Poison Pool]; when crossing bridge chase, hug edge to DPS",
                ["normal"] = "{rt8}Wing Leader Nino-Rok{rt8}||[Quick-Dry Resin] mark keep moving / jump to clear or get rooted{rt1}none{rt1}||[Strong Wind] when retreating, walk into the wind; dodge red circle [Poison Pool]; when crossing bridge chase, hug edge to DPS",
                ["heroic"] = "{rt8}Wing Leader Nino-Rok{rt8}||[Quick-Dry Resin] mark keep moving / jump to clear or get rooted{rt1}none{rt1}||[Strong Wind] when retreating, walk into the wind; dodge red circle [Poison Pool]; when crossing bridge chase, hug edge to DPS",
                ["mythic"] = "{rt8}Wing Leader Nino-Rok{rt8}||[Quick-Dry Resin] mark keep moving / jump to clear or get rooted{rt1}none{rt1}||[Strong Wind] when retreating, walk into the wind; dodge red circle [Poison Pool]; when crossing bridge chase, hug edge to DPS",
                ["mythicplus"] = "{rt8}Wing Leader Nino-Rok{rt8}||[Quick-Dry Resin] mark keep moving / jump to clear or get rooted{rt1}none{rt1}||[Strong Wind] when retreating, walk into the wind; dodge red circle [Poison Pool]; when crossing bridge chase, hug edge to DPS",
            },
        },
        ["将军帕瓦拉克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}General Pa'valak{rt8}||dodge [Blade Charge] landing point and charge path; [Storm] is inherent damage—hard heal and pre-heal{rt1}Must interrupt: reinforcements cast{rt1}||at 65/35% [Bulwark] opens shield and summons reinforcements, use [Siege Explosive] to blow shield / smash trash, after arming stay away",
                ["normal"] = "{rt8}General Pa'valak{rt8}||dodge [Blade Charge] landing point and charge path; [Storm] is inherent damage—hard heal and pre-heal{rt1}Must interrupt: reinforcements cast{rt1}||at 65/35% [Bulwark] opens shield and summons reinforcements, use [Siege Explosive] to blow shield / smash trash, after arming stay away",
                ["heroic"] = "{rt8}General Pa'valak{rt8}||dodge [Blade Charge] landing point and charge path; [Storm] is inherent damage—hard heal and pre-heal{rt1}Must interrupt: reinforcements cast{rt1}||at 65/35% [Bulwark] opens shield and summons reinforcements, use [Siege Explosive] to blow shield / smash trash, after arming stay away",
                ["mythic"] = "{rt8}General Pa'valak{rt8}||dodge [Blade Charge] landing point and charge path; [Storm] is inherent damage—hard heal and pre-heal{rt1}Must interrupt: reinforcements cast{rt1}||at 65/35% [Bulwark] opens shield and summons reinforcements, use [Siege Explosive] to blow shield / smash trash, after arming stay away",
                ["mythicplus"] = "{rt8}General Pa'valak{rt8}||dodge [Blade Charge] landing point and charge path; [Storm] is inherent damage—hard heal and pre-heal{rt1}Must interrupt: reinforcements cast{rt1}||at 65/35% [Bulwark] opens shield and summons reinforcements, use [Siege Explosive] to blow shield / smash trash, after arming stay away",
            },
        },
        ["指挥官沃加克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Commander Vojak{rt8}||P1 use [Corrosive Tar Barrel] to smash mantid for vulnerability; dodge [Unstable Explosion] self-detonate{rt1}Must interrupt: Bomb{rt1}||P2 [Charge] don't stand in line, [Thousand Blades] whirlwind spread; [Swiftness] stacks—burst",
                ["normal"] = "{rt8}Commander Vojak{rt8}||P1 use [Corrosive Tar Barrel] to smash mantid for vulnerability; dodge [Unstable Explosion] self-detonate{rt1}Must interrupt: Bomb{rt1}||P2 [Charge] don't stand in line, [Thousand Blades] whirlwind spread; [Swiftness] stacks—burst",
                ["heroic"] = "{rt8}Commander Vojak{rt8}||P1 use [Corrosive Tar Barrel] to smash mantid for vulnerability; dodge [Unstable Explosion] self-detonate{rt1}Must interrupt: Bomb{rt1}||P2 [Charge] don't stand in line, [Thousand Blades] whirlwind spread; [Swiftness] stacks—burst",
                ["mythic"] = "{rt8}Commander Vojak{rt8}||P1 use [Corrosive Tar Barrel] to smash mantid for vulnerability; dodge [Unstable Explosion] self-detonate{rt1}Must interrupt: Bomb{rt1}||P2 [Charge] don't stand in line, [Thousand Blades] whirlwind spread; [Swiftness] stacks—burst",
                ["mythicplus"] = "{rt8}Commander Vojak{rt8}||P1 use [Corrosive Tar Barrel] to smash mantid for vulnerability; dodge [Unstable Explosion] self-detonate{rt1}Must interrupt: Bomb{rt1}||P2 [Charge] don't stand in line, [Thousand Blades] whirlwind spread; [Swiftness] stacks—burst",
            },
        },
    },
    ["影踪禅院"] = {
        name = "Shado-Pan Monastery",
        ["狂之煞"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sha of Violence{rt8}||spread to dodge [Sha Spike] and [Confounding Strike]; [Smoke Blade] whirlwind don't step in{rt1}Must interrupt: [Confounding Strike] dispellable{rt1}||priority kill small [Violent Energy]; at 30% enrage—use cooldowns",
                ["normal"] = "{rt8}Sha of Violence{rt8}||spread to dodge [Sha Spike] and [Confounding Strike]; [Smoke Blade] whirlwind don't step in{rt1}Must interrupt: [Confounding Strike] dispellable{rt1}||priority kill small [Violent Energy]; at 30% enrage—use cooldowns",
                ["heroic"] = "{rt8}Sha of Violence{rt8}||spread to dodge [Sha Spike] and [Confounding Strike]; [Smoke Blade] whirlwind don't step in{rt1}Must interrupt: [Confounding Strike] dispellable{rt1}||priority kill small [Violent Energy]; at 30% enrage—use cooldowns",
                ["mythic"] = "{rt8}Sha of Violence{rt8}||spread to dodge [Sha Spike] and [Confounding Strike]; [Smoke Blade] whirlwind don't step in{rt1}Must interrupt: [Confounding Strike] dispellable{rt1}||priority kill small [Violent Energy]; at 30% enrage—use cooldowns",
                ["mythicplus"] = "{rt8}Sha of Violence{rt8}||spread to dodge [Sha Spike] and [Confounding Strike]; [Smoke Blade] whirlwind don't step in{rt1}Must interrupt: [Confounding Strike] dispellable{rt1}||priority kill small [Violent Energy]; at 30% enrage—use cooldowns",
            },
        },
        ["被煞附身武僧"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Sha-infested Monk (corridor / courtyard){rt8}||after the trash health hits zero you must channel [Quell] on the floating panda in the center for it to truly die{rt1}Must interrupt: [Shadow Bolt] etc. casts{rt1}||keep moving to dodge ground black water and [Sha Spike], avoid ADD overload",
        },
        ["古·穿云"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gu Cloudstroke{rt8}||spread to dodge [Call Lightning] chains; [Static Field] mark run away{rt1}Must interrupt: [Call Lightning] can target single{rt1}||at 50% transition kill [Azure Serpent]: head facing out to dodge [Lightning Breath], [Magnetic Shield] group up and burn through healer absorb",
                ["normal"] = "{rt8}Gu Cloudstroke{rt8}||spread to dodge [Call Lightning] chains; [Static Field] mark run away{rt1}Must interrupt: [Call Lightning] can target single{rt1}||at 50% transition kill [Azure Serpent]: head facing out to dodge [Lightning Breath], [Magnetic Shield] group up and burn through healer absorb",
                ["heroic"] = "{rt8}Gu Cloudstroke{rt8}||spread to dodge [Call Lightning] chains; [Static Field] mark run away{rt1}Must interrupt: [Call Lightning] can target single{rt1}||at 50% transition kill [Azure Serpent]: head facing out to dodge [Lightning Breath], [Magnetic Shield] group up and burn through healer absorb",
                ["mythic"] = "{rt8}Gu Cloudstroke{rt8}||spread to dodge [Call Lightning] chains; [Static Field] mark run away{rt1}Must interrupt: [Call Lightning] can target single{rt1}||at 50% transition kill [Azure Serpent]: head facing out to dodge [Lightning Breath], [Magnetic Shield] group up and burn through healer absorb",
                ["mythicplus"] = "{rt8}Gu Cloudstroke{rt8}||spread to dodge [Call Lightning] chains; [Static Field] mark run away{rt1}Must interrupt: [Call Lightning] can target single{rt1}||at 50% transition kill [Azure Serpent]: head facing out to dodge [Lightning Breath], [Magnetic Shield] group up and burn through healer absorb",
            },
        },
        ["祝踏岚"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Taran Zhu{rt8}||when [Hatred] fills he loses control—use [Quell] to clear; step out of [Malice Ring] as it forms{rt1}none{rt1}||[Gripping Hatred] fireball chases you—kite in a circle; taking damage raises hatred—keep Quelling",
                ["normal"] = "{rt8}Taran Zhu{rt8}||when [Hatred] fills he loses control—use [Quell] to clear; step out of [Malice Ring] as it forms{rt1}none{rt1}||[Gripping Hatred] fireball chases you—kite in a circle; taking damage raises hatred—keep Quelling",
                ["heroic"] = "{rt8}Taran Zhu{rt8}||when [Hatred] fills he loses control—use [Quell] to clear; step out of [Malice Ring] as it forms{rt1}none{rt1}||[Gripping Hatred] fireball chases you—kite in a circle; taking damage raises hatred—keep Quelling",
                ["mythic"] = "{rt8}Taran Zhu{rt8}||when [Hatred] fills he loses control—use [Quell] to clear; step out of [Malice Ring] as it forms{rt1}none{rt1}||[Gripping Hatred] fireball chases you—kite in a circle; taking damage raises hatred—keep Quelling",
                ["mythicplus"] = "{rt8}Taran Zhu{rt8}||when [Hatred] fills he loses control—use [Quell] to clear; step out of [Malice Ring] as it forms{rt1}none{rt1}||[Gripping Hatred] fireball chases you—kite in a circle; taking damage raises hatred—keep Quelling",
            },
        },
        ["雪流大师"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Master Snowdrift{rt8}||P1 stand behind, dodge [Fists of Fury], avoid [Spin Kick] tornado{rt1}Must interrupt: phase cast{rt1}||P2 dodge passing [Fireball]; P3 [Parry Stance] go behind to DPS, the [Grapple Slam] marked runs",
                ["normal"] = "{rt8}Master Snowdrift{rt8}||P1 stand behind, dodge [Fists of Fury], avoid [Spin Kick] tornado{rt1}Must interrupt: phase cast{rt1}||P2 dodge passing [Fireball]; P3 [Parry Stance] go behind to DPS, the [Grapple Slam] marked runs",
                ["heroic"] = "{rt8}Master Snowdrift{rt8}||P1 stand behind, dodge [Fists of Fury], avoid [Spin Kick] tornado{rt1}Must interrupt: phase cast{rt1}||P2 dodge passing [Fireball]; P3 [Parry Stance] go behind to DPS, the [Grapple Slam] marked runs",
                ["mythic"] = "{rt8}Master Snowdrift{rt8}||P1 stand behind, dodge [Fists of Fury], avoid [Spin Kick] tornado{rt1}Must interrupt: phase cast{rt1}||P2 dodge passing [Fireball]; P3 [Parry Stance] go behind to DPS, the [Grapple Slam] marked runs",
                ["mythicplus"] = "{rt8}Master Snowdrift{rt8}||P1 stand behind, dodge [Fists of Fury], avoid [Spin Kick] tornado{rt1}Must interrupt: phase cast{rt1}||P2 dodge passing [Fireball]; P3 [Parry Stance] go behind to DPS, the [Grapple Slam] marked runs",
            },
        },
    },
    ["青龙寺"] = {
        name = "Temple of the Jade Serpent",
        ["刘·焰心"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Liu Flameheart{rt8}||dodge [Flame Jet] fire circles and omni-directional [Fire Wave]; at 70% [Yu'lon's Dance] damage spikes—use cooldowns{rt1}Must interrupt: [Vile Vapors]{rt1}||tank [Flame Strike] dispelled by healer; after 30% dragon form dodge [Yu'lon's Breath] frontal and ground green fire",
                ["normal"] = "{rt8}Liu Flameheart{rt8}||dodge [Flame Jet] fire circles and omni-directional [Fire Wave]; at 70% [Yu'lon's Dance] damage spikes—use cooldowns{rt1}Must interrupt: [Vile Vapors]{rt1}||tank [Flame Strike] dispelled by healer; after 30% dragon form dodge [Yu'lon's Breath] frontal and ground green fire",
                ["heroic"] = "{rt8}Liu Flameheart{rt8}||dodge [Flame Jet] fire circles and omni-directional [Fire Wave]; at 70% [Yu'lon's Dance] damage spikes—use cooldowns{rt1}Must interrupt: [Vile Vapors]{rt1}||tank [Flame Strike] dispelled by healer; after 30% dragon form dodge [Yu'lon's Breath] frontal and ground green fire",
                ["mythic"] = "{rt8}Liu Flameheart{rt8}||dodge [Flame Jet] fire circles and omni-directional [Fire Wave]; at 70% [Yu'lon's Dance] damage spikes—use cooldowns{rt1}Must interrupt: [Vile Vapors]{rt1}||tank [Flame Strike] dispelled by healer; after 30% dragon form dodge [Yu'lon's Breath] frontal and ground green fire",
                ["mythicplus"] = "{rt8}Liu Flameheart{rt8}||dodge [Flame Jet] fire circles and omni-directional [Fire Wave]; at 70% [Yu'lon's Dance] damage spikes—use cooldowns{rt1}Must interrupt: [Vile Vapors]{rt1}||tank [Flame Strike] dispelled by healer; after 30% dragon form dodge [Yu'lon's Breath] frontal and ground green fire",
            },
        },
        ["疑之煞"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sha of Doubt{rt8}||[Void Touch] marks 2 players—dispel one, focus-heal the other{rt1}Must interrupt: [Withering Will]{rt1}||[Earthly Bonds] while invulnerable a clone marks you—group up and AoE it to stop it healing the BOSS",
                ["normal"] = "{rt8}Sha of Doubt{rt8}||[Void Touch] marks 2 players—dispel one, focus-heal the other{rt1}Must interrupt: [Withering Will]{rt1}||[Earthly Bonds] while invulnerable a clone marks you—group up and AoE it to stop it healing the BOSS",
                ["heroic"] = "{rt8}Sha of Doubt{rt8}||[Void Touch] marks 2 players—dispel one, focus-heal the other{rt1}Must interrupt: [Withering Will]{rt1}||[Earthly Bonds] while invulnerable a clone marks you—group up and AoE it to stop it healing the BOSS",
                ["mythic"] = "{rt8}Sha of Doubt{rt8}||[Void Touch] marks 2 players—dispel one, focus-heal the other{rt1}Must interrupt: [Withering Will]{rt1}||[Earthly Bonds] while invulnerable a clone marks you—group up and AoE it to stop it healing the BOSS",
                ["mythicplus"] = "{rt8}Sha of Doubt{rt8}||[Void Touch] marks 2 players—dispel one, focus-heal the other{rt1}Must interrupt: [Withering Will]{rt1}||[Earthly Bonds] while invulnerable a clone marks you—group up and AoE it to stop it healing the BOSS",
            },
        },
        ["游荡恶煞"] = {
            type = "MOB",
            tips = "{rt8}Key mob: Wandering Sha / Corrupt Water Speaker (Library district){rt8}||[Terror Screech] fears the whole group—must interrupt; [Water Lance] random mark—interrupt{rt1}Must interrupt: [Terror Screech][Water Lance]{rt1}||after death the corpse still drops damage—stay away from the corpse",
        },
        ["贤者马里"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sage Mari{rt8}||stay away from the pool water; dodge [Wash] rotating water column—don't get knocked back{rt1}Must interrupt: [Water Lance] random mark ranged high damage{rt1}||priority kill spawned [Corrupt Living Water]; [Corrupt Vortex] mark then run to edge and drop, explodes on landing",
                ["normal"] = "{rt8}Sage Mari{rt8}||stay away from the pool water; dodge [Wash] rotating water column—don't get knocked back{rt1}Must interrupt: [Water Lance] random mark ranged high damage{rt1}||priority kill spawned [Corrupt Living Water]; [Corrupt Vortex] mark then run to edge and drop, explodes on landing",
                ["heroic"] = "{rt8}Sage Mari{rt8}||stay away from the pool water; dodge [Wash] rotating water column—don't get knocked back{rt1}Must interrupt: [Water Lance] random mark ranged high damage{rt1}||priority kill spawned [Corrupt Living Water]; [Corrupt Vortex] mark then run to edge and drop, explodes on landing",
                ["mythic"] = "{rt8}Sage Mari{rt8}||stay away from the pool water; dodge [Wash] rotating water column—don't get knocked back{rt1}Must interrupt: [Water Lance] random mark ranged high damage{rt1}||priority kill spawned [Corrupt Living Water]; [Corrupt Vortex] mark then run to edge and drop, explodes on landing",
                ["mythicplus"] = "{rt8}Sage Mari{rt8}||stay away from the pool water; dodge [Wash] rotating water column—don't get knocked back{rt1}Must interrupt: [Water Lance] random mark ranged high damage{rt1}||priority kill spawned [Corrupt Living Water]; [Corrupt Vortex] mark then run to edge and drop, explodes on landing",
            },
        },
        ["游学者石步"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Scholar Stonewalk (Quarrel & Peril){rt8}||focus one until ~7-8 stacks of [Intensity] then switch to the other, the other's stacks reset{rt1}Must interrupt: [Solar Ray] etc. casts{rt1}||healer keeps [Superiority] damage reduction; single-target, no two lines, avoid 10 stacks = 15s immunity",
                ["normal"] = "{rt8}Scholar Stonewalk (Quarrel & Peril){rt8}||focus one until ~7-8 stacks of [Intensity] then switch to the other, the other's stacks reset{rt1}Must interrupt: [Solar Ray] etc. casts{rt1}||healer keeps [Superiority] damage reduction; single-target, no two lines, avoid 10 stacks = 15s immunity",
                ["heroic"] = "{rt8}Scholar Stonewalk (Quarrel & Peril){rt8}||focus one until ~7-8 stacks of [Intensity] then switch to the other, the other's stacks reset{rt1}Must interrupt: [Solar Ray] etc. casts{rt1}||healer keeps [Superiority] damage reduction; single-target, no two lines, avoid 10 stacks = 15s immunity",
                ["mythic"] = "{rt8}Scholar Stonewalk (Quarrel & Peril){rt8}||focus one until ~7-8 stacks of [Intensity] then switch to the other, the other's stacks reset{rt1}Must interrupt: [Solar Ray] etc. casts{rt1}||healer keeps [Superiority] damage reduction; single-target, no two lines, avoid 10 stacks = 15s immunity",
                ["mythicplus"] = "{rt8}Scholar Stonewalk (Quarrel & Peril){rt8}||focus one until ~7-8 stacks of [Intensity] then switch to the other, the other's stacks reset{rt1}Must interrupt: [Solar Ray] etc. casts{rt1}||healer keeps [Superiority] damage reduction; single-target, no two lines, avoid 10 stacks = 15s immunity",
            },
        },
    },
}
