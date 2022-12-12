#ifndef GUARD_PLAYER_H
#define GUARD_PLAYER_H

#define CHARACTER_SONIC    0
#define CHARACTER_CREAM    1
#define CHARACTER_TAILS    2
#define CHARACTER_KNUCKLES 3
#define CHARACTER_AMY      4

#define NUM_CHARACTERS 5

#define CHARACTER_BIT(character) (1 << (character))

#define MAIN_CHARACTERS                                                                 \
    (CHARACTER_BIT(CHARACTER_SONIC) | CHARACTER_BIT(CHARACTER_CREAM)                    \
     | CHARACTER_BIT(CHARACTER_TAILS) | CHARACTER_BIT(CHARACTER_KNUCKLES))

#endif // GUARD_PLAYER_H
