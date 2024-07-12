#include "global.h"
#include "core.h"

const u16 Palette_stage_select_bg_knuckles[] = INCBIN_U16("data/tilemaps/stage_select_bg_knuckles/palette.gbapal");
const u8 Tiles_stage_select_bg_knuckles[] = INCBIN_U8("data/tilemaps/stage_select_bg_knuckles/tiles.4bpp");
const u16 Tilemap_stage_select_bg_knuckles[] = INCBIN_U16("data/tilemaps/stage_select_bg_knuckles/tilemap.tilemap2");

const Tilemap stage_select_bg_knuckles = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_stage_select_bg_knuckles,
    .tilesSize = sizeof(Tiles_stage_select_bg_knuckles),
    .palette = Palette_stage_select_bg_knuckles,
    .palOffset = 0,
    .palLength = sizeof(Palette_stage_select_bg_knuckles) / sizeof(u16),
    .map = Tilemap_stage_select_bg_knuckles,
};
