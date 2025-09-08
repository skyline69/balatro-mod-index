a fully keyboard-driven UX mod for Balatro, with a bunch of QoL keybinds.

## video demo

<https://www.youtube.com/watch?v=k2l6-RqTk1c>

## feature overview

- toggling hand cards with `asdfgh...` keys
- a complete implementation of every action in every game state, with
  - `space` being generally the "proceed" button:
    - it plays the selected hand
    - selects the upcoming blind
    - uses consumable cards
    - selects the highlighted pack item
    - starts a new run from the game over screen
  - `tab` being the dismiss button:
    - it discards the selected hand
    - moves from the shop to blind selection
    - sells consumable or joker cards
    - skips the current booster pack
    - closes any overlay menu
    - exits to main menu from the game over screen
  - the bottom row of the keyboard as the "control panel", for example:
    - in rounds:
      - hold `z` for the quick deck preview
      - press `c` to sort by suit
      - `v` to sort by rank
      - `b` to sort by enhancement+score, where glass cards are moved to the end, and lucky and mult cards to the beginning
    - in the shop:
      - `c` to buy an item or a pack or a voucher
      - `v` to buy and use an item, or buy a pack or a voucher
    - `n` to deselect all cards in a cardarea and `m` to invert card selection in rounds
    - `x` to view run info whenever it's available
    - & others (see [`./mod/layout.lua`](https://github.com/janw4ld/balatro-typist-mod/blob/main/mod/layout.lua)) for dvorak and the full keymap
  - mnemonic keys for less frequent actions, like `s` to skip blinds, `r` to reroll the shop or boss, `b` in the cheat layer (accessed by holding `p`) to pick the best hand out the available cards, `f` in the cheat layer to fish for the best flush in hand, etc
- cardarea keybind layers for selecting, moving, selling & using cards. these apply globally for
  - consumables, accessed by holding `'`
  - jokers, accessed by holding `[`
  - pack cards, with no leader key
  - the shop, with no leader key
  - the hand, which is accessed
    - by holding `/` everywhere for selection and movement of a single card
    - by holding `shift+/` for multiselect in booster packs
    - with no leader key for multiselect in rounds
- support for `qwerty` and `dvorak` keyboard layouts, where positional keys are kept consistent across both layouts and mnemonic keys aren't changed. (e.g. `asdf` to toggle the first four cards in qwerty translates to `aoeu` in dvorak, but `r` to reroll the shop or the boss blind stays `r` in both layouts)
- support for keybind overrides, so you can change the default keybinds to your liking
- any key to skip the splash screen and `space` to click any "play" or "continue" button, so a run can be started from game launch until the first blind with the `space` button only
