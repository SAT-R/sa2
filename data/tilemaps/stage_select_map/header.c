#include "global.h"
#include "core.h"

const u16 Palette_stage_select_map[] = INCBIN_U16("data/tilemaps/stage_select_map/palette.gbapal");
const u8 Tiles_stage_select_map[] = INCBIN_U8("data/tilemaps/stage_select_map/tiles.4bpp");
const u16 Tilemap_stage_select_map[] = INCBIN_U16("data/tilemaps/stage_select_map/tilemap.tilemap2");

const Tilemap stage_select_map = {
    .xTiles = 60,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_stage_select_map,
    .tilesSize = sizeof(Tiles_stage_select_map),
    .palette = Palette_stage_select_map,
    .palOffset = 0,
    .palLength = sizeof(Palette_stage_select_map) / sizeof(u16),
    .map = Tilemap_stage_select_map,
};
