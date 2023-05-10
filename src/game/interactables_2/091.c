#include "global.h"
#include "gba/types.h"
#include "lib/m4a.h"

#include "malloc_vram.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "game/game.h"

#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ u16 kind;
    u8 filler46[2];
    bool32 unk48;
    s16 unk4C;
    s16 unk4E;
    s16 unk50;
    s16 unk52;
    s32 unk54;
    s32 unk58;
    u16 unk5C;
    s32 unk60;
    s32 unk64;
    s32 unk68;
    s32 unk6C;
    s32 unk70;
    s32 unk74;
} Sprite_EggUtopia_Launcher; /* size: 0x78 */

#define LAUN_DIR_LEFT               0
#define LAUN_DIR_RIGHT              1
#define LAUN_GRAVITY_DOWN           0
#define LAUN_GRAVITY_UP             1
#define LAUNCHER_KIND(dir, gravity) (((gravity) << 1) | (dir))
#define IS_LAUNCHER_DIR_LEFT(kind)                                                      \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN))                          \
     || (kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP)))

#define IS_LAUNCHER_RIGHTSIDE_UP(kind)                                                  \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN))                          \
     || (kind == LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN)))

#define IS_LAUNCHER_UPSIDE_DOWN(kind)                                                   \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP))                            \
     || (kind == LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP)))

extern void initSprite_EggUtopia_Launcher(MapEntity *me, u16 spriteRegionX,
                                          u16 spriteRegionY, u8 spriteY, u32 kind);

extern void sub_807DC80(Sprite_EggUtopia_Launcher *launcher);
extern bool32 sub_807DDF0(Sprite_EggUtopia_Launcher *launcher);
extern void sub_807E0B8(Sprite_EggUtopia_Launcher *launcher);
extern bool32 sub_807E044(Sprite_EggUtopia_Launcher *launcher);

void Task_807DBF0(void);
void sub_807DDA0(Sprite_EggUtopia_Launcher *);
void Task_807DE98(void);
void Task_807DEEC(void);
void SetTaskMain_807E16C(Sprite_EggUtopia_Launcher *unused);
extern void sub_807E0D0(Sprite_EggUtopia_Launcher *);
void SetTaskMain_807DE98(Sprite_EggUtopia_Launcher *unused);
void Task_807E16C(void);
bool16 sub_807E1C4(Sprite_EggUtopia_Launcher *launcher);

void sub_807DC80(Sprite_EggUtopia_Launcher *launcher)
{
    m4aSongNumStart(SE_286);

    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 64;
    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 14);

    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    gPlayer.moveState &= ~MOVESTATE_4;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    } else {
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    launcher->unk48 = TRUE;

    gCurTask->main = Task_807DBF0;
}

void sub_807DD04(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE && launcher->unk48) {
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk64 = 65;
        gPlayer.unk6D = 0x7;

        switch (launcher->kind) {
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN):
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                gPlayer.speedAirX = -Q_24_8(15.0);
                gPlayer.speedAirY = -Q_24_8(3.0);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN):
            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                gPlayer.speedAirX = +Q_24_8(15.0);
                gPlayer.speedAirY = -Q_24_8(3.0);
            } break;
        }

        launcher->unk48 = FALSE;

        m4aSongNumStart(SE_287);
    } else {
        m4aSongNumStop(SE_286);
    }

    launcher->unk5C = 0;
    gCurTask->main = Task_807DEEC;
}

void sub_807DDA0(Sprite_EggUtopia_Launcher *launcher)
{
    Sprite *s = &launcher->s;

    if (IS_MULTI_PLAYER) {
        s->x = Q_24_8_TO_INT(launcher->unk68) - gCamera.x;
        s->y = Q_24_8_TO_INT(launcher->unk6C) - gCamera.y;
    } else {
        s->x = Q_24_8_TO_INT(launcher->unk54) - gCamera.x;
        s->y = Q_24_8_TO_INT(launcher->unk58) - gCamera.y;
    }

    sub_80051E8(s);
}

bool32 sub_807DDF0(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE) {
        s16 someX, someY;
        s16 playerX, playerY;

        // Launcher should only activate if it's the correct gravity
        if (gUnknown_03005424 & EXTRA_STATE__GRAVITY_INVERTED) {
            if (IS_LAUNCHER_RIGHTSIDE_UP(launcher->kind))
                return FALSE;
        } else {
            if (IS_LAUNCHER_UPSIDE_DOWN(launcher->kind))
                return FALSE;
        }

        someX = Q_24_8_TO_INT(launcher->unk54) - gCamera.x;
        someY = Q_24_8_TO_INT(launcher->unk58) - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if ((someX - 2 * TILE_WIDTH <= playerX) && (someX + 2 * TILE_WIDTH >= playerX)
            && (someY - 2 * TILE_WIDTH <= playerY)
            && (someY + 2 * TILE_WIDTH >= playerY))
            return TRUE;
    }

    return FALSE;
}

void Task_807DE98(void)
{
    Sprite_EggUtopia_Launcher *launcher = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807E0D0(launcher);
    }

    if (sub_807DDF0(launcher)) {
        sub_807DC80(launcher);
    }

    if (sub_807E044(launcher)) {
        sub_807E0B8(launcher);
    } else {
        sub_807DDA0(launcher);
    }
}

void Task_807DEEC(void)
{
    Sprite_EggUtopia_Launcher *launcher = TaskGetStructPtr(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807E0D0(launcher);
    }

    if (++launcher->unk5C > 60) {
        SetTaskMain_807E16C(launcher);
    }

    sub_807DDA0(launcher);
}

void TaskDestructor_807DF38(struct Task *t)
{
    Sprite_EggUtopia_Launcher *launcher = TaskGetStructPtr(t);
    VramFree(launcher->s.graphics.dest);
}

void SetTaskMain_807E16C(Sprite_EggUtopia_Launcher *unused)
{
    gCurTask->main = Task_807E16C;
}

bool32 sub_807DF60(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        s32 someX;
        launcher->unk54 -= Q_24_8(15);
        someX = Q_24_8(launcher->posX + launcher->unk4C);
        if (launcher->unk54 <= someX) {
            launcher->unk54 = someX;
            result = TRUE;
        }
    } else {
        s32 someX;
        launcher->unk54 += Q_24_8(15);
        someX = Q_24_8(launcher->posX + launcher->unk50);
        if (launcher->unk54 >= someX) {
            launcher->unk54 = someX;
            result = TRUE;
        }
    }

    return result;
}

void sub_807DFBC(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE && launcher->unk48) {
        switch (launcher->kind) {
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
                gPlayer.x = launcher->unk54 - Q_24_8(8);
                gPlayer.y = launcher->unk58 - Q_24_8(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
                gPlayer.x = launcher->unk54 + Q_24_8(8);
                gPlayer.y = launcher->unk58 - Q_24_8(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                gPlayer.x = launcher->unk54 - Q_24_8(8);
                gPlayer.y = launcher->unk58 + Q_24_8(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                gPlayer.x = launcher->unk54 + Q_24_8(8);
                gPlayer.y = launcher->unk58 + Q_24_8(16);
            } break;
        }
    }
}

bool32 sub_807E044(Sprite_EggUtopia_Launcher *launcher)
{
    s16 posX, posY;

    posX = launcher->posX - gCamera.x;
    posY = launcher->posY - gCamera.y;

    if (((posX + launcher->unk50) < -(CAM_REGION_WIDTH / 2))
        || ((posX + launcher->unk4C) > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || ((posY + launcher->unk52) < -(CAM_REGION_WIDTH / 2))
        || ((posY + launcher->unk4E) > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)))
        return TRUE;

    return FALSE;
}

void sub_807E0B8(Sprite_EggUtopia_Launcher *launcher)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(launcher->base.me, launcher->base.spriteX);
    TaskDestroy(gCurTask);
}

void sub_807E0D0(Sprite_EggUtopia_Launcher *launcher)
{
    launcher->unk70 = launcher->unk68;
    launcher->unk74 = launcher->unk6C;
    launcher->unk68 = launcher->unk60;
    launcher->unk6C = launcher->unk64;
    launcher->unk60 = launcher->unk54;
    launcher->unk64 = launcher->unk58;
}

void initSprite_EggUtopia_Launcher_0(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 0);
}

void initSprite_EggUtopia_Launcher_1(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 1);
}

void initSprite_EggUtopia_Launcher_2(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 2);
}

void initSprite_EggUtopia_Launcher_3(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    initSprite_EggUtopia_Launcher(me, spriteRegionX, spriteRegionY, spriteY, 3);
}

void Task_807E16C(void)
{
    Sprite_EggUtopia_Launcher *launcher = TaskGetStructPtr(gCurTask);

    if (!IS_SINGLE_PLAYER) {
        sub_807E0D0(launcher);
    }

    if (sub_807E1C4(launcher)) {
        SetTaskMain_807DE98(launcher);
    }

    sub_807DDA0(launcher);
}

void SetTaskMain_807DE98(Sprite_EggUtopia_Launcher *unused)
{
    gCurTask->main = Task_807DE98;
}

bool16 sub_807E1C4(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        s32 value;
        launcher->unk54 += Q_24_8(1.0);
        value = Q_24_8(launcher->posX + launcher->unk50);
        if (launcher->unk54 >= value) {
            launcher->unk54 = value;
            result = TRUE;
        }
    } else {
        s32 value;
        launcher->unk54 -= Q_24_8(1.0);
        value = Q_24_8(launcher->posX + launcher->unk4C);
        if (launcher->unk54 <= value) {
            launcher->unk54 = value;
            result = TRUE;
        }
    }

    return result;
}