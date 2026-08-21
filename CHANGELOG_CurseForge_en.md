# BossTips 1.4.4 — Update Notes

This release focuses on localization robustness, code cleanup, and a refreshed About panel.

## What's New

### Localized Boss Name Fix
- BOSS and trash names in the editor and strategy window now display correctly in the current language (zhCN / zhTW / enUS).
- Fixed a fallback bug where names stored in the nested `tipsByDifficulty` format would revert to Simplified Chinese.

### Translation Generator Cleanup
- `_regen_trans_perdiff.py` moved from `_scratch/` to `tools/`.
- `convert_name` now harvests existing localized names from guide headers and falls back to existing English text when an EN mapping is missing, preventing M+ / raid regeneration from reverting to CJK.

### Code Cleanup
- Removed 5 unused functions and 1 duplicate alias:
  - `EncodeGuidesOnly`, `ConfigStrToValue` (Data.lua)
  - `IsCustomDungeon`, `IsCustomRaid`, `PathNewRaidVersion` (Editor.lua)
  - Duplicate `addon.ApplyAce3Backdrop` export (Data.lua)
- Removed the temporary `_scratch/` directory and redundant `.bak` files.

### About Panel Refresh
- Author order updated to `nga_babyfenei, nga_以德报德`.
- NGA / CurseForge links now use a "Copy Link" button: clicking focuses a hidden edit box and selects the URL so players can copy it with Ctrl+C.
- NetEase DD / HeiHe Workshop changed to plain text: users are instructed to search for "BossTips" on those domestic platforms.

## Compatibility
- Content coverage unchanged: **125 native 5-player dungeons (1.0 – 12.0)**, **8 Mythic+ Current dungeons**, and **raid guides for 13 tiers (439 bosses)**.
- Compatible with **WoW Retail 12.0 / 12.1** (`.toc` interface `120005`–`120200`; 12.2-safe).
- Ships with embedded Ace3 libraries — works fully offline.

## Credits
Thanks to **nga_以德报德** (original author), the WA / guide authors, and data sources Wowhead / Icy-Veins / 17173 / NGA. Full credit list in the README.

Feedback & bug reports: https://gitee.com/fenei/BossTips

---

# BossTips 1.4.3 — Update Notes

Thanks for using BossTips! This release is a major content expansion focused on **full raid coverage** and **difficulty-aware strategies**, plus a round of usability and stability fixes for WoW 12.0 / 12.1.

## What's New

### Full Raid Guide Coverage — Every Tier, Every Boss
- Complete raid strategies for **all 13 raid tiers from Classic (1.0) through Midnight (12.1)** — **439 bosses** in total.
- Each boss supports **per-difficulty strategies** (LFR / Normal / Heroic / Mythic / Mythic+). Raid guides are written cumulatively: a higher difficulty already contains everything from the lower ones.
- New dedicated **Raids** tab in the guide manager / settings panel, auto-populated from `Guides/Raids/vXX.lua` — adding a raid file makes it appear automatically, no manual registration needed.

### Difficulty-Aware Display
- Five difficulty tracks are now fully supported for both 5-player dungeons and raids: Random (LFR) / Normal / Heroic / Mythic / Mythic+.
- The strategy window auto-detects your current difficulty when you enter an instance and shows that difficulty's guide. You pick the difficulty, you see that difficulty's guide.
- New **difficulty display toggles** in Settings — turn off any difficulty you don't care about; auto-switch falls back to the first enabled difficulty.

### 12.0 / 12.1 (至暗之夜 / The War Within) Content
- Added the **Venomous Abyss (毒渊)** raid guide (12.1 Season 2) and native 5-player dungeons for 12.0.
- Added the **12.1 Mythic+ season pool**: 8 dungeons (4 current-rotation + 4 remastered legacy dungeons), merged into the shared strategy layer.
- Both 12.0 and 12.1 are labeled **"至暗之夜 / The War Within"**.

### Guide Manager & Editor
- Raid and 5-player dungeons are now separated in the settings tree; Mythic+ is pinned to the top.
- Per-difficulty editing in the standalone editor; boss encounter IDs auto-fill from DBM / BigWigs.
- Export / Import rewritten to pure-Lua base64 (cross-client safe) — player custom guides and full configuration can be exported and re-imported reliably.

### Usability & Stability Fixes
- Floating main button layer lowered to LOW so it no longer overlaps other UI frames.
- Fixed the "auto" mode where the button could be hidden with no visible entry point — the floating button is now always available; clicking it with no active guide opens the editor to browse.
- Right-click send channel registration fixed; right-click the main button to open Settings directly.
- Resolved several load-time crashes (missing localization reference, `SetHyperlinksEnabled` nil guard, FontString hyperlink fallback) that could leave the window blank.
- Smarter in-dungeon matching: matches by exact name → normalized name → alias → instanceId fallback, fixing cases where 12.0 / 12.1 instances failed to trigger.

## Compatibility
- Built-in guides: **125 native 5-player dungeons (1.0 – 12.0)**, **8 Mythic+ Current dungeons**, and **raid guides for 13 tiers (439 bosses)**.
- Compatible with **WoW Retail 12.0 / 12.1** (`.toc` interface `120005`–`120200`; 12.2-safe).
- Ships with embedded Ace3 libraries — works fully offline, no external dependencies.

## Credits
Thanks to **nga_以德报德** (original author), the WA / guide authors, and data sources Wowhead / Icy-Veins / 17173 / NGA. Full credit list in the README.

Feedback & bug reports: https://gitee.com/fenei/BossTips
