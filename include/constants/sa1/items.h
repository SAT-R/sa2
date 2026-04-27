#ifndef GUARD_CONSTANTS_ITEMS_H
#define GUARD_CONSTANTS_ITEMS_H

#if (GAME == GAME_SA1)
#define ITEM__ONE_UP          0
#define ITEM__SHIELD          1
#define ITEM__MP_8            8
#define ITEM__MP_9            9
#define ITEM__MP_10           10

#if (GAME == GAME_SA1)
#define ITEM__COUNT 11
#else
#define ITEM__MP_11 11
#define ITEM__MP_12 12

#define ITEM__COUNT 13
#endif
#elif (GAME == GAME_SA2)
#define ITEM__ONE_UP          0
#define ITEM__SHIELD          1
#define ITEM__MP_ATTACK       11
#define ITEM__MP_ATTACK_2     12
#define ITEM__MP_RANDOM       13
#endif
#endif // GUARD_CONSTANTS_ITEMS_H