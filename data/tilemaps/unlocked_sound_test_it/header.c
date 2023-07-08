#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_unlocked_sound_test_it[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_it/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_unlocked_sound_test_it[]
    = INCBIN_U8("data/tilemaps/unlocked_sound_test_it/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_unlocked_sound_test_it[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_it/tilemap.tilemap2");

ALIGNED(4)
const Tilemap unlocked_sound_test_it = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_sound_test_it,
    .tilesSize = sizeof(Tiles_unlocked_sound_test_it),
    .palette = Palette_unlocked_sound_test_it,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_sound_test_it) / sizeof(u16),
    .map = Tilemap_unlocked_sound_test_it,
};
