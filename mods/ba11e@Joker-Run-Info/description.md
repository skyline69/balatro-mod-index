# Joker Run Info

[Download on Nexus Mods](https://www.nexusmods.com/balatro/mods/901)

A Balatro mod that adds a **Jokers** page to the Run Info screen: every Joker you
have, what it currently gives, and drag-and-drop reordering.


## What it does

- New **Jokers** tab next to Poker Hands / Blinds / Vouchers / Stake.
- **Reorder by dragging**, including between rows. Joker order decides trigger
  order, and this is easier than dragging cards around a full board.
- Shows each Joker's real card, so hovering gives the full live description.
- Under every Joker:
  - **Editions** and what they give — `Foil +50`, `2X Polychrome X2.25`
  - **Stickers** — Eternal, Perishable with rounds left, Rental, Pinned, and
    stickers added by other mods
  - **Debuffed** state
  - The Joker's **current value**
- **Board totals** at the bottom: summed Chips and Mult, multiplied XMult and
  XChips across every Joker, debuffed ones excluded.
- Joker slot counter in the header, including slots from Negative editions.
- Pages when the board outgrows two rows, with `<` / `>` buttons to move Jokers
  across page boundaries.

Larger boards page, and the `<` / `>` buttons appear so a Joker can be moved past a
page boundary:


## Requirements

- [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector)
- [Steamodded](https://github.com/Steamodded/smods) 1.0.0~BETA or newer

Optional, both picked up automatically:

- [Stacked Editions](https://github.com/ba11e-mos/balatro-stacked-editions) —
  edition counts per Joker
- [JokerDisplay](https://github.com/nh6574/JokerDisplay) — its condition-aware
  values feed the totals where it provides them

## Install

Put the `JokerRunInfo` folder in your Balatro `Mods` folder:

| OS | Path |
| --- | --- |
| Windows | `%APPDATA%\Balatro\Mods` |
| macOS | `~/Library/Application Support/Balatro/Mods` |
| Linux (Proton) | `steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods` |

It has to end up as `Mods/JokerRunInfo/manifest.json`, not one folder deeper.

## About the totals

The totals read what each card currently holds, plus its edition bonuses. Jokers
that derive their value from run state are computed live with vanilla's own
formulas — Bootstraps, Bull, Stone Joker, Blue Joker, Steel Joker, Abstract Joker,
Erosion, Fortune Teller and Cloud 9.

Two things follow from that:

- Conditional Jokers count even when their condition is not met, so the row is an
  upper bound, not a prediction. It is labelled accordingly.
- Jokers whose value only exists while scoring — Supernova, Baseball Card,
  Blueprint's copied effect — add nothing, because there is no number to read and
  no safe way to ask them without triggering their side effects.

## Notes

Pure Lua, no Lovely patches: it wraps `G.UIDEF.run_info` and `create_tabs`, so
tabs added by other mods survive. Reordering swaps entries in `G.jokers.cards`,
which is exactly what dragging a Joker on the board does. Pinned Jokers still sort
to the front, as in vanilla.

## License

[MIT](LICENSE)
