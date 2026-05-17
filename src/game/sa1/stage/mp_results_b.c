#include "global.h"
#include "core.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/character_select.h"
#include "game/sa1/ui/course_select.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/globals.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"

typedef struct {
    /* 0x00 */ Background bg;
    /* 0x40 */ Background bg2;
    /* 0x80 */ Sprite s;
    /* 0xB0 */ Sprite s2;
    /* 0xE0 */ Sprite s3[3];
    /* 0xE0 */ Sprite s6[3];
    /* 0x200 */ Sprite spr200;
    /* 0x230 */ s32 unk230;
    /* 0x234 */ u16 unk234;
    /* 0x236 */ s16 unk236;
    /* 0x238 */ u16 unk238;
    /* 0x23A */ u16 unk23A;
    /* 0x23C */ s16 unk23C;
    /* 0x23E */ s16 unk23E;
    /* 0x240 */ u16 unk240;
    /* 0x240 */ u16 unk242;
    /* 0x240 */ u16 unk244;
    /* 0x246 */ u8 unk246;
    /* 0x247 */ u8 unk247;
} MPResultsB; /* 0x248 */

void Task_8018ECC(void);
void Task_8019348(void);
void Task_80196FC(void);

extern void sub_8062F90(void);

const u8 gUnknown_080BB484[4] = { 53, 77, 101, 125 };

void sub_8018AE0()
{
    void *sp4;
    Background *bg;
    Sprite *s;
    void *temp_r0;

    MPResultsB *strc;

    sp4 = (void *)OBJ_VRAM0;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x1E03;
    gBgCntRegs[1] = 0x1F06;
    strc = TASK_DATA(TaskCreate(Task_8018ECC, sizeof(MPResultsB), 0x2000U, 0U, NULL));
    bg = &strc->bg;
    strc->unk234 = 0;
    strc->unk236 = 0;
    strc->unk238 = 0;
    strc->unk247 = 0;
    strc->unk246 = 1;
    strc->unk230 = 0;
    strc->unk23A = 0;
    strc->unk23C = 0;
    strc->unk23E = 0;
    strc->unk240 = 0;

    s = &strc->s;
    s->x = 0;
    s->y = 0x19;
    s->graphics.dest = sp4;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->graphics.anim = 894;
    strc->s.variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    strc->s.prevVariant = 0xFF;
    strc->s.animSpeed = 0x10;
    strc->s.palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    sp4 += 0x340;
    s = &strc->s2;
    s->x = 0;
    s->y = 0xE;
    s->graphics.dest = sp4;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 860;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    sp4 += 0x180;
    s = &strc->s3[0];
    s->x = 0x35;
    s->y = 0x58;
    s->graphics.dest = sp4;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MP_OUTCOME_MESSAGES_EN;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    sp4 += 0x180;
    s = &strc->s3[1];
    s->x = 0xB7;
    s->y = 0x58;
    s->graphics.dest = sp4;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_MP_OUTCOME_MESSAGES_EN;
    s->variant = 3;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    sp4 += 0x100;
    s = &strc->s3[2];
    s->x = 25;
    s->y = 73;
    s->graphics.dest = sp4;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 858;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    sp4 += 0x380;
    s = &strc->spr200;
    s->x = 120;
    s->y = 80;
    s->graphics.dest = sp4;
    s->oamFlags = 0x80;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_VS_MENU_WAIT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (u16 *)(BG_VRAM + 0xF000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = 81;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    bg = &strc->bg2;
    bg->graphics.dest = (void *)(BG_VRAM + 0x4000);
    bg->graphics.anim = 0;
    bg->layoutVram = (void *)(BG_VRAM + 0xF800);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = 82;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 32;
    bg->targetTilesY = 32;
    bg->paletteOffset = 0;
    bg->flags = 1;
    DrawBackground(bg);

    m4aSongNumStartOrChange(3U);

    gRepeatedKeys = 0;
    gPressedKeys = 0;
    gInput = 0;
    gWinRegs[5] = 0x3F;
    gBldRegs.bldCnt = 0x3F46;
    gBldRegs.bldAlpha = 0xA10;
    gWinRegs[2] = 0xA0;
}

// (97.44%) https://decomp.me/scratch/nj1HT
NONMATCH("asm/non_matching/game/sa1/stage/results_b__Task_8018ECC.inc", void Task_8018ECC(void))
{
    Sprite *s;
    s32 temp_r1_5;
    s32 temp_r3_3;
    s32 var_r1;
    s32 var_r3_2;
    s32 var_r4;
    s32 i;
    u16 *temp_r1_2;
    u16 *temp_r4_4;
    u16 temp_r0_2;
    u32 var_r3;
    s16 var_r4_2;
    u8 *var_r2;
    u8 temp_r0;
    u8 temp_r4;
    u8 var_r0;
    u8 var_r0_2;
    u16 recvData;
    union MultiSioData *send_recv;

    MPResultsB *strc = TASK_DATA(gCurTask);

    strc->unk234++;
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

    recvData = gMultiSioRecv->pat0.unk0;
    if (recvData == 0x34) {
        if (strc->unk246 != gMultiSioRecv->pat0.unk2) {
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);
            if (!(gMultiSioStatusFlags & 0x80)) {
                strc->unk246 = gMultiSioRecv->pat0.unk2;
            }
        }
    } else if (recvData == 0x35) {
        var_r3_2 = 1;
        if (gMultiSioStatusFlags & 0x80) {
            for (i = 1; i < 4; i++) {
                if (!GetBit(gMultiplayerConnections, i)) {
                    break;
                }

                send_recv = &gMultiSioRecv[i];
                if (send_recv->pat0.unk0 < 0x35) {
                    var_r3_2 = 0;
                }
            }
        } else {
            gMultiSioSend.pat0.unk0 = recvData;
        }
        if (var_r3_2 != 0) {
            if (strc->unk246 != gMultiSioRecv->pat0.unk2) {
                m4aSongNumStart(SE_MENU_CURSOR_MOVE);
                strc->unk246 = gMultiSioRecv->pat0.unk2;
            }
            m4aSongNumStart(SE_SELECT);
            if (strc->unk246 == 0) {
                if (gGameMode == 2) {
                    gGameMode = 3;
                } else {
                    gGameMode = 5;
                }
                gCurTask->main = Task_8019348;
                return;
            }
            var_r0_2 = gGameMode;
            if (gGameMode != 2) {
                var_r0_2 = 4;
            }
            gGameMode = var_r0_2;
            TaskDestroy(gCurTask);

            if (gGameMode == GAME_MODE_RACE) {
                CreateCourseSelect(0U);
            } else {
                sub_8062F90();
            }
            return;
        }
    } else if (recvData > 0x35U) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();
        LinkCommunicationError();
        return;
    }

    if (gMultiSioStatusFlags & 0x80) {
        var_r4 = 1;
        send_recv = &gMultiSioSend;
        send_recv->pat0.unk0 = 0x34;
        if (strc->unk247 == 0) {
            if (0x10 & gInput) {
                strc->unk246 = 1;
            } else if (0x20 & gInput) {
                strc->unk246 = 0;
            }
        }
        send_recv->pat0.unk2 = strc->unk246;

        for (i = 1; i < 4; i++) {
            if (!GetBit(gMultiplayerConnections, i)) {
                break;
            }

            if (gMultiSioRecv[i].pat0.unk0 < 0x34) {
                var_r4 = 0;
            }
        }
        if (((var_r4 != 0) && (1 & gPressedKeys)) || (strc->unk247 != 0)) {
            gMultiSioSend.pat0.unk0 = 0x35;
            gMultiSioSend.pat0.unk2 = strc->unk246;
            strc->unk247 = 1;
        }
    } else {
        gMultiSioSend.pat0.unk0 = 0x34;
        s = &strc->spr200;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &strc->s3[2];
    s->x = (strc->unk246 * 0x83) + 0x19;
    strc->unk236 += 0x10;
    if (strc->unk236 > 0x400) {
        strc->unk236 = 0x400;
    }
    if (strc->unk246 == 0) {
        strc->unk238 = (strc->unk238 + 1) & 0x3FF;
    } else {
        strc->unk238 = (strc->unk238 - 1) & 0x3FF;
    }

    strc->unk23A = (strc->unk236 * COS_24_8(strc->unk238)) >> 8;
    strc->unk23C = (strc->unk236 * SIN_24_8(strc->unk238)) >> 8;
    strc->unk23E += strc->unk23A;
    strc->unk240 += strc->unk23C;

    gBgScrollRegs[1][0] = (s16)((s32)((u16)strc->unk23E << 0x10) >> 0x18);
    gBgScrollRegs[1][1] = (s16)((s32)(strc->unk240 << 0x10) >> 0x18);
    strc->unk230 += 0x80;
    if (strc->unk230 > Q(136)) {
        strc->unk230 -= Q(136);
    }

    s = &strc->s;
    var_r4_2 = I(-strc->unk230);
    while (var_r4_2 < DISPLAY_WIDTH) {
        s->x = (s16)var_r4_2;
        var_r4_2 += 136;
        DisplaySprite(s);
    }

    for (i = 0; i < 3; i++) {
        s = &strc->s3[i];
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &strc->s2;
    for (i = 0; i < 8; i++) {
        s->x = i * 32;
        DisplaySprite(s);
    }
}
END_NONMATCH

void Task_8019348(void)
{
    Sprite *s;
    u8 *vram = (u8 *)OBJ_VRAM0;

    MPResultsB *strc = TASK_DATA(gCurTask);

    strc->unk246 = 1 & SIO_MULTI_CNT->id;
    strc->unk247 = 0;
    s = &strc->s;
    s->x = 0;
    s->y = 25;
    s->graphics.dest = vram;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = 0x37E;
    strc->s.variant = 3;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    strc->s.prevVariant = 0xFF;
    strc->s.animSpeed = 0x10;
    strc->s.palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x400;

    s = &strc->s2;
    s->x = 0;
    s->y = 0xE;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x35C;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x180;

    s = &strc->s3[0];
    s->x = 0x2B;
    s->y = 0x3D;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x37E;
    s->variant = 5;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x100;

    s = &strc->s3[1];
    s->x = 0x2B;
    s->y = 0x55;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x37E;
    s->variant = 6;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x100;

    s = &strc->s3[2];
    s->x = 43;
    s->y = 109;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x37E;
    s->variant = 7;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x100;

    s = &strc->s6[0];
    s->x = 0x2B;
    s->y = 0x85;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x37E;
    s->variant = 8;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x100;

    s = &strc->s6[1];
    s->x = 0x4B;
    s->y = 0x35;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x359;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    vram += 0x80;

    s = &strc->s6[2];
    s->x = 0x67;
    s->y = 0x61;
    s->graphics.dest = vram;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = 0x37E;
    s->variant = 4;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    gRepeatedKeys = 0;
    gPressedKeys = 0;
    gInput = 0;

    gBgCntRegs[2] = 0x1F05;
    gBgScrollRegs[2][0] = gBgScrollRegs[1][0];
    gBgScrollRegs[2][1] = gBgScrollRegs[1][1];
    strc->unk23E = gBgScrollRegs[1][0];
    strc->unk240 = gBgScrollRegs[1][1];
    strc->unk242 = gBgScrollRegs[1][0];
    strc->unk244 = gBgScrollRegs[1][1];

    gDispCnt |= 0x2400;
    gWinRegs[4] = 0x3D;
    gWinRegs[5] = 0x3B;
    gBldRegs.bldCnt = 0x3F46;

    gCurTask->main = Task_80196FC;
    Task_80196FC();
}

// (99.42%) https://decomp.me/scratch/2e0s2
NONMATCH("asm/non_matching/game/sa1/stage/results_b__Task_80196FC.inc", void Task_80196FC(void))
{
    s32 spC = 1;
    u8 sp8[2] = { 0 };
    s32 sp10;
    s32 r2;
    Sprite *temp_r4_10;
    Sprite *temp_r6;
    s16 *temp_r3;
    s16 temp_r4_7;
    s32 *temp_r2_5;
    s32 temp_r0_3;
    s32 temp_r1_3;
    s32 temp_r1_4;
    s32 temp_r2_2;
    s32 temp_r3_2;
    s32 var_r6;
    s32 var_sl;
    u32 var_r3;
    s16 var_r5;
    u8 *var_r2;
    u8 temp_r0;
    u8 temp_r0_2;
    u8 temp_r2_4;
    u8 temp_r4_3;
    union MultiSioData *send_recv;
    void *var_r1;

    MPResultsB *strc = TASK_DATA(gCurTask);

    if (strc->unk247 == 0) {
        if (DPAD_RIGHT & gRepeatedKeys) {
            if (strc->unk246 == 0) {
                m4aSongNumStart(0x6CU);
            }
            strc->unk246 = spC;
        } else if (DPAD_LEFT & gRepeatedKeys) {
            if (strc->unk246 == 1) {
                m4aSongNumStart(0x6CU);
            }
            strc->unk246 = 0;
        }
    }
    if (IS_MULTI_PLAYER) {
        for (var_r3 = 0; var_r3 < 4; var_r3++) {
            if (!GetBit(gMultiplayerConnections, var_r3)) {
                break;
            }

            if (!CheckBit(gMultiSioStatusFlags, var_r3)) {
                if (gMultiplayerMissingHeartbeats[var_r3]++ >= 0xB5) {
                    TasksDestroyAll();
                    gBackgroundsCopyQueueCursor = gBackgroundsCopyQueueIndex;
                    gBgSpritesCount = 0;
                    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[var_r3] = 0;
            }
        }
    }
block_18:
    for (var_r6 = 0; var_r6 < 4; var_r6++) {
        if (!GetBit(gMultiplayerConnections, var_r6)) {
            break;
        }
        var_sl = 0xE0;

        send_recv = &gMultiSioRecv[var_r6];
        if ((u32)(u16)(send_recv->pat0.unk0 - 0x40) <= 1U) {
            if (send_recv->pat0.unk0 != 0x41) {
                temp_r4_10 = &strc->s3[var_r6]; // TODO: s3 has 4 elements????
                temp_r4_10->x = (send_recv->pat0.unk2 << 7) + 0x2B;
                DisplaySprite(temp_r4_10);
                temp_r4_10 = &strc->s6[1];
                temp_r4_10->y = gUnknown_080BB484[var_r6];
                temp_r4_10->x = (send_recv->pat0.unk2 * 0x5E) + 0x4B;
                if (send_recv->pat0.unk2 == 0) {
                    temp_r4_10->frameFlags &= 0xFFFFFBFF;
                    gMultiplayerConnections &= ~(0x10 << var_r6);
                    asm("");
                } else {
                    temp_r4_10->frameFlags |= 0x400;
                    gMultiplayerConnections |= 0x10 << var_r6;
                }
                DisplaySprite(temp_r4_10);
                spC = 0;
            } else {
                temp_r4_10 = &strc->s3[var_r6];
                DisplaySprite(temp_r4_10);
                if (temp_r4_10->x == 0x2B) {
                    sp8[0]++;
                } else {
                    sp8[1]++;
                }
            }
        } else {
            spC = 0;
        }
    }
    temp_r0_2 = (u8)var_r6;
    if (spC != 0) {
        if ((sp8[0] == 0) || (sp8[1] == 0)) {
            strc->unk247 = 0;
            goto block_39;
        }
        TaskDestroy(gCurTask);
        gFlags &= ~4;
        if (gGameMode == 3) {
            CreateCourseSelect(0U);
            return;
        }
        sub_8062F90();
        return;
    }
block_39:
    SA2_LABEL(sub_80064A8)(0U, 0x74U, 0U, 0x7CU, 8U, 0xF0U);
    SA2_LABEL(sub_80064A8)(0U, 0x7CU, 8U, 0x74U, 0x10U, 0xF0U);

    // TOOD
#ifndef NON_MATCHING
    {
        register volatile void *dmaSrc asm("r2") = &REG_DMA3SAD;
        register u8 *offsetsHBlank asm("r4") = gBgOffsetsHBlankPrimary;
        asm("" ::"r"(dmaSrc));
        asm("" ::"r"(offsetsHBlank));
        {
            u32 copySize = gHBlankCopySize;
            register void *dmaDst asm("r1") = &(offsetsHBlank)[copySize << 4];
            register s32 v asm("r7") = 0x84000000;
            asm("" ::"r"(v));
            for (var_r6 = 0; var_r6 <= 0x80; var_r6 += 0x10) {
                DmaCopy32(3, gBgOffsetsHBlankPrimary, dmaDst, (gHBlankCopySize << 4));
                dmaDst += copySize;
            }
        }
    }
#else
    temp_r1_4 = gHBlankCopySize * 0x10;
    for (var_r6 = 0x0; var_r6 <= 0x80; var_r6 += 0x10) {
        DmaCopy32(3, gBgOffsetsHBlankPrimary, &((u8 *)gBgOffsetsHBlankPrimary)[temp_r1_4], (gHBlankCopySize << 4));
        temp_r1_4 += gHBlankCopySize * var_r6;
    }
#endif

    strc->unk238 = (strc->unk238 + 1) & 0x3FF;
    temp_r2_2 = (((strc->unk236 * COS_24_8(strc->unk238))) << 8) >> 16;
    temp_r1_3 = (((strc->unk236 * SIN_24_8(strc->unk238))) << 8) >> 16;
    strc->unk23E += temp_r2_2;
    strc->unk240 += temp_r1_3;
    strc->unk242 -= temp_r2_2;
    strc->unk244 -= temp_r1_3;
    gBgScrollRegs[1][0] = (s16)((s32)((u16)strc->unk23E << 0x10) >> 0x18);
    gBgScrollRegs[1][1] = (s16)((s32)(strc->unk240 << 0x10) >> 0x18);
    gBgScrollRegs[2][0] = (s16)((s32)(strc->unk242 << 0x10) >> 0x18);
    gBgScrollRegs[2][1] = (s16)((s32)(strc->unk244 << 0x10) >> 0x18);
    if (2 & gPressedKeys) {
        m4aSongNumStart(0x6BU);
        strc->unk247 = 0;
    }
    if ((!(DPAD_SIDEWAYS & gInput) && (A_BUTTON & gPressedKeys)
         && (((strc->unk246 == 0) && ((temp_r0_2 - 1) != sp8[0])) || ((strc->unk246 == 1) && ((temp_r0_2 - 1) != sp8[1]))))
        || (strc->unk247 != 0)) {
        if (strc->unk247 == 0) {
            m4aSongNumStart(0x6AU);
        }
        send_recv = &gMultiSioSend;
        send_recv->pat0.unk0 = 0x41;
        send_recv->pat0.unk2 = strc->unk246;
        strc->unk247 = 1;
    } else {
        send_recv = &gMultiSioSend;
        send_recv->pat0.unk0 = 0x40;
        send_recv->pat0.unk2 = strc->unk246;
    }

    for (var_r6 = 0; var_r6 < 4; var_r6++) {
        if (!GetBit(gMultiplayerConnections, var_r6)) {
            break;
        }

        if (SIO_MULTI_CNT->id != var_r6) {
            send_recv = &gMultiSioRecv[var_r6];
            if (send_recv->pat0.unk0 >= 0x42) {
                TasksDestroyAll();
                gBackgroundsCopyQueueCursor = gBackgroundsCopyQueueIndex;
                gBgSpritesCount = 0;
                gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                LinkCommunicationError();
                return;
            }
        }
    }

    temp_r4_10 = &strc->s;
    temp_r2_5 = &strc->unk230;
    temp_r3_2 = strc->unk230;
    temp_r1_4 = temp_r3_2 + 0x80;
    strc->unk230 = temp_r1_4;
    if (temp_r1_4 > Q(164)) {
        strc->unk230 -= Q(164);
    }

    var_r5 = I(-strc->unk230);
    temp_r0_3 = var_r5;
    temp_r6 = &strc->s2;
    while (var_r5 < DISPLAY_WIDTH) {
        temp_r4_10->x = (s16)var_r5;
        var_r5 += 164;
        DisplaySprite(temp_r4_10);
        temp_r0_3 = var_r5;
    }
    temp_r4_10 = &strc->s6[2];
    DisplaySprite(temp_r4_10);

    temp_r4_10 = temp_r6;
    for (var_r6 = 0; var_r6 < 8; var_r6++) {
        temp_r4_10->x = var_r6 * 32;
        DisplaySprite(temp_r4_10);
    }
}
END_NONMATCH