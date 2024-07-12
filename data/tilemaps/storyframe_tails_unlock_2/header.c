#include "global.h"
#include "core.h"

const u16 Palette_storyframe_tails_unlock_2[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_2/palette.gbapal");
const u8 Tiles_storyframe_tails_unlock_2[] = INCBIN_U8("data/tilemaps/storyframe_tails_unlock_2/tiles.4bpp");
const u16 Tilemap_storyframe_tails_unlock_2[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlock_2/tilemap.tilemap2");

const Tilemap storyframe_tails_unlock_2 = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_tails_unlock_2,
    .tilesSize = sizeof(Tiles_storyframe_tails_unlock_2),
    .palette = Palette_storyframe_tails_unlock_2,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_tails_unlock_2) / sizeof(u16),
    .map = Tilemap_storyframe_tails_unlock_2,
};
