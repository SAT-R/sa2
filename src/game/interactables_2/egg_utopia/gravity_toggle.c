#include "core.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/egg_utopia/gravity_toggle.h"

typedef struct PACKED {
    /* 0x00 */ u8 x;
    /* 0x01 */ u8 y;
    /* 0x02 */ u8 index;

    /* 0x03 */ s8 offsetX;
    /* 0x04 */ s8 offsetY;
    /* 0x05 */ u8 width;
    /* 0x06 */ u8 height;
} Interactable_GravityToggle;

typedef struct {
    /* 0x00 */ u32 x;
    /* 0x04 */ u32 y;
    /* 0x08 */ u16 left;
    /* 0x0A */ u16 top;
    /* 0x0C */ u16 right;
    /* 0x0E */ u16 bottom;
    /* 0x10 */ s16 width;
    /* 0x12 */ s16 height;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler16[2];
    /* 0x18 */ s16 unk18;
    /* 0x1A */ s16 unk1A;
    /* 0x1C */ u8 filler1C[8];
    /* 0x24 */ Interactable_GravityToggle *me;

    // Tile-Pos inside spriteRegion
    /* 0x28 */ u8 spriteX;
    /* 0x29 */ u8 spriteY;
} Sprite_GravityToggle;

static void CreateEntity_Toggle_Gravity(MapEntity *, u16, u16, u8, u8);
static void Task_80801F8(void);
static void TaskDestructor_8080230(struct Task *);
static void sub_8080234(Sprite_GravityToggle *);
static bool32 sub_8080254(Sprite_GravityToggle *);
static void sub_808029C(Sprite_GravityToggle *);
static void Task_8080318(void);

#define GRAVITY_TOGGLE__DOWN   0
#define GRAVITY_TOGGLE__UP     1
#define GRAVITY_TOGGLE__TOGGLE 2

static void CreateEntity_Toggle_Gravity(MapEntity *in_ia, u16 spriteRegionX,
                                        u16 spriteRegionY, u8 spriteY, u8 toggleKind)
{
    struct Task *t = TaskCreate(Task_80801F8, 0x2C, 0x2010, 0, TaskDestructor_8080230);
    Sprite_GravityToggle *toggle = TASK_DATA(t);
    Interactable_GravityToggle *me = (Interactable_GravityToggle *)in_ia;

    toggle->unk14 = toggleKind;
    toggle->x = TO_WORLD_POS(me->x, spriteRegionX);
    toggle->y = TO_WORLD_POS(me->y, spriteRegionY);
    toggle->left = (me->offsetX * 8);
    toggle->top = (me->offsetY * 8);
    toggle->right = toggle->left + (me->width * 8);
    toggle->bottom = toggle->top + (me->height * 8);

    toggle->width = toggle->right - toggle->left;
    toggle->height = toggle->bottom - toggle->top;
    toggle->me = me;
    toggle->spriteX = me->x;
    toggle->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

void sub_80800D4(Sprite_GravityToggle *toggle)
{
    switch (toggle->unk14) {
        case 0: {
            // Regular gravity
            gUnknown_03005424 &= ~EXTRA_STATE__GRAVITY_INVERTED;
        } break;

        case 1: {
            // Upside-down
            gUnknown_03005424 |= EXTRA_STATE__GRAVITY_INVERTED;
        } break;

        case 2: {
            // Maybe collision on enter/exit?
            if (((toggle->unk18 > 0) && (gPlayer.speedAirX > 0))
                || ((toggle->unk18 < 0) && (gPlayer.speedAirX < 0))
                || ((toggle->unk1A > 0) && (gPlayer.speedAirY > 0))
                || ((toggle->unk1A < 0) && (gPlayer.speedAirY < 0))) {
                gUnknown_03005424 ^= EXTRA_STATE__GRAVITY_INVERTED;
            }

        } break;

        default: {
            ;
        } break;
    }

    gCurTask->main = Task_80801F8;
}

bool32 sub_808017C(Sprite_GravityToggle *toggle)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 posX, posY;
        s16 playerX, playerY;

        posX = (toggle->x + toggle->left) - gCamera.x;
        posY = (toggle->y + toggle->top) - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if ((posX <= playerX) && ((posX + toggle->width) >= playerX) && (posY <= playerY)
            && ((posY + toggle->height) >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

void Task_80801F8(void)
{
    Sprite_GravityToggle *toggle = TASK_DATA(gCurTask);

    if (sub_808017C(toggle)) {
        sub_8080234(toggle);
    }

    if (sub_8080254(toggle)) {
        sub_808029C(toggle);
    }
}

void TaskDestructor_8080230(UNUSED struct Task *t) { }

void sub_8080234(Sprite_GravityToggle *toggle)
{
    toggle->unk18 = gPlayer.speedAirX;
    toggle->unk1A = gPlayer.speedAirY;
    gCurTask->main = Task_8080318;
}

bool32 sub_8080254(Sprite_GravityToggle *toggle)
{
    s16 screenX, screenY;
    screenX = toggle->x - gCamera.x;
    screenY = toggle->y - gCamera.y;

    if (IS_OUT_OF_GRAV_TRIGGER_RANGE(screenX, screenY)) {
        return TRUE;
    }

    return FALSE;
}

void sub_808029C(Sprite_GravityToggle *toggle)
{
    toggle->me->x = toggle->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_Toggle_Gravity__Down(MapEntity *me, u16 spriteRegionX,
                                       u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Toggle_Gravity(me, spriteRegionX, spriteRegionY, spriteY,
                                GRAVITY_TOGGLE__DOWN);
}

void CreateEntity_Toggle_Gravity__Up(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                     u8 spriteY)
{
    CreateEntity_Toggle_Gravity(me, spriteRegionX, spriteRegionY, spriteY,
                                GRAVITY_TOGGLE__UP);
}

void CreateEntity_Toggle_Gravity__Toggle(MapEntity *me, u16 spriteRegionX,
                                         u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Toggle_Gravity(me, spriteRegionX, spriteRegionY, spriteY,
                                GRAVITY_TOGGLE__TOGGLE);
}

void Task_8080318(void)
{
    Sprite_GravityToggle *toggle = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_80800D4(toggle);
    }

    if (sub_808017C(toggle) == FALSE) {
        sub_80800D4(toggle);
    }

    if (sub_8080254(toggle)) {
        sub_808029C(toggle);
    }
}