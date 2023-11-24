#ifndef GUARD_INTERACTABLE_SPRING_H
#define GUARD_INTERACTABLE_SPRING_H

#include "global.h"
#include "game/entity.h"

void CreateEntity_Spring_Normal_Up(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Normal_Down(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Normal_Right(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Normal_Left(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Big_UpLeft(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Big_UpRight(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Big_DownRight(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Big_DownLeft(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Small_UpRight(MapEntity *, u16, u16, u8);
void CreateEntity_Spring_Small_UpLeft(MapEntity *, u16, u16, u8);

#endif // GUARD_INTERACTABLE_SPRING_H
