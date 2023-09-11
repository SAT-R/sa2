#include <string.h>
#include "global.h"
#include "malloc_ewram.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/player_super_sonic.h"
#include "game/stage/rings_manager.h"
#include "game/stage/collect_ring_effect.h"
#include "game/assets/compressed/entities.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    void *rings;
} RingsManager;

void Task_RingsMgrMain(void);
void TaskDestructor_8007F1C(struct Task *);

#define RM_PLAYER_LEFT   (Q_24_8_TO_INT(gPlayer.x) + sp00[0])
#define RM_PLAYER_RIGHT  (RM_PLAYER_LEFT + (sp00[2] - sp00[0]))
#define RM_PLAYER_TOP    (Q_24_8_TO_INT(gPlayer.y) + sp00[1])
#define RM_PLAYER_BOTTOM (RM_PLAYER_TOP + (sp00[3] - sp00[1]))

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

// NONMATCH("asm/non_matching/game/stage/Task_RingsMgrMain.inc",
//          void Task_RingsMgrMain(void))
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
        u16 sb;

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gBossRingsShallRespawn && gBossRingsRespawnCount > 0) {
                RLUnCompWram(gSpritePosData_rings[gCurrentLevel], rings);
                gBossRingsShallRespawn = FALSE;
                gBossRingsRespawnCount--;
            }
        }
        // _08007FBE
        sp08 = FALSE;
        if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
            u32 res = sub_802C6E4() & 0x21C;
            sp08 = TRUE;

            if (res) {
                sp08 = FALSE;
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
            s32 r0x;
            sb = ((Q_24_8_TO_INT(gPlayer.x) - sp00[0] - 8) >> 8);

            r0x = (sp00[2] + Q_24_8_TO_INT(gPlayer.x) + 16) >> 8;

            while (((signed)sb <= r0x) && sb < regions_x) {
                // _080080A0
                u32 *ring_offsets = &((u32 *)rings)[regions_x * sl];
                u32 offset;
                ring_offsets += sb;

                offset = *ring_offsets;
                if (offset) {
                    MapEntity_Ring *meRing;
                    offset -= 8;

                    meRing = (MapEntity_Ring *)&((u8 *)rings)[offset];

                    while ((meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END)
                           && (meRing->x != (u8)MAP_ENTITY_STATE_INITIALIZED)) {
                        // _080080D6
                        s32 r8 = TO_WORLD_POS(meRing->x, sb);
                        s32 r7 = TO_WORLD_POS(meRing->y, sl);

                        if ((sp08 != FALSE)
                            || (gCurrentLevel
                                    != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)
                                && PLAYER_IS_ALIVE)) {
                            // _0800810A

                            // Player touches ring(?)
                            if ((((r8 - 8) > RM_PLAYER_LEFT) && (RM_PLAYER_RIGHT < (r8 - 8)))
                                || ((r8 + 8) >= RM_PLAYER_LEFT)
                                || (((r8 - 8) >= RM_PLAYER_LEFT) && (RM_PLAYER_RIGHT < (r8 - 8)))) {
                                // _0800813A
                                if ((((r7 - 16) > RM_PLAYER_TOP)
                                     && (RM_PLAYER_BOTTOM >= (r7 - 16)))
                                    || (r7 >= RM_PLAYER_TOP)
                                    || ((((r7 - 16) > RM_PLAYER_TOP)
                                         && ((RM_PLAYER_BOTTOM >= (r7 - 16)))))) {
                                    // _08008166
                                    s16 prevRingCount = gRingCount++;

                                    if (gCurrentLevel
                                        != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)) {
                                        s32 lives = Div(gRingCount, 100);
                                        s32 prevLives = Div(prevRingCount, 100);

                                        if ((lives != prevLives)
                                            && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                                            if (--gNumLives > 0xFF)
                                                gNumLives = 0xFF;

                                            gUnknown_030054A8.unk3 = 0x10;
                                        }
                                    }
                                    // _080081AC

                                    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                                        if (gRingCount > 0xFF)
                                            gRingCount = 0xFF;
                                    }
                                    // _080081C0
                                    CreateCollectRingEffect(r8, r7);
                                    SET_MAP_ENTITY_INITIALIZED(meRing);
                                }
                            }
                        }
                        // _080081D2
                        meRing++;
                    }
                    // _080081E4
                    if (sb > ((Q_24_8_TO_INT(gPlayer.x) + sp00[2] + 16) >> 8))
                        break;

                    if (sb >= regions_x)
                        break;
                }
                sb++;
            }
            sl++;
            // _08008208 = continue
            if (sl > ((Q_24_8_TO_INT(gPlayer.y) + sp00[3] + 8) >> 8))
                break;

            if (sl > regions_y)
                break;
        }
        // _0800822C

        if (IS_MULTI_PLAYER) {
            // _08008236
            u8 i; // sp30
            for (i = 0; i < 4; i++) {
                u32 playerId = SIO_MULTI_CNT->id;

                if ((i == playerId) && (gMultiplayerPlayerTasks[i] != NULL)) {
                    // _08008258
                    struct MultiplayerPlayer *mpPlayer = TaskGetStructPtr(gMultiplayerPlayerTasks[i]);
                    s16 px, py = mpPlayer->unk52;
                    s32 hbBottom, hbLeft, hbRight;
                    sl = Q_24_8(py + s->hitboxes[0].top);
                    hbBottom = Q_24_8(py + s->hitboxes[0].bottom);

                    if((sl > ((hbBottom + 8) >> 8)) || ((unsigned)sl >= regions_y))
                        continue;

                    // _080082E2
                    // sp28 = mpPlayer->unk50;
                    // sp2C = mpPlayer->s.hitboxes[0].left;
                    // sp48 = mpPlayer->s.hitboxes[0].right;
                    px = mpPlayer->unk50;
                    sb = Q_24_8(px + mpPlayer->s.hitboxes[0].left - 8);

                    hbRight = Q_24_8((px + mpPlayer->s.hitboxes[0].right) + 16);
                }
                // _08008472 = continue
            }
        }
        // _0800847E
        {
            sl = Q_24_8(gCamera.y) >> 16;

            if ((gPlayer.itemEffect != PLAYER_ITEM_EFFECT__NONE)
                && (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS)) {
                // _080084A2
                while(((sl << 8) >= (gCamera.y + DISPLAY_HEIGHT)) && ((unsigned)(sl << 8) >= regions_y)) {

                }
            } else {
                // _080086B4

                sl = Q_24_8(gCamera.y) >> 16;
                while (((sl << 8) < gCamera.y + DISPLAY_HEIGHT) && (sl < regions_y)) {
                    // _080086CC
                    sb = Q_24_8(gCamera.x << 8) >> 16);

                    while (((sb << 8) < (gCamera.x + DISPLAY_WIDTH)) && (sb < regions_x)) {
                        // _080086E8

                        sb++;
                    }
                    // _0800882C
                    sl++;
                }
            }
        }
    }
}
// END_NONMATCH

void TaskDestructor_8007F1C(struct Task *t)
{
    void *rings = *(void **)(TaskGetStructPtr(t) + offsetof(RingsManager, rings));
    EwramFree(rings);
}