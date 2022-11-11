#include "main.h"
#include "game.h"
#include "unknown_effect.h"
#include "m4a.h"
#include "constants/songs.h"

struct UnknownEffect87028 {
    u8 unk0;
} /* size 0x4 */;

extern u32 sub_800CBA4(struct SomeStruct_59E0 *);

void sub_80871C4(s16, s16, s16);

void sub_8087088(void);
void sub_80870E8(void);

void sub_8087028(void)
{
    s16 a = (gPlayer.unk8 >> 8) - gUnknown_03005960.unk0;
    s16 b = (gPlayer.unkC >> 8) - gUnknown_03005960.unk4;
    struct UnknownEffect87028 *effect = TaskGetStructPtr(gCurTask);

    sub_80871C4(a, b, 0xA0 - effect->unk0);

    effect->unk0 += 4;
    if (effect->unk0 > 0x32) {
        gCurTask->main = sub_8087088;
    }
}

void sub_8087088(void)
{
    s16 a = (gPlayer.unk8 >> 8) - gUnknown_03005960.unk0;
    s16 b = (gPlayer.unkC >> 8) - gUnknown_03005960.unk4;
    struct UnknownEffect87028 *effect = TaskGetStructPtr(gCurTask);

    sub_80871C4(a, b, 0x6E);

    effect->unk0 += 1;
    if (effect->unk0 > 0x78) {
        effect->unk0 = 0x32;
        gCurTask->main = sub_80870E8;
    }
}

const s8 gUnknown_080E02DC[8][2] = {
    { 0, 0 },   { 3, -1 }, { -2, -4 }, { 0, 3 },
    { -4, -2 }, { 3, -4 }, { 1, 3 },   { -2, 2 },
};

void sub_80870E8(void)
{
    s16 a = (gPlayer.unk8 >> 8) - gUnknown_03005960.unk0;
    s16 b = (gPlayer.unkC >> 8) - gUnknown_03005960.unk4;
    struct UnknownEffect87028 *effect = TaskGetStructPtr(gCurTask);

    sub_80871C4(a + gUnknown_080E02DC[effect->unk0 & 7][0],
                b + gUnknown_080E02DC[effect->unk0 & 7][1], 0xA0 - effect->unk0);

    gBldRegs.bldY = (effect->unk0 >> 4) + 4;

    effect->unk0 += 1;
    if (effect->unk0 > 0xA0) {
        if (!(gPlayer.unk20 & 0x40600000) && !(gPlayer.unk37 & 0x82)
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

    u8 *unk1884 = gUnknown_03001884;
    gUnknown_03002A80 = 2;
    gUnknown_03002878 = (void *)REG_ADDR_WIN0H;

    gFlags |= 0x4;

    d = b - c;
    f = (b + c);
    e = 0;
    if (d < 0) {
        e = d * -1;
    }

    for (i = 0; i <= 0x9F; i++) {
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

void sub_80873EC(struct Task *);
void sub_80873A4(void);

void sub_8087368(void)
{
    struct Task *t = TaskCreate(sub_8087028, sizeof(struct UnknownEffect87028), 0x8000,
                                0, sub_80873EC);
    struct UnknownEffect87028 *effect = TaskGetStructPtr(t);
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
    gWinRegs[0] = 0xF0;
    gWinRegs[2] = 0xA0;
}

void sub_80873EC(UNUSED struct Task *t) { gFlags &= ~0x4; }
