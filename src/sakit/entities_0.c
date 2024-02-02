#include "global.h"
#include "rect.h"
#include "sprite.h"
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
