

#ifndef GUARD_MULTIPLAYER_ATTACK_2_EFFECT_H
#define GUARD_MULTIPLAYER_ATTACK_2_EFFECT_H

#include "global.h"

// Copies of BG control regs for Multiplayer(?)
typedef struct {
    u16 timer;
    u16 sizeChangeDelay;
    u16 sizeChangeTimer;
    u16 size;
} MultiPlayerBgCtrlRegs; /* size: 8 */
extern MultiPlayerBgCtrlRegs *gMPAttackEffect2Regs;

void CreateMPAttack2Effect(void);

#endif // GUARD_MULTIPLAYER_ATTACK_2_EFFECT_H
