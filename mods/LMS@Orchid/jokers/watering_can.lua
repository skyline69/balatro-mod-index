SMODS.Joker {
    key = "watering_can",
    atlas = "watering_can",
    rarity = 2,
    cost = 6,
    discovered = false,
    pos = { x = 0, y = 0 },
    config = { extra = { Xchips = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xchips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.other_card:is_face() then
            return {
                x_chips = card.ability.extra.Xchips
            }
        end
    end
}
