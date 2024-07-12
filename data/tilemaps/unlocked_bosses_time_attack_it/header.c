#include "global.h"
#include "core.h"

const u16 Palette_unlocked_bosses_time_attack_it[] = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_it/palette.gbapal");
const u8 Tiles_unlocked_bosses_time_attack_it[] = INCBIN_U8("data/tilemaps/unlocked_bosses_time_attack_it/tiles.4bpp");
const u16 Tilemap_unlocked_bosses_time_attack_it[] = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_it/tilemap.tilemap2");

const Tilemap unlocked_bosses_time_attack_it = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_bosses_time_attack_it,
    .tilesSize = sizeof(Tiles_unlocked_bosses_time_attack_it),
    .palette = Palette_unlocked_bosses_time_attack_it,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_bosses_time_attack_it) / sizeof(u16),
    .map = Tilemap_unlocked_bosses_time_attack_it,
};
