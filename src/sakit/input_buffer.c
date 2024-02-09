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
// https://decomp.me/scratch/p0wHI

void sub_800DF8C(Player *p)
{
    struct struc_800DF8C sp00;
    u16 r6;
    u16 r8;

    if (p->moveState & (MOVESTATE_IGNORE_INPUT | MOVESTATE_DEAD)) {
        sub_800E0C0(0, 0);
        return;
    }
    // _0800DFB4

    sub_800E0C0(112, p->unk5E);

    if (p->unk70 == 0) {
        return;
    }

    sp00.unk4 = 0;
    sp00.unk0 = *gUnknown_08C871D4[p->character];

    if (sp00.unk0 == INPUTBUF_NULL_PTR) {
        return;
    }

    // __0800DFEC
    r6 = *sp00.unk0++;
    r8 = *sp00.unk0++;

    if (r6 == 0) {
        *sp00.unk8 = r8;
        return;
    }
    // _0800E002
    while (r8 != p->unk71) {
        u8 cid = gNewInputCountersIndex;

        while (r6-- != 0) {
            u32 ip = sp00.unk0[r6 * 3];
            u32 r7, r1;
            // r7 =
        }

        if (r6 == 0) {
            *sp00.unk8 = r8;
            break;
        }

        // _0800E082
        sp00.unk4 = (u16)(sp00.unk4 + 1);

        if (sp00.unk0 == INPUTBUF_NULL_PTR) {
            break;
        }

        r6 = *sp00.unk0++;
        r8 = *sp00.unk0++;
    }
}
#endif
