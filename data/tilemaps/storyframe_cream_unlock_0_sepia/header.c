#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_cream_unlock_0_sepia[] = INCPAL("data/tilemaps/storyframe_cream_unlock_0_sepia/palette.pal");
const u8 Tiles_storyframe_cream_unlock_0_sepia[] = INCBIN_U8("data/tilemaps/storyframe_cream_unlock_0_sepia/tiles.4bpp");
const u16 Tilemap_storyframe_cream_unlock_0_sepia[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlock_0_sepia/tilemap.tilemap2");

const Tilemap storyframe_cream_unlock_0_sepia = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlock_0_sepia,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlock_0_sepia),
    .palette = Palette_storyframe_cream_unlock_0_sepia,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_cream_unlock_0_sepia),
    .map = Tilemap_storyframe_cream_unlock_0_sepia,
};
