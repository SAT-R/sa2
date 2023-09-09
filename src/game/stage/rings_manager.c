#include "global.h"
#include "malloc_ewram.h"
#include "game/game.h"
#include "game/stage/rings_manager.h"
#include "game/assets/compressed/entities.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    void *rings;
} RingsManager;

void Task_RingsMgrMain(void);
void TaskDestructor_8007F1C(struct Task *);

const u8 *const gSpritePosData_rings[NUM_LEVEL_IDS] = {
    zone1_act1_rings,
    zone1_act2_rings,
    zone1_boss_rings,
    zone1_act2_rings,
    zone2_act1_rings,
    zone2_act2_rings,
    zone2_boss_rings,
    zone2_act2_rings,
    zone3_act1_rings,
    zone3_act2_rings,
    zone3_boss_rings,
    zone3_act2_rings,
    zone4_act1_rings,
    zone4_act2_rings,
    zone4_boss_rings,
    zone4_act2_rings,
    zone5_act1_rings,
    zone5_act2_rings,
    zone5_boss_rings,
    zone5_act2_rings,
    zone6_act1_rings,
    zone6_act2_rings,
    zone6_boss_rings,
    zone6_act2_rings,
    zone7_act1_rings,
    zone7_act2_rings,
    zone7_boss_rings,
    zone7_act2_rings,
    zone8_act1_rings,
    zone8_act2_rings,
    zone8_boss_rings,
    NULL,
    NULL,
    NULL,
};

void CreateStageRingsManager(void)
{
    struct Task *t;
    RingsManager *mgr;
    void **mgrRings;
    Sprite *s;
    u32 *ewramBuffer;
    const u8 *compressedRingPosData;
    u32 dataSize;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(Task_RingsMgrMain, sizeof(RingsManager), 0x2000, 0,
                       TaskDestructor_8007F1C);

        compressedRingPosData = gSpritePosData_rings[gCurrentLevel];
        dataSize = (*(u32 *)compressedRingPosData) >> 8;
        ewramBuffer = EwramMalloc(dataSize);

        RLUnCompWram(gSpritePosData_rings[gCurrentLevel], ewramBuffer);
    } else {
        t = TaskCreate(Task_RingsMgrMain, sizeof(RingsManager), 0x2000, 0, NULL);

        compressedRingPosData = (u8 *)(*MP_COLLECT_RINGS_COMPRESSED_SIZE);
        dataSize = (*(u32 *)compressedRingPosData) >> 8;
        dataSize = (dataSize + 3) >> 2; // Make it multiple of 4
        dataSize <<= 4;
        ewramBuffer = (u32 *)(MP_COLLECT_RINGS_BUFFER + dataSize);
        RLUnCompWram(MP_COLLECT_RINGS_COMPRESSED_POS_DATA[0], ewramBuffer);
    }

    mgrRings = TaskGetStructPtr(t) + offsetof(RingsManager, rings);
    *mgrRings = ewramBuffer;

    s = TaskGetStructPtr(t);

    s->x = 0;
    s->y = 0;

    s->graphics.dest = RESERVED_RING_TILES_VRAM;
    s->unk1A = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING_STATIC;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10
        = (SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
}

NONMATCH("asm/non_matching/game/stage/Task_RingsMgrMain.inc", void Task_RingsMgrMain(void)) { }
END_NONMATCH

void TaskDestructor_8007F1C(struct Task *t)
{
    void *rings = *(void **)(TaskGetStructPtr(t) + offsetof(RingsManager, rings));
    EwramFree(rings);
}