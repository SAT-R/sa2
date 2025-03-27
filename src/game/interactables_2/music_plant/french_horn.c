#include "core.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/interactables_2/music_plant/french_horn.h"
#include "game/interactables_2/music_plant/pipe_sequence.h"

#include "constants/move_states.h"
#include "constants/player_transitions.h"
#include "constants/char_states.h"
#include "constants/songs.h"

#include "data/handlers_ia_pipe_horn_sequences.h"

typedef struct {
    /* 0x00 */ PipeSequence pipeSequence;
    /* 0x1C */ s32 entryPosX;
    /* 0x20 */ s32 entryPosY;
    /* 0x24 */ u16 kind;
    /* 0x28 */ MapEntity *me;
    /* 0x2C */ u8 spriteX;
    /* 0x2D */ u8 spriteY;
} Sprite_FrenchHorn;

static void FrenchHorn_BeginPipeSequence(Sprite_FrenchHorn *);
static bool32 sub_8077CB0(Sprite_FrenchHorn *);
static void FrenchHorn_UpdatePlayerPos(Sprite_FrenchHorn *);
static void FrenchHorn_HandleExit(Sprite_FrenchHorn *);
static void Task_FrenchHorn_Idle(void);
static void FrenchHorn_Despawn(Sprite_FrenchHorn *);
static void TaskDestructor_FrenchHorn(struct Task *);

const Pipe_Data gUnknown_080DFEE4[] = {
    {
        0,
        34,
        { ._16 = { Q_8_8(8.0), Q_8_8(8.0) } },
    },
    {
        0,
        120,
        { ._16 = { Q_8_8(96.0), Q_8_8(96.0) } },
    },
    {
        0,
        341,
        { ._16 = { Q_8_8(32.0), Q_8_8(32.0) } },
    },
    {
        9,
        640,
        { ._32 = Q(40.0) },
    },
    {
        3,
        320,
        { ._32 = Q(56.0) },
    },
    {
        5,
        320,
        { ._32 = Q(56.0) },
    },
    {
        10,
        640,
        { ._32 = Q(48.0) },
    },
    {
        0,
        146,
        { ._16 = { Q_8_8(84.0), Q_8_8(-84.0) } },
    },
    { 0, 120, { ._32 = Q(96.0) } },
    { 0, 292, { ._32 = Q(56.0) } },
    {
        -1,
        -1,
        { ._32 = -1 },
    },
};
const Pipe_Data gUnknown_080DFF3C[] = {
    {
        0,
        34,
        { ._16 = { Q_8_8(8.0), Q_8_8(8.0) } },
    },
    {
        0,
        120,
        { ._16 = { Q_8_8(96.0), Q_8_8(96.0) } },
    },
    {
        0,
        341,
        { ._16 = { Q_8_8(32.0), Q_8_8(32.0) } },
    },
    {
        9,
        640,
        { ._16 = { Q_8_8(40.0), Q_8_8(0.0) } },
    },
    {
        3,
        320,
        { ._16 = { Q_8_8(56.0), Q_8_8(0.0) } },
    },
    {
        5,
        320,
        { ._16 = { Q_8_8(56.0), Q_8_8(0.0) } },
    },
    {
        10,
        640,
        { ._16 = { Q_8_8(48.0), Q_8_8(0.0) } },
    },
    {
        0,
        146,
        { ._16 = { Q_8_8(84.0), Q_8_8(-84.0) } },
    },
    {
        0,
        120,
        { ._32 = Q(96.0) },
    },
    {
        0,
        120,
        { ._32 = Q(96.0) },
    },
    {
        0,
        292,
        { ._32 = Q(56.0) },
    },
    {
        -1,
        -1,
        { ._32 = -1 },
    },
};
const Pipe_Data gUnknown_080DFF9C[] = {
    {
        0,
        34,
        { ._16 = { Q_8_8(8.0), Q_8_8(8.0) } },
    },
    {
        0,
        120,
        { ._16 = { Q_8_8(96.0), Q_8_8(96.0) } },
    },
    {
        0,
        341,
        { ._16 = { Q_8_8(32.0), Q_8_8(32.0) } },
    },
    {
        9,
        640,
        { ._32 = Q(40.0) },
    },
    {
        3,
        320,
        { ._32 = Q(56.0) },
    },
    {
        5,
        320,
        { ._32 = Q(56.0) },
    },
    {
        10,
        640,
        { ._32 = Q(48.0) },
    },
    {
        0,
        146,
        { ._16 = { Q_8_8(84.0), Q_8_8(-84.0) } },
    },
    {
        0,
        120,
        { ._16 = { Q_8_8(96.0), Q_8_8(-96.0) } },
    },
    {
        0,
        341,
        { ._16 = { Q_8_8(32.0), Q_8_8(-32.0) } },
    },
    {
        -1,
        -1,
        { ._32 = -1 },
    },
};

static const s16 gUnknown_080DFFF4[3][2] = {
    { Q_8_8(9), Q_8_8(0) },
    { Q_8_8(12), Q_8_8(0) },
    { Q_8_8(9), Q_8_8(-9) },
};

static const s16 gUnknown_080E0000[4] = {
    Q_8_8(0),
    Q_8_8(0),
    Q_8_8(7. / 8.),
    Q_8_8(0),
};

static void Task_FrenchHorn_Active(void)
{
    Sprite_FrenchHorn *horn = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = Task_FrenchHorn_Idle;
    } else {
        gPlayer.rotation = 0x20;

        gPlayer.qSpeedAirX = 1;
        gPlayer.qSpeedAirY = 1;

        if (IncrementPipeSequence(&horn->pipeSequence, gUnknown_08C87960[horn->kind]) == 0) {
            FrenchHorn_HandleExit(horn);
        }

        FrenchHorn_UpdatePlayerPos(horn);
    }
}

static void FrenchHorn_HandleExit(Sprite_FrenchHorn *horn)
{
#ifndef MODERN
    Player_ClearMovestate_IsInScriptedSequence();
    gPlayer.moveState &= ~(MOVESTATE_IA_OVERRIDE);
#else
    // Doing this inline is faster, and
    // personally more comprehensible.
    gPlayer.moveState &= ~(MOVESTATE_IN_SCRIPTED | MOVESTATE_IA_OVERRIDE);
#endif

    gPlayer.transition = PLTRANS_UNCURL;
    gPlayer.qSpeedAirX = gUnknown_080DFFF4[horn->kind][0];
    gPlayer.qSpeedAirY = gUnknown_080DFFF4[horn->kind][1];
    gPlayer.rotation = gUnknown_080E0000[horn->kind];

    m4aSongNumStart(SE_MUSIC_PLANT_EXIT_HORN);

    gCurTask->main = Task_FrenchHorn_Idle;
}

static bool32 PlayerIsTouchingEntry(Sprite_FrenchHorn *horn)
{
    s16 screenX, screenY;
    s16 playerX, playerY;
    s32 cSquared;

    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    screenX = horn->entryPosX - gCamera.x;
    screenY = horn->entryPosY - gCamera.y;

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

static void Task_FrenchHorn_Idle(void)
{
    Sprite_FrenchHorn *horn = TASK_DATA(gCurTask);

    if (PlayerIsTouchingEntry(horn)) {
        FrenchHorn_BeginPipeSequence(horn);
    }

    if (sub_8077CB0(horn)) {
        FrenchHorn_Despawn(horn);
    }
}

static void FrenchHorn_BeginPipeSequence(Sprite_FrenchHorn *horn)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~(MOVESTATE_FACING_LEFT);
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    InitPipeSequence(&horn->pipeSequence, Q(horn->entryPosX), Q(horn->entryPosY));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN);

    gCurTask->main = Task_FrenchHorn_Active;
}

static void FrenchHorn_UpdatePlayerPos(Sprite_FrenchHorn *horn)
{
    gPlayer.qWorldX = horn->pipeSequence.x2;
    gPlayer.qWorldY = horn->pipeSequence.y2;
}

static bool32 sub_8077CB0(Sprite_FrenchHorn *horn)
{
    s16 screenX, screenY;

    screenX = horn->entryPosX - gCamera.x;
    screenY = horn->entryPosY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void FrenchHorn_Despawn(Sprite_FrenchHorn *horn)
{
    horn->me->x = horn->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_FrenchHorn_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_FrenchHorn_Idle, sizeof(Sprite_FrenchHorn), 0x2010, 0, TaskDestructor_FrenchHorn);
    Sprite_FrenchHorn *horn = TASK_DATA(t);

    horn->kind = me->d.sData[0];
    horn->me = me;
    horn->spriteX = me->x;
    horn->spriteY = spriteY;

    horn->entryPosX = TO_WORLD_POS(me->x, spriteRegionX);
    horn->entryPosY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void TaskDestructor_FrenchHorn(struct Task *t)
{
    // unused
}
