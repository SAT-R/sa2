#include "global.h"
#include "game/game.h"

#include "game/player_unknown_0.h"

static void inline sub_8011B54_inline(u32 *dst, u32 *src, s32 size, const s32 shift)
{
    s32 r2 = size >> shift;

    while (r2-- != 0) {
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
        *dst++ = *src++;
    }
}

#if 0
void sub_8011328()
{
    if(IS_MULTI_PLAYER)
    {
        u8 i = 0, j = 0;
    } else {
        // _08011400
    }
    // _080114B0
}
#endif

#if 01 // matches
static void sub_8011B54(u32 *dst, u32 *src, s32 size)
{
    sub_8011B54_inline(dst, src, size, 4);
}
#endif