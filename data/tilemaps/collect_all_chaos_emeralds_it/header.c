#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_collect_all_chaos_emeralds_it[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_it/palette.gbapal");
ALIGNED(4) static const u8 Tiles_collect_all_chaos_emeralds_it[] = INCBIN_U8("data/tilemaps/collect_all_chaos_emeralds_it/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_collect_all_chaos_emeralds_it[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_it/tilemap.tilemap2");

ALIGNED(4) const Tilemap collect_all_chaos_emeralds_it = {
    .xTiles = 30,
    .yTiles = 6,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_collect_all_chaos_emeralds_it,
    .tilesSize = sizeof(Tiles_collect_all_chaos_emeralds_it),
    .palette = Palette_collect_all_chaos_emeralds_it,
    .palOffset = 0,
    .palLength = sizeof(Palette_collect_all_chaos_emeralds_it) / sizeof(u16),
    .map = Tilemap_collect_all_chaos_emeralds_it,
};
