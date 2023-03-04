#ifndef GUARD_INTERACTABLE_H
#define GUARD_INTERACTABLE_H

#include "gba/defines.h"
#include "gba/types.h"
#include "sprite.h"
#include "game/game.h"

#define ENEMY_DATA_SIZE_SA1 4
#define ENEMY_DATA_SIZE_SA2 4
#define ENEMY_DATA_SIZE_SA3 5
#define ENEMY_DATA_SIZE     ENEMY_DATA_SIZE_SA2

typedef struct {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;
} EnemyBase PACKED;

typedef struct {
    /* 0x00 */ u8 x; // While an enemy is active, x gets repurposed as a "state"
                     // (e.g. indicating that it's active)
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    // PACKED was moved down to allow Intellisense to see the union's name
    union {
        /* 0x03 */
        s8 sData[ENEMY_DATA_SIZE];
        u8 uData[ENEMY_DATA_SIZE];
    } d PACKED;
} Enemy PACKED;

typedef struct {
    /* 0x00 */ Enemy *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 spriteX;
    /* 0x09 */ u8 spriteY;
} SpriteBase_Enemy;

#endif // GUARD_INTERACTABLE_H
