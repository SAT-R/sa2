#include "global.h"
#include "core.h"

const u16 Palette_zone_final_act_xx_fg[]
    = INCBIN_U16("data/tilemaps/zone_final_act_xx_fg/palette.gbapal");
const u8 Tileset_zone_final_act_xx_fg[]
    = INCBIN_U8("data/tilemaps/zone_final_act_xx_fg/tileset.4bpp");
const u8 CollHeightMap_zone_final_act_xx_fg[]
    = INCBIN_U8("data/tilemaps/zone_final_act_xx_fg/height_map.coll");
const u8 CollTileRot_zone_final_act_xx_fg[]
    = INCBIN_U8("data/tilemaps/zone_final_act_xx_fg/tile_rot.coll");
const u8 CollFlags_zone_final_act_xx_fg[]
    = INCBIN_U8("data/tilemaps/zone_final_act_xx_fg/flags.coll");
const u16 Metatiles_zone_final_act_xx_fg[]
    = INCBIN_U16("data/tilemaps/zone_final_act_xx_fg/metatiles.tilemap2");

const u16 Map_zone_final_act_xx_fg0[]
    = INCBIN_U16("data/tilemaps/zone_final_act_xx_fg/map_front.bin");

const u16 Map_zone_final_act_xx_fg1[]
    = INCBIN_U16("data/tilemaps/zone_final_act_xx_fg/map_back.bin");

ALIGNED(4) const struct MapHeader MapHeader_zone_final_act_xx_fg0 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_final_act_xx_fg,
        .tilesSize = sizeof(Tileset_zone_final_act_xx_fg),
        .palette = Palette_zone_final_act_xx_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_final_act_xx_fg) / sizeof(u16),
        .map = Metatiles_zone_final_act_xx_fg,
    },
    .metatileMap = Map_zone_final_act_xx_fg0,
    .mapWidth = 450,
    .mapHeight = 3,
};

ALIGNED(4) const struct MapHeader MapHeader_zone_final_act_xx_fg1 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_final_act_xx_fg,
        .tilesSize = sizeof(Tileset_zone_final_act_xx_fg),
        .palette = Palette_zone_final_act_xx_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_final_act_xx_fg) / sizeof(u16),
        .map = Metatiles_zone_final_act_xx_fg,
    },
    .metatileMap = Map_zone_final_act_xx_fg1,
    .mapWidth = 450,
    .mapHeight = 3,
};

const Collision CollHeader_zone_final_act_xx_fg = { CollHeightMap_zone_final_act_xx_fg,
                                                    CollTileRot_zone_final_act_xx_fg,
                                                    Metatiles_zone_final_act_xx_fg,
                                                    Map_zone_final_act_xx_fg0,
                                                    Map_zone_final_act_xx_fg1,
                                                    CollFlags_zone_final_act_xx_fg,
                                                    450,
                                                    3,
                                                    0xC0,
                                                    0xA8,
                                                    0x00,
                                                    0x00,
                                                    0x0120,
                                                    0x0000 };
