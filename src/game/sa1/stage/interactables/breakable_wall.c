#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

// TODO: Rename
#define NUM_OUTER_ELEMS 8
#define NUM_INNER_ELEMS 4

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s16 qUnk3C;
    /* 0x3C */ s16 qUnk3E;
    /* 0x40 */ u8 filler40[4];
} Wall;

extern u16 gUnknown_080BB544[NUM_LEVEL_IDS];

void Task_BreakableWall(void);
void Task_BreakableWall2(void);
void TaskDestructor_BreakableWall(Task *);

void CreateEntity_BreakableWall(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_BreakableWall, sizeof(Wall), 0x2000, 0, TaskDestructor_BreakableWall);
    Wall *wall = TASK_DATA(t);
    Sprite *s = &wall->s;

    wall->base.regionX = regionX;
    wall->base.regionY = regionY;
    wall->base.me = me;
    wall->base.meX = me->x;
    wall->base.id = id;

    SET_MAP_ENTITY_INITIALIZED(me);
    wall->qUnk3C = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BREAKABLE_WALL_1);
    s->graphics.anim = gUnknown_080BB544[gCurrentLevel];
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (me->d.sData[0] != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    }

    UpdateSpriteAnimation(s);
}

// TODO: Fake-match
// (100.0%) https://decomp.me/scratch/3KiDd
void Task_BreakableWall(void)
{
    CamCoord worldX, worldY;
    MapEntity *me;
    Sprite *s;
    s32 i;

#ifndef NON_MATCHING
    register Wall *wall asm("r6");
    register s32 offset asm("r1") = gCurTask->data;
    asm("add %0, %1, %2" : "=r"(wall) : "r"(offset), "r"(IWRAM_START));
    asm("add r0, #0xC");
    asm("add r0, r1");
    asm("mov %0, r0" : "=r"(s));
#else
    Wall *wall;
    wall = TASK_DATA(gCurTask);
    s = &wall->s;
#endif
    me = wall->base.me;

    worldX = TO_WORLD_POS(wall->base.meX, wall->base.regionX);
    worldY = TO_WORLD_POS(me->y, wall->base.regionY);

    i = 0;
    do {
        if (IS_MULTI_PLAYER && ((s8)me->x == MAP_ENTITY_STATE_MINUS_THREE)) {
            if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == s)) {
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
            }

            wall->qUnk3C = 0;
            wall->qUnk3E = 0;

            gCurTask->main = Task_BreakableWall2;

            m4aSongNumStart(SE_173);
        } else if (Coll_Player_Gate(s, worldX, worldY, &PLAYER(i), 1) & COLL_FLAG_8) {
            m4aSongNumStart(SE_173);
            gCurTask->main = Task_BreakableWall2;

            wall->qUnk3C = 0;

            if ((wall->qUnk3E = PLAYER(i).qSpeedAirX >> 1) == 0) {
                s16 qVal;
                if (worldX < I(PLAYER(i).qWorldX))
                    qVal = -Q(1);
                else
                    qVal = +Q(1);

                wall->qUnk3E = qVal;
            }

            if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == s)) {
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
            }

#ifndef NON_MATCHING
            // NOTE: This is entirely unnecessary because it's handled in the codeblock above.
            if ((gNumSingleplayerCharacters == 2) && ((gPartner.moveState & MOVESTATE_STOOD_ON_OBJ) && (gPartner.stoodObj == s))) {
                gPartner.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPartner.moveState |= MOVESTATE_IN_AIR;
            }
#endif

            if (IS_MULTI_PLAYER) {
                RoomEvent_PlatformChange *event = CreateRoomEvent();
                event->type = ROOMEVENT_TYPE_PLATFORM_CHANGE;
                event->x = wall->base.regionX;
                event->y = wall->base.regionY;
                event->id = wall->base.id;
                event->action = 1;
            }

            break;
        }
    } while (++i < gNumSingleplayerCharacters);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, wall->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

// (76.51%) https://decomp.me/scratch/Hx9vh
NONMATCH("asm/non_matching/game/sa1/stage/interactables/BreakableWall__Task_BreakableWall2.inc", void Task_BreakableWall2(void))
{
    CamCoord worldX, worldY;
    MapEntity *me;
    Sprite *s;
    const u16 *oamData;
    u8 i, j;
    const u16 *oamDataEntry;
    u16 *oamDataAlloc;
    s16 sp0C;
    u8 r1, r8, sb;
    s16 r5, temp, temp2;

    Wall *wall = TASK_DATA(gCurTask);
    s = &wall->s;
    me = wall->base.me;

    worldX = TO_WORLD_POS(wall->base.meX, wall->base.regionX);
    worldY = TO_WORLD_POS(me->y, wall->base.regionY);

    sp0C = gCamera.y - worldY + DISPLAY_HEIGHT;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    wall->qUnk3C++;

    if (((worldX) > gCamera.x + ((DISPLAY_WIDTH) + (CAM_REGION_WIDTH / 2)) || (worldX) < gCamera.x - (CAM_REGION_WIDTH / 2))
        && (((u16)(s->x + (CAM_REGION_WIDTH / 2)) > DISPLAY_WIDTH + CAM_REGION_WIDTH))) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, wall->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    oamData = gRefSpriteTables->oamData[GET_SPRITE_ANIM(s)];
    oamDataEntry = &oamData[s->dimensions->oamIndex * (sizeof(OamDataShort) / 2)];

    for (i = 0; i < NUM_OUTER_ELEMS; i++) {
        for (j = 0; j < NUM_INNER_ELEMS; j++) {
            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                sb = (NUM_INNER_ELEMS - 1) - j;
            } else {
                sb = j;
            }
            // _08027E6E

            if (wall->qUnk3E >= Q(0)) {
                r1 = j;
            } else {
                r1 = (NUM_INNER_ELEMS - 1) - j;
            }
            // _08027E86

            r8 = i * 4 + sb;

            temp = (wall->qUnk3C - r1 * 10) - ((NUM_OUTER_ELEMS - 1) - i) * 2;

            if (temp > 0) {
                r5 = I(temp * ((temp * 42) - Q(2)));
                temp2 = I(temp * wall->qUnk3E);

                if (r5 > sp0C) {
                    if (sp0C >= Q(0)) {
                        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                            // _08027F1C
                            if (r8 == 3) {
                                SET_MAP_ENTITY_NOT_INITIALIZED(me, wall->base.meX);
                                TaskDestroy(gCurTask);
                                return;
                            } else {
                                continue;
                            }
                        } else {
                            // _08027EF0
                            if (r8 == 0) {
                                SET_MAP_ENTITY_NOT_INITIALIZED(me, wall->base.meX);
                                TaskDestroy(gCurTask);
                                return;
                            } else {
                                continue;
                            }
                        }
                    } else {
                        // _08027EF8
                        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                            // _08027F1C
                            if (r8 == 0) {
                                SET_MAP_ENTITY_NOT_INITIALIZED(me, wall->base.meX);
                                TaskDestroy(gCurTask);
                                return;
                            } else {
                                continue;
                            }
                        } else {
                            // _08027EF0
                            if (r8 == 3) {
                                SET_MAP_ENTITY_NOT_INITIALIZED(me, wall->base.meX);
                                TaskDestroy(gCurTask);
                                return;
                            } else {
                                continue;
                            }
                        }
                    }
                } // else goto _08027F3C
            } else {
                // _08027F38
                temp2 = 0;
                r5 = 0;
            }
            // _08027F3C

            oamDataAlloc = (u16 *)OamMalloc(GET_SPRITE_OAM_ORDER(s));

            if (iwram_end == oamDataAlloc) {
                return;
            }

            oamDataAlloc[0] = (r5 + (s->y + i * 8)) & 0xFF;

            if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                oamDataAlloc[1] = (((s->x - sb * 8) - 8 + temp2) & 0x1FF) | 0x1000;
            } else {
                // _08027FA0
                oamDataAlloc[1] = (((s->x + sb * 8) + temp2) & 0x1FF);
            }
            // _08027FB4

            oamDataAlloc[2] = ((oamDataEntry[2] + s->palId) & ~0xFFF) | ((s->frameFlags & SPRITE_FLAG_MASK_PRIORITY) >> 2)
                | (GET_TILE_NUM(s->graphics.dest) + r8);
        }
    }
}
END_NONMATCH

void TaskDestructor_BreakableWall(Task *t)
{
    Wall *wall = TASK_DATA(t);
    VramFree(wall->s.graphics.dest);
}
