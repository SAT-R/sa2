#ifndef GUARD_INTERACTABLE_PIPE_SEQUENCE_H
#define GUARD_INTERACTABLE_PIPE_SEQUENCE_H

#include "global.h"
#include "game/entity.h"

typedef struct {
    /* 0x00 */ s32 x0;
    /* 0x04 */ s32 y0;
    /* 0x08 */ s32 baseX;
    /* 0x0C */ s32 baseY;
    /* 0x10 */ s32 playerX;
    /* 0x14 */ s32 playerY;
    /* 0x18 */ u16 index;
    /* 0x1A */ s16 accumulator;
} PipeSequence;

typedef struct {
    s16 dX;
    s16 dY;
} PosOffset;

// VERY unsure about this union...
typedef union {
    s16 _16[2];
    s32 _32; // Q_24_8?
    PosOffset posOffset;
    s32 offset;
} PipeData_Weirdness;

typedef struct Pipe_Data {
    u16 type;
    u16 step;
    PipeData_Weirdness d;
} Pipe_Data;

bool32 IncrementPipeSequence(PipeSequence *pipe, const Pipe_Data *data);
void InitPipeSequence(PipeSequence *pipe, s32 x, s32 y);

#endif // GUARD_INTERACTABLE_PIPE_SEQUENCE_H
