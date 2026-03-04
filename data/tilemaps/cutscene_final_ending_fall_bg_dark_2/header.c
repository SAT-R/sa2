#include "global.h"
#include "core.h"

const ColorRaw Palette_cutscene_final_ending_fall_bg_dark_2[] = INCPAL("data/tilemaps/cutscene_final_ending_fall_bg_dark_2/palette.pal");
const u8 Tiles_cutscene_final_ending_fall_bg_dark_2[] = INCBIN_U8("data/tilemaps/cutscene_final_ending_fall_bg_dark_2/tiles.4bpp");
const u16 Tilemap_cutscene_final_ending_fall_bg_dark_2[]
    = INCBIN_U16("data/tilemaps/cutscene_final_ending_fall_bg_dark_2/tilemap.tilemap2");

const Tilemap cutscene_final_ending_fall_bg_dark_2 = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_final_ending_fall_bg_dark_2,
    .tilesSize = sizeof(Tiles_cutscene_final_ending_fall_bg_dark_2),
    .palette = Palette_cutscene_final_ending_fall_bg_dark_2,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_cutscene_final_ending_fall_bg_dark_2),
    .map = Tilemap_cutscene_final_ending_fall_bg_dark_2,
};
