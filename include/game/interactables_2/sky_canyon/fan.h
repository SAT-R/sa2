#ifndef GUARD_INTERACTABLE_SMALL_PROPELLER_H
#define GUARD_INTERACTABLE_SMALL_PROPELLER_H

#include "global.h"
#include "game/entity.h"

void CreateEntity_Fan_Left(MapEntity *, u16, u16, u8);
void CreateEntity_Fan_Right(MapEntity *, u16, u16, u8);
void CreateEntity_Fan_Left_Periodic(MapEntity *, u16, u16, u8);
void CreateEntity_Fan_Right_Periodic(MapEntity *, u16, u16, u8);

#endif
