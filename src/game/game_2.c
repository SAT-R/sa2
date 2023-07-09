#include "global.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/game.h"

void Task_802B1AC()
{
    TaskStrc_801F15C *ts = TaskGetStructPtr(gCurTask);
    Sprite *s = &ts->s;
    SpriteTransform *transform = &ts->transform;

    s32 r1 = ts->x;
    s32 r4 = ts->y;
    s32 r2;
    s32 unk10 = ts->unk10;

    r1 += SIN((unk10 & 0xFF) * 4) >> 4;
    {
        struct Camera *cam = &gCamera;
        transform->x = Q_24_8_TO_INT(r1) - cam->x;
        transform->y = Q_24_8_TO_INT(r4) - cam->y;
    }
    // TODO: MIN()!
    r2 = ((unk10 + 1) << 4);
    if (r2 > 0x100)
        r2 = 0x100;

    // _0802B200
    transform->width = r2;
    transform->height = r2;

    if (ts->unk14 & 0x1)
        transform->width = -r2;

    if (ts->unk14 & 0x2)
        transform->height = -transform->height;

    // _0802B222
    if (((u16)(transform->x + 0x20) > 0x130) || ((u16)(transform->y + 0x20) > 0xE0)
        || ((u16)gUnknown_03005660.unk0 != 1) || (gUnknown_03005660.unk4 < 0)
        || (Q_24_8_TO_INT(r4) - 3 < gUnknown_03005660.unk4) || (ts->unk10 > 0x1E0)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        // _0802B27C
        u8 byte;
        ts->x += ts->unk8;
        ts->y += ts->unkA;

        ts->unk8 -= (ts->unk8 >> 3);
        ts->unk10 += 1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        byte = gUnknown_030054B8++ | 0x20;
        s->unk10 |= byte;

        sub_8004558(s);
        sub_8004860(s, transform);
        sub_80051E8(s);
    }
}
