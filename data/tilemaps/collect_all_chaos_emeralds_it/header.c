#include "global.h"
#include "core.h"

const ColorRaw Palette_collect_all_chaos_emeralds_it[] = INCPAL("data/tilemaps/collect_all_chaos_emeralds_it/palette.pal");
const u8 Tiles_collect_all_chaos_emeralds_it[] = INCBIN_U8("data/tilemaps/collect_all_chaos_emeralds_it/tiles.4bpp");
const u16 Tilemap_collect_all_chaos_emeralds_it[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_it/tilemap.tilemap2");

const Tilemap collect_all_chaos_emeralds_it = {
    .xTiles = 30,
    .yTiles = 6,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_collect_all_chaos_emeralds_it,
    .tilesSize = sizeof(Tiles_collect_all_chaos_emeralds_it),
    .palette = Palette_collect_all_chaos_emeralds_it,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_collect_all_chaos_emeralds_it),
    .map = Tilemap_collect_all_chaos_emeralds_it,
};
