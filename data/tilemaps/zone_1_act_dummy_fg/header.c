#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_zone_1_act_dummy_fg[]
    = INCBIN_U16("data/tilemaps/zone_1_act_dummy_fg/palette.gbapal");
ALIGNED(4)
static const u8 Tileset_zone_1_act_dummy_fg[]
    = INCBIN_U8("data/tilemaps/zone_1_act_dummy_fg/tileset.4bpp");
ALIGNED(4)
static const u8 CollHeightMap_zone_1_act_dummy_fg[]
    = INCBIN_U8("data/tilemaps/zone_1_act_dummy_fg/height_map.coll");
ALIGNED(4)
static const u8 CollTileRot_zone_1_act_dummy_fg[]
    = INCBIN_U8("data/tilemaps/zone_1_act_dummy_fg/tile_rot.coll");
ALIGNED(4)
static const u8 CollFlags_zone_1_act_dummy_fg[]
    = INCBIN_U8("data/tilemaps/zone_1_act_dummy_fg/flags.coll");
ALIGNED(4)
static const u16 Metatiles_zone_1_act_dummy_fg[]
    = INCBIN_U16("data/tilemaps/zone_1_act_dummy_fg/metatiles.tilemap2");

ALIGNED(4)
static const u16 Map_zone_1_act_dummy_fg0[]
    = INCBIN_U16("data/tilemaps/zone_1_act_dummy_fg/map_front.bin");

ALIGNED(4)
static const u16 Map_zone_1_act_dummy_fg1[]
    = INCBIN_U16("data/tilemaps/zone_1_act_dummy_fg/map_back.bin");

ALIGNED(4) const struct MapHeader MapHeader_zone_1_act_dummy_fg0 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_1_act_dummy_fg,
        .tilesSize = sizeof(Tileset_zone_1_act_dummy_fg),
        .palette = Palette_zone_1_act_dummy_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_1_act_dummy_fg) / sizeof(u16),
        .map = Metatiles_zone_1_act_dummy_fg,
    },
    .metatileMap = Map_zone_1_act_dummy_fg0,
    .mapWidth = 6,
    .mapHeight = 3,
};

ALIGNED(4) const struct MapHeader MapHeader_zone_1_act_dummy_fg1 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_1_act_dummy_fg,
        .tilesSize = sizeof(Tileset_zone_1_act_dummy_fg),
        .palette = Palette_zone_1_act_dummy_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_1_act_dummy_fg) / sizeof(u16),
        .map = Metatiles_zone_1_act_dummy_fg,
    },
    .metatileMap = Map_zone_1_act_dummy_fg1,
    .mapWidth = 6,
    .mapHeight = 3,
};

ALIGNED(4)
const Collision CollHeader_zone_1_act_dummy_fg = { CollHeightMap_zone_1_act_dummy_fg,
                                                   CollTileRot_zone_1_act_dummy_fg,
                                                   Metatiles_zone_1_act_dummy_fg,
                                                   Map_zone_1_act_dummy_fg0,
                                                   Map_zone_1_act_dummy_fg1,
                                                   CollFlags_zone_1_act_dummy_fg,
                                                   6,
                                                   3,
                                                   0x40,
                                                   0x02,
                                                   0x00,
                                                   0x00,
                                                   0x0120,
                                                   0x0000 };
