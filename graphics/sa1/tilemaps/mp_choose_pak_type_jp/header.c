#include "global.h"
#include "core.h"

const ColorRaw Palette_mp_choose_pak_type_jp[] = INCPAL("graphics/sa1/tilemaps/mp_choose_pak_type_jp/palette.pal");
const u8 Tiles_mp_choose_pak_type_jp[] = INCBIN_U8("graphics/sa1/tilemaps/mp_choose_pak_type_jp/tiles.4bpp");
const u8 Tilemap_mp_choose_pak_type_jp[] = INCBIN_U8("graphics/sa1/tilemaps/mp_choose_pak_type_jp/tilemap.tilemap2");

const Tilemap mp_choose_pak_type_jp = {
    .xTiles = 30,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_mp_choose_pak_type_jp,
    .tilesSize = sizeof(Tiles_mp_choose_pak_type_jp),
    .palette = Palette_mp_choose_pak_type_jp,
    .palOffset = 0,
    .palLength = sizeof(Palette_mp_choose_pak_type_jp) / sizeof(u16),
    .map = (const u16 *)Tilemap_mp_choose_pak_type_jp,
};
