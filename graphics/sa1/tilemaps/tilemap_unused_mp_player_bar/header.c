#include "global.h"
#include "core.h"

const u16 Palette_tilemap_unused_mp_player_bar[] = INCBIN_U16("graphics/sa1/tilemaps/tilemap_unused_mp_player_bar/palette.gbapal");
const u8 Tiles_tilemap_unused_mp_player_bar[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_unused_mp_player_bar/tiles.4bpp");
const u8 Tilemap_tilemap_unused_mp_player_bar[] = INCBIN_U8("graphics/sa1/tilemaps/tilemap_unused_mp_player_bar/tilemap.tilemap2");

// 0x080D4AF4
const Tilemap tilemap_unused_mp_player_bar = {
    .xTiles = 30,
    .yTiles = 5,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_tilemap_unused_mp_player_bar,
    .tilesSize = sizeof(Tiles_tilemap_unused_mp_player_bar),
    .palette = Palette_tilemap_unused_mp_player_bar,
    .palOffset = 0,
    .palLength = sizeof(Palette_tilemap_unused_mp_player_bar) / sizeof(u16),
    .map = (const u16 *)Tilemap_tilemap_unused_mp_player_bar,
};
