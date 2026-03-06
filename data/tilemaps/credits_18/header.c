#include "global.h"
#include "core.h"

const ColorRaw Palette_credits_18[] = INCPAL("data/tilemaps/credits_18/palette.pal");
const u8 Tiles_credits_18[] = INCBIN_U8("data/tilemaps/credits_18/tiles.4bpp");
const u16 Tilemap_credits_18[] = INCBIN_U16("data/tilemaps/credits_18/tilemap.tilemap2");

const Tilemap credits_18 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_18,
    .tilesSize = sizeof(Tiles_credits_18),
    .palette = Palette_credits_18,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_credits_18),
    .map = Tilemap_credits_18,
};
