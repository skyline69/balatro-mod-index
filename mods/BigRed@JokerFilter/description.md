# Joker Filter

Joker Filter is a Balatro mod that extends Cartomancer's Joker controls with compact filter pills to quickly triage large Joker piles.
 
It is designed for runs where the default Joker row becomes too crowded to manage efficiently. Instead of relying on popups or hotkeys, Joker Filter adds filter buttons directly to Cartomancer's existing control strip, alongside the Hide/Zoom controls.

## Features

- Integrates directly into **Cartomancer's Joker toolbar**
- Active filter pill is **red**, inactive pills are **blue**
- Shows a live count on each pill
- Hides zero-count special pills automatically while keeping **All**, **Slot**, and **Rarity** visible
- **Slot** shows the current Slot count plus free or over capacity
- Filters Jokers without opening extra windows or menus
- Includes an **in-game Config tab** in the Steamodded Mods menu

### Current filters

- **All** — show every Joker and reset the rarity pill to the configured default / rarest currently available rarity
- **Slot** — Jokers that take a normal slot (not Negative, not Extra), shown as `count (x free)` or `count (x over)`
- **Neg** — Jokers with Negative
- **Extra** — Jokers with an explicit extra-slot / card-limit bonus, excluding Negative Jokers
- **Temp** — Rental, Perishable/Expiring, self-destruct, and tightly-scoped temporary-duration Jokers
- **Retrig** — Jokers whose description includes retrigger wording
- **Destroy** — Jokers whose description contains active destructive wording like `destroys` or `convert all`
- **OnSell** — Jokers with sell-trigger style effects
- **Rarity** — a cycling pill that steps through rarity buckets from rarest to most common
- **Perm** — Jokers with the Eternal or Absolute stickers

## Requirements

- **Balatro**
- **Steamodded**
- **Cartomancer**

Joker Filter currently depends on Cartomancer because it patches Cartomancer's Joker control row instead of creating a separate floating UI.

## Configuration

Joker Filter supports two ways to configure it:

- edit `config.lua` directly
- or use the **Config** tab in the in-game Steamodded Mods menu

From there you can:
- change the default filter
- change the button scale
- change the rarity default behavior
- hide or show individual pills

## Notes

- **All** acts as the reset/default filter.
- The rarity pill starts on the configured default rarity, or on the rarest rarity currently present when configured that way, but remains inactive until clicked.
- Description-based filters intentionally use heuristics and may need tuning for specific mod packs.
- Current synced file set: **0.5.6**
