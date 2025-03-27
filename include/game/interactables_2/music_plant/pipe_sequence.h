#ifndef GUARD_INTERACTABLE_PIPE_SEQUENCE_H
#define GUARD_INTERACTABLE_PIPE_SEQUENCE_H

#include "global.h"
#include "game/entity.h"

typedef struct {
    /* 0x00 */ s32 x0;
    /* 0x04 */ s32 y0;
    /* 0x08 */ s32 x1;
    /* 0x0C */ s32 y1;
    /* 0x10 */ s32 x2;
    /* 0x14 */ s32 y2;
    /* 0x18 */ u16 keyFrame;
    /* 0x1A */ s16 unk1A;
} PipeSequence;

// VERY unsure about this union...
typedef union {
    s16 _16[2];
    s32 _32; // Q_24_8?
} PipeData_Weirdness;

typedef struct Pipe_Data {
    u16 unk0;
    u16 unk2;
    PipeData_Weirdness unk4;
} Pipe_Data;

bool32 IncrementPipeSequence(PipeSequence *pipe, const Pipe_Data *data);
void InitPipeSequence(PipeSequence *pipe, s32 x, s32 y);

#endif // GUARD_INTERACTABLE_PIPE_SEQUENCE_H
