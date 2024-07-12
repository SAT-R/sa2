#include "global.h"
#include "core.h"

const u16 Palette_cutscene_vanilla_kidnapped_full_map[] = INCBIN_U16("data/tilemaps/cutscene_vanilla_kidnapped_full_map/palette.gbapal");
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
    .palLength = sizeof(Palette_cutscene_vanilla_kidnapped_full_map) / sizeof(u16),
    .map = Tilemap_cutscene_vanilla_kidnapped_full_map,
};
