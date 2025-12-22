<div align="center">
    <h1> 🌏TEOcean Localization Framework🌎 </h1>
    <p>Also is a language pack</p>
    <p><a href="https://github.com/mleaf233/TEOcean/blob/main/README_zh_CN.md">简体中文</a> &nbsp;&nbsp; English</p>
    <img src="https://img.shields.io/github/license/mleaf233/TEOcean">
    <a href="https://github.com/mleaf233/TEOcean/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
</div>

---

## Introdution

A lightweight localization framework for mods in the Balatro/SMODS, which also functions as a language pack.

## Use Cases

- Fill in missing localization for a mod  
- Override the original translations of a mod  
- Apply a unified translation across multiple mods  
- When a target mod is still under active development and its localization files change frequently, making PRs inconvenient  

## How It Works

Translation files under `impl/mods/<modid>/localization/` are merged into the corresponding target mod’s `localization/` directory, allowing unified translations to override or supplement the originals in-game.

## Features

- **Merge by modid**: Iterates over `SMODS.mod_list` and only performs merging for mods that exist in the workspace at `impl/mods/<modid>/`
- **Backup original files (once only)**: Before the first merge, the target mod’s existing `localization/<lang>.lua` / `.json` files are copied to `impl/backup/<modid>/localization/`. If a backup already exists, it is skipped to ensure the backup always represents the “original” localization files
- **Skip meaningless writes**: Before writing, the merged result is normalized for newlines and trailing whitespace and compared with the existing file. If they are identical, no write or backup is performed
- **Hot reload**: Supports execution when clicking the “Manual Reload” button in the mod configuration menu in-game

## How to Use

### Method 1

- Like any other mod, simply copy the entire project folder into `%AppData%/Balatro/mods`

### Method 2 (Hot Reload)

1. Launch the game.  
2. Open the main menu → Mods.  
3. Select the mod(this mod itself is **The Eighth Ocean**) and enter the `Config` tab.  
4. Click the **Manual Reload** button to trigger merging and reload.

> Note: The initial backup preserves the original files of the target mod at the moment it is triggered.  
> To force a fresh backup of the original files, manually delete the corresponding backup files under  
> `impl/backup/<modid>/localization/`, then click Manual Reload again.


## Development

- The merge logic is implemented in `mod.lua`, in the function `merge_impl_mod_localizations()`, which handles reading, merging, serialization, and writing.
- To support additional mods, create a new folder under `impl/mods/` according to the modid. Refer to the existing examples for details.
- It is recommended to ensure this mod loads with higher priority than the mods it adapts.

## Directory Structure

- `impl/mods/<modid>/localization/` — Source of your override/supplemental translations  
- `impl/backup/<modid>/localization/` — Automatic backup of the target mod’s original localization (backed up once only)  
- Target write path: `<target_mod_path>/localization/<lang>.lua`

## Troubleshooting

- If no backup or output is generated after clicking the button, check the game startup logs (console output) for entries prefixed with `[TEOcean Language Packs]`.
- Ensure the target mod’s `localization/` directory is writable.
- If the localization still does not take effect after merging, confirm that the selected in-game language (`G.SETTINGS.language`) matches the merged language file (e.g. `zh_CN.lua`).

## License

- This project is licensed under GPLv3.
- Please comply with each mod’s individual license terms. This mod only modifies the target mod’s `localization` files locally; make backups when necessary and obtain the original author’s permission before distribution.