#include "global.h"
#include "core.h"

extern const ColorRaw Palette_zone_chao_hunt_act_vs_zone_b_fg[];
const u8 Tiles_zone_chao_hunt_act_vs_zone_b_bg[] = INCBIN_U8("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/bg/tiles.4bpp");
const u8 Tilemap_zone_chao_hunt_act_vs_zone_b_bg[] = INCBIN_U8("data/sa1/maps/chao_hunt/vs_zone_b/tilemaps/bg/tilemap.tilemap2");

const Tilemap zone_chao_hunt_act_vs_zone_b_bg = {
    .xTiles = 32,
    .yTiles = 64,
    .animTileSize = 0x00,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_chao_hunt_act_vs_zone_b_bg,
    .tilesSize = sizeof(Tiles_zone_chao_hunt_act_vs_zone_b_bg) - (0 * 0x00),
    .palette = NULL,
    .palOffset = 0,
    .palLength = sizeof(Palette_zone_chao_hunt_act_vs_zone_b_fg) / sizeof(u16),
    .map = (const u16 *)Tilemap_zone_chao_hunt_act_vs_zone_b_bg,
};
