#

> A lightweight in-game strategy assistant for World of Warcraft that puts concise, battle-tested "one-sentence" tactics right at your fingertips — for every 5-player dungeon, Mythic+ dungeon, and raid boss from Classic (1.0) through 至暗之夜 (The War Within, 12.1).

BossTips displays short, scannable boss and trash strategies inside the game, so you can remind your group of the key interrupts, soak/avoid mechanics, and priority kills without alt-tabbing to a website. Strategies are shown in a compact window you can send straight to raid / party / say / yell chat with one click.

Originally created by **nga_以德报德**, the addon was fully rebuilt on the **Ace3 framework** (from 1.3.0) and is actively maintained with current content. The original author's copyright and credits are preserved.

---

## Features

- **One-sentence strategies for everything.** Must-interrupt and priority skills are flagged with raid markers (`{rt1}` star / `{rt8}` skull) so the important stuff jumps out at a glance.
- **Full version coverage.** Built-in guides for **125 native 5-player dungeons (1.0–12.0)**, the **8-dungeon current Mythic+ season pool**, and **raid guides spanning 13 tiers and 439 bosses (1.0 Classic → 12.1 至暗之夜)**.
- **Five difficulty tracks.** LFR / Normal / Heroic / Mythic / Mythic+. Each boss can carry per-difficulty strategies; raid guides are cumulative (a higher difficulty already includes the lower ones). New difficulty-display toggles let you hide difficulties you don't care about.
- **In-dungeon auto-trigger.** When you enter a dungeon, a floating **BossTips** button appears near the chat frame. Match the dungeon name → spawn one button per boss → click a boss → strategy window → one-click send. No hover-NPC trickery required (12.0+ encrypts hostile NPC info client-side, so the old auto-prompt model no longer works).
- **Built-in guide editor (`BossTipsGuideManager`).** Add / rename / delete dungeons and targets, edit per difficulty, auto-fill boss encounter IDs from DBM / BigWigs, and export / import your custom guides as base64 (pure-Lua, cross-client safe).
- **Native options panel.** Configure everything via `ESC → Options → AddOns → BossTips`, or with slash commands (`/bts set`, `/bts edit`, `/bts manage`, `/bts help`). Right-click the main button opens Settings directly.
- **Flexible sending.** Send to RAID / PARTY / SAY / YELL. Left- and right-click send channels are independently configurable; right-click a boss button sends its strategy directly without opening the window (great in combat).
- **Smart in-dungeon matching.** Matches by exact name → normalized name → alias → instanceId fallback, so 至暗之夜 (12.0/12.1) instances trigger reliably.
- **Works fully offline.** Ships with embedded Ace3 libraries — no external dependencies, no internet needed.

---

## Supported Content

| Category                   | Coverage                                                                        |
| -------------------------- | ------------------------------------------------------------------------------- |
| 5-player dungeons (native) | **125 dungeons**, versions **1.0 – 12.0** (至暗之夜)                                 |
| Mythic+                    | Current season pool — **8 dungeons** (4 current-rotation + 4 remastered legacy) |
| Raids                      | **13 tiers, 439 bosses**, versions **1.0 – 12.1** (至暗之夜), per-difficulty        |
| Client compatibility       | **WoW Retail 12.0 / 12.1** (`.toc` interface `120005`–`120200`; 12.2-safe)      |

---

## How to Use

1. Enter a dungeon / raid. A **BossTips** floating button appears near the chat frame.
2. **Left-click the main button** → the boss list for the current instance pops out.
3. **Click a boss name** → the strategy window opens; click **Send** to post it to the configured channel.
4. **Right-click a boss button** → sends that boss's strategy directly to the right-click channel (skips the window).
5. **Right-click the main button** → opens the Settings window.
6. No active guide? The floating button stays visible and opens the editor so you can browse or add your own notes.

Slash commands: `/bts set` (settings) · `/bts edit` (editor) · `/bts manage` (guide manager) · `/bts help`.

---

## What's New in 1.4.4

- **Localized boss name fix** — BOSS and trash names in the editor and strategy window now display correctly in the current language (zhCN / zhTW / enUS), no longer falling back to Simplified Chinese when the data uses the nested `tipsByDifficulty` format.
- **Translation generator cleanup** — `_regen_trans_perdiff.py` moved to `tools/`; `convert_name` now harvests existing localized names from guide headers and falls back to existing English text when an EN mapping is missing, preventing M+ / raid regeneration from reverting to CJK.
- **Code cleanup** — removed 5 unused functions and 1 duplicate alias (`EncodeGuidesOnly`, `ConfigStrToValue`, `IsCustomDungeon`, `IsCustomRaid`, `PathNewRaidVersion`, duplicate `ApplyAce3Backdrop` export); removed the temporary `_scratch/` directory and redundant `.bak` files.
- **About panel refresh** — author order updated to `nga_babyfenei, nga_以德报德`; NGA / CurseForge links now use a "Copy Link" button (focuses a hidden edit box for Ctrl+C copying); NetEase DD / HeiHe Workshop changed to plain text instructing users to search for "BossTips" on those platforms.

## What's New in 1.4.3

- **Full raid guide coverage** — complete raid strategies for all 13 tiers (Classic 1.0 → 至暗之夜 12.1), 439 bosses, with per-difficulty (LFR / Normal / Heroic / Mythic / Mythic+) strategies. A new dedicated **Raids** tab in the guide manager is auto-populated from the raid data files.
- **Difficulty-aware display** — the strategy window auto-detects your current difficulty and shows that difficulty's guide; new difficulty-display toggles let you hide unwanted difficulties with safe auto-fallback.
- **12.0 / 12.1 (至暗之夜 / The War Within) content** — added the Venomous Abyss (毒渊) raid (12.1 S2) and native 5-player dungeons for 12.0, plus the 12.1 Mythic+ season pool (8 dungeons).
- **Guide manager & editor** — settings tree split into 5-player / raid sections with Mythic+ pinned to top; per-difficulty editing with DBM / BigWigs encounter-ID auto-fill; export / import rewritten to pure-Lua base64 (cross-client safe) for custom guides and full config.
- **Usability & stability fixes** — main button layer lowered to LOW (no longer overlaps UI); fixed the "auto" mode where the button could be hidden with no entry point (floating button now always visible); right-click send registration fixed; several load-time crashes resolved (missing localization reference, `SetHyperlinksEnabled` nil, FontString hyperlink fallback); smarter in-dungeon matching via exact / normalized name → alias → instanceId fallback.

---

## Credits

Thanks to **nga_以德报德** (original author), the WA / guide authors, and data sources **Wowhead / Icy-Veins / 17173 / NGA**. Full credit list in the README.

Feedback & bug reports: <https://gitee.com/fenei/BossTips>

> CurseForge: <https://legacy.curseforge.com/wow/addons/bosstips>
