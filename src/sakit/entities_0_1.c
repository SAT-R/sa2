#include "global.h"
#include "rect.h"
#include "sprite.h"
#include "sakit/entities_0.h"
#include "sakit/player.h"

// TODO: This might be an inline.
//       Code identical to beginning of sub_800C060
u32 sub_800DF38(Sprite *s, s32 x, s32 y, Player *p)
{
    // TODO: Could this match with a 'struct Rect8' instead of s8[4]?
    s8 rectPlayer[4] = { -p->unk16, -p->unk17, +p->unk16, +p->unk17 };

    return CheckRectCollision_SpritePlayer(s, x, y, p, (struct Rect8 *)&rectPlayer);
}