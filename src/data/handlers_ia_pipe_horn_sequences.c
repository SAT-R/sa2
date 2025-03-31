#include "game/interactables_2/music_plant/pipe_horn.h"
#include "game/interactables_2/music_plant/french_horn.h"

// NOTE: Stored at end of rom, probably because it's configured data (like levels and
// assets?)
const Pipe_Data *const gUnknown_08C8793C[9] = {
    gUnknown_080DFCF0,
    gUnknown_080DFCF0,
    gUnknown_080DFD40,
    gUnknown_080DFD40,
    gUnknown_080DFD98,
    gUnknown_080DFDD8,
    gUnknown_080DFDD8,
    gUnknown_080DFE30,
    gUnknown_080DFE30,
};

const Pipe_Data * const gUnknown_08C87960[3] = {
    gFrenchHornPipeSequence0,
    gFrenchHornPipeSequence1,
    gFrenchHornPipeSequence2,
};
