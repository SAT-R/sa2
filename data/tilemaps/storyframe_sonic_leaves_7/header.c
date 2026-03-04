#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_sonic_leaves_7[] = INCPAL("data/tilemaps/storyframe_sonic_leaves_7/palette.pal");
const u8 Tiles_storyframe_sonic_leaves_7[] = INCBIN_U8("data/tilemaps/storyframe_sonic_leaves_7/tiles.4bpp");
const u16 Tilemap_storyframe_sonic_leaves_7[] = INCBIN_U16("data/tilemaps/storyframe_sonic_leaves_7/tilemap.tilemap2");

const Tilemap storyframe_sonic_leaves_7 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_sonic_leaves_7,
    .tilesSize = sizeof(Tiles_storyframe_sonic_leaves_7),
    .palette = Palette_storyframe_sonic_leaves_7,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_sonic_leaves_7),
    .map = Tilemap_storyframe_sonic_leaves_7,
};
