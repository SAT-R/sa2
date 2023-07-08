#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_storyframe_knuckles_unlocked_es[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlocked_es/palette.gbapal");
ALIGNED(4) static const u8 Tiles_storyframe_knuckles_unlocked_es[] = INCBIN_U8("data/tilemaps/storyframe_knuckles_unlocked_es/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_storyframe_knuckles_unlocked_es[] = INCBIN_U16("data/tilemaps/storyframe_knuckles_unlocked_es/tilemap.tilemap2");

ALIGNED(4) const Tilemap storyframe_knuckles_unlocked_es = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_storyframe_knuckles_unlocked_es,
    .tilesSize = sizeof(Tiles_storyframe_knuckles_unlocked_es),
    .palette = Palette_storyframe_knuckles_unlocked_es,
    .palOffset = 0,
    .palLength = sizeof(Palette_storyframe_knuckles_unlocked_es) / sizeof(u16),
    .map = Tilemap_storyframe_knuckles_unlocked_es,
};
