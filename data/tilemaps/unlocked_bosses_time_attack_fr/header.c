#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_unlocked_bosses_time_attack_fr[]
    = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_fr/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_unlocked_bosses_time_attack_fr[]
    = INCBIN_U8("data/tilemaps/unlocked_bosses_time_attack_fr/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_unlocked_bosses_time_attack_fr[]
    = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_fr/tilemap.tilemap2");

ALIGNED(4)
const Tilemap unlocked_bosses_time_attack_fr = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_bosses_time_attack_fr,
    .tilesSize = sizeof(Tiles_unlocked_bosses_time_attack_fr),
    .palette = Palette_unlocked_bosses_time_attack_fr,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_bosses_time_attack_fr) / sizeof(u16),
    .map = Tilemap_unlocked_bosses_time_attack_fr,
};
