#include "global.h"
#include "core.h"
#include "game/shared/stage/entity.h"

typedef struct {
    SpriteBase base;
    u8 fillerC[0x30];
    s8 visibility; // 0 = Visible, 1 = Invisible
} TogglePlayerVisibility;

void Task_Toggle_PlayerVisibility(void);

void Task_Toggle_PlayerVisibility(void)
{
    TogglePlayerVisibility *ia = TASK_DATA(gCurTask);
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
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if ((worldX <= I(PLAYER(i).qWorldX)) && ((worldX + (me->d.uData[2] * TILE_WIDTH)) >= I(PLAYER(i).qWorldX))
                && (worldY <= I(PLAYER(i).qWorldY)) && ((worldY + (me->d.uData[3] * TILE_WIDTH)) >= I(PLAYER(i).qWorldY))) {
                if (ia->visibility) {
                    PLAYER(i).moveState |= MOVESTATE_100000;
                } else {
                    PLAYER(i).moveState &= ~MOVESTATE_100000;
                }
            }
        } else {
            PLAYER(i).moveState &= ~MOVESTATE_100000;
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(screenX, screenY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, ia->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void CreateEntity_Toggle_PlayerVisibility(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Toggle_PlayerVisibility, sizeof(TogglePlayerVisibility), 0x2000 | me->d.uData[3], 0, NULL);
    TogglePlayerVisibility *ia = TASK_DATA(t);

    ia->base.regionX = regionX;
    ia->base.regionY = regionY;
    ia->base.me = me;
    ia->base.meX = me->x;
    ia->base.id = id;

    ia->visibility = me->d.uData[0];

    SET_MAP_ENTITY_INITIALIZED(me);
}
