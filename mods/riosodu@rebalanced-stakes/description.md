# Rebalanced Stakes

This mod aims to provide a more engaging and balanced difficulty curve for Balatro's higher Stakes, particularly addressing the often-criticized `-1 Discard` penalty of the vanilla Blue Stake. As acknowledged by LocalThunk, that modifier could feel overly punishing and have limited the viability of bigger size poker hands; this mod offers an alternative approach while that change is pending in the vanilla game.

## How It Works
Instead of introducing entirely new harsh mechanics early on, this mod shifts existing shop Joker limitations (Perishable, Rental) to earlier Stakes (Blue and Orange, respectively). The Gold Stake is then redesigned to offer a distinct economic and endurance challenge.

## Key Features
- **Blue Stake (Stake 5):**
    - Removes the `-1 Discard` penalty
    - Introduces Perishable Jokers to the shop pool *(effect moved from vanilla Orange Stake)*
    - Perishable Jokers become negative when they expire alongside being debuffed

- **Orange Stake (Stake 7):**
    - Removes the Perishable Joker effect
    - Introduces Rental Jokers to the shop pool *(effect moved from vanilla Gold Stake)*

- **Gold Stake (Stake 8):**
    - Removes the Rental Joker effect
    - Introduces two significant new challenges:
        - **Increased Interest Threshold:** You now need **_$6_** (up from **_$5_**) to earn each dollar of interest.
        The interest cap scales accordingly (_$30_ -> _$60_ -> _$120_) so you can still gain up to _$5_, _$10_ _(Seed Money)_ and _$20_ _(Money Tree)_
        - **Increased Run Length:** The Final Ante required to win is increased to **Ante 9** _(up from Ante 8)_

## Installation
1. **Requirements**: Download and install [Steamodded](https://github.com/Steamodded/smods)
2. **Download**: Get the latest version of Rebalanced Stakes from the releases
3. **Install Location**: Extract to `%appdata%\Balatro\Mods` on Windows

## Design Notes
The goal is a smoother ramp-up of difficulty, without limiting the hand types you can play while also having a challenging final stake that tests your economic management and run longevity rather than just adding more restrictions.

*Note: On gold stake, instead of the interest rework, at first I tried removing the rewards of big blind. Turns out it was an even more awful experience than -1 discard. The greatly reduced money income coupled with rental jokers was just brutal.*

## Support
Suggestions and feedback are welcome! Let me know what you think of the rebalanced progression.
