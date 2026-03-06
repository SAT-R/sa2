#include "global.h"
#include "core.h"

const ColorRaw Palette_cutscene_vanilla_kidnapped_full_map_copy[]
    = INCPAL("data/tilemaps/cutscene_vanilla_kidnapped_full_map_copy/palette.pal");
const u8 Tiles_cutscene_vanilla_kidnapped_full_map_copy[] = INCBIN_U8("data/tilemaps/cutscene_vanilla_kidnapped_full_map_copy/tiles.4bpp");
const u16 Tilemap_cutscene_vanilla_kidnapped_full_map_copy[]
    = INCBIN_U16("data/tilemaps/cutscene_vanilla_kidnapped_full_map_copy/tilemap.tilemap2");

const Tilemap cutscene_vanilla_kidnapped_full_map_copy = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_vanilla_kidnapped_full_map_copy,
    .tilesSize = sizeof(Tiles_cutscene_vanilla_kidnapped_full_map_copy),
    .palette = Palette_cutscene_vanilla_kidnapped_full_map_copy,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_cutscene_vanilla_kidnapped_full_map_copy),
    .map = Tilemap_cutscene_vanilla_kidnapped_full_map_copy,
};
