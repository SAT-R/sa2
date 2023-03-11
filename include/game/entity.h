#ifndef GUARD_INTERACTABLE_H
#define GUARD_INTERACTABLE_H

#include "gba/defines.h"
#include "gba/types.h"
#include "sprite.h"
#include "game/game.h"

#define ENTITY_DATA_SIZE_SA1 4
#define ENTITY_DATA_SIZE_SA2 4
#define ENTITY_DATA_SIZE_SA3 5
#define ENTITY_DATA_SIZE     ENTITY_DATA_SIZE_SA2

// After a MapEntity is initialized, its x-value in the layout-data gets set to -2.
#define MAP_ENTITY_STATE_INITIALIZED (-2)
#define MAP_ENTITY_STATE_MINUS_THREE (-3)
#define SET_MAP_ENTITY_INITIALIZED(mapEnt)                                              \
    {                                                                                   \
        s32 negativeTwo;                                                                \
        s16 forMatching;                                                                \
        negativeTwo = MAP_ENTITY_STATE_INITIALIZED;                                     \
        forMatching = negativeTwo;                                                      \
        mapEnt->x = forMatching;                                                        \
    }

#define SET_MAP_ENTITY_NOT_INITIALIZED(mapEnt, initialX)                                \
    {                                                                                   \
        mapEnt->x = initialX;                                                           \
    }

typedef struct {
    /* 0x00 */ u8 x; // While an enemy is active, x gets repurposed as a "state"
                     // (e.g. indicating that it's active)
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    // PACKED was moved down to allow Intellisense to see the union's name
    union {
        /* 0x03 */
        s8 sData[ENTITY_DATA_SIZE];
        u8 uData[ENTITY_DATA_SIZE];
    } d PACKED;
} MapEntity PACKED;

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase;

// IsColliding?
bool32 sub_800C204(Sprite *, s32, s32, s16, Player *, u32);

u32 sub_800CDBC(Sprite *, s32, s32, Player *);
bool32 sub_800CBA4(Player *);
u32 sub_800DF38(Sprite *, s32, s32, Player *);

// TODO: Include header this belongs to
u32 sub_800CCB8(Sprite *, s32 x, s32 y, Player *);

void TaskDestructor_80095E8(struct Task *);

#endif // GUARD_INTERACTABLE_H
