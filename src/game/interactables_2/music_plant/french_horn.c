#include "core.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/interactables_2/music_plant/pipe_horn.h"
#include "game/interactables_2/music_plant/french_horn.h"

#include "constants/move_states.h"
#include "constants/player_transitions.h"
#include "constants/char_states.h"
#include "constants/songs.h"

#include "data/handlers_ia_pipe_horn_sequences.h"

static void sub_8077C3C(Sprite_PipeHorn *);
static bool32 sub_8077CB0(Sprite_PipeHorn *);
static void sub_8077CA0(Sprite_PipeHorn *);
static void sub_8077B28(Sprite_PipeHorn *);
static void Task_FrenchHorn_8077C04(void);
static void FrenchHorn_Despawn(Sprite_PipeHorn *);
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

static void sub_8077ABC(void)
{
    Sprite_PipeHorn *horn = TASK_DATA(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        Player_ClearMovestate_IsInScriptedSequence();
        gCurTask->main = Task_FrenchHorn_8077C04;
    } else {
        gPlayer.rotation = 0x20;

        gPlayer.qSpeedAirX = 1;
        gPlayer.qSpeedAirY = 1;

        if (sub_8077788(horn, gUnknown_08C87960[horn->kind]) == 0) {
            sub_8077B28(horn);
        }

        sub_8077CA0(horn);
    }
}

static void sub_8077B28(Sprite_PipeHorn *horn)
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

    gCurTask->main = Task_FrenchHorn_8077C04;
}

// NOTE: Literally copy-paste of sub_8077840
static bool32 sub_8077B98(Sprite_PipeHorn *horn)
{
    // NOTE: This matches... but at what cost? D:
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        goto sub_8077B98_ret0;
    } else {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s32 cSquared;

        screenX = horn->posX - gCamera.x;
        screenY = horn->posY - gCamera.y;

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

static void Task_FrenchHorn_8077C04(void)
{
    Sprite_PipeHorn *horn = TASK_DATA(gCurTask);

    if (sub_8077B98(horn)) {
        sub_8077C3C(horn);
    }

    if (sub_8077CB0(horn)) {
        FrenchHorn_Despawn(horn);
    }
}

static void sub_8077C3C(Sprite_PipeHorn *horn)
{
    Player_SetMovestate_IsInScriptedSequence();

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;

    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.moveState &= ~(MOVESTATE_FACING_LEFT);
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    sub_8077774(horn, Q(horn->posX), Q(horn->posY));

    m4aSongNumStart(SE_MUSIC_PLANT_ENTER_HORN);

    gCurTask->main = sub_8077ABC;
}

static void sub_8077CA0(Sprite_PipeHorn *horn)
{
    gPlayer.qWorldX = horn->x2;
    gPlayer.qWorldY = horn->y2;
}

static bool32 sub_8077CB0(Sprite_PipeHorn *horn)
{
    s16 screenX, screenY;

    screenX = horn->posX - gCamera.x;
    screenY = horn->posY - gCamera.y;

    if (IS_OUT_OF_RANGE_(0, screenX, screenY, (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void FrenchHorn_Despawn(Sprite_PipeHorn *horn)
{
    horn->me->x = horn->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_FrenchHorn_Entry(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_FrenchHorn_8077C04, sizeof(Sprite_PipeHorn), 0x2010, 0, TaskDestructor_FrenchHorn);
    Sprite_PipeHorn *horn = TASK_DATA(t);

    horn->kind = me->d.sData[0];
    horn->me = me;
    horn->spriteX = me->x;
    horn->spriteY = spriteY;

    horn->posX = TO_WORLD_POS(me->x, spriteRegionX);
    horn->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void TaskDestructor_FrenchHorn(struct Task *t)
{
    // unused
}
