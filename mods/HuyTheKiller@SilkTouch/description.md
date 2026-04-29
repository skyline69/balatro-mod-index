A Balatro mod that brings mobile version's touch controls as an API to PC/Mac.

There are 2 other mods - [Sticky Fingers](https://github.com/eramdam/sticky-fingers) and [MobileLikeDragging](https://github.com/jfmmm/BalatroMobileLikeDragging) - that already do the same thing. What sets this mod apart is that it provides a full-fledged API, allowing other mods to easily define new drag areas and/or use existing ones, all without a Pull Request hassle from Sticky Fingers or vanilla-hardcoded nature of MobileLikeDragging.

# API Documentation: `SilkTouch.DragTarget`

- **Required parameters:**
	- `key`
- **Optional parameters** *(defaults)*:
    - `moveable_t`: A string key to an existing drag area, or a table containing a Moveable setup
        - Expects a string matching any of the following keys:
        ```lua
        G.DRAG_TARGETS = {
            S_buy, -- Standard buy area (overlayed on G.jokers plus G.consumeables). Text varies depending on card type (Voucher, Booster or generic).
            S_buy_and_use, -- Buy-and-use area (above G.deck). Used for consumables that can be used right after purchase.
            C_sell, -- Consumable's sell area (overlayed on G.jokers).
            J_sell, -- Joker's sell area (overlayed on G.consumeables).
            C_use, -- Consumable's use area (above G.deck).
            P_select, -- Select area (between G.jokers and G.hand). Used for selecting jokers and using planet cards in booster packs.
            modprefix_key, -- A custom drag target, defined by a Moveable setup (more on that below).
        }
        ```
        - Or, expects the following table format:
        ```lua
        {
            moveable_t = {
                x = {ref_table = "G.jokers.T", ref_value = "x"}, -- Standard usage with ref_table and ref_value.
                y = {ref_table = "G.jokers.T", ref_value = "y", mod_value = -0.1}, -- Modify the result with a number.
                w = {
                    -- A more complicated case where you need to combine multiple references at once.
                    -- There's a limit to operation_table: only pluses (+) and minuses (-) are supported.
                    -- The example has been realigned to improve comprehensibility.
                    ref_table = {"G.consumeables.T", "G.consumeables.T", "G.jokers.T"  },
                    ref_value = {                 "x",                "w",          "x"},
                    operation_table = {             "+",                "-"            },
                },
                h = {mod_value = 4.5}, -- Simply specify a number.
            },
        }
        ```
    - `text`: A function returning a table of localized texts
        - Expects a function like this:
        ```lua
        {
            text = function(card)
                -- Example text for a joker or consumable
                local buy_loc = copy_table(localize('ml_buy_target'))
                buy_loc[#buy_loc+1] = '$'..card.cost
                return buy_loc -- {"Buy", "$3"}
            end
        }
        ```
    - `colour = G.C.UI.TRANSPARENT_DARK` - The active colour for the drag area,
    - `drag_condition`: A function to check if dragging a card shows the drag area or not
        - Expects a function like this:
        ```lua
        {
            drag_condition = function(card)
                -- Example condition for consumable cards in a booster pack to reveal consumable's use area (except Planet cards)
                return card.area and card.area == G.pack_cards and card.ability.consumeable and card.ability.set ~= 'Planet'
            end
        }
        ```
    - `active_check`: A function to check if releasing inside drag area may trigger `release_func` (more on that below)
        - Expects a function like this:
        ```lua
        {
            active_check = function(card)
                -- Example condition for consumable cards to be useable or not
                return card:can_use_consumeable()
            end
        }
        ```
    - `release_func`: A function to to perform an action when released inside drag area
        - Expects a function like this:
        ```lua
        {
            release_func = function(card)
                -- Example action for using consumable cards
                if card:can_use_consumeable() then
                    G.FUNCS.use_card({config={ref_table = card}})
                end
            end
        }
        ```