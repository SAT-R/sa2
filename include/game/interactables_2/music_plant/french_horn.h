#ifndef GUARD_INTERACTABLE_FRENCH_HORN_H
#define GUARD_INTERACTABLE_FRENCH_HORN_H

#include "global.h"
#include "game/entity.h"
#include "game/interactables_2/music_plant/pipe_horn.h"

#define NUM_PIPE_HANDLERS 16

void CreateEntity_FrenchHorn_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY);

extern const Pipe_Data gUnknown_080DFEE4[];
extern const Pipe_Data gUnknown_080DFF3C[];
extern const Pipe_Data gUnknown_080DFF9C[];

#endif // GUARD_INTERACTABLE_FRENCH_HORN_H
