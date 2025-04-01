#ifndef GUARD_INTERACTABLE_PIPE_SEQUENCE_H
#define GUARD_INTERACTABLE_PIPE_SEQUENCE_H

#include "global.h"
#include "game/entity.h"

#define NUM_PIPE_SEGMENT_TYPES      16
#define PIPE_SEGMENT_TYPE_TRANSLATE 0

typedef struct {
    /* 0x00 */ s32 initialX;
    /* 0x04 */ s32 initialY;
    /* 0x08 */ s32 segmentBaseX;
    /* 0x0C */ s32 segmentBaseY;
    /* 0x10 */ s32 currentX;
    /* 0x14 */ s32 currentY;
    /* 0x18 */ u16 index;
    /* 0x1A */ s16 accumulator;
} PipeSequence;

typedef struct {
    s16 dX;
    s16 dY;
} OffsetPos;

// VERY unsure about this union...
typedef union {
    s16 _16[2];
    s32 _32; // Q_24_8?
    OffsetPos translate;
    s32 offset;
} PipeData_Weirdness;

typedef struct PipeSegment {
    u16 type;
    u16 step;
    PipeData_Weirdness d;
} PipeSegment;

bool32 IncrementPipeSequence(PipeSequence *pipe, const PipeSegment *data);
void InitPipeSequence(PipeSequence *pipe, s32 x, s32 y);

#endif // GUARD_INTERACTABLE_PIPE_SEQUENCE_H
