SMODS.PokerHand
{
    key = '67',
    mult = 2,
    chips = 54,
    l_mult = 2,
    l_chips = 20,
    above_hand = "Two Pair",
    visible = true,
    example = {
        { 'S_K', false },
        { 'S_6', false },
        { 'D_7', true },
        { 'H_6', true },
        { 'D_3', false }
    },

    evaluate = function (parts, hand)
        local six = false
        local seven = false
        local card_six, card_seven
        for j = 1, #hand do
            local rank = SMODS.Ranks[hand[j].base.value]
            if rank.key == '6' then
                six = true
                card_six = hand[j]
            end
            if rank.key == '7' then
                seven = true
                card_seven = hand[j]
            end
        end
        if six and seven then
            return
            {
                {card_six, card_seven}
            }
        else return {}
        end
    end
}