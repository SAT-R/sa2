#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_title_screen_bg[] = INCBIN_U16("data/tilemaps/title_screen_bg/palette.gbapal");
ALIGNED(4) static const u8 Tiles_title_screen_bg[] = INCBIN_U8("data/tilemaps/title_screen_bg/tiles.4bpp");
ALIGNED(4) static const u16 Tilemap_title_screen_bg[] = INCBIN_U16("data/tilemaps/title_screen_bg/tilemap.tilemap2");

ALIGNED(4) const Tilemap title_screen_bg = {
    .xTiles = 32,
    .yTiles = 64,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_title_screen_bg,
    .tilesSize = sizeof(Tiles_title_screen_bg),
    .palette = Palette_title_screen_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_title_screen_bg) / sizeof(u16),
    .map = Tilemap_title_screen_bg,
};
