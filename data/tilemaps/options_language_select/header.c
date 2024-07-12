#include "global.h"
#include "core.h"

const u16 Palette_options_language_select[] = INCBIN_U16("data/tilemaps/options_language_select/palette.gbapal");
const u8 Tiles_options_language_select[] = INCBIN_U8("data/tilemaps/options_language_select/tiles.4bpp");
const u16 Tilemap_options_language_select[] = INCBIN_U16("data/tilemaps/options_language_select/tilemap.tilemap2");

const Tilemap options_language_select = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_options_language_select,
    .tilesSize = sizeof(Tiles_options_language_select),
    .palette = Palette_options_language_select,
    .palOffset = 0,
    .palLength = sizeof(Palette_options_language_select) / sizeof(u16),
    .map = Tilemap_options_language_select,
};
