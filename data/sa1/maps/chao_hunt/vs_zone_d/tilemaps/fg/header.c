#include "global.h"
#include "core.h"

const u16 Palette_zone_chao_hunt_act_vs_zone_d_fg[] = INCBIN_U16("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/palette.gbapal");
const u8 Tileset_zone_chao_hunt_act_vs_zone_d_fg[] = INCBIN_U8("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/tileset.4bpp");
const s8 CollHeightMap_zone_chao_hunt_act_vs_zone_d_fg[] = INCBIN_S8("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/height_map.coll");
const u8 CollTileRot_zone_chao_hunt_act_vs_zone_d_fg[] = INCBIN_U8("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/tile_rot.coll");
const u16 Metatiles_zone_chao_hunt_act_vs_zone_d_fg[] = INCBIN_U16("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/metatiles.tilemap2");

const MetatileIndexType Map_zone_chao_hunt_act_vs_zone_d_fg0[] = INCBIN_MAP("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/map_front.bin");

const MetatileIndexType Map_zone_chao_hunt_act_vs_zone_d_fg1[] = INCBIN_MAP("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/map_back.bin");

const u16 CollFlags_zone_chao_hunt_act_vs_zone_d_fg[] = INCBIN_U16("data/sa1/maps/chao_hunt/vs_zone_d/tilemaps/fg/flags.coll");
ALIGNED(4) const struct MapHeader zone_chao_hunt_act_vs_zone_d_fg0 = 
{
    .tileset = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0x00,
        .animFrameCount = 0,
        .animDelay = 60,
        .tiles = Tileset_zone_chao_hunt_act_vs_zone_d_fg,
        .tilesSize = sizeof(Tileset_zone_chao_hunt_act_vs_zone_d_fg) - (0 * 0x00),
        .palette = Palette_zone_chao_hunt_act_vs_zone_d_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_chao_hunt_act_vs_zone_d_fg) / sizeof(u16),
        .map = Metatiles_zone_chao_hunt_act_vs_zone_d_fg,
    },
    .metatileMap = Map_zone_chao_hunt_act_vs_zone_d_fg0,
    .mapWidth = 20,
    .mapHeight = 14,
};

ALIGNED(4) const struct MapHeader zone_chao_hunt_act_vs_zone_d_fg1 = 
{
    .tileset = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0x00,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_chao_hunt_act_vs_zone_d_fg,
        .tilesSize = sizeof(Tileset_zone_chao_hunt_act_vs_zone_d_fg) - (0 * 0x00),
        .palette = Palette_zone_chao_hunt_act_vs_zone_d_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_chao_hunt_act_vs_zone_d_fg) / sizeof(u16),
        .map = Metatiles_zone_chao_hunt_act_vs_zone_d_fg,
    },
    .metatileMap = Map_zone_chao_hunt_act_vs_zone_d_fg1,
    .mapWidth = 20,
    .mapHeight = 14,
};

const Collision CollHeader_zone_chao_hunt_act_vs_zone_d_fg
    = { CollHeightMap_zone_chao_hunt_act_vs_zone_d_fg,
        CollTileRot_zone_chao_hunt_act_vs_zone_d_fg,
        Metatiles_zone_chao_hunt_act_vs_zone_d_fg,
        { Map_zone_chao_hunt_act_vs_zone_d_fg0, Map_zone_chao_hunt_act_vs_zone_d_fg1 },
        CollFlags_zone_chao_hunt_act_vs_zone_d_fg,
        20,
        14,
        0x0780,
        0x0540 };
