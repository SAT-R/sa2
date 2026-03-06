#include "global.h"
#include "core.h"

const ColorRaw Palette_green_caret[] = INCPAL("data/tilemaps/green_caret/palette.pal");
const u8 Tiles_green_caret[] = INCBIN_U8("data/tilemaps/green_caret/tiles.4bpp");
const u16 Tilemap_green_caret[] = INCBIN_U16("data/tilemaps/green_caret/tilemap.tilemap2");

const Tilemap green_caret = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_green_caret,
    .tilesSize = sizeof(Tiles_green_caret),
    .palette = Palette_green_caret,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_green_caret),
    .map = Tilemap_green_caret,
};
