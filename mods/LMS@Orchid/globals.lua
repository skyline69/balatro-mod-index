--- GLOBALS

G.C.SJ = {
    RED = HEX("FF0000"),
    BLACK = HEX("000000"),
    BLUE = HEX("0000FF"),
    GREEN = HEX("00FF00"),
    WHITE = HEX("FFFFFF"),
    TRANSPARENT = HEX("00000000"),
}

-- Hooks

local loc_colour_ref = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        loc_colour_ref()
    end
    G.ARGS.LOC_COLOURS.sj_red = G.C.SJ.RED
    G.ARGS.LOC_COLOURS.sj_black = G.C.SJ.BLACK
    G.ARGS.LOC_COLOURS.sj_blue = G.C.SJ.BLUE
    G.ARGS.LOC_COLOURS.sj_green = G.C.SJ.GREEN
    G.ARGS.LOC_COLOURS.sj_white = G.C.SJ.WHITE
    G.ARGS.LOC_COLOURS.sj_transparent = G.C.SJ.TRANSPARENT
    return loc_colour_ref(_c, _default)
end