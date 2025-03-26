#include "global.h"
#include "lib/m4a/m4a.h"
#include "trig.h"
#include "sprite.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/music_plant/pipe_horn.h"

#include "data/handlers_ia_pipe_horn_sequences.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

static void Handler_MusicPlant_Pipe_0(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_1(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_2(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_3(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_4(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_5(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_6(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_7(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_8(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_9(Sprite_PipeHorn *, const Pipe_Data *);
static void Handler_MusicPlant_Pipe_10(Sprite_PipeHorn *, const Pipe_Data *);
static void sub_80778AC(void);
static void sub_80778E4(Sprite_PipeHorn *pipe);
static bool32 sub_807794C(Sprite_PipeHorn *);
static void sub_8077994(Sprite_PipeHorn *);
static void sub_8077A3C(void);
static void TaskDestructor_Pipe(struct Task *t);
static void sub_8077AAC(Sprite_PipeHorn *horn);

typedef void (*PipeHandler)(Sprite_PipeHorn *, const Pipe_Data *);

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

const Pipe_Data gUnknown_080DFCF0[] = {
    {
        0,
        34,
        { ._32 = Q(8.0) },
    },
    {
        0,
        204,
        { ._32 = Q(80.0) },
    },
    {
        2,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        256,
        { ._16 = { Q_8_8(0.0), Q_8_8(64.0) } },
    },
    {
        4,
        320,
        { ._32 = Q(20.0) },
    },
    {
        1,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        512,
        { ._16 = { Q_8_8(0.0), Q_8_8(-32.0) } },
    },
    { -1, -1, { ._32 = -1 } },
};

const Pipe_Data gUnknown_080DFD40[] = {
    {
        0,
        34,
        { ._32 = Q(8.0) },
    },
    {
        0,
        204,
        { ._32 = Q(80.0) },
    },
    {
        2,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        256,
        { ._16 = { Q_8_8(0.0), Q_8_8(64.0) } },
    },
    {
        4,
        320,
        { ._32 = Q(20.0) },
    },
    {
        1,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        409,
        { ._16 = { Q_8_8(0.0), Q_8_8(-40.0) } },
    },
    { -1, -1, { ._32 = -1 } },
};

const Pipe_Data gUnknown_080DFD98[] = {
    {
        0,
        34,
        { ._32 = Q(8.0) },
    },
    {
        0,
        204,
        { ._32 = Q(80.0) },
    },
    {
        2,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        256,
        { ._16 = { Q_8_8(0.0), Q_8_8(64.0) } },
    },
    {
        4,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        157,
        { ._16 = { Q_8_8(80.0), Q_8_8(-74.0) } },
    },
    {
        0,
        157,
        { ._16 = { Q_8_8(80.0), Q_8_8(-74.0) } },
    },
    { -1, -1, { ._32 = -1 } },
};

const Pipe_Data gUnknown_080DFDD8[] = {
    {
        0,
        34,
        { ._32 = Q(8.0) },
    },
    {
        0,
        170,
        { ._32 = Q(96.0) },
    },
    {
        0,
        256,
        { ._32 = Q(64.0) },
    },
    {
        2,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        292,
        { ._16 = { Q_8_8(0.0), Q_8_8(56.0) } },
    },
    {
        4,
        320,
        { ._32 = Q(20.0) },
    },
    {
        1,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        227,
        { ._16 = { Q_8_8(0.0), Q_8_8(-72.0) } },
    },
    { -1, -1, { ._32 = -1 } },
};

const Pipe_Data gUnknown_080DFE30[] = {
    {
        0,
        34,
        { ._32 = Q(8.0) },
    },
    {
        0,
        170,
        { ._32 = Q(96.0) },
    },
    {
        0,
        256,
        { ._32 = Q(64.0) },
    },
    {
        2,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        292,
        { ._16 = { (0.0), Q_8_8(56.0) } },
    },
    {
        4,
        320,
        { ._32 = Q(20.0) },
    },
    {
        1,
        320,
        { ._32 = Q(20.0) },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        170,
        { ._16 = { Q_8_8(0.0), Q_8_8(-96.0) } },
    },
    {
        0,
        227,
        { ._16 = { Q_8_8(0.0), Q_8_8(-72.0) } },
    },
    {
        -1,
        -1,
        { ._32 = -1 },
    },
};

const s16 gUnknown_080DFE90[9][2] = {
    { Q_8_8(0.0), Q_8_8(-9.0) },  { Q_8_8(0.0), Q_8_8(-12.0) }, { Q_8_8(0.0), Q_8_8(-9.0) },
    { Q_8_8(0.0), Q_8_8(-12.0) }, { Q_8_8(9.0), Q_8_8(-9.0) },  { Q_8_8(0.0), Q_8_8(-9.0) },
    { Q_8_8(0.0), Q_8_8(-12.0) }, { Q_8_8(0.0), Q_8_8(-9.0) },  { Q_8_8(0.0), Q_8_8(-12.0) },
};

const s16 gUnknown_080DFEB4[14] = {
    Q_8_8(0.75), Q_8_8(0.75), Q_8_8(0.75),   Q_8_8(0.75),   Q_8_8(0.875),   Q_8_8(0.75),   Q_8_8(0.75),
    Q_8_8(0.75), Q_8_8(0.75), Q_8_8(-63.25), Q_8_8(-63.25), Q_8_8(-63.125), Q_8_8(-63.25), Q_8_8(0.75),
};

const u16 gUnknown_080DFED0[10] = {
    SE_MUSIC_PLANT_EXIT_HORN2, SE_MUSIC_PLANT_HORN3, SE_MUSIC_PLANT_EXIT_HORN2, SE_MUSIC_PLANT_HORN3, SE_MUSIC_PLANT_EXIT_HORN2,
    SE_MUSIC_PLANT_EXIT_HORN2, SE_MUSIC_PLANT_HORN3, SE_MUSIC_PLANT_EXIT_HORN2, SE_MUSIC_PLANT_HORN3, MUS_DUMMY,
};

static void Handler_MusicPlant_Pipe_0(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s32 r0, r3, r5, r6, r7;
#ifndef NON_MATCHING
    s32 r1;
#else
    s16 r1;
#endif

    r1 = (u16)data[pipe->unk18].unk4._16[1];
    r0 = data[pipe->unk18].unk4._16[0];
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

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        pipe->x1 = pipe->x1 - r7;
        pipe->y1 = pipe->y1 - -r1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_1(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(90) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 - r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(0);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(0);
        pipe->y1 = I(sin * r5) + pipe->y1 - r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_2(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) + index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 + r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(0);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(0);
        pipe->y1 = I(sin * r5) + pipe->y1 + r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_3(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (index)&ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 - r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(90);
        pipe->x1 = I(cos * r5) + pipe->x1 - r5;

        sin = SIN_DEG(90);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_4(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(180) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(90);
        pipe->x1 = I(cos * r5) + pipe->x1 + r5;

        sin = SIN_DEG(90);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_5(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (index + DEG_TO_SIN(90)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 - r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(180);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(180);
        pipe->y1 = I(sin * r5) + pipe->y1 - r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_6(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(270) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1 + r5;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(180);
        pipe->x1 = I(cos * r5) + pipe->x1;

        sin = SIN_DEG(180);
        pipe->y1 = I(sin * r5) + pipe->y1 + r5;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_7(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u32 index = ((u16)pipe->unk1A >> 2);
    u16 sinIndex = (DEG_TO_SIN(360) - index) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 - r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(270);
        pipe->x1 = I(cos * r5) + pipe->x1;
        pipe->x1 -= r5;

        sin = SIN_DEG(270);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_8(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u16 sinIndex = (((u16)pipe->unk1A >> 2) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(270);
        pipe->x1 = I(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_DEG(270);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_9(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s32 sin, cos;
    s32 sin2;
    s32 r8, r9;
    s32 r7 = data[pipe->unk18].unk4._32;
    u16 sinIndex = (((u16)pipe->unk1A >> 3) + DEG_TO_SIN(315)) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    r8 = r7 * cos;

    sin = SIN_DEG(135);
    r9 = r7 * sin;
    pipe->x2 = I(r8 - r9) + pipe->x1;

    sin2 = (SIN_24_8(sinIndex) + SIN_DEG(45));
    pipe->y2 = I(sin2 * r7) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = SIN_DEG(90) * r7;
        pipe->x1 = I(cos - r9) + pipe->x1;

        pipe->y1 = I((SIN_DEG(0) + SIN_DEG(45)) * r7) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

static void Handler_MusicPlant_Pipe_10(Sprite_PipeHorn *pipe, const Pipe_Data data[])
{
    s16 sin, cos;
    s32 r5 = data[pipe->unk18].unk4._32;
    u16 sinIndex = (((u16)pipe->unk1A >> 3) + 512) & ONE_CYCLE;

    cos = COS_24_8(sinIndex);
    pipe->x2 = I(cos * r5) + pipe->x1 + r5;

    sin = SIN_24_8(sinIndex);
    pipe->y2 = I(sin * r5) + pipe->y1;

    pipe->unk1A += data[pipe->unk18].unk2;

    if (pipe->unk1A >= 1024U) {
        u32 value;
        pipe->unk1A -= 1024;

        cos = COS_DEG(225);
        pipe->x1 = I(cos * r5) + pipe->x1;
        pipe->x1 += r5;

        sin = SIN_DEG(225);
        pipe->y1 = I(sin * r5) + pipe->y1;

        value = data[++pipe->unk18].unk0;
        if (value == (u16)-1) {
            pipe->unk18 |= value;
        }
    }
}

void sub_8077774(Sprite_PipeHorn *pipe, s32 x, s32 y)
{
    pipe->x0 = x;
    pipe->y0 = y;
    pipe->x1 = x;
    pipe->y1 = y;
    pipe->x2 = x;
    pipe->y2 = y;
    pipe->unk18 = 0;
    pipe->unk1A = 0;
}

bool32 sub_8077788(Sprite_PipeHorn *pipe, const Pipe_Data *data)
{
    u32 result;
    if (pipe->unk18 == (u16)-1) {
        return FALSE;
    }

    gPipeHandlers[data[pipe->unk18].unk0](pipe, data);

    result = pipe->unk18;
    result ^= (u16)-1;

    return (-result | result) >> 31;
}

static void sub_80777C8(Sprite_PipeHorn *pipe)
{
    Player_ClearMovestate_IsInScriptedSequence();

    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_UNCURL;

    gPlayer.qSpeedAirX = gUnknown_080DFE90[pipe->kind][0];
    gPlayer.qSpeedAirY = gUnknown_080DFE90[pipe->kind][1];
    gPlayer.rotation = gUnknown_080DFEB4[pipe->kind];

    m4aSongNumStart(gUnknown_080DFED0[pipe->kind]);

    gCurTask->main = sub_80778AC;
}

// NOTE: sub_8077840 is identical with sub_8077B98
static bool32 sub_8077840(Sprite_PipeHorn *pipe)
{
    // NOTE: This matches... but at what cost? D:
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        goto sub_8077B98_ret0;
    } else {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s32 cSquared;

        screenX = pipe->posX - gCamera.x;
        screenY = pipe->posY - gCamera.y;

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;

        screenX -= playerX;
        screenY -= playerY;

        cSquared = (screenX * screenX) + (screenY * screenY);
        if (cSquared > 400) {
        sub_8077B98_ret0:
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

static void sub_80778AC(void)
{
    Sprite_PipeHorn *pipe = TASK_DATA(gCurTask);

    if (sub_8077840(pipe)) {
        sub_80778E4(pipe);
    }

    if (sub_807794C(pipe)) {
        sub_8077994(pipe);
    }
}

static void sub_80778E4(Sprite_PipeHorn *pipe)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;

    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    sub_8077774(pipe, Q(pipe->posX), Q(pipe->posY + 4));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN2);
    gCurTask->main = sub_8077A3C;
}

static bool32 sub_807794C(Sprite_PipeHorn *pipe)
{
    s16 screenX, screenY;

    screenX = pipe->posX - gCamera.x;
    screenY = pipe->posY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8077994(Sprite_PipeHorn *pipe)
{
    pipe->me->x = pipe->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_PipeInstrument_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80778AC, sizeof(Sprite_PipeHorn), 0x2010, 0, TaskDestructor_Pipe);
    Sprite_PipeHorn *pipe = TASK_DATA(t);

    pipe->kind = me->d.sData[0];
    pipe->me = me;

    pipe->spriteX = me->x;
    pipe->spriteY = spriteY;
    pipe->posX = TO_WORLD_POS(me->x, spriteRegionX);
    pipe->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_8077A3C(void)
{
    Sprite_PipeHorn *pipe = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = sub_80778AC;
    } else {
        gPlayer.rotation = 0;
        gPlayer.qSpeedAirX = 1;
        gPlayer.qSpeedAirY = 0;

        if (sub_8077788(pipe, gUnknown_08C8793C[pipe->kind]) == 0) {
            sub_80777C8(pipe);
        }

        sub_8077AAC(pipe);
    }
}

static void TaskDestructor_Pipe(struct Task *t) { }

static void sub_8077AAC(Sprite_PipeHorn *horn)
{
    gPlayer.qWorldX = horn->x2;
    gPlayer.qWorldY = horn->y2;
}
