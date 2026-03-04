#include "global.h"
#include "core.h"

const ColorRaw Palette_cutscene_vanilla_kidnapped_full_map[] = INCPAL("data/tilemaps/cutscene_vanilla_kidnapped_full_map/palette.pal");
const u8 Tiles_cutscene_vanilla_kidnapped_full_map[] = INCBIN_U8("data/tilemaps/cutscene_vanilla_kidnapped_full_map/tiles.4bpp");
const u16 Tilemap_cutscene_vanilla_kidnapped_full_map[] = INCBIN_U16("data/tilemaps/cutscene_vanilla_kidnapped_full_map/tilemap.tilemap2");

const Tilemap cutscene_vanilla_kidnapped_full_map = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_vanilla_kidnapped_full_map,
    .tilesSize = sizeof(Tiles_cutscene_vanilla_kidnapped_full_map),
    .palette = Palette_cutscene_vanilla_kidnapped_full_map,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_cutscene_vanilla_kidnapped_full_map),
    .map = Tilemap_cutscene_vanilla_kidnapped_full_map,
};
