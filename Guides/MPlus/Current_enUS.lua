-- ============================================================================
-- BossTips M+ 攻略翻译 —— enUS（按源每难度分别翻译/转换；五难度）
-- 按游戏设置/客户端语言显示；缺失首领自动回退简中。
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.mplus = addon.GuideData.translations.enUS.mplus or {}
addon.GuideData.translations.enUS.mplus["Current"] = {
    ["塞塔里斯神庙"] = {
        name = "Temple of Sethraliss",
        ["剧毒蝰蛇"] = {
            type = "MOB",
            name = "Venomous Viper",
            tips = [[{rt8}Venomous Viper{rt8}||[Venom Spray] targets a random player—interrupt to avoid stacking poison; [Cell Poison] use poison cleanse or damage reduction.||{rt1}Must interrupt: Venom Spray.{rt1}||Keep poison pools away from the group; healer watch targeted poison damage.]],
        },
        ["加瓦兹特"] = {
            type = "BOSS",
            name = "Galvazzt",
            tipsByDifficulty = {
                ["lfr"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
                ["normal"] = [[1. DPS (not the tank) soak the lightning-tower links to stack the physical-vulnerability debuff. || Tank: pull to the edge and kite in circles while dropping water.]],
                ["heroic"] = [[1. When the tower and boss are linked, DPS stand between them to soak the line; soaking stacks a physical-vulnerability debuff—don't let the tank soak. || 2. Dodge the water on the ground promptly.]],
                ["mythic"] = [[[Lightning Spire] spawns 3 each time; non-tank DPS stand between the boss and the spire to block the beam and stop it charging; [Shock]—the tank kites the boss along the edge. || {rt1}Must interrupt/burst: at full energy [Charged Burst] is nearly a wipe—all 3 beams every wave must be blocked.{rt1} || [Shock Field] lands—whole raid out of the circle; rotate beam-blocking (you take [Shock] vulnerability, don't block consecutively).]],
                ["mythicplus"] = [[{rt8}Galvazzt{rt8}||[Lightning Spire] spawns 3 each time; non-tank DPS stand between Boss and spire to block beams and stop charging; at full energy [Charged Burst] is near-wipe—all 3 beams must be blocked every wave||[Shock] tank kites Boss along the edge dropping water; [Shock Field] lands—everyone out of circle; rotate beam-soakers (take [Shock] vulnerability, don't soak twice)]],
            },
        },
        ["堕落的守护者"] = {
            type = "MOB",
            name = "Fallen Guardian",
            tips = [[{rt8}Fallen Guardian{rt8}||Immune to CC; [Earthstomp] is a 30-yard AoE + knockback—spread or hug the wall; [Shatter] the main tank soaks with damage reduction and takes increased damage.||{rt1}Must kill fast: uninterruptible; [Shatter] tank must pop DR.{rt1}||Focus fire; avoid hard-soaking when stacked with other big hits.]],
        },
        ["塞塔里斯的化身"] = {
            type = "BOSS",
            name = "Avatar of Sethraliss",
            tipsByDifficulty = {
                ["lfr"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
                ["normal"] = [[1. Healer sustains the central avatar; DPS collide with the dark orbs, healer must NOT. || 2. Prioritize the Corruptor; healer avoid the linked add. || Healer: focus on the avatar; do not collide with orbs.]],
                ["heroic"] = [[1. Goal: let the healer top the central avatar; after the Guardian dies, first dodge the big explosion circle, then when 3 dark orbs appear, 3 DPS each collide with one. || 2. When the Corruptor appears, prioritize burning it down; interrupt the Hexxer's cast; in P2 clear the healer-chasing adds.]],
                ["mythic"] = [[Two phases: first kill [Defiler] to lift the healing lock, then heal the Avatar's health to full to win; [Corrupted Life] orbs are soaked by DPS walking into them (drains healing/physical damage). || {rt1}Must interrupt/burst: [Twisted Hexxer] must interrupt [Flame Shock]; step on [Corruption Burst] orbs before they expire.{rt1} || [Fallen Guardian] [Corrupting Strike]—tank pops DR; [Faithless Tormenter] focus and keep away from healer; Tormenter <25% gets executed by the Avatar for a heal—keep it above 25% before finishing.]],
                ["mythicplus"] = [[{rt8}Avatar of Sethraliss{rt8}||Two phases: kill [Defiler] to lift healing lock, then heal the central Avatar to full to win; [Corrupted Life]/[Corruption Burst] orbs soaked by DPS walking in (healer don't)||[Twisted Hexxer] must interrupt [Flame Shock]; focus [Faithless Tormenter] and keep away from healer—below 25% the Avatar executes it for a heal, keep above 25% before finish||[Fallen Guardian] [Corrupting Strike] tank DR; in P2 clear the healer-chasing adds]],
            },
        },
        ["扭曲的妖术师"] = {
            type = "MOB",
            name = "Twisted Hexxer",
            tips = [[{rt8}Twisted Hexxer{rt8}||[Lurking Hex] marks a player, drops a circle then turns them into a frog—move out of the group and avoid [Hex Mud]; [Flame Shock] is interruptible.||{rt1}Must interrupt: Flame Shock.{rt1}||Immune to CC; dispel [Lurking Hex] before it expires to prevent the frog.]],
        },
        ["无信征服者"] = {
            type = "MOB",
            name = "Faithless Conqueror",
            tips = [[{rt8}Faithless Conqueror{rt8}||[Mind Disruption] randomly curses a player with confusion—interrupt or dispel to clear.||{rt1}Must interrupt: Mind Disruption.{rt1}||Watch healer pressure when stacked with [Shadow Lash].]],
        },
        ["无信折磨者"] = {
            type = "MOB",
            name = "Faithless Torturer",
            tips = [[{rt8}Faithless Torturer{rt8}||Focus fire; it locks onto a healer and stacks [Shadow Lash] to reduce healing—kill it fast and away from the healer.||{rt1}Must kill fast: burn the healer-locking torturer before the healing debuff stacks.{rt1}||Below 25% the avatar executes it for a heal—keep it above 25% before finishing.]],
        },
        ["流沙猎手"] = {
            type = "MOB",
            name = "Quicksand Hunter",
            tips = [[{rt8}Quicksand Hunter{rt8}||[Arrow Barrage] channels on a random target—use CC/interrupt to stop the damage; dodge [Sandblast Arrow] landing circles.||{rt1}Must interrupt/kill fast: stop [Arrow Barrage]'s channel with CC or interrupt.{rt1}||CC it before pulling to avoid barrage stacking with other damage.]],
        },
        ["米利克萨"] = {
            type = "BOSS",
            name = "Merektha",
            tipsByDifficulty = {
                ["lfr"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
                ["normal"] = [[1. If a teammate is coiled, prioritize killing the small snake / using CC to free them; drop the marked water at the edge. || 2. Dodge the underground dash crossing.]],
                ["heroic"] = [[1. When a teammate is coiled by a small snake, immediately swap and free them. || 2. After the boss burrows it spawns small snakes—kill them first and interrupt the toxin spit; dodge the boss's path as it crosses from the edge.]],
                ["mythic"] = [[[Lightning Bite]—tank pops DR; [Serpent's Coil] marks 2, group up and AoE-clear fast; [Thunder Breath] marked player drops circle outside; kill hatched [Venomous Viper]/[Storm Serpent] quickly. || {rt1}Must interrupt/burst: if someone is coiled, interrupt/stun to free them immediately; [Venom Spray] must be interrupted.{rt1} || [Viper Storm] knockback—dodge ground circles after; at full energy [Burrow] clears snakes and revives—tank drags [Storm Serpent] to the side into the [Storm Catalyst] pool.]],
                ["mythicplus"] = [[{rt8}Merektha{rt8}||[Serpentine Knot] roots 2 players—interrupt/stun to free and AoE them down fast; [Venom Spray] must interrupt, [Thundering Breath] move away to drop circle||Free teammates pinned by adds immediately; after [Burrow] kill hatched [Venomous Viper]/[Storm Adder], tank kites [Storm Adder] to edge for [Storm Catalyst] pool||[Lightning Bite] tank DR; after [Serpent Storm] knockback dodge ground circles, avoid Boss cross-path]],
            },
        },
        ["精华污染者"] = {
            type = "MOB",
            name = "Essence Purifier",
            tips = [[{rt8}Essence Purifier{rt8}||[Essence Interference] channels on the Devouring Eye—interrupt to preserve the eye-energy and open the door.||{rt1}Must interrupt: Essence Interference.{rt1}||Prioritize CC-kill; protect the player channeling the eye.]],
        },
        ["阿德里斯和阿斯匹克斯"] = {
            type = "BOSS",
            name = "Adderis and Aspix",
            tipsByDifficulty = {
                ["lfr"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
                ["normal"] = [[1. Only hit the one without the shield. || 2. After the wind boss knocks back, regroup and go to the lightning-melee spot to share the arc cleave; drop the white circle at the edge.]],
                ["heroic"] = [[1. The shield swaps back and forth between the two bosses—only hit the unshielded one. || 2. Before the wind boss knocks back, hug the wall; right after, immediately regroup to take the lightning boss's share; when a big circle appears under the lightning boss, leave it; when the wind circle is marked, drop it at the edge.]],
                ["mythic"] = [[[Storm Ward] rotates: only focus the unwarded one; after [Gale Force] knocks the whole raid back, quickly return to mid and share [Thunder and Lightning]; [Storm Breath] marks 2 to drop silence circles outside. || {rt1}Must interrupt/burst: after killing one, the other [Frenzy] speeds its cycle—need DR + burst.{rt1} || [Overload]—main tank pops DR; hug the wall so [Gale Force] doesn't fling you; don't stand in the silence pool.]],
                ["mythicplus"] = [[{rt8}Adderis and Aspix{rt8}||[Stormshield] shield rotates—focus only the unshielded one; killing one enrages the other with [Frenzy], need DR + burst||[Gale Force] knockback then regroup mid to split [Thunder and Lightning]; tank hug wall to avoid being flung||[Breath of Storms] marks 2 to drop silence zones outside—nobody stand in them]],
            },
        },
        ["风暴飞蛇"] = {
            type = "MOB",
            name = "Storm Viper",
            tips = [[{rt8}Storm Viper{rt8}||[Storm Catalyst] leaves a thunder pool—everyone get out; tank pops damage reduction during [Serpent's Storm Call] buff.||{rt1}Must interrupt: Storm Catalyst (leaves pool damage).{rt1}||Pull the snake to the edge or onto existing poison to reduce field clutter.]],
        },
    },
    ["夺目谷"] = {
        name = "The Blinding Vale",
        ["光明众花"] = {
            type = "BOSS",
            name = "Lightbloom Trinity",
            tipsByDifficulty = {
                ["lfr"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
                ["normal"] = [[1. Three bosses share health—AoE them all together; interrupt the light-sword. || 2. When the flowers are linked by light, stand into a flower to block the line; if you miss, it bombs the raid.]],
                ["heroic"] = [[1. Three bosses share health—just AoE them all together. || 2. Interrupt the light-sword; when the three flowers are linked by light, stand on the light line to block it; if you miss, it bombs the raid.]],
                ["mythic"] = [[Three bodies share health; [Bedrock Slam] → spawns 3 [Fertile Soil] circles → [Light-sowing Dash] passes through to plant → [Radiant Flower Beam] matures them. || {rt1}Someone must stand in the beam/circle to block light, or the flowers stack [Light Devour] (+15% damage per stack).{rt1} [Radiant Arrow] must be interrupted. || [Thorn Blade] marks you then [Thorn Fan] hits 15yd around for 3/sec—marked player first run out of the group. || Tank + 2 rush into the circle to block light first; [Radiant Arrow] must be interrupted; when marked by [Thorn Blade], spread then pop DR.]],
                ["mythicplus"] = [[{rt8}Lightbloom Trinity{rt8}||Three share hp—AoE all together; [Light Arrow]/[Radiant Slash] must interrupt||[Bedrock Crusher] spawns [Fertile Soil]/[Blinding Light Bloom] beams—someone must stand in the beam/circle to block light or the flower stacks [Light Devoured] (+15% dmg/stack); tank + 2 step into circle first||[Thornblade] marks then [Thornfan] hits 3x/sec—marked player run out before popping DR]],
            },
        },
        ["光耀播法者"] = {
            type = "MOB",
            name = "Radiant Caster",
            tips = [[{rt8}Radiant Caster{rt8}||{rt1}[Light Arrow Volley]—interrupt every time; at low blood it [Awakens the Grove] summoning nearby dormant lashers.{rt1}||Top interrupt priority raid-wide; at low blood CC+focus so it can't awaken the grove.]],
        },
        ["兹欧凯特"] = {
            type = "BOSS",
            name = "Zikket",
            tipsByDifficulty = {
                ["lfr"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
                ["normal"] = [[1. Adds spawn—swap and CC them; DPS eat the light orbs at the edge, don't let the boss eat them. || Tank: front-line spray clears add corpses; others don't stand on the line.]],
                ["heroic"] = [[1. Adds spawn—swap and interrupt first. || 2. When edge orbs fly toward the boss, DPS block them, don't let the boss eat; when the boss aims a line at the tank, others don't stand on the line.]],
                ["mythic"] = [[[Seeping Wood] raid-wide damage pulse throughout; [Awakened Bloom] summons [Lightborn Lashing]. || The lasher at 1% goes dormant and burrows—needs [Condensed Light] front beam to sweep the liquified [Radiant Resin] for permanent removal. || [Bloom Essence] orbs drift toward the boss: boss absorbs = [Fluorescent Burst] + shield (stacks); player catches = +damage/+heal. || {rt1}Orbs MUST all be caught, never let the boss eat them; press the lasher to dormant then finish with the beam.{rt1} || Catch all orbs and share evenly; after lasher dormant, beam finisher; drag the boss to the platform edge, don't smear resin in the center.]],
                ["mythicplus"] = [[{rt8}Zikket{rt8}||[Bloom Essence] orbs drift toward Boss—soak all, never let Boss eat them (else shield + Radiant Burst); [Awakened Bloom] summons [Bloom Lashes]—push to dormant then finish with [Focused Light] to clear [Luminous Resin]||[Sapwood] pulses raid-wide; pull Boss to platform edge so resin doesn't clutter center||Prioritize interrupting/stunning adds that spawn]],
            },
        },
        ["噬光鞭笞者"] = {
            type = "MOB",
            name = "Light-Devouring Lasher",
            tips = [[{rt8}Light-Devouring Lasher{rt8}||After gaining [Bloom Pollen] it gets a shield and is empowered.||Immediately switch to break the shield, then return to the main target.]],
        },
        ["圣光猎手伊库兹"] = {
            type = "BOSS",
            name = "Ikuzz the Light Hunter",
            tipsByDifficulty = {
                ["lfr"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
                ["normal"] = [[1. The line-marked player leads the boss over the thorns/roots to trample them. || 2. Others dodge thorns; don't get knocked back into danger by stomp.]],
                ["heroic"] = [[1. When the boss line-chases someone, the chased player leads it across the field thorns to clear them. || 2. Others dodge thorns; watch stomp knockback so you don't get pushed in.]],
                ["mythic"] = [[At full energy → [Bloodthirsty Gaze] locks 1 player and chases 10s; the chase crushes [Bloodthorn Roots] within 7yd. || [Verdant Stomp] knocks the whole raid back, roots sprout under everyone 4s later. || At 50% triggers [Lightfrenzy] (move speed +20%, holy pulse every 2s). || {rt1}Stepping on [Bloodthorn Roots] = rooted—kill them or use freedom effect; if caught = [Lacerate] + chewed stun 5s.{rt1} || The gazed player hugs the roots and runs, using the boss as a lawnmower; after stomp, cleave the roots underfoot; after 50% burst it down fast.]],
                ["mythicplus"] = [[{rt8}Ikuzz the Light Hunter{rt8}||At full energy [Bloodthirsty Gaze] locks 1 player for 10s; the hunted runs along [Bloodthorn Roots] using Boss like a lawnmower to crush them (stepping on = rooted); [Verdant Stomp] knocks back then grows roots under everyone—cleave the roots at your feet||At 50% [Lightfrenzied] spikes movement—burn it down; others dodge thorns and don't get stomped into danger]],
            },
        },
        ["护光者鲁伊亚"] = {
            type = "BOSS",
            name = "Light Warden Ruia",
            tipsByDifficulty = {
                ["lfr"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
                ["normal"] = [[1. Bird form: interrupt the cast; when 3 are marked by wind, spread to dodge the six-point wind. || 2. Bear form front cone: the marked player stand still, 3 spread don't overlap.]],
                ["heroic"] = [[1. Owlkin phase interrupt the cast; when 3 are marked by wind, separate from each other. || 2. At 70% it turns bear and marks 3 for a cone—3 spread so cones don't overlap; below 40% the split repeats these skills.]],
                ["mythic"] = [[Three phases: Owlkin (100-70) → Bear (70-40) → Hala'nir (below 40). || Owlkin: [Guard's Wrath] interruptible + [Holy Fire] marks 3 for 6s burn, on expiry spawns [Holy Fire Beam] (6s silence). || Bear: [Rending Claw] + [Shatter Strike] cone stacking vulnerability + [Savage Maul] bleed (removed only at full health). || {rt1}[Guard's Wrath] must be interrupted; the [Holy Fire Beam] damages non-casters in the area the instant it forms—the 3 marked spread out early.{rt1} || 3 players with Holy Fire stack together and retreat same direction on expiry; Bear form spread to eat the cone; bleed must be healed to full; below 40% is a hard healing check.]],
                ["mythicplus"] = [[{rt8}Light Warden Ruia{rt8}||Three phases: owl (100-70)→bear (70-40)→Halycon (below 40); [Guardian's Wrath] must interrupt||Owl [Holy Fire] marks 3 for 6s burn then spawns [Holy Fire Beam] (silence); marked 3 spread early, stack then leave same direction at expiry||Bear [Shatterstrike] cone stacks vulnerability, [Savage Maul] bleed must be healed full—3 players spread so cones don't overlap; below 40% is a hard heal check]],
            },
        },
        ["灌木潜行者"] = {
            type = "MOB",
            name = "Bramble Stalker",
            tips = [[{rt8}Bramble Stalker{rt8}||[Thornblade] marks a random target with heavy bleed (8s).||Focus heal / clear bleed / personal damage reduction.]],
        },
        ["疯长多头蛇"] = {
            type = "MOB",
            name = "Rampant Hydra",
            tips = [[{rt8}Rampant Hydra{rt8}||Immune to CC.||[Lightjaw Beam] channels 3 random targets (line hurts allies); [Seed Volley] line marks.||Three spread outward so the beam doesn't cross allies; use vanish/shadowmeld to drop combat and avoid it; dodge lines.]],
        },
        ["翠绿林地守卫"] = {
            type = "MOB",
            name = "Verdant Grove Guardian",
            tips = [[{rt8}Verdant Grove Guardian{rt8}||Immune to CC.||[Earthrend] marks the tank leaving a puddle; [Uproot] AoE heavy hit + knockback.||Tank drops the puddle outside the group; don't stand near cliffs/roots before the knockback.]],
        },
        ["薯蛙母"] = {
            type = "MOB",
            name = "Taro Frogmother",
            tips = [[{rt8}Taro Frogmother{rt8}||Immune to CC.||[Tongue Toss] flings the tank (terrain-kill risk); [Venom Spit] raid poison DoT; [Lay Eggs] hatches [Newtlings] (knockback).||Tank stay away from platform edge when tossed; healer dispel poison; AoE the eggs instantly so they don't hatch.]],
        },
        ["迷乱尖啸者"] = {
            type = "MOB",
            name = "Maddening Shrieker",
            tips = [[{rt8}Maddening Shrieker{rt8}||{rt1}[Maddening Screech]—interrupt every time (group confuse).{rt1}||Assign a fixed interrupt, offset from Light Arrow Volley.]],
        },
    },
    ["密谋小径"] = {
        name = "Murder Row",
        ["亵渎魔像"] = {
            type = "MOB",
            name = "Defiled Golem",
            tips = [[{rt8}Defiled Golem{rt8}||Immune to CC.||{rt1}[Profane Smash] is a heavy channel—healer pre-cast.{rt1}||[Fel Beam] fires a line at each player leaving a puddle—dodge.||Found before the last boss; tank eats the smash with DR, raid dodges fel beams.]],
        },
        ["凯斯媞亚·魔力之心"] = {
            type = "BOSS",
            name = "Kystia Manaheart",
            tipsByDifficulty = {
                ["lfr"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
                ["normal"] = [[1. Mainly hit the whelp [Chomp]; at ~20% it turns to light form and the boss becomes unstable (vulnerability window). || 2. Interrupt/CC the mirror's cast; dodge Chomp's cone splash.]],
                ["heroic"] = [[1. Open on Chomp; after the boss's clone appears, interrupt the clone's cast. || 2. Chomp at 20% breaks the boss's shield—then swap to the boss and pop cooldowns.]],
                ["mythic"] = [[Open by focusing the pet mana whelp [Chomp], push it below 20%—it then crowd-controls the boss and gives her 100% vulnerability; burn the boss hard. || {rt1}Must interrupt: the mirror's [Felstorm] and [Chaos Bolt] (top priority).{rt1} || [Fel Nova] step on it; the whelp's [Fel Spew] frontal cone—tank face it away from the group. || Tank: when the whelp is hostile, swap then return; watch the whelp's extra damage + bounce on entry. || Push the pet to trigger the vulnerability window, interrupt the mirror, face the whelp's cone away, step on Fel Nova.]],
                ["mythicplus"] = [[{rt8}Kystia Manaheart{rt8}||Open by focusing pet [Bitey]; below 20% it reverses control and applies 100% vulnerability—pop burn on Boss; [Fel Storm]/[Chaos Bolt] from mirror images must interrupt (top priority)||[Fel Nova] stomp; [Fel Breath] frontal cone—tank face away from group; when the drake turns hostile tank swap to it then back]],
            },
        },
        ["利希尔·烬怒"] = {
            type = "BOSS",
            name = "Lishir",
            tipsByDifficulty = {
                ["lfr"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
                ["normal"] = [[1. Chaos Bolt must be interrupted; Infernal fixates tank, kite it; hit whatever spawns, stack position. || 2. Boss opens a door with spreading circles; wait for the circle to form then click the door; kill adds before entering.]],
                ["heroic"] = [[1. Chaos Bolt must be interrupted; hounds and imps out—swap and CC imps. || 2. After boss blinks far away and opens a portal, click the portal to dodge when the spreading wave comes.]],
                ["mythic"] = [[An unkillable [Infernal] at the start fixates the tank (has an aura—tank pulls it away from the boss). || {rt1}Must interrupt: [Chaos Bolt] (random target, top priority); [Fel Eruption] uses idle interrupts/CC.{rt1} || [Demon Portal] teleport away → after [Cataclysm Wave] finishes, take the safe side door; [Burning Felflame] sustained pulse. || Chaos Bolt must be interrupted, Infernal pulled off the boss, portal safe-side to pass Cataclysm Wave, clear all adds before the wave to avoid +100% haste.]],
                ["mythicplus"] = [[{rt8}Lishir{rt8}||[Chaos Bolt] random target must interrupt (top priority); opening [Felhunter] fixates tank—tank separates it from Boss||[Demon Portal] teleports then [Cataclysmic Tide] casts—take the safe side door, clear trash before tide to avoid +100% haste||[Fel Blast] use spare interrupts; [Burning Fel] pulses—watch positioning]],
            },
        },
        ["希凡惩罚者"] = {
            type = "MOB",
            name = "Shivan Punisher",
            tips = [[{rt8}Shivan Punisher{rt8}||Immune to CC.||[Punishing Power] adds physical damage—tank beware; at 50% it triggers [Demoniac Frenzy] high pulse raid damage.||Dodge [Whirlwind] AoE; at 50% DPS burns it down before frenzy; tank pops DR.]],
        },
        ["歼灭者萨祖克斯"] = {
            type = "BOSS",
            name = "Xathuux the Annihilator",
            tipsByDifficulty = {
                ["lfr"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
                ["normal"] = [[1. Axe lands and keeps bombing the raid—immediately swap and kill it. || 2. During Demonic Frenzy the boss lays fire ground—kite along the edge. || Tank: pull to the edge for the water; side-step the Legion Strike cone.]],
                ["heroic"] = [[1. After boss throws the axe to the ground, it keeps bombing the raid—immediately swap and kill it. || 2. Dodge other abilities normally.]],
                ["mythic"] = [[Circle the round arena along the edge; [Fel Strike] front—tank face outward. || {rt1}Must interrupt/burst: [Battle Axe Throw] marks, then [Legion Battleaxe] spawns at the edge—immediately swap or AoE ramps up.{rt1} || [Fel Frenzy] phase: raid-wide slams + continuous [Burning Footsteps] fel puddles. || Tank kites slowly outward along the edge, using less than half the arena each time, save CDs to eat the vulnerability.]],
                ["mythicplus"] = [[{rt8}Xathuux the Annihilator{rt8}||[Axe Toss] marks then spawns [Legion Axes] at edge—burn immediately or AoE ramps (must-kill)||[Fel Strike] frontal—tank face out; during [Fel Frenzy] Boss leaves [Burning Stride] fel puddles—tank kites slowly along edge using less than half the room||Raid dodge landing zones, save DR for the damage amp]],
            },
        },
        ["腐化术士"] = {
            type = "MOB",
            name = "Corrupting Warlock",
            tips = [[{rt8}Corrupting Warlock{rt8}||Immune to CC.||{rt1}[Curse of Doom] random debuff (dispel or stack to share; a dead player summons a Doomguard).{rt1}||[Drain Life] marks a target—defend or drop combat.||Prioritize CC/interrupt on the doom bolt; dispel or share the curse promptly; before 50% it gains a Dark Pact shield—burn through it.]],
        },
        ["赞恩·刃悲"] = {
            type = "BOSS",
            name = "Zaen Bladesorrow",
            tipsByDifficulty = {
                ["lfr"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
                ["normal"] = [[1. Red-circle marked goes to bomb the green barrel; keep other barrels for blocking. || 2. Deadly Path line: each hides behind a different barrel to break line of sight.]],
                ["heroic"] = [[1. After barrels appear, use the next fire circle to bomb the green poison barrel. || 2. When red line marks you, each hides behind a different barrel—don't share one.]],
                ["mythic"] = [[Use [Forbidden Crate] as cover, [Same-day Delivery] throws barrels, [Fel-infused Crate] must be clipped by AoE to clear raid damage. || {rt1}Must interrupt: [Heartbreak Salve] (tank poison—detox/dispel); [Fire Bomb] marked needs crate-clipping to clear raid damage.{rt1} || [Serial Killing] each finds their own barrel to hide from bleed; [Kill-crazed Carnage] raid-wide AoE channel. || Use barrels as cover from Serial Killing, dispel Heartbreak Salve, clip crates to clear Fire Bomb raid damage.]],
                ["mythicplus"] = [[{rt8}Zaen Bladesorrow{rt8}||[Heartstopper Poison] tanks poison—dispel; [Flame Bomb] marked players touch [Fel-Infused Crates] to clear raid damage||[Chain Crime]/[Deadly Path] lines—each player hide behind a different crate as cover; [Killing Spree] is a raid-wide channel, pop DR||Use crates as cover, don't share one]],
            },
        },
        ["酒馆打卡(五星级好评)"] = {
            type = "MOB",
            name = "Tavern Check-in (Five-Star Review)",
            tips = [[{rt8}Tavern Check-in (Five-Star Review){rt8}||Forced event after boss 1: the 5-man disguises and climbs the spire; the whole group talks to Selenar to trigger it.||Each gets a random role (waiter/performer/cleaner/bodyguard); complete your role to fill the satisfaction meter to 5 stars.||The group gains [Five-Star Review] buff (+10% damage/healing ~4 min).||During it, [Harsh Review] casts spawn—any CC/interrupt makes them vanish; the route takes ~4 min.]],
        },
    },
    ["毒牙祭坛"] = {
        name = "Altar of Fangs",
        ["乌拉泰克的选民"] = {
            type = "MOB",
            name = "Chosen of Ulataq",
            tips = [[{rt8}Chosen of Ulataq{rt8}||When [Venom Surge] draws lines, dodge them and the healer covers the pulse damage; stay spread.||{rt1}Must interrupt/kill fast: [Mass Envenom]—interrupt every cast.{rt1}||Same-pack [Living Venom] explodes on death—stagger kills to give the healer breathing room.]],
        },
        ["仪式首领"] = {
            type = "MOB",
            name = "Ritual Leader",
            tips = [[{rt8}Ritual Leader{rt8}||Immune to CC; before engaging, destroy the Corrupted Mist totem to stop the [Unstable Totem] pulse; [Dissect] hits the tank—use a damage-reduction.||{rt1}Must interrupt/kill fast: [Blood Sacrifice] deals raid-wide damage and applies a heal absorb—pre-cast heals.{rt1}||Healer: watch the absorb shield; spell dispel is available.]],
        },
        ["原始毒蛇"] = {
            type = "MOB",
            name = "Primitive Serpent",
            tips = [[{rt8}Primitive Serpent{rt8}||Spread to avoid [Foul Spit] splash; keep range.||{rt1}Must interrupt/kill fast: [Piercing Shriek]—interrupt every cast.{rt1}||Watch the poison damage; melee stay out of the spit circle.]],
        },
        ["双牙掠夺者"] = {
            type = "MOB",
            name = "Twin-Fang Pillager",
            tips = [[{rt8}Twin-Fang Pillager{rt8}||Immune to CC; tank turns its front [Venom Breath] away from the group and soaks [Double Strike]'s heavy hit; [Deadly Shot] hits two players—magic dispel or freedom.||{rt1}Must interrupt/kill fast: no hard interrupt available.{rt1}||Stay spread to avoid breath hitting multiple; melee stand behind.]],
        },
        ["扭缠盘蛇"] = {
            type = "BOSS",
            name = "The Writhing Coil",
            tipsByDifficulty = {
                ["lfr"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
                ["normal"] = [[1. Divide the three consecutive toxin casts for interrupts. || 2. Whole raid run outward to snap the line; when the clone spawns, CC it; the chased player kites, don't get bitten.]],
                ["heroic"] = [[1. P1 all three consecutive toxin casts must be interrupted. || 2. When the whole raid is pulled by the boss's line, run outward to snap it; P2 AoE the five small adds together, interrupt their casts, the chased player keeps running so it doesn't bite.]],
                ["mythic"] = [[On [Death Rattle] everyone moves to snap the [Vine Binding] and trigger [Uncoil], then focus the [Uncoiled Serpent] mirror; dodge [Burrow Charge] lines on [Vengeful Onslaught], keep [Venom Spray] frontal away from the group. || {rt1}Must interrupt/burst: [Withering Toxify] three consecutive casts—must interrupt.{rt1} || Tank soaks [Tail Blade]; healer sustains [Synchronized Venom] uptime and [Death Rattle] stacks.]],
                ["mythicplus"] = [=[{rt8}The Writhing Coil{rt8}||[Withering Venom] casts 3 in a row—assign interrupts; during [Death Rattle] everyone run out to snap [Vine Bonds] triggering [Uncoiled], focus the [Uncoiled Serpent] image||[Revenge Rush] dodge [Burrow Charge] lines, keep [Venom Spray] frontal away from group; kited player don't get bitten||Tank takes [Tail Blade]; healer cover [Synchronized Venom] stacking with [Death Rattle]]=],
            },
        },
        ["拉维"] = {
            type = "BOSS",
            name = "Rav'i",
            tipsByDifficulty = {
                ["lfr"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
                ["normal"] = [[1. When boss eats, take the green circle and break the shield fast; normally dodge falling rocks and big circles. || Tank: pull next to a food pile with no whelps/fresh meat, avoiding feeding frenzy.]],
                ["heroic"] = [[1. When boss charges the food pile, dodge the charge path; after it starts eating, take the circle and break the shield fast. || 2. Normally dodge falling rocks and the boss's big ground circle.]],
                ["mythic"] = [[Pull the boss away from the carrion pile; during [Scavenge] everyone stand in [Filthy Feaster] circles to break the shield fast; [Triple Shot] spread, dodge [Regurgitate] acid lines. || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank eats [Water Blast] in melee; healer watches [Carrion Burst] stacking; [Regurgitate] hit clears disease; don't let the boss eat fresh meat to trigger [Gluttony].]],
                ["mythicplus"] = [[{rt8}Rav'i{rt8}||Keep Boss away from carcass piles so it can't eat fresh meat and trigger [Gluttony]; during [Scavenge] everyone step in [Filthy Guests] to break shield fast||[Triple Shot] spread, dodge [Regurgitate] acid lines; tank takes [Water Smash] melee; healer watch [Carrion Burst] stacks||[Regurgitate] cleanses disease on hit; otherwise dodge rocks and big circles]],
            },
        },
        ["晋升之蛇"] = {
            type = "MOB",
            name = "Ascended Serpent",
            tips = [[{rt8}Ascended Serpent{rt8}||Immune to CC; [Infected]—spread, then group up for AoE after [Hatched Serpents] spawn; avoid the [Venom Vortex] wind ring and keep [Venom Spray]'s front cone away from the group.||{rt1}Must interrupt/kill fast: [Altar Edge]—random targeted, always dodge.{rt1}||Tank faces [Venom Spray]'s knockback outward; healer covers poison damage.]],
        },
        ["祖尔加"] = {
            type = "BOSS",
            name = "Zul'jan",
            tipsByDifficulty = {
                ["lfr"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
                ["normal"] = [[1. Block all snake-head beams (stack venom); pre-assign positions before pull. || 2. Bone-cleaver line shared by group to clear stacks—tank need not eat; dodge bouncing axes, put venom water at the edge.]],
                ["heroic"] = [[1. When boss and snake-head are linked, stand on the line to take venom stacks. || 2. After, when Bone-cleaver marks a line, at least 2 stand together to share and clear stacks; keep the venom water from cleaving at the edge; dodge bouncing axes.]],
                ["mythic"] = [[During [Fang Ritual] 4 players intercept the beams aimed at the boss to reduce damage; [Blood Sacrifice] clears [Ritual Venom] stacks via physical hits (stand in [Bone-cleaver] axe path to clear). || {rt1}Must interrupt/burst: no hard interrupt.{rt1} || Tank's [Sunder] with DR drops a blood pool; dodge [Bone-cleaver] axe path and [Axe-grinder]'s three returning axes; healer sustains [Fang Empower] stacks.]],
                ["mythicplus"] = [[{rt8}Zul'jan{rt8}||During [Fang Ritual] 4 players stand on the line between snake-heads and Boss to soak [Ritual Venom] stacks; [Blood Sacrifice] clear stacks via physical hits (stand in [Bone Cleaver] axe path)||Drop the poison water at the edge; dodge [Bone Cleaver] axe paths and [Axe Polisher]'s 3 thrown axes||Tank [Sundering] opens with DR and drops a blood pool; healer cover [Fang Empower] stacks]],
            },
        },
        ["高阶进化者"] = {
            type = "MOB",
            name = "High Evolutionary",
            tips = [[{rt8}High Evolutionary{rt8}||Dispel poison damage with poison dispel; if focus pressure is low, prioritize control.||{rt1}Must interrupt/kill fast: [Evolve]—interrupt the cast with CC, else [Envenom] becomes [Mass Envenom].{rt1}||[Envenom] is random—prioritize interrupts; healer be ready to dispel.]],
        },
    },
    ["红玉新生法池"] = {
        name = "Ruby Life Pools",
        ["基拉卡与厄克哈特·风脉"] = {
            type = "BOSS",
            name = "Kyrakka and Erkhart Stormvein",
            tipsByDifficulty = {
                ["lfr"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
                ["normal"] = [[1. Hit the humanoid first; dodge the dragon's cone fire breath; drop fire circles in open ground. || 2. When the humanoid casts [Stormbreak] stop casting; at ~40% dragon and human merge—keep handling these mechanics.]],
                ["heroic"] = [[1. P1 mainly hit the humanoid boss; dodge the dragon's cone breath; when fire circle marks, spread and drop in open ground; when humanoid casts Stormbreak don't keep casting. || 2. At 40% dragon+human fuse—keep handling these mechanics.]],
                ["mythic"] = [[Open by focusing the dragon [Ky'laka] and burning her down fast; position upwind to avoid being blown into fire. || {rt1}Must handle: [Infernal Core] raid damage—pop a big mitigation; [Storm Slam] vulnerability—healer dispel; [Roaring Breath] dodge the line.{rt1} || Wind push is weaker but don't step in fire pools; tank rotate DR.]],
                ["mythicplus"] = [[{rt8}Kyrakka and Erkhart Stormvein{rt8}||Open by bursting the dragon [Kil'ruk] down fast; position upwind to avoid being blown into fire||Humanoid [Eckhart] casting [Stormcrow Rain]—stop DPS; [Fel Fireblood Core] raid damage pop big DR, [Storm Strike] vulnerability dispel, [Roaring Breath] dodge line||Around 40% they merge—continue above, tanks rotate DR]],
            },
        },
        ["大引导者莱瓦迪"] = {
            type = "MOB",
            name = "Grand Conductor Rivazdi",
            tips = [[{rt8}Grand Conductor Rivazdi{rt8}||Door elite—must be killed to open the door; prioritize focus and interrupts.||{rt1}Must interrupt: high-threat casts (frost-channel type) don't miss.{rt1}||Raid-wide DR coverage; tank holds steady.]],
        },
        ["柯姬雅·焰蹄"] = {
            type = "BOSS",
            name = "Kokia Blazehoof",
            tipsByDifficulty = {
                ["lfr"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
                ["normal"] = [[1. Big fire circle spawns a fire elemental—immediately swap; before death leave the big red circle around it. || 2. Roll lava balls far away, dodge the path.]],
                ["heroic"] = [[1. Big fire-circle mark spawns a fire elemental—immediately swap; after the elemental dies, immediately leave the big red circle around it. || 2. The direction the boss aims rolls a big fireball—dodge the path and stay away from trees.]],
                ["mythic"] = [[At full energy casts [Rite Binding] summoning a fire elemental; circle the arena clockwise to control fire pools; when marked by [Lava Boulder] lead it away from the group. || {rt1}Must interrupt: the elemental's [Roaring Flame] or the whole raid wipes; must interrupt [Searing Impact].{rt1} || Tank pops DR on every [Searing Strike]; asteroids roll to open ground / stay 20yd from [Burning Out] before death.]],
                ["mythicplus"] = [=[{rt8}Kokia Blazehoof{rt8}||At full energy [Ritual Bond] summons fire elementals; [Roaring Flame] must interrupt or wipe, [Searing Strike] must interrupt||Control fire pools clockwise; [Lava Rock] marked lead away from group, meteor rolls to open space—stay 20yd from [Burning End] before death||Tank opens DR on each [Searing Strike]]=],
            },
        },
        ["梅莉杜莎·寒妆"] = {
            type = "BOSS",
            name = "Melidrussa Chillworn",
            tipsByDifficulty = {
                ["lfr"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
                ["normal"] = [[1. Dodge what spawns, hit what spawns; interrupt [Biting Frostbolt]. || 2. At 66%/33% a shield appears—prioritize breaking it and clear the small dragons; don't get pushed onto ice spikes by the tornado. || Healer: dispel tank's slow when wyrmlings spawn.]],
                ["heroic"] = [[1. [Biting Frostbolt] must be interrupted; at 66% and 33% the boss gets a shield—prioritize breaking it and AoE the small dragons. || 2. Normally dodge ice spikes; when the tornado's knockback ends don't get pushed onto ice spikes.]],
                ["mythic"] = [[Stack to share [Frost Bolt] and rotate around the arena; when marked by [Biting Frostwind] move away from the group to open ground. || {rt1}Must interrupt: [Frost Shard] (now interruptible) to reduce tank damage; at 66%/33% break [Frost Bulwark] and burst the charged wyrmling to prevent [Frostbite Overload].{rt1} || Healer prioritize dispel [Primal Cold] stacks.]],
                ["mythicplus"] = [[{rt8}Melidrussa Chillworn{rt8}||Stack to split [Frost Bolts] and rotate around the room; [Frigid Frostwind] marked run away from group to open space||[Frost Shard] must interrupt to reduce tank damage; at 66%/33% [Frost Barrier] spawns—break fast and kill the infused wyrmlings to prevent [Frost Overload]||Healer prioritize dispelling [Primordial Chill] stacks; dodge ice spikes, don't get knocked onto them by tornado]],
            },
        },
        ["毁灭唤风者"] = {
            type = "MOB",
            name = "Destructive Windcaller",
            tips = [[{rt8}Destructive Windcaller{rt8}||[Lightning Storm] raid-wide AoE—pop DR; interrupt or spell-reflect fast casts.||{rt1}Must interrupt: lightning/thunder casts.{rt1}||Hold aggro on summoned adds.]],
        },
        ["深石塑地者"] = {
            type = "MOB",
            name = "Deep Earthshaper",
            tips = [[{rt8}Deep Earthshaper{rt8}||Uninterruptible-channel [Earthsplitter] is a raid-wide AoE—stun or control it.||{rt1}Must interrupt/control: [Earthsplitter] hits 40 yards or wipes the raid.{rt1}||[Terraform] passively stacks a debuff; tank watch dragon eggs behind to avoid adds.]],
        },
        ["灰烬先知烈焰鞭笞者"] = {
            type = "MOB",
            name = "Ashen Prophet",
            tips = [[{rt8}Ashen Prophet{rt8}||[Flame Volley] channels and locks the tank—use control to interrupt the damage.||{rt1}Must control/dispel: on death it triggers [Flame Glory] leaving a fire circle—dispel or move away.{rt1}||]],
        },
        ["炎缚毁灭者"] = {
            type = "MOB",
            name = "Flamebound Destroyer",
            tips = [[{rt8}Flamebound Destroyer{rt8}||Immune to CC; leave the [Burnout] 20-yard explosion circle before it dies.||{rt1}Must interrupt: [Searing Strike]; walk away before [Living Bomb]'s knockback.{rt1}||[Infernal] raid-wide damage—tank pops DR.]],
        },
        ["烈焰之咽"] = {
            type = "MOB",
            name = "Flame Gullet",
            tips = [[{rt8}Flame Gullet{rt8}||Dodge [Flame Breath]'s front; tank pops DR for the [Flame Maw] DoT.||{rt1}Kill fast: below half health [Lava Blood] stacks make raid damage explode.{rt1}||Save cooldowns/bloodlust for after half health.]],
        },
        ["缚地守护者"] = {
            type = "MOB",
            name = "Grounding Guardian",
            tips = [[{rt8}Grounding Guardian{rt8}||[Grounding Brand] marks a random target—focus heal and cover with damage reduction.||{rt1}Must interrupt: don't miss its buff/control casts.{rt1}||Kill fast to reduce stacks.]],
        },
        ["闪霜织寒者"] = {
            type = "MOB",
            name = "Flashfrost Weaver",
            tips = [[{rt8}Flashfrost Weaver{rt8}||Ranged interrupt [Frostbolt] to protect the tank; prioritize CC-kill.||{rt1}Must interrupt/dispel: [Ice Barrier]—else the target is CC-immune and shielded.{rt1}||With the barrier up, focus fire under damage-reduction coverage.]],
        },
        ["雷霆之颅"] = {
            type = "MOB",
            name = "Thunderous Skull",
            tips = [[{rt8}Thunderous Skull{rt8}||Dodge [Storm Breath]'s front; tank pops DR against [Thunderous Bite]'s knockback.||{rt1}Must dispel correctly: [Rolling Thunder]—dispel only one stack; dispelling two at once wipes.{rt1}||]],
        },
    },
    ["纳洛拉克的洞穴"] = {
        name = "Den of Nalorakk",
        ["决意化身"] = {
            type = "MOB",
            name = "Resolute Avatar",
            tips = [[{rt8}Resolute Avatar{rt8}||Immune to CC.||[Frozen Tomb] roots the whole group—break it or use freedom; [Shatter] is a high-damage AoE.||Stay spread to avoid chained freezes; step out of Shatter circles immediately; use freedom/icebreak to clear the root.]],
        },
        ["囤宝狂人"] = {
            type = "BOSS",
            name = "The Hoardmonger",
            tipsByDifficulty = {
                ["lfr"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
                ["normal"] = [[1. Every green-circle mushroom needs someone to stomp it; miss one and it bombs the raid. || 2. Normally dodge the frontal cone and ground spikes.]],
                ["heroic"] = [[1. When boss drops mushrooms, every mushroom circle needs someone to stomp it; miss one and it bombs the raid. || 2. Normally dodge the boss's frontal cone and ground spikes.]],
                ["mythic"] = [[Tank stays center; [Resource Measures] empower skills at 90/70/40%. || {rt1}The mushroom pile [Rotting Mushroom] must be stomped within 12s or [Foul Eruption].{rt1} || Flesh pile → [Mighty Bellow] knockback + DoT raid heal; bone pile → [Bone Spike Smash] dodge circle; [Toxic Spores] dispel.]],
                ["mythicplus"] = [[{rt8}The Hoardmonger{rt8}||[Resource Measures] empowers abilities at 90/70/40%; [Rotten Mushrooms] must be stomped within 12s or [Foul Eruption] wipes group (every circle needs a stomper)||Flesh→[Mighty Bellow] knockback + DoT group heal; Bone→[Bonepike Maul] dodge circles; [Toxic Spores] dispel||Tank center, otherwise dodge frontal cone and ground spikes]],
            },
        },
        ["寒冬哨兵"] = {
            type = "BOSS",
            name = "Sentinel of Winter",
            tipsByDifficulty = {
                ["lfr"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
                ["normal"] = [[1. Group up to drop the wind, then drag it away; interrupt the add and soak the big white circle. || 2. On full-screen AoE, group and stand in the white circle/snow pile to resist knockback. || Tank: keep the boss near the white circle left by the dead add.]],
                ["heroic"] = [[1. After the blue circle lands, an add spawns — focus and interrupt it. || 2. After the add dies, soak the nearby white circle; during the blizzard stay near the boss and stand on the snow pile the add left to resist knockback.]],
                ["mythic"] = [[The floor is frozen and movement slides; [Ice Storm] is a fixed 8s channel — a 10-yard safe zone around the boss, absorb shield removed. || Spawns add [Shattering Coldcore] (only 1 shard); [Frost Torment] DoT needs fast dispel. || {rt1}Keep the spawned add's [Winter's Shroud] interrupted; [Raging Blizzard] group up and lure to one point then circle around.{rt1} || On the ice, group to draw the tornado, interrupt Winter's Shroud, hug the boss's safe zone during the 8s channel, someone soaks the shard.]],
                ["mythicplus"] = [[{rt8}Sentinel of Winter{rt8}||Floor is ice—movement slides; [Ice Storm] is a fixed 8s channel, 10yd around Boss is safe (hug Boss)||[Shattercold Core] spawns only 1 ice—keep [Winter's Veil] interrupted; [Frost Agony] DoT dispel fast||[Blizzard] group up to pull to a point then skirt around; on raid AoE step in white circles/snow to resist knockback]],
            },
        },
        ["寒冬暴雪"] = {
            type = "MOB",
            name = "Winter Blizzard",
            tips = [[{rt8}Winter Blizzard{rt8}||Immune to CC.||[Biting Blizzard] pulses until killed; [Winter Hall] pushes players.||Prioritize killing it to stop the zone blizzard; use snow-free cover to dodge the wind; snow mounds no longer cause slipping.]],
        },
        ["洛阿祭司娜妮娅"] = {
            type = "MOB",
            name = "Loa Priestess Naniyah",
            tips = [[{rt8}Loa Priestess Naniyah{rt8}||Immune to CC.||{rt1}[Lightning Bolt] random target—rotate interrupts; [Earthquake] two players drop circles; [Unstable Totem] persistent AoE.{rt1}||Keep the lightning-bolt interrupt chain; move out of Earthquake; kill the totem fast.]],
        },
        ["纳洛拉克"] = {
            type = "BOSS",
            name = "Nalorakk",
            tipsByDifficulty = {
                ["lfr"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
                ["normal"] = [[1. Group the green-circle phantoms and place them by the wall; stand inside when the NPC raises the shield. || 2. When phantoms turn red and charge the NPC, everyone body-blocks them. || Tank: eat the ground earth circles, share the NPC's damage.]],
                ["heroic"] = [[1. When 3 players are marked with the green circle, place the phantoms together in one corner. || 2. Stand inside when the NPC raises the DR circle; when phantoms turn red and charge the NPC, body-block them.]],
                ["mythic"] = [[Echoing Smash marks 3 players and after a delay spawns echoes (getting close gets you hit by ghost slashes). || [Overwhelming Assault] → Zul'garah jumps behind the tank and raises a shield; the whole raid stands behind it to take the 3-hit slam. || [Warlord's Wrath] → the whole raid forms a human wall around Zul'garah to block the echoes. || {rt1}Rotate-interrupt [Lightning Bolt], quickly kill [Unstable Totem]; interrupt [Chain Lightning].{rt1} || Drop echoes at the outer ring, whole raid behind the shield, human wall blocks the charge, tank faces away and doesn't step on the echo.]],
                ["mythicplus"] = [[{rt8}Nalorakk{rt8}||[Echoing Smash] marks 3 delayed echoes—drop mirages at outer edge/same corner, don't stand near or get ghost-slashed||[Overwhelming Assault] Zul'garath raises shield—group stands behind it for the 3 hits; [Warlord's Fury] group forms a wall to block echo charges||[Lightning Arrow] rotate interrupt, burst [Unstable Totem]; tank face away from echoes]],
            },
        },
        ["老练的战争使者"] = {
            type = "MOB",
            name = "Veteran Warbringer",
            tips = [[{rt8}Veteran Warbringer{rt8}||Immune to CC.||[Primordial Echo] raid-wide AoE; [Poison Spear Volley] ground circles (3s projectile).||Healer pop DR; dodge poison-spear circles; no hard CC.]],
        },
        ["饥荒雕像"] = {
            type = "MOB",
            name = "Famine Statue",
            tips = [[{rt8}Famine Statue{rt8}||Summoned by [Hungry Spirit], immune to CC.||Focus it on spawn or it repeatedly casts [Endless Hunger] (~5-6s cast applying a debuff).||Dispel the curse debuff; healer prepare for [Feast of Suffering] channel damage.]],
        },
    },
    ["虚空之痕竞技场"] = {
        name = "Voidscar Arena",
        ["吞噬暴虐者"] = {
            type = "MOB",
            name = "Devouring Tyrant",
            tips = [[{rt8}Devouring Tyrant{rt8}||[Devour] channels (longer cast time makes interrupting/saving easier); the devour mechanic instantly kills the swallowed target.||Must interrupt Devour or rescue the swallowed; grab the buff along the route.]],
        },
        ["塔兹拉尔"] = {
            type = "BOSS",
            name = "Taz'Rah",
            tipsByDifficulty = {
                ["lfr"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
                ["normal"] = [[1. Shadow-link mark: place it along the same wall side, don't overlap charge lanes. || 2. Dodge the permanent purple circles and scattered orbs.]],
                ["heroic"] = [[1. When shadow-link marks appear, the whole team aims the lines to the same side; the shade then charges along them — keep lanes from overlapping. || 2. Dodge the permanent purple circles and scattered orbs.]],
                ["mythic"] = [[S2 rework: [Dark Rift] mine — dodge with movement; [Void Tear] marked circle; [Void Shade] clone casts [Shadow Charge] (line instant-kill). || [Dark Rift] pulls players (dragged in on entry); [Cosmic Spike] tank-swap spike. || {rt1}[Shadow Charge] line instant-kill must be dodged; prioritize interrupting [Void Tear] channel.{rt1} || Clone's charge line is instant-kill — dodge; rift mines reposition; rift pulls break formation; tank-swap on spikes.]],
                ["mythicplus"] = [[{rt8}Taz'Rah{rt8}||[Void Mimic] clones cast [Shadow Charge] (line = instant kill)—dodge; [Dark Rift] mine field, entering pulls you in and breaks formation||[Void Tear] marked circle cast—prioritize interrupt; [Cosmic Spike] tank-swap||Shadow-line marks keep to one side so charge paths don't overlap; dodge permanent purple circles and stray orbs]],
            },
        },
        ["法术风暴拉杰克斯"] = {
            type = "MOB",
            name = "Spellstorm Rajaxx",
            tips = [[{rt8}Spellstorm Rajaxx{rt8}||[Disruption Orb] marks a player with a silence orb for 15s—lead it away from the group.||Multi-hit AoE spellstorm; on death grants the matching buff; the orb carrier stays 15s away from the group.]],
        },
        ["焦躁的虚镰"] = {
            type = "MOB",
            name = "Restless Void Scythe",
            tips = [[{rt8}Restless Void Scythe{rt8}||[Corrosive Essence] now hits only 2 players (was 5), a 12s corruption DoT—must dispel or avoid overlap.||Those corrupted spread for 12s, healer pre-casts; grab the matching arena buff along the route.]],
        },
        ["煞戎努斯"] = {
            type = "BOSS",
            name = "Charonus",
            tipsByDifficulty = {
                ["lfr"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
                ["normal"] = [[1. After the black hole appears don't get sucked to center; kite the orbed-marked target into the black hole to cancel it. || 2. Keep the purple circles under your feet apart; when marked by the six-shot orb beam keep moving.]],
                ["heroic"] = [[1. After the black hole appears, stand between the 3 black holes to resist the pull; when purple circles appear under everyone, spread apart. || 2. If the big orb chases you, lead it into a black hole; when the boss fires small orbs continuously, keep moving.]],
                ["mythic"] = [[[Unstable Singularity] gravity collapse sucks players in (don't get pulled to center = instant death); [Gravity Orb] + [Coalesced Mass]. || [Cosmic Smash] single-target mark; [Void Torrent] multi-hit; new [Dark Wave] dodge by repositioning. || {rt1}Interrupt [Cosmic Smash] marked cast and prioritize [Void Torrent] channel.{rt1} || Gravity collapse — don't get sucked to center, dodge Gravity Orb lines, reposition for the new Dark Wave, tank takes Coalesced Mass.]],
                ["mythicplus"] = [=[{rt8}Charonus{rt8}||[Unstable Singularity] gravity collapse pulls in—don't get sucked to center (stand between holes to resist); [Gravity Orb] kite into a hole to delete, dodge lines||[Cosmic Smash] marked cast, [Void Torrent] channel—prioritize interrupt; new [Dark Wave] dodge by movement||Spread your purple circles; tank takes [Aggregated Mass]]=],
            },
        },
        ["防护龟壳守卫"] = {
            type = "MOB",
            name = "Warding Turtle Guardian",
            tips = [[{rt8}Warding Turtle Guardian{rt8}||It channels a shield for a limited time; if the channel ends uninterrupted, it stuns itself and takes +10s increased damage (burn window).||Prioritize interrupting the channel to trigger the stun, then burst it down; one of the two new opening minibosses.]],
        },
        ["阿特洛苏斯"] = {
            type = "BOSS",
            name = "Atroxus",
            tipsByDifficulty = {
                ["lfr"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
                ["normal"] = [[1. The moment the add spawns, switch and burn it (it locks onto the tank). || 2. When the cone breath targets you, lead it away from the group; those not marked dodge it and don't stand in the poison pool.]],
                ["heroic"] = [[1. After the venom-snake add appears, immediately switch to it. || 2. When the boss's cone breath targets you, turn it away from the group; unmarked players dodge the cone; normally don't stand in the poison pool.]],
                ["mythic"] = [[[Venomous Breath] 4s frontal cast (tank faces it away from the group); [Toxic Aura] periodic -10% healing / periodic damage raid-wide. || [Bestial Roar] — the old stomp is now a roar with no knockback, summons [Venomous Crawler]. || [Massive Claw] knockback + DoT; [Venom Splatter] replaced by [Numbing Poison] (-30% haste, no damage). || Tank faces breath away; after the roar AoE down the crawlers fast; under Toxic Aura healing is reduced — pre-cast heals.]],
                ["mythicplus"] = [[{rt8}Atroxus{rt8}||[Toxic Spit] 4s frontal cast—tank face out; [Venom Aura] raid-wide -10% healing + periodic damage, healer pre-cast||[Savage Roar] now a roar (no knockback) summoning [Venom Crawlers]—AoE fast; [Massive Claw] knockback + DoT; [Numbing Poison] -30% haste||Burn adds immediately; if cone targets you, lead it away, don't stand in poison]],
            },
        },
        ["鲁莽监督者"] = {
            type = "MOB",
            name = "Reckless Overseer",
            tips = [[{rt8}Reckless Overseer{rt8}||[Brutal Smash] periodic damage -17% but still a heavy cleave/knockback.||Tank faces outward; raid DR during the smash; grab the matching buff.]],
        },
    },
    ["诸王之眠"] = {
        name = "King's Rest",
        ["始皇达萨"] = {
            type = "BOSS",
            name = "King Dazar",
            tipsByDifficulty = {
                ["lfr"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
                ["normal"] = [[1. Interrupt the small dragon's Deadly Roar; after 80% it mounts up, keep hitting the main body. || 2. After Gilded Destruction, immediately leave the landing spot; face the frontal cleave away from the group.]],
                ["heroic"] = [[1. Before 80% fight normally; interrupt the small dragon's roars on the field. || 2. After 80% the boss mounts, the two targets share damage, keep hitting the boss body; after Gilded Destruction immediately leave the earth circles that drop around the boss.]],
                ["mythic"] = [[[Earthshatter Leap] marks and leaps to a player — farther = less damage, so move away from the group when marked. || [Blade Combo] last two hits: tank pops DR; at 80% summons [Reban] — don't stand in front of the dragon; at 60% rides [Tizala] with [Eternal Guardian] damage redirect — must focus. || {rt1}Interrupt/dispel: [Deadly Roar] fear; [Impaling Spear] pins and stuns.{rt1} || At 40% [Spear Launcher] chases clockwise; move counterclockwise to jump the spears.]],
                ["mythicplus"] = [[{rt8}King Dazar{rt8}||[Earthshaking Leap] marks and jumps to players—marked run out and DR; [Blade Combo] last two hits tank DR||At 80% [Reban] spawns—don't stand in dragon front; at 60% mounts [Tizala] with [Eternal Guardian] damage transfer—focus||[Deadly Roar] fear must interrupt / [Impaling Spear] stun must dispel||At 40% [Spear Launcher] chases clockwise—move counterclockwise to jump spears; leave [Gilded Annihilation] landing zones immediately]],
            },
        },
        ["幻影萨满祭司"] = {
            type = "MOB",
            name = "Phantom Shaman",
            tips = [[{rt8}Phantom Shaman{rt8}||Prioritize interrupting casts; spread to avoid chain CC; mages don't steal its buff.||{rt1}Must interrupt: [Hex] (sheep)—dispel the target immediately after it lands.{rt1}||Melee watch controlled targets and cleanse them together with Zul's minions.]],
        },
        ["木乃伊"] = {
            type = "MOB",
            name = "Mummy",
            tips = [[{rt8}Mummy{rt8}||Both half-done and finished mummies cast [Wretched Eruption] (nature raid sickness); kill fast to reduce burden.||{rt1}Must interrupt: [Wretched Eruption] (12s party disease).{rt1}||Prioritize the finished mummies Mchimba summons from wrong coffins to avoid snowballing.]],
        },
        ["殓尸者姆沁巴"] = {
            type = "BOSS",
            name = "Mchimba the Embalmer",
            tipsByDifficulty = {
                ["lfr"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
                ["normal"] = [[1. Don't drop fire circles near the coffins; the small mummies must be interrupted. || 2. When buried, pound the coffin to signal; teammates open the correct coffin to rescue.]],
                ["heroic"] = [[1. When fire-circle marked, don't drop it near the coffins; the mummy's cast after spawning must be interrupted. || 2. If you get grabbed into a coffin, pound it to signal teammates; if a teammate is grabbed, find the pounded coffin and right-click to rescue.]],
                ["mythic"] = [[Healer keeps the [Drained Fluids] target topped; above 90% HP clears [Withered]; avoid the [Burning Decay] fire ground. || {rt1}Must interrupt: mummy [Wretched Eruption]; when [Buried], read the struggle hint and open the right coffin — rescue first, then clear mummies.{rt1} || Tank dodges fire ground; DPS quickly kills released mummies.]],
                ["mythicplus"] = [[{rt8}Mchimba the Embalmer{rt8}||Healer sustains [Drained] targets—above 90% hp lifts [Withered]; keep [Burning Decay] fire off coffin spots||Mummies [Wretched Eruption] must interrupt; [Buried] shows struggle prompt—open the right coffin, rescue first then clear mummies||Tank avoid fire, DPS burst released mummies]],
            },
        },
        ["活化守卫"] = {
            type = "MOB",
            name = "Animated Guardian",
            tips = [[{rt8}Animated Guardian{rt8}||Tank faces it away from the group; everyone attacks from the side/back to avoid the front [Suppressing Smash] cone stun.||{rt1}Watch: [Release Inhibitor] grants +75% attack speed—switch or stun during the cast.{rt1}||In 12.1 the entrance guards moved back; pull one at a time to avoid chained frontals.]],
        },
        ["祖尔的暗影"] = {
            type = "MOB",
            name = "Zul's Shadow",
            tips = [[{rt8}Zul's Shadow{rt8}||Tank eats [Shadow Barrage] (uninterruptible, non-stacking DoT); [Dark Revelation]—move away from allies and stand in a [Dark Pool] to avoid raid damage.||{rt1}Cleanse: the summoned Zul's minions' [Shadow Bind] must be dispelled/bubble broken instantly or it's fatal.{rt1}||In 12.1 there are 2 Dark Pools—two players permanently soak them.]],
        },
        ["祖尔的爪牙"] = {
            type = "MOB",
            name = "Zul's Minion",
            tips = [[{rt8}Zul's Minion{rt8}||[Shadow Bind] shield—cleanse/dispel magic kills it instantly, the fastest solution.||{rt1}Cleanse: [Shadow Bind]; on landing [Despairing Abyss] fears—dispel the healer.{rt1}||In 12.1 a new [Gaze] beam locks a target for 10s; the marked player creates distance.]],
        },
        ["部族议会"] = {
            type = "BOSS",
            name = "Council of Tribes",
            tipsByDifficulty = {
                ["lfr"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
                ["normal"] = [[1. Three bosses take turns on stage; dead ones still jump back to cast. || 2. Group for shared damage; interrupt Poison Nova; prioritize the Explosive Totem; dodge the axes.]],
                ["heroic"] = [[1. The three bosses rotate onto the stage; dead ones later return as spirit forms to keep casting. || 2. Group up for shared damage when it appears; dodge the whirling axes; after the Wise One summons totems, switch to the fire totem first.]],
                ["mythic"] = [[Spread out to avoid [Lightning Arc]/[Stampede]; tanks pop DR for [Enfeebling Backhand]; in the hallway kill the Healing Tide Totem first. || {rt1}Must interrupt: [Poison Nova]; quickly kill [Explosive Totem] (summoned by [Elemental Summoning], detonates whole raid on landing).{rt1} || [Whirling Axes] step out of melee; [Rending Axe] healer tops the blood.]],
                ["mythicplus"] = [[{rt8}Council of Tribes{rt8}||Spread to dodge [Lightning Arc]/[Charge]; tank DR on [Enfeebling Backhand]; in the hall kill Healing Tide Totem first||[Poison Nova] must interrupt; [Explosive Totem] ([Elemental Summon]) wipes on land—burst first||[Whirling Axes] step out of melee; dead bosses keep casting as spirits—stack when soak prompt appears]],
            },
        },
        ["黄金风蛇"] = {
            type = "BOSS",
            name = "The Golden Serpent",
            tipsByDifficulty = {
                ["lfr"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
                ["normal"] = [[1. The two players marked to spit gold try to stack their pools together. || 2. The moment the floor turns to ooze, switch and burn it; don't let the ooze touch the boss.]],
                ["heroic"] = [[1. When two are marked, group up and overlap the two floor pools as much as possible. || 2. After the floor becomes ooze, immediately switch and burn it; don't let the ooze reach the boss.]],
                ["mythic"] = [[Tank pulls away from the edge/gong; everyone avoid the [Spit Gold]/[Molten Gold] gold pools, walk around them as they crawl. || {rt1}Burst-kill: Living Gold ([Fortune's Summon] gold pool must be killed before it crawls back to the boss, else boss stacks shield + damage buff).{rt1} || [Serpent Tail Smash] tank pops DR; [Serpent Vortex] stay away from the cliff to avoid knockback.]],
                ["mythicplus"] = [[{rt8}The Golden Serpent{rt8}||[Fortune's Call] gold sludge crawls—kill the Animated Gold before it reaches Boss or Boss stacks shield + damage buff; avoid [Spit Gold]/[Molten Gold] puddles and their crawl paths||Two players spat on stack the puddles together; floor turning to slime—burn it before it touches Boss||Tank away from edges/gong; [Serpent Tail Smash] DR, [Serpent Gale] away from cliff to avoid knockback]],
            },
        },
    },
}
