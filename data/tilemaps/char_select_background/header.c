#include "global.h"
#include "core.h"

const u16 Palette_char_select_background[]
    = INCBIN_U16("data/tilemaps/char_select_background/palette.gbapal");
const u8 Tiles_char_select_background[]
    = INCBIN_U8("data/tilemaps/char_select_background/tiles.4bpp");
const u16 Tilemap_char_select_background[]
    = INCBIN_U16("data/tilemaps/char_select_background/tilemap.tilemap2");

const Tilemap char_select_background = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_char_select_background,
    .tilesSize = sizeof(Tiles_char_select_background),
    .palette = Palette_char_select_background,
    .palOffset = 0,
    .palLength = sizeof(Palette_char_select_background) / sizeof(u16),
    .map = Tilemap_char_select_background,
};
