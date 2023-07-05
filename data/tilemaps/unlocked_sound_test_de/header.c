#include "global.h"
#include "core.h"

const u16 Palette_unlocked_sound_test_de[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_de/palette.gbapal");
const u8 Tiles_unlocked_sound_test_de[]
    = INCBIN_U8("data/tilemaps/unlocked_sound_test_de/tiles.4bpp");
const u16 Tilemap_unlocked_sound_test_de[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_de/tilemap.tilemap2");

const Tilemap unlocked_sound_test_de = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_sound_test_de,
    .tilesSize = sizeof(Tiles_unlocked_sound_test_de),
    .palette = Palette_unlocked_sound_test_de,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_sound_test_de) / sizeof(u16),
    .map = Tilemap_unlocked_sound_test_de,
};
