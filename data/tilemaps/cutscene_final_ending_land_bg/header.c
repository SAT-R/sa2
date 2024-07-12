#include "global.h"
#include "core.h"

const u16 Palette_cutscene_final_ending_land_bg[] = INCBIN_U16("data/tilemaps/cutscene_final_ending_land_bg/palette.gbapal");
const u8 Tiles_cutscene_final_ending_land_bg[] = INCBIN_U8("data/tilemaps/cutscene_final_ending_land_bg/tiles.4bpp");
const u16 Tilemap_cutscene_final_ending_land_bg[] = INCBIN_U16("data/tilemaps/cutscene_final_ending_land_bg/tilemap.tilemap2");

const Tilemap cutscene_final_ending_land_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_final_ending_land_bg,
    .tilesSize = sizeof(Tiles_cutscene_final_ending_land_bg),
    .palette = Palette_cutscene_final_ending_land_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_cutscene_final_ending_land_bg) / sizeof(u16),
    .map = Tilemap_cutscene_final_ending_land_bg,
};
