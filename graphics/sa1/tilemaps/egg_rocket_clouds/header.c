#include "global.h"
#include "core.h"

const u16 Palette_egg_rocket_clouds[] = INCBIN_U16("graphics/sa1/tilemaps/egg_rocket_clouds/palette.gbapal");
const u8 Tiles_egg_rocket_clouds[] = INCBIN_U8("graphics/sa1/tilemaps/egg_rocket_clouds/tiles.4bpp");
const u8 Tilemap_egg_rocket_clouds[] = INCBIN_U8("graphics/sa1/tilemaps/egg_rocket_clouds/tilemap.tilemap2");

const Tilemap egg_rocket_clouds = {
    .xTiles = 32,
    .yTiles = 20,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_egg_rocket_clouds,
    .tilesSize = sizeof(Tiles_egg_rocket_clouds),
    .palette = Palette_egg_rocket_clouds,
    .palOffset = 0,
    .palLength = sizeof(Palette_egg_rocket_clouds) / sizeof(u16),
    .map = (const u16 *)Tilemap_egg_rocket_clouds,
};
