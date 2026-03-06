#include "global.h"
#include "core.h"

const ColorRaw Palette_credits_7[] = INCPAL("data/tilemaps/credits_7/palette.pal");
const u8 Tiles_credits_7[] = INCBIN_U8("data/tilemaps/credits_7/tiles.4bpp");
const u16 Tilemap_credits_7[] = INCBIN_U16("data/tilemaps/credits_7/tilemap.tilemap2");

const Tilemap credits_7 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_7,
    .tilesSize = sizeof(Tiles_credits_7),
    .palette = Palette_credits_7,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_credits_7),
    .map = Tilemap_credits_7,
};
