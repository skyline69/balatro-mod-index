SMODS.Joker {
    key = "grown",
    atlas = "grown",
    discovered = false,
    blueprint_compat = true,
    rarity = 1,
    cost = 3,
    pos = { x = 0, y = 0 },
    config = { extra = { t_chips = 80, type = '21_67' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end
}