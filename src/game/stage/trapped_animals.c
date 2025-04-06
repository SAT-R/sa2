#include "global.h"
#include "trig.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/ui.h"
#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    s32 vramOffset;
    u32 anim;
    u32 variant;
    s32 type;
} TrappedAnimalData;

typedef struct {
    s32 vramOffset;
    s32 anim;
    s32 variant;
    s32 x; // x
    s32 y; // y
} SpawnOptions;

typedef struct {
    Sprite s;
    s32 x;
    s32 y;
    s16 unk38;
    s8 flyingUp;
} FlyingAnimal;

typedef struct {
    Sprite s;
    s32 x;
    s32 y;
    s16 moveSpeed;
    s16 fallSpeed;
    s8 bouncing;
    u8 inAirTimer;
} BouncingAnimal;

typedef struct {
    Sprite s;
    s32 x;
    s32 y;
    s16 moveSpeed;
    s16 fallSpeed;
    u8 inAirTimer;
} StaticAnimal;

#define ANIMAL_VARIANTS_PER_ZONE 3

#define ANIMAL_GRAVITY            Q(0.1875)
#define ANIMAL_BOUNCE_SPEED       Q(4)
#define ANIMAL_BOUNCE_MOVE_SPEED  Q(2)
#define ANIMAL_INITIAL_MOVE_SPEED Q(0.00390625)

#define ANIMAL_TYPE_STATIC   0
#define ANIMAL_TYPE_FLYING   1
#define ANIMAL_TYPE_BOUNCING 2

typedef void (*TrappedAnimalsFunc)(SpawnOptions *);

static void CreateStaticAnimal(SpawnOptions *);
static void CreateFlyingAnimal(SpawnOptions *);
static void CreateBouncingAnimal(SpawnOptions *);

static void Task_FlyingAnimal(void);
static void Task_StaticAnimalMain(void);
static void Task_BouncingAnimal(void);

#define IS_ANIMAL_OUT_OF_CAM_RANGE(x, y) IS_OUT_OF_RANGE_3(x, y, 32, 32)

static const TrappedAnimalData sAnimsTrappedAnimals[][ANIMAL_VARIANTS_PER_ZONE] = {
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_KOALA, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_KANGAROO, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_MOLE, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_SKUNK, 0, ANIMAL_TYPE_BOUNCING },
        { 200, SA2_ANIM_ANIMAL_ROBIN, 0, ANIMAL_TYPE_FLYING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_LION, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_PEACOCK, 0, ANIMAL_TYPE_BOUNCING },
        { 200, SA2_ANIM_ANIMAL_PARROT, 0, ANIMAL_TYPE_FLYING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_SEAL, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_PENGUIN, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_ELEPHANT, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_LION, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_GORILLA, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_MOLE, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_DEER, 0, ANIMAL_TYPE_BOUNCING },
        { 200, SA2_ANIM_ANIMAL_RABBIT, 0, ANIMAL_TYPE_BOUNCING },
    },
    {
        { 192, SA2_ANIM_ANIMAL_SEA_OTTER, 0, ANIMAL_TYPE_STATIC },
        { 196, SA2_ANIM_ANIMAL_KOALA, 0, ANIMAL_TYPE_STATIC },
        { 200, SA2_ANIM_ANIMAL_KANGAROO, 0, ANIMAL_TYPE_BOUNCING },
    },
};

static TrappedAnimalsFunc const sTrappedAnimalSpawnFunctions[] = {
    CreateStaticAnimal,
    CreateFlyingAnimal,
    CreateBouncingAnimal,
};

static void CreateFlyingAnimal(SpawnOptions *init)
{
    struct Task *t = TaskCreate(Task_FlyingAnimal, sizeof(FlyingAnimal), 0x2000, 0, NULL);
    FlyingAnimal *animal = TASK_DATA(t);
    Sprite *s;
    animal->x = Q(init->x);
    animal->y = Q(init->y);
    animal->unk38 = 576;
    animal->flyingUp = TRUE;

    s = &animal->s;
    s->x = init->x;
    s->y = init->y;
    s->graphics.dest = (void *)OBJ_VRAM0 + (init->vramOffset * TILE_SIZE_4BPP);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = init->anim;
    s->variant = init->variant;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_FlyingAnimal(void)
{
    FlyingAnimal *animal = TASK_DATA(gCurTask);
    Sprite *s = &animal->s;

    s32 sin, cos;
    s32 x = animal->x;
    s32 y = animal->y;

    if (animal->flyingUp) {
        animal->unk38 += 6;
        if (animal->unk38 > 640) {
            animal->flyingUp = FALSE;
        }
    } else {
        animal->unk38 -= 6;
        if (animal->unk38 < 512) {
            animal->flyingUp = TRUE;
        }
    }

    x += Div(COS(animal->unk38 & ONE_CYCLE), 20) >> 3;
    y += Div(SIN(animal->unk38 & ONE_CYCLE), 20) >> 1;

    animal->x = x;
    animal->y = y;

    s->x = I(x) - gCamera.x;
    s->y = I(y) - gCamera.y;

    if (IS_ANIMAL_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void CreateBouncingAnimal(SpawnOptions *init)
{
    struct Task *t = TaskCreate(Task_BouncingAnimal, sizeof(BouncingAnimal), 0x2000, 0, NULL);
    BouncingAnimal *animal = TASK_DATA(t);
    Sprite *s;
    animal->x = Q(init->x);
    animal->y = Q(init->y);
    animal->moveSpeed = ANIMAL_INITIAL_MOVE_SPEED;
    animal->fallSpeed = -ANIMAL_BOUNCE_SPEED;
    animal->bouncing = FALSE;
    animal->inAirTimer = 42;

    s = &animal->s;
    s->x = init->x;
    s->y = init->y;
    s->graphics.dest = (void *)OBJ_VRAM0 + (init->vramOffset * TILE_SIZE_4BPP);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = init->anim;
    s->variant = init->variant;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_BouncingAnimal(void)
{
    BouncingAnimal *animal = TASK_DATA(gCurTask);
    Sprite *s = &animal->s;
    s32 y;

    animal->fallSpeed += ANIMAL_GRAVITY;
    y = animal->y + animal->fallSpeed;
    animal->y = y;
    animal->x += animal->moveSpeed;

    if (animal->inAirTimer > 0) {
        animal->inAirTimer--;
    } else {
        s32 clampedY = y + Q(sub_801F07C(I(animal->y), I(animal->x), 1, 8, NULL, sub_801EE64));

        // if hit floor
        if (clampedY <= animal->y) {
            animal->fallSpeed = -ANIMAL_BOUNCE_SPEED;
            animal->y = clampedY;
            if (animal->bouncing == FALSE) {
                animal->moveSpeed = -ANIMAL_BOUNCE_MOVE_SPEED;
            }
            animal->bouncing = TRUE;
        }
    }

    s->x = I(animal->x) - gCamera.x;
    s->y = I(animal->y) - gCamera.y;

    if (IS_ANIMAL_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void CreateStaticAnimal(SpawnOptions *init)
{
    struct Task *t = TaskCreate(Task_StaticAnimalMain, sizeof(StaticAnimal), 0x2000, 0, NULL);
    StaticAnimal *animal = TASK_DATA(t);
    Sprite *s;
    animal->x = Q(init->x);
    animal->y = Q(init->y);
    // lol
    animal->moveSpeed = 0;

    animal->fallSpeed = -ANIMAL_BOUNCE_SPEED;
    animal->inAirTimer = 42;

    s = &animal->s;
    s->x = init->x;
    s->y = init->y;
    s->graphics.dest = (void *)OBJ_VRAM0 + (init->vramOffset * TILE_SIZE_4BPP);
    s->oamFlags = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = init->anim;
    s->variant = init->variant;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

static void Task_StaticAnimalMain(void)
{
    StaticAnimal *animal = TASK_DATA(gCurTask);
    Sprite *s = &animal->s;
    s32 y;

    animal->fallSpeed += ANIMAL_GRAVITY;
    y = animal->y + animal->fallSpeed;
    animal->y = y;
    animal->x += animal->moveSpeed;

    if (animal->inAirTimer > 0) {
        animal->inAirTimer--;
    } else {
        s32 clampedY = y + Q(sub_801F07C(I(animal->y), I(animal->x), 1, 8, NULL, sub_801EE64));

        // if collided with floor
        if (clampedY <= animal->y) {
            animal->fallSpeed = 0;
            animal->y = clampedY;
        }
    }

    s->x = I(animal->x) - gCamera.x;
    s->y = I(animal->y) - gCamera.y;

    if (IS_ANIMAL_OUT_OF_CAM_RANGE(s->x, s->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateTrappedAnimal(s16 x, s16 y)
{
    SpawnOptions options;
    s8 zone = LEVEL_TO_ZONE(gCurrentLevel);
    s8 type;
    if (zone > ZONE_7) {
        zone = ZONE_7;
    }

    type = sAnimsTrappedAnimals[zone][gTrappedAnimalVariant].type;
    options.vramOffset = sAnimsTrappedAnimals[zone][gTrappedAnimalVariant].vramOffset;
    options.anim = sAnimsTrappedAnimals[zone][gTrappedAnimalVariant].anim;
    options.variant = sAnimsTrappedAnimals[zone][gTrappedAnimalVariant].variant;
    options.x = x;
    options.y = y;

    // gTrappedAnimalVariant %= ANIMAL_VARIANTS_PER_ZONE;
    if (++gTrappedAnimalVariant > (ANIMAL_VARIANTS_PER_ZONE - 1)) {
        gTrappedAnimalVariant = 0;
    }

    sTrappedAnimalSpawnFunctions[type](&options);
}
