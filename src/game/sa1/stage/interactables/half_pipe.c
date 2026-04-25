#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/char_states.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ s32 worldX;
    /* 0x08 */ s32 worldY;
    /* 0x0C */ s32 left;
    /* 0x10 */ s32 right;
    /* 0x14 */ s32 top;
    /* 0x18 */ s32 bottom;
    /* 0x1C */ s32 qOffsetY;
    /* 0x20 */ u8 unk20;
    /* 0x24 */ u8 meX;
} HalfPipe;

void Task_HalfPipeStart(void);
void Task_HalfPipeEnd(void);
void sub_804D4A0(s32 param0, s32 unusedParam1, Player *p);

void Task_HalfPipeStart(void)
{
    HalfPipe *halfpipe = TASK_DATA(gCurTask);
    s32 i;

    i = 0;
    do {
        Player *p = &PLAYER(i);
        s32 oldWorldX, oldWorldY;

        oldWorldX = I(p->qWorldX);
        oldWorldY = I(p->qWorldY);

        if ((halfpipe->worldX > gCamera.x + DISPLAY_WIDTH + 128) || (halfpipe->worldX < gCamera.x - 800)
            || (halfpipe->worldY > gCamera.y + DISPLAY_HEIGHT + 128) || (halfpipe->worldY < gCamera.y - 128)) {
            p->moveState &= ~MOVESTATE_8000;

            halfpipe->me->x = halfpipe->meX;
            TaskDestroy(gCurTask);
            return;
        }

        if ((halfpipe->left <= oldWorldX) && (oldWorldX < halfpipe->right) && (halfpipe->top <= oldWorldY)
            && (oldWorldY < halfpipe->bottom)) {
            if (p->qSpeedAirX > +Q(2.25)) {
                if (!(p->moveState & MOVESTATE_IN_AIR) && (p->SA2_LABEL(unk62) == 0)) {
                    p->moveState |= MOVESTATE_8000;
                    halfpipe->qOffsetY = p->qWorldY + Q(p->spriteOffsetY);
                } else {
                    p->moveState &= ~MOVESTATE_8000;
                }
            } else {
                p->moveState &= ~MOVESTATE_8000;
            }
        } else {
            if ((p->moveState & MOVESTATE_8000) && (halfpipe->right <= oldWorldX)) {
                s16 qSpeed;
                if (!IS_ALIVE(p)) {
                    return;
                }

                qSpeed = p->qSpeedAirX + Q(2.25) - 1;
                if ((qSpeed >= Q(0) && qSpeed < Q(4.5) - 1) || (p->frameInput & gPlayerControls.jump)) {
                    p->moveState &= ~MOVESTATE_8000;

                    if (p->charState == CHARSTATE_WALLRUN_INIT || p->charState == CHARSTATE_WALLRUN_TO_WALL
                        || p->charState == CHARSTATE_WALLRUN_ON_WALL) {
                        p->charState = CHARSTATE_WALK_A;
                    }

                } else if ((p->qSpeedAirX >= +Q(2.25))) {
                    sub_804D4A0(oldWorldX - halfpipe->right, halfpipe->qOffsetY, p);
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);
}

void Task_HalfPipeEnd(void)
{
    HalfPipe *halfpipe = TASK_DATA(gCurTask);
    s32 i;

    i = 0;
    do {
        Player *p = &PLAYER(i);
        s32 oldWorldX, oldWorldY;

        oldWorldX = I(p->qWorldX);
        oldWorldY = I(p->qWorldY);

        if ((halfpipe->worldX > gCamera.x + DISPLAY_WIDTH + 800) || (halfpipe->worldX < gCamera.x - 128)
            || (halfpipe->worldY > gCamera.y + DISPLAY_HEIGHT + 128) || (halfpipe->worldY < gCamera.y - 128)) {
            p->moveState &= ~MOVESTATE_8000;

            halfpipe->me->x = halfpipe->meX;
            TaskDestroy(gCurTask);
            return;
        }

        if ((halfpipe->left <= oldWorldX) && (oldWorldX < halfpipe->right) && (halfpipe->top <= oldWorldY)
            && (oldWorldY < halfpipe->bottom)) {
            if (p->qSpeedAirX < -Q(2.25)) {
                if (!(p->moveState & MOVESTATE_IN_AIR) && (p->SA2_LABEL(unk62) == 0)) {
                    p->moveState |= MOVESTATE_8000;
                    halfpipe->qOffsetY = p->qWorldY + Q(p->spriteOffsetY);
                } else {
                    p->moveState &= ~MOVESTATE_8000;
                }
            } else {
                p->moveState &= ~MOVESTATE_8000;
            }
        } else {
            if ((p->moveState & MOVESTATE_8000) && (oldWorldX < halfpipe->left)) {
                s16 qSpeed;
                if (!IS_ALIVE(p)) {
                    return;
                }

                qSpeed = p->qSpeedAirX + Q(2.25) - 1;
                if ((qSpeed >= Q(0) && qSpeed < Q(4.5) - 1) || (p->frameInput & gPlayerControls.jump)) {
                    p->moveState &= ~MOVESTATE_8000;

                    if (p->charState == CHARSTATE_WALLRUN_INIT || p->charState == CHARSTATE_WALLRUN_TO_WALL
                        || p->charState == CHARSTATE_WALLRUN_ON_WALL) {
                        p->charState = CHARSTATE_WALK_A;
                    }

                } else if ((p->qSpeedAirX <= -Q(2.25))) {
                    sub_804D4A0(oldWorldX - halfpipe->left + Q(2.625), halfpipe->qOffsetY, p);
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);
}

// (93.82%) https://decomp.me/scratch/Qgh0B
NONMATCH("asm/non_matching/game/sa1/stage/interactables/half_pipe__sub_804D4A0.inc",
         void sub_804D4A0(s32 param0, s32 unusedParam1, Player *p))
{
#ifndef NON_MATCHING
    register HalfPipe *halfpipe asm("r8") = TASK_DATA(gCurTask);
    register s32 r6 asm("r6") = 0;
    register s32 r5 asm("r5");
#else
    HalfPipe *halfpipe = TASK_DATA(gCurTask);
    s32 r6 = 0;
    s32 r5;
#endif
    s32 r3;
    s32 divParam0;
    s32 r0;
    s32 r1;
    u16 theta;

    if (param0 >= 0 && param0 < 0x2A0) {
        s16 qSpeedAirX = (ABS(p->qSpeedAirX) - Q(2.25)) >> 2;

        if (qSpeedAirX >= Q(0)) {
            if (qSpeedAirX > Q(1)) {
                qSpeedAirX = Q(1);
            }
        } else {
            qSpeedAirX = 0;
        }

        r6 = SIN_24_8((u16)qSpeedAirX);

        r5 = Q(1);
        if (r6 > r5) {
            r6 = r5;
        }
        // _0804D50C

        if (param0 < 0x150) {
            divParam0 = (param0) << 15;
        } else {
            divParam0 = ((param0 - Q(2.625)) << 15);
        }

        theta = (divParam0 / 0x150);
        theta >>= 6;
#ifndef NON_MATCHING
        r1 = -SIN(theta + r5);
#else
        r1 = -COS(theta);
#endif
        r0 = ((r1 * 3 >> 2) + Q(48));
        r0 *= r6;
        r0 = I(r0);
        r6 = r0;
    }
    // _0804D550

    if (!(p->moveState & MOVESTATE_SPIN_ATTACK)) {
        // __0804D55A
        if (p->SA2_LABEL(unk62) == 0) {
            if (p->charState == CHARSTATE_WALK_A
                || (p->charState == CHARSTATE_WALLRUN_INIT || p->charState == CHARSTATE_WALLRUN_TO_WALL
                    || p->charState == CHARSTATE_WALLRUN_ON_WALL)) {
                if (r6 < Q(8)) {
                    p->charState = CHARSTATE_WALK_A;
                } else if (r6 < Q(24)) {
                    p->charState = CHARSTATE_WALLRUN_INIT;
                } else if (r6 < Q(48)) {
                    p->charState = CHARSTATE_WALLRUN_TO_WALL;
                } else {
                    p->charState = CHARSTATE_WALLRUN_ON_WALL;
                }
            }
        }
    }
    // _0804D5B8

    p->moveState &= ~MOVESTATE_IN_AIR;
    p->qSpeedAirY = 0;

    r1 = halfpipe->qOffsetY;
    r1 -= r6;
    r1 -= Q(p->spriteOffsetY);
    r1 -= p->qWorldY;

    r3 = p->qWorldY;
    if (r1 >= -Q(6)) {
        if (r1 > Q(6)) {
            r1 = Q(6);
        }
    } else {
        r1 = -Q(6);
    }

    p->qWorldY = r3 + r1;
}
END_NONMATCH

void CreateEntity_HalfPipeStart(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_HalfPipeStart, sizeof(HalfPipe), 0x2000, 0, NULL);
    HalfPipe *halfpipe = TASK_DATA(t);
    s32 worldX, worldY;

    halfpipe->me = me;
    halfpipe->meX = me->x;
    halfpipe->unk20 = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);

    halfpipe->worldX = worldX;
    halfpipe->worldY = worldY;

    halfpipe->left = worldX + me->d.sData[0] * TILE_WIDTH;
    halfpipe->top = worldY + me->d.sData[1] * TILE_WIDTH;
    halfpipe->right = halfpipe->left + me->d.uData[2] * TILE_WIDTH;
    halfpipe->bottom = halfpipe->top + me->d.uData[3] * TILE_WIDTH;

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}

void CreateEntity_HalfPipeEnd(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_HalfPipeEnd, sizeof(HalfPipe), 0x2000, 0, NULL);
    HalfPipe *halfpipe = TASK_DATA(t);
    s32 worldX, worldY;

    halfpipe->me = me;
    halfpipe->meX = me->x;
    halfpipe->unk20 = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);

    halfpipe->worldX = worldX;
    halfpipe->worldY = worldY;

    halfpipe->left = worldX + me->d.sData[0] * TILE_WIDTH;
    halfpipe->top = worldY + me->d.sData[1] * TILE_WIDTH;
    halfpipe->right = halfpipe->left + me->d.uData[2] * TILE_WIDTH;
    halfpipe->bottom = halfpipe->top + me->d.uData[3] * TILE_WIDTH;

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}
