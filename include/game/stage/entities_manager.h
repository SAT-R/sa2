#ifndef GUARD_STAGE_ENTITIES_MANAGER_H
#define GUARD_STAGE_ENTITIES_MANAGER_H

#include "global.h"
#include "sprite.h"
#include "game/entity.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
} Sprite_Entity;

void CreateStageEntitiesManager(void);

// TaskDestructor_SpriteEntity
void TaskDestructor_80095E8(struct Task *);

#endif
