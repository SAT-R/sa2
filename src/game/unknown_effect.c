#include "core.h"
#include "game/game.h"
#include "sakit/collision.h"
#include "game/unknown_effect.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "lib/m4a.h"

#include "constants/songs.h"

struct UnknownEffect87028 {
    /* 0x00 */ u8 unk0;
} /* size 0x4 */;

void sub_80871C4(s16, s16, s16);

void sub_8087088(void);
void sub_80870E8(void);

s32 ALIGNED(8) gUnused_03005B78 = 0;
u8 gUnknown_03005B7C = 0;

void Task_UnknownEffect(void)
{
    s16 a = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    s16 b = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    struct UnknownEffect87028 *effect = TASK_DATA(gCurTask);

    sub_80871C4(a, b, DISPLAY_HEIGHT - effect->unk0);

    effect->unk0 += 4;
    if (effect->unk0 > 0x32) {
        gCurTask->main = sub_8087088;
    }
}

void sub_8087088(void)
{
    s16 a = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    s16 b = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    struct UnknownEffect87028 *effect = TASK_DATA(gCurTask);

    sub_80871C4(a, b, 0x6E);

    effect->unk0 += 1;
    if (effect->unk0 > 120) {
        effect->unk0 = 50;
        gCurTask->main = sub_80870E8;
    }
}

static const ALIGNED(4) s8 gUnknown_080E02DC[8][2] = {
    { 0, 0 },   { 3, -1 }, { -2, -4 }, { 0, 3 },
    { -4, -2 }, { 3, -4 }, { 1, 3 },   { -2, 2 },
};

void sub_80870E8(void)
{
    s16 a = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    s16 b = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    struct UnknownEffect87028 *effect = TASK_DATA(gCurTask);

    sub_80871C4(a + gUnknown_080E02DC[effect->unk0 & 7][0],
                b + gUnknown_080E02DC[effect->unk0 & 7][1], 160 - effect->unk0);

    gBldRegs.bldY = (effect->unk0 >> 4) + 4;

    effect->unk0 += 1;
    if (effect->unk0 > 160) {
        if (!(gPlayer.moveState
              & (MOVESTATE_IN_SCRIPTED | MOVESTATE_400000 | MOVESTATE_IGNORE_INPUT))
            && !(gPlayer.itemEffect
                 & (PLAYER_ITEM_EFFECT__INVINCIBILITY | PLAYER_ITEM_EFFECT__80))
            && sub_800CBA4(&gPlayer) != 0) {
            m4aSongNumStart(SE_SPIKES);
        }
        gBldRegs.bldY = 0;
        gDispCnt &= ~0x2000;
        TaskDestroy(gCurTask);
    }
}

void sub_80871C4(s16 a, s16 b, s16 c)
{
    s16 d;
    s16 e;
    s16 f;
    s16 g;
    u8 i;

    u8 *unk1884 = gBgOffsetsHBlank;
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN0H;

    gFlags |= 0x4;

    d = b - c;
    f = (b + c);
    e = 0;
    if (d < 0) {
        e = d * -1;
    }

    for (i = 0; i < 160; i++) {
        u16 temp;
        if (i >= d && i < f) {
            if (i < b) {
                g = a + e;
                temp = g - 1;

                if (temp < 0xEF) {
                    *unk1884++ = g;
                } else if (g < 1) {
                    *unk1884++ = 0;
                } else {
                    *unk1884++ = 0xEF;
                }

                g = a - e;
                temp = g - 1;
                if (temp < 0xEF) {
                    *unk1884++ = g;
                } else if (g > 0xEF) {
                    *unk1884++ = 0xEF;
                } else {
                    *unk1884++ = 0;
                }

                if (e < 0xF0) {
                    e++;
                }
            } else {
                g = e + a;
                temp = g - 1;
                if (temp < 0xEF) {
                    *unk1884++ = g;
                } else if (g < 1) {
                    *unk1884++ = 0;
                } else {
                    *unk1884++ = 0xEF;
                }

                g = a - e;
                temp = g - 1;
                if (temp < 0xEF) {
                    *unk1884++ = g;
                } else if (g > 0xEF) {
                    *unk1884++ = 0xEF;
                } else {
                    *unk1884++ = 0;
                }

                if (e > 0) {
                    e--;
                }
            }
        } else {
            *unk1884++ = 0;
            *unk1884++ = 0;
        }
    }
}

void TaskDestructor_UnknownEffect(struct Task *);
void sub_80873A4(void);

void sub_8087368(void)
{
    struct Task *t = TaskCreate(Task_UnknownEffect, sizeof(struct UnknownEffect87028),
                                0x8000, 0, TaskDestructor_UnknownEffect);
    struct UnknownEffect87028 *effect = TASK_DATA(t);
    effect->unk0 = 0;
    sub_80873A4();
    m4aSongNumStart(SE_219);
}

void sub_80873A4(void)
{
    gWinRegs[4] = 0x1F;
    gWinRegs[5] |= 0x3F;
    gBldRegs.bldCnt = 0x3FBF;
    gBldRegs.bldY = 4;
    gDispCnt |= DISPCNT_WIN0_ON;
    gWinRegs[0] = WIN_RANGE(0, DISPLAY_WIDTH);
    gWinRegs[2] = WIN_RANGE(0, DISPLAY_HEIGHT);
}

void TaskDestructor_UnknownEffect(UNUSED struct Task *t) { gFlags &= ~0x4; }
