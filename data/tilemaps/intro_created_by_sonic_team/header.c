#include "global.h"
#include "core.h"

const ColorRaw Palette_intro_created_by_sonic_team[] = INCPAL("data/tilemaps/intro_created_by_sonic_team/palette.pal");
const u8 Tiles_intro_created_by_sonic_team[] = INCBIN_U8("data/tilemaps/intro_created_by_sonic_team/tiles.4bpp");
const u16 Tilemap_intro_created_by_sonic_team[] = INCBIN_U16("data/tilemaps/intro_created_by_sonic_team/tilemap.tilemap2");

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
    .palLength = ARRAY_COUNT(Palette_intro_created_by_sonic_team),
    .map = Tilemap_intro_created_by_sonic_team,
};
