#ifndef GUARD_TILEMAP_H
#define GUARD_TILEMAP_H

#define TILE_MASK_INDEX   0x03FF
#define TILE_MASK_X_FLIP  0x0400
#define TILE_MASK_Y_FLIP  0x0800
#define TILE_MASK_PALETTE 0xF000

// TODO: This should be the type of Collision::metatiles, if that matches anywhere...
typedef struct {
    u16 index : 10;
    u16 xFlip : 1;
    u16 yFlip : 1;
    u16 pal : 4;
} Tile;

typedef struct {
    /* 0x00 */ u16 xTiles;
    /* 0x02 */ u16 yTiles;
    /* 0x04 */ u16 animTileSize;
    /* 0x06 */ u8 animFrameCount;
    /* 0x07 */ u8 animDelay;
    /* 0x08 */ const u8 *tiles;
    /* 0x0C */ u32 tilesSize;
    /* 0x10 */ const u16 *palette;
    /* 0x14 */ u16 palOffset;
    /* 0x16 */ u16 palLength;

    // Can be u8* in some instances
    // map = metatiles, when using with non-background map layers
    /* 0x18 */ const u16 *map;
} Tilemap; /* size = 0x1C */

struct MapHeader {
    /* 0x00 */ Tilemap tileset;
    /* 0x1C */ const u16 *metatileMap;
    /* 0x20 */ u16 mapWidth; // in Metatiles
    /* 0x22 */ u16 mapHeight; // in Metatiles
};

#endif // GUARD_TILEMAP_H
