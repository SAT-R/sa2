#include "global.h"
#include "core.h"

const u16 Palette_unlocked_sound_test_it[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_it/palette.gbapal");
const u8 Tiles_unlocked_sound_test_it[]
    = INCBIN_U8("data/tilemaps/unlocked_sound_test_it/tiles.4bpp");
const u16 Tilemap_unlocked_sound_test_it[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_it/tilemap.tilemap2");

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
