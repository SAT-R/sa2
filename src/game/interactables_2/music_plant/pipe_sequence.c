#include "global.h"
#include "lib/m4a/m4a.h"
#include "trig.h"
#include "sprite.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/music_plant/pipe_sequence.h"

#include "data/handlers_ia_pipe_horn_sequences.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

static void PipeSegmentHandler_Translate(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_1(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_2(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_3(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_4(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_5(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_6(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_7(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_8(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_9(PipeSequence *, const PipeSegment *);
static void Handler_MusicPlant_Pipe_10(PipeSequence *, const PipeSegment *);

typedef void (*PipeHandler)(PipeSequence *, const PipeSegment *);

static const PipeHandler sHandlers[NUM_PIPE_SEGMENT_TYPES] = {
    [PIPE_SEGMENT_TYPE_TRANSLATE] = PipeSegmentHandler_Translate,
    Handler_MusicPlant_Pipe_1,
    Handler_MusicPlant_Pipe_2,
    Handler_MusicPlant_Pipe_3,
    Handler_MusicPlant_Pipe_4,
    Handler_MusicPlant_Pipe_5,
    Handler_MusicPlant_Pipe_6,
    Handler_MusicPlant_Pipe_7,
    Handler_MusicPlant_Pipe_8,
    Handler_MusicPlant_Pipe_9,
    Handler_MusicPlant_Pipe_10,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
};

static void PipeSegmentHandler_Translate(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s32 offsetDx, segmentBaseX, negOffsetDy, segmentBaseY, negOffsetDx;
#ifndef NON_MATCHING
    s32 offsetDy;
#else
    s16 offsetDy;
#endif

    offsetDy = (u16)data[pipeSequence->index].d.translate.dY;
    offsetDx = data[pipeSequence->index].d.translate.dX;
    segmentBaseX = pipeSequence->segmentBaseX;
    negOffsetDx = -offsetDx;
    pipeSequence->currentX = segmentBaseX - ((pipeSequence->accumulator * negOffsetDx) >> 10);

#ifndef NON_MATCHING
    offsetDy <<= 0x10;
    offsetDy >>= 0x10;
#endif

    segmentBaseY = pipeSequence->segmentBaseY;
    negOffsetDy = -offsetDy;
    pipeSequence->currentY = segmentBaseY - ((negOffsetDy * pipeSequence->accumulator) >> 10);

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 nextType;
        pipeSequence->accumulator -= SIN_PERIOD;

        pipeSequence->segmentBaseX = pipeSequence->segmentBaseX - negOffsetDx;
        pipeSequence->segmentBaseY = pipeSequence->segmentBaseY - negOffsetDy;

        nextType = data[++pipeSequence->index].type;
        if (nextType == (u16)-1) {
            // Complete
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_1(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = (u16)pipeSequence->accumulator >> 2;
    u16 sinIndex = (DEG_TO_SIN(90) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY - r5;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(0);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX;

        sin = SIN_DEG(0);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY - r5;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_2(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = ((u16)pipeSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) + index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY + r5;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(0);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX;

        sin = SIN_DEG(0);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY + r5;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_3(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = ((u16)pipeSequence->accumulator >> 2);
    u16 sinIndex = (index)&ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX - r5;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(90);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX - r5;

        sin = SIN_DEG(90);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_4(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = ((u16)pipeSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(180) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX + r5;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(90);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX + r5;

        sin = SIN_DEG(90);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_5(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = ((u16)pipeSequence->accumulator >> 2);
    u16 sinIndex = (index + DEG_TO_SIN(90)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY - r5;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(180);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX;

        sin = SIN_DEG(180);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY - r5;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_6(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = ((u16)pipeSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY + r5;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(180);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX;

        sin = SIN_DEG(180);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY + r5;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_7(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u32 index = ((u16)pipeSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(360) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX - r5;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(270);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX - r5;

        sin = SIN_DEG(270);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_8(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u16 sinIndex = (((u16)pipeSequence->accumulator >> 2) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX + r5;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(270);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX + r5;

        sin = SIN_DEG(270);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_9(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s32 sin, cos;
    s32 sin2;
    s32 r8, r9;
    s32 r7 = data[pipeSequence->index].d._32;
    u16 sinIndex = (((u16)pipeSequence->accumulator >> 3) + DEG_TO_SIN(315)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    r8 = r7 * cos;

    sin = SIN_DEG(135);
    r9 = r7 * sin;
    pipeSequence->currentX = I(r8 - r9) + pipeSequence->segmentBaseX;

    sin2 = (SIN_24_8(sinIndex) + SIN_DEG(45));
    pipeSequence->currentY = I(sin2 * r7) + pipeSequence->segmentBaseY;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = SIN_DEG(90) * r7;
        pipeSequence->segmentBaseX = I(cos - r9) + pipeSequence->segmentBaseX;

        pipeSequence->segmentBaseY = I((SIN_DEG(0) + SIN_DEG(45)) * r7) + pipeSequence->segmentBaseY;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_10(PipeSequence *pipeSequence, const PipeSegment data[])
{
    s16 sin, cos;
    s32 r5 = data[pipeSequence->index].d._32;
    u16 sinIndex = (((u16)pipeSequence->accumulator >> 3) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipeSequence->currentX = I(cos * r5) + pipeSequence->segmentBaseX + r5;

    sin = SIN_24_8(sinIndex);
    pipeSequence->currentY = I(sin * r5) + pipeSequence->segmentBaseY;

    pipeSequence->accumulator += data[pipeSequence->index].step;

    if (pipeSequence->accumulator >= (unsigned)SIN_PERIOD) {
        u32 value;
        pipeSequence->accumulator -= SIN_PERIOD;

        cos = COS_DEG(225);
        pipeSequence->segmentBaseX = I(cos * r5) + pipeSequence->segmentBaseX + r5;

        sin = SIN_DEG(225);
        pipeSequence->segmentBaseY = I(sin * r5) + pipeSequence->segmentBaseY;

        value = data[++pipeSequence->index].type;
        if (value == (u16)-1) {
            pipeSequence->index |= value;
        }
    }
}

void InitPipeSequence(PipeSequence *pipeSequence, s32 x, s32 y)
{
    pipeSequence->initialX = x;
    pipeSequence->initialY = y;
    pipeSequence->segmentBaseX = x;
    pipeSequence->segmentBaseY = y;
    pipeSequence->currentX = x;
    pipeSequence->currentY = y;
    pipeSequence->index = 0;
    pipeSequence->accumulator = 0;
}

bool32 IncrementPipeSequence(PipeSequence *pipeSequence, const PipeSegment *data)
{
    u32 result;
    if (pipeSequence->index == (u16)-1) {
        return FALSE;
    }

    sHandlers[data[pipeSequence->index].type](pipeSequence, data);

    result = pipeSequence->index;
    result ^= (u16)-1;

    return (-result | result) >> 31;
}
