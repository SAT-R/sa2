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

#define NUM_PIPE_HANDLERS 16

static void Handler_MusicPlant_Pipe_0(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_1(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_2(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_3(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_4(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_5(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_6(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_7(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_8(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_9(PipeSequence *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_10(PipeSequence *, const Pipe_Data *);

typedef void (*PipeHandler)(PipeSequence *, const Pipe_Data *);

// These functions control the character when they enter
// one of the horns or pipes in Music Plant.
static const PipeHandler gPipeHandlers[NUM_PIPE_HANDLERS] = {
    Handler_MusicPlant_Pipe_0,
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

static void Handler_MusicPlant_Pipe_0(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s32 offsetDx, baseX, negOffsetDy, baseY, negOffsetDx;
#ifndef NON_MATCHING
    s32 offsetDy;
#else
    s16 offsetDy;
#endif

    offsetDy = (u16)data[pipSequence->index].d._16[1];
    offsetDx = data[pipSequence->index].d._16[0];
    baseX = pipSequence->baseX;
    negOffsetDx = -offsetDx;
    pipSequence->playerX = baseX - ((pipSequence->accumulator * negOffsetDx) >> 10);

#ifndef NON_MATCHING
    offsetDy <<= 0x10;
    offsetDy >>= 0x10;
#endif

    baseY = pipSequence->baseY;
    negOffsetDy = -offsetDy;
    pipSequence->playerY = baseY - ((negOffsetDy * pipSequence->accumulator) >> 10);

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 nextType;
        pipSequence->accumulator -= 1024;

        pipSequence->baseX = pipSequence->baseX - negOffsetDx;
        pipSequence->baseY = pipSequence->baseY - negOffsetDy;

        nextType = data[++pipSequence->index].type;
        if (nextType == (u16)-1) {
            // Complete
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_1(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(90) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY - r5;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(0);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;

        sin = SIN_DEG(0);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY - r5;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_2(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) + index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY + r5;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(0);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;

        sin = SIN_DEG(0);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY + r5;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_3(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (index)&ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX - r5;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(90);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX - r5;

        sin = SIN_DEG(90);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_4(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(180) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX + r5;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(90);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX + r5;

        sin = SIN_DEG(90);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_5(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (index + DEG_TO_SIN(90)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY - r5;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(180);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;

        sin = SIN_DEG(180);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY - r5;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_6(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY + r5;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(180);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;

        sin = SIN_DEG(180);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY + r5;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_7(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u32 index = ((u16)pipSequence->accumulator >> 2);
    u16 sinIndex = (DEG_TO_SIN(360) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX - r5;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(270);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;
        pipSequence->baseX -= r5;

        sin = SIN_DEG(270);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_8(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u16 sinIndex = (((u16)pipSequence->accumulator >> 2) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX + r5;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(270);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;
        pipSequence->baseX += r5;

        sin = SIN_DEG(270);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_9(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s32 sin, cos;
    s32 sin2;
    s32 r8, r9;
    s32 r7 = data[pipSequence->index].d._32;
    u16 sinIndex = (((u16)pipSequence->accumulator >> 3) + DEG_TO_SIN(315)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    r8 = r7 * cos;

    sin = SIN_DEG(135);
    r9 = r7 * sin;
    pipSequence->playerX = I(r8 - r9) + pipSequence->baseX;

    sin2 = (SIN_24_8(sinIndex) + SIN_DEG(45));
    pipSequence->playerY = I(sin2 * r7) + pipSequence->baseY;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = SIN_DEG(90) * r7;
        pipSequence->baseX = I(cos - r9) + pipSequence->baseX;

        pipSequence->baseY = I((SIN_DEG(0) + SIN_DEG(45)) * r7) + pipSequence->baseY;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_10(PipeSequence *pipSequence, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipSequence->index].d._32;
    u16 sinIndex = (((u16)pipSequence->accumulator >> 3) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipSequence->playerX = I(cos * r5) + pipSequence->baseX + r5;

    sin = SIN_24_8(sinIndex);
    pipSequence->playerY = I(sin * r5) + pipSequence->baseY;

    pipSequence->accumulator += data[pipSequence->index].step;

    if (pipSequence->accumulator >= 1024U) {
        u32 value;
        pipSequence->accumulator -= 1024;

        cos = COS_DEG(225);
        pipSequence->baseX = I(cos * r5) + pipSequence->baseX;
        pipSequence->baseX += r5;

        sin = SIN_DEG(225);
        pipSequence->baseY = I(sin * r5) + pipSequence->baseY;

        value = data[++pipSequence->index].type;
        if (value == (u16)-1) {
            pipSequence->index |= value;
        }
    }
}

void InitPipeSequence(PipeSequence *pipSequence, s32 x, s32 y)
{
    pipSequence->x0 = x;
    pipSequence->y0 = y;
    pipSequence->baseX = x;
    pipSequence->baseY = y;
    pipSequence->playerX = x;
    pipSequence->playerY = y;
    pipSequence->index = 0;
    pipSequence->accumulator = 0;
}

bool32 IncrementPipeSequence(PipeSequence *pipSequence, const Pipe_Data *data)
{
    u32 result;
    if (pipSequence->index == (u16)-1) {
        return FALSE;
    }

    gPipeHandlers[data[pipSequence->index].type](pipSequence, data);

    result = pipSequence->index;
    result ^= (u16)-1;

    return (-result | result) >> 31;
}
