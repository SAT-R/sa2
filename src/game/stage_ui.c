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

const u16 gUnknown_080D6BF8[] = {
    ZONE_TIME_TO_INT(0, 0),  ZONE_TIME_TO_INT(0, 1),  ZONE_TIME_TO_INT(0, 2),
    ZONE_TIME_TO_INT(0, 3),  ZONE_TIME_TO_INT(0, 4),  ZONE_TIME_TO_INT(0, 5),
    ZONE_TIME_TO_INT(0, 6),  ZONE_TIME_TO_INT(0, 7),  ZONE_TIME_TO_INT(0, 8),
    ZONE_TIME_TO_INT(0, 9),  ZONE_TIME_TO_INT(0, 10), ZONE_TIME_TO_INT(0, 11),
    ZONE_TIME_TO_INT(0, 12), ZONE_TIME_TO_INT(0, 13), ZONE_TIME_TO_INT(0, 14),
    ZONE_TIME_TO_INT(0, 15), ZONE_TIME_TO_INT(0, 16), ZONE_TIME_TO_INT(0, 17),
    ZONE_TIME_TO_INT(0, 18), ZONE_TIME_TO_INT(0, 19), ZONE_TIME_TO_INT(0, 20),
    ZONE_TIME_TO_INT(0, 21), ZONE_TIME_TO_INT(0, 22), ZONE_TIME_TO_INT(0, 23),
    ZONE_TIME_TO_INT(0, 24), ZONE_TIME_TO_INT(0, 25), ZONE_TIME_TO_INT(0, 26),
    ZONE_TIME_TO_INT(0, 27), ZONE_TIME_TO_INT(0, 28), ZONE_TIME_TO_INT(0, 29),
    ZONE_TIME_TO_INT(0, 30), ZONE_TIME_TO_INT(0, 31), ZONE_TIME_TO_INT(0, 32),
    ZONE_TIME_TO_INT(0, 33), ZONE_TIME_TO_INT(0, 34), ZONE_TIME_TO_INT(0, 35),
    ZONE_TIME_TO_INT(0, 36), ZONE_TIME_TO_INT(0, 37), ZONE_TIME_TO_INT(0, 38),
    ZONE_TIME_TO_INT(0, 39), ZONE_TIME_TO_INT(0, 40), ZONE_TIME_TO_INT(0, 41),
    ZONE_TIME_TO_INT(0, 42), ZONE_TIME_TO_INT(0, 43), ZONE_TIME_TO_INT(0, 44),
    ZONE_TIME_TO_INT(0, 45), ZONE_TIME_TO_INT(0, 46), ZONE_TIME_TO_INT(0, 47),
    ZONE_TIME_TO_INT(0, 48), ZONE_TIME_TO_INT(0, 49), ZONE_TIME_TO_INT(0, 50),
    ZONE_TIME_TO_INT(0, 51), ZONE_TIME_TO_INT(0, 52), ZONE_TIME_TO_INT(0, 53),
    ZONE_TIME_TO_INT(0, 54), ZONE_TIME_TO_INT(0, 55), ZONE_TIME_TO_INT(0, 56),
    ZONE_TIME_TO_INT(0, 57), ZONE_TIME_TO_INT(0, 58), ZONE_TIME_TO_INT(0, 59),
    ZONE_TIME_TO_INT(0, 60),
};

const u16 gUnknown_080D6C72[] = {
    ZONE_TIME_TO_INT(0, 0), ZONE_TIME_TO_INT(1, 0),  ZONE_TIME_TO_INT(2, 0),
    ZONE_TIME_TO_INT(3, 0), ZONE_TIME_TO_INT(4, 0),  ZONE_TIME_TO_INT(5, 0),
    ZONE_TIME_TO_INT(6, 0), ZONE_TIME_TO_INT(7, 0),  ZONE_TIME_TO_INT(8, 0),
    ZONE_TIME_TO_INT(9, 0), ZONE_TIME_TO_INT(10, 0),
};

// Probably a split here for trapped animals module

typedef struct {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u8 unkC;
} TrappedAnimalData; /* size 0x10 */

const TrappedAnimalData gAnimsTrappedAnimals[][3] = {
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_KOALA, 0, 0 },
        { 200, SA2_ANIM_ANIMAL_KANGAROO, 0, 2 },
    },
    {
        { 192, SA2_ANIM_ANIMAL_MOLE, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_SKUNK, 0, 2 },
        { 200, SA2_ANIM_ANIMAL_ROBIN, 0, 1 },
    },
    {
        { 192, SA2_ANIM_ANIMAL_LION, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_PEACOCK, 0, 2 },
        { 200, SA2_ANIM_ANIMAL_PARROT, 0, 1 },
    },
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_SEAL, 0, 0 },
        { 200, SA2_ANIM_ANIMAL_PENGUIN, 0, 2 },
    },
    {
        { 192, SA2_ANIM_ANIMAL_ELEPHANT, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_LION, 0, 0 },
        { 200, SA2_ANIM_ANIMAL_GORILLA, 0, 2 },
    },
    {
        { 192, SA2_ANIM_ANIMAL_MOLE, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_DEER, 0, 2 },
        { 200, SA2_ANIM_ANIMAL_RABBIT, 0, 2 },
    },
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, 0 },
        { 196, SA2_ANIM_ANIMAL_KOALA, 0, 0 },
        { 200, SA2_ANIM_ANIMAL_KANGAROO, 0, 2 },
    },
};

typedef void (*TrappedAnimalsFunc)(TrappedAnimalData *, u32);

void sub_802D99C(TrappedAnimalData *, u32);
void sub_802D650(TrappedAnimalData *, u32);
void sub_802D7FC(TrappedAnimalData *, u32);

TrappedAnimalsFunc const gUnknown_080D6DD8[] = {
    sub_802D99C,
    sub_802D650,
    sub_802D7FC,
};

// Seven unknown x/y positions
const u16 gUnknown_080D6DE4[][2] = {
    { 3800, 177 },  { 11864, 145 }, { 16088, 177 }, { 21080, 153 },
    { 27000, 150 }, { 36058, 201 }, { 40000, 225 },
};
