#include "game/interactables_2/music_plant/pipe_horn.h"

// NOTE: Stored at end of rom, probably because it's configured data (like levels and
// assets?) it's made up of pointers defined in pipe_horn.c
// see data/handlers_ia_pipe_horn_sequences.s
extern const Pipe_Data (*gUnknown_08C8793C[9])[];
extern const Pipe_Data (*gUnknown_08C87960[3])[];
