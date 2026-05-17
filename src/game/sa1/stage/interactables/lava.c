#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"

#include "constants/sa1/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x28];
    /* 0x34 */ u16 regionX;
    /* 0x36 */ u16 regionY;
    /* 0x38 */ u16 unk38;
    /* 0x3A */ u16 unk3A;
    /* 0x3C */ u8 meX;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E;
} Lava; /* 0x40 */

#ifndef NON_MATCHING
#define LAVA_DATA_SIZE 0x3F
#else
#define LAVA_DATA_SIZE sizeof(Lava)
#endif

void Task_Lava(void)
{
    Lava *lava = TASK_DATA(gCurTask);
    MapEntity *me = lava->base.me;
    u8 meX = TASK_GET_MEMBER(Lava, gCurTask, u8, meX);
    u16 regionX = TASK_GET_MEMBER(Lava, gCurTask, u16, regionX);
    u16 regionY = TASK_GET_MEMBER(Lava, gCurTask, u16, regionY);
    Player *player;
    Player *partner;
    CamCoord x, y; // Need to not split screen/world pos to match...
    s16 screenX, screenY;
    s32 i;

    x = TO_WORLD_POS(meX, regionX);
    y = TO_WORLD_POS(me->y, regionY);
    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        i = 0;

        do {
            if (TASK_GET_MEMBER(Lava, gCurTask, u16, unk3A) == 1) {
#ifndef NON_MATCHING
                PLAYER(i).qSpeedAirY = Div(PLAYER(i).qSpeedAirY, 2);
#else
                PLAYER(i).qSpeedAirY >>= 1;
#endif
            }
        } while (++i < gNumSingleplayerCharacters);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, meX);
        TaskDestroy(gCurTask);
        return;
    } else {
        x = (x + gCamera.x);
        y = (y + gCamera.y);

        i = 0;

        do {
            if (!(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE) && (x <= I(PLAYER(i).qWorldX))
                && (x + (me->d.uData[2] * TILE_WIDTH) >= I(PLAYER(i).qWorldX)) && (y <= I(PLAYER(i).qWorldY))
                && (y + (me->d.uData[3] * TILE_WIDTH) >= I(PLAYER(i).qWorldY)) && !(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if (me->d.sData[0] == 0) {
                    if (~PLAYER(i).itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) {
                        Coll_DamagePlayer(&PLAYER(i));
                    }
                } else {
                    PLAYER(i).moveState |= MOVESTATE_DEAD;
                }
            }
        } while (++i < gNumSingleplayerCharacters);
    }
}

void CreateEntity_Lava(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Lava, LAVA_DATA_SIZE, 0x2000, 0, NULL);

    TASK_SET_MEMBER(Lava, t, u16, regionX, regionX);
    TASK_SET_MEMBER(Lava, t, u16, regionY, regionY);
    TASK_SET_MEMBER(Lava, t, u16, unk38, 0);
    TASK_SET_MEMBER(Lava, t, u16, unk3A, 0);
#ifndef NON_MATCHING
    // *sigh*
    TASK_SET_MEMBER(Lava, t, u16, unk3A, 0);
    TASK_SET_MEMBER(Lava, t, u16, unk3A, 0);
#endif
    TASK_SET_MEMBER(Lava, t, MapEntity *, base.me, me);
    TASK_SET_MEMBER(Lava, t, u8, unk3D, 0);
    TASK_SET_MEMBER(Lava, t, u8, unk3E, 0);
    TASK_SET_MEMBER(Lava, t, u8, meX, me->x);

    SET_MAP_ENTITY_INITIALIZED(me);
}