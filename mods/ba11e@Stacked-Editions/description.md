# Stacked Editions

[Download on Nexus Mods](https://www.nexusmods.com/balatro/mods/900)

A Balatro mod that lets one card hold **several editions at once** — Foil + Holo +
Polychrome + Negative, plus any modded edition. Every edition's effect, shader and
badge applies.


## What it does

- **Editions add up instead of replacing each other.** Foil's chips, Holo's mult,
  Polychrome's XMult and Negative's joker slot all apply to the same card.
- **Every shader is drawn**, blended so a stacked card actually looks stacked
  instead of showing only the last edition applied.
- **Badges count duplicates** (`2X Polychrome`), and descriptions show the combined
  value — 2x Polychrome reads X2.25.
- **Vanilla cards can stack.** The Wheel of Fortune, Ectoplasm, Hex and Aura no
  longer refuse targets that already have an edition.

Values with an `x_` prefix multiply, everything else adds. Slots from stacked
Negatives add up too.

## Requirements

- [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector)
- [Steamodded](https://github.com/Steamodded/smods) 1.0.0~BETA or newer

## Install

Put the `StackedEditions` folder in your Balatro `Mods` folder:

| OS | Path |
| --- | --- |
| Windows | `%APPDATA%\Balatro\Mods` |
| macOS | `~/Library/Application Support/Balatro/Mods` |
| Linux (Proton) | `steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods` |

It has to end up as `Mods/StackedEditions/manifest.json`, not one folder deeper.

## Settings

Under **Mods → Stacked Editions**:

| Option | Default | Effect |
| --- | --- | --- |
| Allow duplicate editions | off | The same edition can apply twice (2x Polychrome = X1.5 × X1.5) |
| Blend edition overlays | on | Draw every shader. Off = vanilla look, last shader only |
| Max editions per card | unlimited | Cap on how many editions one card can hold |

With **Blend edition overlays** off, the same board falls back to the vanilla look:
only the last edition's shader is drawn, while the effects and badges still stack.


## For mod authors

`card.edition` stays a single flat table, so `card.edition.negative` and
`card.edition.x_mult` keep working. It also holds `card.edition.editions`, the
ordered list of applied edition keys.

```lua
StackedEditions.stack(card)                      -- edition keys on a card
StackedEditions.can_apply(card, 'e_negative')    -- may this edition be added?
StackedEditions.remove(card, 'e_foil')           -- remove one, keep the rest
StackedEditions.badge_count(card, 'polychrome')  -- how many of that edition
```

If your mod picks edition targets with `not card.edition`, it will never find one
once editions stack. Test the stack instead:

```lua
if StackedEditions.can_apply(card, 'e_negative') then
```

Can't change the other mod? Wrap the function that builds its target pool with
`StackedEditions.with_editions_hidden(fn, skip_key)` — that is how the built-in
Black Seal support works.

## Known limits

- An edition's `calc_scaling` hook only runs for the last applied edition.
- Shop and booster cards still roll at most one edition; stacking comes from
  consumables and jokers.
- Mods that treat editions as mutually exclusive only see the last one applied.

## License

[MIT](LICENSE)
