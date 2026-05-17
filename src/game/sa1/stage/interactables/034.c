#include "global.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/entity.h"

#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

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
} IA034; /* 0x20 */

void Task_Interactable034(void);

// (96.64%) https://decomp.me/scratch/7a3DS
NONMATCH("asm/non_matching/game/sa1/stage/interactables/Task_Interactable034.inc", void Task_Interactable034(void))
{
    IA034 *ia = TASK_DATA(gCurTask);

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

            Player_TransitionCancelFlyingAndBoost(p);
            p->moveState |= MOVESTATE_200 | MOVESTATE_SPIN_ATTACK;
            p->moveState |= MOVESTATE_IGNORE_INPUT;
            p->heldInput = 0;
            p->frameInput = 0;
            p->charState = CHARSTATE_SPINATTACK;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);

            p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

            // TODO: Is using gPlayer instead of 'p' a bug?
            gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;

            if (p->character != CHARACTER_AMY) {
                m4aSongNumStartOrChange(SE_SPIN_ATTACK);
            }
        }

        i++;
    } while (i < gNumSingleplayerCharacters);
}
END_NONMATCH

void CreateEntity_Interactable034(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Interactable034, sizeof(IA034), 0x2000, 0, NULL);
    IA034 *ia = TASK_DATA(t);
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