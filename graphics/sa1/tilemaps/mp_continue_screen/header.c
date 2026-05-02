#include "global.h"
#include "core.h"

const u16 Palette_mp_continue_screen[] = INCBIN_U16("graphics/sa1/tilemaps/mp_continue_screen/palette.gbapal");
const u8 Tiles_mp_continue_screen[] = INCBIN_U8("graphics/sa1/tilemaps/mp_continue_screen/tiles.4bpp");
const u8 Tilemap_mp_continue_screen[] = INCBIN_U8("graphics/sa1/tilemaps/mp_continue_screen/tilemap.tilemap2");

const Tilemap mp_continue_screen = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_continue_screen,
    .tilesSize = sizeof(Tiles_mp_continue_screen),
    .palette = Palette_mp_continue_screen,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_continue_screen) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_continue_screen,
};
