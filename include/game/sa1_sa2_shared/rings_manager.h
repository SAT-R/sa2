#ifndef GUARD_RINGS_MANAGER_H
#define GUARD_RINGS_MANAGER_H

#include "global.h"
#include "rect.h"
#include "constants/zones.h"

#define MP_COLLECT_RINGS_COMPRESSED_POS_DATA ((u8 **)(EWRAM_START + 0x33008))
#define MP_COLLECT_RINGS_COMPRESSED_SIZE     (u8 **)(EWRAM_START + 0x3300C)
#define MP_COLLECT_RINGS_BUFFER              (u8 *)(EWRAM_START + 0x3F000)

#ifndef COLLECT_RINGS_ROM
#define RESERVED_RING_TILES_VRAM (void *)(OBJ_VRAM0 + 0x1F00)
#else
#define RESERVED_RING_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2E40)
#endif

#define RESERVED_RING_EFFECT_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2100)

#define RECT_TOUCHING_RING(posX, posY, ringIntX, ringIntY, rect)                                                                           \
    ((((ringIntX - TILE_WIDTH) <= RECT_LEFT((posX), rect) && (ringIntX + TILE_WIDTH) >= RECT_LEFT((posX), rect))                           \
      || ((ringIntX - TILE_WIDTH) >= RECT_LEFT((posX), rect) && RECT_RIGHT((posX), rect) >= (ringIntX - TILE_WIDTH)))                      \
     && ((((ringIntY - (TILE_WIDTH * 2)) <= RECT_TOP((posY), rect) && ringIntY >= RECT_TOP((posY), rect))                                  \
          || ((ringIntY - (TILE_WIDTH * 2)) >= RECT_TOP((posY), rect) && RECT_BOTTOM((posY), rect) >= (ringIntY - (TILE_WIDTH * 2))))))

#define HB_TOUCHING_RING(posX, posY, ringIntX, ringIntY, hb)                                                                               \
    ((((ringIntX - TILE_WIDTH) <= HB_LEFT((posX), hb) && (ringIntX + TILE_WIDTH) >= HB_LEFT((posX), hb))                                   \
      || ((ringIntX - TILE_WIDTH) >= HB_LEFT((posX), hb) && HB_RIGHT((posX), hb) >= (ringIntX - TILE_WIDTH)))                              \
     && ((((ringIntY - (TILE_WIDTH * 2)) <= HB_TOP((posY), hb) && ringIntY >= HB_TOP((posY), hb))                                          \
          || ((ringIntY - (TILE_WIDTH * 2)) >= HB_TOP((posY), hb) && HB_BOTTOM((posY), hb) >= (ringIntY - (TILE_WIDTH * 2))))))

extern const u8 *const gSpritePosData_rings[NUM_LEVEL_IDS];

void CreateStageRingsManager(void);

#endif // GUARD_RINGS_MANAGER_H