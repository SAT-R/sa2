#include "global.h"
#include "core.h"

const ColorRaw Palette_options_bg0[] = INCPAL("data/tilemaps/options_bg0/palette.pal");
const u8 Tiles_options_bg0[] = INCBIN_U8("data/tilemaps/options_bg0/tiles.4bpp");
const u16 Tilemap_options_bg0[] = INCBIN_U16("data/tilemaps/options_bg0/tilemap.tilemap2");

const Tilemap options_bg0 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_options_bg0,
    .tilesSize = sizeof(Tiles_options_bg0),
    .palette = Palette_options_bg0,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_options_bg0),
    .map = Tilemap_options_bg0,
};
