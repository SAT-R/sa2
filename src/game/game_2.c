#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage/stage.h"

#include "constants/animations.h"

void Task_801F214(void)
{
    TaskStrc_801F15C *ts = TaskGetStructPtr(gCurTask);
    Sprite *s = &ts->s;

    if (!PLAYER_IS_ALIVE) {
        TaskDestroy(gCurTask);
        return;
    }
    if ((ts->unk14 & 0x8)
        && ((ts->playerAnim != gPlayer.anim)
            || (ts->playerVariant != gPlayer.variant))) {
        TaskDestroy(gCurTask);
        return;
    } else {
        if (s->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
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
                            struct MultiplayerPlayer *mpp = TaskGetStructPtr(tmpp);
                            ts->x = mpp->unk50;
                            ts->y = mpp->unk52;
                        } else {
                            ts->x = Q_24_8_TO_INT(gPlayer.x);
                            ts->y = Q_24_8_TO_INT(gPlayer.y);
                        }
                    } break;

                    case 0x10: {
                        ts->y = gUnknown_03005660.unk4;
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
                s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
            } else {
                s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
            }
        }

        if (ts->unk14 & 0x80) {
            if (GRAVITY_IS_INVERTED) {
                s->unk10 |= SPRITE_FLAG_MASK_Y_FLIP;
            } else {
                s->unk10 &= ~SPRITE_FLAG_MASK_Y_FLIP;
            }
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

struct Task *sub_801F3A4(s32 x, s32 y, u16 score)
{
    if ((score != 100) && (score != 200) && (score != 300) && (score != 500)
        && (score != 800)) {
        return NULL;
    } else {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        t = sub_801F15C(x, y, 32, 0, Task_801F214, TaskDestructor_801F550);
        ts = TaskGetStructPtr(t);

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
        s->unk1A = SPRITE_OAM_ORDER(8);
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
        return t;
    }
}

void sub_801F488(void)
{
    Player *p = &gPlayer;
    if ((gUnknown_03005590 & 0x7) == 0) {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        s32 x, y;
        s32 x2, y2;

        s32 yInverted = p->unk17;

        if (GRAVITY_IS_INVERTED) {
            yInverted = -yInverted;
        }

        x = Q_24_8_TO_INT(yInverted * SIN_24_8(p->rotation * 4));
        y = Q_24_8_TO_INT(yInverted * COS_24_8(p->rotation * 4));

        x2 = Q_24_8_TO_INT(p->x);
        y2 = Q_24_8_TO_INT(p->y);

        x2 -= x;
        y2 += y;

        t = sub_801F15C(x2, y2, 192, 0, Task_801F214, TaskDestructor_801F550);

        ts = TaskGetStructPtr(t);
        s = &ts->s;
        s->graphics.dest = VramMalloc(20);
        s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
        s->variant = 0;
        s->unk1A = SPRITE_OAM_ORDER(8);
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
    }
}

void TaskDestructor_801F550(struct Task *t)
{
    TaskStrc_801F15C *ts = TaskGetStructPtr(t);
    Sprite *s = &ts->s;

    VramFree(s->graphics.dest);
}

struct Task *sub_801F568(s16 x, s16 y)
{
    struct Task *t = sub_801F15C(x, y, 192, 0, Task_801F214, TaskDestructor_801F550);
    TaskStrc_801F15C *ts = TaskGetStructPtr(t);
    Sprite *s = &ts->s;

    s->graphics.dest = VramMalloc(20);
    s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(8);
    s->unk10 = SPRITE_FLAG(PRIORITY, 1);

    return t;
}