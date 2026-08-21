-- ============================================================================
-- BossTips 8.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["8.0"] = {
    ["风暴神殿"] = {
        name = "Shrine of the Storm",
        ["被遗忘的住民"] = {
            type = "MOB",
            tips = "{rt8}Forgotten Citizen (key mob){rt8}||[Devour Essence] whole-group shadow damage and self-heal, {rt1}interrupt one by one{rt1}||focus one at a time to prevent it reading and healing||",
        },
        ["水母"] = {
            type = "MOB",
            tips = "{rt8}Jellyfish (key mob){rt8}||swimming section—don't hit charged jellyfish, contact high damage + 8s stun||follow safe route, watch electric range||",
        },
        ["深渊鳗鱼"] = {
            type = "MOB",
            tips = "{rt8}Abyssal Eel (key mob){rt8}||[Abyssal Strike] shadow DoT can't interrupt can't dispel||tank holds, healer heal, kill fast to avoid stacking||",
        },
        ["阿库希尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Akh'zul{rt8}||[Suffocating Brine] marked leave group, [Undertow] knockback dodge||[Surging Charge] dodge charge line; [Suffocating Bromide] dispel||at 50% splits into small tentacles—kill adds fast to reform boss",
                ["normal"] = "{rt8}Akh'zul{rt8}||[Suffocating Brine] marked leave group, [Undertow] knockback dodge||[Surging Charge] dodge charge line; [Suffocating Bromide] dispel||at 50% splits into small tentacles—kill adds fast to reform boss",
                ["heroic"] = "{rt8}Akh'zul{rt8}||[Suffocating Brine] marked leave group, [Undertow] knockback dodge||[Surging Charge] dodge charge line; [Suffocating Bromide] dispel||at 50% splits into small tentacles—kill adds fast to reform boss",
                ["mythic"] = "{rt8}Akh'zul{rt8}||[Suffocating Brine] marked leave group, [Undertow] knockback dodge||[Surging Charge] dodge charge line; [Suffocating Bromide] dispel||at 50% splits into small tentacles—kill adds fast to reform boss",
                ["mythicplus"] = "{rt8}Akh'zul{rt8}||[Suffocating Brine] marked leave group, [Undertow] knockback dodge||[Surging Charge] dodge charge line; [Suffocating Bromide] dispel||at 50% splits into small tentacles—kill adds fast to reform boss",
            },
        },
        ["海贤议会"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ocean Ranger (Iron Shell / Wind Maiden){rt8}||{rt1}Cutting Bomb{rt1} (Wind Maiden) interrupt; under [Storm's Blessing] interrupt causes [Backlash] tornado||tank dodge [Iron Blessing] frontal [Hindering Cleave]; stand in [Empowered Ward] green circle for damage reduction||[Swift Ward] gray circle speed, immune to slow",
                ["normal"] = "{rt8}Ocean Ranger (Iron Shell / Wind Maiden){rt8}||{rt1}Cutting Bomb{rt1} (Wind Maiden) interrupt; under [Storm's Blessing] interrupt causes [Backlash] tornado||tank dodge [Iron Blessing] frontal [Hindering Cleave]; stand in [Empowered Ward] green circle for damage reduction||[Swift Ward] gray circle speed, immune to slow",
                ["heroic"] = "{rt8}Ocean Ranger (Iron Shell / Wind Maiden){rt8}||{rt1}Cutting Bomb{rt1} (Wind Maiden) interrupt; under [Storm's Blessing] interrupt causes [Backlash] tornado||tank dodge [Iron Blessing] frontal [Hindering Cleave]; stand in [Empowered Ward] green circle for damage reduction||[Swift Ward] gray circle speed, immune to slow",
                ["mythic"] = "{rt8}Ocean Ranger (Iron Shell / Wind Maiden){rt8}||{rt1}Cutting Bomb{rt1} (Wind Maiden) interrupt; under [Storm's Blessing] interrupt causes [Backlash] tornado||tank dodge [Iron Blessing] frontal [Hindering Cleave]; stand in [Empowered Ward] green circle for damage reduction||[Swift Ward] gray circle speed, immune to slow",
                ["mythicplus"] = "{rt8}Ocean Ranger (Iron Shell / Wind Maiden){rt8}||{rt1}Cutting Bomb{rt1} (Wind Maiden) interrupt; under [Storm's Blessing] interrupt causes [Backlash] tornado||tank dodge [Iron Blessing] frontal [Hindering Cleave]; stand in [Empowered Ward] green circle for damage reduction||[Swift Ward] gray circle speed, immune to slow",
            },
        },
        ["低语者沃尔兹斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Vol'zith the Whisperer{rt8}||pull boss away from [Abyssal Door] silence circle (permanent)||dodge [Tentacle Smash] landing; [Deep Calling] summons tentacles priority kill to prevent charging||[Grasp of the Sunken City] underwater kill [Forgotten Citizen] to return",
                ["normal"] = "{rt8}Vol'zith the Whisperer{rt8}||pull boss away from [Abyssal Door] silence circle (permanent)||dodge [Tentacle Smash] landing; [Deep Calling] summons tentacles priority kill to prevent charging||[Grasp of the Sunken City] underwater kill [Forgotten Citizen] to return",
                ["heroic"] = "{rt8}Vol'zith the Whisperer{rt8}||pull boss away from [Abyssal Door] silence circle (permanent)||dodge [Tentacle Smash] landing; [Deep Calling] summons tentacles priority kill to prevent charging||[Grasp of the Sunken City] underwater kill [Forgotten Citizen] to return",
                ["mythic"] = "{rt8}Vol'zith the Whisperer{rt8}||pull boss away from [Abyssal Door] silence circle (permanent)||dodge [Tentacle Smash] landing; [Deep Calling] summons tentacles priority kill to prevent charging||[Grasp of the Sunken City] underwater kill [Forgotten Citizen] to return",
                ["mythicplus"] = "{rt8}Vol'zith the Whisperer{rt8}||pull boss away from [Abyssal Door] silence circle (permanent)||dodge [Tentacle Smash] landing; [Deep Calling] summons tentacles priority kill to prevent charging||[Grasp of the Sunken City] underwater kill [Forgotten Citizen] to return",
            },
        },
        ["斯托颂勋爵"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lord Stormsong{rt8}||the [Old God's Mind] marked ram [Awakening Void] orb to 50% to break control||{rt1}Void Bolt{rt1} interrupt; [Mind Rend] dispel||dodge [Awakened Void], when orb chases stay away",
                ["normal"] = "{rt8}Lord Stormsong{rt8}||the [Old God's Mind] marked ram [Awakening Void] orb to 50% to break control||{rt1}Void Bolt{rt1} interrupt; [Mind Rend] dispel||dodge [Awakened Void], when orb chases stay away",
                ["heroic"] = "{rt8}Lord Stormsong{rt8}||the [Old God's Mind] marked ram [Awakening Void] orb to 50% to break control||{rt1}Void Bolt{rt1} interrupt; [Mind Rend] dispel||dodge [Awakened Void], when orb chases stay away",
                ["mythic"] = "{rt8}Lord Stormsong{rt8}||the [Old God's Mind] marked ram [Awakening Void] orb to 50% to break control||{rt1}Void Bolt{rt1} interrupt; [Mind Rend] dispel||dodge [Awakened Void], when orb chases stay away",
                ["mythicplus"] = "{rt8}Lord Stormsong{rt8}||the [Old God's Mind] marked ram [Awakening Void] orb to 50% to break control||{rt1}Void Bolt{rt1} interrupt; [Mind Rend] dispel||dodge [Awakened Void], when orb chases stay away",
            },
        },
    },
    ["暴富矿区！！"] = {
        name = "The MOTHERLODE!!",
        ["艾泽洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Azerokk{rt8}||use [Rupture Totem] to control / stun [Earth's Wrath] adds before killing||[Furious Gaze] marked kite + slow; dodge [Blazing Azerite] pool||[Resonant Quake] whole-group slow, boss away from left lightning",
                ["normal"] = "{rt8}Azerokk{rt8}||use [Rupture Totem] to control / stun [Earth's Wrath] adds before killing||[Furious Gaze] marked kite + slow; dodge [Blazing Azerite] pool||[Resonant Quake] whole-group slow, boss away from left lightning",
                ["heroic"] = "{rt8}Azerokk{rt8}||use [Rupture Totem] to control / stun [Earth's Wrath] adds before killing||[Furious Gaze] marked kite + slow; dodge [Blazing Azerite] pool||[Resonant Quake] whole-group slow, boss away from left lightning",
                ["mythic"] = "{rt8}Azerokk{rt8}||use [Rupture Totem] to control / stun [Earth's Wrath] adds before killing||[Furious Gaze] marked kite + slow; dodge [Blazing Azerite] pool||[Resonant Quake] whole-group slow, boss away from left lightning",
                ["mythicplus"] = "{rt8}Azerokk{rt8}||use [Rupture Totem] to control / stun [Earth's Wrath] adds before killing||[Furious Gaze] marked kite + slow; dodge [Blazing Azerite] pool||[Resonant Quake] whole-group slow, boss away from left lightning",
            },
        },
        ["风险投资公司刺客"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. Assassin (key mob){rt8}||stealth from behind [Sap] stuns player||use AoE / detect stealth to reveal, control then kill||",
        },
        ["商业大亨拉兹敦克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Trade Prince Razdunk{rt8}||P1 dodge frontal [Gatling Gun], go around back; [Homing Missile] lead away from group||P2 [Drill] marked run under red pillar to let boss smash [Giant Red Rocket] landing||grab jetpack to hit airborne weapons and force him down",
                ["normal"] = "{rt8}Trade Prince Razdunk{rt8}||P1 dodge frontal [Gatling Gun], go around back; [Homing Missile] lead away from group||P2 [Drill] marked run under red pillar to let boss smash [Giant Red Rocket] landing||grab jetpack to hit airborne weapons and force him down",
                ["heroic"] = "{rt8}Trade Prince Razdunk{rt8}||P1 dodge frontal [Gatling Gun], go around back; [Homing Missile] lead away from group||P2 [Drill] marked run under red pillar to let boss smash [Giant Red Rocket] landing||grab jetpack to hit airborne weapons and force him down",
                ["mythic"] = "{rt8}Trade Prince Razdunk{rt8}||P1 dodge frontal [Gatling Gun], go around back; [Homing Missile] lead away from group||P2 [Drill] marked run under red pillar to let boss smash [Giant Red Rocket] landing||grab jetpack to hit airborne weapons and force him down",
                ["mythicplus"] = "{rt8}Trade Prince Razdunk{rt8}||P1 dodge frontal [Gatling Gun], go around back; [Homing Missile] lead away from group||P2 [Drill] marked run under red pillar to let boss smash [Giant Red Rocket] landing||grab jetpack to hit airborne weapons and force him down",
            },
        },
        ["投币式群体打击者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Coin-Operated Crusher{rt8}||kick [Azerite Football] back at boss to apply [Blazing Azerite] damage buff||dodge frontal [Shock Claw], [Coin Rain] jump to dodge landing||tank roots boss to ease kicking",
                ["normal"] = "{rt8}Coin-Operated Crusher{rt8}||kick [Azerite Football] back at boss to apply [Blazing Azerite] damage buff||dodge frontal [Shock Claw], [Coin Rain] jump to dodge landing||tank roots boss to ease kicking",
                ["heroic"] = "{rt8}Coin-Operated Crusher{rt8}||kick [Azerite Football] back at boss to apply [Blazing Azerite] damage buff||dodge frontal [Shock Claw], [Coin Rain] jump to dodge landing||tank roots boss to ease kicking",
                ["mythic"] = "{rt8}Coin-Operated Crusher{rt8}||kick [Azerite Football] back at boss to apply [Blazing Azerite] damage buff||dodge frontal [Shock Claw], [Coin Rain] jump to dodge landing||tank roots boss to ease kicking",
                ["mythicplus"] = "{rt8}Coin-Operated Crusher{rt8}||kick [Azerite Football] back at boss to apply [Blazing Azerite] damage buff||dodge frontal [Shock Claw], [Coin Rain] jump to dodge landing||tank roots boss to ease kicking",
            },
        },
        ["瑞克莎·流火"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rixxa Fluxflame{rt8}||don't leave [Azerite Catalyst] yellow water behind you, move in a circle||{rt1}Advancing Blast{rt1} don't get pushed into fire / yellow water; [Chemical Burn] dispel||tank pulls boss away from fire pool",
                ["normal"] = "{rt8}Rixxa Fluxflame{rt8}||don't leave [Azerite Catalyst] yellow water behind you, move in a circle||{rt1}Advancing Blast{rt1} don't get pushed into fire / yellow water; [Chemical Burn] dispel||tank pulls boss away from fire pool",
                ["heroic"] = "{rt8}Rixxa Fluxflame{rt8}||don't leave [Azerite Catalyst] yellow water behind you, move in a circle||{rt1}Advancing Blast{rt1} don't get pushed into fire / yellow water; [Chemical Burn] dispel||tank pulls boss away from fire pool",
                ["mythic"] = "{rt8}Rixxa Fluxflame{rt8}||don't leave [Azerite Catalyst] yellow water behind you, move in a circle||{rt1}Advancing Blast{rt1} don't get pushed into fire / yellow water; [Chemical Burn] dispel||tank pulls boss away from fire pool",
                ["mythicplus"] = "{rt8}Rixxa Fluxflame{rt8}||don't leave [Azerite Catalyst] yellow water behind you, move in a circle||{rt1}Advancing Blast{rt1} don't get pushed into fire / yellow water; [Chemical Burn] dispel||tank pulls boss away from fire pool",
            },
        },
        ["风险投资公司战争机器"] = {
            type = "MOB",
            tips = "{rt8}Venture Co. War Machine (key mob){rt8}||[Gatling Gun] frontal sweep lethal—use line of sight or stun interrupt||will [deploy crawler mines]—prioritize handling||",
        },
        ["爬虫地雷"] = {
            type = "MOB",
            tips = "{rt8}Crawler Mine (key mob){rt8}||buried random activation, [Seeking Destroyer] charges player and one-shots on contact||can be controlled, focus kill on sight||",
        },
    },
    ["围攻伯拉勒斯"] = {
        name = "Siege of Boralus",
        ["维克戈斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Viq'Goth{rt8}||kill [Gripping Terror] tentacle to rescue engineer and repair cannon (each cannon -33% health)||dodge [Foul Deluge] (dispellable), [Slam] knockback, [Shattering Terror] don't leave melee||during transition don't get stuck on planks",
                ["normal"] = "{rt8}Viq'Goth{rt8}||kill [Gripping Terror] tentacle to rescue engineer and repair cannon (each cannon -33% health)||dodge [Foul Deluge] (dispellable), [Slam] knockback, [Shattering Terror] don't leave melee||during transition don't get stuck on planks",
                ["heroic"] = "{rt8}Viq'Goth{rt8}||kill [Gripping Terror] tentacle to rescue engineer and repair cannon (each cannon -33% health)||dodge [Foul Deluge] (dispellable), [Slam] knockback, [Shattering Terror] don't leave melee||during transition don't get stuck on planks",
                ["mythic"] = "{rt8}Viq'Goth{rt8}||kill [Gripping Terror] tentacle to rescue engineer and repair cannon (each cannon -33% health)||dodge [Foul Deluge] (dispellable), [Slam] knockback, [Shattering Terror] don't leave melee||during transition don't get stuck on planks",
                ["mythicplus"] = "{rt8}Viq'Goth{rt8}||kill [Gripping Terror] tentacle to rescue engineer and repair cannon (each cannon -33% health)||dodge [Foul Deluge] (dispellable), [Slam] knockback, [Shattering Terror] don't leave melee||during transition don't get stuck on planks",
            },
        },
        ["艾什凡狙击手"] = {
            type = "MOB",
            tips = "{rt8}Ashvane Sniper (key mob){rt8}||directs [Aimed Cannonfire] fire line—listen to lines, find cover||push during reload gap, don't get swept in open line||",
        },
        ["哈达尔·黑渊"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hadal Blackwater{rt8}||[Tidesplitter] frontal dodge, [Watersplit] white circle at feet dodge||at full energy [Tidal Surge] two water walls—stand behind central statue and dodge in sequence||tank pulls boss away from statue and white circles",
                ["normal"] = "{rt8}Hadal Blackwater{rt8}||[Tidesplitter] frontal dodge, [Watersplit] white circle at feet dodge||at full energy [Tidal Surge] two water walls—stand behind central statue and dodge in sequence||tank pulls boss away from statue and white circles",
                ["heroic"] = "{rt8}Hadal Blackwater{rt8}||[Tidesplitter] frontal dodge, [Watersplit] white circle at feet dodge||at full energy [Tidal Surge] two water walls—stand behind central statue and dodge in sequence||tank pulls boss away from statue and white circles",
                ["mythic"] = "{rt8}Hadal Blackwater{rt8}||[Tidesplitter] frontal dodge, [Watersplit] white circle at feet dodge||at full energy [Tidal Surge] two water walls—stand behind central statue and dodge in sequence||tank pulls boss away from statue and white circles",
                ["mythicplus"] = "{rt8}Hadal Blackwater{rt8}||[Tidesplitter] frontal dodge, [Watersplit] white circle at feet dodge||at full energy [Tidal Surge] two water walls—stand behind central statue and dodge in sequence||tank pulls boss away from statue and white circles",
            },
        },
        ["'屠夫'血钩"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}'Butcher' Bloodhook{rt8}||[Hooked] marked kite-run, lead boss onto [Heavy Ammo] to stun (players don't step)||[Cannon Barrage] dodge bombardment landing; after [Meat Hook] [Bloody Charge] dodge||[Boiling Rage] cleared via ammo, tank faces away from group to dodge [Heavy Cleave]",
                ["normal"] = "{rt8}'Butcher' Bloodhook{rt8}||[Hooked] marked kite-run, lead boss onto [Heavy Ammo] to stun (players don't step)||[Cannon Barrage] dodge bombardment landing; after [Meat Hook] [Bloody Charge] dodge||[Boiling Rage] cleared via ammo, tank faces away from group to dodge [Heavy Cleave]",
                ["heroic"] = "{rt8}'Butcher' Bloodhook{rt8}||[Hooked] marked kite-run, lead boss onto [Heavy Ammo] to stun (players don't step)||[Cannon Barrage] dodge bombardment landing; after [Meat Hook] [Bloody Charge] dodge||[Boiling Rage] cleared via ammo, tank faces away from group to dodge [Heavy Cleave]",
                ["mythic"] = "{rt8}'Butcher' Bloodhook{rt8}||[Hooked] marked kite-run, lead boss onto [Heavy Ammo] to stun (players don't step)||[Cannon Barrage] dodge bombardment landing; after [Meat Hook] [Bloody Charge] dodge||[Boiling Rage] cleared via ammo, tank faces away from group to dodge [Heavy Cleave]",
                ["mythicplus"] = "{rt8}'Butcher' Bloodhook{rt8}||[Hooked] marked kite-run, lead boss onto [Heavy Ammo] to stun (players don't step)||[Cannon Barrage] dodge bombardment landing; after [Meat Hook] [Bloody Charge] dodge||[Boiling Rage] cleared via ammo, tank faces away from group to dodge [Heavy Cleave]",
            },
        },
        ["铁潮斩杀者"] = {
            type = "MOB",
            tips = "{rt8}Iron Tide Cleaver (key mob){rt8}||[Heavy Cleave] frontal high damage + stun, tank faces away from group||priority kill, clear before hook||",
        },
        ["恐怖船长洛克伍德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Dread Captain Lockwood{rt8}||under [Evade] use root / slow to keep her (else she resets)||[Sniper Cannonfire] dodge mark, [Fiery Bounce] spread||at 66%/33% boards ship, kill adds dropping [Unstable Ammo] grab to bomb ship and force back",
                ["normal"] = "{rt8}Dread Captain Lockwood{rt8}||under [Evade] use root / slow to keep her (else she resets)||[Sniper Cannonfire] dodge mark, [Fiery Bounce] spread||at 66%/33% boards ship, kill adds dropping [Unstable Ammo] grab to bomb ship and force back",
                ["heroic"] = "{rt8}Dread Captain Lockwood{rt8}||under [Evade] use root / slow to keep her (else she resets)||[Sniper Cannonfire] dodge mark, [Fiery Bounce] spread||at 66%/33% boards ship, kill adds dropping [Unstable Ammo] grab to bomb ship and force back",
                ["mythic"] = "{rt8}Dread Captain Lockwood{rt8}||under [Evade] use root / slow to keep her (else she resets)||[Sniper Cannonfire] dodge mark, [Fiery Bounce] spread||at 66%/33% boards ship, kill adds dropping [Unstable Ammo] grab to bomb ship and force back",
                ["mythicplus"] = "{rt8}Dread Captain Lockwood{rt8}||under [Evade] use root / slow to keep her (else she resets)||[Sniper Cannonfire] dodge mark, [Fiery Bounce] spread||at 66%/33% boards ship, kill adds dropping [Unstable Ammo] grab to bomb ship and force back",
            },
        },
        ["铁潮火枪手"] = {
            type = "MOB",
            tips = "{rt8}Iron Tide Marksman (key mob){rt8}||[Searing Round] deals continuous damage to whole group||priority handle, coordinate with [Hooked] marked movement||",
        },
        ["拜恩比吉中士"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Sergeant Bainbridge{rt8}||[Iron Gaze] marked lead boss onto [Heavy Ammo] to clear [Boiling Rage] and stun boss (players don't step on ammo)||{rt1}priority kill Kul Tiran troops{rt1}: [Heavy Cleave] tank faces away from group, [Searing Round] hits whole group||dodge [Cannon Barrage] bombardment; after [Executioner's Hook] pull-back [Iron Storm] stay 10 yards away",
                ["normal"] = "{rt8}Sergeant Bainbridge{rt8}||[Iron Gaze] marked lead boss onto [Heavy Ammo] to clear [Boiling Rage] and stun boss (players don't step on ammo)||{rt1}priority kill Kul Tiran troops{rt1}: [Heavy Cleave] tank faces away from group, [Searing Round] hits whole group||dodge [Cannon Barrage] bombardment; after [Executioner's Hook] pull-back [Iron Storm] stay 10 yards away",
                ["heroic"] = "{rt8}Sergeant Bainbridge{rt8}||[Iron Gaze] marked lead boss onto [Heavy Ammo] to clear [Boiling Rage] and stun boss (players don't step on ammo)||{rt1}priority kill Kul Tiran troops{rt1}: [Heavy Cleave] tank faces away from group, [Searing Round] hits whole group||dodge [Cannon Barrage] bombardment; after [Executioner's Hook] pull-back [Iron Storm] stay 10 yards away",
                ["mythic"] = "{rt8}Sergeant Bainbridge{rt8}||[Iron Gaze] marked lead boss onto [Heavy Ammo] to clear [Boiling Rage] and stun boss (players don't step on ammo)||{rt1}priority kill Kul Tiran troops{rt1}: [Heavy Cleave] tank faces away from group, [Searing Round] hits whole group||dodge [Cannon Barrage] bombardment; after [Executioner's Hook] pull-back [Iron Storm] stay 10 yards away",
                ["mythicplus"] = "{rt8}Sergeant Bainbridge{rt8}||[Iron Gaze] marked lead boss onto [Heavy Ammo] to clear [Boiling Rage] and stun boss (players don't step on ammo)||{rt1}priority kill Kul Tiran troops{rt1}: [Heavy Cleave] tank faces away from group, [Searing Round] hits whole group||dodge [Cannon Barrage] bombardment; after [Executioner's Hook] pull-back [Iron Storm] stay 10 yards away",
            },
        },
    },
    ["维克雷斯庄园"] = {
        name = "Waycrest Manor",
        ["毒心三姝"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}The Three Sisters (Toxin Triad){rt8}||focus the one with [Focused Eye] (others 99% damage reduction), the other two are ineffective||[Bramble Arrow] random / [Fear Aura] leave group / [Apathy Aura] heal -50%||at full energy [Heart Energy] whole-group AoE, one dies the other two [Frenzy]",
                ["normal"] = "{rt8}The Three Sisters (Toxin Triad){rt8}||focus the one with [Focused Eye] (others 99% damage reduction), the other two are ineffective||[Bramble Arrow] random / [Fear Aura] leave group / [Apathy Aura] heal -50%||at full energy [Heart Energy] whole-group AoE, one dies the other two [Frenzy]",
                ["heroic"] = "{rt8}The Three Sisters (Toxin Triad){rt8}||focus the one with [Focused Eye] (others 99% damage reduction), the other two are ineffective||[Bramble Arrow] random / [Fear Aura] leave group / [Apathy Aura] heal -50%||at full energy [Heart Energy] whole-group AoE, one dies the other two [Frenzy]",
                ["mythic"] = "{rt8}The Three Sisters (Toxin Triad){rt8}||focus the one with [Focused Eye] (others 99% damage reduction), the other two are ineffective||[Bramble Arrow] random / [Fear Aura] leave group / [Apathy Aura] heal -50%||at full energy [Heart Energy] whole-group AoE, one dies the other two [Frenzy]",
                ["mythicplus"] = "{rt8}The Three Sisters (Toxin Triad){rt8}||focus the one with [Focused Eye] (others 99% damage reduction), the other two are ineffective||[Bramble Arrow] random / [Fear Aura] leave group / [Apathy Aura] heal -50%||at full energy [Heart Energy] whole-group AoE, one dies the other two [Frenzy]",
            },
        },
        ["魂缚巨像"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Soulbound Colossus{rt8}||when [Soul Harvest] stacks high, pull boss to [Wildfire] to burn off stacks and interrupt||quickly break [Soul Thorns] to free impaled players; [Cleave] tank cooldowns||[Burning Soul] appears—dodge",
                ["normal"] = "{rt8}Soulbound Colossus{rt8}||when [Soul Harvest] stacks high, pull boss to [Wildfire] to burn off stacks and interrupt||quickly break [Soul Thorns] to free impaled players; [Cleave] tank cooldowns||[Burning Soul] appears—dodge",
                ["heroic"] = "{rt8}Soulbound Colossus{rt8}||when [Soul Harvest] stacks high, pull boss to [Wildfire] to burn off stacks and interrupt||quickly break [Soul Thorns] to free impaled players; [Cleave] tank cooldowns||[Burning Soul] appears—dodge",
                ["mythic"] = "{rt8}Soulbound Colossus{rt8}||when [Soul Harvest] stacks high, pull boss to [Wildfire] to burn off stacks and interrupt||quickly break [Soul Thorns] to free impaled players; [Cleave] tank cooldowns||[Burning Soul] appears—dodge",
                ["mythicplus"] = "{rt8}Soulbound Colossus{rt8}||when [Soul Harvest] stacks high, pull boss to [Wildfire] to burn off stacks and interrupt||quickly break [Soul Thorns] to free impaled players; [Cleave] tank cooldowns||[Burning Soul] appears—dodge",
            },
        },
        ["图尔，高莱克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Thur, the High Warlock{rt8}||first kill [Death Touch Slavemaster], use [Alchemical Fire] to burn corpses and prevent [Terror Essence] revive||dodge [Dark Lightning] spread; [Death Lens] dispel||tank holds the slavemaster",
                ["normal"] = "{rt8}Thur, the High Warlock{rt8}||first kill [Death Touch Slavemaster], use [Alchemical Fire] to burn corpses and prevent [Terror Essence] revive||dodge [Dark Lightning] spread; [Death Lens] dispel||tank holds the slavemaster",
                ["heroic"] = "{rt8}Thur, the High Warlock{rt8}||first kill [Death Touch Slavemaster], use [Alchemical Fire] to burn corpses and prevent [Terror Essence] revive||dodge [Dark Lightning] spread; [Death Lens] dispel||tank holds the slavemaster",
                ["mythic"] = "{rt8}Thur, the High Warlock{rt8}||first kill [Death Touch Slavemaster], use [Alchemical Fire] to burn corpses and prevent [Terror Essence] revive||dodge [Dark Lightning] spread; [Death Lens] dispel||tank holds the slavemaster",
                ["mythicplus"] = "{rt8}Thur, the High Warlock{rt8}||first kill [Death Touch Slavemaster], use [Alchemical Fire] to burn corpses and prevent [Terror Essence] revive||dodge [Dark Lightning] spread; [Death Lens] dispel||tank holds the slavemaster",
            },
        },
        ["贪食的拉尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Raal the Gluttonous{rt8}||dodge [Tenderize] frontal triple, dodge [Putrid Spit] green pool||{rt1}decaying servant{rt1} priority kill to prevent it reaching boss and triggering [Devour Servant] damage buff||tank holds nearby servants",
                ["normal"] = "{rt8}Raal the Gluttonous{rt8}||dodge [Tenderize] frontal triple, dodge [Putrid Spit] green pool||{rt1}decaying servant{rt1} priority kill to prevent it reaching boss and triggering [Devour Servant] damage buff||tank holds nearby servants",
                ["heroic"] = "{rt8}Raal the Gluttonous{rt8}||dodge [Tenderize] frontal triple, dodge [Putrid Spit] green pool||{rt1}decaying servant{rt1} priority kill to prevent it reaching boss and triggering [Devour Servant] damage buff||tank holds nearby servants",
                ["mythic"] = "{rt8}Raal the Gluttonous{rt8}||dodge [Tenderize] frontal triple, dodge [Putrid Spit] green pool||{rt1}decaying servant{rt1} priority kill to prevent it reaching boss and triggering [Devour Servant] damage buff||tank holds nearby servants",
                ["mythicplus"] = "{rt8}Raal the Gluttonous{rt8}||dodge [Tenderize] frontal triple, dodge [Putrid Spit] green pool||{rt1}decaying servant{rt1} priority kill to prevent it reaching boss and triggering [Devour Servant] damage buff||tank holds nearby servants",
            },
        },
        ["庄园仆从"] = {
            type = "MOB",
            tips = "{rt8}Manor Servant (key mob){rt8}||Drustic trash often [Drain] / control—prioritize interrupting casts||[Reaper] pulls line high damage, focus handle||",
        },
        ["维克雷斯勋爵和夫人"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Lord and Lady Waycrest{rt8}||[Poisoned] leave group, dodge [Vortex]||Lord [Ruination Storm] tank kites; Lady [Allure] dispel / control||spread to reduce chain damage",
                ["normal"] = "{rt8}Lord and Lady Waycrest{rt8}||[Poisoned] leave group, dodge [Vortex]||Lord [Ruination Storm] tank kites; Lady [Allure] dispel / control||spread to reduce chain damage",
                ["heroic"] = "{rt8}Lord and Lady Waycrest{rt8}||[Poisoned] leave group, dodge [Vortex]||Lord [Ruination Storm] tank kites; Lady [Allure] dispel / control||spread to reduce chain damage",
                ["mythic"] = "{rt8}Lord and Lady Waycrest{rt8}||[Poisoned] leave group, dodge [Vortex]||Lord [Ruination Storm] tank kites; Lady [Allure] dispel / control||spread to reduce chain damage",
                ["mythicplus"] = "{rt8}Lord and Lady Waycrest{rt8}||[Poisoned] leave group, dodge [Vortex]||Lord [Ruination Storm] tank kites; Lady [Allure] dispel / control||spread to reduce chain damage",
            },
        },
        ["死亡触碰奴隶主尸体"] = {
            type = "MOB",
            tips = "{rt8}Death Touch Slavemaster Corpse (key mob){rt8}||Thur area—normal means can't kill it, it [Terror Essence] revives||pick up ground [Alchemical Fire] to burn the corpse for permanent removal||",
        },
    },
    ["自由镇"] = {
        name = "Freehold",
        ["天空上尉库拉格"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Skycap'n Kragg{rt8}||spread to reduce [Azerite Powder Shot] frontal damage||{rt1}Invigorating Brew{rt1} interrupt to prevent boss healing (interrupted bottle can be picked up)||at 75% drops shark bait [Vicious Bombardment], dodge [Dive Bomb] knockback",
                ["normal"] = "{rt8}Skycap'n Kragg{rt8}||spread to reduce [Azerite Powder Shot] frontal damage||{rt1}Invigorating Brew{rt1} interrupt to prevent boss healing (interrupted bottle can be picked up)||at 75% drops shark bait [Vicious Bombardment], dodge [Dive Bomb] knockback",
                ["heroic"] = "{rt8}Skycap'n Kragg{rt8}||spread to reduce [Azerite Powder Shot] frontal damage||{rt1}Invigorating Brew{rt1} interrupt to prevent boss healing (interrupted bottle can be picked up)||at 75% drops shark bait [Vicious Bombardment], dodge [Dive Bomb] knockback",
                ["mythic"] = "{rt8}Skycap'n Kragg{rt8}||spread to reduce [Azerite Powder Shot] frontal damage||{rt1}Invigorating Brew{rt1} interrupt to prevent boss healing (interrupted bottle can be picked up)||at 75% drops shark bait [Vicious Bombardment], dodge [Dive Bomb] knockback",
                ["mythicplus"] = "{rt8}Skycap'n Kragg{rt8}||spread to reduce [Azerite Powder Shot] frontal damage||{rt1}Invigorating Brew{rt1} interrupt to prevent boss healing (interrupted bottle can be picked up)||at 75% drops shark bait [Vicious Bombardment], dodge [Dive Bomb] knockback",
            },
        },
        ["哈兰·斯威提"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Harlan Sweete{rt8}||stand behind boss to dodge [Swift Wind Cutlass] (before Leadened); [Cannon Volley] dodge mark||{rt1}Black Powder Bomb{rt1} intercept Iron Tide Demolisher to prevent self-detonate||at 60%/30% [Leadened Dice]: full-speed forward multi-target, warship attack speed doubled",
                ["normal"] = "{rt8}Harlan Sweete{rt8}||stand behind boss to dodge [Swift Wind Cutlass] (before Leadened); [Cannon Volley] dodge mark||{rt1}Black Powder Bomb{rt1} intercept Iron Tide Demolisher to prevent self-detonate||at 60%/30% [Leadened Dice]: full-speed forward multi-target, warship attack speed doubled",
                ["heroic"] = "{rt8}Harlan Sweete{rt8}||stand behind boss to dodge [Swift Wind Cutlass] (before Leadened); [Cannon Volley] dodge mark||{rt1}Black Powder Bomb{rt1} intercept Iron Tide Demolisher to prevent self-detonate||at 60%/30% [Leadened Dice]: full-speed forward multi-target, warship attack speed doubled",
                ["mythic"] = "{rt8}Harlan Sweete{rt8}||stand behind boss to dodge [Swift Wind Cutlass] (before Leadened); [Cannon Volley] dodge mark||{rt1}Black Powder Bomb{rt1} intercept Iron Tide Demolisher to prevent self-detonate||at 60%/30% [Leadened Dice]: full-speed forward multi-target, warship attack speed doubled",
                ["mythicplus"] = "{rt8}Harlan Sweete{rt8}||stand behind boss to dodge [Swift Wind Cutlass] (before Leadened); [Cannon Volley] dodge mark||{rt1}Black Powder Bomb{rt1} intercept Iron Tide Demolisher to prevent self-detonate||at 60%/30% [Leadened Dice]: full-speed forward multi-target, warship attack speed doubled",
            },
        },
        ["藏宝竞技场"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Treasure Arena (Trosk){rt8}||don't stand on the line between Trosk and [Flailing Shark] (heavy hit)||[Flailing Shark] swims toward nearest target—pull away from group||when boss throws shark dodge landing",
                ["normal"] = "{rt8}Treasure Arena (Trosk){rt8}||don't stand on the line between Trosk and [Flailing Shark] (heavy hit)||[Flailing Shark] swims toward nearest target—pull away from group||when boss throws shark dodge landing",
                ["heroic"] = "{rt8}Treasure Arena (Trosk){rt8}||don't stand on the line between Trosk and [Flailing Shark] (heavy hit)||[Flailing Shark] swims toward nearest target—pull away from group||when boss throws shark dodge landing",
                ["mythic"] = "{rt8}Treasure Arena (Trosk){rt8}||don't stand on the line between Trosk and [Flailing Shark] (heavy hit)||[Flailing Shark] swims toward nearest target—pull away from group||when boss throws shark dodge landing",
                ["mythicplus"] = "{rt8}Treasure Arena (Trosk){rt8}||don't stand on the line between Trosk and [Flailing Shark] (heavy hit)||[Flailing Shark] swims toward nearest target—pull away from group||when boss throws shark dodge landing",
            },
        },
        ["铁潮爆破兵"] = {
            type = "MOB",
            tips = "{rt8}Iron Tide Demolisher (key mob){rt8}||charges random target and self-detonates [Black Powder Bomb]||tank intercept or control, prevent it hitting the group||",
        },
        ["海盗议会"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Council o' Captains{rt8}||first ally with one captain for [Concordance Flag] buff||{rt1}Cutting Bomb{rt1} (Eudora) interrupt; [Black Barrel] smash barrel to free confused teammates||tank dodge [Barrel Smash] frontal, eat [Lobbed Beer] damage buff",
                ["normal"] = "{rt8}Council o' Captains{rt8}||first ally with one captain for [Concordance Flag] buff||{rt1}Cutting Bomb{rt1} (Eudora) interrupt; [Black Barrel] smash barrel to free confused teammates||tank dodge [Barrel Smash] frontal, eat [Lobbed Beer] damage buff",
                ["heroic"] = "{rt8}Council o' Captains{rt8}||first ally with one captain for [Concordance Flag] buff||{rt1}Cutting Bomb{rt1} (Eudora) interrupt; [Black Barrel] smash barrel to free confused teammates||tank dodge [Barrel Smash] frontal, eat [Lobbed Beer] damage buff",
                ["mythic"] = "{rt8}Council o' Captains{rt8}||first ally with one captain for [Concordance Flag] buff||{rt1}Cutting Bomb{rt1} (Eudora) interrupt; [Black Barrel] smash barrel to free confused teammates||tank dodge [Barrel Smash] frontal, eat [Lobbed Beer] damage buff",
                ["mythicplus"] = "{rt8}Council o' Captains{rt8}||first ally with one captain for [Concordance Flag] buff||{rt1}Cutting Bomb{rt1} (Eudora) interrupt; [Black Barrel] smash barrel to free confused teammates||tank dodge [Barrel Smash] frontal, eat [Lobbed Beer] damage buff",
            },
        },
        ["黑喙海盗"] = {
            type = "MOB",
            tips = "{rt8}Blackbeak Pirate (key mob){rt8}||pre-Kragg shark-related trash, [Shark Bite] high damage||can control, focus handle to avoid ADD||",
        },
        ["铁潮火枪手"] = {
            type = "MOB",
            tips = "{rt8}Iron Tide Marksman (key mob){rt8}||[Searing Round] deals continuous damage to whole group||priority kill, move away from group when [Hooked] marked||",
        },
    },
    ["诸王之眠"] = {
        name = "Kings' Rest",
        ["黄金风蛇"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Golden Wind Serpent{rt8}||[Spit Gold] drop yellow water away from boss, [Wealth Summon] animated gold approach for shield + damage buff—kill fast||[Serpent's Gust] knockback away, [Tail Lash] tank cooldowns||when boss casting don't move to ease positioning",
                ["normal"] = "{rt8}Golden Wind Serpent{rt8}||[Spit Gold] drop yellow water away from boss, [Wealth Summon] animated gold approach for shield + damage buff—kill fast||[Serpent's Gust] knockback away, [Tail Lash] tank cooldowns||when boss casting don't move to ease positioning",
                ["heroic"] = "{rt8}Golden Wind Serpent{rt8}||[Spit Gold] drop yellow water away from boss, [Wealth Summon] animated gold approach for shield + damage buff—kill fast||[Serpent's Gust] knockback away, [Tail Lash] tank cooldowns||when boss casting don't move to ease positioning",
                ["mythic"] = "{rt8}Golden Wind Serpent{rt8}||[Spit Gold] drop yellow water away from boss, [Wealth Summon] animated gold approach for shield + damage buff—kill fast||[Serpent's Gust] knockback away, [Tail Lash] tank cooldowns||when boss casting don't move to ease positioning",
                ["mythicplus"] = "{rt8}Golden Wind Serpent{rt8}||[Spit Gold] drop yellow water away from boss, [Wealth Summon] animated gold approach for shield + damage buff—kill fast||[Serpent's Gust] knockback away, [Tail Lash] tank cooldowns||when boss casting don't move to ease positioning",
            },
        },
        ["部族议会"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Council of Tribes (Kula / Akali / Zanazal){rt8}||Kula [Spinning Axe] melee, [Cleave Axe] DoT; Akali [Brute Force] spread, [Weakening Riposte] tank cooldowns||Zanazal [Arcane Lightning] spread, {rt1}Poison Nova{rt1} interrupt, [Elemental Summon] bomb totem||dead ones return to urn and cast again",
                ["normal"] = "{rt8}Council of Tribes (Kula / Akali / Zanazal){rt8}||Kula [Spinning Axe] melee, [Cleave Axe] DoT; Akali [Brute Force] spread, [Weakening Riposte] tank cooldowns||Zanazal [Arcane Lightning] spread, {rt1}Poison Nova{rt1} interrupt, [Elemental Summon] bomb totem||dead ones return to urn and cast again",
                ["heroic"] = "{rt8}Council of Tribes (Kula / Akali / Zanazal){rt8}||Kula [Spinning Axe] melee, [Cleave Axe] DoT; Akali [Brute Force] spread, [Weakening Riposte] tank cooldowns||Zanazal [Arcane Lightning] spread, {rt1}Poison Nova{rt1} interrupt, [Elemental Summon] bomb totem||dead ones return to urn and cast again",
                ["mythic"] = "{rt8}Council of Tribes (Kula / Akali / Zanazal){rt8}||Kula [Spinning Axe] melee, [Cleave Axe] DoT; Akali [Brute Force] spread, [Weakening Riposte] tank cooldowns||Zanazal [Arcane Lightning] spread, {rt1}Poison Nova{rt1} interrupt, [Elemental Summon] bomb totem||dead ones return to urn and cast again",
                ["mythicplus"] = "{rt8}Council of Tribes (Kula / Akali / Zanazal){rt8}||Kula [Spinning Axe] melee, [Cleave Axe] DoT; Akali [Brute Force] spread, [Weakening Riposte] tank cooldowns||Zanazal [Arcane Lightning] spread, {rt1}Poison Nova{rt1} interrupt, [Elemental Summon] bomb totem||dead ones return to urn and cast again",
            },
        },
        ["始皇达萨"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}King Dazar{rt8}||at 80% rides [Zula] leap; [Blade Combo] tank cooldowns, [Gilded Destruction] spear mark dodge||[Spike Spear] dodge ceiling falling spears; [Death Roar] interrupt||mount [Frenzied Bite] tank cooldowns dispel bleed",
                ["normal"] = "{rt8}King Dazar{rt8}||at 80% rides [Zula] leap; [Blade Combo] tank cooldowns, [Gilded Destruction] spear mark dodge||[Spike Spear] dodge ceiling falling spears; [Death Roar] interrupt||mount [Frenzied Bite] tank cooldowns dispel bleed",
                ["heroic"] = "{rt8}King Dazar{rt8}||at 80% rides [Zula] leap; [Blade Combo] tank cooldowns, [Gilded Destruction] spear mark dodge||[Spike Spear] dodge ceiling falling spears; [Death Roar] interrupt||mount [Frenzied Bite] tank cooldowns dispel bleed",
                ["mythic"] = "{rt8}King Dazar{rt8}||at 80% rides [Zula] leap; [Blade Combo] tank cooldowns, [Gilded Destruction] spear mark dodge||[Spike Spear] dodge ceiling falling spears; [Death Roar] interrupt||mount [Frenzied Bite] tank cooldowns dispel bleed",
                ["mythicplus"] = "{rt8}King Dazar{rt8}||at 80% rides [Zula] leap; [Blade Combo] tank cooldowns, [Gilded Destruction] spear mark dodge||[Spike Spear] dodge ceiling falling spears; [Death Roar] interrupt||mount [Frenzied Bite] tank cooldowns dispel bleed",
            },
        },
        ["治疗之潮图腾"] = {
            type = "MOB",
            tips = "{rt8}Healing Tide Totem (key mob){rt8}||council corridor—[Healing Tide] heals trash||priority focus kill or trash never clears||",
        },
        ["线之仆从"] = {
            type = "MOB",
            tips = "{rt8}Line Servant (key mob){rt8}||has shield, 1 health—break shield / dispel magic to one-shot||focus or dispel, don't waste output||",
        },
        ["殓尸者姆沁巴"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mchimba the Embalmer{rt8}||[Drain Fluid] use immunity to interrupt and prevent [Wither]; [Buried] watch tremble and open the matching coffin to rescue||dodge [Burning Rot] fire, kill [Half-finished Mummy]||healer heal [Wither] target above 90% to clear",
                ["normal"] = "{rt8}Mchimba the Embalmer{rt8}||[Drain Fluid] use immunity to interrupt and prevent [Wither]; [Buried] watch tremble and open the matching coffin to rescue||dodge [Burning Rot] fire, kill [Half-finished Mummy]||healer heal [Wither] target above 90% to clear",
                ["heroic"] = "{rt8}Mchimba the Embalmer{rt8}||[Drain Fluid] use immunity to interrupt and prevent [Wither]; [Buried] watch tremble and open the matching coffin to rescue||dodge [Burning Rot] fire, kill [Half-finished Mummy]||healer heal [Wither] target above 90% to clear",
                ["mythic"] = "{rt8}Mchimba the Embalmer{rt8}||[Drain Fluid] use immunity to interrupt and prevent [Wither]; [Buried] watch tremble and open the matching coffin to rescue||dodge [Burning Rot] fire, kill [Half-finished Mummy]||healer heal [Wither] target above 90% to clear",
                ["mythicplus"] = "{rt8}Mchimba the Embalmer{rt8}||[Drain Fluid] use immunity to interrupt and prevent [Wither]; [Buried] watch tremble and open the matching coffin to rescue||dodge [Burning Rot] fire, kill [Half-finished Mummy]||healer heal [Wither] target above 90% to clear",
            },
        },
        ["活化守卫"] = {
            type = "MOB",
            tips = "{rt8}Animated Guardian (key mob){rt8}||[Crusher Strike] big frontal high damage + stun, dodge frontal||at low health [Frenzy] melee speeds up, use calm/taunt to clear||",
        },
    },
    ["托尔达戈"] = {
        name = "Tol Dagor",
        ["骑士队长瓦莱莉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Captain Valyri{rt8}||move [Ammo Barrel] aside to leave a safe spot (barrel hits fire [Burning Ammo] explodes)||dodge [Ignite] / [Ember] fire circles, move barrel outside fire||[Fuse] marked move away from group",
                ["normal"] = "{rt8}Captain Valyri{rt8}||move [Ammo Barrel] aside to leave a safe spot (barrel hits fire [Burning Ammo] explodes)||dodge [Ignite] / [Ember] fire circles, move barrel outside fire||[Fuse] marked move away from group",
                ["heroic"] = "{rt8}Captain Valyri{rt8}||move [Ammo Barrel] aside to leave a safe spot (barrel hits fire [Burning Ammo] explodes)||dodge [Ignite] / [Ember] fire circles, move barrel outside fire||[Fuse] marked move away from group",
                ["mythic"] = "{rt8}Captain Valyri{rt8}||move [Ammo Barrel] aside to leave a safe spot (barrel hits fire [Burning Ammo] explodes)||dodge [Ignite] / [Ember] fire circles, move barrel outside fire||[Fuse] marked move away from group",
                ["mythicplus"] = "{rt8}Captain Valyri{rt8}||move [Ammo Barrel] aside to leave a safe spot (barrel hits fire [Burning Ammo] explodes)||dodge [Ignite] / [Ember] fire circles, move barrel outside fire||[Fuse] marked move away from group",
            },
        },
        ["泥沙女王"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Queen of Sands{rt8}||dodge [Quicksand Trap] at feet (knockback + stun), [Upheaval] after burrow dodge landing||[Sandstorm] whole-group nature DoT; swarm death nearby boss [Enrage] stacks||at 30% enters [Enrage] high haste high damage",
                ["normal"] = "{rt8}Queen of Sands{rt8}||dodge [Quicksand Trap] at feet (knockback + stun), [Upheaval] after burrow dodge landing||[Sandstorm] whole-group nature DoT; swarm death nearby boss [Enrage] stacks||at 30% enters [Enrage] high haste high damage",
                ["heroic"] = "{rt8}Queen of Sands{rt8}||dodge [Quicksand Trap] at feet (knockback + stun), [Upheaval] after burrow dodge landing||[Sandstorm] whole-group nature DoT; swarm death nearby boss [Enrage] stacks||at 30% enters [Enrage] high haste high damage",
                ["mythic"] = "{rt8}Queen of Sands{rt8}||dodge [Quicksand Trap] at feet (knockback + stun), [Upheaval] after burrow dodge landing||[Sandstorm] whole-group nature DoT; swarm death nearby boss [Enrage] stacks||at 30% enters [Enrage] high haste high damage",
                ["mythicplus"] = "{rt8}Queen of Sands{rt8}||dodge [Quicksand Trap] at feet (knockback + stun), [Upheaval] after burrow dodge landing||[Sandstorm] whole-group nature DoT; swarm death nearby boss [Enrage] stacks||at 30% enters [Enrage] high haste high damage",
            },
        },
        ["科古斯狱长"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Warden Korgus{rt8}||{rt1}Azerite Round: Burning{rt1} don't stack (fire damage stacks lethal)||[Death Aim] don't eat a second shot during debuff||dodge cannon [Giant Blast], [Cardiac Arrest Poison] whole-group stun eat",
                ["normal"] = "{rt8}Warden Korgus{rt8}||{rt1}Azerite Round: Burning{rt1} don't stack (fire damage stacks lethal)||[Death Aim] don't eat a second shot during debuff||dodge cannon [Giant Blast], [Cardiac Arrest Poison] whole-group stun eat",
                ["heroic"] = "{rt8}Warden Korgus{rt8}||{rt1}Azerite Round: Burning{rt1} don't stack (fire damage stacks lethal)||[Death Aim] don't eat a second shot during debuff||dodge cannon [Giant Blast], [Cardiac Arrest Poison] whole-group stun eat",
                ["mythic"] = "{rt8}Warden Korgus{rt8}||{rt1}Azerite Round: Burning{rt1} don't stack (fire damage stacks lethal)||[Death Aim] don't eat a second shot during debuff||dodge cannon [Giant Blast], [Cardiac Arrest Poison] whole-group stun eat",
                ["mythicplus"] = "{rt8}Warden Korgus{rt8}||{rt1}Azerite Round: Burning{rt1} don't stack (fire damage stacks lethal)||[Death Aim] don't eat a second shot during debuff||dodge cannon [Giant Blast], [Cardiac Arrest Poison] whole-group stun eat",
            },
        },
        ["禁闭室囚犯"] = {
            type = "MOB",
            tips = "{rt8}Solitary Confinement Prisoner (key mob){rt8}||pre-corridor to Jes—[Trap] type trash tank opens path||uncleared corner prisoners add in P2, clear early||",
        },
        ["受鼓舞囚犯"] = {
            type = "MOB",
            tips = "{rt8}Inspired Prisoner (key mob){rt8}||released by Jes in P2, after stacking [Greatly Inspired] hits very hard||healer watch, tank quickly establish threat and focus||",
        },
        ["杰斯·豪里斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Jes Howlis{rt8}||[Flash Daggers] hide behind pillar for line of sight (full-screen physical high damage)||{rt1}Howl fear{rt1} interrupt; 50% [Smoke Powder] releases prisoners, P2 focus boss||watch prisoners with [Greatly Inspired] high damage",
                ["normal"] = "{rt8}Jes Howlis{rt8}||[Flash Daggers] hide behind pillar for line of sight (full-screen physical high damage)||{rt1}Howl fear{rt1} interrupt; 50% [Smoke Powder] releases prisoners, P2 focus boss||watch prisoners with [Greatly Inspired] high damage",
                ["heroic"] = "{rt8}Jes Howlis{rt8}||[Flash Daggers] hide behind pillar for line of sight (full-screen physical high damage)||{rt1}Howl fear{rt1} interrupt; 50% [Smoke Powder] releases prisoners, P2 focus boss||watch prisoners with [Greatly Inspired] high damage",
                ["mythic"] = "{rt8}Jes Howlis{rt8}||[Flash Daggers] hide behind pillar for line of sight (full-screen physical high damage)||{rt1}Howl fear{rt1} interrupt; 50% [Smoke Powder] releases prisoners, P2 focus boss||watch prisoners with [Greatly Inspired] high damage",
                ["mythicplus"] = "{rt8}Jes Howlis{rt8}||[Flash Daggers] hide behind pillar for line of sight (full-screen physical high damage)||{rt1}Howl fear{rt1} interrupt; 50% [Smoke Powder] releases prisoners, P2 focus boss||watch prisoners with [Greatly Inspired] high damage",
            },
        },
    },
    ["塞塔里斯神庙"] = {
        name = "Temple of Sethraliss",
        ["米利克萨"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Merektha{rt8}||[Serpentine] wraps a teammate—use root / control to instantly free||[Serpent Breath] drop circle, [Serpent Storm] knockback dodge landing||[Burrow] phase kill serpents to bring boss up, eggs hatch [Venom Serpent / Storm Serpent] clear fast",
                ["normal"] = "{rt8}Merektha{rt8}||[Serpentine] wraps a teammate—use root / control to instantly free||[Serpent Breath] drop circle, [Serpent Storm] knockback dodge landing||[Burrow] phase kill serpents to bring boss up, eggs hatch [Venom Serpent / Storm Serpent] clear fast",
                ["heroic"] = "{rt8}Merektha{rt8}||[Serpentine] wraps a teammate—use root / control to instantly free||[Serpent Breath] drop circle, [Serpent Storm] knockback dodge landing||[Burrow] phase kill serpents to bring boss up, eggs hatch [Venom Serpent / Storm Serpent] clear fast",
                ["mythic"] = "{rt8}Merektha{rt8}||[Serpentine] wraps a teammate—use root / control to instantly free||[Serpent Breath] drop circle, [Serpent Storm] knockback dodge landing||[Burrow] phase kill serpents to bring boss up, eggs hatch [Venom Serpent / Storm Serpent] clear fast",
                ["mythicplus"] = "{rt8}Merektha{rt8}||[Serpentine] wraps a teammate—use root / control to instantly free||[Serpent Breath] drop circle, [Serpent Storm] knockback dodge landing||[Burrow] phase kill serpents to bring boss up, eggs hatch [Venom Serpent / Storm Serpent] clear fast",
            },
        },
        ["阿德里斯和阿斯匹克斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Adderis and Aspix{rt8}||only hit the one with [Storm's Wrath] damage-reduction buff—the other is ineffective||[Lightning and Storm] group up to share; [Gale Force] knockback spread first||[Storm Winds] drop circle; [Overload] tank cooldowns; one dies the other [Frenzy]",
                ["normal"] = "{rt8}Adderis and Aspix{rt8}||only hit the one with [Storm's Wrath] damage-reduction buff—the other is ineffective||[Lightning and Storm] group up to share; [Gale Force] knockback spread first||[Storm Winds] drop circle; [Overload] tank cooldowns; one dies the other [Frenzy]",
                ["heroic"] = "{rt8}Adderis and Aspix{rt8}||only hit the one with [Storm's Wrath] damage-reduction buff—the other is ineffective||[Lightning and Storm] group up to share; [Gale Force] knockback spread first||[Storm Winds] drop circle; [Overload] tank cooldowns; one dies the other [Frenzy]",
                ["mythic"] = "{rt8}Adderis and Aspix{rt8}||only hit the one with [Storm's Wrath] damage-reduction buff—the other is ineffective||[Lightning and Storm] group up to share; [Gale Force] knockback spread first||[Storm Winds] drop circle; [Overload] tank cooldowns; one dies the other [Frenzy]",
                ["mythicplus"] = "{rt8}Adderis and Aspix{rt8}||only hit the one with [Storm's Wrath] damage-reduction buff—the other is ineffective||[Lightning and Storm] group up to share; [Gale Force] knockback spread first||[Storm Winds] drop circle; [Overload] tank cooldowns; one dies the other [Frenzy]",
            },
        },
        ["沙誓骑手"] = {
            type = "MOB",
            tips = "{rt8}Sandsworn Rider (key mob){rt8}||[Sand Sweep] frontal nature DoT, {rt1}interrupt{rt1}||immune to control, fight close to reduce random-target damage||",
        },
        ["加瓦兹特"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Galvazzt{rt8}||stand between boss and [Lightning Spire] to block the line, prevent it charging||don't block two layers in a row ([Conduit] vulnerability stacks); dodge [Induction] circle at feet||at full energy [Overload] damage buff / damage reduction",
                ["normal"] = "{rt8}Galvazzt{rt8}||stand between boss and [Lightning Spire] to block the line, prevent it charging||don't block two layers in a row ([Conduit] vulnerability stacks); dodge [Induction] circle at feet||at full energy [Overload] damage buff / damage reduction",
                ["heroic"] = "{rt8}Galvazzt{rt8}||stand between boss and [Lightning Spire] to block the line, prevent it charging||don't block two layers in a row ([Conduit] vulnerability stacks); dodge [Induction] circle at feet||at full energy [Overload] damage buff / damage reduction",
                ["mythic"] = "{rt8}Galvazzt{rt8}||stand between boss and [Lightning Spire] to block the line, prevent it charging||don't block two layers in a row ([Conduit] vulnerability stacks); dodge [Induction] circle at feet||at full energy [Overload] damage buff / damage reduction",
                ["mythicplus"] = "{rt8}Galvazzt{rt8}||stand between boss and [Lightning Spire] to block the line, prevent it charging||don't block two layers in a row ([Conduit] vulnerability stacks); dodge [Induction] circle at feet||at full energy [Overload] damage buff / damage reduction",
            },
        },
        ["信faithless征服者"] = {
            type = "MOB",
            tips = "{rt8}Faithless Conqueror (key mob){rt8}||[Mind Wandering] random target loses way, {rt1}interrupt{rt1} or dispel||will [Release Charge] buff teammates||",
        },
        ["塞塔里斯的化身"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Avatar of Sethralis{rt8}||{rt1}Corrupted Guardian{rt1} [Corrupting Life] priority interrupt / kill to prevent boss healing||when no stacks, heal the boss or use [Purifying Orb] to heal||[Lurking Curse] turns to frog dispel, [Toxic Breath] interrupt",
                ["normal"] = "{rt8}Avatar of Sethralis{rt8}||{rt1}Corrupted Guardian{rt1} [Corrupting Life] priority interrupt / kill to prevent boss healing||when no stacks, heal the boss or use [Purifying Orb] to heal||[Lurking Curse] turns to frog dispel, [Toxic Breath] interrupt",
                ["heroic"] = "{rt8}Avatar of Sethralis{rt8}||{rt1}Corrupted Guardian{rt1} [Corrupting Life] priority interrupt / kill to prevent boss healing||when no stacks, heal the boss or use [Purifying Orb] to heal||[Lurking Curse] turns to frog dispel, [Toxic Breath] interrupt",
                ["mythic"] = "{rt8}Avatar of Sethralis{rt8}||{rt1}Corrupted Guardian{rt1} [Corrupting Life] priority interrupt / kill to prevent boss healing||when no stacks, heal the boss or use [Purifying Orb] to heal||[Lurking Curse] turns to frog dispel, [Toxic Breath] interrupt",
                ["mythicplus"] = "{rt8}Avatar of Sethralis{rt8}||{rt1}Corrupted Guardian{rt1} [Corrupting Life] priority interrupt / kill to prevent boss healing||when no stacks, heal the boss or use [Purifying Orb] to heal||[Lurking Curse] turns to frog dispel, [Toxic Breath] interrupt",
            },
        },
        ["潜伏毒蛇"] = {
            type = "MOB",
            tips = "{rt8}Lurking Serpent (key mob){rt8}||stealth opener [Venom Fang] stun—break stealth first then control||[Venom Breath] random target damaged, can dispel poison||",
        },
    },
    ["阿塔达萨"] = {
        name = "Atal'Dazar",
        ["复活的迅猛龙"] = {
            type = "MOB",
            tips = "{rt8}Reanimated Raptor (key mob){rt8}||Rezan area swift raptor—tank holds||stay away from [Ancient Boneheap], the [Marked] marked kite away||",
        },
        ["亚兹玛"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Yazma{rt8}||[Echo of Shadows] dodge, with [Soul Cleave] debuff stay away from Yazma||{rt1}Soul Egg{rt1} spawns—must kill before reaching boss||tank cooldowns eat [Bone Piercer], mirror phase prioritize mirrors",
                ["normal"] = "{rt8}Yazma{rt8}||[Echo of Shadows] dodge, with [Soul Cleave] debuff stay away from Yazma||{rt1}Soul Egg{rt1} spawns—must kill before reaching boss||tank cooldowns eat [Bone Piercer], mirror phase prioritize mirrors",
                ["heroic"] = "{rt8}Yazma{rt8}||[Echo of Shadows] dodge, with [Soul Cleave] debuff stay away from Yazma||{rt1}Soul Egg{rt1} spawns—must kill before reaching boss||tank cooldowns eat [Bone Piercer], mirror phase prioritize mirrors",
                ["mythic"] = "{rt8}Yazma{rt8}||[Echo of Shadows] dodge, with [Soul Cleave] debuff stay away from Yazma||{rt1}Soul Egg{rt1} spawns—must kill before reaching boss||tank cooldowns eat [Bone Piercer], mirror phase prioritize mirrors",
                ["mythicplus"] = "{rt8}Yazma{rt8}||[Echo of Shadows] dodge, with [Soul Cleave] debuff stay away from Yazma||{rt1}Soul Egg{rt1} spawns—must kill before reaching boss||tank cooldowns eat [Bone Piercer], mirror phase prioritize mirrors",
            },
        },
        ["沃卡尔"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Vol'kaal{rt8}||3 {rt1}Reanimation Totems{rt1} must be killed simultaneously or [Revive] full health||dodge [Venom Leap] and ground [Poison Pool], [Haste Decay] phase move around||{rt1}Virulent Stench{rt1} interrupt (whole-group nature DoT)",
                ["normal"] = "{rt8}Vol'kaal{rt8}||3 {rt1}Reanimation Totems{rt1} must be killed simultaneously or [Revive] full health||dodge [Venom Leap] and ground [Poison Pool], [Haste Decay] phase move around||{rt1}Virulent Stench{rt1} interrupt (whole-group nature DoT)",
                ["heroic"] = "{rt8}Vol'kaal{rt8}||3 {rt1}Reanimation Totems{rt1} must be killed simultaneously or [Revive] full health||dodge [Venom Leap] and ground [Poison Pool], [Haste Decay] phase move around||{rt1}Virulent Stench{rt1} interrupt (whole-group nature DoT)",
                ["mythic"] = "{rt8}Vol'kaal{rt8}||3 {rt1}Reanimation Totems{rt1} must be killed simultaneously or [Revive] full health||dodge [Venom Leap] and ground [Poison Pool], [Haste Decay] phase move around||{rt1}Virulent Stench{rt1} interrupt (whole-group nature DoT)",
                ["mythicplus"] = "{rt8}Vol'kaal{rt8}||3 {rt1}Reanimation Totems{rt1} must be killed simultaneously or [Revive] full health||dodge [Venom Leap] and ground [Poison Pool], [Haste Decay] phase move around||{rt1}Virulent Stench{rt1} interrupt (whole-group nature DoT)",
            },
        },
        ["莱赞"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rezan{rt8}||[Aspect of Fear] use pillars for line of sight to dodge fear||[Marked] marked kite away from [Ancient Boneheap], [Devour] focus rescue||tank cooldowns eat [Serrated Teeth], protect summoned raptors",
                ["normal"] = "{rt8}Rezan{rt8}||[Aspect of Fear] use pillars for line of sight to dodge fear||[Marked] marked kite away from [Ancient Boneheap], [Devour] focus rescue||tank cooldowns eat [Serrated Teeth], protect summoned raptors",
                ["heroic"] = "{rt8}Rezan{rt8}||[Aspect of Fear] use pillars for line of sight to dodge fear||[Marked] marked kite away from [Ancient Boneheap], [Devour] focus rescue||tank cooldowns eat [Serrated Teeth], protect summoned raptors",
                ["mythic"] = "{rt8}Rezan{rt8}||[Aspect of Fear] use pillars for line of sight to dodge fear||[Marked] marked kite away from [Ancient Boneheap], [Devour] focus rescue||tank cooldowns eat [Serrated Teeth], protect summoned raptors",
                ["mythicplus"] = "{rt8}Rezan{rt8}||[Aspect of Fear] use pillars for line of sight to dodge fear||[Marked] marked kite away from [Ancient Boneheap], [Devour] focus rescue||tank cooldowns eat [Serrated Teeth], protect summoned raptors",
            },
        },
        ["黄金之灵"] = {
            type = "MOB",
            tips = "{rt8}Golden Spirit (key mob){rt8}||Alu'za area trash—will swallow [Tainted Blood] pool making boss heal||easily controlled, priority kill or stun / root to stop it eating pool||",
        },
        ["女祭司阿伦扎"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Princess Alunza{rt8}||stand at [Tainted Blood] pool edge, [Transfusion] cast instant step into blood to reflect damage to boss (else boss heals)||{rt1}Molten Gold{rt1} dispellable, tank cooldowns eat [Gilded Claw]||priority clear [Golden Spirit] to stop it swallowing the blood pool",
                ["normal"] = "{rt8}Princess Alunza{rt8}||stand at [Tainted Blood] pool edge, [Transfusion] cast instant step into blood to reflect damage to boss (else boss heals)||{rt1}Molten Gold{rt1} dispellable, tank cooldowns eat [Gilded Claw]||priority clear [Golden Spirit] to stop it swallowing the blood pool",
                ["heroic"] = "{rt8}Princess Alunza{rt8}||stand at [Tainted Blood] pool edge, [Transfusion] cast instant step into blood to reflect damage to boss (else boss heals)||{rt1}Molten Gold{rt1} dispellable, tank cooldowns eat [Gilded Claw]||priority clear [Golden Spirit] to stop it swallowing the blood pool",
                ["mythic"] = "{rt8}Princess Alunza{rt8}||stand at [Tainted Blood] pool edge, [Transfusion] cast instant step into blood to reflect damage to boss (else boss heals)||{rt1}Molten Gold{rt1} dispellable, tank cooldowns eat [Gilded Claw]||priority clear [Golden Spirit] to stop it swallowing the blood pool",
                ["mythicplus"] = "{rt8}Princess Alunza{rt8}||stand at [Tainted Blood] pool edge, [Transfusion] cast instant step into blood to reflect damage to boss (else boss heals)||{rt1}Molten Gold{rt1} dispellable, tank cooldowns eat [Gilded Claw]||priority clear [Golden Spirit] to stop it swallowing the blood pool",
            },
        },
    },
}
