#include "core.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/gravity_toggle.h"

typedef struct {
    /* 0x00 */ u32 x;
    /* 0x04 */ u32 y;
    /* 0x08 */ u16 left;
    /* 0x0A */ u16 top;
    /* 0x0C */ u16 right;
    /* 0x0E */ u16 bottom;
    /* 0x10 */ s16 width;
    /* 0x12 */ s16 height;
    /* 0x14 */ u16 kind;
    /* 0x16 */ u8 filler16[2];
    /* 0x18 */ s16 playerAirX;
    /* 0x1A */ s16 playerAirY;
    /* 0x1C */ u8 filler1C[8];
    /* 0x24 */ MapEntity *me;

    // Tile-Pos inside spriteRegion
    /* 0x28 */ u8 spriteX;
    /* 0x29 */ u8 id;
} Sprite_GravityToggle;

static void CreateEntity_Toggle_Gravity(MapEntity *, u16, u16, u8, u8);
static void Task_GravityToggleNoAliveCheck(void);
static void TaskDestructor_GravityToggle(struct Task *);
static void UpdateTogglePlayerSpeed(Sprite_GravityToggle *);
static bool32 ToggleIsOffscreen(Sprite_GravityToggle *);
static void DestroyGravityToggle(Sprite_GravityToggle *);
static void Task_GravityToggle(void);

#define GRAVITY_KIND__DOWN   0
#define GRAVITY_KIND__UP     1
#define GRAVITY_KIND__TOGGLE 2

static void CreateEntity_Toggle_Gravity(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 id, u8 toggleKind)
{
    struct Task *t = TaskCreate(Task_GravityToggleNoAliveCheck, sizeof(Sprite_GravityToggle), 0x2010, 0, TaskDestructor_GravityToggle);
    Sprite_GravityToggle *toggle = TASK_DATA(t);

    toggle->kind = toggleKind;
    toggle->x = TO_WORLD_POS(me->x, spriteRegionX);
    toggle->y = TO_WORLD_POS(me->y, spriteRegionY);
    toggle->left = (me->d.sData[0] * TILE_WIDTH);
    toggle->top = (me->d.sData[1] * TILE_WIDTH);
    toggle->right = toggle->left + (me->d.uData[2] * TILE_WIDTH);
    toggle->bottom = toggle->top + (me->d.uData[3] * TILE_WIDTH);

    toggle->width = toggle->right - toggle->left;
    toggle->height = toggle->bottom - toggle->top;
    toggle->me = me;
    toggle->spriteX = me->x;
    toggle->id = id;
    SET_MAP_ENTITY_INITIALIZED(me);
}

void ChangeGravityByKind(Sprite_GravityToggle *toggle)
{
    switch (toggle->kind) {
        case GRAVITY_KIND__DOWN: {
            // Regular gravity
            gStageFlags &= ~STAGE_FLAG__GRAVITY_INVERTED;
        } break;

        case GRAVITY_KIND__UP: {
            // Upside-down
            gStageFlags |= STAGE_FLAG__GRAVITY_INVERTED;
        } break;

        case GRAVITY_KIND__TOGGLE: {
            // Maybe collision on enter/exit?
            if (((toggle->playerAirX > 0) && (gPlayer.qSpeedAirX > 0)) || ((toggle->playerAirX < 0) && (gPlayer.qSpeedAirX < 0))
                || ((toggle->playerAirY > 0) && (gPlayer.qSpeedAirY > 0)) || ((toggle->playerAirY < 0) && (gPlayer.qSpeedAirY < 0))) {
                gStageFlags ^= STAGE_FLAG__GRAVITY_INVERTED;
            }

        } break;

        default: {
            ;
        } break;
    }

    gCurTask->main = Task_GravityToggleNoAliveCheck;
}

static bool32 AlivePlayerIsInToggle(Sprite_GravityToggle *toggle)
{
    if (PLAYER_IS_ALIVE) {
        s16 screenLeft, screenTop;
        s16 playerX, playerY;

        screenLeft = (toggle->x + toggle->left) - gCamera.x;
        screenTop = (toggle->y + toggle->top) - gCamera.y;

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((screenLeft <= playerX) && ((screenLeft + toggle->width) >= playerX) && (screenTop <= playerY)
            && ((screenTop + toggle->height) >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

void Task_GravityToggleNoAliveCheck(void)
{
    Sprite_GravityToggle *toggle = TASK_DATA(gCurTask);

    if (AlivePlayerIsInToggle(toggle)) {
        UpdateTogglePlayerSpeed(toggle);
    }

    if (ToggleIsOffscreen(toggle)) {
        DestroyGravityToggle(toggle);
    }
}

void TaskDestructor_GravityToggle(UNUSED struct Task *t) { }

void UpdateTogglePlayerSpeed(Sprite_GravityToggle *toggle)
{
    toggle->playerAirX = gPlayer.qSpeedAirX;
    toggle->playerAirY = gPlayer.qSpeedAirY;
    gCurTask->main = Task_GravityToggle;
}

bool32 ToggleIsOffscreen(Sprite_GravityToggle *toggle)
{
    s16 screenX, screenY;
    screenX = toggle->x - gCamera.x;
    screenY = toggle->y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_2(screenX, screenY)) {
        return TRUE;
    }

    return FALSE;
}

void DestroyGravityToggle(Sprite_GravityToggle *toggle)
{
    toggle->me->x = toggle->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_Toggle_Gravity__Down(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 id)
{
    CreateEntity_Toggle_Gravity(me, spriteRegionX, spriteRegionY, id, GRAVITY_KIND__DOWN);
}

void CreateEntity_Toggle_Gravity__Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 id)
{
    CreateEntity_Toggle_Gravity(me, spriteRegionX, spriteRegionY, id, GRAVITY_KIND__UP);
}

void CreateEntity_Toggle_Gravity__Toggle(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 id)
{
    CreateEntity_Toggle_Gravity(me, spriteRegionX, spriteRegionY, id, GRAVITY_KIND__TOGGLE);
}

void Task_GravityToggle(void)
{
    Sprite_GravityToggle *toggle = TASK_DATA(gCurTask);

    if (!PLAYER_IS_ALIVE) {
        ChangeGravityByKind(toggle);
    }

    if (!AlivePlayerIsInToggle(toggle)) {
        ChangeGravityByKind(toggle);
    }

    if (ToggleIsOffscreen(toggle)) {
        DestroyGravityToggle(toggle);
    }
}