#ifndef GUARD_STAGE_PLAYER_H
#define GUARD_STAGE_PLAYER_H

#include "sakit/player.h"
#include "constants/move_states.h"

#define PLAYER_IS_ALIVE  (!(gPlayer.moveState & MOVESTATE_DEAD))
#define IS_ALIVE(player) (!(player->moveState & MOVESTATE_DEAD))

void InitializePlayer(Player *p);

#endif // GUARD_STAGE_PLAYER_H
