#include "global.h"
#include "core.h"
#include "flags.h"
#include "multi_boot.h"
#include "lib/m4a/m4a.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/sa1/menus/mp_mode_select.h"
#include "game/sa1/save.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/tilemaps.h"
#include "constants/sa1/text.h"

/* NOTE:
   This module was split into two, because Task_800F9BC() would compile
   differently when the two functions directly above it in the ROM were in the same module.

   This is a rare agbcc behavior.
   This MIGHT be resolved once Task_SinglePak() matches (because the function changed)?
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
    /* 0x100 */ u8 filler100[0xF8];
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

void Task_MultiplayerModeSelectScreenInit(void);
void sub_800E798(void);
void Task_800E868(void);
void sub_800FBF8(void);
void SA2_LABEL(sub_8081C50)(void);
void sub_8010048(void);
void Task_SinglePak(void);
void ModeSelect_InitMultiPak(void);
void Task_MultiPak(void);
void ModeSelect_InitSinglePak(void);

extern void CreatePlayerNameInputMenu();
const AnimId gUnknown_080BB348[UILANG_COUNT] = { SA1_ANIM_MP_GAME_PAK_MODE_JP, SA1_ANIM_MP_GAME_PAK_MODE_EN };
const AnimId gUnknown_080BB34C[UILANG_COUNT] = { SA1_ANIM_MP_OUTCOME_MESSAGES_JP, SA1_ANIM_MP_OUTCOME_MESSAGES_EN };
const AnimId gUnknown_080BB350[UILANG_COUNT] = { SA1_ANIM_MP_PRESS_START_JP, SA1_ANIM_MP_PRESS_START_EN };
const VoidFn sModeInitProcs[PM_COUNT] = { ModeSelect_InitMultiPak, ModeSelect_InitSinglePak };

extern u8 gUnknown_03005008[MULTI_SIO_PLAYERS_MAX];
extern u8 gMultiboot_087C0258[];
extern u8 gMultiboot_087C22F8[];
void sub_800FD9C(u8 *param);
void Task_800F058(void);

void CreateMultiplayerModeSelectScreen(void)
{
    Sprite *s;
    ModeSelect *modeSelect;
    Background *bg;

    if (LOADED_SAVE->unk4 == 0) {
        m4aSongNumStartOrChange(MUS_CHARACTER_SELECTION);
        gGameMode = 2;
        CreatePlayerNameInputMenu();
        return;
    }
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1E03;
    modeSelect = TASK_DATA(TaskCreate(Task_MultiplayerModeSelectScreenInit, sizeof(ModeSelect), 0x2000U, 0U, NULL));
    modeSelect->unk200 = 0;
    modeSelect->mode = PM_MULTI_PAK;
    modeSelect->qUnk1FC = Q(0);
    modeSelect->qUnk208 = Q(16);

    gBldRegs.bldCnt = 0xFF;
    gBldRegs.bldY = 0x10;

    s = &modeSelect->s[0];
    s->x = 232;
    s->y = 64;
    s->graphics.dest = (void *)OBJ_VRAM0;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB348[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &modeSelect->s[1];
    s->x = 0;
    s->y = 64;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x840);
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 860;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    bg = &modeSelect->bg;
    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)(BG_VRAM + 0xF000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = (s16)(LOADED_SAVE->uiLanguage + 0x4C);
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    m4aSongNumStartOrChange(MUS_CHARACTER_SELECTION);
}

void Task_800E648()
{
    ModeSelect *modeSelect = TASK_DATA(gCurTask);

    if (DPAD_UP & gRepeatedKeys) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        if (--modeSelect->mode >= PM_COUNT) {
            modeSelect->mode = PM_SINGLE_PAK;
        }

        modeSelect->qUnk1FC = 0;
    } else if (DPAD_DOWN & gRepeatedKeys) {
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);

        if (++modeSelect->mode >= PM_COUNT) {
            modeSelect->mode = PM_MULTI_PAK;
        }
        modeSelect->qUnk1FC = 0;
    }

    if (A_BUTTON & gPressedKeys) {
        modeSelect->unk20A = 0;
        m4aSongNumStart(SE_SELECT);

        DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
        DmaFill32(3, 0, &gMultiSioRecv, sizeof(gMultiSioRecv));

        gBldRegs.bldCnt = 0xFF;
        gCurTask->main = Task_800E868;
    } else if (B_BUTTON & gPressedKeys) {
        s32 v = 1;
        modeSelect->unk20A = v;
        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        gCurTask->main = Task_800E868;
        m4aSongNumStart(SE_RETURN);
        gBldRegs.bldCnt = 0xFF;
    }
    sub_800E798();
}

void sub_800E798()
{
    Sprite *s;
    s32 temp_r1;
    s32 temp_r2;
    s32 var_r4;
    u32 var_r4_2;

    ModeSelect *modeSelect = TASK_DATA(gCurTask);

    modeSelect->qUnk1FC += Q(0.5);
    if (modeSelect->qUnk1FC > Q(200)) {
        modeSelect->qUnk1FC -= Q(200);
    }

    s = &modeSelect->s[0];
    s->y = (modeSelect->mode * 24) + 64;
    modeSelect->s[0].variant = modeSelect->mode;
    UpdateSpriteAnimation(s);
    var_r4 = I(modeSelect->qUnk1FC) - 200;

    while ((232 - var_r4) > 0) {
        s->x = 232 - var_r4;
        DisplaySprite(s);
        var_r4 += 200;
    }

    s = &modeSelect->s[1];
    s->y = (modeSelect->mode * 24) + 54;
    for (var_r4_2 = 0; var_r4_2 < 8; var_r4_2++) {
        s->x = var_r4_2 * 32;
        DisplaySprite(s);
    }
}

void Task_800E868()
{
    ModeSelect *modeSelect = TASK_DATA(gCurTask);

    modeSelect->qUnk208 += Q(0.5);
    if (modeSelect->qUnk208 >= Q(16)) {
        modeSelect->qUnk208 = Q(16);

        if (modeSelect->unk20A != 0) {
            gBldRegs.bldCnt = 0;
            gBldRegs.bldY = 0;
            m4aSongNumStop(3U);
            gBgSprites_Unknown1[0] = 0;
            gBgSprites_Unknown2[0][0] = 0;
            gBgSprites_Unknown2[0][1] = 0;
            gBgSprites_Unknown2[0][2] = -1;
            gBgSprites_Unknown2[0][3] = 0x20;
            TaskDestroy(gCurTask);
            CreateMainMenu(1);
        } else {
            gCurTask->main = sModeInitProcs[modeSelect->mode];
            gBgSprites_Unknown1[0] = 0;
            gBgSprites_Unknown2[0][0] = 0;
            gBgSprites_Unknown2[0][1] = 0;
            gBgSprites_Unknown2[0][2] = -1;
            gBgSprites_Unknown2[0][3] = 0x20;
            gMultiSioEnabled = 1;
        }
    } else {
        gBldRegs.bldY = I(modeSelect->qUnk208);
        sub_800E798();
    }
}

void ModeSelect_InitMultiPak()
{
    Background *bg;
    Sprite *s;
    s32 i;
    ModeSelect *modeSelect;
    u8 *vram = OBJ_VRAM0;

    m4aSongNumStart(MUS_VS_PLEASE_WAIT);
    modeSelect = TASK_DATA(gCurTask);
    modeSelect->frameCount = (s32)(LOADED_SAVE->unk4 + gFrameCount);

    for (i = 0; i < 4; i++) {
        modeSelect->unk20B[0][i] = 0;
        modeSelect->unk20B[1][i] = 0;
    }
    s = &modeSelect->s[0];
    s->x = 120;
    s->y = 33;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB34C[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);
    vram += 0x540;

    s = &modeSelect->s[1];
    s->x = 101;
    s->y = 41;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = 0x378;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);
    vram += 0x460;

    s = &modeSelect->s[2];
    s->x = 120;
    s->y = 109;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MP_OUTCOME_MESSAGES_EN;
    s->variant = 4;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);
    vram += 0x80;

    s = &modeSelect->s4;
    s->x = 120;
    s->y = 125;
    s->graphics.dest = vram;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB350[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    bg = &modeSelect->bg;
    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (u16 *)(BG_VRAM + 0xF000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_MP_CONTINUE_SCREEN;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 0x1E;
    bg->targetTilesY = 0x14;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_PARENT) {
        MultiSioStart();
    }

    modeSelect->unk206 = 0;
    modeSelect->unk218 = 0;
    gCurTask->main = Task_MultiPak;
}

// TODO: Fake-match
void Task_MultiPak()
{
    s32 sp0;
    s32 sp4;
    s32 sp8;
    s32 spC;
    Sprite *s;
    s32 i;
    s32 var_sb;
    u8 temp_r1_2;
    u8 var_r7;
    u8 var_sl;
    ModeSelect *modeSelect;
    union MultiSioData *send_recv;
    u8 unk20B;

#ifndef NON_MATCHING
    register s32 r0 asm("r0");
    register s32 r2 asm("r2");
#else
    s32 r0;
    s32 r2;
#endif

    sp0 = 0;
    sp4 = 0;
    var_sl = 0;
    sp8 = 0;
    var_sb = 0;
    spC = 1;
    if (0x81 & gMultiSioStatusFlags) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(SIO_MULTI_CNT->id))) {
            if (gMultiplayerMissingHeartbeats[SIO_MULTI_CNT->id]++ >= 0xB5) {
                TasksDestroyAll();
                PAUSE_BACKGROUNDS_QUEUE();
                gBgSpritesCount = 0;
                PAUSE_GRAPHICS_QUEUE();
                LinkCommunicationError();
                return;
            }
        } else {
            gMultiplayerMissingHeartbeats[SIO_MULTI_CNT->id] = 0;
        }
    }

    modeSelect = TASK_DATA(gCurTask);
    modeSelect->qUnk208 -= 0x80;
    if (modeSelect->qUnk208 < 0) {
        modeSelect->qUnk208 = 0;
    }
    gBldRegs.bldY = I(modeSelect->qUnk208);

    for (i = 0; i < 4; i++) {
        send_recv = &gMultiSioRecv[i];
        r0 = modeSelect->unk20B[0][i];
        r2 = r0 << 1;
        modeSelect->unk20B[0][i] = r2;
        modeSelect->unk20B[1][i] *= 2;
        if ((i == SIO_MULTI_CNT->id) || (CheckBit(gMultiSioStatusFlags, i) && (send_recv->pat0.unk0 >= 0x10))) {
            r2 |= 1;
            modeSelect->unk20B[0][i] = r2;
            sp0 += 1;
            var_sl |= 1 << i;
            if (sp8 != 0) {
                var_sb = 1;
            }
        } else {
            r0 = ((vu16 *)&REG_SIODATA32)[i];
            r2 = r0;
#ifndef NON_MATCHING
            asm("" ::"r"(r0));
#endif
            sp8 = 1;
            if (!CheckBit(gMultiSioStatusFlags, i) && (r2 == 0)) {
                var_sb = 1;
                modeSelect->unk20B[1][i] = (u8)(1 | modeSelect->unk20B[1][i]);
                if (modeSelect->unk20B[0][i] == 0) {
                    spC = 0;
                }
            } else if (modeSelect->unk20B[1][i] != 0) {
                var_sb = 1;
                spC = 0;
            } else if (CheckBit(gMultiSioStatusFlags, i) && (send_recv->pat0.unk0 < 0x10)) {
                var_sb = 1;
                spC = 0;
            }
        }

        if (modeSelect->unk20B[0][i] != 0) {
            sp4 += 1;
        }
    }

    if (sp4 == 0) {
        sp4 = 1;
    }

    send_recv = &gMultiSioRecv[0];
    if (modeSelect->unk218 == 0) {
        if (((gMultiSioStatusFlags & 0x81) == 1) && ((u32)send_recv->pat0.unk0 > 0x10U)) {
            TasksDestroyAll();
            PAUSE_BACKGROUNDS_QUEUE();
            gBgSpritesCount = 0;
            PAUSE_GRAPHICS_QUEUE();
            LinkCommunicationError();
            return;
        } else {
            modeSelect->unk218 = 1;
        }
    }

    if ((var_sb == 0) && (send_recv->pat0.unk0 == 0x11) && (modeSelect->unk218 != 0)) {
        var_r7 = 2;
        gMultiplayerPseudoRandom = send_recv->pat0.unk10;
        gMultiplayerConnections = send_recv->pat0.unk2;
        for (i = 3; i >= 0; i--) {
            send_recv = &gMultiSioRecv[i];
            if (i == SIO_MULTI_CNT->id) {
                gUnknown_03005008[i] |= 0xFF;
            } else if (CheckBit(gMultiSioStatusFlags, i)) {
                sub_800FD9C((void *)send_recv);
                gUnknown_03005008[i] = var_r7--;
            } else {
                gUnknown_03005008[i] |= 0xFF;
                var_r7 -= 1;
            }
        }
        modeSelect->unk200 = 0;
        modeSelect->unk206 = 0;
        gMultiplayerMissingHeartbeats[3] = 0;
        gMultiplayerMissingHeartbeats[2] = 0;
        gMultiplayerMissingHeartbeats[1] = 0;
        gMultiplayerMissingHeartbeats[0] = 0;
        modeSelect->unk219 = 0;
        gCurTask->main = Task_800F058;
        Task_800F058();
        return;
    } else if (send_recv->pat0.unk0 > 0x12u) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
        return;
    } else if (2 & gPressedKeys) {
        gMultiSioEnabled = 0;
        MultiSioStop();
        MultiSioInit(0U);
        send_recv = &gMultiSioSend;
        send_recv->pat0.unk0 = 0;
        m4aSongNumStop(3U);
        m4aSongNumStart(0x6BU);
        gBgSprites_Unknown1[0] = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = 0xFF;
        gBgSprites_Unknown2[0][3] = 0x20;
        TaskDestroy(gCurTask);
        CreateMultiplayerModeSelectScreen();
        return;
    }

    modeSelect->s[2].variant = sp4 + 3;
    for (i = 0; i < 3; i++) {
        s = &modeSelect->s[i];
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    if (gMultiSioStatusFlags & 0x80) {
        if ((sp4 > 1) && (spC != 0)) {
            s = &modeSelect->s4;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }

        if (gMultiSioStatusFlags & 0x80) {
            if (((var_sb == 0) && (sp0 > 1) && (START_BUTTON & gPressedKeys))
                || ((modeSelect->unk206 != 0) && (var_sb == 0) && (sp0 > 1))) {
                send_recv = &gMultiSioSend;
                send_recv->pat0.unk0 = 0x11;
                send_recv->pat0.unk2 = var_sl;
                send_recv->pat0.unk4 = LOADED_SAVE->unk4;
                DmaCopy32(3, &LOADED_SAVE->playerName[0], send_recv->pat0.unk8, sizeof(LOADED_SAVE->playerName));
                send_recv->pat0.unk4 = LOADED_SAVE->unk4;
                send_recv->pat0.unk10 = modeSelect->frameCount;
                DmaCopy32(3, &LOADED_SAVE->playerName[0], send_recv->pat0.unk8, sizeof(LOADED_SAVE->playerName));
                modeSelect->unk206 = 1;
                return;
            }
        }
    }

    if (modeSelect->unk206 != 0) {
        modeSelect->unk206 = 0;
    }

    send_recv = &gMultiSioSend;
    send_recv->pat0.unk0 = 0x10;
    send_recv->pat0.unk4 = LOADED_SAVE->unk4;
    DmaCopy32(3, &LOADED_SAVE->playerName[0], send_recv->pat0.unk8, sizeof(LOADED_SAVE->playerName));
    send_recv->pat0.unk4 = LOADED_SAVE->unk4;
    DmaCopy32(3, &LOADED_SAVE->playerName[0], send_recv->pat0.unk8, sizeof(LOADED_SAVE->playerName));
}

void Task_800F058(void)
{
    Sprite *s;
    s32 var_r3_2;
    s32 var_r3_3;
    s32 var_r5;
    s32 var_r6;
    u16 var_r4;
    u32 var_r3;
    u8 *temp_r0_2;
    u8 *var_r1;
    u8 *var_r2;
    u8 temp_r0;
    u8 temp_r1;
    u8 var_r7;
    union MultiSioData *send_recv_r2;
    union MultiSioData *send_recv_r6;

    ModeSelect *modeSelect;

    var_r6 = 0;
    var_r7 = 0;
    modeSelect = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        for (var_r3 = 0; var_r3 < 4; var_r3++) {
            if (!GetBit(gMultiplayerConnections, var_r3)) {
                break;
            }

            if (!CheckBit(gMultiSioStatusFlags, var_r3)) {
                if (gMultiplayerMissingHeartbeats[var_r3]++ >= 0xB5) {
                    TasksDestroyAll();
                    PAUSE_BACKGROUNDS_QUEUE();
                    gBgSpritesCount = 0;
                    PAUSE_GRAPHICS_QUEUE();
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[var_r3] = 0;
            }
        }
    }

    send_recv_r2 = &gMultiSioRecv[0];
    if (send_recv_r2->pat0.unk0 == 0x12) {
        gGameMode = GAME_MODE_RACE;
        TaskDestroy(gCurTask);
        CreateMultipackOutcomeScreen(0U);
        return;
    }

    if (send_recv_r2->pat0.unk0 == 0x10) {
        gMultiSioEnabled = 0;
        MultiSioStop();
        MultiSioInit(0U);
        send_recv_r2 = &gMultiSioSend;
        send_recv_r2->pat0.unk0 = 0;
        m4aSongNumStop(3U);
        m4aSongNumStart(0x6BU);
        *gBgSprites_Unknown1 = 0;
        gBgSprites_Unknown2[0][0] = 0;
        gBgSprites_Unknown2[0][1] = 0;
        gBgSprites_Unknown2[0][2] = 0xFF;
        gBgSprites_Unknown2[0][3] = 0x20;
        TaskDestroy(gCurTask);
        CreateMultiplayerModeSelectScreen();
        return;
    } else {
        if (gMultiSioStatusFlags & 0x80) {
            if (B_BUTTON & gPressedKeys) {
                gMultiSioEnabled = 0;
                MultiSioStop();
                MultiSioInit(0U);
                send_recv_r2 = &gMultiSioSend;
                send_recv_r2->pat0.unk0 = 0;
                m4aSongNumStop(3U);
                m4aSongNumStart(0x6BU);
                *gBgSprites_Unknown1 = 0;
                gBgSprites_Unknown2[0][0] = 0;
                gBgSprites_Unknown2[0][1] = 0;
                gBgSprites_Unknown2[0][2] = 0xFF;
                gBgSprites_Unknown2[0][3] = 0x20;
                TaskDestroy(gCurTask);
                CreateMultiplayerModeSelectScreen();
                return;
            }

            if (modeSelect->unk219++ > 60) {
                TasksDestroyAll();
                PAUSE_BACKGROUNDS_QUEUE();
                gBgSpritesCount = 0;
                PAUSE_GRAPHICS_QUEUE();
                LinkCommunicationError();
                return;
            }
        }

        for (var_r5 = 0; var_r5 < 4; var_r5++) {
            send_recv_r2 = &gMultiSioRecv[var_r5];
            modeSelect->unk20B[0][var_r5] *= 2;
            if ((SIO_MULTI_CNT->id == var_r5) || (send_recv_r2->pat0.unk0 > 0x10U)) {
                var_r7 |= 1 << var_r5;
            }
            if (modeSelect->unk20B[0][var_r5] != 0) {
                var_r6 += 1;
            }
        }

        if (var_r6 == 0) {
            var_r6 = 1;
        }

        modeSelect->s[2].variant = var_r6 + 3;
        for (var_r5 = 0; var_r5 < 3; var_r5++) {
            s = &modeSelect->s[var_r5];
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }

        if (gMultiSioStatusFlags & 0x80) {
            send_recv_r6 = &gMultiSioSend;
            send_recv_r6->pat0.unk0 = 0x12;
            send_recv_r6->pat0.unk2 = var_r7;
            send_recv_r6->pat0.unk4 = LOADED_SAVE->unk4;
            DmaCopy32(3, &LOADED_SAVE->playerName[0], send_recv_r6->pat0.unk8, sizeof(LOADED_SAVE->playerName));

            for (var_r5 = 0, gMultiplayerConnections; var_r5 < 4; var_r5++) {
                if (!GetBit(gMultiplayerConnections, var_r5) || var_r5 == 0) {
                    continue;
                }

                if (!CheckBit(gMultiSioStatusFlags, var_r5) || (send_recv_r2 = &gMultiSioRecv[var_r5])->pat0.unk0 != 0x11) {
                    goto lbl;
                }
            }
            return;

        lbl:
            send_recv_r6->pat0.unk0 = 0x11;
        } else {
            send_recv_r6 = &gMultiSioSend;
            gMultiSioSend.pat0.unk0 = 0x11;
            gMultiSioSend.pat0.unk2 = var_r7;
            gMultiSioSend.pat0.unk4 = LOADED_SAVE->unk4;
            DmaCopy32(3, &LOADED_SAVE->playerName[0], send_recv_r6->pat0.unk8, sizeof(LOADED_SAVE->playerName));
        }
    }
}

void ModeSelect_InitSinglePak()
{
    Background *bg;
    Sprite *s;
    s32 i;
    ModeSelect *modeSelect;
    u8 *vram = OBJ_VRAM0;

    gBgSprites_Unknown1[0] = 0;
    gBgSprites_Unknown2[0][0] = 0;
    gBgSprites_Unknown2[0][1] = 0;
    gBgSprites_Unknown2[0][2] = -1;
    gBgSprites_Unknown2[0][3] = 0x20;
    gBgSprites_Unknown1[2] = 0;
    gBgSprites_Unknown2[2][0] = 0;
    gBgSprites_Unknown2[2][1] = 0;
    gBgSprites_Unknown2[2][2] = -1;
    gBgSprites_Unknown2[2][3] = 0x20;

    gDispCnt = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1;
    gBgCntRegs[0] = 0x1E03;

    modeSelect = TASK_DATA(gCurTask);
    modeSelect->unk207 = 0;
    s = &modeSelect->s[0];

    s->x = 120;
    s->y = 33;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB34C[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);
    vram += 0x540;

    s = &modeSelect->s[1];
    s->x = 101;
    s->y = 41;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = 0x378;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);
    vram += 0x460;

    s = &modeSelect->s[2];
    s->x = 120;
    s->y = 109;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MP_OUTCOME_MESSAGES_EN;
    s->variant = 4;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);
    vram += 0x80;

    s = &modeSelect->s4;
    s->x = 120;
    s->y = 125;
    s->graphics.dest = vram;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB350[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    bg = &modeSelect->bg;
    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (u16 *)(BG_VRAM + 0xF000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_MP_CONTINUE_SCREEN;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 0x1E;
    bg->targetTilesY = 0x14;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    gMultiSioEnabled = 0;
    m4aSongNumStart(MUS_VS_PLEASE_WAIT);

    gMultiBootParam.masterp = gMultiboot_087C0258;
    gMultiBootParam.server_type = 0;
    MultiBootInit(&gMultiBootParam);

    gCurTask->main = Task_SinglePak;

    if (*(u8 *)&REG_SIOCNT & 0x30) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
        return;
    }
}

// (93.89%) https://decomp.me/scratch/Canr3
NONMATCH("asm/non_matching/game/sa1/menus/mp_mode_select__Task_SinglePak.inc", void Task_SinglePak())
{
    s16 sp4;
    Sprite *temp_r4;
    Sprite *temp_r4_2;
    s16 temp_r0;
    s32 temp_r0_2;
    s32 var_r6;
    Background *bg;
    u8 *temp_r1_3;
    u8 temp_r2_2;
    u8 var_r5;
    void *temp_r1;
    void *temp_r1_2;
    ModeSelect *modeSelect;
    union MultiSioData *recv;
    union MultiSioData *send;
    union MultiSioData *send_recv;

    var_r6 = 1;
    modeSelect = TASK_DATA(gCurTask);
    modeSelect->qUnk208 -= 0x80;
    if (modeSelect->qUnk208 < 0) {
        modeSelect->qUnk208 = 0;
    }
    gBldRegs.bldY = (u16)((s32)((u16)modeSelect->qUnk208 << 0x10) >> 0x18);

    for (var_r5 = 1; var_r5 < 4; var_r5++) {
        if ((GetBit((s32)gMultiBootParam.response_bit, var_r5)) && GetBit((s32)gMultiBootParam.client_bit, var_r5)) {
            var_r6++;
        } else {
            break;
        }
    }

    modeSelect->s[2].variant = var_r6 + 3;
    for (var_r5 = 0; var_r5 < 3; var_r5++) {
        temp_r4 = &modeSelect->s[var_r5];
        UpdateSpriteAnimation(temp_r4);
        DisplaySprite(temp_r4);
    }

    if (0xE & gMultiBootParam.client_bit) {
        if ((gMultiBootParam.probe_count == 0) && (var_r6 > 1)) {
            temp_r4_2 = &modeSelect->s4;
            UpdateSpriteAnimation(temp_r4_2);
            DisplaySprite(temp_r4_2);
        }
        asm("");
    } else {
        modeSelect->unk207 = 0;
        gFlags &= 0xFFFFBFFF;
        gFlags &= 0xFFFF7FFF;
        m4aSoundVSyncOn();
    }

    if ((gMultiBootParam.probe_count == 0) && (gMultiBootParam.client_bit != 0) && (8 & gPressedKeys)) {
        modeSelect->unk207 = 1;
        gFlags |= FLAGS_8000;
        gFlags |= FLAGS_4000;
        m4aMPlayAllStop();
        gFlags &= ~4;
        m4aSoundVSyncOff();
        {
#ifndef NON_MATCHING
            vu16 *dma = (vu16 *)&REG_DMA0SAD;
            dma[5] &= 0xC5FF; /* REG_DMA0CNT_H */
            dma[5] &= 0x7FFF; /* REG_DMA0CNT_H */
            dma[5];

            dma += 6;
            dma[5] &= 0xC5FF; /* REG_DMA0CNT_H */
            dma[5] &= 0x7FFF; /* REG_DMA0CNT_H */
            dma[5];

            dma += 6;
            dma[5] &= 0xC5FF; /* REG_DMA2CNT_H */
            dma[5] &= 0x7FFF; /* REG_DMA2CNT_H */
            dma[5];

            dma += 6;
            dma[5] &= 0xC5FF; /* REG_DMA3CNT_H */
            dma[5] &= 0x7FFF; /* REG_DMA3CNT_H */
            dma[5];
#else
            REG_DMA0CNT_H &= 0xC5FF;
            REG_DMA0CNT_H &= 0x7FFF;
            REG_DMA1CNT_H &= 0xC5FF;
            REG_DMA1CNT_H &= 0x7FFF;
            REG_DMA2CNT_H &= 0xC5FF;
            REG_DMA2CNT_H &= 0x7FFF;
            REG_DMA3CNT_H &= 0xC5FF;
            REG_DMA3CNT_H &= 0x7FFF;
#endif
        }

        temp_r1_3 = &gMultiboot_087C0258[0xC0];
        MultiBootStartMaster(&gMultiBootParam, temp_r1_3, (uintptr_t)&gMultiboot_087C22F8 - (uintptr_t)temp_r1_3, 4U, 1);
    }
    if ((modeSelect->unk207 == 0) && (2 & gPressedKeys)) {
        TaskDestroy(gCurTask);
        CreateMultiplayerModeSelectScreen();
        return;
    }

    temp_r0_2 = MultiBootMain(&gMultiBootParam);
    if ((temp_r0_2 == 0x50) || (temp_r0_2 == 0x60) || (temp_r0_2 == 0x70) || (temp_r0_2 == 0x71)) {
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

    if (MultiBootCheckComplete(&gMultiBootParam) == 0) {
        return;
    }

    gDispCnt = 0x1341;
    gBgCntRegs[0] = 0x1E02;
    gBgCntRegs[1] = 0x1E03;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0x80;

    modeSelect = TASK_DATA(gCurTask);
    bg = &modeSelect->bg;
    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)(BG_VRAM + 0xF000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = TM_MP_SINGLEPAK_PROGRAM_IS_BEING_SENT;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 27;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    if (LOADED_SAVE->uiLanguage != 0) {
        gDispCnt |= 0x2000;
        gWinRegs[4] = 2;
        gWinRegs[5] = 1;
        gWinRegs[0] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[2] = WIN_RANGE(32, 88);
    } else {
        gDispCnt &= 0xDFFF;
        gWinRegs[4] = 0;
        gWinRegs[5] = 0;
    }
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    CpuFill16(0, &gBgPalette[32], 0x20);
    gCurTask->main = SA2_LABEL(sub_8081C50);

    send = &gMultiSioSend;
    send->pat2.unk0 = 0;

    recv = &gMultiSioRecv[0];
    recv[0].pat2.unk0 = 0;
    recv[1].pat2.unk0 = 0;
    recv[2].pat2.unk0 = 0;
    recv[3].pat2.unk0 = 0;

    send_recv = recv;
    send_recv += 3;

    send->pat0.unk2 = 0;
    send->pat0.unk0 = 0xF001;

    recv = &gMultiSioRecv[0];
    recv[0].pat0.unk2 = 0;
    recv[1].pat0.unk2 = 0;
    recv[2].pat0.unk2 = 0;
    recv[3].pat0.unk2 = 0;
    modeSelect->unk204 = 0;
}
END_NONMATCH
