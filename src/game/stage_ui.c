#include "global.h"
#include "game/game.h"
#include "game/stage_ui.h"

#include "constants/animations.h"

#define ONE_UP_ICON_TILES 4

const u16 sAnimsUiDigits[][2] = {
    { 1119, 16 }, // '0'
    { 1119, 17 }, // '1'
    { 1119, 18 }, // '2'
    { 1119, 19 }, // '3'
    { 1119, 20 }, // '4'
    { 1119, 21 }, // '5'
    { 1119, 22 }, // '6'
    { 1119, 23 }, // '7'
    { 1119, 24 }, // '8'
    { 1119, 25 }, // '9'
    { 1119, 26 }, // ':'
    { 1128, 0 }, // Icon - Special Ring collected
};

const u16 sAnims1UpIcons[][3]
    = { [CHARACTER_SONIC] = { ONE_UP_ICON_TILES, SA2_ANIM_LIFE_COUNTER,
                              SA2_ANIM_VARIANT_LIFE_COUNTER_SONIC },
        [CHARACTER_CREAM] = { ONE_UP_ICON_TILES, SA2_ANIM_LIFE_COUNTER,
                              SA2_ANIM_VARIANT_LIFE_COUNTER_CREAM },
        [CHARACTER_TAILS] = { ONE_UP_ICON_TILES, SA2_ANIM_LIFE_COUNTER,
                              SA2_ANIM_VARIANT_LIFE_COUNTER_TAILS },
        [CHARACTER_KNUCKLES] = { ONE_UP_ICON_TILES, SA2_ANIM_LIFE_COUNTER,
                                 SA2_ANIM_VARIANT_LIFE_COUNTER_KNUCKLES },
        [CHARACTER_AMY] = { ONE_UP_ICON_TILES, SA2_ANIM_LIFE_COUNTER,
                            SA2_ANIM_VARIANT_LIFE_COUNTER_AMY } };

// This palette might be used for the 1-Up icons
const u8 sPalette_080D6ACE[] = INCBIN_U8("graphics/80D6ACE.gbapal");

const u32 gUnknown_080D6AF0[] = {
    100000, 10000, 1000, 100, 10, 1,
};

const u8 gSecondsTable[60][2] = {
    { 0, 0 }, { 0, 1 }, { 0, 2 }, { 0, 3 }, { 0, 4 }, { 0, 5 }, { 0, 6 }, { 0, 7 },
    { 0, 8 }, { 0, 9 }, { 1, 0 }, { 1, 1 }, { 1, 2 }, { 1, 3 }, { 1, 4 }, { 1, 5 },
    { 1, 6 }, { 1, 7 }, { 1, 8 }, { 1, 9 }, { 2, 0 }, { 2, 1 }, { 2, 2 }, { 2, 3 },
    { 2, 4 }, { 2, 5 }, { 2, 6 }, { 2, 7 }, { 2, 8 }, { 2, 9 }, { 3, 0 }, { 3, 1 },
    { 3, 2 }, { 3, 3 }, { 3, 4 }, { 3, 5 }, { 3, 6 }, { 3, 7 }, { 3, 8 }, { 3, 9 },
    { 4, 0 }, { 4, 1 }, { 4, 2 }, { 4, 3 }, { 4, 4 }, { 4, 5 }, { 4, 6 }, { 4, 7 },
    { 4, 8 }, { 4, 9 }, { 5, 0 }, { 5, 1 }, { 5, 2 }, { 5, 3 }, { 5, 4 }, { 5, 5 },
    { 5, 6 }, { 5, 7 }, { 5, 8 }, { 5, 9 },
};

const u8 gMillisUnpackTable[60][2] = {
    { 0, 0 }, { 0, 2 }, { 0, 3 }, { 0, 5 }, { 0, 7 }, { 0, 8 }, { 1, 0 }, { 1, 2 },
    { 1, 3 }, { 1, 5 }, { 1, 7 }, { 1, 8 }, { 2, 0 }, { 2, 2 }, { 2, 3 }, { 2, 5 },
    { 2, 7 }, { 2, 8 }, { 3, 0 }, { 3, 2 }, { 3, 3 }, { 3, 5 }, { 3, 7 }, { 3, 8 },
    { 4, 0 }, { 4, 2 }, { 4, 3 }, { 4, 5 }, { 4, 7 }, { 4, 8 }, { 5, 0 }, { 5, 2 },
    { 5, 3 }, { 5, 5 }, { 5, 7 }, { 5, 8 }, { 6, 0 }, { 6, 2 }, { 6, 3 }, { 6, 5 },
    { 6, 7 }, { 6, 8 }, { 7, 0 }, { 7, 2 }, { 7, 3 }, { 7, 5 }, { 7, 7 }, { 7, 8 },
    { 8, 0 }, { 8, 2 }, { 8, 3 }, { 8, 5 }, { 8, 7 }, { 8, 8 }, { 9, 0 }, { 9, 2 },
    { 9, 3 }, { 9, 5 }, { 9, 7 }, { 9, 9 },
};
