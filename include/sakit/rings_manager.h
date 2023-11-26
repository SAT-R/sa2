#ifndef GUARD_RINGS_MANAGER_H
#define GUARD_RINGS_MANAGER_H

#include "global.h"
#include "constants/zones.h"

#define MP_COLLECT_RINGS_COMPRESSED_POS_DATA ((u8 **)(EWRAM_START + 0x33008))
#define MP_COLLECT_RINGS_COMPRESSED_SIZE     (u8 **)(EWRAM_START + 0x3300C)
#define MP_COLLECT_RINGS_BUFFER              (u8 *)(EWRAM_START + 0x3F000)

#define RESERVED_RING_TILES_VRAM        (void *)(OBJ_VRAM0 + 0x1F00)
#define RESERVED_RING_EFFECT_TILES_VRAM (void *)(OBJ_VRAM0 + 0x2100)

extern const u8 *const gSpritePosData_rings[NUM_LEVEL_IDS];

void CreateStageRingsManager(void);

#endif // GUARD_RINGS_MANAGER_H