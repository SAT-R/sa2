#include "global.h"
#include "core.h"

const ColorRaw Palette_sound_test_bg[] = INCPAL("data/tilemaps/sound_test_bg/palette.pal");
const u8 Tiles_sound_test_bg[] = INCBIN_U8("data/tilemaps/sound_test_bg/tiles.4bpp");
const u16 Tilemap_sound_test_bg[] = INCBIN_U16("data/tilemaps/sound_test_bg/tilemap.tilemap2");

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
    .palLength = ARRAY_COUNT(Palette_sound_test_bg),
    .map = Tilemap_sound_test_bg,
};
