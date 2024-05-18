#include "global.h"
#include "sakit/globals.h"
#include "sakit/input_buffer.h"
#include "sakit/player.h"

#include "constants/characters.h"

// TODO(Jace): gUnknown_080D5254 is used in sakit/music_manager.c, with a different type.
//             That doesn't make any sense...
// const u8 gUnknown_080D5254[] = { 0x04, 0x01, 0x00, 0xF0, 0x08, 0x10, 0xF0, 0x08, 0x00,
// 0xF0, 0x08, 0x10, 0xF0, 0x01 };
extern const u8 gUnknown_080D5254[];
const u8 gUnknown_080D5262[] = { 0x04, 0x01, 0x00, 0xF0, 0x08, 0x20, 0xF0,
                                 0x08, 0x00, 0xF0, 0x08, 0x20, 0xF0, 0x01 };
const u8 gUnknown_080D5270[] = { 0x04, 0x01, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D527E[] = { 0x04, 0x02, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D528C[] = { 0x04, 0x01, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D529A[] = { 0x04, 0x02, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D52A8[] = { 0x04, 0x01, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D52B6[] = { 0x04, 0x02, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D52C4[] = { 0x04, 0x01, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };
const u8 gUnknown_080D52D2[] = { 0x04, 0x02, 0x10, 0xF0, 0x0F, 0x00, 0xF0,
                                 0x0F, 0x10, 0xF0, 0x0F, 0x03, 0x07, 0x0F };

const u8 *gUnknown_08c87098_unused[64] = { 0 };

const u8 *unk_8C87198[3] = { gUnknown_080D5254, gUnknown_080D5262, INPUTBUF_NULL_PTR };

const u8 *unk_8C871A4[3] = { gUnknown_080D5270, gUnknown_080D527E, INPUTBUF_NULL_PTR };

const u8 *unk_8C871B0[3] = { gUnknown_080D528C, gUnknown_080D529A, INPUTBUF_NULL_PTR };

const u8 *unk_8C871BC[3] = { gUnknown_080D52A8, gUnknown_080D52B6, INPUTBUF_NULL_PTR };

const u8 *unk_8C871C8[3] = { gUnknown_080D52C4, gUnknown_080D52D2, INPUTBUF_NULL_PTR };

const u8 **gUnknown_08C871D4[NUM_CHARACTERS] = {
    unk_8C87198, unk_8C871A4, unk_8C871B0, unk_8C871BC, unk_8C871C8,
};

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
} StrcUnkInBuf;

// The current value in gNewInputCounters[gNewInputCountersIndex]
// gets increased until either it reaches 0xFF or a new button was pressed.
// Letting go of a button does not trigger the index increase.
// (This might be used for timing in multiplayer?)
//
// (91%) https://decomp.me/scratch/zFRhq
NONMATCH("asm/non_matching/sakit/input_buf__sub_800DF8C.inc",
         void sub_800DF8C(Player *p))
{
    struct struc_800DF8C sp00;
#ifndef NON_MATCHING
    register u32 r6 asm("r6");
    register u32 r8 asm("r8");
#else
    u32 r6;
    u32 r8;
#endif
    const u8 *data;
    StrcUnkInBuf *bytes;

    if (p->moveState & (MOVESTATE_IGNORE_INPUT | MOVESTATE_DEAD)) {
        sub_800E0C0(0, 0);
        return;
    }
    // _0800DFB4

    sub_800E0C0(p->unk5E, p->unk5E);

    if (p->unk70 != 0) {
        sp00.unk4 = 0;
        sp00.unk0 = gUnknown_08C871D4[p->character];

        data = *sp00.unk0;
        if (data != INPUTBUF_NULL_PTR) {
            // __0800DFEC
            r6 = *data++;
            r8 = *data++;

            // _0800E002
            while (p->unk71 != r8) {
                u8 cid;
                sp00.unk8 = &p->unk71;
                cid = gNewInputCountersIndex;

                // _0800E012
                while (r6 != 0) {
                    s16 r1;
                    u32 r7, ip;

#ifndef NON_MATCHING
                    register u32 maskFF asm("sl") = 0xFF;
                    register u32 mask1F asm("r9") = 0x1F;
                    register u32 r0_2 asm("r0") = r6 - 1;
                    asm("" ::"r"(mask1F));
                    asm("" ::"r"(maskFF));
#else
                    u32 maskFF = 0xFF;
                    u32 mask1F = 0x1F;
                    u32 r0_2 = r6 - 1;
#endif
                    r6 = (u16)r0_2;

                    bytes = (StrcUnkInBuf *)&data[r6 * 3];
                    ip = bytes->unk0;
                    r7 = bytes->unk1;
                    r1 = bytes->unk2 & maskFF;

                    // _0800E02A
                    while (1) {
                        u32 r3 = gNewInputCounters[cid].unk0 & r7;
                        s32 r2 = gNewInputCounters[cid].unk1;

                        if ((s16)r1 >= (signed)(r2 & maskFF)) {
                            if (ip == r3) {
                                cid = (cid - 1) & mask1F;
                                break;
                            } else {
                                cid = (cid - 1) & mask1F;
                                r1 = (r1 - 1) - r6;
                            }
                        } else {
                            // r2 should be set to 0 here, actually
                            r6 = 0;
                            break;
                        }
                    }
                }
            lbl:

                if (r6 == 0) {
                    *sp00.unk8 = r8;
                    break;
                }

                // _0800E082
                sp00.unk4 = (u16)(sp00.unk4 + 1);

                if (sp00.unk0[sp00.unk4] == INPUTBUF_NULL_PTR) {
                    break;
                }

                r6 = *data++;
                r8 = *data++;
            }
        }
    }
}
END_NONMATCH

// (100.00%) https://decomp.me/scratch/WjLUa
void sub_800E0C0(u16 param0, u16 param1)
{
    u32 r3 = param1 % 4u;
    u16 r2 = ((param1 & 0x100) >> 6);
    u32 r5;

    r3 |= r2;
    param1 = 0xF0;
    asm("" ::"r"(param1));
    r5 = param0;
    r5 &= param1;
    r5 = (r5) | r3;
    gUnknown_030055D8 = (gUnknown_030055D8 + 1) % 4u;
    gUnknown_030055D0[gUnknown_030055D8] = r5;
    r5 |= gUnknown_030055D0[(gUnknown_030055D8 - 1) % 4u];
    r5 |= gUnknown_030055D0[(gUnknown_030055D8 - 2) % 4u];
    r5 &= param0;

#ifndef NON_MATCHING
    asm("lsl r0, %0, #24\n"
        "lsr %0, r0, #24\n"
        : "=r"(r5)
        : "r"(r5));
#endif

    if ((gNewInputCounters[gNewInputCountersIndex].unk0 == r5)
        && (gNewInputCounters[gNewInputCountersIndex].unk1 != 0xFF)) {
        gNewInputCounters[gNewInputCountersIndex].unk1++;
    } else {
        gNewInputCountersIndex = (gNewInputCountersIndex + 1) % 32u;
        gNewInputCounters[gNewInputCountersIndex].unk0 = r5;
        gNewInputCounters[gNewInputCountersIndex].unk1 = 0;
    }
}

void InitNewInputCounters()
{
    gNewInputCountersIndex = 0;
    DmaFill32(3, 0, gNewInputCounters, sizeof(gNewInputCounters) - 4);
}
