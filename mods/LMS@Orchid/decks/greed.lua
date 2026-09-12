SMODS.Back
{
    key = "greed",
    atlas = "greed",
    pos = { x = 0, y = 0 },
    discovered = true,
    config = { vouchers = { "v_clearance_sale", "v_liquidation", "v_overstock_norm", "v_overstock_plus" }},
    loc_vars = function(self, info_queue, back)
        return {
            vars =
            {
                localize { type = 'name_text', key = self.config.vouchers[1], set = 'Voucher' },
                localize { type = 'name_text', key = self.config.vouchers[2], set = 'Voucher' },
                localize { type = 'name_text', key = self.config.vouchers[3], set = 'Voucher' },
                localize { type = 'name_text', key = self.config.vouchers[4], set = 'Voucher' }
            }
        }
    end,

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = create_card("Joker", G.jokers, nil, nil, nil, nil, "j_21_moneyroots", nil)
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end
}
