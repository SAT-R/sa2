#ifndef GUARD_IA_DASH_RING_H
#define GUARD_IA_DASH_RING_H

#include "global.h"
#include "engine/sprite.h"
#include "game/interactables/interactable.h"

#define DASH_RING__NUM_ORIENTATIONS 8

#define DASH_RING__TYPE_REGULAR     0
#define DASH_RING__TYPE_TECHNO_BASE 1
#define DASH_RING__NUM_TYPES        2

#define DASH_RING_DIR__UP         0
#define DASH_RING_DIR__UP_RIGHT   1
#define DASH_RING_DIR__RIGHT      2
#define DASH_RING_DIR__DOWN_RIGHT 3
#define DASH_RING_DIR__DOWN       4
#define DASH_RING_DIR__DOWN_LEFT  5
#define DASH_RING_DIR__LEFT       6
#define DASH_RING_DIR__UP_LEFT    7

typedef struct {
    /* 0x00 */ u16 anim;
    /* 0x02 */ u16 variant;
    /* 0x04 */ u16 tileCount;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
} UnkDashRingStruct;

typedef struct {
    /* 0x00 */ s16 x;
    /* 0x02 */ s16 y;
} DashRingAnim;

typedef struct {
    /* 0x00 */ Sprite spriteA;
    /* 0x30 */ Sprite spriteB;

    /* 0x60 */ DashRingAnim positions[3];

    // Maybe a struct starts here?
    /* 0x6C */ u16 orientation;
    /* 0x70 */ s32 posX;
    /* 0x74 */ s32 posY;
    /* 0x78 */ Interactable *ia;
    /* 0x7C */ u8 spriteX;
    /* 0x7D */ u8 spriteY;
} Sprite_DashRing; /* size: 0x80 */

#endif // GUARD_IA_DASH_RING_H