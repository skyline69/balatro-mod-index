SMODS.Joker
{
    key = "yin",
    atlas = "yin",
    pos = { x = 0, y = 0},
    config =
    {
        extra =
        {
            mult = 2,
            mult_scale = 2,
            chips = 2,
            chips_scale = 2,
            numerator = 1,
            denominator = 6
        }
    },
    rarity = 1,
    cost = 0,
    discovered = false,
    loc_vars = function (self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator)
        return
        {
            vars =
            {
                card.ability.extra.mult,
                card.ability.extra.mult_scale,
                card.ability.extra.chips,
                card.ability.extra.chips_scale,
                numerator,
                denominator,
            }
        }
    end,

    calculate = function (self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, G.GAME.pseudorandom.seed, card.ability.extra.numerator, card.ability.extra.denominator) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_extinct_ex')
                }
            end
        end
        if context.joker_main then
            return
            {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'mult',
                    scalar_value = 'mult_scale',
                    operation = 'X',
                    massage_colour = G.C.ATTENTION
            })
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'chips',
                    scalar_value = 'chips_scale',
                    operation = 'X',
                    massage_colour = G.C.ATTENTION
            })
        end
    end
}