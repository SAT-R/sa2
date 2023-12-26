#include "core.h"
#include "trig.h"
#include "sakit/globals.h"
#include "sakit/camera.h"
#include "sakit/player.h"
#include "game/bosses/boss_9.h"
#include "game/player_super_sonic.h"

#include "constants/move_states.h"

struct Task *sSuperSonicTask = NULL;

extern const TileInfo gAnims_SuperSonic_080D69C8[23];

bool32 sub_802BA8C();
void sub_802BE1C(struct SuperSonic *sonic);
void sub_802C8A0(struct SuperSonic *sonic);
void sub_802C92C(struct SuperSonic *sonic);
void sub_802C9B0(struct SuperSonic *sonic);
void sub_802BCCC(struct SuperSonic *sonic);
void sub_802BFA8(struct SuperSonic *sonic);
void sub_802C058(struct SuperSonic *sonic);
void sub_802C988(struct SuperSonic *sonic);

#if 01
#endif

void sub_802C55C(struct SuperSonic *sonic)
{
    sub_802BFA8(sonic);

#ifndef NON_MATCHING
    sonic->unk10 = -((sonic->unk10 * 55) << 1) >> 7;
    sonic->unk14 = -((sonic->unk14 * 55) << 1) >> 7;
#else
    sonic->unk10 = -(sonic->unk10 * 110) / 128;
    sonic->unk14 = -(sonic->unk14 * 110) / 128;
#endif

    if (--sonic->unkC == 0) {
        Sprite *spr;
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__8;
        sonic->flags |= SUPER_FLAG__1;

        sonic->tileInfoId = 0;
        sonic->spr134.graphics.anim = gAnims_SuperSonic_080D69C8[0].anim;
        sonic->spr134.variant = gAnims_SuperSonic_080D69C8[0].variant;
        sonic->spr134.prevVariant = -1;
        sonic->spr134.graphics.size = 0;
        sonic->spr134.animCursor = 0;
        sonic->spr134.timeUntilNextFrame = 0;
        sonic->unk10 = 0;
        sonic->unk14 = 0;
        sonic->unk22 = 0;
    } else if (sonic->pressedKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) {
        if (sonic->unkC <= 4) {
            sonic->unkC = 1;
        } else {
            sonic->unkC -= 4;
        }

        if (++sonic->unk22 > 4) {
            s32 rnd;
            sonic->unk22 = 0;
            sonic->unk10 = (PseudoRandom32() % 0x1000u) - (0x800 - 1);
            sonic->unk14 = (PseudoRandom32() % 0x1000u) - (0x800 - 1);
        }
    }
}

void SuperSonicGetPos(s32 *outX, s32 *outY)
{
    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        *outX = sonic->unk4;
        *outY = sonic->unk8;

        if (!(sonic->flags & SUPER_FLAG__10)) {
            gPlayer.moveState = 0;
        } else {
            gPlayer.moveState = MOVESTATE_DEAD;
        }
    } else {
        *outX = 0;
        *outY = 0;

        gPlayer.moveState = MOVESTATE_DEAD;
    }
}

void SuperSonicSetPos(s32 x, s32 y)
{
    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

        if (!(sonic->flags & SUPER_FLAG__10)) {
            sonic->unk4 = x;
            sonic->unk8 = y;
        }
    }
}

u32 SuperSonicGetFlags()
{
    u32 result = 0;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        result = sonic->flags;
    }

    return result;
}

void sub_802C704(u8 index, s32 *outX, s32 *outY)
{
    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        s32 r1 = (sonic->unk128 - index) & 0x1F;

        *outX = sonic->unk28[r1].x;
        *outY = sonic->unk28[r1].y;
    }
}

Sprite *SuperSonicGetSprite(void)
{
    Sprite *spr = NULL;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        spr = &sonic->spr134;
    }

    return spr;
}

u16 SuperSonicGetRotation(void)
{
    u16 result = 0;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        result = sonic->rotation & 0x3FF;
    }

    return result;
}

void sub_802C798(void)
{
    struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);

    if ((ExtraBossIsDead() != TRUE) && !(sonic->flags & SUPER_FLAG__10)) {
        sonic->func24 = sub_802C92C;
        sonic->unkC = 20;
        sonic->rotation = 0;
        sonic->flags &= ~SUPER_FLAG__1;
        sonic->flags &= ~SUPER_FLAG__2;
        sonic->flags &= ~SUPER_FLAG__8;
        sonic->flags |= SUPER_FLAG__200;
        sonic->flags |= SUPER_FLAG__80;
    }
}

void Task_802C7E8(void)
{
    struct SuperSonic *sonic = TASK_DATA(gCurTask);

    sub_802BCCC(sonic);

    if (sonic->func24 != sub_802C8A0) {
        sonic->func24 = sub_802C8A0;
    }

    sonic->func24(sonic);
    sub_802C9B0(sonic);
    sub_802BE1C(sonic);
}

void sub_802C828(struct SuperSonic *sonic)
{
    s32 a, r4;

    if (!(gUnknown_03005424 & EXTRA_STATE__100)) {
        if (--sonic->unkC == 0) {
            sonic->func24 = sub_802C058;
            sonic->flags &= ~SUPER_FLAG__20;
            sonic->flags |= SUPER_FLAG__1;
        }
        // _0802C856
        a = Q_24_8(gCamera.x + 80);
        r4 = Q_24_8(gCamera.y + 90);
        sonic->unk4 += Div(((a - sonic->unk4) * 3), 100);

        r4 -= sonic->unk8;
        sonic->unk8 += Div((r4 * 3), 100);
    }
}

void sub_802C8A0(struct SuperSonic *sonic)
{
    s32 a, r4, divRes;
    sonic->flags &= ~SUPER_FLAG__4;

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
        sonic->flags |= SUPER_FLAG__40;
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
        sonic->flags &= ~SUPER_FLAG__40;
        sonic->flags &= ~SUPER_FLAG__200;
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