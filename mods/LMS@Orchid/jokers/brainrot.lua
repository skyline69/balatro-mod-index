SMODS.Joker {
    key = "brainrot",
    atlas = "brainrot",
    rarity = 3,
    cost = 8,
    discovered = false,
    pos = { x = 0, y = 0 },
    config = { extra = { Xmult = 1, Xmult_gain = 0.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_gain, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if context.scoring_name == "21_67" then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'Xmult',
                    scalar_value = 'Xmult_gain',
                    massage_colour = G.C.ATTENTION
            })
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
    end,
}
