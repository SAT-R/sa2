#ifndef GUARD_INTERACTABLE_GRIND_RAIL_H
#define GUARD_INTERACTABLE_GRIND_RAIL_H

#include "global.h"
#include "game/entity.h"

void CreateEntity_GrindRail_Start(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_StartAir(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_EndGround(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_End_ForcedJump(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_EndAlternate(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_EndAir(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_EndGround_Left(MapEntity *, u16, u16, u8);
void CreateEntity_GrindRail_EndAir_Left(MapEntity *, u16, u16, u8);

#endif // GUARD_INTERACTABLE_GRIND_RAIL_H
