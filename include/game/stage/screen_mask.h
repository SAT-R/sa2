#ifndef GUARD_SCREEN_MASK_H
#define GUARD_SCREEN_MASK_H

#include "global.h"

void sub_802E044(s32 qX, u16);
void sub_802E164(s32 qX, u16);
void sub_802DBC0(int_vcount y, u16 angle);
void sub_802DCC8(int_vcount y, u16 angle);
void sub_802DDC4(int_vcount y, u16 angle);
void sub_802DF18(int_vcount y, u16 angle);
void sub_802E278(s16 *p0, u8 pairCount);
void sub_802E384(s16 *p0, u16 pairCount);

void sub_802E784(u16, u16, u16, s16 x, s16 y, u8);

#endif // GUARD_SCREEN_MASK_H