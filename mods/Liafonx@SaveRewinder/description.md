# Save Rewinder

[简体中文](https://github.com/Liafonx/Balatro-SaveRewinder/blob/main/README_zh.md) | [Changelog](https://github.com/Liafonx/Balatro-SaveRewinder/blob/main/CHANGELOG.md) | [更新日志](https://github.com/Liafonx/Balatro-SaveRewinder/blob/main/CHANGELOG_zh.md)

**Undo mistakes. Experiment freely. Never lose progress.**

Automatically creates save points as you play, letting you rewind to any recent moment with a single keystroke.

## Features

- **Undo misplays** — Accidentally discarded the wrong card? Go back and try again
- **Experiment freely** — Test risky strategies without committing
- **Automatic snapshots** — Creates saves at blind selection, hand play/discard, end of round, and shop
- **Instant restore** — Press `S` to step back, no menus needed
- **Undo your undo** — Rewinded saves stay in the list until you make a new move
- **Full controller support** — L3 to step back, R3 to open saves list

## Save List

Click the **orange "Saves" button** in pause menu or press `Ctrl+S` to open the save browser:

- **Blind icons** — Shows Small/Big/Boss blind image for each save (toggleable)
- **Hover effects** — Animation and sound when hovering over blind icons
- **Current position** — Orange highlight shows where you are
- **Page navigation** — Browse through saves with LB/RB on controller

## Controls

| Action | Keyboard | Controller |
|--------|----------|------------|
| Step back one save | `S` | Click Left Stick |
| Open saves list | `Ctrl+S` | Click Right Stick |

## Configuration

In the Steamodded config menu:

- **Auto-save triggers** — Toggle which moments create saves (blind selection, hand play/discard, end of round, shop)
- **Blind image display** — Show blind icons or round numbers in save list
- **Limit saves** — Keep only recent antes (1, 2, 4, 6, 8, 16, or All)

## Save Management

Saves are stored in `[Balatro Save Path]/[Profile]/SaveRewinder/`

- Saves persist if you quit mid-run — continue later and all saves remain
- **Smart Continue** — When you continue a run, the mod highlights your exact position (even if it's not the latest save)
- Starting a **new run** automatically clears previous saves
- Use "Delete all" in config to manually clear saves

## Languages

- English
- 简体中文 (Simplified Chinese)

---

> ℹ️ **Note**: This mod adds a small `_rewinder_id` field to your save data for accurate position tracking. This does not affect normal gameplay or compatibility with other mods.

