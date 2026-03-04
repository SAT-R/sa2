#include "global.h"
#include "core.h"

const ColorRaw Palette_stage_select_bg_cream[] = INCPAL("data/tilemaps/stage_select_bg_cream/palette.pal");
const u8 Tiles_stage_select_bg_cream[] = INCBIN_U8("data/tilemaps/stage_select_bg_cream/tiles.4bpp");
const u16 Tilemap_stage_select_bg_cream[] = INCBIN_U16("data/tilemaps/stage_select_bg_cream/tilemap.tilemap2");

const Tilemap stage_select_bg_cream = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_stage_select_bg_cream,
    .tilesSize = sizeof(Tiles_stage_select_bg_cream),
    .palette = Palette_stage_select_bg_cream,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_stage_select_bg_cream),
    .map = Tilemap_stage_select_bg_cream,
};
