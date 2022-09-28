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
    u8 fillerE2[6];
};

void sub_8089E54(void);
void sub_808A234(struct Task*);

void CreateBoostModeParticles(void) {
    s32 i;
    struct Task* t = TaskCreate(sub_8089E54, 0xE8, 0x5050, 0, sub_808A234);
    struct BoostModeParticles* particles = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240* element = &particles->unk0;

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

    SeedRng(gUnknown_030059E0.unk8, gUnknown_03005960.unk0);

    for (i = 0; i < 16; i++) {
        u8 temp1;
        s32 rand, var;
        particles->unk62[i][1] = (Random() & 0x7FF) + 0x1000;
        if (gUnknown_030059E0.unk20 & 1) {
#ifndef NON_MATCHING
            u32 z = (u32)gUnknown_030059E0.unk24 << 0x18;
            temp1 = (z + 0xC0000000) >> 0x18;
            asm("":::"memory");
#else
            temp1 = gUnknown_030059E0.unk24 + 0xC0;
#endif
            particles->unk62[i][0] = ((gSineTable[((gUnknown_030059E0.unk24 + 0x80) & 0xff) * 4 + 0x100] >> 6) * particles->unk62[i][1]) >> 8;
            particles->unk62[i][1] = ((gSineTable[((gUnknown_030059E0.unk24 + 0x80) & 0xff) * 4] >> 6) * particles->unk62[i][1]) >> 8;
            
        } else {
            temp1 = gUnknown_030059E0.unk24 + 0x40;
            particles->unk62[i][0] = ((gSineTable[(gUnknown_030059E0.unk24) * 4 + 0x100] >> 6) * particles->unk62[i][1]) >> 8;
            particles->unk62[i][1] = ((gSineTable[(gUnknown_030059E0.unk24) * 4] >> 6) * particles->unk62[i][1]) >> 8;
        }
#ifndef NON_MATCHING
        {
            register s32 ip asm("ip");
            rand = ((s32 (*)(void))Random)();
            ip = 0x3ff;
            particles->unkA2[i][0] = ((gSineTable[temp1 * 4 + 0x100] >> 6) * (var = (rand & ip) + 0x200)) >> 8;
            particles->unkA2[i][1] = ((gSineTable[temp1 * 4] >> 6) * var) >> 8;
        }
#else
        rand = Random();
        particles->unkA2[i][0] = ((gSineTable[temp1 * 4 + 0x100] >> 6) * (var = (rand & 0x3ff) + 0x200)) >> 8;
        particles->unkA2[i][1] = ((gSineTable[temp1 * 4] >> 6)  * var) >> 8;
#endif
    }
}
