#include "global.h"
#include "main.h"
#include "game.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"
#include "random.h"
#include "trig.h"

struct BoostModeParticles {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30;
    u16 unk60;
    s16 unk62[16][2];
    s16 unkA2[16][2];
    s16 unkE2;
    s16 unkE4;
    u16 fillerE6;
};

void sub_8089E54(void);
void sub_808A234(struct Task *);

void CreateBoostModeParticles(void)
{
    s32 i;
    struct Task *t = TaskCreate(sub_8089E54, 0xE8, 0x5050, 0, sub_808A234);
    struct BoostModeParticles *particles = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *element = &particles->unk0;

    particles->unk60 = 0;
    element->unk4 = VramMalloc(1);
    element->unkA = 0x369;
    element->unk20 = 0;
    element->unk8 = 0;
    element->unk21 = 0xFF;
    element->unk1A = 0x200;
    element->unk10 = 0x2000;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    sub_8004558(element);

    element = &particles->unk30;
    element->unk4 = VramMalloc(1);
    element->unkA = 0x369;
    element->unk20 = 1;
    element->unk8 = 0;
    element->unk21 = 0xFF;
    element->unk1A = 0x200;
    element->unk10 = 0x2000;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;

    SeedRng(gPlayer.unk8, gCamera.unk0);

    for (i = 0; i < 16; i++) {
        u8 temp1;
        s32 rand, var;
        particles->unk62[i][1] = (Random() & 0x7FF) + 0x1000;
        if (gPlayer.unk20 & 1) {
#ifndef NON_MATCHING
            u32 z = (u32)gPlayer.unk24 << 0x18;
            temp1 = (z + 0xC0000000) >> 0x18;
            asm("" ::: "memory");
#else
            temp1 = gPlayer.unk24 + 0xC0;
#endif
            particles->unk62[i][0]
                = ((gSineTable[((gPlayer.unk24 + 0x80) & 0xff) * 4 + 0x100] >> 6)
                   * particles->unk62[i][1])
                >> 8;
            particles->unk62[i][1]
                = ((gSineTable[((gPlayer.unk24 + 0x80) & 0xff) * 4] >> 6)
                   * particles->unk62[i][1])
                >> 8;

        } else {
            temp1 = gPlayer.unk24 + 0x40;
            particles->unk62[i][0] = ((gSineTable[(gPlayer.unk24) * 4 + 0x100] >> 6)
                                      * particles->unk62[i][1])
                >> 8;
            particles->unk62[i][1]
                = ((gSineTable[(gPlayer.unk24) * 4] >> 6) * particles->unk62[i][1]) >> 8;
        }
#ifndef NON_MATCHING
        {
            register s32 ip asm("ip");
            rand = ((s32(*)(void))Random)();
            ip = 0x3ff;
            particles->unkA2[i][0]
                = ((gSineTable[temp1 * 4 + 0x100] >> 6) * (var = (rand & ip) + 0x200))
                >> 8;
            particles->unkA2[i][1] = ((gSineTable[temp1 * 4] >> 6) * var) >> 8;
        }
#else
        rand = Random();
        particles->unkA2[i][0]
            = ((gSineTable[temp1 * 4 + 0x100] >> 6) * (var = (rand & 0x3ff) + 0x200))
            >> 8;
        particles->unkA2[i][1] = ((gSineTable[temp1 * 4] >> 6) * var) >> 8;
#endif
    }
}

void sub_808A0A4(void);

void sub_8089E54(void)
{
    s32 i;
    struct BoostModeParticles *particles = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element;
    sub_8004558(&particles->unk0);

    for (i = 0; i < 8; i++) {
        if (i & 1) {
            particles->unk62[i][0] += particles->unkA2[i][0];
            particles->unk62[i][1] += particles->unkA2[i][1];
        } else {
            particles->unk62[i][0] -= particles->unkA2[i][0];
            particles->unk62[i][1] -= particles->unkA2[i][1];
        }

        particles->unkA2[i][0] = (particles->unkA2[i][0] * 200) >> 8;
        particles->unkA2[i][1] = (particles->unkA2[i][1] * 200) >> 8;
        element = &particles->unk0;
        element->unk16
            = (gPlayer.unk8 >> 8) - gCamera.unk0 + (particles->unk62[i][0] >> 8);
        element->unk18
            = (gPlayer.unkC >> 8) - gCamera.unk4 + (particles->unk62[i][1] >> 8);
        sub_80051E8(element);
    }

    if (particles->unk60++ > 8) {
        element->unk20 = 1;
        SeedRng(gPlayer.unk8, gCamera.unk0);

        for (i = 0; i < 16; i++) {
            u8 temp;
            s16 rand;
            particles->unkE2 = 0x80;
            particles->unkE4 = 0;
            if (gPlayer.unk20 & 1) {
                temp = Random();
                temp += 64;
                particles->unkE2
                    = (gSineTable[((gPlayer.unk24 + 0x80) & 0xFF) * 4 + 0x100] >> 6)
                    << 2;
                particles->unkE4 = (gSineTable[((gPlayer.unk24 + 0x80) & 0xFF) * 4] >> 6)
                    << 2;
            } else {
                temp = Random();
                particles->unkE2 = (gSineTable[(gPlayer.unk24 * 4) + 0x100] >> 6) << 2;
                particles->unkE4 = (gSineTable[gPlayer.unk24 * 4] >> 6) << 2;
            }

            rand = (Random() & 0x3FF);
            particles->unkA2[i][0]
                = ((gSineTable[temp * 4 + 0x100] >> 6) * (rand + 0x600)) >> 8;
            particles->unkA2[i][1] = ((rand + 0x600) * (gSineTable[temp * 4] >> 6)) >> 8;
        }

        gCurTask->main = sub_808A0A4;
    }
}

void sub_808A0A4(void)
{
    s32 i;
    struct BoostModeParticles *particles = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element = &particles->unk0;

    if (particles->unk60++ > 0x18) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < 16; i++) {
        particles->unk62[i][0] += particles->unkA2[i][0];
        particles->unk62[i][1] += particles->unkA2[i][1];

        particles->unk62[i][0] -= particles->unkE2;
        particles->unk62[i][1] -= particles->unkE4;

        particles->unkA2[i][0] = (particles->unkA2[i][0] * 200) >> 8;
        particles->unkA2[i][1] = (particles->unkA2[i][1] * 200) >> 8;

        particles->unkE2 = (particles->unkE2 * 0x101) >> 8;
        particles->unkE4 = (particles->unkE4 * 0x101) >> 8;
    }

    for (i = 0; i < 8; i++) {
        element = &particles->unk0;
        if (particles->unk60 & 1) {
            element->unk16
                = ((gPlayer.unk8 >> 8) - gCamera.unk0) + (particles->unk62[i][0] >> 8);
            element->unk18
                = ((gPlayer.unkC >> 8) - gCamera.unk4) + (particles->unk62[i][1] >> 8);
            sub_8004558(element);

        } else {
            element->unk16 = ((gPlayer.unk8 >> 8) - gCamera.unk0)
                + (particles->unk62[i + 8][0] >> 8);
            element->unk18 = ((gPlayer.unkC >> 8) - gCamera.unk4)
                + (particles->unk62[i + 8][1] >> 8);
        }
        sub_80051E8(element);
    }
}

void sub_808A234(struct Task *t)
{
    struct BoostModeParticles *particles = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *element = &particles->unk0;
    VramFree(element->unk4);
    element++;
    VramFree(element->unk4);
}
