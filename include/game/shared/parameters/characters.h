#ifndef GUARD_PARAMETERS_CHARACTERS_H
#define GUARD_PARAMETERS_CHARACTERS_H

#if (GAME == GAME_SA1)
#include "constants/zones.h"
#elif (GAME == GAME_SA2)
#include "constants/zones.h"
#endif

/* NOTE: Copied from SA2! */

// TODO: Be consistent about whether these are Q() or I() values!
//
// TODO: We should consider making these defaults per-second values, instead of per-frame values!

/*** Common ***/
#define PLAYER_FLYING_END_GRAVITY  (0.033) // = (8. / 256.)
#define PLAYER_GRAVITY             (42.0 / 256.0)
#define PLAYER_GRAVITY_UNDER_WATER (12.0 / 256.0)

#define PLAYER_POST_GOAL_RUN_SPEED (4.5)

#define PLAYER_JUMP_HEIGHT             (4.875)
#define PLAYER_JUMP_HEIGHT_UNDER_WATER (2.625)
#define PLAYER_RAIL_JUMP_HEIGHT        PLAYER_JUMP_HEIGHT
#define PLAYER_RAIL_EXTRA_JUMP_HEIGHT  (7.0)

#define PLAYER_MAX_NOT_HELD_JUMP_FORCE             (3.0)
#define PLAYER_MAX_NOT_HELD_JUMP_FORCE_UNDER_WATER (1.5)

#define PLAYER_FLOATING_UPDRAFT   (104. / 256.)
#define PLAYER_MAX_FLOATING_SPEED (2.25)

// NOTE: Equal in SA1 and SA2!
#define PLAYER_INVULNERABLE_DURATION TIME(0, 2)
#define PLAYER_INVINCIBLE_DURATION   TIME(0, 20)
#define PLAYER_SPEED_UP_DURATION     TIME(0, 20)
#define PLAYER_SPEED_UP_MUSIC_TEMPO  Q(2.0)

#define PLAYER_AIR_SPEED_MAX 15.0

/*** Tricks ***/
#define TRICK__STOP_N_SLAM__DROP_SPEED Q(0.21875)

/*** Cream ***/
#define CREAM_FLYING_DURATION TIME(0, 4)

/*** Tails ***/
// NOTE: Unlike Cream, Tails does fly for 8 seconds, but his initial value gets set to 4.
//       For some reason they lower his timer only every 2nd frame (in PlayerCB_8012C2C),
//       instead of using a bigger value from the get-go, even though they gave him a
//       4-byte timer.
#define TAILS_FLYING_DURATION (TIME(0, 8) / 2)

#endif // GUARD_PARAMETERS_CHARACTERS_H