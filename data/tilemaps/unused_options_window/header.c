#include "global.h"
#include "core.h"

const ColorRaw Palette_unused_options_window[] = INCPAL("data/tilemaps/unused_options_window/palette.pal");
const u8 Tiles_unused_options_window[] = INCBIN_U8("data/tilemaps/unused_options_window/tiles.4bpp");
const u16 Tilemap_unused_options_window[] = INCBIN_U16("data/tilemaps/unused_options_window/tilemap.tilemap2");

const Tilemap unused_options_window = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unused_options_window,
    .tilesSize = sizeof(Tiles_unused_options_window),
    .palette = Palette_unused_options_window,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unused_options_window),
    .map = Tilemap_unused_options_window,
};
