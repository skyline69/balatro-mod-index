# Showstreak

Keep a winning streak across fresh Balatro runs, with the Showman choosing your next deck and introducing new rules between acts.

Spend Gold Stars on props, tricks, vouchers and packs between runs. Prepare your next attempt, accept bets and decide which masks to face. A defeat ends the series; returning to the menu or closing the game does not.

## Features

- A continuing series of fresh runs, with growing stakes and lasting conditions.
- A separate shop and held inventory: buy props or tricks, then use them when you want their effects.
- Easy, Standard and Hard presets, plus a rules editor and JSON preset sharing.
- Optional Intermissions that reset accumulated local effects while keeping the total streak.
- Profile-specific Dark Stars earned by completing acts with official presets. Lore purchases and story entries are future content.
- Showman dialogue and animated reactions, separate voice and effect settings, and reduced-motion support.
- UI and dialogue in 15 languages, including English and Russian.
- A public integration API for independently written items, decks and Showman dialogue.

## Requirements and installation

Requires **Balatro**, **Lovely 0.9 or newer** and **Steamodded 26.829.0 or newer**. Talisman is not required. Install the required loaders separately; they are not included in the player ZIP.

For manual installation, fully close Balatro and extract the ZIP's `Showstreak` folder into your Balatro `Mods` folder. On Windows, the result should include `%AppData%\Balatro\Mods\Showstreak\main.lua`. Avoid an extra nested `Showstreak` folder. Restart the game, then open **To Show** on the main-menu panel and choose **New Series**.

The tested baseline is Windows with Balatro 1.0.1o-FULL, Lovely 0.9.0 and Steamodded 26.829.0. This does not certify every operating system, future loader or combination of mods. Modded decks need explicit Showstreak adapters.

## Updating and saves

Close the game before updating. Back up each profile's `showstreak-a.jkr`, `showstreak-b.jkr` and `showstreak-run.jkr` together, plus personal settings and presets under `config/Showstreak`. The shared settings file is `config/Showstreak.jkr`.

Replace only the installed `Mods/Showstreak` folder. Keep backups outside `Mods`, and preserve any JSON files you placed in the old folder's `presets/import`. Existing series retain their saved rules and content catalog; missing required content providers can block continuation.

## Downloads and support

- [GitHub releases](https://github.com/TraditionalDimension/Showstreak/releases/latest)
- [Nexus Mods](https://www.nexusmods.com/balatro/mods/947)

For problems, include the mod, game and loader versions, operating system, other installed mods, reproduction steps and the relevant error or Lovely log. See the README and KNOWN_ISSUES included with the release for gameplay details and validation limits.

By **TraditionalDimension**. Showstreak uses custom terms; it is not open source. See the author's [published terms](https://github.com/TraditionalDimension/Showstreak/blob/main/LICENSE) for permissions.
