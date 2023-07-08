#include "global.h"
#include "core.h"

ALIGNED(4)
static const u16 Palette_intro_created_by_sonic_team[]
    = INCBIN_U16("data/tilemaps/intro_created_by_sonic_team/palette.gbapal");
ALIGNED(4)
static const u8 Tiles_intro_created_by_sonic_team[]
    = INCBIN_U8("data/tilemaps/intro_created_by_sonic_team/tiles.4bpp");
ALIGNED(4)
static const u16 Tilemap_intro_created_by_sonic_team[]
    = INCBIN_U16("data/tilemaps/intro_created_by_sonic_team/tilemap.tilemap2");

ALIGNED(4)
const Tilemap intro_created_by_sonic_team = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_intro_created_by_sonic_team,
    .tilesSize = sizeof(Tiles_intro_created_by_sonic_team),
    .palette = Palette_intro_created_by_sonic_team,
    .palOffset = 0,
    .palLength = sizeof(Palette_intro_created_by_sonic_team) / sizeof(u16),
    .map = Tilemap_intro_created_by_sonic_team,
};
