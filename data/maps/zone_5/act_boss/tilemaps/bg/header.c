#include "global.h"
#include "core.h"

const ColorRaw Palette_zone_5_act_boss_bg[] = INCPAL("data/maps/zone_5/act_boss/tilemaps/bg/palette.gbapal");
const u8 Tiles_zone_5_act_boss_bg[] = INCBIN_U8("data/maps/zone_5/act_boss/tilemaps/bg/tiles.4bpp");
const u16 Tilemap_zone_5_act_boss_bg[] = INCBIN_U16("data/maps/zone_5/act_boss/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_5_act_boss_bg = {
    .xTiles = 32,
    .yTiles = 23,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_5_act_boss_bg,
    .tilesSize = sizeof(Tiles_zone_5_act_boss_bg),
    .palette = Palette_zone_5_act_boss_bg,
    .palOffset = 0,
    .palLength = ARRAY_COUNT(Palette_zone_5_act_boss_bg),
    .map = Tilemap_zone_5_act_boss_bg,
};
