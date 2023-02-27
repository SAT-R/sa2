#ifndef GUARD_INTERACTABLE_H
#define GUARD_INTERACTABLE_H

#include "gba/defines.h"
#include "gba/types.h"
#include "sprite.h"
#include "game/game.h"

#define INTERACTABLE_DATA_SIZE_SA1 4
#define INTERACTABLE_DATA_SIZE_SA2 4
#define INTERACTABLE_DATA_SIZE_SA3 5
#define INTERACTABLE_DATA_SIZE     INTERACTABLE_DATA_SIZE_SA2

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;
} InteractableBase PACKED;

typedef struct {
    /* 0x00 */ u8 x; // While an interactable is active, x gets repurposed as a "state"
                     // (e.g. indicating that it's active)
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    // PACKED was moved down to allow Intellisense to see the union's name
    union {
        /* 0x03 */
        s8 sData[INTERACTABLE_DATA_SIZE];
        u8 uData[INTERACTABLE_DATA_SIZE];
    } d PACKED;
} Interactable PACKED;

typedef struct {
    /* 0x00 */ Interactable *ia;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase;

bool32 sub_800C204(Sprite *, s32, s32, s16, Player *, u32);
u32 sub_800CDBC(Sprite *, s32, s32, Player *);

void TaskDestructor_80095E8(struct Task *);

#endif // GUARD_INTERACTABLE_H
