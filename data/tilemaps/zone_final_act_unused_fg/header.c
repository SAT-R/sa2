#include "global.h"
#include "core.h"

ALIGNED(4) static const u16 Palette_zone_final_act_unused_fg[] = INCBIN_U16("data/tilemaps/zone_final_act_unused_fg/palette.gbapal");
ALIGNED(4) static const u8 Tileset_zone_final_act_unused_fg[] = INCBIN_U8("data/tilemaps/zone_final_act_unused_fg/tileset.4bpp");
ALIGNED(4) static const u8 CollHeightMap_zone_final_act_unused_fg[] = INCBIN_U8("data/tilemaps/zone_final_act_unused_fg/height_map.coll");
ALIGNED(4) static const u8 CollTileRot_zone_final_act_unused_fg[] = INCBIN_U8("data/tilemaps/zone_final_act_unused_fg/tile_rot.coll");
ALIGNED(4) static const u8 CollFlags_zone_final_act_unused_fg[] = INCBIN_U8("data/tilemaps/zone_final_act_unused_fg/flags.coll");
ALIGNED(4) static const u16 Metatiles_zone_final_act_unused_fg[] = INCBIN_U16("data/tilemaps/zone_final_act_unused_fg/metatiles.tilemap2");

ALIGNED(4) static const u16 Map_zone_final_act_unused_fg0[] = INCBIN_U16("data/tilemaps/zone_final_act_unused_fg/map_front.bin");

ALIGNED(4) static const u16 Map_zone_final_act_unused_fg1[] = INCBIN_U16("data/tilemaps/zone_final_act_unused_fg/map_back.bin");

ALIGNED(4) const struct MapHeader MapHeader_zone_final_act_unused_fg0 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_final_act_unused_fg,
        .tilesSize = sizeof(Tileset_zone_final_act_unused_fg),
        .palette = Palette_zone_final_act_unused_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_final_act_unused_fg) / sizeof(u16),
        .map = Metatiles_zone_final_act_unused_fg,
    },
    .metatileMap = Map_zone_final_act_unused_fg0,
    .mapWidth = 20,
    .mapHeight = 12,
};

ALIGNED(4) const struct MapHeader MapHeader_zone_final_act_unused_fg1 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_final_act_unused_fg,
        .tilesSize = sizeof(Tileset_zone_final_act_unused_fg),
        .palette = Palette_zone_final_act_unused_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_final_act_unused_fg) / sizeof(u16),
        .map = Metatiles_zone_final_act_unused_fg,
    },
    .metatileMap = Map_zone_final_act_unused_fg1,
    .mapWidth = 20,
    .mapHeight = 12,
};

ALIGNED(4) const Collision CollHeader_zone_final_act_unused_fg = {
    CollHeightMap_zone_final_act_unused_fg, CollTileRot_zone_final_act_unused_fg,
    Metatiles_zone_final_act_unused_fg,
    Map_zone_final_act_unused_fg0, Map_zone_final_act_unused_fg1,
    CollFlags_zone_final_act_unused_fg,
    20, 12,
    0x80, 0x07, 0x00, 0x00,
    0x0480, 0x0000
};

