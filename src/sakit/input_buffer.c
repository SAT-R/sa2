#include "global.h"
#include "sakit/globals.h"
#include "sakit/input_buffer.h"
#include "sakit/player.h"

#include "constants/characters.h"

const u8 **gUnknown_08C871D4[NUM_CHARACTERS] = {
    unk_8C87198, unk_8C871A4, unk_8C871B0, unk_8C871BC, unk_8C871C8,
};

#if 00
// The current value in gNewInputCounters[gNewInputCountersIndex]
// gets increased until either it reaches 0xFF or a new button was pressed.
// Letting go of a button does not trigger the index increase.
// (This might be used for timing in multiplayer?)
//
// (79.02%) https://decomp.me/scratch/zFRhq
void sub_800DF8C(Player *p)
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
    strc *bytes;

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
                u8 cid = gNewInputCountersIndex;

                // _0800E012
                while (r6 != 0) {
                    s32 r1;
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

                    bytes = (strc *)&data[r6 * 3];
                    ip = bytes->unk0;
                    r7 = bytes->unk1;
                    r1 = bytes->unk2 & maskFF;

                    // _0800E02A
                    while (1) {
                        u32 r3 = gNewInputCounters[cid].unk0 & r7;
                        s32 r2 = gNewInputCounters[cid].unk1;

                        if ((s16)r1 < (r2 & maskFF))
                            break;

                        if (ip == r3) {
                            cid = (cid - 1) & mask1F;
                        } else {
                            cid = (cid - 1) & mask1F;
                            r1--;
                        }
                    }
                }

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
#endif
