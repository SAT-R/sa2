#include "global.h"
#include "core.h"

const u16 Palette_options_enter_name[]
    = INCBIN_U16("data/tilemaps/options_enter_name/palette.gbapal");
const u8 Tiles_options_enter_name[]
    = INCBIN_U8("data/tilemaps/options_enter_name/tiles.4bpp");
const u16 Tilemap_options_enter_name[]
    = INCBIN_U16("data/tilemaps/options_enter_name/tilemap.tilemap2");

const Tilemap options_enter_name = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_options_enter_name,
    .tilesSize = sizeof(Tiles_options_enter_name),
    .palette = Palette_options_enter_name,
    .palOffset = 0,
    .palLength = sizeof(Palette_options_enter_name) / sizeof(u16),
    .map = Tilemap_options_enter_name,
};
