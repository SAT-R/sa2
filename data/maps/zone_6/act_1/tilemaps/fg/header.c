#include "global.h"
#include "core.h"

const u16 Palette_zone_6_act_1_fg[]
    = INCBIN_U16("data/maps/zone_6/act_1/tilemaps/fg/palette.gbapal");
const u8 Tileset_zone_6_act_1_fg[]
    = INCBIN_U8("data/maps/zone_6/act_1/tilemaps/fg/tileset.4bpp");
const u8 Tileset_AnimTiles_zone_6_act_1_fg[]
    = INCBIN_U8("data/maps/zone_6/act_1/tilemaps/fg/tileset_anim.4bpp");
const u8 CollHeightMap_zone_6_act_1_fg[]
    = INCBIN_U8("data/maps/zone_6/act_1/tilemaps/fg/height_map.coll");
const u8 CollTileRot_zone_6_act_1_fg[]
    = INCBIN_U8("data/maps/zone_6/act_1/tilemaps/fg/tile_rot.coll");
const u16 CollFlags_zone_6_act_1_fg[]
    = INCBIN_U16("data/maps/zone_6/act_1/tilemaps/fg/flags.coll");
const u16 Metatiles_zone_6_act_1_fg[]
    = INCBIN_U16("data/maps/zone_6/act_1/tilemaps/fg/metatiles.tilemap2");

const u16 Map_zone_6_act_1_fg0[]
    = INCBIN_U16("data/maps/zone_6/act_1/tilemaps/fg/map_front.bin");

const u16 Map_zone_6_act_1_fg1[]
    = INCBIN_U16("data/maps/zone_6/act_1/tilemaps/fg/map_back.bin");

ALIGNED(4) const struct MapHeader MapHeader_zone_6_act_1_fg0 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 800,
        .animFrameCount = 4,
        .animDelay = 5,
        .tiles = Tileset_zone_6_act_1_fg,
        .tilesSize = sizeof(Tileset_zone_6_act_1_fg),
        .palette = Palette_zone_6_act_1_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_6_act_1_fg) / sizeof(u16),
        .map = Metatiles_zone_6_act_1_fg,
    },
    .metatileMap = Map_zone_6_act_1_fg0,
    .mapWidth = 313,
    .mapHeight = 46,
};

ALIGNED(4) const struct MapHeader MapHeader_zone_6_act_1_fg1 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 800,
        .animFrameCount = 4,
        .animDelay = 5,
        .tiles = Tileset_zone_6_act_1_fg,
        .tilesSize = sizeof(Tileset_zone_6_act_1_fg),
        .palette = Palette_zone_6_act_1_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_6_act_1_fg) / sizeof(u16),
        .map = Metatiles_zone_6_act_1_fg,
    },
    .metatileMap = Map_zone_6_act_1_fg1,
    .mapWidth = 313,
    .mapHeight = 46,
};

const Collision CollHeader_zone_6_act_1_fg = { CollHeightMap_zone_6_act_1_fg,
                                               CollTileRot_zone_6_act_1_fg,
                                               Metatiles_zone_6_act_1_fg,
                                               Map_zone_6_act_1_fg0,
                                               Map_zone_6_act_1_fg1,
                                               CollFlags_zone_6_act_1_fg,
                                               313,
                                               46,
                                               0x7560,
                                               0x1140 };
