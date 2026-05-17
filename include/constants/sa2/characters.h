#ifndef GUARD_CONSTANTS_CHARACTERS_H
#define GUARD_CONSTANTS_CHARACTERS_H

#if 01
typedef enum {
    CHARACTER_SONIC,
#if (GAME >= GAME_SA2)
    CHARACTER_CREAM,
#endif
    CHARACTER_TAILS,
    CHARACTER_KNUCKLES,
    CHARACTER_AMY,

    NUM_CHARACTERS
} ECharacters;
#else
// TODO: Right now these have to be defined like this for BriBaSA_ex to work.
//       Obviously this shall change!
#define CHARACTER_SONIC    0
#define CHARACTER_TAILS    1
#define CHARACTER_KNUCKLES 2
#define CHARACTER_AMY      3
#define NUM_CHARACTERS     4
#endif

// NOTE: Put this after NUM_CHARACTERS, to allow BriBaSA_ex to parse this file properly.
//       Naming it CHARACTER_<something> before NUM_CHARACTERS confuses it.
#define CHARACTER_SHARED_ANIM 0

#define CHARACTER_BIT(character) (1 << (character))

#define MAIN_CHARACTERS                                                                                                                    \
    (CHARACTER_BIT(CHARACTER_SONIC) | CHARACTER_BIT(CHARACTER_CREAM) | CHARACTER_BIT(CHARACTER_TAILS) | CHARACTER_BIT(CHARACTER_KNUCKLES))

#endif
