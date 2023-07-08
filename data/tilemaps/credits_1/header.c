#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_credits_1[] = INCBIN_U16("data/tilemaps/credits_1/palette.gbapal");
ALIGNED(4) static const u8 Tiles_credits_1[] = INCBIN_U8("data/tilemaps/credits_1/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_credits_1[] = INCBIN_U16("data/tilemaps/credits_1/tilemap.tilemap2");

ALIGNED(4) const Tilemap credits_1 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_1,
    .tilesSize = sizeof(Tiles_credits_1),
    .palette = Palette_credits_1,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_1) / sizeof(u16),
    .map = Tilemap_credits_1,
};
