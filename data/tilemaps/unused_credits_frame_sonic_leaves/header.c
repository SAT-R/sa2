#include "global.h"
#include "core.h"

const u16 Palette_unused_credits_frame_sonic_leaves[] = INCBIN_U16("data/tilemaps/unused_credits_frame_sonic_leaves/palette.gbapal");
const u8 Tiles_unused_credits_frame_sonic_leaves[] = INCBIN_U8("data/tilemaps/unused_credits_frame_sonic_leaves/tiles.4bpp");
const u16 Tilemap_unused_credits_frame_sonic_leaves[] = INCBIN_U16("data/tilemaps/unused_credits_frame_sonic_leaves/tilemap.tilemap2");

const Tilemap unused_credits_frame_sonic_leaves = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unused_credits_frame_sonic_leaves,
    .tilesSize = sizeof(Tiles_unused_credits_frame_sonic_leaves),
    .palette = Palette_unused_credits_frame_sonic_leaves,
    .palOffset = 0,
    .palLength = sizeof(Palette_unused_credits_frame_sonic_leaves) / sizeof(u16),
    .map = Tilemap_unused_credits_frame_sonic_leaves,
};
