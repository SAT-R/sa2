#include "global.h"
#include "core.h"
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
} MiniLoop;

void Task_MiniLoop_StartBoost(void);
void Task_MiniLoop_Exit(void);
void Task_MiniLoop_Entrance(void);

void Task_MiniLoop_StartBoost(void)
{
    MiniLoop *loop = TASK_DATA(gCurTask);
    s32 i;

    i = 0;
    do {
        Player *p = &PLAYER(i);
        s32 worldX, worldY;

        worldX = I(p->qWorldX);
        worldY = I(p->qWorldY);

        if (IS_OUT_OF_DISPLAY_RANGE(loop->worldX, loop->worldY)) {
            p->moveState &= ~MOVESTATE_8000;
            SET_MAP_ENTITY_NOT_INITIALIZED(loop->me, loop->meX);
            TaskDestroy(gCurTask);
            return;
        }

        if ((loop->left <= worldX) && (worldX < loop->right) && (loop->top <= worldY) && (worldY < loop->bottom)) {
            if (!(p->moveState & MOVESTATE_IN_AIR)) {
                p->qSpeedGround = +Q(9.00);
            }
        }
    } while (++i < gNumSingleplayerCharacters);
}

void Task_MiniLoop_Exit(void)
{
    MiniLoop *loop = TASK_DATA(gCurTask);
    s32 i;

    i = 0;
    do {
        Player *p = &PLAYER(i);
        s32 worldX, worldY;

        worldX = I(p->qWorldX);
        worldY = I(p->qWorldY);

        if (IS_OUT_OF_DISPLAY_RANGE(loop->worldX, loop->worldY)) {
            p->moveState &= ~MOVESTATE_8000;
            SET_MAP_ENTITY_NOT_INITIALIZED(loop->me, loop->meX);
            TaskDestroy(gCurTask);
            return;
        }

        if ((loop->left <= worldX) && (worldX < loop->right) && (loop->top <= worldY) && (worldY < loop->bottom)) {
            if (!IS_ALIVE(p)) {
                return;
            }

            if (!(p->moveState & MOVESTATE_IN_AIR)) {
                p->qSpeedGround = -Q(7.25);
            }
        }
    } while (++i < gNumSingleplayerCharacters);
}

void CreateEntity_MiniLoop_StartBoost(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MiniLoop_StartBoost, sizeof(MiniLoop), 0x2000, 0, NULL);
    MiniLoop *loop = TASK_DATA(t);
    s32 worldX, worldY;

    loop->me = me;
    loop->meX = me->x;
    loop->unk1C = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);
    loop->worldX = worldX;
    loop->worldY = worldY;

    loop->left = worldX + (me->d.sData[0] * TILE_WIDTH);
    loop->top = worldY + (me->d.sData[1] * TILE_WIDTH);
    loop->right = loop->left + (me->d.uData[2] * TILE_WIDTH);
    loop->bottom = loop->top + (me->d.uData[3] * TILE_WIDTH);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}

void CreateEntity_MiniLoop_Exit(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MiniLoop_Exit, sizeof(MiniLoop), 0x2000, 0, NULL);
    MiniLoop *loop = TASK_DATA(t);
    s32 worldX, worldY;

    loop->me = me;
    loop->meX = me->x;
    loop->unk1C = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);
    loop->worldX = worldX;
    loop->worldY = worldY;

    loop->left = worldX + (me->d.sData[0] * TILE_WIDTH);
    loop->top = worldY + (me->d.sData[1] * TILE_WIDTH);
    loop->right = loop->left + (me->d.uData[2] * TILE_WIDTH);
    loop->bottom = loop->top + (me->d.uData[3] * TILE_WIDTH);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}

void Task_MiniLoop_Entrance(void)
{
    MiniLoop *loop = TASK_DATA(gCurTask);
    s32 i;

    i = 0;
    do {
        Player *p = &PLAYER(i);
        s32 worldX, worldY;

        worldX = I(p->qWorldX);
        worldY = I(p->qWorldY);

        if (IS_OUT_OF_DISPLAY_RANGE(loop->worldX, loop->worldY)) {
            p->moveState &= ~MOVESTATE_8000;
            SET_MAP_ENTITY_NOT_INITIALIZED(loop->me, loop->meX);
            TaskDestroy(gCurTask);
            return;
        }

        if ((loop->left <= worldX) && (worldX < loop->right) && (loop->top <= worldY) && (worldY < loop->bottom)) {
            if (!IS_ALIVE(p)) {
                return;
            }

            p->rotation = Q(0.5);

            if (!(p->moveState & MOVESTATE_IN_AIR)) {
                p->qSpeedGround = -p->qSpeedGround;
            }
        }
    } while (++i < gNumSingleplayerCharacters);
}

void CreateEntity_MiniLoop_Entrance(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_MiniLoop_Entrance, sizeof(MiniLoop), 0x2000, 0, NULL);
    MiniLoop *loop = TASK_DATA(t);
    s32 worldX, worldY;

    loop->me = me;
    loop->meX = me->x;
    loop->unk1C = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);
    loop->worldX = worldX;
    loop->worldY = worldY;

    loop->left = worldX + (me->d.sData[0] * TILE_WIDTH);
    loop->top = worldY + (me->d.sData[1] * TILE_WIDTH);
    loop->right = loop->left + (me->d.uData[2] * TILE_WIDTH);
    loop->bottom = loop->top + (me->d.uData[3] * TILE_WIDTH);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}