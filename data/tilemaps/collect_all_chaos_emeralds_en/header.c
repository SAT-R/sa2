#include "global.h"
#include "core.h"

const u16 Palette_collect_all_chaos_emeralds_en[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_en/palette.gbapal");
const u8 Tiles_collect_all_chaos_emeralds_en[] = INCBIN_U8("data/tilemaps/collect_all_chaos_emeralds_en/tiles.4bpp");
const u16 Tilemap_collect_all_chaos_emeralds_en[] = INCBIN_U16("data/tilemaps/collect_all_chaos_emeralds_en/tilemap.tilemap2");

const Tilemap collect_all_chaos_emeralds_en = {
    .xTiles = 30,
    .yTiles = 6,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_collect_all_chaos_emeralds_en,
    .tilesSize = sizeof(Tiles_collect_all_chaos_emeralds_en),
    .palette = Palette_collect_all_chaos_emeralds_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_collect_all_chaos_emeralds_en) / sizeof(u16),
    .map = Tilemap_collect_all_chaos_emeralds_en,
};
