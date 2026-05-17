#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/character_select.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/globals.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"

typedef struct {
    /* 0x00 */ Background bg;
    /* 0x40 */ Sprite s;
    /* 0x70 */ Sprite s2;
    /* 0xA0 */ u8 fillerA0[0x120];
    /* 0x1C0 */ Sprite spr1C0;
    /* 0x1F0 */ u8 filler1F0[0xC];
    /* 0x200 */ s32 unk1FC;
    /* 0x200 */ u16 unk200;
    /* 0x200 */ u8 unk202;
    /* 0x200 */ u8 unk203;
    /* 0x204 */ u8 filler204[0xF];
    /* 0x213 */ u8 unk213;
    /* 0x214 */ u8 filler214[0x8];
} MPResults; /* 0x21C */

void Task_801874C(void);
const AnimId gUnknown_080BB488[UILANG_COUNT] = { 895, 894 };
const u8 gUnknown_080BB48C[2][2] = { { 56, 92 }, { 64, 104 } };

void sub_8018538(void)
{
    MPResults *strc;
    Sprite *s;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1E03;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;
    strc = TASK_DATA(TaskCreate(Task_801874C, sizeof(MPResults), 0x2000U, 0U, NULL));
    strc->unk200 = 0;
    strc->unk203 = 0;
    strc->unk1FC = 0;
    strc->unk213 = 0;

    s = &strc->s;
    s->x = 232;
    s->y = 64;
    s->graphics.dest = (void *)OBJ_VRAM0;
    s->oamFlags = 0x3C0;
    s->graphics.size = 0;
    s->graphics.anim = gUnknown_080BB488[LOADED_SAVE->uiLanguage];
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &strc->s2;
    s->x = 0;
    s->y = 64;
    s->graphics.dest = (void *)OBJ_VRAM0 + 0x2C0;
    s->oamFlags = 0x400;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_OPTS_BLACK_RECT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &strc->spr1C0;
    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->graphics.dest = strc->s2.graphics.dest + 0x180;
    s->oamFlags = 0x80;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_VS_MENU_WAIT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    strc->bg.graphics.dest = (void *)BG_VRAM;
    strc->bg.graphics.anim = 0;
    strc->bg.layoutVram = (u16 *)(BG_VRAM + 0xF000);
    strc->bg.unk18 = 0;
    strc->bg.unk1A = 0;
    strc->bg.tilemapId = LOADED_SAVE->uiLanguage + 0x54;
    strc->bg.unk1E = 0;
    strc->bg.unk20 = 0;
    strc->bg.unk22 = 0;
    strc->bg.unk24 = 0;
    strc->bg.targetTilesX = 30;
    strc->bg.targetTilesY = 20;
    strc->bg.paletteOffset = 0;
    strc->bg.flags = 0;
    DrawBackground(&strc->bg);
    m4aSongNumStartOrChange(MUS_006);
}

// (99.30%) https://decomp.me/scratch/ZiBTK
NONMATCH("asm/non_matching/game/sa1/stage/results__Task_801874C.inc", void Task_801874C())
{
    Sprite *s;
    s32 offsetX;
    s32 var_r8;
    u32 var_r3;
    u32 i;
    u8 temp_r5_2;
    u8 temp_r7;

    MPResults *strc = TASK_DATA(gCurTask);

    if (IS_MULTI_PLAYER) {
        for (var_r3 = 0; var_r3 < MULTI_SIO_PLAYERS_MAX; var_r3++) {
            if (!GetBit(gMultiplayerConnections, var_r3)) {
                break;
            }

            if (CheckBit(gMultiSioStatusFlags, var_r3) == 0) {
                if (gMultiplayerMissingHeartbeats[var_r3]++ >= 0xB5) {
                    TasksDestroyInPriorityRange(0U, 0xFFFFU);
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

    if (gMultiSioRecv->pat0.unk0 == 0x30) {
        if (strc->unk203 != gMultiSioRecv->pat0.unk2) {
            m4aSongNumStart(0x6CU);
            if (!(gMultiSioStatusFlags & 0x80)) {
                strc->unk203 = gMultiSioRecv->pat0.unk2;
            }
        }
    } else if (gMultiSioRecv->pat0.unk0 == 0x31) {
        if (strc->unk203 != gMultiSioRecv->pat0.unk2) {
            m4aSongNumStart(0x6CU);
            strc->unk203 = gMultiSioRecv->pat0.unk2;
        }
        m4aSongNumStart(0x6AU);

        if (strc->unk203 == 0) {
            gGameMode = GAME_MODE_RACE;
            TaskDestroy(gCurTask);
            CreateCharacterSelectionScreen((PseudoRandom32() + SIO_MULTI_CNT->id) % 4u);
        } else {
            gGameMode = GAME_MODE_CHAO_HUNT;
            TaskDestroy(gCurTask);
            CreateCharacterSelectionScreen((PseudoRandom32() + SIO_MULTI_CNT->id) % 4u);
        }
        return;
    }

    if (gMultiSioStatusFlags & 0x80) {
        s32 v;
        var_r8 = 1;
        v = 0x30;
        gMultiSioSend.pat0.unk0 = v;
        temp_r5_2 = strc->unk213;
        if (temp_r5_2 == 0) {
            if (DPAD_UP & gRepeatedKeys) {
                m4aSongNumStart(0x6CU);

                if (--strc->unk203 > 1U) {
                    strc->unk203 = var_r8;
                }
                strc->unk1FC = 0;
            } else if (DPAD_DOWN & gRepeatedKeys) {
                m4aSongNumStart(0x6CU);

                if (++strc->unk203 > 1U) {
                    strc->unk203 = 0;
                }
                strc->unk1FC = 0;
            }
        }

        gMultiSioSend.pat0.unk2 = strc->unk203;
        for (i = 1; i < 4; i++) {
            if (!GetBit(gMultiplayerConnections, i)) {
                break;
            }

            if (gMultiSioRecv[i].pat0.unk0 != 0x30) {
                var_r8 = 0;
            }
        }

        if (((var_r8 != 0) && (A_BUTTON & gPressedKeys)) || (strc->unk213 != 0)) {
            strc->unk213 = 1;
            gMultiSioSend.pat0.unk0 = 0x31;
        }
    } else {
        s32 v = 0x30;
        gMultiSioSend.pat0.unk0 = v;
        s = &strc->spr1C0;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &strc->s;

    temp_r7 = gUnknown_080BB48C[LOADED_SAVE->uiLanguage][strc->unk203];
    strc->unk1FC += 0x80;
    if (strc->unk1FC > Q(temp_r7)) {
        strc->unk1FC -= Q(temp_r7);
    }
    s->y = (strc->unk203 * 24) + 64;
    s->variant = strc->unk203;
    UpdateSpriteAnimation(s);

    offsetX = I(strc->unk1FC) - temp_r7;
    while ((232 - offsetX) > 0) {
        s->x = 232 - offsetX;
        DisplaySprite(s);
        offsetX += temp_r7;
    }

    s = &strc->s2;
    s->y = (strc->unk203 * 24) + 54;
    for (i = 0; i < 8; i++) {
        s->x = i * 32;
        DisplaySprite(s);
    }
}
END_NONMATCH
