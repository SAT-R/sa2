#include "global.h"
#include "core.h"

const u16 Palette_storyframe_sonic_leaves_5[] = INCBIN_U16("data/tilemaps/storyframe_sonic_leaves_5/palette.gbapal");
const u8 Tiles_storyframe_sonic_leaves_5[] = INCBIN_U8("data/tilemaps/storyframe_sonic_leaves_5/tiles.4bpp");
const u16 Tilemap_storyframe_sonic_leaves_5[] = INCBIN_U16("data/tilemaps/storyframe_sonic_leaves_5/tilemap.tilemap2");

const Tilemap storyframe_sonic_leaves_5 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_sonic_leaves_5,
    .tilesSize = sizeof(Tiles_storyframe_sonic_leaves_5),
    .palette = Palette_storyframe_sonic_leaves_5,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_sonic_leaves_5) / sizeof(u16),
    .map = Tilemap_storyframe_sonic_leaves_5,
};
