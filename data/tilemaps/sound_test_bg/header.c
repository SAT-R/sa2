#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_sound_test_bg[]
    = INCBIN_U16("data/tilemaps/sound_test_bg/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_sound_test_bg[]
    = INCBIN_U8("data/tilemaps/sound_test_bg/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_sound_test_bg[]
    = INCBIN_U16("data/tilemaps/sound_test_bg/tilemap.tilemap2");

ALIGNED(4)
const Tilemap sound_test_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_sound_test_bg,
    .tilesSize = sizeof(Tiles_sound_test_bg),
    .palette = Palette_sound_test_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_sound_test_bg) / sizeof(u16),
    .map = Tilemap_sound_test_bg,
};
