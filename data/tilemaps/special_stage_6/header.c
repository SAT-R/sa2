#include "global.h"
#include "core.h"

const ColorRaw Palette_special_stage_6[] = INCPAL("data/tilemaps/special_stage_6/palette.pal");
const u8 Tiles_special_stage_6[] = INCBIN_U8("data/tilemaps/special_stage_6/tiles.4bpp");
const u8 Tilemap_special_stage_6[] = INCBIN_U8("data/tilemaps/special_stage_6/tilemap.tilemap2");

const Tilemap special_stage_6 = {
    .xTiles = 128,
    .yTiles = 128,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_special_stage_6,
    .tilesSize = sizeof(Tiles_special_stage_6),
    .palette = Palette_special_stage_6,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_special_stage_6),
    .map = (const u16 *)Tilemap_special_stage_6,
};
