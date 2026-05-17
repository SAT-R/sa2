#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"
#include "game/sa1/ui/game_over.h"
#include "game/globals.h"
#include "game/shared/multiplayer/communication_outcome.h"
#include "game/sa1/stage/mp_results.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/text.h"

typedef struct {
    Background bg;
    Sprite sprites[3];
    Sprite sprD0;
    Sprite spr100;
    Sprite spr130;
    StrcUi_805423C strc160;
    u8 unk16C;
    u16 unk16E;
    u8 unk170;
} ContinueScreen; /* 0x174 */

void Task_MultiplayerContinueScreen(void);
void TaskDestructor_MultiplayerContinueScreen(struct Task *t);
void sub_806B534(void);
void sub_806B5A4(void);
extern void sub_8018538(void);

extern u16 gUnknown_0868B76C[3][UILANG_COUNT];
extern u8 gUnknown_0868B778[3][UILANG_COUNT];
extern AnimId gUnknown_0868B782[UILANG_COUNT];
extern AnimId gUnknown_0868B786[UILANG_COUNT];
extern u8 gUnknown_0868B77E[3];
extern u8 gUnknown_0868B78A[3][2];
extern u8 gUnknown_0868B790[3];

void CreateMultiplayerContinueScreen(void)
{
    s32 uiLang;
    Background *bg;
    StrcUi_805423C *strc160;
    s32 temp_r4;
    s8 *temp_r0_2;
    s8 *temp_r0_3;
    ContinueScreen *screen;
    u8 *temp_r1_2;
    u8 *temp_r1_3;
    u8 *temp_r1_4;
    u8 i;
    Sprite *s;

    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;
    m4aSongNumStart(0x9BU);
    uiLang = LOADED_SAVE->uiLanguage;

    for (i = 0; i < 10; i++) {
        gKeysFirstRepeatIntervals[i] = 0x14;
        gKeysContinuedRepeatIntervals[i] = 8;
    }
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x1E00;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    screen = TASK_DATA(
        TaskCreate(Task_MultiplayerContinueScreen, sizeof(ContinueScreen), 0x2000U, 0U, TaskDestructor_MultiplayerContinueScreen));
    strc160 = &screen->strc160;
    screen->unk16C = 0;
    screen->unk16E = 0;
    screen->unk170 = 0;
    bg = &screen->bg;
    bg->graphics.dest = (void *)BG_VRAM;
    bg->graphics.anim = 0;
    bg->layoutVram = (u16 *)(BG_VRAM + 0xF000);
    bg->unk18 = 0;
    bg->unk1A = 0;
    bg->tilemapId = 0x50;
    bg->unk1E = 0;
    bg->unk20 = 0;
    bg->unk22 = 0;
    bg->unk24 = 0;
    bg->targetTilesX = 30;
    bg->targetTilesY = 20;
    bg->paletteOffset = 0;
    bg->flags = 0;
    DrawBackground(bg);

    for (i = 0; i < 3; i++) {
        s = &screen->sprites[i];
        s->graphics.dest = VramMalloc(gUnknown_0868B77E[i]);
        s->graphics.anim = gUnknown_0868B76C[i][uiLang];
        s->variant = gUnknown_0868B778[i][uiLang];
        s->x = gUnknown_0868B78A[i][0];
        s->y = gUnknown_0868B78A[i][1];
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->oamFlags = 0x480;
        s->frameFlags = 0;
    }

    s = &screen->sprD0;
    s->graphics.dest = VramMalloc(0x1CU);
    s->graphics.anim = 0x35A;
    screen->sprD0.variant = 0;
    s->x = 23;
    s->y = 57;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0;

    s = &screen->spr100;
    s->graphics.dest = VramMalloc(0x23U);
    s->graphics.anim = gUnknown_0868B782[UILANG_ENGLISH];
    s->variant = gUnknown_0868B786[UILANG_ENGLISH];
    s->x = 101;
    s->y = 81;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0;
    s = &screen->spr130;

    s->x = DISPLAY_CENTER_X;
    s->y = DISPLAY_CENTER_Y;
    s->graphics.dest = VramMalloc(0xCU);
    s->oamFlags = 0x80;
    s->graphics.size = 0;
    s->graphics.anim = 0x389;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    screen->spr130.animSpeed = 0x10;
    screen->spr130.palId = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);
    strc160->unk0 = 0;
    strc160->unk2 = 1;
    strc160->unk4 = 2;
    strc160->unk6 = 0;
    strc160->unk8 = 0x100;
    strc160->unkA = 0x10;
    sub_805423C(strc160);
}

void Task_MultiplayerContinueScreen()
{
    Sprite *s;
    StrcUi_805423C *strc160;
    s16 *temp_r1_2;
    s32 var_r5;
    s8 *temp_r2_2;
    s8 *temp_r5;
    s8 var_r0;
    u16 temp_r0;
    u32 var_r2_2;
    u32 var_r3;
    u8 *var_r2;
    u8 temp_r0_2;
    u8 temp_r4;

    ContinueScreen *screen = TASK_DATA(gCurTask);
    union MultiSioData *recv_send;

    strc160 = &screen->strc160;
    if (screen->unk16E > 120) {
        if (IS_MULTI_PLAYER) {
            for (var_r3 = 0; var_r3 < 4 && GetBit(gMultiplayerConnections, var_r3); var_r3++) {
                if (!CheckBit(gMultiSioStatusFlags, var_r3)) {
                    if (gMultiplayerMissingHeartbeats[var_r3]++ > 0xB4U) {
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
    } else {
        screen->unk16E++;
    }

    if (sub_805423C(strc160) != 0) {
        gDispCnt &= 0x9FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        recv_send = &gMultiSioRecv[0];
        if (recv_send->pat0.unk0 == 0xA0) {
            if (screen->unk16C != recv_send->pat0.unk2) {
                m4aSongNumStart(0x6CU);
                if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_CHILD) {
                    screen->unk16C = recv_send->pat0.unk2;
                }
            }
        } else if (recv_send->pat0.unk0 == 0xA1) {
            if (screen->unk16C != recv_send->pat0.unk2) {
                m4aSongNumStart(0x6CU);
                screen->unk16C = recv_send->pat0.unk2;
            }

            m4aSongNumStart(0x6AU);
            strc160->unk4 = 1;
            strc160->unk6 = 0;
            gCurTask->main = sub_806B534;
        }

        recv_send = &gMultiSioSend;
        recv_send->pat0.unk0 = 0xA0;
        recv_send->pat0.unk2 = screen->unk16C;
        if ((gMultiSioStatusFlags & MULTI_SIO_TYPE) == MULTI_SIO_PARENT) {
            if (screen->unk170 == 0) {
                if ((DPAD_RIGHT & gRepeatedKeys)) {
                    screen->unk16C = 1;
                } else if ((DPAD_LEFT & gRepeatedKeys)) {
                    screen->unk16C = 0;
                }

                recv_send->pat0.unk2 = (u8)screen->unk16C;
                if (A_BUTTON & gPressedKeys) {
                    var_r5 = 1;
                    for (var_r2_2 = 0; var_r2_2 < 4; var_r2_2++) {
                        if (var_r2_2 != SIO_MULTI_CNT->id) {
                            struct MultiSioData_0_0 *pat0;
                            if (!GetBit(gMultiplayerConnections, var_r2_2)) {
                                break;
                            }

                            recv_send = &gMultiSioRecv[var_r2_2];
                            if (recv_send->pat0.unk0 != 0xA0) {
                                var_r5 = 0;
                            }
                        }
                    }

                    if (var_r5 != 0) {
                        gMultiSioSend.pat0.unk0 = 0xA1;
                        screen->unk170 = 1;
                    }
                }
            } else {
                recv_send->pat0.unk0 = 0xA1;
            }
        } else {
            s = &screen->spr130;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    s = &screen->spr100;
    s->graphics.anim = gUnknown_0868B782[screen->unk16C];
    s->variant = (u8)gUnknown_0868B786[screen->unk16C];
    sub_806B5A4();
    return;
}

void sub_806B534(void)
{
    ContinueScreen *screen;
    u8 temp_r4_2;

    screen = TASK_DATA(gCurTask);
    if (sub_805423C(&screen->strc160)) {
        gDispCnt &= ~0xE000;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        temp_r4_2 = screen->unk16C;
        m4aSongNumStop(0x9BU);
        TaskDestroy(gCurTask);

        if (temp_r4_2 == 0) {
            sub_8018538();
        } else {
            CreateMultiplayerResultsScreen(2U);
        }

        // return after TaskDestroy()!
        return;
    } else {
        sub_806B5A4();
    }
}

void sub_806B5A4(void)
{
    Sprite *s;
    ContinueScreen *screen;
    u8 temp_r7;
    u8 i;
    u8 unk16C;

    screen = TASK_DATA(gCurTask);
    unk16C = screen->unk16C;

    for (i = 0; i < 3; i++) {
        s = &screen->sprites[i];
        s->prevVariant = -1;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    s = &screen->sprD0;
    s->x = gUnknown_0868B790[unk16C];
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &screen->spr100;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_MultiplayerContinueScreen(struct Task *t)
{
    ContinueScreen *screen = TASK_DATA(t);
    u8 i;

    for (i = 0; i < 3; i++) {
        VramFree(screen->sprites[i].graphics.dest);
    }

    VramFree(screen->sprD0.graphics.dest);
    VramFree(screen->spr100.graphics.dest);
    VramFree(screen->spr130.graphics.dest);
}
