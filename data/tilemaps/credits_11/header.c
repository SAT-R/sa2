#include "global.h"
#include "core.h"

const ColorRaw Palette_credits_11[] = INCPAL("data/tilemaps/credits_11/palette.pal");
const u8 Tiles_credits_11[] = INCBIN_U8("data/tilemaps/credits_11/tiles.4bpp");
const u16 Tilemap_credits_11[] = INCBIN_U16("data/tilemaps/credits_11/tilemap.tilemap2");

const Tilemap credits_11 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_11,
    .tilesSize = sizeof(Tiles_credits_11),
    .palette = Palette_credits_11,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_credits_11),
    .map = Tilemap_credits_11,
};
