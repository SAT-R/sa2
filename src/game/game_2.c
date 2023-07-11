#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/game.h"

#include "constants/animations.h"

void Task_801F214(void);

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

        t = sub_801F15C(x2, y2, 0xC0, 0, Task_801F214, TaskDestructor_801F550);

        ts = TaskGetStructPtr(t);
        s = &ts->s;
        s->graphics.dest = VramMalloc(20);
        s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
        s->variant = 0;
        s->unk1A = 0x200;
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
    struct Task *t = sub_801F15C(x, y, 0xC0, 0, Task_801F214, TaskDestructor_801F550);
    TaskStrc_801F15C *ts = TaskGetStructPtr(t);
    Sprite *s = &ts->s;

    s->graphics.dest = VramMalloc(20);
    s->graphics.anim = SA2_ANIM_SPARK_EFFECT;
    s->variant = 0;
    s->unk1A = 0x200;
    s->unk10 = SPRITE_FLAG(PRIORITY, 1);

    return t;
}