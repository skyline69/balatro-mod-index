SMODS.Back
{
    key = "shiny",
    atlas = "shiny",
    pos = { x = 0, y = 0 },
    discovered = true,
    config = { extra = {joker_slot = -3 } },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.extra.joker_slot } }
    end,

    apply = function(self, back)
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + self.config.extra.joker_slot
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_21_lavender", nil)
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end
}
