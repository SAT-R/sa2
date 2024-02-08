#include "global.h"
#include "sakit/player.h"

#include "constants/characters.h"

void sub_800E0C0(u16 param0, u16 param1);

extern const u8 *unk_8C87198[3];
extern const u8 *unk_8C871A4[3];
extern const u8 *unk_8C871B0[3];
extern const u8 *unk_8C871BC[3];
extern const u8 *unk_8C871C8[3];

struct struc_800DF8C {
    u8 *unk0;
    void *unk4;
    void *unk8;
};

const u8 **gUnknown_08C871D4[NUM_CHARACTERS] = {
    unk_8C87198,
    unk_8C871A4,
    unk_8C871B0,
    unk_8C871BC,
    unk_8C871C8,
};
 
#if 00
// The current value in gNewInputCounters[gNewInputCountersIndex]
// gets increased until either it reaches 0xFF or a new button was pressed.
// Letting go of a button does not trigger the index increase.
// (This might be used for timing in multiplayer?)
void sub_800DF8C(Player *p)
{
    struct struc_800DF8C sp00;
    u8 r6;
    u8 r8;

    if(p->moveState & (MOVESTATE_IGNORE_INPUT | MOVESTATE_DEAD)) {
        sub_800E0C0(0, 0);
        return;
    }
    // _0800DFB4

    sub_800E0C0(112, p->unk5E);

    if(p->unk70 == 0) {
        return;
    }

    sp00.unk4 = NULL;
    sp00.unk0 = (u8*)gUnknown_08C871D4[p->character];

    if(sp00.unk0 == (u8*)((intptr_t)-1)) {
        return;
    }

    r6 = *sp00.unk0++;
    r8 = *sp00.unk0++;

    // _0800E002
    while(r8 != p->unk71) {
        
    }
}
#endif
