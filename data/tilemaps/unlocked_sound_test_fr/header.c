#include "global.h"
#include "core.h"

const u16 Palette_unlocked_sound_test_fr[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_fr/palette.gbapal");
const u8 Tiles_unlocked_sound_test_fr[]
    = INCBIN_U8("data/tilemaps/unlocked_sound_test_fr/tiles.4bpp");
const u16 Tilemap_unlocked_sound_test_fr[]
    = INCBIN_U16("data/tilemaps/unlocked_sound_test_fr/tilemap.tilemap2");

const Tilemap unlocked_sound_test_fr = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_sound_test_fr,
    .tilesSize = sizeof(Tiles_unlocked_sound_test_fr),
    .palette = Palette_unlocked_sound_test_fr,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_sound_test_fr) / sizeof(u16),
    .map = Tilemap_unlocked_sound_test_fr,
};
