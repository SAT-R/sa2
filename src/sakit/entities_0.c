#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "sakit/globals.h"
#include "sakit/player.h"
#include "sakit/entities_0.h"

u32 CheckRectCollision_SpritePlayer(Sprite *s, s32 sx, s32 sy, Player *p,
                                    struct Rect8 *rectPlayer)
{
    u32 result = 0;

    if ((s->hitboxes[0].index == -1) || !IS_ALIVE(p)) {
        return result;
    }

    if (RECT_COLLISION(sx, sy, &s->hitboxes[0], Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y),
                       rectPlayer)) {
        result |= 0x80000;
    }

    return result;
}

#if 001
// (97.09%) https://decomp.me/scratch/GESIX
u32 sub_800C060(Sprite *s, s32 sx, s32 sy, Player *p) {
    s8 rectPlayer[4] = { -p->unk16, -p->unk17, +p->unk16, +p->unk17 };

    u32 result = 0;
    bool32 ip = FALSE;
    
    if ((s->hitboxes[0].index == -1) || !IS_ALIVE(p)) {
        return result;
    }
    // _0800C0B2

    if((p->moveState & MOVESTATE_8) && (p->unk3C == s)){
        p->moveState &= ~MOVESTATE_8;
        ip = TRUE;
    }
    // _0800C0CC
    
    if (RECT_COLLISION((sx + s->hitboxes[0].left), (sy + rectPlayer[1]), &s->hitboxes[0], Q_24_8_TO_INT(p->x), Q_24_8_TO_INT(p->y),
                       (struct Rect8 *)rectPlayer) && (p->speedAirY >= 0)) {
        s32 y;
        rectPlayer[1] = -p->unk17;
        rectPlayer[3] = +p->unk17;
        p->moveState |= MOVESTATE_8;
        result |= 0x8;

        if(!ip) {
            p->rotation = 0;
        }

        // _0800C18A
        p->unk3C = s;
        p->speedAirY = 0;

        if(GRAVITY_IS_INVERTED) {
            y = s->hitboxes[0].bottom;
            y += sy;
            y += rectPlayer[3];
        } else {
            y = s->hitboxes[0].top;
            y += sy;
            y -= rectPlayer[3];
        }
        y = Q_24_8(y);
        p->y = Q_24_8_FRAC(p->y) + (y);
    } else if(ip && !(p->moveState & MOVESTATE_8)) {
        // _0800C1D4+6
        p->moveState &= ~MOVESTATE_20;
        p->moveState |= MOVESTATE_IN_AIR;
    }


    return result;
}
#endif