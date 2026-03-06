#include "global.h"
#include "core.h"

const ColorRaw Palette_title_screen_bg[] = INCPAL("data/tilemaps/title_screen_bg/palette.pal");
const u8 Tiles_title_screen_bg[] = INCBIN_U8("data/tilemaps/title_screen_bg/tiles.4bpp");
const u16 Tilemap_title_screen_bg[] = INCBIN_U16("data/tilemaps/title_screen_bg/tilemap.tilemap2");

const Tilemap title_screen_bg = {
    .xTiles = 32,
    .yTiles = 64,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_title_screen_bg,
    .tilesSize = sizeof(Tiles_title_screen_bg),
    .palette = Palette_title_screen_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_title_screen_bg),
    .map = Tilemap_title_screen_bg,
};
