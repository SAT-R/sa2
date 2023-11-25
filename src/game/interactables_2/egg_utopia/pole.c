#include "global.h"
#include "core.h"
#include "lib/m4a.h"

#include "game/player_controls.h"
#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/pole.h"

#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    s32 unk0;
    s32 unk4;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
    s32 unk14;
    s32 unk18;
    bool32 unk1C;
    MapEntity *me;
    u8 spriteX;
    u8 spriteY;
} Sprite_Pole;

static void Task_Interactable094(void);
static void TaskDestructor_Interactable094(struct Task *);
static void Task_807EA8C(void);

void CreateEntity_Pole(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable094, sizeof(Sprite_Pole), 0x2010, 0,
                                TaskDestructor_Interactable094);
    Sprite_Pole *pole = TASK_DATA(t);
    pole->unk0 = TO_WORLD_POS(me->x, spriteRegionX);
    pole->unk4 = TO_WORLD_POS(me->y, spriteRegionY);

    pole->unk8 = me->d.sData[0] * 8;
    pole->unkA = me->d.sData[1] * 8;
    pole->unkC = pole->unk8 + me->d.uData[2] * 8;
    pole->unkE = pole->unkA + me->d.uData[3] * 8;

    pole->unk10 = pole->unkC - pole->unk8;
    pole->unk12 = pole->unkE - pole->unkA;

    pole->unk14 = ((pole->unk8 + pole->unkC) >> 1) + pole->unk0;
    pole->unk18 = ((pole->unkA + pole->unkE) >> 1) + pole->unk4;
    pole->me = me;
    pole->spriteX = me->x;
    pole->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807ED68(Sprite_Pole *);
static void sub_807ED88(Sprite_Pole *);
static bool32 sub_807EBBC(Sprite_Pole *);
static void sub_807ED00(Sprite_Pole *);
static bool32 sub_807EDB8(Sprite_Pole *);
static void sub_807EE1C(Sprite_Pole *);
static void sub_807EB48(Sprite_Pole *);

static void Task_807EA8C(void)
{
    Sprite_Pole *pole = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_807ED68(pole);
        return;
    }
    if (gPlayer.unk2C == 120) {
        sub_807ED88(pole);
        return;
    }

    if (GRAVITY_IS_INVERTED) {
        gPlayer.y -= Q_24_8(1);
    } else {
        gPlayer.y += Q_24_8(1);
    }

    if (gPlayer.unk5E & gPlayerControls.jump) {
        u16 temp = gPlayer.unk5C & 0x20;
        if (temp != 0) {
            temp = TRUE;
        }
        pole->unk1C = temp;
        sub_807EB48(pole);
    } else {
        if (!sub_807EBBC(pole)) {
            sub_807ED00(pole);
        }
    }

    if (sub_807EDB8(pole)) {
        sub_807EE1C(pole);
    }
}

static void Task_807EC70(void);

static void sub_807EB48(Sprite_Pole *pole)
{
    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        if (pole->unk1C) {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
        } else {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
        }
        gPlayer.unk64 = 4;
        gPlayer.transition = PLTRANS_PT5;

        if (pole->unk1C) {
            gPlayer.speedAirX = -Q_24_8(5);
        } else {
            gPlayer.speedAirX = Q_24_8(5);
        }
        m4aSongNumStop(SE_290);
    }
    gCurTask->main = Task_807EC70;
}

static bool32 sub_807EBBC(Sprite_Pole *pole)
{
    s16 temp, temp2, temp3, temp4;
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    temp = (pole->unk0 + pole->unk8) - gCamera.x;
    temp3 = (pole->unk4 + pole->unkA) - gCamera.y;
    temp2 = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    temp4 = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    if (temp <= temp2 && temp + pole->unk10 >= temp2) {
        if (temp3 <= temp4 && temp3 + pole->unk12 >= temp4) {
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_807ECB8(Sprite_Pole *);

static void Task_Interactable094(void)
{
    Sprite_Pole *pole = TASK_DATA(gCurTask);
    if (sub_807EBBC(pole)) {
        sub_807ECB8(pole);
    }

    if (sub_807EDB8(pole)) {
        sub_807EE1C(pole);
    }
}

static void sub_807ED48(Sprite_Pole *pole);
static void Task_Interactable094(void);

static void Task_807EC70(void)
{
    Sprite_Pole *pole = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_Interactable094;
        return;
    }

    if (!sub_807EBBC(pole)) {
        sub_807ED48(pole);
    }
}

static void TaskDestructor_Interactable094(struct Task *t)
{
    // unused
}

static void sub_807ECB8(Sprite_Pole *pole)
{
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 66;
    gPlayer.x = Q_24_8(pole->unk14);
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    m4aSongNumStart(SE_290);
    gCurTask->main = Task_807EA8C;
}

static void sub_807ED00(Sprite_Pole *pole)
{
    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk64 = 14;
        gPlayer.transition = PLTRANS_PT5;
        gPlayer.speedAirY = Q_24_8(1);
        m4aSongNumStop(SE_290);
    }
    gCurTask->main = Task_Interactable094;
}

static void sub_807ED48(Sprite_Pole *pole)
{
    m4aSongNumStop(SE_290);
    gCurTask->main = Task_Interactable094;
}

static void sub_807ED68(Sprite_Pole *pole)
{
    m4aSongNumStop(SE_290);
    gCurTask->main = Task_Interactable094;
}

static void sub_807ED88(Sprite_Pole *pole)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    m4aSongNumStop(SE_290);
    gCurTask->main = Task_807EC70;
}

static bool32 sub_807EDB8(Sprite_Pole *pole)
{
    s16 temp, temp3;

    temp = pole->unk0 - gCamera.x;
    temp3 = pole->unk4 - gCamera.y;
    if (temp + pole->unkC < -128 || temp + pole->unk8 > 368 || temp3 + pole->unkE < -128
        || temp3 + pole->unkA > 288) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807EE1C(Sprite_Pole *pole)
{
    pole->me->x = pole->spriteX;
    TaskDestroy(gCurTask);
}
