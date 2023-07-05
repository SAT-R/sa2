#include "global.h"
#include "core.h"

const u16 Palette_storyframe_cream_unlock_3_sepia[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_3_sepia/palette.gbapal");
const u8 Tiles_storyframe_cream_unlock_3_sepia[]
    = INCBIN_U8("data/tilemaps/storyframe_cream_unlock_3_sepia/tiles.4bpp");
const u16 Tilemap_storyframe_cream_unlock_3_sepia[]
    = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_3_sepia/tilemap.tilemap2");

const Tilemap storyframe_cream_unlock_3_sepia = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlock_3_sepia,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlock_3_sepia),
    .palette = Palette_storyframe_cream_unlock_3_sepia,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_cream_unlock_3_sepia) / sizeof(u16),
    .map = Tilemap_storyframe_cream_unlock_3_sepia,
};
