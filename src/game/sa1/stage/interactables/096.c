#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"

#include "constants/sa1/char_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ u8 unk3C;
} IA096;

void Task_Interactable096(void);

void Task_Interactable096(void)
{
    IA096 *ia = TASK_DATA(gCurTask);
    MapEntity *me = ia->base.me;
    s16 worldX, worldY;
    s16 screenX, screenY;
    s32 i;

    worldX = TO_WORLD_POS(ia->base.meX, ia->base.regionX);
    worldY = TO_WORLD_POS(me->y, ia->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if ((worldX - 8 <= I(PLAYER(i).qWorldX)) && ((worldX + 8) >= I(PLAYER(i).qWorldX)) && (worldY - 8 <= I(PLAYER(i).qWorldY))
                && ((worldY + 8) >= I(PLAYER(i).qWorldY))) {

                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                PLAYER(i).charState = CHARSTATE_SPINATTACK;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void CreateEntity_Interactable096(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Interactable096, sizeof(IA096), 0x2000, 0, NULL);
    IA096 *ia = TASK_DATA(t);

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;
    ia->unk3C = 0;

    SET_MAP_ENTITY_INITIALIZED(me);
}
