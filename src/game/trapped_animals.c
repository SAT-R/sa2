#include "global.h"
#include "game/game.h"
#include "game/stage_ui.h"

#include "constants/animations.h"

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
