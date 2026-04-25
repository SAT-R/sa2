#include "global.h"
#include "core.h"
#include "flags.h"
#include "lib/m4a/m4a.h"
#include "task.h"

#include "game/globals.h"
#include "game/shared/stage/stage.h"
#include "game/shared/multiplayer/communication_outcome.h"

#if (GAME == GAME_SA1)
#include "game/sa1/menus/title_screen.h"
#include "game/sa1/ui/character_select.h"
#include "game/sa1/stage/mp_results.h"
#include "game/sa1/special_stage/main.h"

#include "constants/sa1/songs.h"
#include "data/sa1/tileset_debug_ascii.h"
#include "data/sa1/credits.h"
#include "game/sa1/stage/extra_stage.h"
#elif (GAME == GAME_SA2)
#include "game/sa2/stage/bosses/common.h"
#include "game/sa2/ui/character_select.h"

#if PORTABLE
#include "game/sa2/special_stage/main.h"
#endif

#include "constants/sa2/songs.h"
#include "data/sa2/tileset_debug_ascii.h"
#endif

#include "animation_commands_bg.h"

#if (GAME == GAME_SA1)
#define LEFT_INPUT(value)  (value)++
#define RIGHT_INPUT(value) (value)--
#else
#define LEFT_INPUT(value)  (value)--
#define RIGHT_INPUT(value) (value)++
#endif

typedef struct {
    void *vram;
    u16 unk4;
    u8 levelId;
} LevelSelect;

static void Task_UnusedLevelSelectInit(void);
static void Task_Poll(void);
static void Task_CreateMultiplayer(void);
static void Task_CreateSelectedTask(void);
static void Task_LoadStage(void);

void CreateUnusedLevelSelect(void)
{
#ifdef BUG_FIX
    // You can come into a situation where a backgorund gets put onto the queue,
    // but the memory gets free'd.
    // So we need to make sure the Background Copy Queue is clear.
    PAUSE_BACKGROUNDS_QUEUE();
    PAUSE_GRAPHICS_QUEUE();
#endif
    struct Task *t = TaskCreate(Task_UnusedLevelSelectInit, sizeof(LevelSelect), 0x2000, 0, NULL);
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

#if (GAME == GAME_SA2)
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
#endif
    }
}

static void Task_Poll(void)
{
    u8 digits[5];
    LevelSelect *levelSelect = TASK_DATA(gCurTask);

    if (gPressedKeys & (START_BUTTON | A_BUTTON)) {
        m4aSongNumStart(SE_SELECT);

#if (GAME == GAME_SA1)
        m4aSongNumStop(MUS_CHARACTER_SELECTION);
        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = 0xFF;
        gBgSprites_Unknown2[0][3] = 0x20;

        if (IS_MULTI_PLAYER) {
            gCurTask->main = Task_CreateMultiplayer;
        } else {
            gCurTask->main = Task_CreateSelectedTask;
        }
#elif (GAME == GAME_SA2)
        INIT_BG_SPRITES_LAYER_32(0);

        gCurTask->main = Task_LoadStage;
#endif
    } else if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        TaskDestroy(gCurTask);

#if (GAME == GAME_SA1)
        CreateCharacterSelectionScreen(0);

        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = 0xFF;
        gBgSprites_Unknown2[0][3] = 0x20;
#elif (GAME == GAME_SA2)
        INIT_BG_SPRITES_LAYER_32(0);
#endif
    } else {
        if (gRepeatedKeys & DPAD_LEFT) {
            LEFT_INPUT(levelSelect->levelId);
        } else if (gRepeatedKeys & DPAD_RIGHT) {
            RIGHT_INPUT(levelSelect->levelId);
        }

        numToASCII(digits, levelSelect->levelId);
        RenderText(levelSelect->vram, Tileset_DebugAscii, 12, 14, 0, (char *)digits, 0);
    }
}

#if (GAME == GAME_SA1)
void Task_CreateMultiplayer(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);
    union MultiSioData *send, *send_recv;
    bool32 parent;
    u32 i;

    LINK_HEARTBEAT();

    send_recv = gMultiSioRecv;
    if (send_recv->pat0.unk0 == 82) {
        levelSelect->levelId = send_recv->pat0.unk2;
        gCurTask->main = Task_CreateSelectedTask;
        return;
    }

    send_recv = &gMultiSioSend;
    send_recv->pat0.unk0 = 81;
    send_recv->pat0.unk2 = levelSelect->levelId;

    parent = gMultiSioStatusFlags & MULTI_SIO_PARENT;
    send = &gMultiSioSend;
    if (parent) {
        u8 j;

        for (j = 0; j < 4; j++) {
            if (CONNECTION_REGISTERED(j)) {
                send_recv = &gMultiSioRecv[j];
                if (send_recv->pat0.unk0 != 81) {
                    return;
                }
            }
        }
        send->pat0.unk0 = 82;
    }
}

void Task_CreateSelectedTask(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);
    u8 levelId = levelSelect->levelId;

    TaskDestroy(gCurTask);

    if (levelId == LEVEL_INDEX(ZONE_1, ACT_1)) {
        gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
        ApplyGameStageSettings();
    } else if (levelId == 0xFF) {
        CreateStaffCredits();
    } else if (levelId == 0xFE) {
        CreateCongratulationsAnimation();
    } else if (levelId == 0xFD) {
        CreateExtraStageResults();
    } else if (levelId == 0xFC) {
        CreateMultiplayerResultsScreen(0);
    } else if (levelId == 0xFB) {
        CreateMultiplayerResultsScreen(1);
    } else if (levelId == 0xFA) {
        CreateMultiplayerResultsScreen(2);
    } else if (levelId == 0xF9) {
        CreateMultipackOutcomeScreen(0);
    } else if (levelId == 0xF8) {
        CreateMultipackOutcomeScreen(1);
    } else if (levelId < NUM_LEVEL_IDS + 1) {
        gCurrentLevel = levelId - 1;

        if (!(gInput & R_BUTTON)) {
            ApplyGameStageSettings();
        } else {
            CreateSpecialStage();
        }
    }
}
#endif // (GAME == GAME_SA1)

static void Task_UnusedLevelSelectInit(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);
    SET_PALETTE_COLOR_BG(0, 1, RGB_WHITE);
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    levelSelect->vram += RenderText(levelSelect->vram, Tileset_DebugAscii, 6, 14, 0, "STAGE", 0);

    gCurTask->main = Task_Poll;
    gCurTask->main();
}

#if (GAME == GAME_SA2)
static void Task_LoadStage(void)
{
    LevelSelect *levelSelect = TASK_DATA(gCurTask);

    u32 levelId = levelSelect->levelId;
    u8 levelId2 = levelId;

    TaskDestroy(gCurTask);

    if (levelId == 0) {
        gCurrentLevel = levelId;
#if PORTABLE
        ApplyGameStageSettings();
        CreateSpecialStage(-1, -1);
#else
        GameStageStart();
#endif
    } else if (levelId2 <= NUM_LEVEL_IDS) {
#if (GAME == GAME_SA2)
        gActiveBossTask = NULL;
#endif
        gCurrentLevel = levelId2 - 1;
#if PORTABLE
        ApplyGameStageSettings();
        CreateSpecialStage(-1, -1);
#else
        GameStageStart();
#endif
    }
}

static void nullsub_8009910(void) { }
static void nullsub_8009914(void) { }
#endif
