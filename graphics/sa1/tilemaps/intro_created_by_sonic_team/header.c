#include "global.h"
#include "core.h"

const u16 Palette_intro_created_by_sonic_team[] = INCBIN_U16("graphics/sa1/tilemaps/intro_created_by_sonic_team/palette.gbapal");
const u8 Tiles_intro_created_by_sonic_team[] = INCBIN_U8("graphics/sa1/tilemaps/intro_created_by_sonic_team/tiles.4bpp");
const u8 Tilemap_intro_created_by_sonic_team[] = INCBIN_U8("graphics/sa1/tilemaps/intro_created_by_sonic_team/tilemap.tilemap2");

const Tilemap intro_created_by_sonic_team = {
    .xTiles = 20,
    .yTiles = 10,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_intro_created_by_sonic_team,
    .tilesSize = sizeof(Tiles_intro_created_by_sonic_team),
    .palette = Palette_intro_created_by_sonic_team,
    .palOffset = 0,
    .palLength = sizeof(Palette_intro_created_by_sonic_team) / sizeof(u16),
    .map = (const u16 *)Tilemap_intro_created_by_sonic_team,
};
