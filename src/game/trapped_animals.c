#include "global.h"
#include "trig.h"
#include "game/game.h"
#include "game/stage_ui.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    u32 unk0;
    u32 unk4;
    u32 unk8;
    s32 unkC;
} TrappedAnimalData;

typedef struct {
    s32 unk0;
    s32 unk4;
    s32 unk8;
    s32 unkC; // x
    s32 unk10; // y
} AnimalInfo;

typedef struct {
    Sprite sprite;
    s32 unk30;
    s32 unk34;
    s16 unk38;
    s8 unk3A;
} Animal;

typedef struct {
    Sprite sprite;
    s32 unk30;
    s32 unk34;
    s16 unk38;
    s16 unk3A;
    s8 unk3C;
    u8 unk3D;
} Animal2;

typedef struct {
    Sprite sprite;
    s32 unk30;
    s32 unk34;
    s16 unk38;
    s16 unk3A;
    u8 unk3C;
    u8 unk3D;
} Animal3;

typedef void (*TrappedAnimalsFunc)(AnimalInfo *);

static void sub_802D99C(AnimalInfo *);
static void sub_802D650(AnimalInfo *);
static void sub_802D7FC(AnimalInfo *);
static void sub_802D6FC(void);
static void sub_802DA4C(void);
static void sub_802D8B8(void);

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

TrappedAnimalsFunc const gUnknown_080D6DD8[] = {
    sub_802D99C,
    sub_802D650,
    sub_802D7FC,
};

static void sub_802D650(AnimalInfo *init)
{
    struct Task *t = TaskCreate(sub_802D6FC, sizeof(Animal), 0x2000, 0, NULL);
    Animal *animal = TaskGetStructPtr(t);
    Sprite *sprite;
    animal->unk30 = Q_24_8(init->unkC);
    animal->unk34 = Q_24_8(init->unk10);
    animal->unk38 = 576;
    animal->unk3A = 1;

    sprite = &animal->sprite;
    sprite->x = init->unkC;
    sprite->y = init->unk10;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + (init->unk0 * TILE_SIZE_4BPP);
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->graphics.anim = init->unk4;
    sprite->variant = init->unk8;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = 0x2000;
}

static void sub_802D6FC(void)
{
    Animal *animal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &animal->sprite;

    s32 sin, cos;
    s32 x = animal->unk30;
    s32 y = animal->unk34;

    if (animal->unk3A != 0) {
        animal->unk38 += 6;
        if (animal->unk38 > 640) {
            animal->unk3A = 0;
        }
    } else {
        animal->unk38 -= 6;
        if (animal->unk38 < 512) {
            animal->unk3A = 1;
        }
    }

    x += Div(COS(animal->unk38 & ONE_CYCLE), 20) >> 3;
    y += Div(SIN(animal->unk38 & ONE_CYCLE), 20) >> 1;

    animal->unk30 = x;
    animal->unk34 = y;

    sprite->x = Q_24_8_TO_INT(x) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(y) - gCamera.y;

    if ((u16)(sprite->x + 32) > 304 || (sprite->y + 32) <= -1 || sprite->y >= 193) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static void sub_802D7FC(AnimalInfo *init)
{
    struct Task *t = TaskCreate(sub_802D8B8, sizeof(Animal2), 0x2000, 0, NULL);
    Animal2 *animal = TaskGetStructPtr(t);
    Sprite *sprite;
    animal->unk30 = Q_24_8(init->unkC);
    animal->unk34 = Q_24_8(init->unk10);
    animal->unk38 = 1;
    animal->unk3A = -1024;
    animal->unk3C = 0;
    animal->unk3D = 42;

    sprite = &animal->sprite;
    sprite->x = init->unkC;
    sprite->y = init->unk10;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + (init->unk0 * TILE_SIZE_4BPP);
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->graphics.anim = init->unk4;
    sprite->variant = init->unk8;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = 0x2000;
}

static void sub_802D8B8(void)
{
    Animal2 *animal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &animal->sprite;
    s32 x;

    animal->unk3A += 48;
    x = animal->unk34 + animal->unk3A;
    animal->unk34 = x;
    animal->unk30 += animal->unk38;

    if (animal->unk3D != 0) {
        animal->unk3D--;
    } else {
        s32 temp = x
            + Q_24_8(sub_801F07C(Q_24_8_TO_INT(animal->unk34),
                                 Q_24_8_TO_INT(animal->unk30), 1, 8, NULL, sub_801EE64));

        if (temp <= animal->unk34) {
            animal->unk3A = -1024;
            animal->unk34 = temp;
            if (animal->unk3C == 0) {
                animal->unk38 = -512;
            }
            animal->unk3C = 1;
        }
    }

    sprite->x = Q_24_8_TO_INT(animal->unk30) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(animal->unk34) - gCamera.y;

    if ((u16)(sprite->x + 32) > 304 || (sprite->y + 32) <= -1 || sprite->y >= 193) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

static void sub_802D99C(AnimalInfo *init)
{
    struct Task *t = TaskCreate(sub_802DA4C, sizeof(Animal2), 0x2000, 0, NULL);
    Animal3 *animal = TaskGetStructPtr(t);
    Sprite *sprite;
    animal->unk30 = Q_24_8(init->unkC);
    animal->unk34 = Q_24_8(init->unk10);
    animal->unk38 = 0;
    animal->unk3A = -1024;
    animal->unk3C = 42;

    sprite = &animal->sprite;
    sprite->x = init->unkC;
    sprite->y = init->unk10;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + (init->unk0 * TILE_SIZE_4BPP);
    sprite->unk1A = 0x440;
    sprite->graphics.size = 0;
    sprite->graphics.anim = init->unk4;
    sprite->variant = init->unk8;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = -1;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk10 = 0x2000;
}

static void sub_802DA4C(void)
{
    Animal3 *animal = TaskGetStructPtr(gCurTask);
    Sprite *sprite = &animal->sprite;
    s32 x;

    animal->unk3A += 48;
    x = animal->unk34 + animal->unk3A;
    animal->unk34 = x;
    animal->unk30 += animal->unk38;

    if (animal->unk3C != 0) {
        animal->unk3C--;
    } else {
        s32 temp = x
            + Q_24_8(sub_801F07C(Q_24_8_TO_INT(animal->unk34),
                                 Q_24_8_TO_INT(animal->unk30), 1, 8, NULL, sub_801EE64));

        if (temp <= animal->unk34) {
            animal->unk3A = 0;
            animal->unk34 = temp;
        }
    }

    sprite->x = Q_24_8_TO_INT(animal->unk30) - gCamera.x;
    sprite->y = Q_24_8_TO_INT(animal->unk34) - gCamera.y;

    if ((u16)(sprite->x + 32) > 304 || (sprite->y + 32) <= -1 || sprite->y >= 193) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void CreateTrappedAnimal(s16 x, s16 y)
{
    AnimalInfo init;
    s8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    s8 temp;
    if (zone > ZONE_7) {
        zone = ZONE_7;
    }

    temp = gAnimsTrappedAnimals[zone][gUnknown_03005444].unkC;
    init.unk0 = gAnimsTrappedAnimals[zone][gUnknown_03005444].unk0;
    init.unk4 = gAnimsTrappedAnimals[zone][gUnknown_03005444].unk4;
    init.unk8 = gAnimsTrappedAnimals[zone][gUnknown_03005444].unk8;
    init.unkC = x;
    init.unk10 = y;

    gUnknown_03005444++;
    if (gUnknown_03005444 > 2) {
        gUnknown_03005444 = 0;
    }

    gUnknown_080D6DD8[temp](&init);
}
