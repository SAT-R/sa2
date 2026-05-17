#include "global.h"
#include "core.h"
#include "flags.h"
#include "bg_triangles.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/globals.h"
#include "game/sa1/save.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"
#include "constants/sa1/tilemaps.h"

#define CM_BACKGROUND_COLOR RGB16_REV(0, 27, 30)

typedef struct {
    /* 0x00 */ Background bg;
    /* 0x40 */ u8 unk40[2][4];
    /* 0x48 */ s16 unk48[4];
    /* 0x48 */ s16 unk50;
    /* 0x48 */ u16 unk52;
    /* 0x54 */ u8 unk54;
    /* 0x55 */ u8 mode;
    /* 0x56 */ u8 unk56;
} ChaoMessage; /* 0x58 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s16 unk30;
    /* 0x32 */ s16 unk32;
    /* 0x34 */ u8 unk34;
} ChaoMsgSprite; /* 0x38 */

typedef struct {
    GameOverB overBs[4];
    s16 unk60;
    s16 unk62;
    void *vram64;
} ChaoMsg68;

extern u8 gUnknown_03005008[MULTI_SIO_PLAYERS_MAX];

static u8 gUnknown_030058A8[6][2];
static u8 gUnknown_030058B4;
static u8 gUnknown_030058B8[4];

void sub_803AB60(ChaoMessage *message);
void Task_ChaoMessageInit(void);
void Task_803C130(void);
void Task_803B7AC(void);
void sub_803B944(void);
void sub_803BAD4(void);
void sub_803BC64(void);
void sub_803BE0C(void);
void sub_803BEB8(void);
void sub_803BFE8(void);
void TaskDestructor_803C184(struct Task *t);
void TaskDestructor_803C198(struct Task *t);

extern void sub_8018538(void);
extern void CreateMultiplayerContinueScreen(void);

void CreateMultiplayerResultsScreen(u8 mode)
{
    s32 sp4;
    Background *bg;
    ChaoMessage *message;
    u8 *temp_r0;
    u8 temp_r0_2;
    u8 temp_r0_3;
    u8 var_r2;

    gUnknown_030058B8[0] = 0;
    gUnknown_030058B8[1] = 0;
    gUnknown_030058B8[2] = 0;
    gUnknown_030058B8[3] = 0;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    gUnknown_030058B4 = 0;

    for (var_r2 = 0; var_r2 < 4; var_r2++) {
        if (GetBit(gMultiplayerConnections, var_r2)) {
            gUnknown_030058B4 += 1;
        }
    };

    message = TASK_DATA(TaskCreate(Task_ChaoMessageInit, sizeof(ChaoMessage), 0x2000U, 0U, NULL));
    bg = &message->bg;
    message->mode = mode;
    message->unk54 = gUnknown_030058B4;
    sub_803AB60(message);
    message->unk48[0] = 0xFF10;
    message->unk48[1] = 0xF0;
    message->unk48[2] = 0xFF10;
    message->unk48[3] = 0xF0;
    gDispCnt = 0x3140;
    gBgCntRegs[0] = (DISPCNT_WIN1_ON) | DISPCNT_BG3_ON | DISPCNT_MODE_3;
    gBgScrollRegs[0][0] = 256;
    gBgScrollRegs[0][1] = 0;

    gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
    gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
    gWinRegs[WINREG_WININ] = 0x31;
    gWinRegs[WINREG_WINOUT] = 0x31;
    gBldRegs.bldCnt = 0xBF;
    gBldRegs.bldY = 0x10;

    DmaFill32(3, 0, BG_VRAM + 0x1FE0, 0x40);

    gBgSprites_Unknown1[0] = 0xFF;
    gBgSprites_Unknown2[0][0] = 0;
    gBgSprites_Unknown2[0][1] = 0;
    gBgSprites_Unknown2[0][2] = -1;
    gBgSprites_Unknown2[0][3] = 0x40;

    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0xFF;
    bg->layoutVram = (u16 *)(BG_VRAM + 0x4000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = 0x58;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    *gBgPalette = CM_BACKGROUND_COLOR;
    gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;

    switch (message->mode) {
        case 0:
            m4aSongNumStart(MUS_006);
            break;
        case 1:
            temp_r0_3 = message->unk56;
            if (temp_r0_3 == 0) {
                m4aSongNumStart(MUS_007);
            } else if (temp_r0_3 == 1) {
                m4aSongNumStart(MUS_008);
            } else {
                m4aSongNumStart(MUS_009);
            }
            break;
        case 2:
            m4aSongNumStart(SE_VS_MULTIPAK_CONN_CLOSE);
            break;
    }
}

// (99.02%) https://decomp.me/scratch/HVYh9
NONMATCH("asm/non_matching/game/sa1/multiplayer/chao_message__sub_803AB60.inc", void sub_803AB60(ChaoMessage *message))
{
    u8 sp0;
    u8 sp4;
    s16 var_r0;
    s32 var_r3;
    u8 var_r2_3;
    u8 i;
    u8 var_r6;

    switch (message->unk54) {
        case 2:
            message->unk50 = 0x28;
            break;
        case 3:
            message->unk50 = 0x14;
            break;
        default:
        case 0:
        case 1:
        case 4:
            message->unk50 = 0;
            break;
    }

    switch (message->mode) {
        case 0:
            sp0 = 0;
            sp4 = 0;
            for (i = 0; i < message->unk54; i++) {
                u32 unk5008 = gUnknown_03005008[i];
                if (i != (SIO_MULTI_CNT->id)) {
                    if (unk5008 < 10) {
                        gUnknown_030058A8[i][0] = LOADED_SAVE->multiplayerScores[unk5008].data.split.wins;
                        gUnknown_030058A8[i][1] = LOADED_SAVE->multiplayerScores[unk5008].data.split.losses;
                    } else {
                        gUnknown_030058A8[i][0] = 0;
                        gUnknown_030058A8[i][1] = 0;
                    }

                    if (gUnknown_030058A8[i][0] > gUnknown_030058A8[i][1]) {
                        message->unk40[1][i] = 6;
                        message->unk40[0][i] = 6;
                        sp0++;
                    } else if (gUnknown_030058A8[i][0] < gUnknown_030058A8[i][1]) {
                        message->unk40[1][i] = 1;
                        message->unk40[0][i] = 1;
                        sp4++;
                    } else {
                        message->unk40[1][i] = 0;
                        message->unk40[0][i] = 0;
                    }
                }
            }

            if (sp0 > sp4) {
                message->unk40[1][SIO_MULTI_CNT->id] = 1;
                message->unk40[0][SIO_MULTI_CNT->id] = 1;
            } else if (sp0 < sp4) {
                message->unk40[1][SIO_MULTI_CNT->id] = 6;
                message->unk40[0][SIO_MULTI_CNT->id] = 6;
            } else {
                message->unk40[1][SIO_MULTI_CNT->id] = 0;
                message->unk40[0][SIO_MULTI_CNT->id] = 0;
            }
            break;
        case 1:
            if ((gUnknown_030058B4 == 2) || (gGameMode == 3) || (gGameMode == 5)) {
                for (i = 0; i < message->unk54; i++) {
                    switch (gMultiplayerRanks[i]) {
                        case 0:
                            message->unk40[1][i] = 2;
                            message->unk40[0][i] = 2;
                            if (i == (SIO_MULTI_CNT->id)) {

                            } else if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                                if ((gGameMode != 3) && (gGameMode != 5)) {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                                    }
                                }
                            } else {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses = 99;
                                }
                            }
                            break;
                        default:
                        case 1:
                            message->unk40[1][i] = 3;
                            message->unk40[0][i] = 3;
                            if (i != (SIO_MULTI_CNT->id)) {
                                if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins = 99;
                                    }
                                } else if ((gGameMode != 3) && (gGameMode != 5)) {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                                    }
                                }
                            }
                            break;
                        case 4:
                            message->unk40[1][i] = 4;
                            message->unk40[0][i] = 4;
                            if ((i != (SIO_MULTI_CNT->id))
                                && (((gGameMode != 3) && (gGameMode != 5))
                                    || (((s32)(gMultiplayerConnections & (0x10 << i)) >> (i + 4))
                                        != ((s32)(gMultiplayerConnections & (0x10 << (SIO_MULTI_CNT->id)))
                                            >> ((SIO_MULTI_CNT->id) + 4))))) {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                                }
                            }
                            break;
                    }
                }

                if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                    message->unk56 = 0;
                    if (++LOADED_SAVE->unk425 > 99) {
                        LOADED_SAVE->unk425 = 99;
                    }
                } else {
                    if ((gMultiplayerRanks[SIO_MULTI_CNT->id] == 4)) {
                        message->unk56 = 2;
                        if (++LOADED_SAVE->unk427 > 99) {
                            LOADED_SAVE->unk427 = 99;
                        }
                    } else {
                        message->unk56 = 1;
                        if (++LOADED_SAVE->unk426 > 99) {
                            LOADED_SAVE->unk426 = 99;
                        }
                    }
                }
            } else if (gGameMode == 4) {
                for (i = 0, var_r2_3 = 0; i < message->unk54; i++) {
                    if (gMultiplayerRanks[i] == 0) {
                        var_r2_3 += 1;
                    }
                }
                if (var_r2_3 == 1) {
                    for (i = 0; i < message->unk54; i++) {
                        if (gMultiplayerRanks[i] == 0) {
                            message->unk40[1][i] = 2;
                            message->unk40[0][i] = 2;

                            if (i != (SIO_MULTI_CNT->id)) {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses = 99;
                                }
                            }
                        } else {
                            message->unk40[1][i] = 3;
                            message->unk40[0][i] = 3;

                            if ((i != (SIO_MULTI_CNT->id)) && (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0)) {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins = 99;
                                }
                            }
                        }
                    }

                    if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                        message->unk56 = 0;
                        if (++LOADED_SAVE->unk425 > 99) {
                            LOADED_SAVE->unk425 = 99;
                        }
                    } else {
                        message->unk56 = 1;
                        if (++LOADED_SAVE->unk426 > 99) {
                            LOADED_SAVE->unk426 = 99;
                        }
                    }
                } else if (var_r2_3 == 0) {
                    for (i = 0; i < message->unk54; i++) {
                        message->unk40[1][i] = 4;
                        message->unk40[0][i] = 4;

                        if (i != (SIO_MULTI_CNT->id)) {
                            ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                            if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                            }
                        }
                    }
                    message->unk56 = 2;
                    if (++LOADED_SAVE->unk427 > 99) {
                        LOADED_SAVE->unk427 = 99;
                    }
                } else {
                    for (i = 0; i < message->unk54; i++) {
                        if (gMultiplayerRanks[i] == 0) {
                            message->unk40[1][i] = 4;
                            message->unk40[0][i] = 4;
                            if (i != (SIO_MULTI_CNT->id)) {
                                if (gMultiplayerRanks[SIO_MULTI_CNT->id] != 0) {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses = 99;
                                    }
                                } else {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                                    }
                                }
                            }
                        } else {
                            message->unk40[1][i] = 3;
                            message->unk40[0][i] = 3;
                            if (i != (SIO_MULTI_CNT->id)) {
                                if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins = 99;
                                    }
                                } else {
                                    ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                                    if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                        LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                                    }
                                }
                            }
                        }
                    }

                    if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                        message->unk56 = 2;
                        if (++LOADED_SAVE->unk427 > 99) {
                            LOADED_SAVE->unk427 = 99;
                        }
                    } else {
                        message->unk56 = 1;
                        if (++LOADED_SAVE->unk426 > 99) {
                            LOADED_SAVE->unk426 = 99;
                        }
                    }
                }
            } else {
                for (var_r6 = 0, i = 0; i < message->unk54; i++) {
                    if (gMultiplayerRanks[i] == 4) {
                        var_r6++;
                    }
                }

                if (var_r6 == message->unk54) {
                    for (i = 0; i < message->unk54; i++) {
                        message->unk40[1][i] = 4;
                        message->unk40[0][i] = 4;
                    }
                } else {
                    for (i = 0; i < message->unk54; i++) {
                        switch (gMultiplayerRanks[i]) {
                            case 0:
                                message->unk40[1][i] = 7;
                                message->unk40[0][i] = 2;
                                break;
                            case 1:
                                message->unk40[1][i] = 8;
                                message->unk40[0][i] = 4;
                                break;
                            case 2:
                                message->unk40[1][i] = 9;
                                if (message->unk54 == 3) {
                                    message->unk40[0][i] = 3;
                                } else {
                                    message->unk40[0][i] = 4;
                                }
                                break;
                            case 3:
                                message->unk40[1][i] = 10;
                                message->unk40[0][i] = 3;
                                break;
                            case 4:
                                message->unk40[1][i] = 3;
                                message->unk40[0][i] = 3;
                                break;
                            case 5:
                                message->unk40[1][i] = 3;
                                message->unk40[0][i] = 3;
                                break;
                        }

                        if (i != SIO_MULTI_CNT->id) {
                            if (gMultiplayerRanks[SIO_MULTI_CNT->id] < gMultiplayerRanks[i]) {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.wins = 99;
                                }
                            } else if (gMultiplayerRanks[SIO_MULTI_CNT->id] == gMultiplayerRanks[i]) {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.draws = 99;
                                }

                            } else {
                                ++LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses;
                                if (LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses > 99) {
                                    LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.losses = 99;
                                }
                            }
                        }
                    }
                }
                if (gMultiplayerRanks[SIO_MULTI_CNT->id] == 0) {
                    message->unk56 = 0;
                    ++LOADED_SAVE->unk425;
                    if (LOADED_SAVE->unk425 > 99) {
                        LOADED_SAVE->unk425 = 99;
                    }
                } else if ((gMultiplayerRanks[SIO_MULTI_CNT->id] != 4) || (var_r6 != message->unk54)) {
                    message->unk56 = 1;
                    ++LOADED_SAVE->unk426;
                    if (LOADED_SAVE->unk426 > 99) {
                        LOADED_SAVE->unk426 = 99;
                    }
                } else {
                    message->unk56 = 2;
                    ++LOADED_SAVE->unk427;
                    if (LOADED_SAVE->unk427 > 99) {
                        LOADED_SAVE->unk427 = 99;
                    }
                }
            }
            break;
        case 2:
            for (i = 0; i < message->unk54; i++) {
                message->unk40[1][i] = 5;
                message->unk40[0][i] = 5;
            }
            break;
    }
}
END_NONMATCH

void Task_ChaoMessageInit(void)
{
    u8 i;
    Sprite *s;

    ChaoMessage *message;
    ChaoMsgSprite *msgSprite;

    LINK_HEARTBEAT();

    message = TASK_DATA(gCurTask);
    for (i = 0; i < message->unk54; i++) {
        msgSprite = TASK_DATA(TaskCreate(Task_803C130, sizeof(ChaoMsgSprite), 0x2100U, 0U, TaskDestructor_803C184));
        msgSprite->unk30 = 0x2D;
        msgSprite->unk32 = (i * 0x28 + 2);
        msgSprite->unk34 = i;

        s = &msgSprite->s;
        s->graphics.dest = VramMalloc(40);
        s->graphics.anim = SA1_ANIM_MP_CHAO_AVATAR;
        s->variant = message->unk40[0][i];
        s->oamFlags = SPRITE_OAM_ORDER(16);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x3000;

        msgSprite = TASK_DATA(TaskCreate(Task_803C130, sizeof(ChaoMsgSprite), 0x2100U, 0U, TaskDestructor_803C184));
        msgSprite->unk30 = 0xA9;
        msgSprite->unk32 = (i * 0x28 + 0x14);
        msgSprite->unk34 = i;

        s = &msgSprite->s;
        s->graphics.dest = VramMalloc(26);
        if (LOADED_SAVE->uiLanguage == UILANG_JAPANESE) {
            s->graphics.anim = SA1_ANIM_MP_PLAYER_MSG_JP;
        } else {
            s->graphics.anim = SA1_ANIM_MP_PLAYER_MSG_EN;
        }
        s->variant = message->unk40[1][i];
        s->oamFlags = SPRITE_OAM_ORDER(16);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x3000;
    }
    sub_80535FC();
    sub_803BEB8();
    message->unk52 = 0;
    gCurTask->main = Task_803B7AC;
    Task_803B7AC();
}

void Task_803B7AC()
{
    ChaoMessage *message;
    u8 var_r6 = 0;

    LINK_HEARTBEAT();

    message = TASK_DATA(gCurTask);
    message->unk52++;

    switch (message->unk54) {
        case 0:
            break;
        case 4:
            if (message->unk52 >= 0x10) {
                if (message->unk48[3] != 0) {
                    message->unk48[3] -= 0x10;
                } else {
                    var_r6++;
                }
            }
            /* fallthrough */
        case 3:
            if (message->unk52 > 0xAU) {
                if (message->unk48[2] != 0) {
                    message->unk48[2] += 0x10;
                } else {
                    var_r6++;
                }
            }
            /* fallthrough */
        case 2:
            if (message->unk52 > 5U) {
                if (message->unk48[1] != 0) {
                    message->unk48[1] = (u16)message->unk48[1] - 0x10;
                } else {
                    var_r6++;
                }
            }
            if (message->unk52 != 0) {
                if (message->unk48[0] != 0) {
                    message->unk48[0] += 0x10;
                } else {
                    var_r6++;
                }
            }
            break;
    }
    if (var_r6 == message->unk54) {
        gCurTask->main = sub_803B944;
    }
    if (gBldRegs.bldY != 0) {
        gBldRegs.bldY -= 1;
    }
    sub_803BE0C();
}

void sub_803B944()
{
    ChaoMessage *message;
    u8 var_r6 = 0;
    u32 i;

    LINK_HEARTBEAT();

    message = TASK_DATA(gCurTask);

    if (message->mode != 1) {
        if (++message->unk52 >= 240) {
            gCurTask->main = sub_803BAD4;
            message->unk52 = 0;
        }

        if (message->unk52 == 0x2D) {
            if (message->mode == 0) {
                m4aSongNumStart(SE_156);
            } else {
                m4aSongNumStart(SE_160);
            }
        }
    } else {
        ++message->unk52;

        for (i = 0; i < 4; i++) {
            if (gMultiSioRecv[i].pat0.unk0 == 0xB0) {
                var_r6 = 1;
            }
        }

        if ((A_BUTTON & gPressedKeys) || (message->unk52 > 0x707U) || (var_r6 != 0)) {
            gCurTask->main = sub_803BAD4;
            message->unk52 = 0;
            if (var_r6 == 0) {
                gMultiSioSend.pat0.unk0 = 0xB0;
            }
        }

        if (message->unk52 == 0x2D) {
            if (message->unk56 == 0) {
                m4aSongNumStart(SE_157);
            } else if (message->unk56 == 1) {
                m4aSongNumStart(SE_158);
            } else {
                m4aSongNumStart(SE_159);
            }
        }
    }
    sub_803BE0C();
}

void sub_803BAD4()
{
    ChaoMessage *message;
    u8 var_r6 = 0;

    LINK_HEARTBEAT();

    message = TASK_DATA(gCurTask);
    message->unk52++;

    switch (message->unk54) {
        case 0:
            break;
        case 4:
            if (message->unk52 != 0) {
                if (message->unk48[3] != 240) {
                    message->unk48[3] += 0x10;
                } else {
                    var_r6++;
                }
            }
            /* fallthrough */
        case 3:
            if (message->unk52 > 5) {
                if (message->unk48[2] != -240) {
                    message->unk48[2] -= 0x10;
                } else {
                    var_r6++;
                }
            }
            /* fallthrough */
        case 2:
            if (message->unk52 > 10) {
                if (message->unk48[1] != 240) {
                    message->unk48[1] = (u16)message->unk48[1] + 0x10;
                } else {
                    var_r6++;
                }
            }
            if (message->unk52 >= 0x10) {
                if (message->unk48[0] != -240) {
                    message->unk48[0] -= 0x10;
                } else {
                    var_r6++;
                }
            }
            break;
    }
    if (var_r6 == message->unk54) {
        gCurTask->main = sub_803BC64;
    }
    sub_803BE0C();
}

void sub_803BC64()
{
    ChaoMessage *message = TASK_DATA(gCurTask);
    u32 mode;

    if ((0x1F & gBldRegs.bldY) < 0x10) {
        gBldRegs.bldY += 1;
        sub_803BE0C();
        return;
    }

    mode = message->mode;

    TasksDestroyAll();
    PAUSE_BACKGROUNDS_QUEUE();
    gBgSpritesCount = 0;
    PAUSE_GRAPHICS_QUEUE();

    if (mode == 0) {
        sub_8018538();
    } else if (message->mode == 1) {
        {
            u16 irqEnable, irqMasterEnable, dispStat;

            m4aMPlayAllStop();
            m4aSoundVSyncOff();

            gFlags |= FLAGS_8000;
            irqEnable = REG_IE;
            irqMasterEnable = REG_IME;
            dispStat = REG_DISPSTAT;

            REG_IE = 0;
            REG_IE;
            REG_IME = 0;
            REG_IME;
            REG_DISPSTAT = 0;
            REG_DISPSTAT;

            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

            SlowDmaStop(0);
            SlowDmaStop(1);
            SlowDmaStop(2);
            SlowDmaStop(3);

            WriteSaveGame();

            REG_IE = irqEnable;
            REG_IE;
            REG_IME = irqMasterEnable;
            REG_IME;
            REG_DISPSTAT = dispStat;
            REG_DISPSTAT;

            m4aSoundVSyncOn();

            gFlags &= ~FLAGS_8000;
        }

        CreateMultiplayerContinueScreen();
    } else {
        gMultiSioEnabled = 0;
        MultiSioStop();
        MultiSioInit(0);
        CreateTitleScreen(TITLESCREEN_PARAM__PLAY_MUSIC);
    }

    gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
}

void sub_803BE0C()
{
    s16 var_r4;
    u32 var_r6;

    ChaoMessage *message = TASK_DATA(gCurTask);

    var_r4 = message->unk50;
    if (message->unk50 != 0) {
        SA2_LABEL(sub_80078D4)(0U, 0U, var_r4, DISPLAY_WIDTH, 0U);
    }

    for (var_r6 = 0; var_r6 < message->unk54; var_r6++) {
        u32 mask = 0x1FF;
#ifndef NON_MATCHING
        SA2_LABEL(sub_80078D4)(0U, var_r4, var_r4 += 0x28, ~message->unk48[var_r6] & mask, (-message->unk50));
#else
        SA2_LABEL(sub_80078D4)(0U, var_r4, var_r4 + 0x28, ~message->unk48[var_r6] & mask, (-message->unk50));
        var_r4 += 0x28;
#endif
    }

    if (var_r4 < DISPLAY_HEIGHT) {
        SA2_LABEL(sub_80078D4)(0U, var_r4, DISPLAY_HEIGHT, DISPLAY_WIDTH, 0U);
    }
}

void sub_803BEB8(void)
{
    Strc_80528AC gfx;
    ChaoMsg68 *strc68;
    u8 i;

    strc68 = TASK_DATA(TaskCreate(sub_803BFE8, sizeof(ChaoMsg68), 0x2200U, 0U, TaskDestructor_803C198));
    gfx.uiGfxID = 0;
    gfx.unk2B = 1;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[TM_SPECIAL_STAGE_BG_FRAME_5].palette;
    gfx.vramC = VramMalloc(0xE0U);
    gfx.tilesSize = 0x1C00;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 1;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    strc68->vram64 = gfx.vramC;
    strc68->unk60 = 0xA;
    strc68->unk62 = 0x14;

    for (i = 0; i < 4; i++) {
        GameOverB *temp_r0 = &strc68->overBs[i];
        temp_r0->qUnkA = 0xA;
        temp_r0->unkC = 0x14;
        temp_r0->unkE = 1;
        temp_r0->unk10 = 1;
        temp_r0->unk12 = 1;
        temp_r0->unk16 = 1;
        temp_r0->unk8 = 0;
    }
}

void sub_803BFE8()
{
    ChaoMsg68 *strc68 = TASK_DATA(gCurTask);
    ChaoMessage *parent = TASK_DATA(TASK_PARENT(gCurTask));
    u8 charIndex;
    u8 i;

    for (i = 0; i < parent->unk54; i++) {
        for (charIndex = 0; charIndex < 6; charIndex++) {
            GameOverB *overB = &strc68->overBs[i];
            overB->qUnkA = parent->unk48[i] + strc68->unk60 + (charIndex * 8);
            overB->unkC = parent->unk50 + (i * 40) + strc68->unk62;

            if (SIO_MULTI_CNT->id == i) {
                if ((u8)(LOADED_SAVE->playerName[charIndex] - 0x70) < 26) {
                    overB->unkC += 8;
                }
                sub_8052F78((const char *)&LOADED_SAVE->playerName[charIndex], overB);
            } else {
                if ((u8)(LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.playerName[charIndex] - 0x70) < 26) {
                    overB->unkC += 8;
                }
                sub_8052F78((const char *)&LOADED_SAVE->multiplayerScores[gUnknown_03005008[i]].data.split.playerName[charIndex], overB);
            }
        }
    }
}

void Task_803C130(void)
{
    ChaoMsgSprite *msgSprite = TASK_DATA(gCurTask);
    Sprite *s = &msgSprite->s;

    ChaoMessage *message = TASK_DATA(TASK_PARENT(gCurTask));
    s->x = msgSprite->unk30 + message->unk48[msgSprite->unk34];
    s->y = msgSprite->unk32 + message->unk50;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_803C184(struct Task *t)
{
    ChaoMsgSprite *msgSprite = TASK_DATA(t);
    VramFree(msgSprite->s.graphics.dest);
}

void TaskDestructor_803C198(struct Task *t)
{
    ChaoMsg68 *strc68 = TASK_DATA(t);
    VramFree(strc68->vram64);
}
