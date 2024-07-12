#include "global.h"
#include "core.h"

const u16 Palette_cutscene_final_ending_land_flower_field[]
    = INCBIN_U16("data/tilemaps/cutscene_final_ending_land_flower_field/palette.gbapal");
const u8 Tiles_cutscene_final_ending_land_flower_field[] = INCBIN_U8("data/tilemaps/cutscene_final_ending_land_flower_field/tiles.4bpp");
const u16 Tilemap_cutscene_final_ending_land_flower_field[]
    = INCBIN_U16("data/tilemaps/cutscene_final_ending_land_flower_field/tilemap.tilemap2");

const Tilemap cutscene_final_ending_land_flower_field = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_final_ending_land_flower_field,
    .tilesSize = sizeof(Tiles_cutscene_final_ending_land_flower_field),
    .palette = Palette_cutscene_final_ending_land_flower_field,
    .palOffset = 0,
    .palLength = sizeof(Palette_cutscene_final_ending_land_flower_field) / sizeof(u16),
    .map = Tilemap_cutscene_final_ending_land_flower_field,
};
