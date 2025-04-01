#ifndef GUARD_INTERACTABLE_PIPE_HORN_H
#define GUARD_INTERACTABLE_PIPE_HORN_H

#include "global.h"
#include "game/entity.h"
#include "game/interactables_2/music_plant/pipe_sequence.h"

void CreateEntity_PipeInstrument_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY);

extern const PipeSegment gPipeHornPipeSequence0[];
extern const PipeSegment gUnknown_080DFD40[];
extern const PipeSegment gPipeHornPipSequence1[];
extern const PipeSegment gUnknown_080DFDD8[];
extern const PipeSegment gPipeHornPipeSequence2[];

#endif // GUARD_INTERACTABLE_PIPE_HORN_H
