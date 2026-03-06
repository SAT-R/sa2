#include "global.h"
#include "core.h"

const ColorRaw Palette_credits_9[] = INCPAL("data/tilemaps/credits_9/palette.pal");
const u8 Tiles_credits_9[] = INCBIN_U8("data/tilemaps/credits_9/tiles.4bpp");
const u16 Tilemap_credits_9[] = INCBIN_U16("data/tilemaps/credits_9/tilemap.tilemap2");

const Tilemap credits_9 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_9,
    .tilesSize = sizeof(Tiles_credits_9),
    .palette = Palette_credits_9,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_credits_9),
    .map = Tilemap_credits_9,
};
