#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_regular_final_boss[]
    = INCBIN_U16("data/tilemaps/regular_final_boss/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_regular_final_boss[]
    = INCBIN_U8("data/tilemaps/regular_final_boss/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_regular_final_boss[]
    = INCBIN_U16("data/tilemaps/regular_final_boss/tilemap.tilemap2");

ALIGNED(4)
const Tilemap regular_final_boss = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_regular_final_boss,
    .tilesSize = sizeof(Tiles_regular_final_boss),
    .palette = Palette_regular_final_boss,
    .palOffset = 0,
    .palLength = sizeof(Palette_regular_final_boss) / sizeof(u16),
    .map = Tilemap_regular_final_boss,
};
