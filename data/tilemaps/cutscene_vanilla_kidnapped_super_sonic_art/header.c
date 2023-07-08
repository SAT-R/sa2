#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_cutscene_vanilla_kidnapped_super_sonic_art[] = INCBIN_U16("data/tilemaps/cutscene_vanilla_kidnapped_super_sonic_art/palette.gbapal");
ALIGNED(4) static const u8 Tiles_cutscene_vanilla_kidnapped_super_sonic_art[] = INCBIN_U8("data/tilemaps/cutscene_vanilla_kidnapped_super_sonic_art/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_cutscene_vanilla_kidnapped_super_sonic_art[] = INCBIN_U16("data/tilemaps/cutscene_vanilla_kidnapped_super_sonic_art/tilemap.tilemap2");

ALIGNED(4) const Tilemap cutscene_vanilla_kidnapped_super_sonic_art = {
    .xTiles = 13,
    .yTiles = 19,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_cutscene_vanilla_kidnapped_super_sonic_art,
    .tilesSize = sizeof(Tiles_cutscene_vanilla_kidnapped_super_sonic_art),
    .palette = Palette_cutscene_vanilla_kidnapped_super_sonic_art,
    .palOffset = 0,
    .palLength = sizeof(Palette_cutscene_vanilla_kidnapped_super_sonic_art) / sizeof(u16),
    .map = Tilemap_cutscene_vanilla_kidnapped_super_sonic_art,
};
