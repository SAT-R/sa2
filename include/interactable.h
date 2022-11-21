#ifndef GUARD_INTERACTABLE_H
#define GUARD_INTERACTABLE_H

#include "gba/defines.h"
#include "gba/types.h"

#define INTERACTABLE_DATA_SIZE_SA1 4
#define INTERACTABLE_DATA_SIZE_SA2 4
#define INTERACTABLE_DATA_SIZE_SA3 5
#define INTERACTABLE_DATA_SIZE     INTERACTABLE_DATA_SIZE_SA2

PACKED
typedef struct {
    u8 x;
    u8 y;
    u8 index;
    s8 data[INTERACTABLE_DATA_SIZE];
} Interactable;

typedef struct {
    /* 0x00 */ Interactable *entity;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase;

#endif // GUARD_INTERACTABLE_H
