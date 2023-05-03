#include "global.h"
#include "core.h"
#include "game/game.h"
#include "lib/m4a.h"
#include "game/entity.h"
#include "game/interactables_2/sky_canyon/094.h"
#include "constants/move_states.h"
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
} Sprite_IA94;

static void Task_Interactable094(void);
static void TaskDestructor_Interactable094(struct Task *);

void initSprite_Interactable094(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable094, sizeof(Sprite_IA94), 0x2010, 0,
                                TaskDestructor_Interactable094);
    Sprite_IA94 *ia94 = TaskGetStructPtr(t);
    ia94->unk0 = TO_WORLD_POS(me->x, spriteRegionX);
    ia94->unk4 = TO_WORLD_POS(me->y, spriteRegionY);

    ia94->unk8 = me->d.sData[0] * 8;
    ia94->unkA = me->d.sData[1] * 8;
    ia94->unkC = ia94->unk8 + me->d.uData[2] * 8;
    ia94->unkE = ia94->unkA + me->d.uData[3] * 8;

    ia94->unk10 = ia94->unkC - ia94->unk8;
    ia94->unk12 = ia94->unkE - ia94->unkA;

    ia94->unk14 = ((ia94->unk8 + ia94->unkC) >> 1) + ia94->unk0;
    ia94->unk18 = ((ia94->unkA + ia94->unkE) >> 1) + ia94->unk4;
    ia94->me = me;
    ia94->spriteX = me->x;
    ia94->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_807ED68(Sprite_IA94 *);
static void sub_807ED88(Sprite_IA94 *);
static bool32 sub_807EBBC(Sprite_IA94 *);
static void sub_807ED00(Sprite_IA94 *);
static bool32 sub_807EDB8(Sprite_IA94 *);
static void sub_807EE1C(Sprite_IA94 *);
static void sub_807EB48(Sprite_IA94 *);

static void sub_807EA8C(void)
{
    Sprite_IA94 *ia94 = TaskGetStructPtr(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_807ED68(ia94);
        return;
    }
    if (gPlayer.unk2C == 120) {
        sub_807ED88(ia94);
        return;
    }

    if GRAVITY_IS_INVERTED {
        gPlayer.y -= Q_24_8(1);
    } else {
        gPlayer.y += Q_24_8(1);
    }

    if (gPlayer.unk5E & gPlayerControls.jump) {
        u16 temp = gPlayer.unk5C & 0x20;
        if (temp != 0) {
            temp = TRUE;
        }
        ia94->unk1C = temp;
        sub_807EB48(ia94);
    } else {
        if (!sub_807EBBC(ia94)) {
            sub_807ED00(ia94);
        }
    }

    if (sub_807EDB8(ia94)) {
        sub_807EE1C(ia94);
    }
}

static void sub_807EC70(void);

static void sub_807EB48(Sprite_IA94 *ia94)
{
    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        if (ia94->unk1C) {
            gPlayer.moveState |= MOVESTATE_FACING_LEFT;
        } else {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
        }
        gPlayer.unk64 = 4;
        gPlayer.unk6D = 5;

        if (ia94->unk1C) {
            gPlayer.speedAirX = -Q_24_8(5);
        } else {
            gPlayer.speedAirX = Q_24_8(5);
        }
        m4aSongNumStop(SE_290);
    }
    gCurTask->main = sub_807EC70;
}

static bool32 sub_807EBBC(Sprite_IA94 *ia94)
{
    s16 temp, temp2, temp3, temp4;
    if (!PLAYER_IS_ALIVE) {
        return FALSE;
    }

    temp = (ia94->unk0 + ia94->unk8) - gCamera.x;
    temp3 = (ia94->unk4 + ia94->unkA) - gCamera.y;
    temp2 = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    temp4 = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
    if (temp <= temp2 && temp + ia94->unk10 >= temp2) {
        if (temp3 <= temp4 && temp3 + ia94->unk12 >= temp4) {
            return TRUE;
        }
    }

    return FALSE;
}

static void sub_807ECB8(Sprite_IA94 *);

static void Task_Interactable094(void)
{
    Sprite_IA94 *ia94 = TaskGetStructPtr(gCurTask);
    if (sub_807EBBC(ia94)) {
        sub_807ECB8(ia94);
    }

    if (sub_807EDB8(ia94)) {
        sub_807EE1C(ia94);
    }
}

static void sub_807ED48(Sprite_IA94 *ia94);
static void Task_Interactable094(void);

static void sub_807EC70(void)
{
    Sprite_IA94 *ia94 = TaskGetStructPtr(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_Interactable094;
        return;
    }

    if (!sub_807EBBC(ia94)) {
        sub_807ED48(ia94);
    }
}

static void TaskDestructor_Interactable094(struct Task *t)
{
    // unused
}

static void sub_807EA8C(void);

static void sub_807ECB8(Sprite_IA94 *ia94)
{
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 66;
    gPlayer.x = Q_24_8(ia94->unk14);
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    m4aSongNumStart(SE_290);
    gCurTask->main = sub_807EA8C;
}

static void sub_807ED00(Sprite_IA94 *ia94)
{
    if (PLAYER_IS_ALIVE) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk64 = 14;
        gPlayer.unk6D = 5;
        gPlayer.speedAirY = Q_24_8(1);
        m4aSongNumStop(SE_290);
    }
    gCurTask->main = Task_Interactable094;
}

static void sub_807ED48(Sprite_IA94 *ia94)
{
    m4aSongNumStop(SE_290);
    gCurTask->main = Task_Interactable094;
}

static void sub_807ED68(Sprite_IA94 *ia94)
{
    m4aSongNumStop(SE_290);
    gCurTask->main = Task_Interactable094;
}

static void sub_807EC70(void);
static void sub_807ED88(Sprite_IA94 *ia94)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    m4aSongNumStop(SE_290);
    gCurTask->main = sub_807EC70;
}

static bool32 sub_807EDB8(Sprite_IA94 *ia94)
{
    s16 temp, temp3;

    temp = ia94->unk0 - gCamera.x;
    temp3 = ia94->unk4 - gCamera.y;
    if (temp + ia94->unkC < -128 || temp + ia94->unk8 > 368 || temp3 + ia94->unkE < -128
        || temp3 + ia94->unkA > 288) {
        return TRUE;
    }

    return FALSE;
}

static void sub_807EE1C(Sprite_IA94 *ia94)
{
    ia94->me->x = ia94->spriteX;
    TaskDestroy(gCurTask);
}
