#include "global.h"
#include "core.h"

const ColorRaw Palette_special_stage_3_bg[] = INCPAL("data/tilemaps/special_stage_3_bg/palette.pal");
const u8 Tiles_special_stage_3_bg[] = INCBIN_U8("data/tilemaps/special_stage_3_bg/tiles.4bpp");
const u16 Tilemap_special_stage_3_bg[] = INCBIN_U16("data/tilemaps/special_stage_3_bg/tilemap.tilemap2");

const Tilemap special_stage_3_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_special_stage_3_bg,
    .tilesSize = sizeof(Tiles_special_stage_3_bg),
    .palette = Palette_special_stage_3_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_special_stage_3_bg),
    .map = Tilemap_special_stage_3_bg,
};
