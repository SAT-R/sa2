#ifndef GUARD_STAGE_ENTITIES_MANAGER_H
#define GUARD_STAGE_ENTITIES_MANAGER_H

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "game/shared/stage/entity.h"

// TODO: merge with the below
typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
} EntityShared;

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
    /* 0x00|0x00 */ MapData *interactables;
    /* 0x04|0x04 */ MapData *items;
    /* 0x08|0x08 */ MapData *enemies;
    /* 0x0C|0x0C */ CamCoord prevCamX;
    /* 0x0E|0x10 */ CamCoord prevCamY;
    /* 0x10|0x14 */ u8 SA2_LABEL(unk14);
#if (GAME == GAME_SA2)
    /* 0x18|0x18 */ Task *levelTask;
#endif
} EntitiesManager;
extern Task *gEntitiesManagerTask;

void CreateStageEntitiesManager(void);

void CreateEnemyDefeatScoreAndManageLives(s16 x, s16 y);

// TaskDestructor_SpriteEntity
void TaskDestructor_EntityShared(Task *);
// The same as above, should align the name
void TaskDestructor_EntityShared(Task *);

#endif
