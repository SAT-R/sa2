#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_knuckles_unlock_2[] = INCPAL("data/tilemaps/storyframe_knuckles_unlock_2/palette.pal");
const u8 Tiles_storyframe_knuckles_unlock_2[] = INCBIN_U8("data/tilemaps/storyframe_knuckles_unlock_2/tiles.4bpp");
const u16 Tilemap_storyframe_knuckles_unlock_2[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlock_2/tilemap.tilemap2");

const Tilemap storyframe_knuckles_unlock_2 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_knuckles_unlock_2,
    .tilesSize = sizeof(Tiles_storyframe_knuckles_unlock_2),
    .palette = Palette_storyframe_knuckles_unlock_2,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_knuckles_unlock_2),
    .map = Tilemap_storyframe_knuckles_unlock_2,
};
