local jd_def = JokerDisplay.Definitions

jd_def["j_21_weed"] =
{
    text =
    {
        { ref_table = "card.joker_display_values", ref_value = "count" },
        { text = "x", scale = 0.35 },
        { text = "$", colour = G.C.MONEY },
        { ref_table = "card.ability.extra", ref_value = "dollars", colour = G.C.MONEY }
    },
    calc_function = function(card)
        local count = 0
        local hand = G.hand.highlighted
        if G.play then
            for _, _ in pairs(hand) do
                count = count + 1
            end
        else
            count = 0
        end
        card.joker_display_values.count = count
    end
}

jd_def["j_21_watering_can"] =
{
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "x_chips", retrigger_type = "exp" }
                },
                border_colour = G.C.CHIPS
            }
        },
        reminder_text = {
            { text = "(Non-face card)" }
        },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if not scoring_card:is_face() then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.x_chips = card.ability.extra.Xchips ^ count
        end
}

jd_def["j_21_moon"] =
{
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return held_in_hand and joker_card.ability.extra.reps * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end
}

jd_def["j_21_sun"] =
{
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        return JokerDisplay.in_scoring(playing_card, scoring_hand) and
            joker_card.ability.extra.reps * JokerDisplay.calculate_joker_triggers(joker_card)
    end
}

jd_def["j_21_grown"] =
{
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local chips = 0
        local _, poker_hands, _ = JokerDisplay.evaluate_hand()
        if poker_hands[card.ability.extra.type] and next(poker_hands[card.ability.extra.type]) then
            chips = card.ability.extra.t_chips
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
    end
}

jd_def["j_21_goofy"] =
{
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local mult = 0
        local _, poker_hands, _ = JokerDisplay.evaluate_hand()
        if poker_hands[card.ability.extra.type] and next(poker_hands[card.ability.extra.type]) then
            mult = card.ability.extra.t_mult
        end
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
    end
}

jd_def["j_21_rose"] =
{
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.joker_display_values", ref_value = "Xmult", retrigger_type = "exp" }
                },
                border_colour = G.C.MULT
            }
        },
        reminder_text = {
            { text = "(Queen)" }
        },
        calc_function = function(card)
            local count = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:get_id() == 12 then
                        count = count +
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.Xmult = card.ability.extra.Xmult ^ count
        end
}

jd_def["j_21_yang"] =
{
    extra =
    {
        {
            {
                border_nodes =
                {
                    { text = "X"},
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp"},
                },
                border_colour = G.C.MULT
            }
        },
        {
            {
                border_nodes =
                {
                    { text = "X"},
                    { ref_table = "card.ability.extra", ref_value = "xchips", retrigger_type = "exp"}
                },
                border_colour = G.C.CHIPS
            }
        }
    }
}

jd_def["j_21_yin"] =
{
    extra =
    {
        {
            { text = "+", colour = G.C.MULT },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "exp", colour = G.C.MULT },
        },
        {
            { text = "+", colour = G.C.CHIPS },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "exp", colour = G.C.CHIPS }
        }
    }
}


jd_def["j_21_brainrot"] =
{
    text =
    {
        {
            border_nodes =
            {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" }
            },
            border_colour = G.C.MULT
        }
    }
}

-- Missing Jokers: Fallen Leaf