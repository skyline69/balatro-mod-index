SMODS.Back
{
    key = "damaged",
    atlas = "damaged",
    pos = { x = 0, y = 0 },
    discovered = true,
    config = { randomize_rank_suit = true },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for i = 1, 52 do
                    byte_val = 0
                    seed = G.GAME.pseudorandom.seed
                    for j = 1, 8 do
                        byte_val = string.byte(seed, j)
                    end
                    byte_val = (byte_val - i) * i
                    switch_seal =
                    {
                        [0] = function()
                            G.deck.cards[i]:set_seal("Red", true, true)
                        end,
                        [1] = function()
                            G.deck.cards[i]:set_seal("Blue", true, true)
                        end,
                        [2] = function()
                            G.deck.cards[i]:set_seal("Gold", true, true)
                        end,
                        [3] = function()
                            G.deck.cards[i]:set_seal("Purple", true, true)
                        end,
                        [4] = function()
                            -- xd
                        end
                    }
                    if switch_seal[byte_val % 5] then
                        switch_seal[byte_val % 5]()
                    end
                    
                    switch_edition =
                    {
                        [0] = function()
                            G.deck.cards[i]:set_edition("e_holo", true, true, false)
                        end,
                        [1] = function()
                            G.deck.cards[i]:set_edition("e_polychrome", true, true, false)
                        end,
                        [2] = function()
                            G.deck.cards[i]:set_edition("e_negative", true, true, false)
                        end,
                        [3] = function()
                            G.deck.cards[i]:set_edition("e_foil", true, true, false)
                        end,
                        [4] = function()
                            -- xd
                        end
                    }
                    if switch_edition[byte_val % 5] then
                        switch_edition[byte_val % 5]()
                    end

                    switch_enchancement =
                    {
                        [0] = function()
                            G.deck.cards[i]:set_ability("m_bonus", true, false)
                        end,
                        [1] = function()
                            G.deck.cards[i]:set_ability("m_mult", true, false)
                        end,
                        [2] = function()
                            G.deck.cards[i]:set_ability("m_wild", true, false)
                        end,
                        [3] = function()
                            G.deck.cards[i]:set_ability("m_glass", true, false)
                        end,
                        [4] = function()
                            G.deck.cards[i]:set_ability("m_steel", true, false)
                        end,
                        [5] = function()
                            G.deck.cards[i]:set_ability("m_stone", true, false)
                        end,
                        [6] = function()
                            G.deck.cards[i]:set_ability("m_gold", true, false)
                        end,
                        [7] = function()
                            G.deck.cards[i]:set_ability("m_lucky", true, false)
                        end,
                        [8] = function()
                            -- xd
                        end
                    }
                    if switch_enchancement[byte_val % 9] then
                        switch_enchancement[byte_val % 9]()
                    end
                end
                return true
            end,
        }))
    end
}
