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
    u32 unk0;
    u32 unk4; // h_regionCount
    u32 unk8; // v_regionCount
    u32 unkC[0]; // unknown size, offsets
} MapData; /* Unknown size */

typedef struct {
    MapData *unk0; // interactables
    MapData *unk4; // itemBoxes
    MapData *unk8; // enemies
    s32 unkC; // camX
    s32 unk10; // camY
    u8 unk14;
    struct Task *unk18; // preInitTask
} EntitiesManager;
extern struct Task *gEntitiesManagerTask;

void CreateStageEntitiesManager(void);

// TaskDestructor_SpriteEntity
void TaskDestructor_80095E8(struct Task *);

#endif
