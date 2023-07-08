#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_special_stage_5_bg[] = INCBIN_U16("data/tilemaps/special_stage_5_bg/palette.gbapal");
ALIGNED(4) static const u8 Tiles_special_stage_5_bg[] = INCBIN_U8("data/tilemaps/special_stage_5_bg/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_special_stage_5_bg[] = INCBIN_U16("data/tilemaps/special_stage_5_bg/tilemap.tilemap2");

ALIGNED(4) const Tilemap special_stage_5_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_special_stage_5_bg,
    .tilesSize = sizeof(Tiles_special_stage_5_bg),
    .palette = Palette_special_stage_5_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_special_stage_5_bg) / sizeof(u16),
    .map = Tilemap_special_stage_5_bg,
};
