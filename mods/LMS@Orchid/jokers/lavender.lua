SMODS.Joker {
    key = "lavender",
    atlas = "lavender",
    discovered = false,
    rarity = 4,
    cost = 20,
    pos = { x = 0, y = 0 },
    config = { extra = { copies = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.copies } }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and G.jokers.cards[2] then
            local copiable_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    copiable_jokers[#copiable_jokers + 1] = G.jokers.cards[i]
                end
            end

            local joker_to_copy = pseudorandom_element(copiable_jokers, '21_lavender')

            if joker_to_copy then
                local count = 1
                local event
                event = Event {
                    blockable = false,
                    blocking = false,
                    pause_force = true,
                    no_delete = true,
                    trigger = "after",
                    delay = 0.2,
                    timer = "UPTIME",
                    func = function()
                        local copied_card = copy_card(joker_to_copy)
                        copied_card:set_edition("e_negative", true)
                        copied_card:add_to_deck()
                        G.jokers:emplace(copied_card)
                        if count == card.ability.extra.copies then
                            return true
                        else
                            count = count + 1
                            event.start_timer = false
                        end
                    end
                }
                G.E_MANAGER:add_event(event)
                return { message = localize('k_duplicated_ex') }
            end
        end
    end,
}
