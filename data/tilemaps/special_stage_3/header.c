#include "global.h"
#include "core.h"

const u16 Palette_special_stage_3[]
    = INCBIN_U16("data/tilemaps/special_stage_3/palette.gbapal");
const u8 Tiles_special_stage_3[] = INCBIN_U8("data/tilemaps/special_stage_3/tiles.8bpp");
const u8 Tilemap_special_stage_3[]
    = INCBIN_U8("data/tilemaps/special_stage_3/tilemap.tilemap1");

const Tilemap special_stage_3 = {
    .xTiles = 128,
    .yTiles = 128,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_special_stage_3,
    .tilesSize = sizeof(Tiles_special_stage_3),
    .palette = Palette_special_stage_3,
    .palOffset = 0,
    .palLength = sizeof(Palette_special_stage_3) / sizeof(u16),
    .map = (const u16 *)Tilemap_special_stage_3,
};
