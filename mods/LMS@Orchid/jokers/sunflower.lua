SMODS.Joker
{
    key = "sunflower",
    atlas = "sunflower",
    pos = { x = 0, y = 0},
    config =
    {
        extra =
        {
            gamble = 1
        }
    },
    rarity = 3,
    cost = 9,
    discovered = false,
    loc_vars = function (self, info_queue, card)
        return
        {
            vars =
            {
                card.ability.extra.gamble
            }
        }
    end,

    calculate = function (self, card, context)
        if context.fix_probability then
            return
            {
                numerator = card.ability.extra.gamble,
                denominator = card.ability.extra.gamble
            }
        end
    end
}