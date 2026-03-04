#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_sonic_leaves_6[] = INCPAL("data/tilemaps/storyframe_sonic_leaves_6/palette.pal");
const u8 Tiles_storyframe_sonic_leaves_6[] = INCBIN_U8("data/tilemaps/storyframe_sonic_leaves_6/tiles.4bpp");
const u16 Tilemap_storyframe_sonic_leaves_6[] = INCBIN_U16("data/tilemaps/storyframe_sonic_leaves_6/tilemap.tilemap2");

const Tilemap storyframe_sonic_leaves_6 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_sonic_leaves_6,
    .tilesSize = sizeof(Tiles_storyframe_sonic_leaves_6),
    .palette = Palette_storyframe_sonic_leaves_6,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_sonic_leaves_6),
    .map = Tilemap_storyframe_sonic_leaves_6,
};
