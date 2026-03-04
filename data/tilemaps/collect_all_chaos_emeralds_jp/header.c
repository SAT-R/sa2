#include "global.h"
#include "core.h"

const ColorRaw Palette_collect_all_chaos_emeralds_jp[] = INCPAL("data/tilemaps/collect_all_chaos_emeralds_jp/palette.pal");
const u8 Tiles_collect_all_chaos_emeralds_jp[] = INCBIN_U8("data/tilemaps/collect_all_chaos_emeralds_jp/tiles.4bpp");
const u16 Tilemap_collect_all_chaos_emeralds_jp[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_jp/tilemap.tilemap2");

const Tilemap collect_all_chaos_emeralds_jp = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_collect_all_chaos_emeralds_jp,
    .tilesSize = sizeof(Tiles_collect_all_chaos_emeralds_jp),
    .palette = Palette_collect_all_chaos_emeralds_jp,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_collect_all_chaos_emeralds_jp),
    .map = Tilemap_collect_all_chaos_emeralds_jp,
};
