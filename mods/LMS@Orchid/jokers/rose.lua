SMODS.Joker {
    key = "rose",
    atlas = "rose",
    rarity = 3,
    cost = 10,
    discovered = false,
    pos = { x = 0, y = 0 },
    config = { extra = { Xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.debuff_card and
            (context.debuff_card:get_id() == 13 or context.debuff_card:get_id() == 11) then
            return {
                debuff = true
            }
        end

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            return {
                x_mult = card.ability.extra.Xmult
            }
        end
    end
}
