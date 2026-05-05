#include "global.h"
#include "core.h"

const ColorRaw Palette_zone_chao_hunt_act_vs_zone_b_fg[] = INCPAL("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/palette.pal");
const u8 Tileset_zone_chao_hunt_act_vs_zone_b_fg[] = INCBIN_U8("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/tileset.4bpp");
const s8 CollHeightMap_zone_chao_hunt_act_vs_zone_b_fg[] = INCBIN_S8("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/height_map.coll");
const u8 CollTileRot_zone_chao_hunt_act_vs_zone_b_fg[] = INCBIN_U8("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/tile_rot.coll");
const u16 Metatiles_zone_chao_hunt_act_vs_zone_b_fg[] = INCBIN_U16("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/metatiles.tilemap2");

const MetatileIndexType Map_zone_chao_hunt_act_vs_zone_b_fg0[] = INCBIN_MAP("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/map_front.bin");

const MetatileIndexType Map_zone_chao_hunt_act_vs_zone_b_fg1[] = INCBIN_MAP("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/map_back.bin");

const u16 CollFlags_zone_chao_hunt_act_vs_zone_b_fg[] = INCBIN_U16("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/fg/flags.coll");
ALIGNED(4) const struct MapHeader zone_chao_hunt_act_vs_zone_b_fg0 = 
{
    .tileset = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0x340,
        .animFrameCount = 8,
        .animDelay = 8,
        .tiles = Tileset_zone_chao_hunt_act_vs_zone_b_fg,
        .tilesSize = (u32)sizeof(Tileset_zone_chao_hunt_act_vs_zone_b_fg) - (8 * 0x340),
        .palette = Palette_zone_chao_hunt_act_vs_zone_b_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_chao_hunt_act_vs_zone_b_fg) / sizeof(u16),
        .map = Metatiles_zone_chao_hunt_act_vs_zone_b_fg,
    },
    .metatileMap = Map_zone_chao_hunt_act_vs_zone_b_fg0,
    .mapWidth = 20,
    .mapHeight = 12,
};

ALIGNED(4) const struct MapHeader zone_chao_hunt_act_vs_zone_b_fg1 = 
{
    .tileset = {
        .xTiles = 12,
        .yTiles = 12,
        .animTileSize = 0x00,
        .animFrameCount = 0,
        .animDelay = 0,
        .tiles = Tileset_zone_chao_hunt_act_vs_zone_b_fg,
        .tilesSize = (u32)sizeof(Tileset_zone_chao_hunt_act_vs_zone_b_fg) - (8 * 0x340),
        .palette = Palette_zone_chao_hunt_act_vs_zone_b_fg,
        .palOffset = 0,
        .palLength = sizeof(Palette_zone_chao_hunt_act_vs_zone_b_fg) / sizeof(u16),
        .map = Metatiles_zone_chao_hunt_act_vs_zone_b_fg,
    },
    .metatileMap = Map_zone_chao_hunt_act_vs_zone_b_fg1,
    .mapWidth = 20,
    .mapHeight = 12,
};

const Collision CollHeader_zone_chao_hunt_act_vs_zone_b_fg
    = { CollHeightMap_zone_chao_hunt_act_vs_zone_b_fg,
        CollTileRot_zone_chao_hunt_act_vs_zone_b_fg,
        Metatiles_zone_chao_hunt_act_vs_zone_b_fg,
        { Map_zone_chao_hunt_act_vs_zone_b_fg0, Map_zone_chao_hunt_act_vs_zone_b_fg1 },
        CollFlags_zone_chao_hunt_act_vs_zone_b_fg,
        20,
        12,
        0x0780,
        0x0480 };
