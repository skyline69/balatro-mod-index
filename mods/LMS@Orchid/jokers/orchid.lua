SMODS.Joker
{
    key = "orchid",
    atlas = "orchid",
    pos = { x = 0, y = 0},
    config =
    {
        extra =
        {
            numerator = 0,
            denominator = 1
        }
    },
    rarity = 1,
    cost = 3,
    discovered = false,
    loc_vars = function (self, info_queue, card)
        return
        {
            vars =
            {
                card.ability.extra.numerator,
                card.ability.extra.denominator
            }
        }
    end,

    calculate = function (self, card, context)
        if context.fix_probability then
            return
            {
                numerator = card.ability.extra.numerator,
                denominator = card.ability.extra.denominator
            }
        end
    end
}