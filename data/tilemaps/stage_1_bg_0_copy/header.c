#include "global.h"
#include "core.h"

const u16 Palette_stage_1_bg_0_copy[]
    = INCBIN_U16("data/tilemaps/stage_1_bg_0_copy/palette.gbapal");
const u8 Tiles_stage_1_bg_0_copy[]
    = INCBIN_U8("data/tilemaps/stage_1_bg_0_copy/tiles.4bpp");
const u16 Tilemap_stage_1_bg_0_copy[]
    = INCBIN_U16("data/tilemaps/stage_1_bg_0_copy/tilemap.tilemap2");

const Tilemap stage_1_bg_0_copy = {
    .xTiles = 32,
    .yTiles = 30,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_stage_1_bg_0_copy,
    .tilesSize = sizeof(Tiles_stage_1_bg_0_copy),
    .palette = Palette_stage_1_bg_0_copy,
    .palOffset = 0,
    .palLength = sizeof(Palette_stage_1_bg_0_copy) / sizeof(u16),
    .map = Tilemap_stage_1_bg_0_copy,
};
