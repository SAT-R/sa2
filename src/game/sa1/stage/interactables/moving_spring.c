#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/stage_ui.h" // for sub_80549FC
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ u16 unk4C;
} MovingSpring;

void Task_MovingSpringMain(void);
void Task_808B5AC(void);
void TaskDestructor_MovingSpring(Task *t);
bool32 sub_808B7A0(MovingSpring *spring, Sprite *s, s32 worldX, s32 worldY);
bool32 sub_808BB44(Sprite *s, s32 worldX, s32 worldY, Rect8 *rect, Player *p);

// TODO: Fake-match
void CreateEntity_MovingSpring(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
#ifndef NON_MATCHING
    register u32 zone asm("r9") = (u8)LEVEL_TO_ZONE(gCurrentLevel);
#else
    u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
#endif

    Task *t = TaskCreate(Task_MovingSpringMain, sizeof(MovingSpring), 0x2000, 0, TaskDestructor_MovingSpring);
    MovingSpring *spring = TASK_DATA(t);
    Sprite *s = &spring->s;

    spring->base.regionX = regionX;
    spring->base.regionY = regionY;
    spring->base.me = me;
    spring->base.meX = me->x;
    spring->base.id = id;

    spring->qUnk40 = 0;
    spring->qUnk44 = 0;
    spring->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            spring->unk48 = 4;
            spring->unk3C = 0;
            spring->unk4A = 0;
        } else {
            spring->unk48 = 4;
            spring->unk3C = 0x80;
            spring->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            spring->unk48 = 0;
            spring->unk4A = 4;
            spring->unk3C = 0;
        } else {
            spring->unk48 = 0;
            spring->unk4A = 4;
            spring->unk3C = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    if (zone == ZONE_4) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING_PLATFORM_4);
        s->graphics.anim = SA1_ANIM_SPRING_PLATFORM_4;
        s->variant = 1;
    } else if ((zone == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING_PLATFORM_6);
        s->graphics.anim = SA1_ANIM_SPRING_PLATFORM_6;
        s->variant = 1;
    } else {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SPRING_PLATFORM_5);
        s->graphics.anim = SA1_ANIM_SPRING_PLATFORM_5;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void Task_MovingSpringMain(void)
{
    CamCoord worldX, worldY;
    MovingSpring *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;

    if (spring->unk48 != 0) {
        spring->qUnk40 = ((me->d.uData[2] << 11) * SIN((spring->unk48 * ((gStageTime + spring->unk3C) & 0xFF)) & (SIN_PERIOD - 1))) >> 14;
    }

    if (spring->unk4A != 0) {
        spring->qUnk44 = ((me->d.uData[3] << 11) * SIN((spring->unk4A * ((gStageTime + spring->unk3C) & 0xFF)) & (SIN_PERIOD - 1))) >> 14;
    }

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    s->x = worldX - gCamera.x + I(spring->qUnk40);
    s->y = worldY - gCamera.y + I(spring->qUnk44);

    if (sub_808B7A0(spring, s, worldX, worldY)) {
        gCurTask->main = Task_808B5AC;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_808B5AC(void)
{
    CamCoord worldX, worldY;
    MovingSpring *spring = TASK_DATA(gCurTask);
    Sprite *s = &spring->s;
    MapEntity *me = spring->base.me;

    if (spring->unk48 != 0) {
        spring->qUnk40 = ((me->d.uData[2] << 11) * SIN((spring->unk48 * ((gStageTime + spring->unk3C) & 0xFF)) & (SIN_PERIOD - 1))) >> 14;
    }

    if (spring->unk4A != 0) {
        spring->qUnk44 = ((me->d.uData[3] << 11) * SIN((spring->unk4A * ((gStageTime + spring->unk3C) & 0xFF)) & (SIN_PERIOD - 1))) >> 14;
    }

    worldX = TO_WORLD_POS(spring->base.meX, spring->base.regionX);
    worldY = TO_WORLD_POS(me->y, spring->base.regionY);

    sub_808B7A0(spring, s, worldX, worldY);

    s->x = worldX - gCamera.x + I(spring->qUnk40);
    s->y = worldY - gCamera.y + I(spring->qUnk44);

    if (++spring->unk4C > 12) {
        u8 zone = LEVEL_TO_ZONE(gCurrentLevel);
        if (zone == ZONE_4) {
            s->variant = 1;
        } else if ((zone == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
            s->variant = 1;
        } else {
            s->variant = 0;
        }

        gCurTask->main = Task_MovingSpringMain;
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, spring->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

bool32 sub_808B7A0(MovingSpring *spring, Sprite *s, s32 worldX, s32 worldY)
{
    bool32 result = FALSE;

    s32 i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            s8 arr[4] = { -(PLAYER(i).spriteOffsetX + 5), (1 - PLAYER(i).spriteOffsetY), +(PLAYER(i).spriteOffsetX + 5),
                          (PLAYER(i).spriteOffsetY - 1) };

            s32 r5 = Coll_AmyHammer_Spring(s, worldX + I(spring->qUnk40), worldY + I(spring->qUnk44), &PLAYER(i));
            s32 qPrevPlayerX;

            if (((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == s)) || r5) {
                u8 zone = LEVEL_TO_ZONE(gCurrentLevel);

                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                PLAYER(i).charState = CHARSTATE_17;
                PLAYER_SPR_INFO(i).s.prevVariant = -1;
                PLAYER(i).qSpeedAirY = -Q(7.5);

                if (r5) {
                    if (!(PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ)) {
                        PLAYER(i).qSpeedAirY += PLAYER(i).qSpeedAirY >> 1;
                    }
                }

                spring->unk4C = 0;

                if (zone == ZONE_4) {
                    s->variant = 0;
                } else if ((zone == ZONE_6) || (gCurrentLevel == ACT_CHAO_HUNT_D)) {
                    s->variant = 0;
                } else {
                    s->variant = 1;
                }

                m4aSongNumStart(SE_SPRING);
                result = TRUE;
            }

            qPrevPlayerX = PLAYER(i).qWorldX;

            sub_808BB44(s, worldX + I(spring->qUnk40), worldY + I(spring->qUnk44), (Rect8 *)arr, &PLAYER(i));

            {
                s32 r5 = Coll_Player_Platform(s, worldX + I(spring->qUnk40), worldY + I(spring->qUnk44), &PLAYER(i));

                if (PLAYER(i).charState == CHARSTATE_17) {
                    PLAYER(i).qWorldX = qPrevPlayerX;
                }

                if ((r5 & (COLL_FLAG_100000 | COLL_FLAG_40000 | COLL_FLAG_20000 | COLL_FLAG_10000)) && sub_80549FC()) {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_SPINATTACK;
                    PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                }

                if (!(r5 & COLL_FLAG_20)) {
                    if (PLAYER(i).moveState & MOVESTATE_20) {
                        PLAYER(i).moveState &= ~MOVESTATE_20;
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).charState = CHARSTATE_WALK_A;
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    return result;
}

// TODO: Very fake-match! :(
bool32 sub_808BB44(Sprite *s, s32 worldX, s32 worldY, Rect8 *rect, Player *p)
{
    s32 res;
    s32 qPlayerX;
#ifndef NON_MATCHING
    register s32 r1 asm("r1");
    register s32 v1 asm("r2");
#else
    s32 r1;
    s32 v1;
#endif

    if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rect))) {
        s32 v0 = worldX + s->hitboxes[0].b.left - rect->right;
        v1 = v0 + 8;
        qPlayerX = p->qWorldX;
        if (I(qPlayerX) <= v1) {
            r1 = Q(v0);
            p->qWorldX = r1;
        } else {
#ifndef NON_MATCHING
            register s32 v0 asm("r0") = worldX + s->hitboxes[0].b.right - rect->left;
#else
            s32 v0 = worldX + s->hitboxes[0].b.right - rect->left;
#endif
            v1 = v0 - 8;
            if (I(qPlayerX) >= v1) {
                r1 = Q(v0);
                p->qWorldX = r1;
            } else {
                return FALSE;
            }
        }

        res = SA2_LABEL(sub_801E4E4)(I(p->qWorldY) + 9, I(r1), p->layer, +8, NULL, SA2_LABEL(sub_801EE64));

        if (res < 0) {
            p->qWorldY += Q(res);
        }

        res = SA2_LABEL(sub_801E4E4)(I(p->qWorldY), I(p->qWorldX), p->layer, -8, NULL, SA2_LABEL(sub_801EE64));

        if (res < 0) {
            p->qWorldY += Q(res);
        }

        p->moveState &= ~MOVESTATE_20;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        return TRUE;
    }

    return FALSE;
}
void TaskDestructor_MovingSpring(Task *t)
{
    MovingSpring *spring = TASK_DATA(t);
    VramFree(spring->s.graphics.dest);
}
