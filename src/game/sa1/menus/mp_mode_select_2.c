#include "global.h"
#include "core.h"
#include "flags.h"
#include "multi_boot.h"
#include "sio32_multi_load.h"
#include "lib/m4a/m4a.h"
#include "game/dummy_task.h"
#include "game/shared/collect_rings/results.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/sa1/menus/mp_mode_select.h"
#include "game/globals.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/rings_scatter.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/tilemaps.h"
#include "constants/sa1/text.h"

/* NOTE:
   This module was split into two, because sa2__sub_80818B8() would compile
   differently when the two functions directly above it in the ROM were in the same module.

   This is a rare agbcc behavior.
*/

typedef enum PakModes {
    PM_MULTI_PAK,
    PM_SINGLE_PAK,

    PM_COUNT
} PakModes;

typedef struct {
    /* 0x00 */ Background bg;
    /* 0x40 */ Sprite s[3];
    /* 0xD0 */ Sprite s4;
    /* 0x100 */ u8 filler100[0xF0];
    /* 0x1F0 */ VoidFn fn1F0;
    /* 0x100 */ u8 filler1F4[0x4];
    /* 0x1FC */ s32 unk1F8;
    /* 0x1FC */ s32 qUnk1FC;
    /* 0x200 */ s16 unk200;
    /* 0x202 */ u8 unk202;
    /* 0x203 */ u8 mode;
    /* 0x204 */ u8 unk204;
    /* 0x205 */ u8 unk205;
    /* 0x206 */ u8 unk206;
    /* 0x207 */ u8 unk207;
    /* 0x208 */ s16 qUnk208;
    /* 0x20A */ u8 unk20A;
    /* 0x204 */ u8 unk20B[2][4];
    /* 0x214 */ s32 frameCount;
    /* 0x218 */ u8 unk218;
    /* 0x219 */ u8 unk219;
} ModeSelect; /* 0x21C */

typedef struct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    struct MultiplayerScore mps;
} SioMultiplayerScore;

void Task_800E648(void);
void sub_800E798(void);
void sub_800FBF8(void);
void sub_800FF38(void);
void SA2_LABEL(sub_8081CC4)(void);
void Task_8010020(void);
void SA2_LABEL(sub_8081D58)(void);
void SA2_LABEL(sub_8081DB4)();

void sub_800FD9C(SioMultiplayerScore *param);
void Task_800F058(void);

extern const VoidFn gUnknown_080BB3F8[9];

void SA2_LABEL(sub_80818B8)(void)
{
    u32 var_r1;
    u8 temp_r4_3;
    u8 var_r3;
    u32 unkR6;
    union MultiSioData *send_recv;

    ModeSelect *modeSelect = TASK_DATA(gCurTask);

    if ((gMultiSioStatusFlags & 0x20) && (modeSelect->unk204 < 9)) {
        gCurTask->main = sub_800FBF8;
    }
    if (gMultiSioStatusFlags & 0x10) {
        modeSelect->unk202 = 1;
    }
    gMultiSioSend.pat2.unk0 = LOADED_SAVE->uiLanguage;
    gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, gMultiSioRecv, modeSelect->unk202);
    if (modeSelect->unk205 == 0) {
        MultiSioStart();
        modeSelect->unk205 = 1;
    }

    unkR6 = ((u32)(gMultiSioStatusFlags & 0xF00) >> 8);
    // NOTE: Similar to macro: LINK_HEARTBEAT()
    for (var_r3 = 1; var_r3 < 4; var_r3++) {
        if (gMultiSioStatusFlags & (1 << (var_r3 + 8))) {
            if (!((1 << var_r3) & gMultiSioStatusFlags)) {
                if (gMultiplayerMissingHeartbeats[var_r3]++ >= 0xB5) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    gFlags &= 0xFFFFBFFF;
                    gFlags &= 0xFFFF7FFF;
                    m4aSoundVSyncOn();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[var_r3] = 0;
            }
        }

        if ((unkR6 << var_r3)) {
            union MultiSioData *send_recv = &gMultiSioRecv[var_r3];
            if ((send_recv->pat0.unk0 == 0x10)) {
                for (var_r1 = 0; var_r1 < 4; var_r1++) {
                    gMultiplayerCharacters[var_r1] = 0;
                    gMPRingCollectWins[var_r1] = 0;
                    gMultiplayerRanks[var_r1] = var_r1;
                    gMultiplayerMissingHeartbeats[var_r1] = 0;
                }
                gCurTask->main = SA2_LABEL(sub_8081D58);
                gDispCnt = 0x40;
                return;
            }
        }
    }

    gFlags |= 1;
    temp_r4_3 = (((modeSelect->unk204 * 0x10) + 8) / 9U);
    CpuFill16(0, &gBgPalette[2 * 16 + temp_r4_3], (((16 - temp_r4_3) & 0x1FFFFF) << 1));
    CpuFill16(RGB16(31, 19, 0), &gBgPalette[0x20], temp_r4_3 * 2);
    if (modeSelect->unk204 != gMultiSioRecv->pat0.unk2) {
        modeSelect->unk204 = gMultiSioRecv->pat0.unk2;
        modeSelect->unk1F8 = 0;
    }
}

void sub_800FBF8(void)
{
    u32 var_r1;
    u8 *temp_r3;

    ModeSelect *modeSelect = TASK_DATA(gCurTask);

    MultiSioStop();
    if (modeSelect->unk204 == 9) {
        for (var_r1 = 0; var_r1 < 4; var_r1++) {
            gMultiplayerCharacters[var_r1] = 0;
            gMPRingCollectWins[var_r1] = 0;
            gMultiplayerRanks[var_r1] = var_r1;
            gMultiplayerMissingHeartbeats[var_r1] = 0;
        }
        *gIntrTable = modeSelect->fn1F0;
        gMultiSioEnabled = 1;
        MultiSioInit((u32)(gMultiSioStatusFlags & 0xF00) >> 8);
        MultiSioStart();
        gCurTask->main = SA2_LABEL(sub_8081D58);
        gDispCnt = 0x40;
        return;
    }
    modeSelect->fn1F0 = *gIntrTable;
    *gIntrTable = Sio32MultiLoadIntr;
    Sio32MultiLoadInit(gMultiSioStatusFlags & 0x80, gUnknown_080BB3F8[modeSelect->unk204]);
    gCurTask->main = Task_8010020;
}

void SA2_LABEL(sub_8081200)(void)
{
    u8 i;

    gGameMode = GAME_MODE_MULTI_PLAYER_COLLECT_RINGS;

    gRingsScatterTask = NULL;
    gDummyTask = NULL;
    gGameStageTask = NULL;
    gPlayer.spriteTask = NULL;
#if (GAME == GAME_SA1)
    gPartner.spriteTask = NULL;
#endif
    gCamera.movementTask = NULL;
    SA2_LABEL(gUnknown_0300543C) = 0;
#ifndef COLLECT_RINGS_ROM
    gGameMode = GAME_MODE_MULTI_PLAYER_COLLECT_RINGS;
#endif
    gEntitiesManagerTask = NULL;

    for (i = 0; i < 4; i++) {
        gMultiplayerPlayerTasks[i] = NULL;
    };

    ApplyGameStageSettingsAndStart();
#ifndef COLLECT_RINGS_ROM
    gStageFlags &= ~STAGE_FLAG__ACT_START;
    gPlayer.moveState &= ~MOVESTATE_IGNORE_INPUT;
#endif
    gPlayer.heldInput |= gPlayerControls.jump | gPlayerControls.attack;
}

// (66.97%) https://decomp.me/scratch/876Ux
NONMATCH("asm/non_matching/game/sa1/stage/results_2__sub_800FD9C.inc", void sub_800FD9C(SioMultiplayerScore *data))
{
    struct MultiplayerScore sp00;
    // s32 ip = 0;
    u32 i = 0;
    u32 r3;
    bool32 r6;

    struct MultiplayerScore *inScore = &data->mps;

    for (i = 0; i < ARRAY_COUNT(LOADED_SAVE->multiplayerScores); i++) {
        struct MultiplayerScore *score = &LOADED_SAVE->multiplayerScores[i];
        r6 = TRUE;
        r3 = 0;

        if ((u8)data->mps.playerId != (u8)score->playerId) {
            r6 = FALSE;
        } else {
            // _0800FDD8
            while (++r3 < 12) {
                if (data->mps.data.split.playerName[r3] != score->data.split.playerName[r3]) {
                    r6 = FALSE;
                    break;
                }
            }
            // _0800FDEC

            if (r6) {
                sp00 = data->mps;

                while (i > 0) {
                    LOADED_SAVE->multiplayerScores[i] = LOADED_SAVE->multiplayerScores[i - 1];
                    i--;
                }

                LOADED_SAVE->multiplayerScores[0] = sp00;

                return;
            }
        }
        // _0800FE38 (cont.)
    }

    for (i = 9; i > 0; i--) {
        LOADED_SAVE->multiplayerScores[i] = LOADED_SAVE->multiplayerScores[i - 1];
    }

#ifndef NON_MATCHING
    {
        u8 *ptrA, *ptrB;
        ptrB = (u8 *)&inScore->data.raw;
        ptrA = (u8 *)&LOADED_SAVE->multiplayerScores[0].data.raw;
        for (i = 0; i < sizeof(inScore->data.raw); i++) {
            *ptrA++ = *ptrB++;
        }
    }
#else
    // This is both less error-prone and removes compile errors on modern compilers
    LOADED_SAVE->multiplayerScores[0].playerId = inScore->playerId;
    memcpy(LOADED_SAVE->multiplayerScores[0].data.split.playerName, inScore->data.split.playerName,
           sizeof(LOADED_SAVE->multiplayerScores[0].data.split.playerName));
#endif

    LOADED_SAVE->multiplayerScores[0].data.split.wins = 0;
    LOADED_SAVE->multiplayerScores[0].data.split.losses = 0;
    LOADED_SAVE->multiplayerScores[0].data.split.draws = 0;
}
END_NONMATCH

void ShowSinglePakResults(void)
{
    u32 i;
    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        gMultiplayerCharacters[i] = 0;
        gMPRingCollectWins[i] = 0;
        gMultiplayerRanks[i] = i;
        gMultiplayerMissingHeartbeats[i] = 0;
    }

    MultiSioStart();
    CreateMultiplayerSinglePakResultsScreen(0);
}

#if (GAME == GAME_SA1)
void Task_MultiplayerModeSelectScreenInit(void)
{
    ModeSelect *modeSelect = TASK_DATA(gCurTask);
    modeSelect->qUnk208 -= Q(0.5);
    if (modeSelect->qUnk208 <= Q(0)) {
        modeSelect->qUnk208 = Q(0);
        gCurTask->main = Task_800E648;
    }

    gBldRegs.bldY = I(modeSelect->qUnk208);

    sub_800E798();
}
#endif // (GAME == GAME_SA1)

void SA2_LABEL(sub_8081C50)(void)
{
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    SA2_LABEL(sub_8081DB4)();
    gCurTask->main = SA2_LABEL(sub_80818B8);
    MultiSioStart();
}

void SA2_LABEL(sub_8081C8C)(void)
{
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    SA2_LABEL(sub_8081DB4)();
    gCurTask->main = SA2_LABEL(sub_8081CC4);
}

#if (GAME == GAME_SA1)
void SA2_LABEL(sub_8081DB4)(void)
#elif (GAME == GAME_SA2)
void SA2_LABEL(sub_8081DB4)(struct SinglePakConnectScreen *connectScreen)
#endif
{
#if (GAME == GAME_SA1)
    ModeSelect *modeSelect = TASK_DATA(gCurTask);
#endif

#ifdef MULTI_SIO_DI_FUNC_FAST
    gIntrTable[0] = (void *)gMultiSioIntrFuncBuf;
#else
    gIntrTable[0] = MultiSioIntr;
#endif

    MultiSioInit((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
#if (GAME == GAME_SA1)
    modeSelect->unk202 = 0;
    modeSelect->unk205 = 0;
#elif (GAME == GAME_SA2)
    connectScreen->unkF8 = 0;
    connectScreen->unkF4 = 0;
#endif
    gMultiSioStatusFlags = 0;
}

void SA2_LABEL(sub_8081CC4)(void)
{
    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        if (gMultiSioStatusFlags & MULTI_SIO_LD_SUCCESS) {
            gMultiSioSend.pat0.unk2 += 1;
        }
        gCurTask->main = SA2_LABEL(sub_80818B8);
    }

    SA2_LABEL(sub_80818B8)();
}

void Task_8010020(void)
{
    u32 progress = 0;
    if (Sio32MultiLoadMain(&progress)) {
        gCurTask->main = SA2_LABEL(sub_8081C8C);
    }
}

void SA2_LABEL(sub_8081D58)(void)
{
    TaskDestroy(gCurTask);
    CreateMultiplayerSinglePakResultsScreen(0);
}

void sub_8010060(void)
{
    if (B_BUTTON & gPressedKeys) {
        m4aSongNumStart(107);
        gCurTask->main = Task_800E648;
        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = -1;
        gBgSprites_Unknown2[0][3] = 0x20;
    }
}
