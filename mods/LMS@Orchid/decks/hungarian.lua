SMODS.Back {
    key = "hungarian",
    atlas = "hungarian",
    pos = { x = 0, y = 0 },
    discovered = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() < 7 then
                        playing_card:remove()
                    end
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 5 then
                        playing_card:remove()
                    end
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 3 then
                        playing_card:remove()
                    end
                end
                G.GAME.starting_deck_size = 32
                return true
            end
        }))
    end
}