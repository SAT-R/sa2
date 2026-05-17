#include <string.h>
#include "global.h"
#include "core.h"
#include "malloc_ewram.h"
#include "rect.h"

#include "game/shared/stage/camera.h"
#include "game/shared/stage/collect_ring_effect.h"
#include "game/shared/stage/magnetic_ring.h"
#include "game/shared/stage/rings_manager.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/entity.h"

#if (GAME == GAME_SA1)
#include "game/sa1/assets/compressed/entities.h"

#include "constants/sa1/animations.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/player_super_sonic.h"
#include "game/sa2/assets/compressed/entities.h"

#include "constants/sa2/animations.h"
#endif

typedef struct {
    Sprite s;
    void *rings;
} RingsManager;

void Task_RingsMgrMain(void);
void TaskDestructor_RingsMgr(Task *);

#if COLLECT_RINGS_ROM
#define RECT_TOUCHING_RING_NON_MATCH(t, posX, posY, ringIntX, ringIntY, rect)                                                              \
    ((((ringIntX - TILE_WIDTH) <= RECT_LEFT((posX), rect) && (ringIntX + TILE_WIDTH) >= RECT_LEFT((posX), rect))                           \
      || ((ringIntX - TILE_WIDTH) >= RECT_LEFT((posX), rect) && RECT_RIGHT((posX), rect) >= (ringIntX - TILE_WIDTH)))                      \
     && ((((ringIntY - (TILE_WIDTH * 2)) <= ((t) = RECT_TOP((posY), rect)) && ringIntY >= (t))                                             \
          || ((ringIntY - (TILE_WIDTH * 2)) >= (t) && ((t) + RECT_HEIGHT(rect)) >= (ringIntY - (TILE_WIDTH * 2))))))

#endif

#define READ_START_INDEX(p, hrc, rx, ry) (*((u32 *)((((u8 *)(p)) + (((hrc) * (ry)) * (sizeof(u32)))) + ((rx) * (sizeof(u32))))))
#define DATA_START(data)                 (void *)((u8 *)(data) - (sizeof(u32) * 2))

#define TO_REGION(pos) ((pos) >> 8)

#define REGION_LOWER(posX, bound, offset)                                                                                                  \
    ({                                                                                                                                     \
        s32 a = (posX);                                                                                                                    \
        s32 b = (bound);                                                                                                                   \
        TO_REGION(a + b + offset);                                                                                                         \
    })

#if (GAME == GAME_SA1)
// NOT SWAPPED IN SA1 :o
#define REGION_UPPER(posX, bound, offset) REGION_LOWER(posX, bound, offset)
#else
// Swapped for the region upper calc??
#define REGION_UPPER(posX, bound, offset)                                                                                                  \
    ({                                                                                                                                     \
        s32 a = (posX);                                                                                                                    \
        s32 b = (bound);                                                                                                                   \
        TO_REGION(b + a + offset);                                                                                                         \
    })
#endif

#define REGION_OFFSET_TOP  0
#define REGION_OFFSET_LEFT (-TILE_WIDTH)
#if (GAME == GAME_SA1)
#define REGION_OFFSET_BOTTOM (-TILE_WIDTH * 2)
#define REGION_OFFSET_RIGHT  (-TILE_WIDTH)
#elif (GAME == GAME_SA2)
#define REGION_OFFSET_BOTTOM (TILE_WIDTH)
#define REGION_OFFSET_RIGHT  (TILE_WIDTH * 2)
#endif

#if (GAME == GAME_SA1)
#define CHAR_ANIM_HIT_OR_DEAD(anim) ((anim) == SA1_CHAR_ANIM_HIT || (anim) == SA1_CHAR_ANIM_DEAD)
#elif (GAME == GAME_SA2)
#define CHAR_ANIM_HIT_OR_DEAD(anim) ((anim) == SA2_CHAR_ANIM_HIT || (anim) == SA2_CHAR_ANIM_DEAD)
#endif

#if (GAME == GAME_SA1)
extern const u8 *const gSpritePosData_rings[];
#elif (GAME == GAME_SA2)
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
#endif

void CreateStageRingsManager(void)
{
    Task *t;
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
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_RING;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_RING;
#elif (GAME == GAME_SA3)
    s->graphics.anim = SA3_ANIM_RING;
#endif
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2)
#if (GAME == GAME_SA2)
        | SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_MOSAIC
#endif
        ;
}

// Links since there are lots of fake matches here
// SA1: https://decomp.me/scratch/vWBeh
// SA2: https://decomp.me/scratch/wY4hY
// SA2 Collect rings: https://decomp.me/scratch/1ad61
void Task_RingsMgrMain(void)
{
    bool32 sp08;
    RingsManager *rm;
#ifndef COLLECT_RINGS_ROM
    u16 regionX, regionY;
    u32 h_regionCount, v_regionCount;
#else
    // TODO: this is unlikely to be swapped but trying to find a match with it the right way
    u32 h_regionCount, v_regionCount;
    u16 regionX, regionY;
#endif
    u32 *rings;
    Sprite *s;
    u8 drawCount = 0;

    CamCoord rx, ry;

    const SpriteOffset *dimensions;
    MapEntity_Ring *meRing;

    s8 rect[4] = { -gPlayer.spriteOffsetX, -gPlayer.spriteOffsetY, gPlayer.spriteOffsetX, gPlayer.spriteOffsetY };

#if (GAME == GAME_SA1)
    s32 r4 = 0;
#endif

    if (!(gStageFlags & STAGE_FLAG__2)) {
        Player *p;
#if (defined(NON_MATCHING) || COLLECT_RINGS_ROM) || (GAME != GAME_SA2)
        const // Only needs to be a real var in SA2 matching
#endif
            // required for match
            s16 leftIndex
            = 0;
        rings = *(u32 **)(TASK_DATA(gCurTask) + offsetof(RingsManager, rings));

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
        if (IS_BOSS_STAGE(gCurrentLevel)) {
            if (gBossRingsShallRespawn && gBossRingsRespawnCount > 0) {
                RLUnCompWram(gSpritePosData_rings[gCurrentLevel], rings);
                gBossRingsShallRespawn = FALSE;
                gBossRingsRespawnCount--;
            }
        }
#endif

        sp08 = FALSE;
#ifndef COLLECT_RINGS_ROM
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
#endif
#endif

        rings = *(u32 **)(TASK_DATA(gCurTask) + offsetof(RingsManager, rings));
        rm = TASK_DATA(gCurTask);
        s = &rm->s;
        UpdateSpriteAnimation(s);

        dimensions = s->dimensions;
        rings++;

        h_regionCount = (u16)*rings++;
        v_regionCount = (u16)*rings++;

#if (GAME == GAME_SA1)
        do
#endif
        {
            p = &PLAYER(r4);

            // Handle collisions
            for (regionY = REGION_LOWER(I(p->qWorldY), rect[1], REGION_OFFSET_TOP);
                 regionY <= REGION_UPPER(I(p->qWorldY), rect[3], REGION_OFFSET_BOTTOM) && regionY < v_regionCount; regionY++) {

                for (regionX = REGION_LOWER(I(p->qWorldX), rect[leftIndex], REGION_OFFSET_LEFT);
                     regionX <= REGION_UPPER(I(p->qWorldX), rect[2], REGION_OFFSET_RIGHT) && regionX < h_regionCount; regionX++) {

                    u32 offset = READ_START_INDEX(rings, h_regionCount, regionX, regionY);
                    if (offset) {
                        meRing = DATA_START(rings) + offset;

                        while (meRing->x != (u8)MAP_ENTITY_STATE_ARRAY_END) {
                            bool32 shouldSpawn = meRing->x != (u8)MAP_ENTITY_STATE_INITIALIZED;
                            if (shouldSpawn) {
                                // _080080D6
                                rx = TO_WORLD_POS(meRing->x, regionX);
                                ry = TO_WORLD_POS(meRing->y, regionY);

#if (GAME == GAME_SA1)
                                if ((IS_ALIVE(p) && (p->charState != 15 || p->timerInvulnerability == 0)))
#elif (GAME == GAME_SA2)
                                if (sp08 != FALSE || (!IS_EXTRA_STAGE(gCurrentLevel) && IS_ALIVE(p)))
#endif
                                {
#if COLLECT_RINGS_ROM && !defined(NON_MATCHING)
                                    s32 top;
                                    if (RECT_TOUCHING_RING_NON_MATCH(top, I(p->qWorldX), I(p->qWorldY), rx, ry, (Rect8 *)rect))
#else
                                    if (RECT_TOUCHING_RING(I(p->qWorldX), I(p->qWorldY), rx, ry, (Rect8 *)rect))
#endif
                                    {
#ifndef COLLECT_RINGS_ROM
                                        INCREMENT_RINGS(1);
#else
                                        {
                                            s32 prevLives, newLives;
                                            s32 oldRings = gRingCount;
                                            gRingCount += 1;
                                            if (!(IS_EXTRA_STAGE(gCurrentLevel))) {
                                                newLives = Div(gRingCount, 100);
                                                prevLives = Div(oldRings, 100);
                                                if ((newLives != prevLives) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                                                    if (gNumLives < 255) {
                                                        gNumLives++;
                                                    };
                                                }
                                            }
                                        }
#endif

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
        }
#if (GAME == GAME_SA1)
        while (++r4 < gNumSingleplayerCharacters);
#endif

        // Handle other player collisions
        if (IS_MULTI_PLAYER) {
            u8 i;
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                s32 id = SIO_MULTI_CNT->id;
                if (i != id && gMultiplayerPlayerTasks[i] != NULL) {
                    MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[i]);

                    for (regionY = REGION_LOWER(mpp->pos.y, mpp->s.hitboxes[0].b.top, REGION_OFFSET_TOP);
                         regionY <= REGION_UPPER(mpp->pos.y, mpp->s.hitboxes[0].b.bottom, REGION_OFFSET_BOTTOM) && regionY < v_regionCount;
                         regionY++) {

                        for (regionX = REGION_LOWER(mpp->pos.x, mpp->s.hitboxes[0].b.left, REGION_OFFSET_LEFT);
                             regionX <= REGION_UPPER(mpp->pos.x, mpp->s.hitboxes[0].b.right, REGION_OFFSET_RIGHT)
                             && regionX < h_regionCount;
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
                                    if (RECT_TOUCHING_RING(mpp->pos.x, mpp->pos.y, rx, ry, &mpp->s.hitboxes[0].b)) {
                                        u8 pAnim = mpp->s.graphics.anim;
                                        u8 anims = gPlayerCharacterIdleAnims[gMultiplayerCharacters[mpp->unk56]];
                                        u8 anim = pAnim - anims;
                                        if (!CHAR_ANIM_HIT_OR_DEAD(anim) || !(mpp->unk54 & 0x4)) {
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
#ifndef COLLECT_RINGS_ROM
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
#if (GAME == GAME_SA2) && !defined(NON_MATCHING)
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
                                    OamData *oamDat = &gOamMallocBuffer[s->oamBaseIndex];
                                    OamData *oamAllocated = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                                    if (iwram_end == oamAllocated)
                                        return;

                                    DmaCopy16(3, oamDat, oamAllocated, sizeof(OamDataShort));

#if !EXTENDED_OAM
                                    // TODO: Can these be done more explicitly?
                                    oamAllocated->all.attr1 &= 0xFE00;
                                    oamAllocated->all.attr0 &= 0xFF00;
                                    oamAllocated->all.attr0 += ((ry - gCamera.y) - dimensions->offsetY) & 0xFF;
                                    oamAllocated->all.attr1 += ((rx - gCamera.x) - dimensions->offsetX) & 0x1FF;
#else
                                    oamAllocated->split.x = ((rx - gCamera.x) - dimensions->offsetX);
                                    oamAllocated->split.y = ((ry - gCamera.y) - dimensions->offsetY);
#endif
                                }

                                drawCount++;
                            }
                        };
                    }
                }
            }
        } else
#endif
        {
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
                                    OamData *oamDat = &gOamMallocBuffer[s->oamBaseIndex];
                                    OamData *oamAllocated = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                                    if (iwram_end == oamAllocated)
                                        return;
#ifndef NON_MATCHING
                                    meRing->x += 0;
#endif
                                    DmaCopy16(3, oamDat, oamAllocated, sizeof(OamDataShort));

#if !EXTENDED_OAM
                                    // TODO: Can these be done more explicitly?
                                    oamAllocated->all.attr1 &= 0xFE00;
                                    oamAllocated->all.attr0 &= 0xFF00;
                                    oamAllocated->all.attr0 += ((ry - gCamera.y) - dimensions->offsetY) & 0xFF;
                                    oamAllocated->all.attr1 += ((rx - gCamera.x) - dimensions->offsetX) & 0x1FF;
#else
                                    oamAllocated->split.x = ((rx - gCamera.x) - dimensions->offsetX);
                                    oamAllocated->split.y = ((ry - gCamera.y) - dimensions->offsetY);
#endif
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

#ifndef COLLECT_RINGS_ROM
void TaskDestructor_RingsMgr(Task *t)
{
    void *rings = *(void **)(TASK_DATA(t) + offsetof(RingsManager, rings));
    EwramFree(rings);
}
#endif
