#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_choose_pak_type_en[] = INCPAL("graphics/sa1/tilemaps/mp_choose_pak_type_en/palette.pal");
const u8 Tiles_mp_choose_pak_type_en[] = INCBIN_U8("graphics/sa1/tilemaps/mp_choose_pak_type_en/tiles.4bpp");
const u8 Tilemap_mp_choose_pak_type_en[] = INCBIN_U8("graphics/sa1/tilemaps/mp_choose_pak_type_en/tilemap.tilemap2");

const Tilemap mp_choose_pak_type_en = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_choose_pak_type_en,
    .tilesSize = sizeof(Tiles_mp_choose_pak_type_en),
    .palette = Palette_mp_choose_pak_type_en,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_choose_pak_type_en) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_choose_pak_type_en,
};
