#include "global.h"
#include "core.h"

const ColorRaw Palette_cutscene_final_ending_fall_clouds[] = INCPAL("data/tilemaps/cutscene_final_ending_fall_clouds/palette.pal");
const u8 Tiles_cutscene_final_ending_fall_clouds[] = INCBIN_U8("data/tilemaps/cutscene_final_ending_fall_clouds/tiles.4bpp");
const u16 Tilemap_cutscene_final_ending_fall_clouds[] = INCBIN_U16("data/tilemaps/cutscene_final_ending_fall_clouds/tilemap.tilemap2");

const Tilemap cutscene_final_ending_fall_clouds = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_final_ending_fall_clouds,
    .tilesSize = sizeof(Tiles_cutscene_final_ending_fall_clouds),
    .palette = Palette_cutscene_final_ending_fall_clouds,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_cutscene_final_ending_fall_clouds),
    .map = Tilemap_cutscene_final_ending_fall_clouds,
};
