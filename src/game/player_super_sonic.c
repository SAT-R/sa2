#include "core.h"
#include "trig.h"
#include "game/player_super_sonic.h"

struct Task *sSuperSonicTask = NULL;

bool32 sub_802BA8C();
void sub_802C988(struct SuperSonic *sonic);

void sub_802C92C(struct SuperSonic *sonic)
{
    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C988;
        sonic->flags |= 0x40;
        sonic->unkC = 100;
    }

    sonic->unk1A = Q_24_8(1.0);
    sonic->unk4 += COS_24_8(sonic->unk18);
    sonic->unk8 += SIN_24_8(sonic->unk18);
}

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