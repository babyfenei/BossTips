### BossTips World of Warcraft One-Sentence Strategy Addon

> **Current Version: 1.4.4 (Ace3 rewrite)**
>
> Built-in guides: **125** native 5-player dungeons (versions 1.0 – 12.0), **8** Mythic+ Current pool dungeons, and raid guides for **13 tiers covering 439 bosses**.
> Compatible with WoW Retail 12.0 / 12.1 clients.

---

First of all, I would like to thank the elder brother nga_以德报德 for the addon. I only made modifications and improved the current boss and trash mob data for Version 11 on the basis of his addon.

The original post address of 以德报德 is as follows: [Late Dungeon One-Sentence Strategy Addon (Including data for 8 new 5-player dungeons in the War Within and the first 4 bosses in the raid)](https://ngabbs.com/read.php?tid=41626672)

The modified addon retains the original author's copyright and link information. You can also check it in the original author's post. If elder brother 以德报德 has any questions, this post can be deleted.

The reason for opening another post is to re-improve this addon and keep it updated in the future, because few people will scroll to the later part in the original author's post to check.

---

## 📂 File Structure

```text
BossTips/
├── Ace3/                          Embedded Ace3 libraries (works offline, no external deps)
├── Libs/                          Other embedded libraries
├── Guides/                        Guide data (per-version files, auto-discovered at runtime)
│   ├── Dungeons/                  Native 5-player: v1.0.lua … v18.0.lua (v13.0–v18.0 are empty stubs)
│   ├── MPlus/                     Mythic+: Current.lua (current season pool)
│   └── Raids/                     Raids: v1.0.lua … v12.1.lua
├── BigWigsIdDB.lua                BigWigs encounter-ID database
├── FallbackIdDB.lua               Fallback ID database
├── Core.lua                       Core logic
├── Data.lua                       Data layer / sending
├── Editor.lua                     Guide editor
├── Settings.lua                   Settings
├── Window.lua                     Strategy window
├── Locales.lua                    Localization
├── embeds.xml                     Library load manifest
├── BossTips.toc                   Version & load manifest (packaging source of truth)
├── logo.png                       Minimap icon
├── images/                        README screenshot assets
├── README.md                      Chinese documentation
├── README.en.md                   English documentation
├── CHANGELOG_CurseForge_en.md     CurseForge changelog (English)
└── CurseForge_Description_en.md    CurseForge full description (English)
```

## ✨ Key Features

- **One-sentence strategies** — key interrupts, kill-priority and avoid mechanics are flagged with `{rt1}` (star) / `{rt8}` (skull) markers so the important stuff jumps out.
- **Full version coverage** — built-in guides for 125 native 5-player dungeons (1.0–12.0), 8 current Mythic+ dungeons, and 13 raid tiers (439 bosses).
- **Five difficulty tracks** — LFR / Normal / Heroic / Mythic / Mythic+; per-boss per-difficulty strategies, raid guides cumulative (higher includes lower), with toggles to hide unwanted difficulties.
- **In-dungeon auto-trigger** — a floating BossTips button appears near the chat frame on entering a dungeon → matches the dungeon name → one button per boss → click → strategy window → one-click send to chat.
- **Built-in guide editor** — add / rename / delete dungeons and targets, per-difficulty editing, DBM / BigWigs encounter-ID auto-fill, base64 export / import (cross-client safe).
- **Native options panel** — `ESC → Options → AddOns → BossTips`, or `/bts set`, `/bts edit`, `/bts manage`, `/bts help`.
- **Flexible sending** — RAID / PARTY / SAY / YELL, left/right-click channels independently configurable; right-click a boss button sends directly.
- **Smart matching** — exact name → normalized name → alias → instanceId fallback, so 12.0 / 12.1 (至暗之夜 / The War Within) trigger reliably.
- **Fully offline** — embedded Ace3, no internet required.

---

## ✨ Update Notes

> Starting from **1.3.0**, the addon has been **fully rewritten on the Ace3 framework**. The old "single-file + hover NPC auto-prompt" model has been replaced by a "standalone editor + dungeon name match + manual send" model, and in **1.3.2** the settings UI has been integrated into the native Blizzard options panel.

### 1.4.4 (Latest)

1. **Localized boss name fix**: BOSS and trash names in the editor and strategy window now display correctly in the current language (zhCN / zhTW / enUS) instead of falling back to Simplified Chinese when the data uses the nested `tipsByDifficulty` format.
2. **Translation generator cleanup**: `_regen_trans_perdiff.py` moved to `tools/`; `convert_name` now harvests existing localized names from guide headers and falls back to existing English text when an EN mapping is missing, preventing M+ / raid regeneration from reverting to CJK.
3. **Code cleanup**: removed 5 unused functions and 1 duplicate alias (`EncodeGuidesOnly`, `ConfigStrToValue`, `IsCustomDungeon`, `IsCustomRaid`, `PathNewRaidVersion`, duplicate `ApplyAce3Backdrop` export); removed the temporary `_scratch/` directory and redundant `.bak` files.
4. **About panel refresh**: author order changed to `nga_babyfenei, nga_以德报德`; NGA / CurseForge links now use a "Copy Link" button (focuses a hidden edit box for Ctrl+C copying); NetEase DD / HeiHe Workshop changed to plain text instructing users to search for "BossTips" on those platforms.
5. **Content coverage unchanged**: 125 native 5-player dungeons, 8 Mythic+ Current dungeons, 13 raid tiers with 439 bosses; compatible with WoW Retail 12.0 / 12.1.

### 1.4.3

1. **Full raid guide coverage** — complete raid strategies for **all 13 tiers from Classic (1.0) through Midnight (12.1)**, **439 bosses** total, with per-difficulty strategies (LFR / Normal / Heroic / Mythic / Mythic+); raid guides are cumulative so higher difficulties include lower ones.
2. **Difficulty-aware display** — the strategy window auto-detects your current difficulty and shows that difficulty's guide; new **difficulty display toggles** let you hide unwanted difficulties, with auto-switch falling back to the first enabled one.
3. **12.0 / 12.1 (至暗之夜 / The War Within) content** — added the **Venomous Abyss (毒渊)** raid (12.1 S2) and native 5-player dungeons for 12.0; added the **12.1 Mythic+ season pool** (8 dungeons: 4 current-rotation + 4 remastered legacy).
4. **Guide manager & editor** — settings tree split into 5-player / raid sections with Mythic+ pinned to top; per-difficulty editing with DBM/BigWigs encounter-ID auto-fill; export/import rewritten to pure-Lua base64 (cross-client safe) for custom guides and full config.
5. **Usability & stability fixes** — main button layer lowered to LOW (no longer overlaps UI); fixed the "auto" mode where the button could be hidden with no entry point (floating button now always visible, opens the editor to browse when no active guide); right-click send registration fixed and right-click main button opens Settings; fixed several load-time crashes (missing localization reference, `SetHyperlinksEnabled` nil, FontString hyperlink fallback); smarter in-dungeon matching via exact/normalized name → alias → instanceId fallback.
6. **Compatibility** — built-in guides: **125 native 5-player dungeons (1.0–12.0)** + **8 Mythic+ Current** + **13 raid tiers (439 bosses)**; compatible with **WoW Retail 12.0 / 12.1** (`.toc` interface `120005`–`120200`, 12.2-safe); embedded Ace3, works offline.

### 1.3.2

1. **Settings window moved to the native Blizzard options panel** — open via `ESC → Options → AddOns → BossTips`, no standalone window needed
2. **Default send channel changed to YELL**; both left- and right-click send channels are independently configurable in the settings panel (RAID / PARTY / SAY / YELL / YELL)
3. **Right-click the main button to open the settings window directly**
4. **New `/bts set` slash command** to open the settings window

![Settings Tab](images/02-settings-tab.png)

### 1.3.1

1. Updated strategies for the **12.0 S1 season old 4 dungeons**
2. **Right-click a BOSS button to send the strategy directly**, skipping the popup window — much faster in combat
3. Default font size reduced to **14 pt** (was 18 pt)
4. Main button position is now saved **per account** instead of per character
5. BOSS list order now follows the `order` field in `bossdata.lua`; freely reorderable
6. Fixed strategies in the 12.0 S1 old 4 dungeons failing to send
7. Fixed strategies not being sent to chat inside Mythic+ / raid instances when grouped via Premade Groups tool

### 1.3.0 (Major Rewrite)

> **Why rewrite**: WoW 12.0 encrypts hostile NPC info client-side, so the old "hover NPC to auto-show strategy" trick no longer works. The new interaction is: **match dungeon name → spawn one button per BOSS → click button → popup strategy window → one-click send**.

1. Supports **12.0 normal 5-player dungeons** (Season 1 strategies pending)
2. New `/bts settings` command opens the settings menu; configure BOSS button / strategy window pop-out direction
3. **Hide the main button automatically on maps with no strategies** (avoids spurious buttons)
4. Only BOSS strategies retained; trash mob strategies removed to keep the button row short
5. Fixed position-syncing across alts; button/window positions now propagate correctly
6. New `/bts help` slash command

![Test Window](images/01-test-window.png)

---

## 📋 Old vs. New Feature Comparison

| Feature | Old (1.2.x) | New (1.4.4 / Ace3 rewrite) |
|---------|-------------|---------------------|
| Architecture | Single-file Lua | **Ace3 framework + modular layers** (Core/Window/Settings/Editor/Data) |
| Guide storage | Single version, inline | **Versioned files**: `Guides/Dungeons/vXX.lua` + `Guides/Raids/vXX.lua` + `Guides/MPlus/Current.lua` |
| Version coverage | 11.0 – 11.2 | **1.0 – 12.1 all versions** (125 dungeons + 13 raid versions × 439 bosses) |
| Trigger model | Hover NPC to auto-prompt | **Match dungeon name + click BOSS button to send** |
| Difficulty support | None | **LFR / Normal / Heroic / Mythic / Mythic+** five tracks |
| Editor | Edit `BossTips.lua` directly | **Standalone `BossTipsGuideManager` GUI** (preview / per-difficulty edit / base64 export-import) |
| Settings access | `/bts settings` only | **Native options panel + `/bts set` + right-click main button** |
| Default channel | Party > Raid > Say | **YELL** (left/right-click channels independently configurable) |
| Font size / window position | 18 pt / per-character | **14 pt / per-account** |
| Auto-hide | None | **Auto-hide in instance / auto-show out of instance / hide on maps without strategies** |

---

## 📸 Editor & Settings Panel Tour

In-game, open settings via `/bts settings` or `ESC → Options → AddOns → BossTips`. The settings window has three tabs:

| Tab | Purpose |
|-----|---------|
| **Settings** | Display mode, smart expand, lock window, chat channels, font style/size, theme |
| **Guide Config** | Toggle which versions to enable for 5-player dungeons / raids; hide individual dungeons |
| **Config File** | base64 export/import of custom guides and configuration |

![Guide Config Tab](images/03-guide-config-tab.png)

The editor opens from the settings panel's "Open Guide Editor" button or via `/bts edit`, and supports:

- **Add / rename / delete** dungeons and targets
- **Per-difficulty editing** (Normal / Heroic / Mythic / LFR / Mythic+)
- **Auto-fill boss encounter ID** from DBM/BigWigs (used by smart-expand)
- **Text notes**: use `{rt8}` `{rt1}` to mark must-interrupt / priority skills; saved automatically on input

![5-player BOSS editor](images/04-boss-editor-5man.png)

The raid BOSS editor has the same features; difficulty tracks auto-switch with your raid progression (Normal → Heroic → Mythic → Mythic+).

![Raid BOSS editor](images/05-boss-editor-raid.png)

---

## Usage (New Model)

When you enter a dungeon, a **BossTips** floating button appears near the chat frame:

- **No dungeon match / no BOSS selected**: button is disabled and shows "No strategy"
- **Left-click the main button**: pops out the BOSS list for the current dungeon
- **Click a BOSS name**: pops the strategy window; click "Send" to post it to the configured channel
- **Right-click a BOSS button (1.3.1+)**: skips the popup and sends the strategy directly to the configured right-click channel
- **Right-click the main button (1.3.2+)**: opens the settings window directly

Channel priority (configurable): Raid > Party > Say > Yell (1.3.2 defaults to Yell).

---

## 1.2.x Legacy Changelog (Preserved)

### 1.2.9
1. Added 11.2 Mythic+ strategies: 天街 (The Rookery), 宏图 (Cinderbrew Meadery), 生态园 (Darkflame Cleft), 赎罪大厅 (Priory of the Sacred Flame)
2. Manually summarized from Bilibili "于笙Ace" video guides; some inaccuracies possible
3. No 生态园 trash data (no PTR account)
4. The 4 older dungeons rotated into 11.2 still have old strategies; updates pending
5. Fixed dome display bug

### 1.2.8
1. Added font-size adjustment (left-click to enlarge, right-click to shrink; default 18, range 12-32)
2. Fixed King Mechagon not loading correctly
3. Fixed garbled text under some fonts

### 1.2.7
1. Fixed 暴富矿区 (The MOTHERLODE!!) failing to load

### 1.2.6
1. Added some 11.1 Mythic+ trash data (excluding the workshop for now)
2. Mostly summarized from Bilibili UP 羽帆's video guides

### 1.2.5
1. Added 11.1 Mythic+ strategy data
2. Trash data for 11.1 needs in-dungeon testing; only boss strategies for now
3. Strategies collected online, not in-dungeon tested

### 1.2.4 (Preview)
1. 11.1 Mythic+ and raid strategy data added
2. Map-aware button display (shown only on maps with strategies)

### 1.2.3
1. Movable main button (default above chat); position saved to WTF
2. Movable strategy window (default above chat); position saved to WTF
3. Resizable strategy window (drag bottom-right corner)

### Pre-1.2.3 Original Features (Preserved)
1. 11.0 BOSS + trash strategies for all 5-player Mythic+ and normal dungeons (focus on trash must-interrupt and one-shot skills)
2. Strategy window collapsed by default
3. Right-click to toggle collapse/expand and send directly to YELL
4. Expanded state: left-click send button → Raid > Party > Say (auto by party size)
5. Expanded state: right-click send button → YELL
6. All BOSS data first line wrapped with `{rt8}` skull markers showing the name
7. Must-interrupt and other priority skills marked with `{rt1}` star icons
8. Personal expanded view strips `{rt1}` `{rt8}` icons and replaces `||` with line breaks
9. Fixed strategy send order; now strictly follows tips order

---

## 🙏 Credits

Thanks to the following WA authors / translators / data sources:

1. 艾泽拉斯制造 — [Mythic+ Cheat Sheet for Elderly Players (Thanks to LoRexxar's teaching video)](https://bbs.nga.cn/read.php?tid=41807459&fav=:F3C48B05C); trash + some boss info referenced
2. 沢田岚 — [[WA] Chinese Localization of One-Sentence Strategies in Front of All Mythic+ Bosses](https://bbs.nga.cn/read.php?tid=41712204&fav=:FA99311C2); some boss info referenced
3. Fizzle — [TWW Season 1 Dungeon Boss Strats](https://wago.io/VLiBvdxoU); English boss one-liners for 11.0
4. Bilibili UP [羽帆](https://space.bilibili.com/141341784) — 11.1 video guides
5. Bilibili UP [于笙 Ace](https://space.bilibili.com/506324721) — 11.2 video guides
6. WeChat public account "每日艾泽拉斯" — 12.0 text guides
7. Wowhead / Icy-Veins / 17173 — raid boss mechanics and CN localization

---

## 📥 Download / Feedback

- **CurseForge**: [https://legacy.curseforge.com/wow/addons/bosstips](https://legacy.curseforge.com/wow/addons/bosstips)
- **Source / Issues**: [https://gitee.com/fenei/BossTips](https://gitee.com/fenei/BossTips)
- **Domestic platforms**: search for "BossTips" in **NetEase DD** or **HeiHe Workshop** to install.

Feedback format:
```
BOSS/Trash Name - Strategy
Example: Durotar Raider - Stink Spray must be interrupted
```

Comments on this thread or the original NGA post are also welcome.