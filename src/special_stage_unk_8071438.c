#include "main.h"
#include "sprite.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_unk_8071438.h"

extern const struct UNK_80DF670 gUnknown_080DF914[9];

extern const u32 gUnknown_080DF9A0[7][2];
extern const u16 gUnknown_080DF968[7][4];

void sub_8071380(struct UNK_0808B3FC_UNK240* element, void* vram, s16 a1, s16 a, u8 b, const struct UNK_80DF670* c4);
void sub_8071530(struct UNK_0808B3FC_UNK240* element, s16 a1, u32 a, u32 b, const struct UNK_80DF670* c4);

void sub_8070EFC(struct UNK_8071438* unk1438) {
    u8 level = unk1438->unk0->unk5B8;
    const struct UNK_80DF670* unkF914 = &gUnknown_080DF914[0];
    s16 result = sub_806CF44(unkF914);
    void* vramOld = gUnknown_03005B5C;

    unk1438->unk34 = gUnknown_03005B5C;
    gUnknown_03005B5C += result << 5;

    sub_8071380(&unk1438->unk4, vramOld, 0x78, 0x3C, 7, unkF914);
    unk1438->unk38 = unkF914;
    unk1438->unk3C = 1;

    unk1438->unk40 = gUnknown_080DF9A0[level][0];
    unk1438->unk44 = gUnknown_080DF9A0[level][1];

    unk1438->unk48 = gUnknown_080DF968[level][0];
    unk1438->unk4A = 0;
    unk1438->unk4E = gUnknown_080DF968[level][1];
    unk1438->unk50 = gUnknown_080DF968[level][2];
    unk1438->unk52 = gUnknown_080DF968[level][3];
    unk1438->unk54 = 0x3C;
}

void sub_8071478(void);
void sub_8070FA0(void) {
    struct UNK_806BD94_UNK874_2 unk874;
    struct UNK_806CB84 unkCBB4;
    u32 temp;
    u16* oam;
    s32 result;
    

    struct UNK_8071438* unk1438 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk1438->unk0;
    oam = &gOamBuffer[124].all.affineParam;
    
    if (stage->unk5BA == 0) {
        sub_8071478();
    }

    unk874.unk0 = unk1438->unk40;
    unk874.unk4 = unk1438->unk44;
    unk874.unk8 = 0;

    unk874.unkC = 0x20;
    unk874.unkE = 0x20;
    unk874.unk10 = 0;
    unk874.unk12 = 0x1D;

    result = sub_806CB84(&unkCBB4, &unk874, unk1438->unk0);
    if (result != 0) {
        u16 temp3;
        s32 temp4;
        
        *oam = unkCBB4.unkC;
        oam+=4;
        *oam = unkCBB4.unkE;
        oam+=4;
        *oam = unkCBB4.unk10;
        oam+=4;
        *oam = unkCBB4.unk12;

        temp3 = ((unk1438->unk48 - stage->unk5A0) + 0x40) & 0x3FF;
        temp4 = unkCBB4.unk4;
        if (temp4 < (stage->unk5CC - 0x3C)) {
            temp = 0xC;
        } else {
             temp = 5;
        }

        if (stage->unk5BA == 0) {
            const struct UNK_80DF670* unk38;
            sub_8071530(&unk1438->unk4, unkCBB4.unk2, temp4, temp, &unk1438->unk38[temp3 >> 0x7]);
        }

        if (unk1438->unk3C != 2 || !(unk1438->unk4C & 2) || stage->unk5BA != 0) {
            sub_80051E8(&unk1438->unk4);
        }
    }
}

// void sub_806D548(struct UNK_0808B3FC_UNK240* element, void* vram, s16 a, u8 b, const struct UNK_80DF670* c4) {
//     u32 unk10 = 0x1000;
//     if (c4->unk7 & 1) {
//         unk10 |= 0x400;
//     }

//     if (c4->unk7 & 2) {
//         unk10 |= 0x800;
//     }

//     element->unk4 = vram;
//     element->unk8 = 0;
//     element->unkA = c4->unk0;
//     element->unk10 = unk10;
//     element->unk16 = 0x78;
//     element->unk18 = a;
//     element->unk1A = b << 6;
//     element->unk1C = 0;
//     element->unk1E = 0xffff;
//     element->unk20 = c4->unk2;
//     element->unk21 = 0xff;
//     element->unk22 = c4->unk6;
//     element->unk25 = 0;
//     element->unk28 = -1;
//     sub_8004558(element);
// }
