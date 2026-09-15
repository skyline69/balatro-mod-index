SMODS.Joker {
    key = "fallenleaf",
    atlas = "fallenleaf",
    blueprint_compat = true,
    discovered = false,
    rarity = 2,
    cost = 6,
    pos = { x = 0, y = 0 },
    config = { extra = { xchips = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and
        SMODS.has_enhancement(context.other_card, 'm_wild') then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end,
}