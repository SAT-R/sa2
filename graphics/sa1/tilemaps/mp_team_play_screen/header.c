#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_team_play_screen[] = INCPAL("graphics/sa1/tilemaps/mp_team_play_screen/palette.pal");
const u8 Tiles_mp_team_play_screen[] = INCBIN_U8("graphics/sa1/tilemaps/mp_team_play_screen/tiles.4bpp");
const u8 Tilemap_mp_team_play_screen[] = INCBIN_U8("graphics/sa1/tilemaps/mp_team_play_screen/tilemap.tilemap2");

const Tilemap mp_team_play_screen = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_team_play_screen,
    .tilesSize = sizeof(Tiles_mp_team_play_screen),
    .palette = Palette_mp_team_play_screen,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_team_play_screen) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_team_play_screen,
};
