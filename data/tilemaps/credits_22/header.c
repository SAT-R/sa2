#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_credits_22[]
    = INCBIN_U16("data/tilemaps/credits_22/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_credits_22[] = INCBIN_U8("data/tilemaps/credits_22/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_credits_22[]
    = INCBIN_U16("data/tilemaps/credits_22/tilemap.tilemap2");

ALIGNED(4)
const Tilemap credits_22 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_credits_22,
    .tilesSize = sizeof(Tiles_credits_22),
    .palette = Palette_credits_22,
    .palOffset = 0,
    .palLength = sizeof(Palette_credits_22) / sizeof(u16),
    .map = Tilemap_credits_22,
};
