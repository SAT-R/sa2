#ifndef GUARD_INTERACTABLE_HANDLERS_IA_PIPE_HORN_H
#define GUARD_INTERACTABLE_HANDLERS_IA_PIPE_HORN_H

#include "global.h"
#include "game/entity.h"
#include "game/interactables_2/music_plant/pipe_horn.h"

#define NUM_PIPE_HANDLERS 16

// VERY unsure about this union...
typedef union {
    s16 _16[2];
    s32 _32; // Q_24_8?
} PipeData_Weirdness;

typedef struct {
    u16 unk0;
    u16 unk2;

    PipeData_Weirdness unk4;

} Pipe_Data;

typedef void (*PipeHandler)(Sprite_Pipe_Horn *, const Pipe_Data[]);

extern const PipeHandler gPipeHandlers[NUM_PIPE_HANDLERS];

#endif
