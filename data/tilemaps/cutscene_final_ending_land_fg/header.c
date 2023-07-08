#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_cutscene_final_ending_land_fg[]
    = INCBIN_U16("data/tilemaps/cutscene_final_ending_land_fg/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_cutscene_final_ending_land_fg[]
    = INCBIN_U8("data/tilemaps/cutscene_final_ending_land_fg/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_cutscene_final_ending_land_fg[]
    = INCBIN_U16("data/tilemaps/cutscene_final_ending_land_fg/tilemap.tilemap2");

ALIGNED(4)
const Tilemap cutscene_final_ending_land_fg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_final_ending_land_fg,
    .tilesSize = sizeof(Tiles_cutscene_final_ending_land_fg),
    .palette = Palette_cutscene_final_ending_land_fg,
    .palOffset = 0,
    .palLength = sizeof(Palette_cutscene_final_ending_land_fg) / sizeof(u16),
    .map = Tilemap_cutscene_final_ending_land_fg,
};
