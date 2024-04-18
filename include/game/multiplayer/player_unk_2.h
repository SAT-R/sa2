

#ifndef GUARD_MULTIPLAYER_PLAYER_UNK_2_H
#define GUARD_MULTIPLAYER_PLAYER_UNK_2_H

#include "global.h"

// Copies of BG control regs for Multiplayer(?)
typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
} MultiPlayerBgCtrlRegs; /* size: 8 */
extern MultiPlayerBgCtrlRegs *gUnknown_03005840;

void sub_801A384(void);

#endif // GUARD_MULTIPLAYER_PLAYER_UNK_2_H
