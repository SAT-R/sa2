#include "global.h"
#include "core.h"

const u16 Palette_zone_2_act_1_fg[] = INCBIN_U16("data/sa1/maps/zone_2/act_1/tilemaps/fg/palette.gbapal");
const u8 Tileset_zone_2_act_1_fg[] = INCBIN_U8("data/sa1/maps/zone_2/act_1/tilemaps/fg/tileset.4bpp");
const s8 CollHeightMap_zone_2_act_1_fg[] = INCBIN_S8("data/sa1/maps/zone_2/act_1/tilemaps/fg/height_map.coll");
const u8 CollTileRot_zone_2_act_1_fg[] = INCBIN_U8("data/sa1/maps/zone_2/act_1/tilemaps/fg/tile_rot.coll");
const u16 Metatiles_zone_2_act_1_fg[] = INCBIN_U16("data/sa1/maps/zone_2/act_1/tilemaps/fg/metatiles.tilemap2");

const MetatileIndexType Map_zone_2_act_1_fg0[] = INCBIN_MAP("data/sa1/maps/zone_2/act_1/tilemaps/fg/map_front.bin");

const MetatileIndexType Map_zone_2_act_1_fg1[] = INCBIN_MAP("data/sa1/maps/zone_2/act_1/tilemaps/fg/map_back.bin");

const u16 CollFlags_zone_2_act_1_fg[] = INCBIN_U16("data/sa1/maps/zone_2/act_1/tilemaps/fg/flags.coll");
ALIGNED(4) const struct MapHeader zone_2_act_1_fg0 = 
{
    .tileset = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0x340,
        .animFrameCount = 8,
        .animDelay = 4,
        .tiles = Tileset_zone_2_act_1_fg,
        .tilesSize = (u32)sizeof(Tileset_zone_2_act_1_fg) - (8 * 0x340),
        .palette = Palette_zone_2_act_1_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_2_act_1_fg) / sizeof(u16),
        .map = Metatiles_zone_2_act_1_fg,
    },
    .metatileMap = Map_zone_2_act_1_fg0,
    .mapWidth = 108,
    .mapHeight = 16,
};

ALIGNED(4) const struct MapHeader zone_2_act_1_fg1 = 
{
    .tileset = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0x00,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_2_act_1_fg,
        .tilesSize = (u32)sizeof(Tileset_zone_2_act_1_fg) - (8 * 0x340),
        .palette = Palette_zone_2_act_1_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_2_act_1_fg) / sizeof(u16),
        .map = Metatiles_zone_2_act_1_fg,
    },
    .metatileMap = Map_zone_2_act_1_fg1,
    .mapWidth = 108,
    .mapHeight = 16,
};

const Collision CollHeader_zone_2_act_1_fg = { CollHeightMap_zone_2_act_1_fg,
                                               CollTileRot_zone_2_act_1_fg,
                                               Metatiles_zone_2_act_1_fg,
                                               { Map_zone_2_act_1_fg0, Map_zone_2_act_1_fg1 },
                                               CollFlags_zone_2_act_1_fg,
                                               108,
                                               16,
                                               0x2880,
                                               0x0600 };
