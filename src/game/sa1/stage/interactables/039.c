#include "global.h"
#include "task.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/entity.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ s32 worldX;
    /* 0x08 */ s32 worldY;
    /* 0x0C */ s32 left;
    /* 0x10 */ s32 right;
    /* 0x14 */ s32 top;
    /* 0x18 */ s32 bottom;
    /* 0x1C */ u8 unk1C;
    /* 0x1D */ u8 meX;
} IA039; /* 0x20 */

void Task_Interactable039Main(void);

void Task_Interactable039Main(void)
{
    IA039 *ia = TASK_DATA(gCurTask);

    s32 i = 0;
    do {
        Player *p = &PLAYER(i);

        s32 playerX = I(p->qWorldX);
        s32 playerY = I(p->qWorldY);

        if (IS_OUT_OF_DISPLAY_RANGE(ia->worldX, ia->worldY)) {
            p->moveState &= ~MOVESTATE_8000;
            SET_MAP_ENTITY_NOT_INITIALIZED(ia->me, ia->meX);
            TaskDestroy(gCurTask);
            return;
        }

        if ((ia->left <= playerX) && (playerX < ia->right) && (ia->top <= playerY) && (playerY < ia->bottom)) {
            if (!IS_ALIVE(p)) {
                return;
            }

            if (!(p->moveState & MOVESTATE_IN_AIR)) {
                p->qSpeedGround = -Q(4.5);
            }
        }

        i++;
    } while (i < gNumSingleplayerCharacters);
}

void CreateEntity_Interactable039(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Interactable039Main, sizeof(IA039), 0x2000, 0, NULL);
    IA039 *ia = TASK_DATA(t);
    s32 worldX, worldY;

    ia->me = me;
    ia->meX = me->x;
    ia->unk1C = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);

    ia->worldX = worldX;
    ia->worldY = worldY;

    worldX += (me->d.sData[0] * TILE_WIDTH);
    ia->left = worldX;
    worldY += (me->d.sData[1] * TILE_WIDTH);
    ia->top = worldY;
    worldX += (me->d.uData[2] * TILE_WIDTH);
    ia->right = worldX;
    worldY += (me->d.uData[3] * TILE_WIDTH);
    ia->bottom = worldY;

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}