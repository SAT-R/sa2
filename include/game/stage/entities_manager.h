#ifndef GUARD_STAGE_ENTITIES_MANAGER_H
#define GUARD_STAGE_ENTITIES_MANAGER_H

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "game/entity.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
} Sprite_Entity;

typedef struct {
    /* 0x00 */ u32 uncompSize; // unsigned Q_24_8
    /* 0x04 */ u32 h_regionCount;
    /* 0x08 */ u32 v_regionCount;
    /* 0x0C */ u32 offsets[0]; // (h*v) * sizeof(u32)

    /* *** Data the offsets point to goes here ***
     * - each different per type
     * - Array per region:
     *  - IAs / Enemies: X/Y Pos, Type, 4 data bytes (5 in SA3)
     *  - Rings have X/Y position
     *  - Itemboxes have X/Y Pos and Type */
} MapData; /* Unknown size */

typedef struct {
    /* 0x00 */ MapData *interactables;
    /* 0x04 */ MapData *items;
    /* 0x08 */ MapData *enemies;
    /* 0x0C */ s32 prevCamX;
    /* 0x10 */ s32 prevCamY;
    /* 0x14 */ u8 unk14;
    /* 0x18 */ struct Task *preInit;
} EntitiesManager;
extern struct Task *gEntitiesManagerTask;

void CreateStageEntitiesManager(void);

void CreateEnemyDefeatScoreAndManageLives(s16 x, s16 y);

// TaskDestructor_SpriteEntity
void TaskDestructor_80095E8(struct Task *);

#endif
