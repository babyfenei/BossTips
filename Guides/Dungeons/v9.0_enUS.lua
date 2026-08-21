-- ============================================================================
-- BossTips 9.0 攻略翻译 —— enUS（按游戏设置/客户端语言显示；缺失首领自动回退简中）
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.native = addon.GuideData.translations.enUS.native or {}
addon.GuideData.translations.enUS.native["9.0"] = {
    ["凋魂之殇"] = {
        name = "Plaguefall",
        ["酤团"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gozu{rt8}||[Toxic Spray] frontal dodge; [Mucus Spray] marked drop at edge; [Wriggling Pustule] kill to explode—dodge poison circle; [Fungal Decay] step in circle to clear debuff||{rt1}Must interrupt / clear: none{rt1}||pustule kill don't leave; fungus circle step full to clear debuff; mucus drop outside",
                ["normal"] = "{rt8}Gozu{rt8}||[Toxic Spray] frontal dodge; [Mucus Spray] marked drop at edge; [Wriggling Pustule] kill to explode—dodge poison circle; [Fungal Decay] step in circle to clear debuff||{rt1}Must interrupt / clear: none{rt1}||pustule kill don't leave; fungus circle step full to clear debuff; mucus drop outside",
                ["heroic"] = "{rt8}Gozu{rt8}||[Toxic Spray] frontal dodge; [Mucus Spray] marked drop at edge; [Wriggling Pustule] kill to explode—dodge poison circle; [Fungal Decay] step in circle to clear debuff||{rt1}Must interrupt / clear: none{rt1}||pustule kill don't leave; fungus circle step full to clear debuff; mucus drop outside",
                ["mythic"] = "{rt8}Gozu{rt8}||[Toxic Spray] frontal dodge; [Mucus Spray] marked drop at edge; [Wriggling Pustule] kill to explode—dodge poison circle; [Fungal Decay] step in circle to clear debuff||{rt1}Must interrupt / clear: none{rt1}||pustule kill don't leave; fungus circle step full to clear debuff; mucus drop outside",
                ["mythicplus"] = "{rt8}Gozu{rt8}||[Toxic Spray] frontal dodge; [Mucus Spray] marked drop at edge; [Wriggling Pustule] kill to explode—dodge poison circle; [Fungal Decay] step in circle to clear debuff||{rt1}Must interrupt / clear: none{rt1}||pustule kill don't leave; fungus circle step full to clear debuff; mucus drop outside",
            },
        },
        ["伊库斯博士"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Dr. Ickus{rt8}||[Acid Spray] swap tank; [Specimen Rage] add enrage kill fast; [Viscous Secretion] pull to poison pool to clear; [Toxic Purge] step in poison pool for damage reduction||{rt1}Must interrupt / clear: none{rt1}||pull adds to poison pool step [Viscous Secretion]; fight in pool for damage reduction; swap-tank steady",
                ["normal"] = "{rt8}Dr. Ickus{rt8}||[Acid Spray] swap tank; [Specimen Rage] add enrage kill fast; [Viscous Secretion] pull to poison pool to clear; [Toxic Purge] step in poison pool for damage reduction||{rt1}Must interrupt / clear: none{rt1}||pull adds to poison pool step [Viscous Secretion]; fight in pool for damage reduction; swap-tank steady",
                ["heroic"] = "{rt8}Dr. Ickus{rt8}||[Acid Spray] swap tank; [Specimen Rage] add enrage kill fast; [Viscous Secretion] pull to poison pool to clear; [Toxic Purge] step in poison pool for damage reduction||{rt1}Must interrupt / clear: none{rt1}||pull adds to poison pool step [Viscous Secretion]; fight in pool for damage reduction; swap-tank steady",
                ["mythic"] = "{rt8}Dr. Ickus{rt8}||[Acid Spray] swap tank; [Specimen Rage] add enrage kill fast; [Viscous Secretion] pull to poison pool to clear; [Toxic Purge] step in poison pool for damage reduction||{rt1}Must interrupt / clear: none{rt1}||pull adds to poison pool step [Viscous Secretion]; fight in pool for damage reduction; swap-tank steady",
                ["mythicplus"] = "{rt8}Dr. Ickus{rt8}||[Acid Spray] swap tank; [Specimen Rage] add enrage kill fast; [Viscous Secretion] pull to poison pool to clear; [Toxic Purge] step in poison pool for damage reduction||{rt1}Must interrupt / clear: none{rt1}||pull adds to poison pool step [Viscous Secretion]; fight in pool for damage reduction; swap-tank steady",
            },
        },
        ["凋零培育者"] = {
            type = "MOB",
            tips = "{rt8}Withering Cultivator (key mob){rt8}||[Pustule Spray] cast interrupt; after death explodes [Poison Cloud] dodge away||{rt1}Must interrupt / clear: [Pustule Spray]{rt1}||after kill stay away from corpse to avoid poison cloud",
        },
        ["斯特拉达玛侯爵"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Marquis Stradama{rt8}||[Contagious Spores] marked drop at edge to explode; [Passive Infection] swap tank; [Plague Breath] frontal dodge; [Infectious Spit] circle dodge||{rt1}Must interrupt / clear: none{rt1}||spores drop outside explode; breath don't stand frontal; swap-tank rhythm",
                ["normal"] = "{rt8}Marquis Stradama{rt8}||[Contagious Spores] marked drop at edge to explode; [Passive Infection] swap tank; [Plague Breath] frontal dodge; [Infectious Spit] circle dodge||{rt1}Must interrupt / clear: none{rt1}||spores drop outside explode; breath don't stand frontal; swap-tank rhythm",
                ["heroic"] = "{rt8}Marquis Stradama{rt8}||[Contagious Spores] marked drop at edge to explode; [Passive Infection] swap tank; [Plague Breath] frontal dodge; [Infectious Spit] circle dodge||{rt1}Must interrupt / clear: none{rt1}||spores drop outside explode; breath don't stand frontal; swap-tank rhythm",
                ["mythic"] = "{rt8}Marquis Stradama{rt8}||[Contagious Spores] marked drop at edge to explode; [Passive Infection] swap tank; [Plague Breath] frontal dodge; [Infectious Spit] circle dodge||{rt1}Must interrupt / clear: none{rt1}||spores drop outside explode; breath don't stand frontal; swap-tank rhythm",
                ["mythicplus"] = "{rt8}Marquis Stradama{rt8}||[Contagious Spores] marked drop at edge to explode; [Passive Infection] swap tank; [Plague Breath] frontal dodge; [Infectious Spit] circle dodge||{rt1}Must interrupt / clear: none{rt1}||spores drop outside explode; breath don't stand frontal; swap-tank rhythm",
            },
        },
        ["多米娜·毒刃"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Domina Venomblade{rt8}||[Venom Spike] marked dodge the line; [Shadow Veil] invisible—use [Purification Potion] to reveal; [Venom Blade] dodge floor spikes; [Deadly Poison Dart] interrupt||{rt1}Must interrupt / clear: [Deadly Poison Dart]{rt1}||throw potion to reveal invisible boss; line person runs away; floor spikes reposition",
                ["normal"] = "{rt8}Domina Venomblade{rt8}||[Venom Spike] marked dodge the line; [Shadow Veil] invisible—use [Purification Potion] to reveal; [Venom Blade] dodge floor spikes; [Deadly Poison Dart] interrupt||{rt1}Must interrupt / clear: [Deadly Poison Dart]{rt1}||throw potion to reveal invisible boss; line person runs away; floor spikes reposition",
                ["heroic"] = "{rt8}Domina Venomblade{rt8}||[Venom Spike] marked dodge the line; [Shadow Veil] invisible—use [Purification Potion] to reveal; [Venom Blade] dodge floor spikes; [Deadly Poison Dart] interrupt||{rt1}Must interrupt / clear: [Deadly Poison Dart]{rt1}||throw potion to reveal invisible boss; line person runs away; floor spikes reposition",
                ["mythic"] = "{rt8}Domina Venomblade{rt8}||[Venom Spike] marked dodge the line; [Shadow Veil] invisible—use [Purification Potion] to reveal; [Venom Blade] dodge floor spikes; [Deadly Poison Dart] interrupt||{rt1}Must interrupt / clear: [Deadly Poison Dart]{rt1}||throw potion to reveal invisible boss; line person runs away; floor spikes reposition",
                ["mythicplus"] = "{rt8}Domina Venomblade{rt8}||[Venom Spike] marked dodge the line; [Shadow Veil] invisible—use [Purification Potion] to reveal; [Venom Blade] dodge floor spikes; [Deadly Poison Dart] interrupt||{rt1}Must interrupt / clear: [Deadly Poison Dart]{rt1}||throw potion to reveal invisible boss; line person runs away; floor spikes reposition",
            },
        },
    },
    ["伤逝剧场"] = {
        name = "Theater of Pain",
        ["剧场狂热者"] = {
            type = "MOB",
            tips = "{rt8}Theater Fanatic (key mob){rt8}||[Fanatical Slash] cast interrupt; [Inspire] buffs mobs—priority kill||{rt1}Must interrupt / clear: [Fanatical Slash]; priority kill [Inspire]{rt1}||kill the damage buff mob first to avoid sudden death",
        },
        ["血肉斩切者"] = {
            type = "MOB",
            tips = "{rt8}Flesh Carver{rt8}||[Meat Pile] marked drop at edge don't hit group; [Smash] swap tank; [Meat Hook] dodge hook; [Cleave] frontal dodge||{rt1}Must interrupt / clear: none{rt1}||meat pile drop outside; hook reposition; swap-tank steady",
        },
        ["库尔萨洛克"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Kur'salak{rt8}||[Drain Soul] marked run away to break; [Shadow Grip] pull away to break; [Soul Burst] dodge circle; [Wraith Strike] swap tank||{rt1}Must interrupt / clear: none{rt1}||drained run to break; burst circle dodge; swap-tank steady",
                ["normal"] = "{rt8}Kur'salak{rt8}||[Drain Soul] marked run away to break; [Shadow Grip] pull away to break; [Soul Burst] dodge circle; [Wraith Strike] swap tank||{rt1}Must interrupt / clear: none{rt1}||drained run to break; burst circle dodge; swap-tank steady",
                ["heroic"] = "{rt8}Kur'salak{rt8}||[Drain Soul] marked run away to break; [Shadow Grip] pull away to break; [Soul Burst] dodge circle; [Wraith Strike] swap tank||{rt1}Must interrupt / clear: none{rt1}||drained run to break; burst circle dodge; swap-tank steady",
                ["mythic"] = "{rt8}Kur'salak{rt8}||[Drain Soul] marked run away to break; [Shadow Grip] pull away to break; [Soul Burst] dodge circle; [Wraith Strike] swap tank||{rt1}Must interrupt / clear: none{rt1}||drained run to break; burst circle dodge; swap-tank steady",
                ["mythicplus"] = "{rt8}Kur'salak{rt8}||[Drain Soul] marked run away to break; [Shadow Grip] pull away to break; [Soul Burst] dodge circle; [Wraith Strike] swap tank||{rt1}Must interrupt / clear: none{rt1}||drained run to break; burst circle dodge; swap-tank steady",
            },
        },
        ["狭路相逢"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Narrow Escape{rt8}||three-person council (Decapitator Dexia / Plaguebringer Batheran / Cursed Celzir) kill one by one no shared health; [Smash][Killing Blow] hit tank need cooldowns; [Plague Arrow][Necro Arrow] cast interrupt; [Spectral Shift] line buffs mobs—attack dispel; [Searing Meteor] leave group||{rt1}Must interrupt / clear: [Plague Arrow], [Necro Arrow]{rt1}||Decapitator 40% enrage chases kite; Plaguebringer 40% whole-group disease; Cursed 40% invuln 1 min need break; focus current target",
                ["normal"] = "{rt8}Narrow Escape{rt8}||three-person council (Decapitator Dexia / Plaguebringer Batheran / Cursed Celzir) kill one by one no shared health; [Smash][Killing Blow] hit tank need cooldowns; [Plague Arrow][Necro Arrow] cast interrupt; [Spectral Shift] line buffs mobs—attack dispel; [Searing Meteor] leave group||{rt1}Must interrupt / clear: [Plague Arrow], [Necro Arrow]{rt1}||Decapitator 40% enrage chases kite; Plaguebringer 40% whole-group disease; Cursed 40% invuln 1 min need break; focus current target",
                ["heroic"] = "{rt8}Narrow Escape{rt8}||three-person council (Decapitator Dexia / Plaguebringer Batheran / Cursed Celzir) kill one by one no shared health; [Smash][Killing Blow] hit tank need cooldowns; [Plague Arrow][Necro Arrow] cast interrupt; [Spectral Shift] line buffs mobs—attack dispel; [Searing Meteor] leave group||{rt1}Must interrupt / clear: [Plague Arrow], [Necro Arrow]{rt1}||Decapitator 40% enrage chases kite; Plaguebringer 40% whole-group disease; Cursed 40% invuln 1 min need break; focus current target",
                ["mythic"] = "{rt8}Narrow Escape{rt8}||three-person council (Decapitator Dexia / Plaguebringer Batheran / Cursed Celzir) kill one by one no shared health; [Smash][Killing Blow] hit tank need cooldowns; [Plague Arrow][Necro Arrow] cast interrupt; [Spectral Shift] line buffs mobs—attack dispel; [Searing Meteor] leave group||{rt1}Must interrupt / clear: [Plague Arrow], [Necro Arrow]{rt1}||Decapitator 40% enrage chases kite; Plaguebringer 40% whole-group disease; Cursed 40% invuln 1 min need break; focus current target",
                ["mythicplus"] = "{rt8}Narrow Escape{rt8}||three-person council (Decapitator Dexia / Plaguebringer Batheran / Cursed Celzir) kill one by one no shared health; [Smash][Killing Blow] hit tank need cooldowns; [Plague Arrow][Necro Arrow] cast interrupt; [Spectral Shift] line buffs mobs—attack dispel; [Searing Meteor] leave group||{rt1}Must interrupt / clear: [Plague Arrow], [Necro Arrow]{rt1}||Decapitator 40% enrage chases kite; Plaguebringer 40% whole-group disease; Cursed 40% invuln 1 min need break; focus current target",
            },
        },
        ["无尽女皇莫德蕾莎"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Endless Empress Mordresha{rt8}||[Spinning Blade] dodge flying blade; [Shadow Spear] marked drop at edge; [Time Warp] dodge barrage; [Summon] clear adds fast; [Dark Portal] swap tank||{rt1}Must interrupt / clear: none{rt1}||flying blade circle; spear drop outside; adds quick AoE; swap-tank",
                ["normal"] = "{rt8}Endless Empress Mordresha{rt8}||[Spinning Blade] dodge flying blade; [Shadow Spear] marked drop at edge; [Time Warp] dodge barrage; [Summon] clear adds fast; [Dark Portal] swap tank||{rt1}Must interrupt / clear: none{rt1}||flying blade circle; spear drop outside; adds quick AoE; swap-tank",
                ["heroic"] = "{rt8}Endless Empress Mordresha{rt8}||[Spinning Blade] dodge flying blade; [Shadow Spear] marked drop at edge; [Time Warp] dodge barrage; [Summon] clear adds fast; [Dark Portal] swap tank||{rt1}Must interrupt / clear: none{rt1}||flying blade circle; spear drop outside; adds quick AoE; swap-tank",
                ["mythic"] = "{rt8}Endless Empress Mordresha{rt8}||[Spinning Blade] dodge flying blade; [Shadow Spear] marked drop at edge; [Time Warp] dodge barrage; [Summon] clear adds fast; [Dark Portal] swap tank||{rt1}Must interrupt / clear: none{rt1}||flying blade circle; spear drop outside; adds quick AoE; swap-tank",
                ["mythicplus"] = "{rt8}Endless Empress Mordresha{rt8}||[Spinning Blade] dodge flying blade; [Shadow Spear] marked drop at edge; [Time Warp] dodge barrage; [Summon] clear adds fast; [Dark Portal] swap tank||{rt1}Must interrupt / clear: none{rt1}||flying blade circle; spear drop outside; adds quick AoE; swap-tank",
            },
        },
        ["无堕者哈夫"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Hauf the Unfallen{rt8}||[Oppressive Warbanner] every 3s stacks 15% slow—must switch to it and kill immediately; [Maldraxxus Might] jump center random three-hit ([Group Cleave] frontal fan / [Crushing Smash] frontal line / [Thunderous Ring] around AoE and interrupt), staying behind boss safest; [Blood and Glory] marks 2 DPS thrown into duel||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Cruel Combo] tank cooldowns; banner not cleared → can't outrun the combo; the two downed players pre-agree who wins (winner +10% dmg, loser -10%)",
                ["normal"] = "{rt8}Hauf the Unfallen{rt8}||[Oppressive Warbanner] every 3s stacks 15% slow—must switch to it and kill immediately; [Maldraxxus Might] jump center random three-hit ([Group Cleave] frontal fan / [Crushing Smash] frontal line / [Thunderous Ring] around AoE and interrupt), staying behind boss safest; [Blood and Glory] marks 2 DPS thrown into duel||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Cruel Combo] tank cooldowns; banner not cleared → can't outrun the combo; the two downed players pre-agree who wins (winner +10% dmg, loser -10%)",
                ["heroic"] = "{rt8}Hauf the Unfallen{rt8}||[Oppressive Warbanner] every 3s stacks 15% slow—must switch to it and kill immediately; [Maldraxxus Might] jump center random three-hit ([Group Cleave] frontal fan / [Crushing Smash] frontal line / [Thunderous Ring] around AoE and interrupt), staying behind boss safest; [Blood and Glory] marks 2 DPS thrown into duel||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Cruel Combo] tank cooldowns; banner not cleared → can't outrun the combo; the two downed players pre-agree who wins (winner +10% dmg, loser -10%)",
                ["mythic"] = "{rt8}Hauf the Unfallen{rt8}||[Oppressive Warbanner] every 3s stacks 15% slow—must switch to it and kill immediately; [Maldraxxus Might] jump center random three-hit ([Group Cleave] frontal fan / [Crushing Smash] frontal line / [Thunderous Ring] around AoE and interrupt), staying behind boss safest; [Blood and Glory] marks 2 DPS thrown into duel||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Cruel Combo] tank cooldowns; banner not cleared → can't outrun the combo; the two downed players pre-agree who wins (winner +10% dmg, loser -10%)",
                ["mythicplus"] = "{rt8}Hauf the Unfallen{rt8}||[Oppressive Warbanner] every 3s stacks 15% slow—must switch to it and kill immediately; [Maldraxxus Might] jump center random three-hit ([Group Cleave] frontal fan / [Crushing Smash] frontal line / [Thunderous Ring] around AoE and interrupt), staying behind boss safest; [Blood and Glory] marks 2 DPS thrown into duel||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Cruel Combo] tank cooldowns; banner not cleared → can't outrun the combo; the two downed players pre-agree who wins (winner +10% dmg, loser -10%)",
            },
        },
        ["斩血"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Bloodchop{rt8}||[Meat Hook] lowers and sweeps the field—exit through gap to dodge stun and [Jagged Wound]; [Soft Flesh Smash] pulls all toward boss then slams, hug boss to avoid pull; [Leaking Remains] after death leaves [Solidified Sludge] poison pool slow||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Hatred Strike] hits tank cooldowns; small mobs die in one spot to avoid spreading pool; hook leaves gap—pre-position",
                ["normal"] = "{rt8}Bloodchop{rt8}||[Meat Hook] lowers and sweeps the field—exit through gap to dodge stun and [Jagged Wound]; [Soft Flesh Smash] pulls all toward boss then slams, hug boss to avoid pull; [Leaking Remains] after death leaves [Solidified Sludge] poison pool slow||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Hatred Strike] hits tank cooldowns; small mobs die in one spot to avoid spreading pool; hook leaves gap—pre-position",
                ["heroic"] = "{rt8}Bloodchop{rt8}||[Meat Hook] lowers and sweeps the field—exit through gap to dodge stun and [Jagged Wound]; [Soft Flesh Smash] pulls all toward boss then slams, hug boss to avoid pull; [Leaking Remains] after death leaves [Solidified Sludge] poison pool slow||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Hatred Strike] hits tank cooldowns; small mobs die in one spot to avoid spreading pool; hook leaves gap—pre-position",
                ["mythic"] = "{rt8}Bloodchop{rt8}||[Meat Hook] lowers and sweeps the field—exit through gap to dodge stun and [Jagged Wound]; [Soft Flesh Smash] pulls all toward boss then slams, hug boss to avoid pull; [Leaking Remains] after death leaves [Solidified Sludge] poison pool slow||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Hatred Strike] hits tank cooldowns; small mobs die in one spot to avoid spreading pool; hook leaves gap—pre-position",
                ["mythicplus"] = "{rt8}Bloodchop{rt8}||[Meat Hook] lowers and sweeps the field—exit through gap to dodge stun and [Jagged Wound]; [Soft Flesh Smash] pulls all toward boss then slams, hug boss to avoid pull; [Leaking Remains] after death leaves [Solidified Sludge] poison pool slow||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Hatred Strike] hits tank cooldowns; small mobs die in one spot to avoid spreading pool; hook leaves gap—pre-position",
            },
        },
        ["不败者萨弗"] = {
            type = "MOB",
            tips = "{rt8}Invincible Saf{rt8}||[Decapitation] swap tank; [Whirlwind] dodge whirlwind; [Thrown Glaive] dodge flying glaive; [Enrage] low health cooldowns||{rt1}Must interrupt / clear: none{rt1}||whirlwind go around back; glaive clear path; decapitation swap-tank",
        },
    },
    ["赤红深渊"] = {
        name = "Sanguine Depths",
        ["首席管理者加弗林"] = {
            type = "MOB",
            tips = "{rt8}Chief Administrator Gelvin (key mob){rt8}||[Bonk] cast must interrupt or stun; [Suppress] damage reduction||{rt1}Must interrupt / clear: [Bonk]{rt1}||high-priority interrupt to avoid group stun",
        },
        ["贪食的蛮兵"] = {
            type = "MOB",
            tips = "{rt8}Gluttonous Brute (key mob){rt8}||[Shadow Smash] cast must interrupt or whole-group AoE; [Digest] swap tank||{rt1}Must interrupt / clear: [Shadow Smash]{rt1}||prioritize interrupting smash to protect group",
        },
        ["大学监贝律莉娅"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Grand Proctor Beryllia{rt8}||[Lash] swap tank; [Suffering Embrace] marked circle dodge; [Searing Chains] two players close to burn break; [Purify] dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||chains two players close to break; marked away; full-screen reposition",
                ["normal"] = "{rt8}Grand Proctor Beryllia{rt8}||[Lash] swap tank; [Suffering Embrace] marked circle dodge; [Searing Chains] two players close to burn break; [Purify] dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||chains two players close to break; marked away; full-screen reposition",
                ["heroic"] = "{rt8}Grand Proctor Beryllia{rt8}||[Lash] swap tank; [Suffering Embrace] marked circle dodge; [Searing Chains] two players close to burn break; [Purify] dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||chains two players close to break; marked away; full-screen reposition",
                ["mythic"] = "{rt8}Grand Proctor Beryllia{rt8}||[Lash] swap tank; [Suffering Embrace] marked circle dodge; [Searing Chains] two players close to burn break; [Purify] dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||chains two players close to break; marked away; full-screen reposition",
                ["mythicplus"] = "{rt8}Grand Proctor Beryllia{rt8}||[Lash] swap tank; [Suffering Embrace] marked circle dodge; [Searing Chains] two players close to burn break; [Purify] dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||chains two players close to break; marked away; full-screen reposition",
            },
        },
        ["贪食的克里克西斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Gluttonous Crixxa{rt8}||[Digestive Fluid] swap tank; [Engorge] marked drop at edge; [Gush] frontal dodge; [Ravenous] enter red circle dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||engorge drop outside; full-screen enter red circle; breath dodge frontal",
                ["normal"] = "{rt8}Gluttonous Crixxa{rt8}||[Digestive Fluid] swap tank; [Engorge] marked drop at edge; [Gush] frontal dodge; [Ravenous] enter red circle dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||engorge drop outside; full-screen enter red circle; breath dodge frontal",
                ["heroic"] = "{rt8}Gluttonous Crixxa{rt8}||[Digestive Fluid] swap tank; [Engorge] marked drop at edge; [Gush] frontal dodge; [Ravenous] enter red circle dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||engorge drop outside; full-screen enter red circle; breath dodge frontal",
                ["mythic"] = "{rt8}Gluttonous Crixxa{rt8}||[Digestive Fluid] swap tank; [Engorge] marked drop at edge; [Gush] frontal dodge; [Ravenous] enter red circle dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||engorge drop outside; full-screen enter red circle; breath dodge frontal",
                ["mythicplus"] = "{rt8}Gluttonous Crixxa{rt8}||[Digestive Fluid] swap tank; [Engorge] marked drop at edge; [Gush] frontal dodge; [Ravenous] enter red circle dodge full-screen||{rt1}Must interrupt / clear: none{rt1}||engorge drop outside; full-screen enter red circle; breath dodge frontal",
            },
        },
        ["执行者塔沃德"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Executor Tarvold{rt8}||[Torment] marked circle dodge; [Drain Life] cast interrupt; [Pummel] swap tank; [Chain] pull away to break||{rt1}Must interrupt / clear: [Drain Life]{rt1}||marked group up to share; chain break; swap-tank steady",
                ["normal"] = "{rt8}Executor Tarvold{rt8}||[Torment] marked circle dodge; [Drain Life] cast interrupt; [Pummel] swap tank; [Chain] pull away to break||{rt1}Must interrupt / clear: [Drain Life]{rt1}||marked group up to share; chain break; swap-tank steady",
                ["heroic"] = "{rt8}Executor Tarvold{rt8}||[Torment] marked circle dodge; [Drain Life] cast interrupt; [Pummel] swap tank; [Chain] pull away to break||{rt1}Must interrupt / clear: [Drain Life]{rt1}||marked group up to share; chain break; swap-tank steady",
                ["mythic"] = "{rt8}Executor Tarvold{rt8}||[Torment] marked circle dodge; [Drain Life] cast interrupt; [Pummel] swap tank; [Chain] pull away to break||{rt1}Must interrupt / clear: [Drain Life]{rt1}||marked group up to share; chain break; swap-tank steady",
                ["mythicplus"] = "{rt8}Executor Tarvold{rt8}||[Torment] marked circle dodge; [Drain Life] cast interrupt; [Pummel] swap tank; [Chain] pull away to break||{rt1}Must interrupt / clear: [Drain Life]{rt1}||marked group up to share; chain break; swap-tank steady",
            },
        },
        ["大监督者"] = {
            type = "MOB",
            tips = "{rt8}Grand Overseer (key mob){rt8}||[Oppressive Might] buffs mobs—priority kill; [Overcharged] cast interrupt||{rt1}Must interrupt / clear: [Overcharged]; priority kill [Oppressive Might]{rt1}||kill the damage-reduction mob first to avoid wipe",
        },
        ["卡尔将军"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}General Kaal{rt8}||[Crushing Strike] swap tank; [Shadow Blade] marked drop at edge; [Unordered Strike] dodge barrage; [Endless Anguish] focus adds||{rt1}Must interrupt / clear: none{rt1}||shadow blade drop outside; barrage reposition; summoned adds kill fast",
                ["normal"] = "{rt8}General Kaal{rt8}||[Crushing Strike] swap tank; [Shadow Blade] marked drop at edge; [Unordered Strike] dodge barrage; [Endless Anguish] focus adds||{rt1}Must interrupt / clear: none{rt1}||shadow blade drop outside; barrage reposition; summoned adds kill fast",
                ["heroic"] = "{rt8}General Kaal{rt8}||[Crushing Strike] swap tank; [Shadow Blade] marked drop at edge; [Unordered Strike] dodge barrage; [Endless Anguish] focus adds||{rt1}Must interrupt / clear: none{rt1}||shadow blade drop outside; barrage reposition; summoned adds kill fast",
                ["mythic"] = "{rt8}General Kaal{rt8}||[Crushing Strike] swap tank; [Shadow Blade] marked drop at edge; [Unordered Strike] dodge barrage; [Endless Anguish] focus adds||{rt1}Must interrupt / clear: none{rt1}||shadow blade drop outside; barrage reposition; summoned adds kill fast",
                ["mythicplus"] = "{rt8}General Kaal{rt8}||[Crushing Strike] swap tank; [Shadow Blade] marked drop at edge; [Unordered Strike] dodge barrage; [Endless Anguish] focus adds||{rt1}Must interrupt / clear: none{rt1}||shadow blade drop outside; barrage reposition; summoned adds kill fast",
            },
        },
    },
    ["晋升高塔"] = {
        name = "Spires of Ascension",
        ["金-塔拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Jintara{rt8}||[Spinning Blade] dodge flying blade; [Rallying Cry] swap tank; [Shadow Spear] marked drop at edge; [Charged Charge] dodge charge line||{rt1}Must interrupt / clear: none{rt1}||fly around blade to dodge; spear drop outside; charge clear path early",
                ["normal"] = "{rt8}Jintara{rt8}||[Spinning Blade] dodge flying blade; [Rallying Cry] swap tank; [Shadow Spear] marked drop at edge; [Charged Charge] dodge charge line||{rt1}Must interrupt / clear: none{rt1}||fly around blade to dodge; spear drop outside; charge clear path early",
                ["heroic"] = "{rt8}Jintara{rt8}||[Spinning Blade] dodge flying blade; [Rallying Cry] swap tank; [Shadow Spear] marked drop at edge; [Charged Charge] dodge charge line||{rt1}Must interrupt / clear: none{rt1}||fly around blade to dodge; spear drop outside; charge clear path early",
                ["mythic"] = "{rt8}Jintara{rt8}||[Spinning Blade] dodge flying blade; [Rallying Cry] swap tank; [Shadow Spear] marked drop at edge; [Charged Charge] dodge charge line||{rt1}Must interrupt / clear: none{rt1}||fly around blade to dodge; spear drop outside; charge clear path early",
                ["mythicplus"] = "{rt8}Jintara{rt8}||[Spinning Blade] dodge flying blade; [Rallying Cry] swap tank; [Shadow Spear] marked drop at edge; [Charged Charge] dodge charge line||{rt1}Must interrupt / clear: none{rt1}||fly around blade to dodge; spear drop outside; charge clear path early",
            },
        },
        ["奥莱芙莉安"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Oleela{rt8}||[Annihilation Blast] marked drop at edge to explode; [Holy Bombardment] dodge landing; [Pure Burst] swap tank; [Soul Drain] interrupt||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||blast drop outside; bombardment landing dodge; swap-tank steady",
                ["normal"] = "{rt8}Oleela{rt8}||[Annihilation Blast] marked drop at edge to explode; [Holy Bombardment] dodge landing; [Pure Burst] swap tank; [Soul Drain] interrupt||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||blast drop outside; bombardment landing dodge; swap-tank steady",
                ["heroic"] = "{rt8}Oleela{rt8}||[Annihilation Blast] marked drop at edge to explode; [Holy Bombardment] dodge landing; [Pure Burst] swap tank; [Soul Drain] interrupt||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||blast drop outside; bombardment landing dodge; swap-tank steady",
                ["mythic"] = "{rt8}Oleela{rt8}||[Annihilation Blast] marked drop at edge to explode; [Holy Bombardment] dodge landing; [Pure Burst] swap tank; [Soul Drain] interrupt||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||blast drop outside; bombardment landing dodge; swap-tank steady",
                ["mythicplus"] = "{rt8}Oleela{rt8}||[Annihilation Blast] marked drop at edge to explode; [Holy Bombardment] dodge landing; [Pure Burst] swap tank; [Soul Drain] interrupt||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||blast drop outside; bombardment landing dodge; swap-tank steady",
            },
        },
        ["雯图纳柯丝"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Wentuna Kox{rt8}||[Turbulent Energy] dodge barrage; [Flay] swap tank; [Dominate Shadows] marked circle dodge; [Energy Fragment] clear fast||{rt1}Must interrupt / clear: none{rt1}||barrage positioning; fragment adds quick AoE; marked move away",
                ["normal"] = "{rt8}Wentuna Kox{rt8}||[Turbulent Energy] dodge barrage; [Flay] swap tank; [Dominate Shadows] marked circle dodge; [Energy Fragment] clear fast||{rt1}Must interrupt / clear: none{rt1}||barrage positioning; fragment adds quick AoE; marked move away",
                ["heroic"] = "{rt8}Wentuna Kox{rt8}||[Turbulent Energy] dodge barrage; [Flay] swap tank; [Dominate Shadows] marked circle dodge; [Energy Fragment] clear fast||{rt1}Must interrupt / clear: none{rt1}||barrage positioning; fragment adds quick AoE; marked move away",
                ["mythic"] = "{rt8}Wentuna Kox{rt8}||[Turbulent Energy] dodge barrage; [Flay] swap tank; [Dominate Shadows] marked circle dodge; [Energy Fragment] clear fast||{rt1}Must interrupt / clear: none{rt1}||barrage positioning; fragment adds quick AoE; marked move away",
                ["mythicplus"] = "{rt8}Wentuna Kox{rt8}||[Turbulent Energy] dodge barrage; [Flay] swap tank; [Dominate Shadows] marked circle dodge; [Energy Fragment] clear fast||{rt1}Must interrupt / clear: none{rt1}||barrage positioning; fragment adds quick AoE; marked move away",
            },
        },
        ["疑虑圣杰德沃丝"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Doubt-Saint Dewos{rt8}||[Airdrop Spear] dodge falling spears; [Divine Bind] marked pull away to break; [Fallen Light] dodge light pillar; [Banish] swap tank||{rt1}Must interrupt / clear: none{rt1}||bound ones move to break; light pillar reposition; swap-tank rhythm",
                ["normal"] = "{rt8}Doubt-Saint Dewos{rt8}||[Airdrop Spear] dodge falling spears; [Divine Bind] marked pull away to break; [Fallen Light] dodge light pillar; [Banish] swap tank||{rt1}Must interrupt / clear: none{rt1}||bound ones move to break; light pillar reposition; swap-tank rhythm",
                ["heroic"] = "{rt8}Doubt-Saint Dewos{rt8}||[Airdrop Spear] dodge falling spears; [Divine Bind] marked pull away to break; [Fallen Light] dodge light pillar; [Banish] swap tank||{rt1}Must interrupt / clear: none{rt1}||bound ones move to break; light pillar reposition; swap-tank rhythm",
                ["mythic"] = "{rt8}Doubt-Saint Dewos{rt8}||[Airdrop Spear] dodge falling spears; [Divine Bind] marked pull away to break; [Fallen Light] dodge light pillar; [Banish] swap tank||{rt1}Must interrupt / clear: none{rt1}||bound ones move to break; light pillar reposition; swap-tank rhythm",
                ["mythicplus"] = "{rt8}Doubt-Saint Dewos{rt8}||[Airdrop Spear] dodge falling spears; [Divine Bind] marked pull away to break; [Fallen Light] dodge light pillar; [Banish] swap tank||{rt1}Must interrupt / clear: none{rt1}||bound ones move to break; light pillar reposition; swap-tank rhythm",
            },
        },
        ["高塔哨兵"] = {
            type = "MOB",
            tips = "{rt8}Tower Sentinel (key mob){rt8}||[Holy Arrow] cast interrupt; [Purifying Flame] circle dodge||{rt1}Must interrupt / clear: [Holy Arrow]{rt1}||prioritize interrupting arrow rain to protect group",
        },
    },
    ["彼界"] = {
        name = "The Necrotic Wake",
        ["法力风暴夫妇"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mana Storm Couple{rt8}||Millificent [Arcane Spray] dodge; Millhouse [Fireball] interrupt; [Charged Bomb] marked drop at edge; [Mana Vacuum] dodge circle||{rt1}Must interrupt / clear: [Fireball]{rt1}||bomb drop outside; vacuum circle dodge; hit both together",
                ["normal"] = "{rt8}Mana Storm Couple{rt8}||Millificent [Arcane Spray] dodge; Millhouse [Fireball] interrupt; [Charged Bomb] marked drop at edge; [Mana Vacuum] dodge circle||{rt1}Must interrupt / clear: [Fireball]{rt1}||bomb drop outside; vacuum circle dodge; hit both together",
                ["heroic"] = "{rt8}Mana Storm Couple{rt8}||Millificent [Arcane Spray] dodge; Millhouse [Fireball] interrupt; [Charged Bomb] marked drop at edge; [Mana Vacuum] dodge circle||{rt1}Must interrupt / clear: [Fireball]{rt1}||bomb drop outside; vacuum circle dodge; hit both together",
                ["mythic"] = "{rt8}Mana Storm Couple{rt8}||Millificent [Arcane Spray] dodge; Millhouse [Fireball] interrupt; [Charged Bomb] marked drop at edge; [Mana Vacuum] dodge circle||{rt1}Must interrupt / clear: [Fireball]{rt1}||bomb drop outside; vacuum circle dodge; hit both together",
                ["mythicplus"] = "{rt8}Mana Storm Couple{rt8}||Millificent [Arcane Spray] dodge; Millhouse [Fireball] interrupt; [Charged Bomb] marked drop at edge; [Mana Vacuum] dodge circle||{rt1}Must interrupt / clear: [Fireball]{rt1}||bomb drop outside; vacuum circle dodge; hit both together",
            },
        },
        ["商人赛·艾柯莎"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Merchant Sa'eeksa{rt8}||[Shadow Box] step on box to prevent [Spirit Fluid] debuff; [Venom Blade] dodge floor spikes; [Animated Curio] clear adds fast; [Spirit Fluid Eruption] circle dodge||{rt1}Must interrupt / clear: none{rt1}||keep stepping box to clear debuff; adds quick AoE; floor spikes reposition",
                ["normal"] = "{rt8}Merchant Sa'eeksa{rt8}||[Shadow Box] step on box to prevent [Spirit Fluid] debuff; [Venom Blade] dodge floor spikes; [Animated Curio] clear adds fast; [Spirit Fluid Eruption] circle dodge||{rt1}Must interrupt / clear: none{rt1}||keep stepping box to clear debuff; adds quick AoE; floor spikes reposition",
                ["heroic"] = "{rt8}Merchant Sa'eeksa{rt8}||[Shadow Box] step on box to prevent [Spirit Fluid] debuff; [Venom Blade] dodge floor spikes; [Animated Curio] clear adds fast; [Spirit Fluid Eruption] circle dodge||{rt1}Must interrupt / clear: none{rt1}||keep stepping box to clear debuff; adds quick AoE; floor spikes reposition",
                ["mythic"] = "{rt8}Merchant Sa'eeksa{rt8}||[Shadow Box] step on box to prevent [Spirit Fluid] debuff; [Venom Blade] dodge floor spikes; [Animated Curio] clear adds fast; [Spirit Fluid Eruption] circle dodge||{rt1}Must interrupt / clear: none{rt1}||keep stepping box to clear debuff; adds quick AoE; floor spikes reposition",
                ["mythicplus"] = "{rt8}Merchant Sa'eeksa{rt8}||[Shadow Box] step on box to prevent [Spirit Fluid] debuff; [Venom Blade] dodge floor spikes; [Animated Curio] clear adds fast; [Spirit Fluid Eruption] circle dodge||{rt1}Must interrupt / clear: none{rt1}||keep stepping box to clear debuff; adds quick AoE; floor spikes reposition",
            },
        },
        ["穆厄扎拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mueh'zala{rt8}||[Time Trap] step on lit tile to avoid root; [Chrono Shock] swap tank; [Rift Collapse] dodge black hole; [Reshape Reality] full-screen enter circle||{rt1}Must interrupt / clear: none{rt1}||trap lit tile step; collapse away; full-screen enter safe circle",
                ["normal"] = "{rt8}Mueh'zala{rt8}||[Time Trap] step on lit tile to avoid root; [Chrono Shock] swap tank; [Rift Collapse] dodge black hole; [Reshape Reality] full-screen enter circle||{rt1}Must interrupt / clear: none{rt1}||trap lit tile step; collapse away; full-screen enter safe circle",
                ["heroic"] = "{rt8}Mueh'zala{rt8}||[Time Trap] step on lit tile to avoid root; [Chrono Shock] swap tank; [Rift Collapse] dodge black hole; [Reshape Reality] full-screen enter circle||{rt1}Must interrupt / clear: none{rt1}||trap lit tile step; collapse away; full-screen enter safe circle",
                ["mythic"] = "{rt8}Mueh'zala{rt8}||[Time Trap] step on lit tile to avoid root; [Chrono Shock] swap tank; [Rift Collapse] dodge black hole; [Reshape Reality] full-screen enter circle||{rt1}Must interrupt / clear: none{rt1}||trap lit tile step; collapse away; full-screen enter safe circle",
                ["mythicplus"] = "{rt8}Mueh'zala{rt8}||[Time Trap] step on lit tile to avoid root; [Chrono Shock] swap tank; [Rift Collapse] dodge black hole; [Reshape Reality] full-screen enter circle||{rt1}Must interrupt / clear: none{rt1}||trap lit tile step; collapse away; full-screen enter safe circle",
            },
        },
        ["暗影之盒守卫"] = {
            type = "MOB",
            tips = "{rt8}Shadow Box Guardian (key mob){rt8}||[Spirit Fluid Spray] cast interrupt; box guardian priority clear to keep stepping box||{rt1}Must interrupt / clear: [Spirit Fluid Spray]{rt1}||keep the Shadow Box so group can step to clear debuff",
        },
        ["夺灵者哈卡"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Haka the Soulharvester{rt8}||[Blood Mirror] marked mirror drop at edge collide to clear; [Blood Cloud] dodge circle; [Soul Consumption] swap tank; [Corrupt Blood] step poison pool||{rt1}Must interrupt / clear: none{rt1}||mirror two players apart then collide; blood pool step full to clear debuff; swap-tank steady",
                ["normal"] = "{rt8}Haka the Soulharvester{rt8}||[Blood Mirror] marked mirror drop at edge collide to clear; [Blood Cloud] dodge circle; [Soul Consumption] swap tank; [Corrupt Blood] step poison pool||{rt1}Must interrupt / clear: none{rt1}||mirror two players apart then collide; blood pool step full to clear debuff; swap-tank steady",
                ["heroic"] = "{rt8}Haka the Soulharvester{rt8}||[Blood Mirror] marked mirror drop at edge collide to clear; [Blood Cloud] dodge circle; [Soul Consumption] swap tank; [Corrupt Blood] step poison pool||{rt1}Must interrupt / clear: none{rt1}||mirror two players apart then collide; blood pool step full to clear debuff; swap-tank steady",
                ["mythic"] = "{rt8}Haka the Soulharvester{rt8}||[Blood Mirror] marked mirror drop at edge collide to clear; [Blood Cloud] dodge circle; [Soul Consumption] swap tank; [Corrupt Blood] step poison pool||{rt1}Must interrupt / clear: none{rt1}||mirror two players apart then collide; blood pool step full to clear debuff; swap-tank steady",
                ["mythicplus"] = "{rt8}Haka the Soulharvester{rt8}||[Blood Mirror] marked mirror drop at edge collide to clear; [Blood Cloud] dodge circle; [Soul Consumption] swap tank; [Corrupt Blood] step poison pool||{rt1}Must interrupt / clear: none{rt1}||mirror two players apart then collide; blood pool step full to clear debuff; swap-tank steady",
            },
        },
    },
    ["赎罪大厅"] = {
        name = "Halls of Atonement",
        ["艾谢朗"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Ashglar{rt8}||[Gravel Spike] random marked ground spikes dodge; [Drain Essence] cast interrupt or heals; [Shattered Shield] after break stay away from explosion; [Oppress] share damage reduction||{rt1}Must interrupt / clear: [Drain Essence]{rt1}||after marked spike come out run away; shield phase don't stand in boss face; group share [Oppress]",
                ["normal"] = "{rt8}Ashglar{rt8}||[Gravel Spike] random marked ground spikes dodge; [Drain Essence] cast interrupt or heals; [Shattered Shield] after break stay away from explosion; [Oppress] share damage reduction||{rt1}Must interrupt / clear: [Drain Essence]{rt1}||after marked spike come out run away; shield phase don't stand in boss face; group share [Oppress]",
                ["heroic"] = "{rt8}Ashglar{rt8}||[Gravel Spike] random marked ground spikes dodge; [Drain Essence] cast interrupt or heals; [Shattered Shield] after break stay away from explosion; [Oppress] share damage reduction||{rt1}Must interrupt / clear: [Drain Essence]{rt1}||after marked spike come out run away; shield phase don't stand in boss face; group share [Oppress]",
                ["mythic"] = "{rt8}Ashglar{rt8}||[Gravel Spike] random marked ground spikes dodge; [Drain Essence] cast interrupt or heals; [Shattered Shield] after break stay away from explosion; [Oppress] share damage reduction||{rt1}Must interrupt / clear: [Drain Essence]{rt1}||after marked spike come out run away; shield phase don't stand in boss face; group share [Oppress]",
                ["mythicplus"] = "{rt8}Ashglar{rt8}||[Gravel Spike] random marked ground spikes dodge; [Drain Essence] cast interrupt or heals; [Shattered Shield] after break stay away from explosion; [Oppress] share damage reduction||{rt1}Must interrupt / clear: [Drain Essence]{rt1}||after marked spike come out run away; shield phase don't stand in boss face; group share [Oppress]",
            },
        },
        ["高阶裁决官阿丽兹"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}High Inquisitor Alyez{rt8}||[Condemn] cast interrupt; [Sin] marked stand in circle to share; [Holy Snipe] dodge long laser; [Holy Wrath] cooldowns eat||{rt1}Must interrupt / clear: [Condemn]{rt1}||marked circle group up share [Sin]; laser move sideways dodge; orb phase don't touch",
                ["normal"] = "{rt8}High Inquisitor Alyez{rt8}||[Condemn] cast interrupt; [Sin] marked stand in circle to share; [Holy Snipe] dodge long laser; [Holy Wrath] cooldowns eat||{rt1}Must interrupt / clear: [Condemn]{rt1}||marked circle group up share [Sin]; laser move sideways dodge; orb phase don't touch",
                ["heroic"] = "{rt8}High Inquisitor Alyez{rt8}||[Condemn] cast interrupt; [Sin] marked stand in circle to share; [Holy Snipe] dodge long laser; [Holy Wrath] cooldowns eat||{rt1}Must interrupt / clear: [Condemn]{rt1}||marked circle group up share [Sin]; laser move sideways dodge; orb phase don't touch",
                ["mythic"] = "{rt8}High Inquisitor Alyez{rt8}||[Condemn] cast interrupt; [Sin] marked stand in circle to share; [Holy Snipe] dodge long laser; [Holy Wrath] cooldowns eat||{rt1}Must interrupt / clear: [Condemn]{rt1}||marked circle group up share [Sin]; laser move sideways dodge; orb phase don't touch",
                ["mythicplus"] = "{rt8}High Inquisitor Alyez{rt8}||[Condemn] cast interrupt; [Sin] marked stand in circle to share; [Holy Snipe] dodge long laser; [Holy Wrath] cooldowns eat||{rt1}Must interrupt / clear: [Condemn]{rt1}||marked circle group up share [Sin]; laser move sideways dodge; orb phase don't touch",
            },
        },
        ["哈尔吉亚斯，罪污巨像"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Halgias, the Sin-Stained Colossus{rt8}||before engaging break [Shards of Sin] for damage reduction; [Sin Stained Shard] ram into [Sin Stained Rift] light column boss emits to clear [Sin Stained Shard] debuff; [Stoneguard Summon] pull adds back to center circle step rift to clear||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Quaking Stomp] melee dodge frontal; light column lines keep apart; step rift to clear debuff for survival",
                ["normal"] = "{rt8}Halgias, the Sin-Stained Colossus{rt8}||before engaging break [Shards of Sin] for damage reduction; [Sin Stained Shard] ram into [Sin Stained Rift] light column boss emits to clear [Sin Stained Shard] debuff; [Stoneguard Summon] pull adds back to center circle step rift to clear||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Quaking Stomp] melee dodge frontal; light column lines keep apart; step rift to clear debuff for survival",
                ["heroic"] = "{rt8}Halgias, the Sin-Stained Colossus{rt8}||before engaging break [Shards of Sin] for damage reduction; [Sin Stained Shard] ram into [Sin Stained Rift] light column boss emits to clear [Sin Stained Shard] debuff; [Stoneguard Summon] pull adds back to center circle step rift to clear||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Quaking Stomp] melee dodge frontal; light column lines keep apart; step rift to clear debuff for survival",
                ["mythic"] = "{rt8}Halgias, the Sin-Stained Colossus{rt8}||before engaging break [Shards of Sin] for damage reduction; [Sin Stained Shard] ram into [Sin Stained Rift] light column boss emits to clear [Sin Stained Shard] debuff; [Stoneguard Summon] pull adds back to center circle step rift to clear||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Quaking Stomp] melee dodge frontal; light column lines keep apart; step rift to clear debuff for survival",
                ["mythicplus"] = "{rt8}Halgias, the Sin-Stained Colossus{rt8}||before engaging break [Shards of Sin] for damage reduction; [Sin Stained Shard] ram into [Sin Stained Rift] light column boss emits to clear [Sin Stained Shard] debuff; [Stoneguard Summon] pull adds back to center circle step rift to clear||{rt1}Must interrupt / clear: no hard interrupt{rt1}||[Quaking Stomp] melee dodge frontal; light column lines keep apart; step rift to clear debuff for survival",
            },
        },
        ["宫务大臣"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Courtier{rt8}||[Exile] cast interrupt; [Arrogant Penance] circle at feet dodge; [Shadow Wrath] swap tank; [Curtain Call] enter blue circle dodge full-screen; [Ritual Stone] shatter interrupt summons||{rt1}Must interrupt / clear: [Exile], [Ritual Stone]{rt1}||swap-tank eat [Shadow Wrath]; full-screen enter blue circle; statue priority shatter to stop adds",
                ["normal"] = "{rt8}Courtier{rt8}||[Exile] cast interrupt; [Arrogant Penance] circle at feet dodge; [Shadow Wrath] swap tank; [Curtain Call] enter blue circle dodge full-screen; [Ritual Stone] shatter interrupt summons||{rt1}Must interrupt / clear: [Exile], [Ritual Stone]{rt1}||swap-tank eat [Shadow Wrath]; full-screen enter blue circle; statue priority shatter to stop adds",
                ["heroic"] = "{rt8}Courtier{rt8}||[Exile] cast interrupt; [Arrogant Penance] circle at feet dodge; [Shadow Wrath] swap tank; [Curtain Call] enter blue circle dodge full-screen; [Ritual Stone] shatter interrupt summons||{rt1}Must interrupt / clear: [Exile], [Ritual Stone]{rt1}||swap-tank eat [Shadow Wrath]; full-screen enter blue circle; statue priority shatter to stop adds",
                ["mythic"] = "{rt8}Courtier{rt8}||[Exile] cast interrupt; [Arrogant Penance] circle at feet dodge; [Shadow Wrath] swap tank; [Curtain Call] enter blue circle dodge full-screen; [Ritual Stone] shatter interrupt summons||{rt1}Must interrupt / clear: [Exile], [Ritual Stone]{rt1}||swap-tank eat [Shadow Wrath]; full-screen enter blue circle; statue priority shatter to stop adds",
                ["mythicplus"] = "{rt8}Courtier{rt8}||[Exile] cast interrupt; [Arrogant Penance] circle at feet dodge; [Shadow Wrath] swap tank; [Curtain Call] enter blue circle dodge full-screen; [Ritual Stone] shatter interrupt summons||{rt1}Must interrupt / clear: [Exile], [Ritual Stone]{rt1}||swap-tank eat [Shadow Wrath]; full-screen enter blue circle; statue priority shatter to stop adds",
            },
        },
        ["石裔石卫"] = {
            type = "MOB",
            tips = "{rt8}Stoneclad Stoneguard (key mob){rt8}||[Shattering Smash] frontal cleave dodge behind; [Sin] marked share; priority kill damage-reduction mob||{rt1}Must interrupt / clear: none{rt1}||route: first break 3 [Shards of Sin] then pull boss; small mobs group and AoE",
        },
    },
    ["塞兹仙林的迷雾"] = {
        name = "Mists of Tirna Scithe",
        ["德鲁伊杂兵"] = {
            type = "MOB",
            tips = "{rt8}Druid Trash (key mob){rt8}||[Oak Arc] cast interrupt; [Barkskin] shields mob—priority focus; [Entangling Roots] break root||{rt1}Must interrupt / clear: [Oak Arc]{rt1}||barkskin mob kill first; roots break promptly",
        },
        ["马洛克，英格拉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mal'keth, Ingla{rt8}||[Maw Clamp] swap tank; [Soul Drain] marked cast interrupt; [Entangling] roots teammate break fast; [Soul Thunder] dodge cleave||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||rooted immediately break; thunder dodge frontal; swap-tank steady",
                ["normal"] = "{rt8}Mal'keth, Ingla{rt8}||[Maw Clamp] swap tank; [Soul Drain] marked cast interrupt; [Entangling] roots teammate break fast; [Soul Thunder] dodge cleave||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||rooted immediately break; thunder dodge frontal; swap-tank steady",
                ["heroic"] = "{rt8}Mal'keth, Ingla{rt8}||[Maw Clamp] swap tank; [Soul Drain] marked cast interrupt; [Entangling] roots teammate break fast; [Soul Thunder] dodge cleave||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||rooted immediately break; thunder dodge frontal; swap-tank steady",
                ["mythic"] = "{rt8}Mal'keth, Ingla{rt8}||[Maw Clamp] swap tank; [Soul Drain] marked cast interrupt; [Entangling] roots teammate break fast; [Soul Thunder] dodge cleave||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||rooted immediately break; thunder dodge frontal; swap-tank steady",
                ["mythicplus"] = "{rt8}Mal'keth, Ingla{rt8}||[Maw Clamp] swap tank; [Soul Drain] marked cast interrupt; [Entangling] roots teammate break fast; [Soul Thunder] dodge cleave||{rt1}Must interrupt / clear: [Soul Drain]{rt1}||rooted immediately break; thunder dodge frontal; swap-tank steady",
            },
        },
        ["唤雾者"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Mistcaller{rt8}||[Misty Ring] circle dodge; [Phantom Ambush] fake body dodge real; [Befuddling Mist] clear adds to break; [Echoing Smash] interrupt||{rt1}Must interrupt / clear: [Echoing Smash]{rt1}||split fake/real hit real; mist spawns adds quickly clear to break debuff",
                ["normal"] = "{rt8}Mistcaller{rt8}||[Misty Ring] circle dodge; [Phantom Ambush] fake body dodge real; [Befuddling Mist] clear adds to break; [Echoing Smash] interrupt||{rt1}Must interrupt / clear: [Echoing Smash]{rt1}||split fake/real hit real; mist spawns adds quickly clear to break debuff",
                ["heroic"] = "{rt8}Mistcaller{rt8}||[Misty Ring] circle dodge; [Phantom Ambush] fake body dodge real; [Befuddling Mist] clear adds to break; [Echoing Smash] interrupt||{rt1}Must interrupt / clear: [Echoing Smash]{rt1}||split fake/real hit real; mist spawns adds quickly clear to break debuff",
                ["mythic"] = "{rt8}Mistcaller{rt8}||[Misty Ring] circle dodge; [Phantom Ambush] fake body dodge real; [Befuddling Mist] clear adds to break; [Echoing Smash] interrupt||{rt1}Must interrupt / clear: [Echoing Smash]{rt1}||split fake/real hit real; mist spawns adds quickly clear to break debuff",
                ["mythicplus"] = "{rt8}Mistcaller{rt8}||[Misty Ring] circle dodge; [Phantom Ambush] fake body dodge real; [Befuddling Mist] clear adds to break; [Echoing Smash] interrupt||{rt1}Must interrupt / clear: [Echoing Smash]{rt1}||split fake/real hit real; mist spawns adds quickly clear to break debuff",
            },
        },
        ["特雷德奥瓦"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Tred'ova{rt8}||[Parasitic Bite] marked run away; [Dominate] mind-control cast interrupt; [Wrath of Nature] circle dodge; [Entangling Roots] break root||{rt1}Must interrupt / clear: [Dominate]{rt1}||mind-control must interrupt to avoid wipe; marked away; roots break don't block",
                ["normal"] = "{rt8}Tred'ova{rt8}||[Parasitic Bite] marked run away; [Dominate] mind-control cast interrupt; [Wrath of Nature] circle dodge; [Entangling Roots] break root||{rt1}Must interrupt / clear: [Dominate]{rt1}||mind-control must interrupt to avoid wipe; marked away; roots break don't block",
                ["heroic"] = "{rt8}Tred'ova{rt8}||[Parasitic Bite] marked run away; [Dominate] mind-control cast interrupt; [Wrath of Nature] circle dodge; [Entangling Roots] break root||{rt1}Must interrupt / clear: [Dominate]{rt1}||mind-control must interrupt to avoid wipe; marked away; roots break don't block",
                ["mythic"] = "{rt8}Tred'ova{rt8}||[Parasitic Bite] marked run away; [Dominate] mind-control cast interrupt; [Wrath of Nature] circle dodge; [Entangling Roots] break root||{rt1}Must interrupt / clear: [Dominate]{rt1}||mind-control must interrupt to avoid wipe; marked away; roots break don't block",
                ["mythicplus"] = "{rt8}Tred'ova{rt8}||[Parasitic Bite] marked run away; [Dominate] mind-control cast interrupt; [Wrath of Nature] circle dodge; [Entangling Roots] break root||{rt1}Must interrupt / clear: [Dominate]{rt1}||mind-control must interrupt to avoid wipe; marked away; roots break don't block",
            },
        },
    },
    ["通灵战潮"] = {
        name = "Halls of Repose",
        ["凋骨"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Rotbone{rt8}||[Vicious Bite] swap tank; [Decay Splatter] marked circle dodge; [Festering Rot] drop at edge to explode; [Blood of Decay] below 50% enrage—cooldowns||{rt1}Must interrupt / clear: none{rt1}||swap-tank steady; marked away from group; rot drop outside don't hit group",
                ["normal"] = "{rt8}Rotbone{rt8}||[Vicious Bite] swap tank; [Decay Splatter] marked circle dodge; [Festering Rot] drop at edge to explode; [Blood of Decay] below 50% enrage—cooldowns||{rt1}Must interrupt / clear: none{rt1}||swap-tank steady; marked away from group; rot drop outside don't hit group",
                ["heroic"] = "{rt8}Rotbone{rt8}||[Vicious Bite] swap tank; [Decay Splatter] marked circle dodge; [Festering Rot] drop at edge to explode; [Blood of Decay] below 50% enrage—cooldowns||{rt1}Must interrupt / clear: none{rt1}||swap-tank steady; marked away from group; rot drop outside don't hit group",
                ["mythic"] = "{rt8}Rotbone{rt8}||[Vicious Bite] swap tank; [Decay Splatter] marked circle dodge; [Festering Rot] drop at edge to explode; [Blood of Decay] below 50% enrage—cooldowns||{rt1}Must interrupt / clear: none{rt1}||swap-tank steady; marked away from group; rot drop outside don't hit group",
                ["mythicplus"] = "{rt8}Rotbone{rt8}||[Vicious Bite] swap tank; [Decay Splatter] marked circle dodge; [Festering Rot] drop at edge to explode; [Blood of Decay] below 50% enrage—cooldowns||{rt1}Must interrupt / clear: none{rt1}||swap-tank steady; marked away from group; rot drop outside don't hit group",
            },
        },
        ["尸体收割者"] = {
            type = "MOB",
            tips = "{rt8}Corpse Harvester (key mob){rt8}||[Drain Fluid] drains tank blood—cast must interrupt; [Decay Sweep] frontal cleave dodge back||{rt1}Must interrupt / clear: [Drain Fluid]{rt1}||interrupt drain to save tank; don't stand frontal for cleave",
        },
        ["缚霜者纳尔佐"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Nalthor the Rimebinder{rt8}||[Frost Grip] marked pull to ice wall to break; [Frost Tomb] circle group up to share; [Comet Storm] dodge landing; [Ice Bound Orb] block well don't miss||{rt1}Must interrupt / clear: none{rt1}||gripped run to ice wall to break; comet landing move early; block orb fully to avoid knockback",
                ["normal"] = "{rt8}Nalthor the Rimebinder{rt8}||[Frost Grip] marked pull to ice wall to break; [Frost Tomb] circle group up to share; [Comet Storm] dodge landing; [Ice Bound Orb] block well don't miss||{rt1}Must interrupt / clear: none{rt1}||gripped run to ice wall to break; comet landing move early; block orb fully to avoid knockback",
                ["heroic"] = "{rt8}Nalthor the Rimebinder{rt8}||[Frost Grip] marked pull to ice wall to break; [Frost Tomb] circle group up to share; [Comet Storm] dodge landing; [Ice Bound Orb] block well don't miss||{rt1}Must interrupt / clear: none{rt1}||gripped run to ice wall to break; comet landing move early; block orb fully to avoid knockback",
                ["mythic"] = "{rt8}Nalthor the Rimebinder{rt8}||[Frost Grip] marked pull to ice wall to break; [Frost Tomb] circle group up to share; [Comet Storm] dodge landing; [Ice Bound Orb] block well don't miss||{rt1}Must interrupt / clear: none{rt1}||gripped run to ice wall to break; comet landing move early; block orb fully to avoid knockback",
                ["mythicplus"] = "{rt8}Nalthor the Rimebinder{rt8}||[Frost Grip] marked pull to ice wall to break; [Frost Tomb] circle group up to share; [Comet Storm] dodge landing; [Ice Bound Orb] block well don't miss||{rt1}Must interrupt / clear: none{rt1}||gripped run to ice wall to break; comet landing move early; block orb fully to avoid knockback",
            },
        },
        ["外科医生缝肉"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Surgeon Stitchflesh{rt8}||boss on platform reads [Suture Strike] interrupt; [Meat Hook] pulls player—run first; [Corpse Explosion] adds before death stay away; downstairs [Grind Cleave] swap tank||{rt1}Must interrupt / clear: [Suture Strike]{rt1}||corpse explosion don't stand together; pulled player scatter; downstairs hit body swap-tank",
                ["normal"] = "{rt8}Surgeon Stitchflesh{rt8}||boss on platform reads [Suture Strike] interrupt; [Meat Hook] pulls player—run first; [Corpse Explosion] adds before death stay away; downstairs [Grind Cleave] swap tank||{rt1}Must interrupt / clear: [Suture Strike]{rt1}||corpse explosion don't stand together; pulled player scatter; downstairs hit body swap-tank",
                ["heroic"] = "{rt8}Surgeon Stitchflesh{rt8}||boss on platform reads [Suture Strike] interrupt; [Meat Hook] pulls player—run first; [Corpse Explosion] adds before death stay away; downstairs [Grind Cleave] swap tank||{rt1}Must interrupt / clear: [Suture Strike]{rt1}||corpse explosion don't stand together; pulled player scatter; downstairs hit body swap-tank",
                ["mythic"] = "{rt8}Surgeon Stitchflesh{rt8}||boss on platform reads [Suture Strike] interrupt; [Meat Hook] pulls player—run first; [Corpse Explosion] adds before death stay away; downstairs [Grind Cleave] swap tank||{rt1}Must interrupt / clear: [Suture Strike]{rt1}||corpse explosion don't stand together; pulled player scatter; downstairs hit body swap-tank",
                ["mythicplus"] = "{rt8}Surgeon Stitchflesh{rt8}||boss on platform reads [Suture Strike] interrupt; [Meat Hook] pulls player—run first; [Corpse Explosion] adds before death stay away; downstairs [Grind Cleave] swap tank||{rt1}Must interrupt / clear: [Suture Strike]{rt1}||corpse explosion don't stand together; pulled player scatter; downstairs hit body swap-tank",
            },
        },
        ["佐尔拉姆斯通灵师"] = {
            type = "MOB",
            tips = "{rt8}Zolramus Necromancer (key mob){rt8}||[Shadow Bolt Volley] cast interrupt; summons skeletons need fast clear||{rt1}Must interrupt / clear: [Shadow Bolt Volley]{rt1}||prioritize killing the caster; summoned adds immediately AoE",
        },
        ["骷髅劫掠者"] = {
            type = "MOB",
            tips = "{rt8}Skeletal Pillager (key mob){rt8}||[Deafening Screech] cast must interrupt or whole-group silence||{rt1}Must interrupt / clear: [Deafening Screech]{rt1}||high-priority interrupt target",
        },
        ["收割者阿玛厄斯"] = {
            type = "BOSS",
            tipsByDifficulty = {
                ["lfr"] = "{rt8}Reaper Amarth{rt8}||[Risen Dead] summon skeletons clear fast don't stack; [Grip of the Dead] marked pull away to break; [Bone Storm] melee dodge cleave; [Grind] swap tank||{rt1}Must interrupt / clear: none{rt1}||summoned skeletons immediately AoE; gripped ones move to break; storm go around back",
                ["normal"] = "{rt8}Reaper Amarth{rt8}||[Risen Dead] summon skeletons clear fast don't stack; [Grip of the Dead] marked pull away to break; [Bone Storm] melee dodge cleave; [Grind] swap tank||{rt1}Must interrupt / clear: none{rt1}||summoned skeletons immediately AoE; gripped ones move to break; storm go around back",
                ["heroic"] = "{rt8}Reaper Amarth{rt8}||[Risen Dead] summon skeletons clear fast don't stack; [Grip of the Dead] marked pull away to break; [Bone Storm] melee dodge cleave; [Grind] swap tank||{rt1}Must interrupt / clear: none{rt1}||summoned skeletons immediately AoE; gripped ones move to break; storm go around back",
                ["mythic"] = "{rt8}Reaper Amarth{rt8}||[Risen Dead] summon skeletons clear fast don't stack; [Grip of the Dead] marked pull away to break; [Bone Storm] melee dodge cleave; [Grind] swap tank||{rt1}Must interrupt / clear: none{rt1}||summoned skeletons immediately AoE; gripped ones move to break; storm go around back",
                ["mythicplus"] = "{rt8}Reaper Amarth{rt8}||[Risen Dead] summon skeletons clear fast don't stack; [Grip of the Dead] marked pull away to break; [Bone Storm] melee dodge cleave; [Grind] swap tank||{rt1}Must interrupt / clear: none{rt1}||summoned skeletons immediately AoE; gripped ones move to break; storm go around back",
            },
        },
    },
}
