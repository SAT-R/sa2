#include "core.h"
#include "trig.h"
#include "sakit/globals.h"
#include "sakit/camera.h"
#include "sakit/player.h"
#include "game/bosses/boss_9.h"
#include "game/player_super_sonic.h"
#include "lib/m4a.h"

#include "constants/move_states.h"
#include "constants/songs.h"

struct Task *sSuperSonicTask = NULL;

extern const TileInfo gAnims_SuperSonic_080D69C8[23];

bool32 sub_802BA8C();
void sub_802BE1C(struct SuperSonic *sonic);
void sub_802C358(struct SuperSonic *sonic);
void sub_802C8A0(struct SuperSonic *sonic);
void sub_802C92C(struct SuperSonic *sonic);
void sub_802C9B0(struct SuperSonic *sonic);
void sub_802BCCC(struct SuperSonic *sonic);
u8 SuperSonicHandleDirectionalInput(struct SuperSonic *sonic);
void sub_802C058(struct SuperSonic *sonic);
void sub_802C988(struct SuperSonic *sonic);

void sub_802BE1C(struct SuperSonic *sonic)
{
    u8 i;
    s32 r2;
    u8 *unk128;
    Sprite *spr;
    SpriteTransform *transform;

    if (sonic->flags & SUPER_FLAG__40) {
        return;
    }

    if (((sonic->flags & (SUPER_FLAG__80 | SUPER_FLAG__2)) == SUPER_FLAG__80)
        && (gStageTime & 0x4)) {
        return;
    }
    if ((sonic->flags & SUPER_FLAG__4) && ((gStageTime & 0x4) != 0)) {
        return;
    }

    spr = &sonic->spr;
    transform = &sonic->transform;

    spr->x = Q_24_8_TO_INT(sonic->x) - gCamera.x + Q_24_8_TO_INT(sonic->unk10);
    spr->y = Q_24_8_TO_INT(sonic->y) - gCamera.y + Q_24_8_TO_INT(sonic->unk14);

    r2 = (sonic->flags & SUPER_FLAG__200) ? 3 : 0;

    if (sonic->flags & 0x4) {
        spr->unk10 = (r2 << 12) | gUnknown_030054B8++ | 0x60;
    } else {
        spr->unk10 = (r2 << 12) | 0x400;
    }
    UpdateSpriteAnimation(spr);

    if (sonic->flags & SUPER_FLAG__4) {
        transform->rotation = (COS((sonic->unkC * 20) & ONE_CYCLE) >> 4) & ONE_CYCLE;
        transform->width = Q_24_8(1.0);
        transform->height = Q_24_8(1.0);
        transform->x = spr->x;
        transform->y = spr->y;
        sub_8004860(spr, transform);
        DisplaySprite(spr);
    } else {
        // _0802BF24
        DisplaySprite(spr);
        if (((sonic->flags & (SUPER_FLAG__80 | SUPER_FLAG__2)) == SUPER_FLAG__80)) {
            return;
        }

        if (sonic->flags & (SUPER_FLAG__200 | SUPER_FLAG__10 | SUPER_FLAG__8)) {
            return;
        }

        i = 0;
        unk128 = &sonic->unk128;
        for (; i < SUPER_SONIC_AFTERIMAGE_COUNT; i++) {
            if (Mod(gStageTime, i + 2) == 0) {
                s32 ii = (i + 1) * 3;
                u32 r2 = *unk128 - ii;
                r2 &= 0x1F;
                spr->x = Q_24_8_TO_INT(sonic->unk28[r2].x) - gCamera.x;
                spr->y = Q_24_8_TO_INT(sonic->unk28[r2].y) - gCamera.y;
                DisplaySprite(spr);
            }
        }
    }
}

u8 SuperSonicHandleDirectionalInput(struct SuperSonic *sonic)
{
    sonic->rawKeys = gInput;
    sonic->pressedKeys = gPressedKeys;

    if (sonic->rawKeys & DPAD_LEFT) {
        if (sonic->rawKeys & DPAD_UP) {
            sonic->rotation = Q_24_8(2.5);
            return 16;
        } else if (sonic->rawKeys & DPAD_DOWN) {
            sonic->rotation = Q_24_8(1.5);
            return 12;
        } else {
            sonic->rotation = Q_24_8(2.0);
            return 6;
        }
    } else if (sonic->rawKeys & DPAD_RIGHT) {
        if (sonic->rawKeys & DPAD_UP) {
            sonic->rotation = Q_24_8(3.5);
            return 18;
        } else if (sonic->rawKeys & DPAD_DOWN) {
            sonic->rotation = Q_24_8(0.5);
            return 14;
        } else {
            sonic->rotation = Q_24_8(0.0);
            return 4;
        }
    } else if (sonic->rawKeys & DPAD_UP) {
        sonic->rotation = Q_24_8(3.0);
        return 8;
    } else if (!(sonic->rawKeys & DPAD_DOWN)) {
        return 0;
    } else {
        sonic->rotation = Q_24_8(1.0);
        return 10;
    }
}

void sub_802C058(struct SuperSonic *sonic)
{
    u32 dir;
    Sprite *spr = &sonic->spr;
    spr->hitboxes[1].index = -1;
    dir = SuperSonicHandleDirectionalInput(sonic);
    if (dir) {
        sonic->unk1A = ABS(sonic->unk1A);
        sonic->unk1A += 0x40;

        if (sonic->unk1A > Q_24_8(2.5)) {
            sonic->unk1A = Q_24_8(2.5);
        }

        if (sonic->rawKeys & DPAD_UP) {
            if (sonic->spr.variant != 1) {
                SUPER_SWITCH_ANIM(sonic, 1);
            }
        } else if (sonic->rawKeys & DPAD_DOWN) {
            if (sonic->spr.variant != 3) {
                SUPER_SWITCH_ANIM(sonic, 2);
            }
        } else {
            if (sonic->spr.variant != 2) {
                SUPER_SWITCH_ANIM(sonic, 0);
            }
        }
    } else {
        if (sonic->unk1A < 0) {
            sonic->unk1A += 0x40;
            if (sonic->unk1A >= 0) {
                sonic->unk1A = 0;
                sonic->rotation = 0;
            }
        } else if (sonic->unk1A > 0) {
            sonic->unk1A -= 0x40;
            if (sonic->unk1A <= 0) {
                sonic->unk1A = 0;
                sonic->rotation = 0;
            }
        }

        if (sonic->spr.variant != 2) {
            SUPER_SWITCH_ANIM(sonic, 0);
        }
        sonic->x -= Q_24_8(0.5);
    }

    if (sonic->pressedKeys & (A_BUTTON | B_BUTTON)) {
        sonic->func24 = sub_802C358;
        sonic->unkC = 20;
        sonic->flags &= ~SUPER_FLAG__1;
        sonic->flags |= (SUPER_FLAG__80 | SUPER_FLAG__2);
        m4aSongNumStart(SE_SONIC_MIDAIR_SOMERSAULT);

        if (dir != 0) {
            SUPER_SWITCH_ANIM(sonic, dir);
        } else {
            sonic->rotation = 0;

            SUPER_SWITCH_ANIM(sonic, 4);
        }
    }

    sonic->x += (COS(sonic->rotation) * sonic->unk1A) >> 14;
    sonic->y += (SIN(sonic->rotation) * sonic->unk1A) >> 14;
}

void sub_802C358(struct SuperSonic *sonic)
{
    Sprite *spr;
    if (--sonic->unkC == 0) {
        spr = &sonic->spr;
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__2;
        sonic->flags |= SUPER_FLAG__1;
        spr->hitboxes[1].index = -1;

        SUPER_SWITCH_ANIM(sonic, 0);
    }

    if (sonic->unkC == 8) {
        sonic->spr.graphics.anim
            = gAnims_SuperSonic_080D69C8[sonic->tileInfoId + 1].anim;
        sonic->spr.variant = gAnims_SuperSonic_080D69C8[sonic->tileInfoId + 1].variant;
        sonic->spr.prevVariant = -1;
        sonic->flags &= ~SUPER_FLAG__80;
    } else if (sonic->unkC > 8) {
        sonic->flags |= SUPER_FLAG__80;
    }

    sonic->unk1A = (SIN(sonic->unkC * 12) * 3) >> 5;
    sonic->x += (COS(sonic->rotation) * sonic->unk1A) >> 14;
    sonic->y += (SIN(sonic->rotation) * sonic->unk1A) >> 14;
}

void sub_802C480(struct SuperSonic *sonic)
{
    Sprite *spr;
    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__4;
        sonic->flags |= SUPER_FLAG__1;

        SUPER_SWITCH_ANIM(sonic, 0);
    }

    spr = &sonic->spr;
    spr->hitboxes[0].index = -1;
    spr->hitboxes[1].index = -1;

    sonic->unk1A = (SIN(sonic->unkC * 5) * 3) >> 5;
    sonic->x += (COS(sonic->rotation) * sonic->unk1A) >> 14;
    sonic->y += (SIN(sonic->rotation) * sonic->unk1A) >> 14;
}

void sub_802C55C(struct SuperSonic *sonic)
{
    SuperSonicHandleDirectionalInput(sonic);

#ifndef NON_MATCHING
    sonic->unk10 = -((sonic->unk10 * 55) << 1) >> 7;
    sonic->unk14 = -((sonic->unk14 * 55) << 1) >> 7;
#else
    sonic->unk10 = -(sonic->unk10 * 110) / 128;
    sonic->unk14 = -(sonic->unk14 * 110) / 128;
#endif

    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C058;
        sonic->flags &= ~SUPER_FLAG__8;
        sonic->flags |= SUPER_FLAG__1;

        SUPER_SWITCH_ANIM(sonic, 0);
    } else if (sonic->pressedKeys & (DPAD_ANY | A_BUTTON | B_BUTTON)) {
        if (sonic->unkC <= 4) {
            sonic->unkC = 1;
        } else {
            sonic->unkC -= 4;
        }

        if (++sonic->unk22 > 4) {
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
        *outX = sonic->x;
        *outY = sonic->y;

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
            sonic->x = x;
            sonic->y = y;
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
        spr = &sonic->spr;
    }

    return spr;
}

u16 SuperSonicGetRotation(void)
{
    u16 result = 0;

    if (sSuperSonicTask) {
        struct SuperSonic *sonic = TASK_DATA(sSuperSonicTask);
        result = sonic->rotation & ONE_CYCLE;
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
        sonic->x += Div(((a - sonic->x) * 3), 100);

        r4 -= sonic->y;
        sonic->y += Div((r4 * 3), 100);
    }
}

void sub_802C8A0(struct SuperSonic *sonic)
{
    s32 a, r4, divRes;
    sonic->flags &= ~SUPER_FLAG__4;

    a = Q_24_8(gCamera.x + (DISPLAY_WIDTH + 76));
    r4 = Q_24_8(gCamera.y + (DISPLAY_HEIGHT / 2));
    divRes = Div(a - sonic->x, 100);

    sonic->x += divRes;

    r4 -= sonic->y;
    sonic->y += Div(r4, 100);
}

void sub_802C8EC(struct SuperSonic *sonic)
{
    Sprite *spr = &sonic->spr;
    spr->unk10 = SPRITE_FLAG(PRIORITY, 2);

    sonic->unk1A += 0x20;
    sonic->y += sonic->unk1A;

    if ((Q_24_8_TO_INT(sonic->y) - gCamera.y) > DISPLAY_HEIGHT) {
        sonic->unk129 = TRUE;
    }
}

void sub_802C92C(struct SuperSonic *sonic)
{
    s32 v, w;
    if (--sonic->unkC == 0) {
        sonic->func24 = sub_802C988;
        sonic->flags |= 0x40;
        sonic->unkC = 100;
    }

    sonic->unk1A = Q_24_8(1.0);
    sonic->x += Q_24_8_TO_INT(COS(sonic->rotation) * 4);
    sonic->y += Q_24_8_TO_INT(SIN(sonic->rotation) * 4);
}

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
        CLAMP_INLINE_NO_ELSE(sonic->y, Q_24_8(50), Q_24_8(254));
#else
        CLAMP_INLINE(sonic->y, Q_24_8(50), Q_24_8(254));
#endif
    }
}

bool32 sub_802C9E0(void) { return FALSE; }