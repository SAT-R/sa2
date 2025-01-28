#ifndef GUARD_RINGS_MANAGER_H
#define GUARD_RINGS_MANAGER_H

#include "global.h"
#include "rect.h"
#include "constants/zones.h"

#define MP_COLLECT_RINGS_COMPRESSED_POS_DATA ((u8 **)(EWRAM_START + 0x33008))
#define MP_COLLECT_RINGS_COMPRESSED_SIZE     (u8 **)(EWRAM_START + 0x3300C)
#define MP_COLLECT_RINGS_BUFFER              (u8 *)(EWRAM_START + 0x3F000)

#define RESERVED_RING_TILES_VRAM        (void *)(OBJ_VRAM0 + 0x1F00)
#define RESERVED_RING_EFFECT_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2100)

#define PLAYER_TOUCHING_RING(p, rect, ringIntX, ringIntY)                                                                                  \
    ((((ringIntX - TILE_WIDTH) <= RECT_LEFT(I(p->qWorldX), rect) && (ringIntX + TILE_WIDTH) >= RECT_LEFT(I(p->qWorldX), rect))             \
      || ((ringIntX - TILE_WIDTH) >= RECT_LEFT(I(p->qWorldX), rect) && RECT_RIGHT(I(p->qWorldX), rect) >= (ringIntX - TILE_WIDTH)))        \
     && ((((ringIntY - (TILE_WIDTH * 2)) <= RECT_TOP(I(p->qWorldY), rect) && ringIntY >= RECT_TOP(I(p->qWorldY), rect))                    \
          || ((ringIntY - (TILE_WIDTH * 2)) >= RECT_TOP(I(p->qWorldY), rect)                                                               \
              && RECT_BOTTOM(I(p->qWorldY), rect) >= (ringIntY - (TILE_WIDTH * 2))))))

#define MP_PLAYER_TOUCHING_RING(mp, rect, ringIntX, ringIntY)                                                                              \
    ((((ringIntX - TILE_WIDTH) <= RECT_LEFT(mp->pos.x, rect) && (ringIntX + TILE_WIDTH) >= RECT_LEFT(mp->pos.x, rect))                     \
      || ((ringIntX - TILE_WIDTH) >= RECT_LEFT(mp->pos.x, rect) && RECT_RIGHT(mp->pos.x, rect) >= (ringIntX - TILE_WIDTH)))                \
     && ((((ringIntY - (TILE_WIDTH * 2)) <= RECT_TOP(mp->pos.y, rect) && ringIntY >= RECT_TOP(mp->pos.y, rect))                            \
          || ((ringIntY - (TILE_WIDTH * 2)) >= RECT_TOP(mp->pos.y, rect)                                                                   \
              && RECT_BOTTOM(mp->pos.y, rect) >= (ringIntY - (TILE_WIDTH * 2))))))

extern const u8 *const gSpritePosData_rings[NUM_LEVEL_IDS];

void CreateStageRingsManager(void);

#endif // GUARD_RINGS_MANAGER_H