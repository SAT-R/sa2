#include "game/interactables_2/music_plant/pipe_horn.h"
#include "game/interactables_2/music_plant/french_horn.h"

// NOTE: Stored at end of rom, probably because it's configured data (like levels and
// assets?)
const PipeSegment *const gUnknown_08C8793C[9] = {
    gPipeHornPipeSequence0,
    gPipeHornPipeSequence0,
    gUnknown_080DFD40,
    gUnknown_080DFD40,
    gPipeHornPipSequence1,
    gUnknown_080DFDD8,
    gUnknown_080DFDD8,
    gPipeHornPipeSequence2,
    gPipeHornPipeSequence2,
};

const PipeSegment * const gUnknown_08C87960[3] = {
    gFrenchHornPipeSequence0,
    gFrenchHornPipeSequence1,
    gFrenchHornPipeSequence2,
};
