return
{
    descriptions =
    {
        Tarot =
        {
            c_21_weakness = {
                name = "Weakness",
                text = {
                    "Decreases rank of",
                    "up to {C:attention}#1#{} selected",
                    "cards by {C:attention}1",
                },
            },
        },
        Back =
        {
            b_21_welcome =
            {
                name = "Welcome! Deck",
                text =
                {
                    "Start with one of the new Jokers.",
                    "({C:green}Uncommon{} or {C:red}Epic{}.)"
                }
            },
            b_21_shiny =
            {
                name = "Shiny Deck",
                text =
                {
                    "Start with {C:legendary,T:j_21_lavender}Lavender{}{},",
                    "{C:attention}-3{} joker slots."
                }
            },
            b_21_damaged =
            {
                name = "Damaged Deck",
                text =
                {
                    "Someone messed with the deck,",
                    "before you started playing..."
                }
            },
            b_21_greed =
            {
                name = "Greed Deck",
                text =
                {
                    "Start run with",
                    "{C:attention,T:v_overstock_plus}#4#{},",
                    "{C:money,T:v_liquidation}#2#{},",
                    "and {C:green,T:j_21_moneyroots}Money Roots{}."
                }
            },
            b_21_hungarian =
            {
                name = "Hungarian Deck",
                text =
                {
                    "Start run {C:attention}without{}",
                    "playing cards with ranks less than 7."
                }
            }
        },

        Joker =
        {
            j_21_weed =
            {
                name = "Weed",
                text =
                {
                    "On {C:attention}EVERY{} discard,",
                    "destroys all discarded cards",
                    "and gives {C:money}$#1#{} for each card."
                }
            },
            j_21_sunflower =
            {
                name = "Sunflower",
                text =
                { 
                    "No more gambling,",
                    "{C:green}all chances 100%{}."
                }
            },
            j_21_orchid =
            {
                name = "Orchid",
                text =
                { 
                    "No more gambling,",
                    "{C:green}all chances 0%{}."
                }
            },
            j_21_yin =
            {
                name = "Yin",
                text =
                {
                    "{C:mult}+#1#{} Mult, {C:chips}+#3#{} Chips,",
                    "gains {X:red,C:white}X#2#{} Mult, {X:blue,C:white}X#4#{} Chips,",
                    "or",
                    "{C:green}#5# in #6#{} chance this card is destroyed",
                    "at the end of round."
                }
            },
            j_21_yang =
            {
                name = "Yang",
                text =
                {
                    "{X:red,C:white} X#3# {} Mult, {X:blue,C:white} X#4# {} Chips",
                    "gains {C:mult}+#5#{} Mult, {C:chips}+#5#{} Chips",
                    "or",
                    "{C:green}#1# in #2#{} chance this card is destroyed",
                    "at the end of round."
                }
            },
            j_21_brainrot =
            {
                name = "Brainrot",
                text =
                {
                    "{X:red,C:white} X#2# {} Mult,",
                    "gains {C:mult}+#1#{} Mult",
                    "after every {C:attention}6-7{} played."
                }
            },
            j_21_grown =
            {
                name = "Grown ahh Joker",
                text =
                {
                    "{C:chips}+#1#{} Chips",
                    "if hand is {C:attention}6-7{}."
                }
            },
            j_21_goofy =
            {
                name = "Goofy ahh Joker",
                text =
                {
                    "{C:mult}+#1#{} Mult",
                    "if hand is {C:attention}6-7{}."
                }
            },
            j_21_rose =
            {
                name = "Rose",
                text =
                {
                    "{X:red,C:white}X#1#{} Mult",
                    "for each {C:attention}Queen{} scored.",
                    "{s:0.8}Debuffs Kings and Jacks."
                }
            },
            j_21_sun =
            {
                name = "Sun",
                text =
                {
                    "{C:attention}#1#{} retriggers to every card scored,",
                    "gains {C:attention}+#2#{} retriggers every",
                    "{C:attention}Flush Five{} played.",
                    "{s:0.8}(0.5 retriggers = 0 retriggers)"
                }
            },
            j_21_moon =
            {
                name = "Moon",
                text =
                {
                    "{C:attention}#1#{} retriggers to every card held in hand,",
                    "gains {C:attention}+#2#{} retriggers every",
                    "{C:attention}High card{} played.",
                    "{s:0.8}(0.5 retriggers = 0 retriggers)"
                }
            },
            j_21_lavender = {
                name = "Lavender",
                text =
                {
                    "Creates a {C:dark_edition,T:e_negative}Negative{} copy of",
                    "{C:attention}#1#{} random {C:attention}Joker{}",
                    "card in your possession",
                    "at the end of the {C:attention}shop.",
                    "{s:0.8}(Can NOT copy itself.)"
                }
            },
            j_21_watering_can = {
                name = "Watering Can",
                text =
                {
                    "{X:blue,C:white} X#1# {} Chips",
                    "for each non-face card scored."
                }
            },
            j_21_moneyroots = {
                name = "Money Roots",
                text =
                {
                    "Shop rerolls",
                    "are capped at {C:money}$#1#{}."
                }
            },
            j_21_fallenleaf = {
                name = "Fallen Leaf",
                text =
                {
                    "{X:blue,C:white} X#1# {} Chips for every",
                    "{C:attention}wild card{} held in hand."
                }
            }
        },
        Planet =
        {
            c_21_67 =
            {
                name = "6-7",
                text = {
                    "({V:1}lvl.#1#{}) Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} Chips"
                },
            }
        }
    },
    misc =
    {
        poker_hand_descriptions =
        {
            ["21_67"] = {"A 6 and a 7."}
        },
        poker_hands =
        {
            ["21_67"] = "6-7"
        }
    }
}