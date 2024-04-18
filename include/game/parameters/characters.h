#ifndef GUARD_PARAMETERS_CHARACTERS_H
#define GUARD_PARAMETERS_CHARACTERS_H

#include "constants/zones.h"

/*** Common ***/
#define PLAYER_FLYING_END_GRAVITY  (0.033) // = (8. / 256.)
#define PLAYER_GRAVITY             42.0 / 256.0
#define PLAYER_GRAVITY_UNDER_WATER 12.0 / 256.0

#define PLAYER_JUMP_HEIGHT             4.875
#define PLAYER_JUMP_HEIGHT_UNDER_WATER 2.625

#define PLAYER_MAX_NOT_HELD_JUMP_FORCE             3.0
#define PLAYER_MAX_NOT_HELD_JUMP_FORCE_UNDER_WATER 1.5

#define PLAYER_INVULNERABLE_DURATION ZONE_TIME_TO_INT(0, 2)

#define PLAYER_AIR_SPEED_MAX 15.0

/*** Tricks ***/
#define TRICK__STOP_N_SLAM__DROP_SPEED Q_24_8(0.21875)

/*** Cream ***/
#define CREAM_FLYING_DURATION ZONE_TIME_TO_INT(0, 4)

/*** Tails ***/
// NOTE: Unlike Cream, Tails does fly for 8 seconds, but his initial value gets set to 4.
//       For some reason they lower his timer only every 2nd frame (in PlayerCB_8012C2C),
//       instead of using a bigger value from the get-go, even though they gave him a
//       4-byte timer.
#define TAILS_FLYING_DURATION (ZONE_TIME_TO_INT(0, 8) / 2)

#endif // GUARD_PARAMETERS_CHARACTERS_H