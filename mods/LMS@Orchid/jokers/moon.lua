SMODS.Joker {
    key = "moon",
    atlas = "moon",
    rarity = 3,
    cost = 9,
    discovered = false,
    pos = { x = 0, y = 0 },
    config = { extra = { reps = 0, rep_scale = 0.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.reps, card.ability.extra.rep_scale } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint and context.scoring_name == "High Card" then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = 'reps',
                    scalar_value = 'rep_scale',
                    massage_colour = G.C.ATTENTION
            })
        end

        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
            if card.ability.extra.reps >= 1 then
                return {
                    repetitions = math.floor(card.ability.extra.reps)
                }
            end
        end
    end
}