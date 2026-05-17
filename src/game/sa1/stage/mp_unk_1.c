#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "bg_triangles.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/ui/course_select.h"
#include "game/shared/menus/unused_level_select.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/sa1/stage/mp_unk_1.h"
#include "game/globals.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/save.h"

#include "constants/sa1/songs.h"
#include "constants/sa1/tilemaps.h"
#include "constants/sa1/ui_graphics.h"

typedef struct {
    Sprite s;
    u8 filler30[0x8];
} SpriteStrc;

typedef struct {
    /*  0x00 */ Background bg0;
    /*  0x40 */ u8 filler40[0x40];
    /*  0x80 */ SpriteStrc sprites[4];
    /* 0x120 */ u8 filler160[0x2D0];
#if WIDESCREEN_HACK
    /* 0x430 */ u32 qUnk430;
#else
    /* 0x430 */ u16 qUnk430;
#endif
    /* 0x432 */ s16 unk432;
} MPStrc1; /* 0x434 */

typedef struct {
    /* 0x00 */ GameOverB overBs[4];
    /* 0x60 */ u16 unk60;
    /* 0x60 */ u16 unk62;
    /* 0x60 */ u8 *vram64;
} MPStrc2; /* 0x68 */

void Task_801CB80(void);
void sub_801CF08(void);
void sub_801D0CC();
void Task_801D200(void);
void Task_801D34C(void);
void TaskDestructor_801D3C8(struct Task *t);

extern void sub_8018AE0(void);
extern void sub_8062F90(void);

extern u8 gUnknown_03005008[MULTI_SIO_PLAYERS_MAX];

void sub_801C9D8(void)
{
    MPStrc1 *strc;
    Sprite *s;
    struct Task *t;
    u32 i;

    gWinRegs[4] = 0;
    gWinRegs[5] = 0;
    gWinRegs[0] = 0;
    gWinRegs[2] = 0;
    gWinRegs[1] = 0;
    gWinRegs[3] = 0;
    gDispCnt = DISPCNT_OBJ_1D_MAP;
    gBgCntRegs[3] = 0x5E0B;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    gBgSprites_Unknown1[3] = 0xFF;
    gBgSprites_Unknown2[3][0] = 0;
    gBgSprites_Unknown2[3][1] = 0;
    gBgSprites_Unknown2[3][2] = -1;
    gBgSprites_Unknown2[3][3] = 0x40;
    DmaFill32(3, 0, VRAM + 0xA000 - 0x20, 0x40);
    t = TaskCreate(Task_801CB80, sizeof(MPStrc1), 0x2000U, 0U, NULL);
    strc = TASK_DATA(t);
    strc->qUnk430 = 0;

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (!GetBit(gMultiplayerConnections, i))
            break;
    }

    if (i == 3) {
        strc->unk432 = 0x14;
    } else if (i == 2) {
        strc->unk432 = 0x28;
    } else {
        strc->unk432 = 0;
    }

    strc->bg0.graphics.dest = (void *)(BG_VRAM + 0x8000);
    strc->bg0.graphics.anim = 0;
    strc->bg0.layoutVram = (u16 *)(BG_VRAM + 0xF000);
    strc->bg0.unk18 = 0;
    strc->bg0.unk1A = 0;
    strc->bg0.tilemapId = TM_MP_MULTIPAK_PLAYER_OVERVIEW;
    strc->bg0.unk1E = 0;
    strc->bg0.unk20 = 0;
    strc->bg0.unk22 = 0;
    strc->bg0.unk24 = 0;
    strc->bg0.targetTilesX = 30;
    strc->bg0.targetTilesY = 20;
    strc->bg0.paletteOffset = 0;
    strc->bg0.flags = 3;
    DrawBackground(&strc->bg0);

    for (i = 0; i < ARRAY_COUNT(strc->sprites); i++) {
        SpriteStrc *spr = &strc->sprites[i];
        Sprite *s = &spr->s;

        s->x = DISPLAY_CENTER_X;
        s->y = 20 + i * 0x28;
        s->graphics.dest = OBJ_VRAM0 + (i << 0xB);
        s->oamFlags = 0x400;
        s->graphics.size = 0;
        s->graphics.anim = gPlayerCharacterIdleAnims[i];
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = 0x1000;
        UpdateSpriteAnimation(s);
    };

    sub_80535FC();
}

void Task_801CB80()
{
    u32 pid;
    u32 i;
    MPStrc1 *strc;

    gDispCnt |= (DISPCNT_OBJ_ON | DISPCNT_BG3_ON);
    if (IS_MULTI_PLAYER) {
        for (pid = 0; pid < 4; pid++) {
            if (!GetBit(gMultiplayerConnections, pid)) {
                break;
            }

            if (!CheckBit(gMultiSioStatusFlags, pid)) {
                if (gMultiplayerMissingHeartbeats[pid]++ >= 0xB5) {
                    TasksDestroyAll();
                    gBackgroundsCopyQueueCursor = gBackgroundsCopyQueueIndex;
                    gBgSpritesCount = 0;
                    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[pid] = 0;
            }
        }
    }

    strc = TASK_DATA(gCurTask);
    strc->qUnk430 += Q(4);
    if (strc->qUnk430 > Q(DISPLAY_WIDTH)) {
        strc->qUnk430 = 0;
        sub_801D0CC();
        gCurTask->main = Task_801D34C;
        Task_801D34C();
        return;
    }

    if (strc->unk432 != 0) {
        SA2_LABEL(sub_80078D4)(3U, 0U, strc->unk432, 0xF0U, 0U);
    }

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (!GetBit(gMultiplayerConnections, i)) {
            break;
        }

        if (1 & i) {
            SA2_LABEL(sub_80078D4)
            (3U, strc->unk432 + (i * 40), strc->unk432 + ((i + 1) * 40), (DISPLAY_WIDTH - I(strc->qUnk430)), (-strc->unk432) & 0xFF);
        } else {
            SA2_LABEL(sub_80078D4)
            (3U, strc->unk432 + (i * 40), strc->unk432 + ((i + 1) * 40), (I(strc->qUnk430) - DISPLAY_WIDTH), (-strc->unk432) & 0xFF);
        }
    }

    if (strc->unk432 != 0) {
        SA2_LABEL(sub_80078D4)(3U, (u8)(strc->unk432 + (i * 40)), DISPLAY_HEIGHT, DISPLAY_WIDTH, 0U);
    }
}

void Task_801CD80()
{
    MPStrc1 *strc = TASK_DATA(gCurTask);
    u8 i;

    strc->qUnk430 += Q(2);
    if (strc->qUnk430 > Q(16)) {
        strc->qUnk430 = 0x1000;
        gBldRegs.bldY = 0x10;
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;
        PAUSE_GRAPHICS_QUEUE();

        if ((gGameMode == GAME_MODE_RACE) || (gGameMode == GAME_MODE_CHAO_HUNT)) {
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                if (!GetBit(gMultiplayerConnections, i)) {
                    break;
                }
            }

            if (i < 3) {
                if (gGameMode == GAME_MODE_RACE) {
                    gGameMode = GAME_MODE_RACE;
                    CreateCourseSelect(0U);
                    return;
                }
                gGameMode = 4;
                sub_8062F90();
            } else {
                sub_8018AE0();
            }
        } else {
            m4aSongNumStop(MUS_CHARACTER_SELECTION);

            if (R_BUTTON & gInput) {
                gBgSprites_Unknown1[0] = 0;
                gBgSprites_Unknown2[0][0] = 0;
                gBgSprites_Unknown2[0][1] = 0;
                gBgSprites_Unknown2[0][2] = -1;
                gBgSprites_Unknown2[0][3] = 0x20;
                gBgSprites_Unknown1[1] = 0;
                gBgSprites_Unknown2[1][0] = 0;
                gBgSprites_Unknown2[1][1] = 0;
                gBgSprites_Unknown2[1][2] = -1;
                gBgSprites_Unknown2[1][3] = 0x20;
                gBgSprites_Unknown1[2] = 0;
                gBgSprites_Unknown2[2][0] = 0;
                gBgSprites_Unknown2[2][1] = 0;
                gBgSprites_Unknown2[2][2] = -1;
                gBgSprites_Unknown2[2][3] = 0x20;
                gBgSprites_Unknown1[3] = 0;
                gBgSprites_Unknown2[3][0] = 0;
                gBgSprites_Unknown2[3][1] = 0;
                gBgSprites_Unknown2[3][2] = -1;
                gBgSprites_Unknown2[3][3] = 0x20;
                CreateUnusedLevelSelect();
            } else if ((gGameMode == 0) && (LOADED_SAVE->unlockedLevels[gSelectedCharacter] == 0)) {
                gCurrentLevel = 0;
                ApplyGameStageSettingsAndStart();
            } else {
                CreateCourseSelect(0U);
            }
        }
    } else {
        sub_801CF08();
        gBldRegs.bldY = I(strc->qUnk430);
    }
}

void sub_801CF08()
{
    SpriteStrc *spriteStrc;
    u32 pid;
    u32 i;

    MPStrc1 *strc;

    if (IS_MULTI_PLAYER) {
        for (pid = 0; pid < 4; pid++) {
            if (!GetBit(gMultiplayerConnections, pid)) {
                break;
            }

            if (CheckBit(gMultiSioStatusFlags, pid) == 0) {
                if (gMultiplayerMissingHeartbeats[pid]++ >= 0xB5) {
                    TasksDestroyInPriorityRange(0U, 0xFFFFU);
                    gBackgroundsCopyQueueCursor = gBackgroundsCopyQueueIndex;
                    gBgSpritesCount = 0;
                    gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
                    LinkCommunicationError();
                    return;
                }
            } else {
                gMultiplayerMissingHeartbeats[pid] = 0;
            }
        }
    }

    strc = TASK_DATA(gCurTask);
    if (strc->unk432 != 0) {
        SA2_LABEL(sub_80078D4)(3U, 0U, strc->unk432, 240, 0U);
    }

    for (i = 0; i < 4; i++) {
        if (!GetBit(gMultiplayerConnections, i)) {
            break;
        }

        SA2_LABEL(sub_80078D4)(3U, (strc->unk432 + (i * 0x28)), (strc->unk432 + ((i + 1) * 0x28)), 0U, (-strc->unk432) & 0xFF);

        if ((i == SIO_MULTI_CNT->id) || GetBit(gMultiplayerConnections, i)) {
            spriteStrc = &strc->sprites[gMultiplayerCharacters[i]];
            spriteStrc->s.x = 120;
            spriteStrc->s.y = (i * 40) + 20 + strc->unk432;
            UpdateSpriteAnimation(&spriteStrc->s);
            DisplaySprite(&spriteStrc->s);
        }
    }

    if (strc->unk432 != 0) {
        SA2_LABEL(sub_80078D4)(3U, (strc->unk432 + (i * 0x28)), 0xA0U, 0xF0U, 0U);
    }
}

void sub_801D0CC(void)
{
    Strc_80528AC gfx;
    u8 i;
    GameOverB *overB;

    MPStrc2 *strc68;

    strc68 = TASK_DATA(TaskCreate(Task_801D200, sizeof(MPStrc2), 0x2200U, 0U, TaskDestructor_801D3C8));
    gfx.uiGfxID = UIGFX_ASCII_CHARS;
    gfx.unk2B = 1;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[UIGFX_60].palette; // TODO: What is this palette?
    gfx.vramC = VramMalloc(0xE0U);
    gfx.tilesSize = 0x1C00;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 4;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    strc68->vram64 = gfx.vramC;
    strc68->unk60 = 10;
    strc68->unk62 = 20;

    for (i = 0; i < 4; i++) {
        overB = &strc68->overBs[i];
        overB->qUnkA = 10;
        overB->unkC = 20;
        overB->unkE = 1;
        overB->unk10 = 1;
        overB->unk12 = 4;
        overB->unk16 = 1;
        overB->unk8 = 0;
    }
}

// (93.77%) https://decomp.me/scratch/9u8Fv
NONMATCH("asm/non_matching/game/sa1/stage/unk_1__Task_801D200.inc", void Task_801D200())
{
    MPStrc2 *strc;
    s32 sp4;
    u8 pid;
    GameOverB *overB;
    s32 var_r0_2;
    u8 var_r6;
    u8 nameChar;

    strc = TASK_DATA(gCurTask);
    for (pid = 0; pid < MULTI_SIO_PLAYERS_MAX; pid++) {
        if (!GetBit(gMultiplayerConnections, pid)) {
            break;
        }
    }

    if (pid == 3) {
        sp4 = 0x14;
    } else {
        if (pid == 2) {
            sp4 = 0x28;
        } else {
            sp4 = 0;
        }
    }

    for (var_r6 = 0; var_r6 < pid; var_r6++) {
        for (nameChar = 0; nameChar < MAX_PLAYER_NAME_LENGTH; nameChar++) {
            overB = &strc->overBs[var_r6];
            overB->qUnkA = (nameChar * 8) + strc->unk60;
            overB->unkC = (var_r6 * 40) + strc->unk62 + sp4;

            if (SIO_MULTI_CNT->id == var_r6) {
                u8 character = LOADED_SAVE->playerName[nameChar];
                if (character >= 0x70 && character < 0x8A) {
                    overB->unkC += 8;
                }
                sub_8052F78((const char *)&LOADED_SAVE->playerName[nameChar], overB);
            } else {
                u8 character = LOADED_SAVE->multiplayerScores[gUnknown_03005008[var_r6]].data.split.playerName[nameChar];
                if (character >= 0x70 && character < 0x8A) {
                    overB->unkC += 8;
                }
                sub_8052F78((const char *)&LOADED_SAVE->multiplayerScores[gUnknown_03005008[var_r6]].data.split.playerName[nameChar],
                            overB);
            }
        }
    }
}
END_NONMATCH

void Task_801D34C()
{
    u32 pid;
    u32 i;
    MPStrc1 *strc = TASK_DATA(gCurTask);

    if (strc->qUnk430++ > Q(60. / 256.)) {
        strc->qUnk430 = 0;
        gBldRegs.bldCnt = 0xFF;

        m4aMPlayFadeOut(&gMPlayInfo_BGM, 0);
        m4aMPlayFadeOut(&gMPlayInfo_SE1, 0);
        m4aMPlayFadeOut(&gMPlayInfo_SE2, 0);
        m4aMPlayFadeOut(&gMPlayInfo_SE3, 0);

        gCurTask->main = Task_801CD80;
        gCurTask->main();
    } else {
        sub_801CF08();
    }
}

void TaskDestructor_801D3C8(struct Task *t)
{
    MPStrc2 *strc = TASK_DATA(t);
    VramFree(strc->vram64);
}