#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "game/sa1_leftovers/globals.h"

#include "game/stage/game_2.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/stage/stage.h"
#include "game/water_effects.h"
#include "game/multiplayer/mp_player.h"

#include "constants/animations.h"

const u16 sAnimData_StageGoalScoreBonus[][3] = {
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 1 }, { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 2 }, { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 3 },
    { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 4 }, { 36, SA2_ANIM_STAGE_GOAL_SCORE_BONUS, 5 },
};

struct Task *sub_801F15C(s16 x, s16 y, u8 param2, s8 param3, TaskMain main, TaskDestructor dtor)
{
    struct Task *t = TaskCreate(main, sizeof(TaskStrc_801F15C), 0x4001, 0, dtor);

    TaskStrc_801F15C *strc = TASK_DATA(t);
    Sprite *s = &strc->s;

    strc->x = x;
    strc->y = y;
    strc->unk14 = param2;
    strc->unk1A = param3;
    strc->playerAnim = 0;
    strc->playerVariant = 0;

    s->graphics.dest = NULL;
    s->graphics.size = 0;
    s->graphics.anim = 0;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(0);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0;

    return t;
}

void Task_801F214(void)
{
    TaskStrc_801F15C *ts = TASK_DATA(gCurTask);
    Sprite *s = &ts->s;

    if (!PLAYER_IS_ALIVE) {
        TaskDestroy(gCurTask);
        return;
    }
    if ((ts->unk14 & 0x8) && ((ts->playerAnim != gPlayer.anim) || (ts->playerVariant != gPlayer.variant))) {
        TaskDestroy(gCurTask);
        return;
    } else {
        if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
            TaskDestroy(gCurTask);
            return;
        }

        switch (ts->unk14 & 0x3) {
            case 0: {
                switch (ts->unk14 & 0x30) {
                    case 0x20: {
                        if (IS_MULTI_PLAYER) {
                            s8 id = SIO_MULTI_CNT->id;
                            struct Task *tmpp = gMultiplayerPlayerTasks[id];
                            MultiplayerPlayer *mpp = TASK_DATA(tmpp);
                            ts->x = mpp->pos.x;
                            ts->y = mpp->pos.y;
                        } else {
                            ts->x = I(gPlayer.x);
                            ts->y = I(gPlayer.y);
                        }
                    } break;

                    case 0x10: {
                        ts->y = gWater.currentWaterLevel;
                    } break;
                }

                {
                    struct Camera *cam = &gCamera;
                    s->x = ts->x - cam->x;
                    s->y = ts->y - cam->y;
                }
            } break;

            case 1: {
                struct Camera *cam = &gCamera;
                s->x = ts->x - cam->unk52;
                s->y = ts->y - cam->unk54;
            } break;

            case 2: {
                s->x = ts->x;
                s->y = ts->y;
            } break;
        }

        if (ts->unk14 & 0x40) {
            if (!(gPlayer.moveState & MOVESTATE_FACING_LEFT)) {
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
            } else {
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
            }
        }

        if (ts->unk14 & 0x80) {
            if (GRAVITY_IS_INVERTED) {
                s->frameFlags |= SPRITE_FLAG_MASK_Y_FLIP;
            } else {
                s->frameFlags &= ~SPRITE_FLAG_MASK_Y_FLIP;
            }
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

struct Task *CreateStageGoalBonusPointsAnim(s32 x, s32 y, u16 score)
{
    if ((score != 100) && (score != 200) && (score != 300) && (score != 500) && (score != 800)) {
        return NULL;
    } else {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        t = sub_801F15C(x, y, 32, 0, Task_801F214, TaskDestructor_801F550);
        ts = TASK_DATA(t);

        switch (score) {
            case 100: {
                score = 0;
            } break;

            case 200: {
                score = 1;
            } break;

            case 300: {
                score = 2;
            } break;

            case 500: {
                score = 3;
            } break;

            case 800: {
                score = 4;
            } break;
        }

        s = &ts->s;
        s->graphics.dest = VramMalloc(sAnimData_StageGoalScoreBonus[score][0]);
        s->graphics.anim = sAnimData_StageGoalScoreBonus[score][1];
        s->variant = sAnimData_StageGoalScoreBonus[score][2];
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        return t;
    }
}

void sub_801F488(void)
{
    Player *p = &gPlayer;
    if ((gStageTime & 0x7) == 0) {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        s32 x, y;
        s32 x2, y2;

        s32 yInverted = p->spriteOffsetY;

        if (GRAVITY_IS_INVERTED) {
            yInverted = -yInverted;
        }

        x = I(yInverted * SIN_24_8(p->rotation * 4));
        y = I(yInverted * COS_24_8(p->rotation * 4));

        x2 = I(p->x);
        y2 = I(p->y);

        x2 -= x;
        y2 += y;

        t = sub_801F15C(x2, y2, 192, 0, Task_801F214, TaskDestructor_801F550);

        ts = TASK_DATA(t);
        s = &ts->s;
        s->graphics.dest = VramMalloc(20);
        s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
        s->variant = 0;
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
    }
}

void TaskDestructor_801F550(struct Task *t)
{
    TaskStrc_801F15C *ts = TASK_DATA(t);
    Sprite *s = &ts->s;

    VramFree(s->graphics.dest);
}

struct Task *sub_801F568(s16 x, s16 y)
{
    struct Task *t = sub_801F15C(x, y, 192, 0, Task_801F214, TaskDestructor_801F550);
    TaskStrc_801F15C *ts = TASK_DATA(t);
    Sprite *s = &ts->s;

    s->graphics.dest = VramMalloc(20);
    s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    return t;
}