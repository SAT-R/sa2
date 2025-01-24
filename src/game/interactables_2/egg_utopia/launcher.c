#include "global.h"
#include "gba/types.h"
#include "lib/m4a/m4a.h"

#include "malloc_vram.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/player_controls.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
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

    s32 unk60[3][2];
} Sprite_EggUtopia_Launcher; /* size: 0x78 */

#define EGG_UTO_LAUNCHER_TILE_COUNT 15

#define LAUN_DIR_LEFT               0
#define LAUN_DIR_RIGHT              1
#define LAUN_GRAVITY_DOWN           0
#define LAUN_GRAVITY_UP             1
#define LAUNCHER_KIND(dir, gravity) (((gravity) << 1) | (dir))
#define IS_LAUNCHER_DIR_LEFT(kind)                                                                                                         \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN)) || (kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP)))

#define IS_LAUNCHER_RIGHTSIDE_UP(kind)                                                                                                     \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN)) || (kind == LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN)))

#define IS_LAUNCHER_UPSIDE_DOWN(kind)                                                                                                      \
    ((kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP)) || (kind == LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP)))

static void sub_807DC80(Sprite_EggUtopia_Launcher *launcher);
static void sub_807DD04(Sprite_EggUtopia_Launcher *launcher);
static bool32 sub_807DDF0(Sprite_EggUtopia_Launcher *launcher);
static bool16 sub_807DF60(Sprite_EggUtopia_Launcher *launcher);
static void sub_807DFBC(Sprite_EggUtopia_Launcher *launcher);
static void sub_807E0B8(Sprite_EggUtopia_Launcher *launcher);
static bool32 sub_807E044(Sprite_EggUtopia_Launcher *launcher);
static void Task_807DBF0(void);
static void sub_807DDA0(Sprite_EggUtopia_Launcher *);

// static
void Task_807DE98(void);

static void Task_807DEEC(void);

// static
void TaskDestructor_807DF38(struct Task *t);

static void SetTaskMain_807E16C(Sprite_EggUtopia_Launcher *unused);
static void sub_807E0D0(Sprite_EggUtopia_Launcher *);
static void SetTaskMain_807DE98(Sprite_EggUtopia_Launcher *unused);
static void Task_807E16C(void);
static bool16 sub_807E1C4(Sprite_EggUtopia_Launcher *launcher);

void CreateEntity_Launcher(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u32 kind)
{
    struct Task *t = TaskCreate(Task_807DE98, sizeof(Sprite_EggUtopia_Launcher), 0x2010, 0, TaskDestructor_807DF38);
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(t);

    launcher->kind = kind;
    launcher->posX = TO_WORLD_POS(me->x, spriteRegionX);
    launcher->posY = TO_WORLD_POS(me->y, spriteRegionY);

    launcher->unk4C = me->d.sData[0] * TILE_WIDTH;
    launcher->unk4E = me->d.sData[1] * TILE_WIDTH;
    launcher->unk50 = launcher->unk4C + me->d.uData[2] * TILE_WIDTH;
    launcher->unk52 = launcher->unk4E + me->d.uData[3] * TILE_WIDTH;

    launcher->base.regionX = spriteRegionX;
    launcher->base.regionY = spriteRegionY;
    launcher->base.me = me;
    launcher->base.spriteX = me->x;
    launcher->base.id = spriteY;

    switch (launcher->kind) {
        case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
            launcher->unk54 = Q(launcher->posX + launcher->unk50);
            launcher->unk58 = Q(launcher->posY + launcher->unk52);
        } break;

        case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
            launcher->unk54 = Q(launcher->posX + launcher->unk4C);
            launcher->unk58 = Q(launcher->posY + launcher->unk52);
        } break;

        case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
            launcher->unk54 = Q(launcher->posX + launcher->unk50);
            launcher->unk58 = Q(launcher->posY + launcher->unk4E);
        } break;

        case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
            launcher->unk54 = Q(launcher->posX + launcher->unk4C);
            launcher->unk58 = Q(launcher->posY + launcher->unk4E);
        } break;
    }

    {
        s32 *xs, *ys;
        s32 i = 0;
#ifndef NON_MATCHING
        register void *s2 asm("r4") = &launcher->s;
#endif
        for (; i < ARRAY_COUNT(launcher->unk60); i++) {
            launcher->unk60[i][0] = launcher->unk54;
            launcher->unk60[i][1] = launcher->unk58;
        }

        {
#ifndef NON_MATCHING
            register Sprite *s asm("r5") = s2;
#else
            Sprite *s = &launcher->s;
#endif
            s->oamFlags = SPRITE_OAM_ORDER(6);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;

            launcher->s.prevVariant = -1;
            launcher->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
            launcher->s.palId = 0;

            s->hitboxes[0].index = -1;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
            s->graphics.dest = VramMalloc(EGG_UTO_LAUNCHER_TILE_COUNT);
            s->graphics.anim = SA2_ANIM_LAUNCHER;
            launcher->s.variant = 0;

#ifndef NON_MATCHING
            // This is completely redundant because of the switch below.
            if (kind == LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN)) {
                s->frameFlags |= (SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 0));
            }
#endif
            switch (launcher->kind) {
                case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 0));
                } break;

                case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 0) | SPRITE_FLAG(Y_FLIP, 0));
                } break;

                case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 1) | SPRITE_FLAG(Y_FLIP, 1));
                } break;

                case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                    s->frameFlags |= (SPRITE_FLAG(X_FLIP, 0) | SPRITE_FLAG(Y_FLIP, 1));
                } break;
            }

            UpdateSpriteAnimation(s);
        }
        SET_MAP_ENTITY_INITIALIZED(me);
    }
}

static void Task_807DBF0(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER)
        sub_807E0D0(launcher);

    if (sub_807DF60(launcher))
        sub_807DD04(launcher);

    sub_807DFBC(launcher);

    if (!PLAYER_IS_ALIVE) {
        launcher->unk48 = FALSE;
    } else {
        if (gPlayer.timerInvulnerability != 120) {
            if (gPlayer.frameInput & gPlayerControls.jump) {
                gPlayer.transition = PLTRANS_INIT_JUMP;

                gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
                launcher->unk48 = FALSE;
            }
        } else {
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
            launcher->unk48 = FALSE;
        }
    }

    sub_807DDA0(launcher);
}

static void sub_807DC80(Sprite_EggUtopia_Launcher *launcher)
{
    m4aSongNumStart(SE_286);

    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_LAUNCHER_IN_CART;
    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    sub_8023B5C(&gPlayer, 14);

    gPlayer.spriteOffsetX = 6;
    gPlayer.spriteOffsetY = 14;
    gPlayer.moveState &= ~MOVESTATE_4;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    } else {
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    launcher->unk48 = TRUE;

    gCurTask->main = Task_807DBF0;
}

static void sub_807DD04(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE && launcher->unk48) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.charState = CHARSTATE_LAUNCHER_IN_AIR;
        gPlayer.transition = PLTRANS_PT7;

        switch (launcher->kind) {
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN):
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                gPlayer.qSpeedAirX = -Q(15.0);
                gPlayer.qSpeedAirY = -Q(3.0);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN):
            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                gPlayer.qSpeedAirX = +Q(15.0);
                gPlayer.qSpeedAirY = -Q(3.0);
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

static void sub_807DDA0(Sprite_EggUtopia_Launcher *launcher)
{
    Sprite *s = &launcher->s;

    if (IS_MULTI_PLAYER) {
        s->x = I(launcher->unk60[1][0]) - gCamera.x;
        s->y = I(launcher->unk60[1][1]) - gCamera.y;
    } else {
        s->x = I(launcher->unk54) - gCamera.x;
        s->y = I(launcher->unk58) - gCamera.y;
    }

    DisplaySprite(s);
}

static bool32 sub_807DDF0(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE) {
        s16 someX, someY;
        s16 playerX, playerY;

        // Launcher should only activate if it's the correct gravity
        if (GRAVITY_IS_INVERTED) {
            if (IS_LAUNCHER_RIGHTSIDE_UP(launcher->kind))
                return FALSE;
        } else {
            if (IS_LAUNCHER_UPSIDE_DOWN(launcher->kind))
                return FALSE;
        }

        someX = I(launcher->unk54) - gCamera.x;
        someY = I(launcher->unk58) - gCamera.y;

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((someX - 2 * TILE_WIDTH <= playerX) && (someX + 2 * TILE_WIDTH >= playerX) && (someY - 2 * TILE_WIDTH <= playerY)
            && (someY + 2 * TILE_WIDTH >= playerY))
            return TRUE;
    }

    return FALSE;
}

// static
void Task_807DE98(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

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

static void Task_807DEEC(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        sub_807E0D0(launcher);
    }

    if (++launcher->unk5C > 60) {
        SetTaskMain_807E16C(launcher);
    }

    sub_807DDA0(launcher);
}

// static
void TaskDestructor_807DF38(struct Task *t)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(t);
    VramFree(launcher->s.graphics.dest);
}

static void SetTaskMain_807E16C(Sprite_EggUtopia_Launcher *unused) { gCurTask->main = Task_807E16C; }

static bool16 sub_807DF60(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        s32 someX;
        launcher->unk54 -= Q(15);
        someX = Q(launcher->posX + launcher->unk4C);
        if (launcher->unk54 <= someX) {
            launcher->unk54 = someX;
            result = TRUE;
        }
    } else {
        s32 someX;
        launcher->unk54 += Q(15);
        someX = Q(launcher->posX + launcher->unk50);
        if (launcher->unk54 >= someX) {
            launcher->unk54 = someX;
            result = TRUE;
        }
    }

    return result;
}

static void sub_807DFBC(Sprite_EggUtopia_Launcher *launcher)
{
    if (PLAYER_IS_ALIVE && launcher->unk48) {
        switch (launcher->kind) {
            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN): {
                gPlayer.qWorldX = launcher->unk54 - Q(8);
                gPlayer.qWorldY = launcher->unk58 - Q(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN): {
                gPlayer.qWorldX = launcher->unk54 + Q(8);
                gPlayer.qWorldY = launcher->unk58 - Q(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP): {
                gPlayer.qWorldX = launcher->unk54 - Q(8);
                gPlayer.qWorldY = launcher->unk58 + Q(16);
            } break;

            case LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP): {
                gPlayer.qWorldX = launcher->unk54 + Q(8);
                gPlayer.qWorldY = launcher->unk58 + Q(16);
            } break;
        }
    }
}

static bool32 sub_807E044(Sprite_EggUtopia_Launcher *launcher)
{
    s16 posX, posY;

    posX = launcher->posX - gCamera.x;
    posY = launcher->posY - gCamera.y;

    if (((posX + launcher->unk50) < -(CAM_REGION_WIDTH / 2)) || ((posX + launcher->unk4C) > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || ((posY + launcher->unk52) < -(CAM_REGION_WIDTH / 2)) || ((posY + launcher->unk4E) > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)))
        return TRUE;

    return FALSE;
}

static void sub_807E0B8(Sprite_EggUtopia_Launcher *launcher)
{
    SET_MAP_ENTITY_NOT_INITIALIZED(launcher->base.me, launcher->base.spriteX);
    TaskDestroy(gCurTask);
}

static void sub_807E0D0(Sprite_EggUtopia_Launcher *launcher)
{
    launcher->unk60[2][0] = launcher->unk60[1][0];
    launcher->unk60[2][1] = launcher->unk60[1][1];
    launcher->unk60[1][0] = launcher->unk60[0][0];
    launcher->unk60[1][1] = launcher->unk60[0][1];
    launcher->unk60[0][0] = launcher->unk54;
    launcher->unk60[0][1] = launcher->unk58;
}

void CreateEntity_Launcher_Left_GDown(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_DOWN));
}

void CreateEntity_Launcher_Right_GDown(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_DOWN));
}

void CreateEntity_Launcher_Left_GUp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_LEFT, LAUN_GRAVITY_UP));
}

void CreateEntity_Launcher_Right_GUp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Launcher(me, spriteRegionX, spriteRegionY, spriteY, LAUNCHER_KIND(LAUN_DIR_RIGHT, LAUN_GRAVITY_UP));
}

static void Task_807E16C(void)
{
    Sprite_EggUtopia_Launcher *launcher = TASK_DATA(gCurTask);

    if (!IS_SINGLE_PLAYER) {
        sub_807E0D0(launcher);
    }

    if (sub_807E1C4(launcher)) {
        SetTaskMain_807DE98(launcher);
    }

    sub_807DDA0(launcher);
}

static void SetTaskMain_807DE98(Sprite_EggUtopia_Launcher *unused) { gCurTask->main = Task_807DE98; }

static bool16 sub_807E1C4(Sprite_EggUtopia_Launcher *launcher)
{
    bool32 result = FALSE;

    if (IS_LAUNCHER_DIR_LEFT(launcher->kind)) {
        s32 value;
        launcher->unk54 += Q(1.0);
        value = Q(launcher->posX + launcher->unk50);
        if (launcher->unk54 >= value) {
            launcher->unk54 = value;
            result = TRUE;
        }
    } else {
        s32 value;
        launcher->unk54 -= Q(1.0);
        value = Q(launcher->posX + launcher->unk4C);
        if (launcher->unk54 <= value) {
            launcher->unk54 = value;
            result = TRUE;
        }
    }

    return result;
}