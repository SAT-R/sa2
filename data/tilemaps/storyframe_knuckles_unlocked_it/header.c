#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_knuckles_unlocked_it[] = INCPAL("data/tilemaps/storyframe_knuckles_unlocked_it/palette.pal");
const u8 Tiles_storyframe_knuckles_unlocked_it[] = INCBIN_U8("data/tilemaps/storyframe_knuckles_unlocked_it/tiles.4bpp");
const u16 Tilemap_storyframe_knuckles_unlocked_it[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlocked_it/tilemap.tilemap2");

const Tilemap storyframe_knuckles_unlocked_it = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_knuckles_unlocked_it,
    .tilesSize = sizeof(Tiles_storyframe_knuckles_unlocked_it),
    .palette = Palette_storyframe_knuckles_unlocked_it,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_knuckles_unlocked_it),
    .map = Tilemap_storyframe_knuckles_unlocked_it,
};
