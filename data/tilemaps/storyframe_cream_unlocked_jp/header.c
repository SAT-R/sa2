#include "global.h"
#include "core.h"

const u16 Palette_storyframe_cream_unlocked_jp[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlocked_jp/palette.gbapal");
const u8 Tiles_storyframe_cream_unlocked_jp[] = INCBIN_U8("data/tilemaps/storyframe_cream_unlocked_jp/tiles.4bpp");
const u16 Tilemap_storyframe_cream_unlocked_jp[] = INCBIN_U16("data/tilemaps/storyframe_cream_unlocked_jp/tilemap.tilemap2");

const Tilemap storyframe_cream_unlocked_jp = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_cream_unlocked_jp,
    .tilesSize = sizeof(Tiles_storyframe_cream_unlocked_jp),
    .palette = Palette_storyframe_cream_unlocked_jp,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_cream_unlocked_jp) / sizeof(u16),
    .map = Tilemap_storyframe_cream_unlocked_jp,
};
