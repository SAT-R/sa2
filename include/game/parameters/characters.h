#ifndef GUARD_PARAMETERS_CHARACTERS_H
#define GUARD_PARAMETERS_CHARACTERS_H

/*** Common ***/
#define PLAYER_GRAVITY (0.033) // = (8. / 256.)

/*** Tricks ***/
#define TRICK__STOP_N_SLAM__DROP_SPEED Q_24_8(0.21875)

/*** Cream ***/
#define CREAM_FLYING_DURATION (4 * GBA_FRAMES_PER_SECOND)

/*** Tails ***/
// NOTE: Unlike Cream, Tails does fly for 8 seconds, but his initial value gets set to 4.
//       For some reason they lower his timer only every 2nd frame (in PlayerCB_8012C2C),
//       instead of using a bigger value from the get-go, even though they gave him a
//       4-byte timer.
#define TAILS_FLYING_DURATION ((8 * GBA_FRAMES_PER_SECOND) / 2)

#endif // GUARD_PARAMETERS_CHARACTERS_H