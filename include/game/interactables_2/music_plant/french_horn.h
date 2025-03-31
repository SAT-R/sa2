#ifndef GUARD_INTERACTABLE_FRENCH_HORN_H
#define GUARD_INTERACTABLE_FRENCH_HORN_H

#include "global.h"
#include "game/entity.h"
#include "game/interactables_2/music_plant/pipe_sequence.h"

void CreateEntity_FrenchHorn_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY);

extern const Pipe_Data gFrenchHornPipeSequence0[];
extern const Pipe_Data gFrenchHornPipeSequence1[];
extern const Pipe_Data gFrenchHornPipeSequence2[];

#endif // GUARD_INTERACTABLE_FRENCH_HORN_H
