#include "global.h"
#include "core.h"

const ColorRaw Palette_storyframe_tails_unlocked_jp[] = INCPAL("data/tilemaps/storyframe_tails_unlocked_jp/palette.pal");
const u8 Tiles_storyframe_tails_unlocked_jp[] = INCBIN_U8("data/tilemaps/storyframe_tails_unlocked_jp/tiles.4bpp");
const u16 Tilemap_storyframe_tails_unlocked_jp[] = INCBIN_U16("data/tilemaps/storyframe_tails_unlocked_jp/tilemap.tilemap2");

const Tilemap storyframe_tails_unlocked_jp = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_tails_unlocked_jp,
    .tilesSize = sizeof(Tiles_storyframe_tails_unlocked_jp),
    .palette = Palette_storyframe_tails_unlocked_jp,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_storyframe_tails_unlocked_jp),
    .map = Tilemap_storyframe_tails_unlocked_jp,
};
