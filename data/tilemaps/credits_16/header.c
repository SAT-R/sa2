#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_credits_16[]
    = INCBIN_U16("data/tilemaps/credits_16/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_credits_16[] = INCBIN_U8("data/tilemaps/credits_16/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_credits_16[]
    = INCBIN_U16("data/tilemaps/credits_16/tilemap.tilemap2");

ALIGNED(4)
const Tilemap credits_16 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_16,
    .tilesSize = sizeof(Tiles_credits_16),
    .palette = Palette_credits_16,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_16) / sizeof(u16),
    .map = Tilemap_credits_16,
};
