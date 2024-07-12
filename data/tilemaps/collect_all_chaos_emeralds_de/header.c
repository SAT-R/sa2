#include "global.h"
#include "core.h"

const u16 Palette_collect_all_chaos_emeralds_de[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_de/palette.gbapal");
const u8 Tiles_collect_all_chaos_emeralds_de[] = INCBIN_U8("data/tilemaps/collect_all_chaos_emeralds_de/tiles.4bpp");
const u16 Tilemap_collect_all_chaos_emeralds_de[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_de/tilemap.tilemap2");

const Tilemap collect_all_chaos_emeralds_de = {
    .xTiles = 30,
    .yTiles = 6,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_collect_all_chaos_emeralds_de,
    .tilesSize = sizeof(Tiles_collect_all_chaos_emeralds_de),
    .palette = Palette_collect_all_chaos_emeralds_de,
    .palOffset = 0,
    .palLength = sizeof(Palette_collect_all_chaos_emeralds_de) / sizeof(u16),
    .map = Tilemap_collect_all_chaos_emeralds_de,
};
