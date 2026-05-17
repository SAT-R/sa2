#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ u8 fillerC[0x30];
    /* 0x3C */ s8 unk3C;
} IA113; /* 0x40 */

void Task_Interactable113(void);

void Task_Interactable113(void)
{
    IA113 *ia = TASK_DATA(gCurTask);
    MapEntity *me = ia->base.me;
    Player *player, *partner;
    s16 worldX, worldY;
    s16 screenX, screenY;
    s32 i;

    worldX = TO_WORLD_POS(ia->base.meX, ia->base.regionX);
    worldY = TO_WORLD_POS(me->y, ia->base.regionY);

    screenX = worldX - gCamera.x;
    screenY = worldY - gCamera.y;

    i = 0;
    player = &gPlayer;
    partner = &gPartner;
    do {
        if ((worldX <= I(PLAYER(i).qWorldX)) && ((worldX + (me->d.uData[2] * TILE_WIDTH)) >= I(PLAYER(i).qWorldX))
            && (worldY <= I(PLAYER(i).qWorldY)) && ((worldY + (me->d.uData[3] * TILE_WIDTH)) >= I(PLAYER(i).qWorldY))) {
            if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && !GetBit(ia->unk3C, i)) {
                SetBit(ia->unk3C, i);
                PLAYER(i).moveState |= MOVESTATE_IGNORE_INPUT;
                PLAYER(i).frameInput = 0;
                PLAYER(i).heldInput = 0;
            }
        } else if (GetBit(ia->unk3C, i)) {
            ClearBit(ia->unk3C, i);
            PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;

            PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
        }
    } while (++i < gNumSingleplayerCharacters);

    if (ia->unk3C == 0) {
        if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
            TaskDestroy(gCurTask);
            return;
        }
    }
}

void CreateEntity_Interactable113(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Interactable113, sizeof(IA113), 0x2000, 0, NULL);
    IA113 *ia = TASK_DATA(t);

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;
    ia->unk3C = 0;

    SET_MAP_ENTITY_INITIALIZED(me);
}