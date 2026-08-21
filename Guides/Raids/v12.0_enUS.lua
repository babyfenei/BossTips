-- ============================================================================
-- BossTips Raid 攻略翻译 —— enUS
-- ============================================================================
local _, addon = ...
addon.GuideData = addon.GuideData or { versions = {}, mplus = {}, raids = {}, meta = {}, mplusInfo = {}, versionInfo = {} }
addon.GuideData.translations = addon.GuideData.translations or {}
addon.GuideData.translations.enUS = addon.GuideData.translations.enUS or {}
addon.GuideData.translations.enUS.raids = addon.GuideData.translations.enUS.raids or {}
addon.GuideData.translations.enUS.raids["12.0"] = {
    ["梦境裂隙"] = {
        name = "Dreamrift",
        ["奇美鲁斯，未梦之神"] = {
            type = "BOSS",
            name = "Chimaerus the Undreamt God",
            tipsByDifficulty = {
                ["lfr"] = "P1 [Dust] stomp circles; focus-fire adds; [Miasma] dispel; [Phlegm] glob spawn; [Tear of Rend] avoid frontal; [Devour] finish adds. P2 after lift-off dodge [Dive] landing; avoid [Corrupting Doom] breath.",
                ["normal"] = "P1 [Dust] stomp circles; focus-fire adds; [Miasma] dispel; [Phlegm] glob spawn; [Tear of Rend] avoid frontal; [Devour] finish adds. P2 after lift-off dodge [Dive] landing; avoid [Corrupting Doom] breath.",
                ["heroic"] = "P1 [Dust] stomp circles; focus-fire adds; [Miasma] dispel; [Phlegm] glob spawn; [Tear of Rend] avoid frontal; [Devour] finish adds. P2 after lift-off dodge [Dive] landing; avoid [Corrupting Doom] breath.",
                ["mythic"] = "P1 [Dust] stomp circles; focus-fire adds; [Miasma] dispel; [Phlegm] glob spawn; [Tear of Rend] avoid frontal; [Devour] finish adds. P2 after lift-off dodge [Dive] landing; avoid [Corrupting Doom] breath.",
                ["mythicplus"] = "P1 [Dust] stomp circles; focus-fire adds; [Miasma] dispel; [Phlegm] glob spawn; [Tear of Rend] avoid frontal; [Devour] finish adds. P2 after lift-off dodge [Dive] landing; avoid [Corrupting Doom] breath.",
            },
        },
    },
    ["进军奎尔萨拉斯"] = {
        name = "March on Quel'Thalas",
        ["贝洛伦，奥之子嗣"] = {
            type = "BOSS",
            name = "Belo'ren, Child of Al'ar",
            tipsByDifficulty = {
                ["lfr"] = "After [Voidlight Convergence] swaps the active attunement move to the safe zone. Focus-fire [Ember] adds and stomp [Dive] circles; [Feather Sting] marked players spread. [Keeper's Edict] swap tanks; pre-lay shields for [Eternal Burn] absorb; [Death Plunge] transitions to P2 rebirth.",
                ["normal"] = "After [Voidlight Convergence] swaps the active attunement move to the safe zone. Focus-fire [Ember] adds and stomp [Dive] circles; [Feather Sting] marked players spread. [Keeper's Edict] swap tanks; pre-lay shields for [Eternal Burn] absorb; [Death Plunge] transitions to P2 rebirth.",
                ["heroic"] = "After [Voidlight Convergence] swaps the active attunement move to the safe zone. Focus-fire [Ember] adds and stomp [Dive] circles; [Feather Sting] marked players spread. [Keeper's Edict] swap tanks; pre-lay shields for [Eternal Burn] absorb; [Death Plunge] transitions to P2 rebirth.",
                ["mythic"] = "After [Voidlight Convergence] swaps the active attunement move to the safe zone. Focus-fire [Ember] adds and stomp [Dive] circles; [Feather Sting] marked players spread. [Keeper's Edict] swap tanks; pre-lay shields for [Eternal Burn] absorb; [Death Plunge] transitions to P2 rebirth.",
                ["mythicplus"] = "After [Voidlight Convergence] swaps the active attunement move to the safe zone. Focus-fire [Ember] adds and stomp [Dive] circles; [Feather Sting] marked players spread. [Keeper's Edict] swap tanks; pre-lay shields for [Eternal Burn] absorb; [Death Plunge] transitions to P2 rebirth.",
            },
        },
        ["午夜陨落"] = {
            type = "BOSS",
            name = "Midnight Falls",
            tipsByDifficulty = {
                ["lfr"] = "P1 interrupt [Twin Blades]/[Quasar]/[Elegy]/[Rune]/[Prism]; [Spear of Heaven]; during transitions dodge [Star Rift] and [Quasar]. P2 [Galvanize] dodge the light beams, [Core Reap] avoid, [Dark Collapse] knockback. P3 [Archangel] explosion — mitig; [Constellation] spread; [Siphon] stomp circles.",
                ["normal"] = "P1 interrupt [Twin Blades]/[Quasar]/[Elegy]/[Rune]/[Prism]; [Spear of Heaven]; during transitions dodge [Star Rift] and [Quasar]. P2 [Galvanize] dodge the light beams, [Core Reap] avoid, [Dark Collapse] knockback. P3 [Archangel] explosion — mitig; [Constellation] spread; [Siphon] stomp circles.",
                ["heroic"] = "P1 interrupt [Twin Blades]/[Quasar]/[Elegy]/[Rune]/[Prism]; [Spear of Heaven]; during transitions dodge [Star Rift] and [Quasar]. P2 [Galvanize] dodge the light beams, [Core Reap] avoid, [Dark Collapse] knockback. P3 [Archangel] explosion — mitig; [Constellation] spread; [Siphon] stomp circles.",
                ["mythic"] = "P1 interrupt [Twin Blades]/[Quasar]/[Elegy]/[Rune]/[Prism]; [Spear of Heaven]; during transitions dodge [Star Rift] and [Quasar]. P2 [Galvanize] dodge the light beams, [Core Reap] avoid, [Dark Collapse] knockback. P3 [Archangel] explosion — mitig; [Constellation] spread; [Siphon] stomp circles.",
                ["mythicplus"] = "P1 interrupt [Twin Blades]/[Quasar]/[Elegy]/[Rune]/[Prism]; [Spear of Heaven]; during transitions dodge [Star Rift] and [Quasar]. P2 [Galvanize] dodge the light beams, [Core Reap] avoid, [Dark Collapse] knockback. P3 [Archangel] explosion — mitig; [Constellation] spread; [Siphon] stomp circles.",
            },
        },
    },
    ["虚影尖塔"] = {
        name = "Phantasmal Spire",
        ["元首阿福扎恩"] = {
            type = "BOSS",
            name = "Imperator Averzian",
            tipsByDifficulty = {
                ["lfr"] = "[Shadow Charge] summons adds — focus-fire immediately; [Void Rift] circle-dodge; [Shadow Collapse] stomp circles. [Annihilation Wrath] all dodge; after [Void Fall] knockback quickly regroup.",
                ["normal"] = "[Shadow Charge] summons adds — focus-fire immediately; [Void Rift] circle-dodge; [Shadow Collapse] stomp circles. [Annihilation Wrath] all dodge; after [Void Fall] knockback quickly regroup.",
                ["heroic"] = "[Shadow Charge] summons adds — focus-fire immediately; [Void Rift] circle-dodge; [Shadow Collapse] stomp circles. [Annihilation Wrath] all dodge; after [Void Fall] knockback quickly regroup.",
                ["mythic"] = "[Shadow Charge] summons adds — focus-fire immediately; [Void Rift] circle-dodge; [Shadow Collapse] stomp circles. [Annihilation Wrath] all dodge; after [Void Fall] knockback quickly regroup.",
                ["mythicplus"] = "[Shadow Charge] summons adds — focus-fire immediately; [Void Rift] circle-dodge; [Shadow Collapse] stomp circles. [Annihilation Wrath] all dodge; after [Void Fall] knockback quickly regroup.",
            },
        },
        ["弗拉希乌斯"] = {
            type = "BOSS",
            name = "Vorasius",
            tipsByDifficulty = {
                ["lfr"] = "[Breath] avoid frontal; [Shadow Claw] heavy hit swap tanks; [Primal Roar] group up and mitig. [Parasite Spit] spawns adds — focus-fire immediately; clear ground [Slime].",
                ["normal"] = "[Breath] avoid frontal; [Shadow Claw] heavy hit swap tanks; [Primal Roar] group up and mitig. [Parasite Spit] spawns adds — focus-fire immediately; clear ground [Slime].",
                ["heroic"] = "[Breath] avoid frontal; [Shadow Claw] heavy hit swap tanks; [Primal Roar] group up and mitig. [Parasite Spit] spawns adds — focus-fire immediately; clear ground [Slime].",
                ["mythic"] = "[Breath] avoid frontal; [Shadow Claw] heavy hit swap tanks; [Primal Roar] group up and mitig. [Parasite Spit] spawns adds — focus-fire immediately; clear ground [Slime].",
                ["mythicplus"] = "[Breath] avoid frontal; [Shadow Claw] heavy hit swap tanks; [Primal Roar] group up and mitig. [Parasite Spit] spawns adds — focus-fire immediately; clear ground [Slime].",
            },
        },
        ["威厄高尔和艾佐拉克"] = {
            type = "BOSS",
            name = "Vaelgor & Ezzorak",
            tipsByDifficulty = {
                ["lfr"] = "Vaelgor's [Void Beam]/[Forbidden Zone]/[Breath] alternate with Ezzorak's [Shadow]/[Roar]. [Midnight Flame] triggers phase change; [Radiant Bulwark] group up. [Dread Breath] marked spread; [Shadow] dispel promptly.",
                ["normal"] = "Vaelgor's [Void Beam]/[Forbidden Zone]/[Breath] alternate with Ezzorak's [Shadow]/[Roar]. [Midnight Flame] triggers phase change; [Radiant Bulwark] group up. [Dread Breath] marked spread; [Shadow] dispel promptly.",
                ["heroic"] = "Vaelgor's [Void Beam]/[Forbidden Zone]/[Breath] alternate with Ezzorak's [Shadow]/[Roar]. [Midnight Flame] triggers phase change; [Radiant Bulwark] group up. [Dread Breath] marked spread; [Shadow] dispel promptly.",
                ["mythic"] = "Vaelgor's [Void Beam]/[Forbidden Zone]/[Breath] alternate with Ezzorak's [Shadow]/[Roar]. [Midnight Flame] triggers phase change; [Radiant Bulwark] group up. [Dread Breath] marked spread; [Shadow] dispel promptly.",
                ["mythicplus"] = "Vaelgor's [Void Beam]/[Forbidden Zone]/[Breath] alternate with Ezzorak's [Shadow]/[Roar]. [Midnight Flame] triggers phase change; [Radiant Bulwark] group up. [Dread Breath] marked spread; [Shadow] dispel promptly.",
            },
        },
        ["光盲先锋军"] = {
            type = "BOSS",
            name = "Lightblinded Vanguard",
            tipsByDifficulty = {
                ["lfr"] = "[Execution Order] marked catch orb / stomp circle; [Holy Storm] tornado avoid; [Holy Bell] dodge shield. [Judgment] swap tanks; pre-lay mitig for [Tyr's Wrath].",
                ["normal"] = "[Execution Order] marked catch orb / stomp circle; [Holy Storm] tornado avoid; [Holy Bell] dodge shield. [Judgment] swap tanks; pre-lay mitig for [Tyr's Wrath].",
                ["heroic"] = "[Execution Order] marked catch orb / stomp circle; [Holy Storm] tornado avoid; [Holy Bell] dodge shield. [Judgment] swap tanks; pre-lay mitig for [Tyr's Wrath].",
                ["mythic"] = "[Execution Order] marked catch orb / stomp circle; [Holy Storm] tornado avoid; [Holy Bell] dodge shield. [Judgment] swap tanks; pre-lay mitig for [Tyr's Wrath].",
                ["mythicplus"] = "[Execution Order] marked catch orb / stomp circle; [Holy Storm] tornado avoid; [Holy Bell] dodge shield. [Judgment] swap tanks; pre-lay mitig for [Tyr's Wrath].",
            },
        },
        ["陨落之王萨哈达尔"] = {
            type = "BOSS",
            name = "Fallen-King Salhadaar",
            tipsByDifficulty = {
                ["lfr"] = "Arrange interrupts for [Shattered Projection]; [Entropic Collapse] group up and mitig; focus-fire [Void Convergence] orbs. Dodge [Shattered Twilight Spike] and [Filth Pool] with movement.",
                ["normal"] = "Arrange interrupts for [Shattered Projection]; [Entropic Collapse] group up and mitig; focus-fire [Void Convergence] orbs. Dodge [Shattered Twilight Spike] and [Filth Pool] with movement.",
                ["heroic"] = "Arrange interrupts for [Shattered Projection]; [Entropic Collapse] group up and mitig; focus-fire [Void Convergence] orbs. Dodge [Shattered Twilight Spike] and [Filth Pool] with movement.",
                ["mythic"] = "Arrange interrupts for [Shattered Projection]; [Entropic Collapse] group up and mitig; focus-fire [Void Convergence] orbs. Dodge [Shattered Twilight Spike] and [Filth Pool] with movement.",
                ["mythicplus"] = "Arrange interrupts for [Shattered Projection]; [Entropic Collapse] group up and mitig; focus-fire [Void Convergence] orbs. Dodge [Shattered Twilight Spike] and [Filth Pool] with movement.",
            },
        },
        ["宇宙之冠"] = {
            type = "BOSS",
            name = "Crown of the Cosmos",
            tipsByDifficulty = {
                ["lfr"] = "P1 [Silver Arrow] marked spread; [Obelisk] stand on points; interrupt [Tremor]; [Void Spit] mitig; during transition dodge [Barrage] lines. P2 handle [Mark]/[Venom Sting]/[Summon Add]/[Bulwark]; P3 [Platform Swap] and [Chain] spread.",
                ["normal"] = "P1 [Silver Arrow] marked spread; [Obelisk] stand on points; interrupt [Tremor]; [Void Spit] mitig; during transition dodge [Barrage] lines. P2 handle [Mark]/[Venom Sting]/[Summon Add]/[Bulwark]; P3 [Platform Swap] and [Chain] spread.",
                ["heroic"] = "P1 [Silver Arrow] marked spread; [Obelisk] stand on points; interrupt [Tremor]; [Void Spit] mitig; during transition dodge [Barrage] lines. P2 handle [Mark]/[Venom Sting]/[Summon Add]/[Bulwark]; P3 [Platform Swap] and [Chain] spread.",
                ["mythic"] = "P1 [Silver Arrow] marked spread; [Obelisk] stand on points; interrupt [Tremor]; [Void Spit] mitig; during transition dodge [Barrage] lines. P2 handle [Mark]/[Venom Sting]/[Summon Add]/[Bulwark]; P3 [Platform Swap] and [Chain] spread.",
                ["mythicplus"] = "P1 [Silver Arrow] marked spread; [Obelisk] stand on points; interrupt [Tremor]; [Void Spit] mitig; during transition dodge [Barrage] lines. P2 handle [Mark]/[Venom Sting]/[Summon Add]/[Bulwark]; P3 [Platform Swap] and [Chain] spread.",
            },
        },
    },
    ["孢陨幽境"] = {
        name = "Sporefall Sanctum",
        ["腐沼"] = {
            type = "BOSS",
            name = "The Rot",
            tipsByDifficulty = {
                ["lfr"] = "[Awakened Fungus] adds focus-fire; [Fungal Bloom] group up and mitig; handle [Vine] marked; [Bursting Pustule] spread. [Putrid Fist] swap tanks.",
                ["normal"] = "[Awakened Fungus] adds focus-fire; [Fungal Bloom] group up and mitig; handle [Vine] marked; [Bursting Pustule] spread. [Putrid Fist] swap tanks.",
                ["heroic"] = "[Awakened Fungus] adds focus-fire; [Fungal Bloom] group up and mitig; handle [Vine] marked; [Bursting Pustule] spread. [Putrid Fist] swap tanks.",
                ["mythic"] = "[Awakened Fungus] adds focus-fire; [Fungal Bloom] group up and mitig; handle [Vine] marked; [Bursting Pustule] spread. [Putrid Fist] swap tanks.",
                ["mythicplus"] = "[Awakened Fungus] adds focus-fire; [Fungal Bloom] group up and mitig; handle [Vine] marked; [Bursting Pustule] spread. [Putrid Fist] swap tanks.",
            },
        },
    },
}
