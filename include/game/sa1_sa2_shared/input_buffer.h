#ifndef GUARD_SA2_INPUT_BUFFER
#define GUARD_SA2_INPUT_BUFFER

#include "game/sa1_sa2_shared/player.h"

void sub_800E0C0(u16 param0, u16 param1);
void sub_800DF8C(Player *p);

extern const u8 *unk_8C87198[3];
extern const u8 *unk_8C871A4[3];
extern const u8 *unk_8C871B0[3];
extern const u8 *unk_8C871BC[3];
extern const u8 *unk_8C871C8[3];

#define INPUTBUF_NULL_PTR ((void *)((intptr_t)-1))

#endif // GUARD_SA2_INPUT_BUFFER
