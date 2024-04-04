#ifndef GUARD_PARAMETERS_BOSSES_H
#define GUARD_PARAMETERS_BOSSES_H

#define BOSS_VELOCITY_X           Q(5.00)
#define BOSS_VELOCITY_Y           Q(0.00)
#define BOSS_EXPLOSION_VELOCITY_X Q(5.50)

/*
 * Boss 3 - Egg Totem
 */

#define BOSS5_BULLET_SPEED Q(2.0)
#define BOSS5_HEIGHT       Q(80.0) // Used for Homing Positioning

/*
 * Boss 4 - Aero Egg
 */

#define BOSS4_LIVES_EASY   6
#define BOSS4_LIVES_NORMAL 8

#define BOSS4_START_X Q(880.00)
#define BOSS4_START_Y Q(90.00)

#define BOSS4_START_X_FINAL Q(18030.00)
#define BOSS4_START_Y_FINAL Q(90.00)

#define BOSS4_VELOCITY_X BOSS_VELOCITY_X
#define BOSS4_VELOCITY_Y BOSS_VELOCITY_Y

#endif // GUARD_PARAMETERS_BOSSES_H