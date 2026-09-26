SMODS.Joker
{
    key = "weed",
    atlas = "weed",
    pos = { x = 0, y = 0},
    config =
    {
        extra =
        {
            dollars = 1
        }
    },
    rarity = 3,
    cost = 8,
    discovered = false,
    loc_vars = function (self, info_queue, card)
        return
        {
            vars =
            {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function (self, card, context)
        if context.discard and context.other_card then
            return
            {
                dollars = card.ability.extra.dollars,
                remove = true
            }
        end
    end
}