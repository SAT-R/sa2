#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_knuckles_unlocked_de[] = INCPAL("data/tilemaps/storyframe_knuckles_unlocked_de/palette.pal");
const u8 Tiles_storyframe_knuckles_unlocked_de[] = INCBIN_U8("data/tilemaps/storyframe_knuckles_unlocked_de/tiles.4bpp");
const u16 Tilemap_storyframe_knuckles_unlocked_de[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlocked_de/tilemap.tilemap2");

const Tilemap storyframe_knuckles_unlocked_de = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_knuckles_unlocked_de,
    .tilesSize = sizeof(Tiles_storyframe_knuckles_unlocked_de),
    .palette = Palette_storyframe_knuckles_unlocked_de,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_knuckles_unlocked_de),
    .map = Tilemap_storyframe_knuckles_unlocked_de,
};
