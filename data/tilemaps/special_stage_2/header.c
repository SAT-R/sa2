#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_special_stage_2[] = INCBIN_U16("data/tilemaps/special_stage_2/palette.gbapal");
ALIGNED(4) static const u8 Tiles_special_stage_2[] = INCBIN_U8("data/tilemaps/special_stage_2/tiles.4bpp");
ALIGNED(4) static const u8 Tilemap_special_stage_2[] = INCBIN_U8("data/tilemaps/special_stage_2/tilemap.tilemap2");

ALIGNED(4) const Tilemap special_stage_2 = {
    .xTiles = 128,
    .yTiles = 128,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_special_stage_2,
    .tilesSize = sizeof(Tiles_special_stage_2),
    .palette = Palette_special_stage_2,
    .palOffset = 0,
    .palLength = sizeof(Palette_special_stage_2) / sizeof(u16),
    .map = (const u16*)Tilemap_special_stage_2,
};
