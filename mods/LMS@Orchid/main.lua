-- Atlases
    -- Jokers

SMODS.Atlas({
    key = "weed",
    path = "weed.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sunflower",
    path = "sunflower.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "orchid",
    path = "orchid.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "yin",
    path = "yin.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "yang",
    path = "yang.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "brainrot",
    path = "brainrot.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "goofy",
    path = "goofy.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "grown",
    path = "grown.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "rose",
    path = "rose.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "sun",
    path = "sun.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "moon",
    path = "moon.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "lavender",
    path = "lavender.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "watering_can",
    path = "watering_can.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "moneyroots",
    path = "moneyroots.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "fallenleaf",
    path = "fallenleaf.png",
    px = 71,
    py = 95
})

    -- Decks
SMODS.Atlas({
    key = "welcome",
    path = "welcome.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "shiny",
    path = "shiny.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "damaged",
    path = "damaged.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "greed",
    path = "greed.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "hungarian",
    path = "hungarian.png",
    px = 71,
    py = 95
})

    -- Planet cards
SMODS.Atlas({
    key = "67",
    path = "6-7.png",
    px = 71,
    py = 95
})

    -- Tarot cards
SMODS.Atlas({
    key = "weakness",
    path = "weakness.png",
    px = 71,
    py = 95
})


-- Jokers

local jokers_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "jokers")
for _, file in ipairs(jokers_src) do
    assert(SMODS.load_file("jokers/" .. file))()
end


-- Decks

local decks_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "decks")
for _, file in ipairs(decks_src) do
    assert(SMODS.load_file("decks/" .. file))()
end


-- Consumables

local cons_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "consumables")
for _, file in ipairs(cons_src) do
    assert(SMODS.load_file("consumables/" .. file))()
end


-- Pokerhands

local hands_src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "hands")
for _, file in ipairs(hands_src) do
    assert(SMODS.load_file("hands/" .. file))()
end

-- JokerDisplay mod compatibility
if JokerDisplay then
    SMODS.load_file("joker_display_definitions.lua")()
end