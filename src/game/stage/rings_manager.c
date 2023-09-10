#include <string.h>
#include "global.h"
#include "game/player_super_sonic.h"
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

//NONMATCH("asm/non_matching/game/stage/Task_RingsMgrMain.inc",
//         void Task_RingsMgrMain(void))
void Task_RingsMgrMain(void)
{
    s32 sp1C = 0;
    s8 sp00[4];
    s8 sp04[4];
    s32 sp08;
    u32 regions_x; // sp0C;
    u32 regions_y; // sp10;

    s8 *pSp04 = sp04;
    *pSp04++ = -gPlayer.unk16;
    *pSp04++ = -gPlayer.unk17;
    *pSp04++ = +gPlayer.unk16;
    *pSp04 = +gPlayer.unk17;
    memcpy(sp00, sp04, sizeof(sp00));

    if (!(gUnknown_03005424 & EXTRA_STATE__2)) {
        // _08007F60
        RingsManager *rm = TaskGetStructPtr(gCurTask);
        void *rings = rm->rings; // sp14
        s32 *rings_header;
        Sprite *s; // sp18
        SpriteOffset *dimensions; // sp20
        u16 sl; // sl / sp40

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gBossRingsShallRespawn && gBossRingsRespawnCount > 0) {
                RLUnCompWram(gSpritePosData_rings[gCurrentLevel], rings);
                gBossRingsShallRespawn = FALSE;
                gBossRingsRespawnCount--;
            }
        }
        // _08007FBE
        sp08 = 0;
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            u32 res = sub_802C6E4() & 0x21C;
            sp08 = 1;

            if (res) {
                sp08 = 0;
            }

            // _08007FE4
            sub_802C668(&gPlayer.x, &gPlayer.y);
            sp00[0] = -10;
            sp00[1] = -10;
            sp00[2] = +10;
            sp00[3] = +10;
        }
        // _08007FFA

        rm = TaskGetStructPtr(gCurTask);
        rings = rm->rings;
        s = &rm->s;
        UpdateSpriteAnimation(s);

        dimensions = s->dimensions;

        rings_header = rings + 4;
        regions_x = (u16)*rings_header++;
        regions_y = (u16)*rings_header++;
        rings = rings_header;

        sl = (Q_24_8_TO_INT(gPlayer.y) + sp00[1]);
        while (((sl <= (((Q_24_8_TO_INT(gPlayer.y) + sp00[3]) + 8)) >> 8))
               && (sl++ < regions_y)) {
            // _08008064
            u16 sb = ((Q_24_8_TO_INT(gPlayer.x) - sp00[0] - 8) >> 8);

            s32 r0x = (sp00[2] + Q_24_8_TO_INT(gPlayer.x) + 16) >> 8;

            if (((signed)sb <= r0x) && sb < regions_x) {
                // _080080A0
            }
            // _08008208
        }
        // _0800822C

        if (IS_MULTI_PLAYER) {
            // _08008236
            u8 i; // sp30
            for (i = 0; i < 4; i++) { }
        }
        // _0800847E
        {
            sl = Q_24_8(gCamera.y) >> 16;

            if ((gPlayer.itemEffect != PLAYER_ITEM_EFFECT__NONE)
                && (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)) {
                // _080084A2
            }
            // _080086B4

            while (((sl << 8) < gCamera.y + DISPLAY_HEIGHT) && (sl < regions_y)) {
                u16 sb = ((gCamera.x << 8) >> 16);

                while (((sb << 8) < (gCamera.x + DISPLAY_WIDTH)) && (sb < regions_x)) {
                    // _080086E8

                    sb++;
                }
                // _0800882C
                sl++;
            }
            // return
        }
    }
}
//END_NONMATCH

void TaskDestructor_8007F1C(struct Task *t)
{
    void *rings = *(void **)(TaskGetStructPtr(t) + offsetof(RingsManager, rings));
    EwramFree(rings);
}