#ifndef GUARD_INTERACTABLE_GUITAR_STRING_H
#define GUARD_INTERACTABLE_GUITAR_STRING_H

#include "global.h"

#include "game/entity.h"

#define NUM_GUITAR_STRING_ELEMS 6
#define GUITARSTR_WIDTH_PX      (NUM_GUITAR_STRING_ELEMS * TILE_WIDTH)
#define GUITARSTR_MIN_ACCEL     Q_8_8(4.0)
#define GUITARSTR_MAX_ACCEL     Q_8_8(12.0)

void CreateEntity_GuitarString(MapEntity *, u16, u16, u8);

#endif
