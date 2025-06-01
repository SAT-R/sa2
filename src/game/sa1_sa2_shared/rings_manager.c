#include <string.h>
#include "global.h"
#include "core.h"
#include "malloc_ewram.h"
#include "rect.h"

#include "game/sa1_sa2_shared/camera.h"
#include "game/sa1_sa2_shared/collect_ring_effect.h"
#include "game/sa1_sa2_shared/magnetic_ring.h"
#include "game/sa1_sa2_shared/rings_manager.h"

#include "game/entity.h"
#include "game/stage/player_super_sonic.h"

#include "game/multiplayer/mp_player.h"

#include "game/assets/compressed/entities.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
    void *rings;
} RingsManager;

void Task_RingsMgrMain(void);
void TaskDestructor_RingsMgr(struct Task *);

#define READ_START_INDEX(p, hrc, rx, ry) (*((u32 *)((((u8 *)(p)) + (((hrc) * (ry)) * (sizeof(u32)))) + ((rx) * (sizeof(u32))))))
#define DATA_START(data)                 (void *)((u8 *)(data) - (sizeof(u32) * 2))

#define TO_REGION(pos) ((pos) >> 8)

#define REGION_LOWER(posX, bound, offset)                                                                                                  \
    ({                                                                                                                                     \
        s32 a = (posX);                                                                                                                    \
        s32 b = (bound);                                                                                                                   \
        TO_REGION(a + b + offset);                                                                                                         \
    })

// Swapped for the region upper calc??
#define REGION_UPPER(posX, bound, offset)                                                                                                  \
    ({                                                                                                                                     \
        s32 a = (posX);                                                                                                                    \
        s32 b = (bound);                                                                                                                   \
        TO_REGION(b + a + offset);                                                                                                         \
    })

#ifndef COLLECT_RINGS_ROM
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
#endif

void CreateStageRingsManager(void)
{
    struct Task *t;
    RingsManager *mgr;
    void **mgrRings;
    Sprite *s;
    u32 *ewramBuffer;
    const u8 *compressedRingPosData;
    u32 dataSize;

#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        t = TaskCreate(Task_RingsMgrMain, sizeof(RingsManager), 0x2000, 0, TaskDestructor_RingsMgr);

        compressedRingPosData = gSpritePosData_rings[gCurrentLevel];
        dataSize = (*(u32 *)compressedRingPosData) >> 8;
        ewramBuffer = EwramMalloc(dataSize);

        RLUnCompWram(gSpritePosData_rings[gCurrentLevel], ewramBuffer);
    } else
#endif
    {
#if COLLECT_RINGS_ROM
#ifndef NON_MATCHING
        register u32 dataSize asm("r4");
#endif
#endif
        t = TaskCreate(Task_RingsMgrMain, sizeof(RingsManager), 0x2000, 0, NULL);

        compressedRingPosData = (u8 *)(*MP_COLLECT_RINGS_COMPRESSED_SIZE);
        dataSize = (*(u32 *)compressedRingPosData) >> 8;
        dataSize = (dataSize + 3) >> 2; // Make it multiple of 4
        dataSize <<= 4;
        ewramBuffer = (u32 *)(MP_COLLECT_RINGS_BUFFER + dataSize);
        RLUnCompWram(MP_COLLECT_RINGS_COMPRESSED_POS_DATA[0], ewramBuffer);
    }

    mgrRings = TASK_DATA(t) + offsetof(RingsManager, rings);
    *mgrRings = ewramBuffer;

    s = TASK_DATA(t);

    s->x = 0;
    s->y = 0;

    s->graphics.dest = RESERVED_RING_TILES_VRAM;
    s->oamFlags = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = (SPRITE_FLAG_MASK_18 | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
}

#ifndef COLLECT_RINGS_ROM

void Task_RingsMgrMain(void)
{
    bool32 sp08;

    u32 h_regionCount, v_regionCount;
    RingsManager *rm;
    u32 *rings;

    u16 regionX, regionY;
    Sprite *s;
    u8 drawCount = 0;

    s32 rx, ry;

    const SpriteOffset *dimensions;
    MapEntity_Ring *meRing;

    s8 rect[4] = { -gPlayer.spriteOffsetX, -gPlayer.spriteOffsetY, gPlayer.spriteOffsetX, gPlayer.spriteOffsetY };

    if (!(gStageFlags & STAGE_FLAG__2)) {
        Player *p;
        s16 leftIndex;

        rings = *(u32 **)(TASK_DATA(gCurTask) + offsetof(RingsManager, rings));

        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gBossRingsShallRespawn && gBossRingsRespawnCount > 0) {
                RLUnCompWram(gSpritePosData_rings[gCurrentLevel], rings);
                gBossRingsShallRespawn = FALSE;
                gBossRingsRespawnCount--;
            }
        }

        sp08 = FALSE;
        if (IS_EXTRA_STAGE(gCurrentLevel)) {
            u32 res = SuperSonicGetFlags() & (SUPER_FLAG__200 | SUPER_FLAG__10 | SUPER_FLAG__8 | SUPER_FLAG__4);
            sp08 = TRUE;

            if (res != 0) {
                sp08 = FALSE;
            }

            SuperSonicGetPos(&gPlayer.qWorldX, &gPlayer.qWorldY);
            rect[0] = -10;
            rect[1] = -10;
            rect[2] = +10;
            rect[3] = +10;
        }

        rings = *(u32 **)(TASK_DATA(gCurTask) + offsetof(RingsManager, rings));
        rm = TASK_DATA(gCurTask);
        s = &rm->s;
        UpdateSpriteAnimation(s);

        dimensions = s->dimensions;
        rings++;

        // required for match
        leftIndex = 0;

        h_regionCount = (u16)*rings++;
        v_regionCount = (u16)*rings++;

        p = &gPlayer;

        // Handle collisions
        for (regionY = REGION_LOWER(I(p->qWorldY), rect[1], 0);
             regionY <= REGION_UPPER(I(p->qWorldY), rect[3], TILE_WIDTH) && regionY < v_regionCount; regionY++) {

            for (regionX = REGION_LOWER(I(p->qWorldX), rect[leftIndex], -TILE_WIDTH);
                 regionX <= REGION_UPPER(I(p->qWorldX), rect[2], TILE_WIDTH * 2) && regionX < h_regionCount; regionX++) {

                u32 offset = READ_START_INDEX(rings, h_regionCount, regionX, regionY);
                if (offset) {
                    meRing = DATA_START(rings) + offset;

                    while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                        if (meRing->x != (u8)MAP_ENTITY_STATE_INITIALIZED) {
                            // _080080D6
                            rx = TO_WORLD_POS(meRing->x, regionX);
                            ry = TO_WORLD_POS(meRing->y, regionY);

                            if (sp08 != FALSE
                                || (gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53) && !(p->moveState & MOVESTATE_DEAD))) {
                                if (RECT_TOUCHING_RING(I(p->qWorldX), I(p->qWorldY), rx, ry, (Rect8 *)rect)) {
                                    INCREMENT_RINGS(1);

                                    if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && gRingCount > 255) {
                                        gRingCount = 255;
                                    }

                                    CreateCollectRingEffect(rx, ry);
                                    meRing->x = (u8)MAP_ENTITY_STATE_INITIALIZED;
                                }
                            }
                        }
                        meRing++;
                    }
                }
            }
        }

        // Handle other player collisions
        if (IS_MULTI_PLAYER) {
            u8 i;
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                s32 id = SIO_MULTI_CNT->id;
                if (i != id && gMultiplayerPlayerTasks[i] != NULL) {
                    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

                    for (regionY = REGION_LOWER(mpp->pos.y, mpp->s.hitboxes[0].top, 0);
                         regionY <= REGION_UPPER(mpp->pos.y, mpp->s.hitboxes[0].bottom, TILE_WIDTH) && regionY < v_regionCount; regionY++) {

                        for (regionX = REGION_LOWER(mpp->pos.x, mpp->s.hitboxes[0].left, -TILE_WIDTH);
                             regionX <= REGION_UPPER(mpp->pos.x, mpp->s.hitboxes[0].right, TILE_WIDTH * 2) && regionX < h_regionCount;
                             regionX++) {

                            u32 offset = READ_START_INDEX(rings, h_regionCount, regionX, regionY);
                            if (offset != 0) {
                                meRing = DATA_START(rings) + offset;
                                while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                                    if (meRing->x == (u8)MAP_ENTITY_STATE_INITIALIZED) {
                                        meRing++;
                                        continue;
                                    }

                                    rx = TO_WORLD_POS(meRing->x, regionX);
                                    ry = TO_WORLD_POS(meRing->y, regionY);
                                    if (RECT_TOUCHING_RING(mpp->pos.x, mpp->pos.y, rx, ry, &mpp->s.hitboxes[0])) {
                                        u8 pAnim = mpp->s.graphics.anim;
                                        u8 anims = gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]];
                                        u8 anim = pAnim - anims;
                                        if ((anim != SA2_CHAR_ANIM_HIT && anim != SA2_CHAR_ANIM_DEAD) || !(mpp->unk54 & 0x4)) {
                                            CreateCollectRingEffect(rx, ry);
                                            meRing->x = (u8)MAP_ENTITY_STATE_INITIALIZED;
                                        }
                                    }

                                    meRing++;
                                }
                            }
                        }
                    }
                }
            }
        }

        // Draw rings
        regionY = TO_REGION(gCamera.y);
        if (gPlayer.itemEffect & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC && gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
            for (; TO_WORLD_POS(0, regionY) < gCamera.y + DISPLAY_HEIGHT && regionY < v_regionCount; regionY++) {
#ifndef NON_MATCHING
                while (0)
                    ;
#endif
                for (regionX = TO_REGION(gCamera.x); TO_WORLD_POS(0, regionX) < gCamera.x + DISPLAY_WIDTH; regionX++) {
                    u32 offset = READ_START_INDEX(rings, h_regionCount, regionX, regionY);

                    if ((regionX >= h_regionCount)) {
                        break;
                    }

                    if (offset != 0) {
                        meRing = DATA_START(rings) + offset;
                        while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                            if (meRing->x == (u8)MAP_ENTITY_STATE_INITIALIZED) {
                                meRing++;
                                continue;
                            }

                            rx = TO_WORLD_POS(meRing->x, regionX);
#ifndef NON_MATCHING
                            // Required for stack fixes
                            ({ s32 *new_var = &ry; });
#endif
                            ry = TO_WORLD_POS(meRing->y, regionY);
                            if (rx - gCamera.x < -TILE_WIDTH || (rx - gCamera.x) + TILE_WIDTH > DISPLAY_WIDTH + 2 * TILE_WIDTH
                                || ry - gCamera.y < 0 || (ry - gCamera.y) - 2 * TILE_WIDTH > DISPLAY_HEIGHT) {
                                meRing++;
                                continue;
                            }

                            // Magnetic radius check
                            if (rx - 64 <= I(gPlayer.qWorldX) && rx + 64 >= I(gPlayer.qWorldX) && ry - 72 <= I(gPlayer.qWorldY)
                                && ry + 56 >= I(gPlayer.qWorldY)) {
                                CreateMagneticRing(rx, ry);
                                meRing->x = (u8)MAP_ENTITY_STATE_INITIALIZED;
                                meRing++;
                            } else {
                                meRing++;

                                if ((drawCount == 0) || s->oamBaseIndex == 0xFF) {
                                    s->oamBaseIndex = 0xFF;
                                    s->x = rx - gCamera.x;
                                    s->y = ry - gCamera.y;
                                    DisplaySprite(s);
                                } else {
                                    // _08008788
                                    OamData *oamDat = &gOamBuffer2[s->oamBaseIndex];
                                    OamData *oamAllocated = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                                    if (iwram_end == oamAllocated)
                                        return;

                                    DmaCopy16(3, oamDat, oamAllocated, sizeof(OamDataShort));

                                    // TODO: Can these be done more explicitly?
                                    oamAllocated->all.attr1 &= 0xFE00;
                                    oamAllocated->all.attr0 &= 0xFF00;
                                    oamAllocated->all.attr0 += ((ry - gCamera.y) - dimensions->offsetY) & 0xFF;
                                    oamAllocated->all.attr1 += ((rx - gCamera.x) - dimensions->offsetX) & 0x1FF;
                                }

                                drawCount++;
                            }
                        };
                    }
                }
            }
        } else {
            for (; TO_WORLD_POS(0, regionY) < gCamera.y + DISPLAY_HEIGHT && regionY < v_regionCount; regionY++) {
#ifndef NON_MATCHING
                while (0)
                    ;
#endif
                for (regionX = TO_REGION(gCamera.x); TO_WORLD_POS(0, regionX) < gCamera.x + DISPLAY_WIDTH && regionX < h_regionCount;
                     regionX++) {
                    u32 offset = READ_START_INDEX(rings, h_regionCount, regionX, regionY);

                    if (offset != 0) {
                        meRing = DATA_START(rings) + offset;
                        while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                            if (meRing->x == (u8)MAP_ENTITY_STATE_INITIALIZED) {
                                meRing++;
                                continue;
                            }

                            rx = TO_WORLD_POS(meRing->x, regionX);
                            ry = TO_WORLD_POS(meRing->y, regionY);

                            if (rx - gCamera.x < -TILE_WIDTH || (rx - gCamera.x) + TILE_WIDTH > DISPLAY_WIDTH + 2 * TILE_WIDTH
                                || ry - gCamera.y < 0 || (ry - gCamera.y) - 2 * TILE_WIDTH > DISPLAY_HEIGHT) {
                                meRing++;
                            } else {
                                meRing++;

                                if ((drawCount == 0) || s->oamBaseIndex == 0xFF) {
                                    s->oamBaseIndex = 0xFF;
                                    s->x = rx - gCamera.x;
                                    s->y = ry - gCamera.y;
                                    DisplaySprite(s);
                                } else {
                                    OamData *oamDat = &gOamBuffer2[s->oamBaseIndex];
                                    OamData *oamAllocated = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                                    if (iwram_end == oamAllocated)
                                        return;

                                    DmaCopy16(3, oamDat, oamAllocated, sizeof(OamDataShort));

                                    // TODO: Can these be done more explicitly?
                                    oamAllocated->all.attr1 &= 0xFE00;
                                    oamAllocated->all.attr0 &= 0xFF00;
                                    oamAllocated->all.attr0 += ((ry - gCamera.y) - dimensions->offsetY) & 0xFF;
                                    oamAllocated->all.attr1 += ((rx - gCamera.x) - dimensions->offsetX) & 0x1FF;
                                }

                                drawCount++;
                            }
                        }
                    }
                }
            }
        }
    }
}

void TaskDestructor_RingsMgr(struct Task *t)
{
    void *rings = *(void **)(TASK_DATA(t) + offsetof(RingsManager, rings));
    EwramFree(rings);
}
#endif
