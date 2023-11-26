#ifndef GUARD_PLAYER_CONTROLS_H
#define GUARD_PLAYER_CONTROLS_H

#include "global.h"

struct ButtonConfig {
    u16 jump;
    u16 attack;
    u16 trick;
};

extern struct ButtonConfig gPlayerControls;

void SetPlayerControls(u16 jump, u16 attack, u16 trick);

#endif // GUARD_PLAYER_CONTROLS_H
