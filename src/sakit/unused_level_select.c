#include "global.h"
#include "core.h"
#include "lib/m4a.h"
#include "task.h"

#include "sakit/globals.h"

#include "game/stage/stage.h"
#include "game/bosses/common.h"
#include "game/title_screen.h"

#include "animation_commands_bg.h"
#include "data/tileset_language.h"

#include "constants/songs.h"

typedef struct {
    void *vram;
    u16 unk4;
    u8 levelId;
} LevelSelect;

static void Task_8009854(void);
static void Task_Poll(void);
static void Task_LoadStage(void);

void CreateUnusedLevelSelect(void)
{
    struct Task *t = TaskCreate(Task_8009854, sizeof(LevelSelect), 0x2000, 0, NULL);
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    {
        LevelSelect *levelSelect = TASK_DATA(t);

        gDispCnt = (DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0);
        gBgCntRegs[0] = (BGCNT_SCREENBASE(31) | BGCNT_16COLOR | BGCNT_CHARBASE(1) | BGCNT_PRIORITY(2));

        levelSelect->unk4 = 0;
        levelSelect->levelId = 0;
        levelSelect->vram = (void *)(BG_CHAR_ADDR(1) + 1 * TILE_SIZE_4BPP);

        gBldRegs.bldY = 0;
        gBldRegs.bldCnt = BLDCNT_EFFECT_NONE;
        gBldRegs.bldAlpha = BLDCNT_EFFECT_NONE;

        gWinRegs[WINREG_WIN0H] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(DISPLAY_HEIGHT, DISPLAY_HEIGHT);

        gWinRegs[WINREG_WIN1H] = WIN_RANGE(DISPLAY_WIDTH, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(DISPLAY_HEIGHT, DISPLAY_HEIGHT);

        gWinRegs[WINREG_WININ] = 0;
        gWinRegs[WINREG_WINOUT] = 0;

        gDispCnt &= ~(DISPCNT_OBJWIN_ON | DISPCNT_WIN1_ON | DISPCNT_WIN0_ON);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
    }
}

static void Task_Poll(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);

    u8 digits[5];

    if (gPressedKeys & (START_BUTTON | A_BUTTON)) {
        m4aSongNumStart(SE_SELECT);

        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0xFF;
        gUnknown_03002280[0][3] = 0x20;
        gCurTask->main = Task_LoadStage;
    } else if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        TaskDestroy(gCurTask);

        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0][0] = 0;
        gUnknown_03002280[0][1] = 0;
        gUnknown_03002280[0][2] = 0xFF;
        gUnknown_03002280[0][3] = 0x20;
    } else {
        if (gRepeatedKeys & DPAD_LEFT) {
            levelSelect->levelId--;
        } else if (gRepeatedKeys & DPAD_RIGHT) {
            levelSelect->levelId++;
        }

        numToASCII(digits, levelSelect->levelId);
        RenderText(levelSelect->vram, Tileset_Language, 0xC, 0xE, 0, digits, 0);
    }
}

static void Task_8009854(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);
    gBgPalette[1] = RGB_WHITE;
    gFlags |= 0x1;

    levelSelect->vram += RenderText(levelSelect->vram, Tileset_Language, 0x6, 0xE, 0, "STAGE", 0);

    gCurTask->main = Task_Poll;
    gCurTask->main();
}

static void Task_LoadStage(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);

    u32 levelId = levelSelect->levelId;
    u8 levelId2 = levelId;

    TaskDestroy(gCurTask);

    if (levelId == 0) {
        gCurrentLevel = levelId;
        GameStageStart();
    } else if (levelId2 <= NUM_LEVEL_IDS) {
        gActiveBossTask = NULL;
        gCurrentLevel = levelId2 - 1;
        GameStageStart();
    }
}

static void nullsub_8009910(void) { }
static void nullsub_8009914(void) { }
