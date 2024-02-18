#include "global.h"
#include "core.h"

const u16 Palette_zone_final_act_unused_fg[]
    = INCBIN_U16("data/maps/zone_final/act_unused/tilemaps/fg/palette.gbapal");
const u8 Tileset_zone_final_act_unused_fg[] = { 0xFF, 0xFF, 0xFF, 0xFF };
const u8 CollHeightMap_zone_final_act_unused_fg[]
    = INCBIN_U8("data/maps/zone_final/act_unused/tilemaps/fg/height_map.coll");
const u8 CollTileRot_zone_final_act_unused_fg[]
    = INCBIN_U8("data/maps/zone_final/act_unused/tilemaps/fg/tile_rot.coll");
const u8 CollFlags_zone_final_act_unused_fg[]
    = INCBIN_U8("data/maps/zone_final/act_unused/tilemaps/fg/flags.coll");
const u16 Metatiles_zone_final_act_unused_fg[]
    = INCBIN_U16("data/maps/zone_final/act_unused/tilemaps/fg/metatiles.tilemap2");

const u16 Map_zone_final_act_unused_fg0[]
    = INCBIN_U16("data/maps/zone_final/act_unused/tilemaps/fg/map_front.bin");

const u16 Map_zone_final_act_unused_fg1[]
    = INCBIN_U16("data/maps/zone_final/act_unused/tilemaps/fg/map_back.bin");

// = 0x08933538
ALIGNED(4) const struct MapHeader MapHeader_zone_final_act_unused_fg0 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_final_act_unused_fg,  // -> 0x0892F740
        .tilesSize = 0x2200, // GAME: HARDCODED // should be: sizeof(Tileset_zone_final_act_unused_fg)
        .palette = Palette_zone_final_act_unused_fg,// -> 0x0892F540
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_final_act_unused_fg) / sizeof(u16), // 0x100
        .map = Metatiles_zone_final_act_unused_fg,  // -> 0x08930118
    },
    .metatileMap = Map_zone_final_act_unused_fg0,   // -> 0x08933178
    .mapWidth = 20,
    .mapHeight = 12,
};

// = 0x0893355C
ALIGNED(4) const struct MapHeader MapHeader_zone_final_act_unused_fg1 = 
{
    .h = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_final_act_unused_fg,  // -> 0x0892F740
        .tilesSize = 0x2200, // GAME: HARDCODED // should be: sizeof(Tileset_zone_final_act_unused_fg)
        .palette = Palette_zone_final_act_unused_fg,// -> 0x0892F540
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_final_act_unused_fg) / sizeof(u16), // 0x100
        .map = Metatiles_zone_final_act_unused_fg,  // -> 0x08930118
    },
    .metatileMap = Map_zone_final_act_unused_fg1,   // -> 0x08933358
    .mapWidth = 20,
    .mapHeight = 12,
};

const Collision CollHeader_zone_final_act_unused_fg
    = { CollHeightMap_zone_final_act_unused_fg, // -> 0x0892F744
        CollTileRot_zone_final_act_unused_fg, // -> 0x0892FFC4
        Metatiles_zone_final_act_unused_fg, // -> 0x08930118
        Map_zone_final_act_unused_fg0, // -> 0x08933178
        Map_zone_final_act_unused_fg1, // -> 0x08933358
        CollFlags_zone_final_act_unused_fg, // -> 0x089300D4
        20,
        12,
        0x0780,
        0x0480 };
