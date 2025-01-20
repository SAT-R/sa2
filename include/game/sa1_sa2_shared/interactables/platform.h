#ifndef GUARD_INTERACTABLE_PLATFORM_H
#define GUARD_INTERACTABLE_PLATFORM_H

#include "global.h"
#include "game/entity.h"

void CreateEntity_Platform(MapEntity *, u16, u16, u8);
void CreateEntity_FallingPlatform(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY);

#endif // GUARD_INTERACTABLE_PLATFORM_H
