#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_techno_base_bg_purple_grid[]
    = INCBIN_U16("data/tilemaps/techno_base_bg_purple_grid/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_techno_base_bg_purple_grid[]
    = INCBIN_U8("data/tilemaps/techno_base_bg_purple_grid/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_techno_base_bg_purple_grid[]
    = INCBIN_U16("data/tilemaps/techno_base_bg_purple_grid/tilemap.tilemap2");

ALIGNED(4)
const Tilemap techno_base_bg_purple_grid = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_techno_base_bg_purple_grid,
    .tilesSize = sizeof(Tiles_techno_base_bg_purple_grid),
    .palette = Palette_techno_base_bg_purple_grid,
    .palOffset = 0,
    .palLength = sizeof(Palette_techno_base_bg_purple_grid) / sizeof(u16),
    .map = Tilemap_techno_base_bg_purple_grid,
};
