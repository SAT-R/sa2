#include "global.h"
#include "lib/m4a/m4a.h"
#include "trig.h"
#include "sprite.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/music_plant/pipe_horn.h"
#include "game/interactables_2/music_plant/pipe_sequence.h"

#include "data/handlers_ia_pipe_horn_sequences.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ PipeSequence pipeSequence;
    /* 0x1C */ s32 entryPosX;
    /* 0x20 */ s32 entryPosY;
    /* 0x24 */ u16 kind;
    /* 0x28 */ MapEntity *me;
    /* 0x2C */ u8 spriteX;
    /* 0x2D */ u8 spriteY;
} Sprite_PipeHorn;

static void PipeHorn_Idle(void);
static void PipeHorn_BeginPipeSequence(Sprite_PipeHorn *pipe);
static bool32 PipeHorn_ShouldDespawn(Sprite_PipeHorn *);
static void PipeHorn_Despawn(Sprite_PipeHorn *);
static void Task_Active(void);
static void TaskDestructor_Pipe(struct Task *t);
static void sub_8077AAC(Sprite_PipeHorn *horn);

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

static void sub_80777C8(Sprite_PipeHorn *pipe)
{
    Player_ClearMovestate_IsInScriptedSequence();

    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_UNCURL;

    gPlayer.qSpeedAirX = gUnknown_080DFE90[pipe->kind][0];
    gPlayer.qSpeedAirY = gUnknown_080DFE90[pipe->kind][1];
    gPlayer.rotation = gUnknown_080DFEB4[pipe->kind];

    m4aSongNumStart(gUnknown_080DFED0[pipe->kind]);

    gCurTask->main = PipeHorn_Idle;
}

static bool32 PlayerIsTouchingEntry(Sprite_PipeHorn *pipe)
{
    s16 screenX, screenY;
    s16 playerX, playerY;
    s32 cSquared;

    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    screenX = pipe->entryPosX - gCamera.x;
    screenY = pipe->entryPosY - gCamera.y;

    playerX = I(gPlayer.qWorldX) - gCamera.x;
    playerY = I(gPlayer.qWorldY) - gCamera.y;

    screenX -= playerX;
    screenY -= playerY;

    cSquared = (screenX * screenX) + (screenY * screenY);
    if (cSquared <= 400) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static void PipeHorn_Idle(void)
{
    Sprite_PipeHorn *pipe = TASK_DATA(gCurTask);

    if (PlayerIsTouchingEntry(pipe)) {
        PipeHorn_BeginPipeSequence(pipe);
    }

    if (PipeHorn_ShouldDespawn(pipe)) {
        PipeHorn_Despawn(pipe);
    }
}

static void PipeHorn_BeginPipeSequence(Sprite_PipeHorn *pipe)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;

    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    InitPipeSequence(&pipe->pipeSequence, Q(pipe->entryPosX), Q(pipe->entryPosY + 4));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN2);
    gCurTask->main = Task_Active;
}

static bool32 PipeHorn_ShouldDespawn(Sprite_PipeHorn *pipe)
{
    s16 screenX, screenY;

    screenX = pipe->entryPosX - gCamera.x;
    screenY = pipe->entryPosY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void PipeHorn_Despawn(Sprite_PipeHorn *pipe)
{
    pipe->me->x = pipe->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_PipeInstrument_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(PipeHorn_Idle, sizeof(Sprite_PipeHorn), 0x2010, 0, TaskDestructor_Pipe);
    Sprite_PipeHorn *pipe = TASK_DATA(t);

    pipe->kind = me->d.sData[0];
    pipe->me = me;

    pipe->spriteX = me->x;
    pipe->spriteY = spriteY;
    pipe->entryPosX = TO_WORLD_POS(me->x, spriteRegionX);
    pipe->entryPosY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_Active(void)
{
    Sprite_PipeHorn *pipe = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = PipeHorn_Idle;
        return;
    }

    gPlayer.rotation = 0;
    gPlayer.qSpeedAirX = 1;
    gPlayer.qSpeedAirY = 0;

    if (IncrementPipeSequence(&pipe->pipeSequence, gUnknown_08C8793C[pipe->kind]) == 0) {
        sub_80777C8(pipe);
    }

    sub_8077AAC(pipe);
}

static void TaskDestructor_Pipe(struct Task *t) { }

static void sub_8077AAC(Sprite_PipeHorn *horn)
{
    gPlayer.qWorldX = horn->pipeSequence.x2;
    gPlayer.qWorldY = horn->pipeSequence.y2;
}
