# Balatro Seed Suite

**Find the seed. See what it holds. Play it the way that gets you there.**

Four tools for seeded runs and a shared library, in one Lovely mod. Steamodded is not needed.

- **Seed Finder** (the **Find** tab on the Play screen). It searches seeds on worker threads for filters you build from clauses: skip tags, the boss, vouchers, the Soul's legendary, a Soul in a Charm or Ethereal pack, shop jokers by ante N (with a reroll budget), packs and editions.
  - **Odds** tells you how rare a hit is before you search.
  - Hits are ranked by what they cost to deliver, and **Route** lists the exact plays for each one.
  - **Play** starts the hit as an unseeded run, so it counts for unlocks.
- **Seed Oracle** (`Ctrl+O` in a run). It shows each ante's skip tags, boss, voucher and Soul legendary, the shop on the shelf and after each reroll, and what every pack holds.
  - **What-if toggles** (skip Small or Big, rerolls 0–5) predict again without touching your run.
  - A **divergence banner** tells you when the live shop stops matching the prediction, and why.
- **Save Slots** (the **Saves** tab). Named saves with a card-level preview, favorites, folders and search, per-ante checkpoints, practice scenarios and share codes.
- **Run Journal**. It records every run, with stats by deck, stake and joker, same-seed comparisons and CSV/JSON export.

Predictions come from the game's own generation code, and a test rig checks them against real seeded runs of the actual game.

Requires Lovely 0.9 or newer. Tested on Balatro 1.0.1o. It works offline and leaves achievements alone.

Works alongside Steamodded, which lists it in its Mods menu. Checked against the real Steamodded game, it makes the same cards as vanilla, but it rolls editions and picks bosses its own way. So under Steamodded, the Oracle leaves editions out and marks later bosses unverified, and the Finder skips boss clauses and edition requirements. With content mods that add cards to the pools, the Oracle and Finder switch off and say why.

Source, screenshots and FAQ: https://github.com/r-metal/balatro-seed-suite
