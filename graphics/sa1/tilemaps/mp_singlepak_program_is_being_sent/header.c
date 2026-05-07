#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_singlepak_program_is_being_sent[]
    = INCPAL("graphics/sa1/tilemaps/mp_singlepak_program_is_being_sent/palette.pal");
const u8 Tiles_mp_singlepak_program_is_being_sent[] = INCBIN_U8("graphics/sa1/tilemaps/mp_singlepak_program_is_being_sent/tiles.4bpp");
const u8 Tilemap_mp_singlepak_program_is_being_sent[]
    = INCBIN_U8("graphics/sa1/tilemaps/mp_singlepak_program_is_being_sent/tilemap.tilemap2");

const Tilemap mp_singlepak_program_is_being_sent = {
    .xTiles = 30,
    .yTiles = 27,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_singlepak_program_is_being_sent,
    .tilesSize = sizeof(Tiles_mp_singlepak_program_is_being_sent),
    .palette = Palette_mp_singlepak_program_is_being_sent,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_singlepak_program_is_being_sent) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_singlepak_program_is_being_sent,
};
