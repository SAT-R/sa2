#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_sonic_leaves_3[] = INCPAL("data/tilemaps/storyframe_sonic_leaves_3/palette.pal");
const u8 Tiles_storyframe_sonic_leaves_3[] = INCBIN_U8("data/tilemaps/storyframe_sonic_leaves_3/tiles.4bpp");
const u16 Tilemap_storyframe_sonic_leaves_3[] = INCBIN_U16("data/tilemaps/storyframe_sonic_leaves_3/tilemap.tilemap2");

const Tilemap storyframe_sonic_leaves_3 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_sonic_leaves_3,
    .tilesSize = sizeof(Tiles_storyframe_sonic_leaves_3),
    .palette = Palette_storyframe_sonic_leaves_3,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_sonic_leaves_3),
    .map = Tilemap_storyframe_sonic_leaves_3,
};
