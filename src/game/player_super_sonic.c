#include "core.h"
#include "sakit/camera.h"
#include "trig.h"
#include "game/player_super_sonic.h"

struct Task *sSuperSonicTask = NULL;

bool32 sub_802BA8C();
void sub_802C988(struct SuperSonic *sonic);

void sub_802C8A0(struct SuperSonic *sonic)
{
    s32 a, r4, divRes;
    sonic->flags &= ~0x4;

    a = Q_24_8(gCamera.x + (DISPLAY_WIDTH + 76));
    r4 = Q_24_8(gCamera.y + (DISPLAY_HEIGHT / 2));
    divRes = Div(a - sonic->unk4, 100);

    sonic->unk4 += divRes;

    r4 -= sonic->unk8;
    sonic->unk8 += Div(r4, 100);
}

void sub_802C8EC(struct SuperSonic *sonic)
{
    Sprite *spr = &sonic->spr134;
    spr->unk10 = SPRITE_FLAG(PRIORITY, 2);

    sonic->unk1A += 0x20;
    sonic->unk8 += sonic->unk1A;

    if ((Q_24_8_TO_INT(sonic->unk8) - gCamera.y) > DISPLAY_HEIGHT) {
        sonic->unk129 = TRUE;
    }
}

// (76.48%) https://decomp.me/scratch/y8kIL
NONMATCH("asm/non_matching/game/super_sonic__sub_802C92C.inc",
         void sub_802C92C(struct SuperSonic *sonic))
{
    s32 v;
    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C988;
        sonic->flags |= 0x40;
        sonic->unkC = 100;
    }

    sonic->unk1A = Q_24_8(1.0);
    sonic->unk4 += COS_24_8(sonic->rotation);
    sonic->unk8 += SIN_24_8(sonic->rotation);
}
END_NONMATCH

void sub_802C988(struct SuperSonic *sonic)
{
    if (--sonic->unkC == 0) {
        sonic->flags &= ~0x40;
        sonic->flags &= ~0x200;
        sub_802BA8C();
    }
}

void sub_802C9B0(struct SuperSonic *sonic)
{
    if (!(sonic->flags & 0x30)) {
#ifndef NON_MATCHING
        CLAMP_INLINE_NO_ELSE(sonic->unk8, Q_24_8(50), Q_24_8(254));
#else
        CLAMP_INLINE(sonic->unk8, Q_24_8(50), Q_24_8(254));
#endif
    }
}

bool32 sub_802C9E0(void) { return FALSE; }