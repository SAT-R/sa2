#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_regular_final_boss_building_bg[]
    = INCBIN_U16("data/tilemaps/regular_final_boss_building_bg/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_regular_final_boss_building_bg[]
    = INCBIN_U8("data/tilemaps/regular_final_boss_building_bg/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_regular_final_boss_building_bg[]
    = INCBIN_U16("data/tilemaps/regular_final_boss_building_bg/tilemap.tilemap2");

ALIGNED(4)
const Tilemap regular_final_boss_building_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_regular_final_boss_building_bg,
    .tilesSize = sizeof(Tiles_regular_final_boss_building_bg),
    .palette = Palette_regular_final_boss_building_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_regular_final_boss_building_bg) / sizeof(u16),
    .map = Tilemap_regular_final_boss_building_bg,
};
