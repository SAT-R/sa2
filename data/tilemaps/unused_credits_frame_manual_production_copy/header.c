#include "global.h"
#include "core.h"

const u16 Palette_unused_credits_frame_manual_production_copy[] = INCBIN_U16(
    "data/tilemaps/unused_credits_frame_manual_production_copy/palette.gbapal");
const u8 Tiles_unused_credits_frame_manual_production_copy[]
    = INCBIN_U8("data/tilemaps/unused_credits_frame_manual_production_copy/tiles.4bpp");
const u16 Tilemap_unused_credits_frame_manual_production_copy[] = INCBIN_U16(
    "data/tilemaps/unused_credits_frame_manual_production_copy/tilemap.tilemap2");

const Tilemap unused_credits_frame_manual_production_copy = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unused_credits_frame_manual_production_copy,
    .tilesSize = sizeof(Tiles_unused_credits_frame_manual_production_copy),
    .palette = Palette_unused_credits_frame_manual_production_copy,
    .palOffset = 0,
    .palLength
    = sizeof(Palette_unused_credits_frame_manual_production_copy) / sizeof(u16),
    .map = Tilemap_unused_credits_frame_manual_production_copy,
};
