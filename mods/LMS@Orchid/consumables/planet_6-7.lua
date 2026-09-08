SMODS.Consumable
{
    key = '67',
    set = "Planet",
    discovered = false,
    hidden = false,
    atlas = "67",
    cost = 3,
    pos = { x = 0, y = 0},
    config =  { hand_type = '21_67' } ,

    pools =
    {
        ["Planet"] = true
    },

    set_card_type_badge = function(self, card, badges)
        badges[1] = create_badge(localize('k_planet'), get_type_colour(self or card.config, card), nil, 1.2)
    end,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,

    can_use = function (self, card, area, copier)
        return true
    end,

    use = function (self, card, area, copier)
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname='6-7',chips = '...', mult = '...', level=''})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = true
            return true end }))
        update_hand_text({delay = 0}, {mult = '+', StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            return true end }))
        update_hand_text({delay = 0}, {chips = '+', StatusText = true})
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
            play_sound('tarot1')
            card:juice_up(0.8, 0.5)
            G.TAROT_INTERRUPT_PULSE = nil
            return true end }))
        update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
        delay(1.3)
        G.GAME.hands[card.ability.hand_type].chips = G.GAME.hands[card.ability.hand_type].chips + G.GAME.hands[card.ability.hand_type].l_chips
        G.GAME.hands[card.ability.hand_type].mult = G.GAME.hands[card.ability.hand_type].mult + G.GAME.hands[card.ability.hand_type].l_mult
        G.GAME.hands[card.ability.hand_type].level = G.GAME.hands[card.ability.hand_type].level+1
        update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
    end
}