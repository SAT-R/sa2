#include "global.h"
#include "task.h"
#include "game/shared/stage/camera.h"
#include "game/sa1/stage/player_controls.h"
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
} MiniLoopBoost; /* 0x20 */

void Task_MiniLoop_Base(void);

void Task_MiniLoop_Base(void)
{
    MiniLoopBoost *boost = TASK_DATA(gCurTask);

    s32 i = 0;
    do {
        Player *p = &PLAYER(i);

        s32 playerX = I(p->qWorldX);
        s32 playerY = I(p->qWorldY);

        if (IS_OUT_OF_DISPLAY_RANGE(boost->worldX, boost->worldY)) {
            p->moveState &= ~MOVESTATE_8000;
            SET_MAP_ENTITY_NOT_INITIALIZED(boost->me, boost->meX);
            TaskDestroy(gCurTask);
            return;
        }

        if ((boost->left <= playerX) && (playerX < boost->right) && (boost->top <= playerY) && (playerY < boost->bottom)) {
            if (!IS_ALIVE(p)) {
                return;
            }

            p->moveState &= ~MOVESTATE_200;

            if (p->moveState & MOVESTATE_IGNORE_INPUT) {
                p->moveState &= ~MOVESTATE_IGNORE_INPUT;

                p->heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
            }

            p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
        }

        i++;
    } while (i < gNumSingleplayerCharacters);
}

void CreateEntity_MiniLoop_Base(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MiniLoop_Base, sizeof(MiniLoopBoost), 0x2000, 0, NULL);
    MiniLoopBoost *ia = TASK_DATA(t);
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