#include "global.h"
#include "core.h"

const u16 Palette_mp_multipak_player_overview[] = INCBIN_U16("graphics/sa1/tilemaps/mp_multipak_player_overview/palette.gbapal");
const u8 Tiles_mp_multipak_player_overview[] = INCBIN_U8("graphics/sa1/tilemaps/mp_multipak_player_overview/tiles.4bpp");
const u8 Tilemap_mp_multipak_player_overview[] = INCBIN_U8("graphics/sa1/tilemaps/mp_multipak_player_overview/tilemap.tilemap2");

const Tilemap mp_multipak_player_overview = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_multipak_player_overview,
    .tilesSize = sizeof(Tiles_mp_multipak_player_overview),
    .palette = Palette_mp_multipak_player_overview,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_multipak_player_overview) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_multipak_player_overview,
};
