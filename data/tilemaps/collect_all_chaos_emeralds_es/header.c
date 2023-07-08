#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_collect_all_chaos_emeralds_es[]
    = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_es/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_collect_all_chaos_emeralds_es[]
    = INCBIN_U8("data/tilemaps/collect_all_chaos_emeralds_es/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_collect_all_chaos_emeralds_es[]
    = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_es/tilemap.tilemap2");

ALIGNED(4)
const Tilemap collect_all_chaos_emeralds_es = {
    .xTiles = 30,
    .yTiles = 6,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_collect_all_chaos_emeralds_es,
    .tilesSize = sizeof(Tiles_collect_all_chaos_emeralds_es),
    .palette = Palette_collect_all_chaos_emeralds_es,
    .palOffset = 0,
    .palLength = sizeof(Palette_collect_all_chaos_emeralds_es) / sizeof(u16),
    .map = Tilemap_collect_all_chaos_emeralds_es,
};
