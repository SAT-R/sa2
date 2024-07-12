#include "global.h"
#include "core.h"

const u16 Palette_stage_select_bg_amy[] = INCBIN_U16("data/tilemaps/stage_select_bg_amy/palette.gbapal");
const u8 Tiles_stage_select_bg_amy[] = INCBIN_U8("data/tilemaps/stage_select_bg_amy/tiles.4bpp");
const u16 Tilemap_stage_select_bg_amy[] = INCBIN_U16("data/tilemaps/stage_select_bg_amy/tilemap.tilemap2");

const Tilemap stage_select_bg_amy = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_stage_select_bg_amy,
    .tilesSize = sizeof(Tiles_stage_select_bg_amy),
    .palette = Palette_stage_select_bg_amy,
    .palOffset = 0,
    .palLength = sizeof(Palette_stage_select_bg_amy) / sizeof(u16),
    .map = Tilemap_stage_select_bg_amy,
};
