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
const PipeHandler gPipeHandlers[NUM_PIPE_HANDLERS] = {
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

static void Handler_MusicPlant_Pipe_0(PipeSequence *pipe, const Pipe_Data data[])
{
    s32 r0, r3, r5, r6, r7;
#ifndef NON_MATCHING
    s32 r1;
#else
    s16 r1;
#endif

    r1 = (u16)data[pipe->keyFrame].unk4._16[1];
    r0 = data[pipe->keyFrame].unk4._16[0];
    r3 = pipe->x1;
    r7 = -r0;
    pipe->x2 = r3 - ((pipe->unk1A * r7) >> 10);

#ifndef NON_MATCHING
    r1 <<= 0x10;
    r1 >>= 0x10;
#endif

    r6 = pipe->y1;
    r5 = -r1;
    pipe->y2 = r6 - ((r5 * pipe->unk1A) >> 10);

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        pipe->x1 = pipe->x1 - r7;
        pipe->y1 = pipe->y1 - -r1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_1(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(90) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 - r5;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(0);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(0);
        pipe->y1 = I(sin * r5) + pipe->y1 - r5;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_2(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) + index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 + r5;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(0);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(0);
        pipe->y1 = I(sin * r5) + pipe->y1 + r5;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_3(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (index)&ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 - r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(90);
        pipe->x1 = I(cos * r5) + pipe->x1 - r5;

        sin = SIN_DEG(90);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_4(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(180) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(90);
        pipe->x1 = I(cos * r5) + pipe->x1 + r5;

        sin = SIN_DEG(90);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_5(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (index + DEG_TO_SIN(90)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 - r5;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(180);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(180);
        pipe->y1 = I(sin * r5) + pipe->y1 - r5;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_6(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 + r5;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(180);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(180);
        pipe->y1 = I(sin * r5) + pipe->y1 + r5;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_7(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(360) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 - r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(270);
        pipe->x1 = I(cos * r5) + pipe->x1;
        pipe->x1 -= r5;

        sin = SIN_DEG(270);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_8(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u16 sinIndex = (((u16)pipe->unk1A >> 2) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(270);
        pipe->x1 = I(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_DEG(270);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_9(PipeSequence *pipe, const Pipe_Data data[])
{
    s32 sin, cos;
    s32 sin2;
    s32 r8, r9;
    s32 r7 = data[pipe->keyFrame].unk4._32;
    u16 sinIndex = (((u16)pipe->unk1A >> 3) + DEG_TO_SIN(315)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    r8 = r7 * cos;

    sin = SIN_DEG(135);
    r9 = r7 * sin;
    pipe->x2 = I(r8 - r9) + pipe->x1;

    sin2 = (SIN_24_8(sinIndex) + SIN_DEG(45));
    pipe->y2 = I(sin2 * r7) + pipe->y1;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = SIN_DEG(90) * r7;
        pipe->x1 = I(cos - r9) + pipe->x1;

        pipe->y1 = I((SIN_DEG(0) + SIN_DEG(45)) * r7) + pipe->y1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= -1;
        }
    }
}

static void Handler_MusicPlant_Pipe_10(PipeSequence *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->keyFrame].unk4._32;
    u16 sinIndex = (((u16)pipe->unk1A >> 3) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->keyFrame].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(225);
        pipe->x1 = I(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_DEG(225);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->keyFrame].unk0;
        if (value == (u16)-1) {
            pipe->keyFrame |= value;
        }
    }
}

void InitPipeSequence(PipeSequence *pipe, s32 x, s32 y)
{
    pipe->x0 = x;
    pipe->y0 = y;
    pipe->x1 = x;
    pipe->y1 = y;
    pipe->x2 = x;
    pipe->y2 = y;
    pipe->keyFrame = 0;
    pipe->unk1A = 0;
}

bool32 IncrementPipeSequence(PipeSequence *pipe, const Pipe_Data *data)
{
    u32 result;
    if (pipe->keyFrame == (u16)-1) {
        return FALSE;
    }

    gPipeHandlers[data[pipe->keyFrame].unk0](pipe, data);

    result = pipe->keyFrame;
    result ^= (u16)-1;

    return (-result | result) >> 31;
}
