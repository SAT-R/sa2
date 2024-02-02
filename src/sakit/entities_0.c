#include "global.h"
#include "sprite.h"
#include "sakit/player.h"

// https://decomp.me/scratch/2OSXQ
u32 sub_800BFAC(Sprite *s, s32 x, s32 y, Player *p, s8 *param4) {
    s32 left, right, top;
    s32 r1, r3;

    u32 result = 0;
    
    if((s->hitboxes[0].index == -1) || !IS_ALIVE(p)) {
        return result;
    }

    left = x + s->hitboxes[0].left;

    r1 = Q_24_8_TO_INT(p->x) + param4[0];

    //right = (left + (s->hitboxes[0].right - left));

    if((left > r1)
    || ((left + (s->hitboxes[0].right - s->hitboxes[0].left)) >= r1)
    || ((left >= r1) && ((r1 + (param4[2] - param4[0])) >= left))) {
        // _0800C010
        top = y + s->hitboxes[0].top;
        r3  = Q_24_8_TO_INT(p->y) + param4[1];

        if((top > r3) 
        || ((top + (s->hitboxes[0].bottom - s->hitboxes[0].top)) < r3)) {
            if((top >= r3) && (r3 + (param4[3] - param4[1])) >= top) {
                result |= 0x80000;
            }
        } else {
            result |= 0x80000;
        }
    }

    return result;
}
