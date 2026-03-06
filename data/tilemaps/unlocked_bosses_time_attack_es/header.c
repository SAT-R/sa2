#include "global.h"
#include "core.h"

const ColorRaw Palette_unlocked_bosses_time_attack_es[] = INCPAL("data/tilemaps/unlocked_bosses_time_attack_es/palette.pal");
const u8 Tiles_unlocked_bosses_time_attack_es[] = INCBIN_U8("data/tilemaps/unlocked_bosses_time_attack_es/tiles.4bpp");
const u16 Tilemap_unlocked_bosses_time_attack_es[] = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_es/tilemap.tilemap2");

const Tilemap unlocked_bosses_time_attack_es = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_bosses_time_attack_es,
    .tilesSize = sizeof(Tiles_unlocked_bosses_time_attack_es),
    .palette = Palette_unlocked_bosses_time_attack_es,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_unlocked_bosses_time_attack_es),
    .map = Tilemap_unlocked_bosses_time_attack_es,
};
