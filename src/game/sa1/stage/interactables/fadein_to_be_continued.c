#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ u16 regionX;
    /* 0x06 */ u16 regionY;
    /* 0x08 */ u8 meX;
    /* 0x09 */ u8 id;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ s16 blend;
} TextTBC;

// TODO: Make static
void Task_ToBeContinuedText(void);
void Task_DestroyActiveTasks(void);
void CreateToBeContinuedScreen(void);
void Task_80256D4(void);

void Task_ToBeContinuedText(void)
{
    TextTBC *tbc = TASK_DATA(gCurTask);
    MapEntity *me = tbc->me;

    s16 worldX = TO_WORLD_POS(tbc->meX, tbc->regionX);
    s16 worldY = TO_WORLD_POS(me->y, tbc->regionY);
    s32 playerX = I(gPlayer.qWorldX);

    if (playerX > worldX) {
        gStageFlags |= STAGE_FLAG__ACT_START;
        gBldRegs.bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
        gBldRegs.bldY = 0;

        tbc->blend = 0;
        tbc->unkA = 0;

        gCurTask->main = Task_80256D4;

        m4aMPlayFadeOut(&gMPlayInfo_BGM, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE1, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
        m4aMPlayFadeOut(&gMPlayInfo_SE3, 4);
    } else if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, tbc->meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void Task_80256D4(void)
{
    TextTBC *tbc = TASK_DATA(gCurTask);
    tbc->blend += Q(0.25);
    gBldRegs.bldY = I(tbc->blend);

    if (tbc->blend >= Q(16)) {
        gBldRegs.bldY = 16;
        gCurTask->main = Task_DestroyActiveTasks;
    }
}

void Task_DestroyActiveTasks(void)
{
    TasksDestroyAll();

    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    CreateToBeContinuedScreen();
}

void CreateEntity_ToBeContinuedText(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_ToBeContinuedText, sizeof(TextTBC), 0x2000, 0, NULL);
    TextTBC *tbc = TASK_DATA(t);

    tbc->regionX = regionX;
    tbc->regionY = regionY;
    tbc->me = me;
    tbc->meX = me->x;

    SET_MAP_ENTITY_INITIALIZED(me);
}
