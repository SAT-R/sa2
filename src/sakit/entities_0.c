#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "sakit/player.h"

u32 sub_800BFAC(Sprite *s, s32 x, s32 y, Player *p, struct Rect8 *param4)
{
    s32 left, right, top;

    s32 px;

    u32 result = 0;

    if ((s->hitboxes[0].index == -1) || !IS_ALIVE(p)) {
        return result;
    }

    if (RECT_COLLISION(x, y, &s->hitboxes[0], Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y),
                       param4)) {
        result |= 0x80000;
    }

    return result;
}
asm(".short 0");
