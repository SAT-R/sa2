#include "global.h"
#include "core.h"

const u16 Palette_unlocked_bosses_time_attack_jp[] = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_jp/palette.gbapal");
const u8 Tiles_unlocked_bosses_time_attack_jp[] = INCBIN_U8("data/tilemaps/unlocked_bosses_time_attack_jp/tiles.4bpp");
const u16 Tilemap_unlocked_bosses_time_attack_jp[] = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_jp/tilemap.tilemap2");

const Tilemap unlocked_bosses_time_attack_jp = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_bosses_time_attack_jp,
    .tilesSize = sizeof(Tiles_unlocked_bosses_time_attack_jp),
    .palette = Palette_unlocked_bosses_time_attack_jp,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_bosses_time_attack_jp) / sizeof(u16),
    .map = Tilemap_unlocked_bosses_time_attack_jp,
};
