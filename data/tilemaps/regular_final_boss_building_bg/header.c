#include "global.h"
#include "core.h"

const ColorRaw Palette_regular_final_boss_building_bg[] = INCPAL("data/tilemaps/regular_final_boss_building_bg/palette.pal");
const u8 Tiles_regular_final_boss_building_bg[] = INCBIN_U8("data/tilemaps/regular_final_boss_building_bg/tiles.4bpp");
const u16 Tilemap_regular_final_boss_building_bg[] = INCBIN_U16("data/tilemaps/regular_final_boss_building_bg/tilemap.tilemap2");

const Tilemap regular_final_boss_building_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_regular_final_boss_building_bg,
    .tilesSize = sizeof(Tiles_regular_final_boss_building_bg),
    .palette = Palette_regular_final_boss_building_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_regular_final_boss_building_bg),
    .map = Tilemap_regular_final_boss_building_bg,
};
