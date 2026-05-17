#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/sa1/ui/character_select.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/sa1/menus/title_screen.h"

#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"

typedef struct {
    /* 0x000 */ Sprite sprites[4];
    /* 0x0C0 */ Sprite s2;
    /* 0x0F0 */ Sprite s3;
    /* 0x120 */ StrcUi_805423C unk120;
    /* 0x12C */ s32 qUnk12C;
    /* 0x130 */ s32 qUnk130;
    /* 0x134 */ u8 unk134;
} TimeAttackLobby; /* 0x138 */

extern AnimId gUnknown_0868B684[4][UILANG_COUNT];
extern u8 gUnknown_0868B694[4][UILANG_COUNT];
extern u8 gUnknown_0868B69C[4];
extern AnimId gUnknown_0868B6A0[NUM_CHARACTERS][3];
extern u8 gUnknown_0868B6B8[NUM_CHARACTERS][3];
extern VoidFn gUnknown_0868B6C4[4];
extern u16 gUnknown_086CE2F4[0x100];
extern u8 gUnknown_086CE4F4[0x300];
extern u8 gUnknown_086CE7F4[0x500];

static void Task_HandleInput(void);
void Task_806A508(void);
void sub_806A5BC(void);
void CreateCourseSelect(u8 param0);
void TaskDestructor_806A698(struct Task *t);

void sub_806A150(void);
void CreateTimeAttackLobbyScreen(void);

void sub_806A150(void)
{
    Strc_80528AC sp00;
    sp00.uiGfxID = 128;
    sp00.unk2B = 0;
    sp00.tiles = &gUnknown_086CE4F4[0];
#ifndef BUG_FIX
    sp00.tilesSize = 0x500;
#else
    sp00.tilesSize = sizeof(gUnknown_086CE4F4);
#endif
    sp00.layout = &gUnknown_086CE7F4[0];
    sp00.layoutSize = sizeof(gUnknown_086CE7F4);
    sp00.palette = &gUnknown_086CE2F4[0];
    sp00.paletteSize = sizeof(gUnknown_086CE2F4);
    sp00.unk28 = 0;
    sp00.unk29 = 0;
    sp00.unk2A = 21;
    sub_80528AC(&sp00);
}

void CreateTimeAttackLobbyScreen(void)
{
    Sprite *s;
    struct Task *t;
    TimeAttackLobby *lobby;
    StrcUi_805423C *unk120;
    u8 i;

    m4aSongNumStart(SE_155);

    for (i = 0; i < ARRAY_COUNT(gKeysFirstRepeatIntervals); i++) {
        gKeysFirstRepeatIntervals[i] = 0x14;
        gKeysContinuedRepeatIntervals[i] = 8;
    }

    sub_80535FC();
    gDispCnt = 0x1140;
    gBgCntRegs[0] = 0x1E83;
    UiGfxStackInit();
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    t = TaskCreate(Task_HandleInput, sizeof(TimeAttackLobby), 0x2000, 0, TaskDestructor_806A698);
    lobby = TASK_DATA(t);

    unk120 = &lobby->unk120;
    lobby->unk134 = 0;
    lobby->qUnk130 = 0;
    lobby->qUnk12C = 0;

    for (i = 0; i < ARRAY_COUNT(lobby->sprites); i++) {
        s = &lobby->sprites[i];
        s->graphics.dest = VramMalloc(gUnknown_0868B69C[i]);
        s->graphics.anim = gUnknown_0868B684[i][LOADED_SAVE->uiLanguage];
        s->variant = gUnknown_0868B694[i][LOADED_SAVE->uiLanguage];
        s->x = 47;
        s->y = (i * 16) + 33;
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->oamFlags = 0x480;
        s->frameFlags = 0x2000;
        UpdateSpriteAnimation(s);
    }

    s = &lobby->s2;
    s->graphics.dest = VramMalloc(4U);
    s->graphics.anim = 857;
    s->variant = 0;
    s->x = 33;
    s->y = 25;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s++;
    s->graphics.dest = VramMalloc(64);
    s->graphics.anim = gUnknown_0868B6A0[gSelectedCharacter][0];
    s->variant = gUnknown_0868B6B8[gSelectedCharacter][0];
    s->x = 0x78;
    s->y = 0x82;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2400;
    unk120->unk0 = 0;
    unk120->unk2 = 1;
    unk120->unk4 = 2;
    unk120->unk6 = 0;
    unk120->unk8 = 0x100;
    unk120->unkA = 0x10;
    sub_805423C(unk120);
    sub_806A150();
}

static void Task_HandleInput(void)
{
    TimeAttackLobby *lobby = TASK_DATA(gCurTask);
    StrcUi_805423C *temp_r6 = &lobby->unk120;

    if (sub_805423C(temp_r6)) {
        if (gRepeatedKeys & DPAD_DOWN) {
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            if (lobby->unk134 < (ARRAY_COUNT(gUnknown_0868B6C4) - 1)) {
                lobby->unk134++;
            } else {
                lobby->unk134 = 0;
            }
        } else if (gRepeatedKeys & DPAD_UP) {
            m4aSongNumStart(SE_MENU_CURSOR_MOVE);

            if (lobby->unk134 != 0) {
                lobby->unk134--;
            } else {
                lobby->unk134 = (ARRAY_COUNT(gUnknown_0868B6C4) - 1);
            }
        }

        if (gPressedKeys & A_BUTTON) {
            m4aSongNumStart(SE_SELECT);
            if (lobby->unk134 != (ARRAY_COUNT(gUnknown_0868B6C4) - 1)) {
                Sprite *s3 = &lobby->s3;
                s3->graphics.anim = gUnknown_0868B6A0[gSelectedCharacter][1];
                s3->variant = gUnknown_0868B6B8[gSelectedCharacter][1];
                s3->prevVariant = 0xFF;
            }

            temp_r6->unk4 = 1;
            temp_r6->unk6 = 0;
            gCurTask->main = Task_806A508;
        }
    }

    sub_806A5BC();
}

void Task_806A508(void)
{
    TimeAttackLobby *lobby = TASK_DATA(gCurTask);

    StrcUi_805423C *temp_r4 = &lobby->unk120;

    if ((lobby->qUnk12C < Q(DISPLAY_HEIGHT)) && (lobby->unk134 != 3)) {
        lobby->qUnk130 += Q(32. / 256.);
        lobby->qUnk12C += lobby->qUnk130;
    } else if (sub_805423C(temp_r4)) {
        u8 unk134;
        gDispCnt &= 0x1FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;

        unk134 = lobby->unk134;

        m4aSongNumStop(SE_155);
        TaskDestroy(gCurTask);

        gUnknown_0868B6C4[unk134]();

        return;
    }

    sub_806A5BC();
}

void sub_806A5BC(void)
{
    Sprite *s;
    u8 i;

    TimeAttackLobby *lobby = TASK_DATA(gCurTask);

    for (i = 0; i < ARRAY_COUNT(lobby->sprites); i++) {
        s = &lobby->sprites[i];
        DisplaySprite(s);
    }

    s = &lobby->s2;
    s->y = (lobby->unk134 * 16) + 25;
    DisplaySprite(s);

    s++;
    s->x = I(lobby->qUnk12C) + DISPLAY_CENTER_X;
    if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
        s->graphics.anim = gUnknown_0868B6A0[gSelectedCharacter][1];
        s->variant = gUnknown_0868B6B8[gSelectedCharacter][1];
        s->prevVariant = -1;
    }
    DisplaySprite(s);
}

void sub_806A66C(void) { CreateCharacterSelectionScreen(gSelectedCharacter); }

void sub_806A680(void) { CreateCourseSelect(0); }

void sub_806A68C(void) { CreateTitleScreen(1); }

void TaskDestructor_806A698(struct Task *t)
{
    TimeAttackLobby *lobby = TASK_DATA(t);
    u8 i;

    for (i = 0; i < ARRAY_COUNT(lobby->sprites); i++) {
        VramFree(lobby->sprites[i].graphics.dest);
    }

    VramFree(lobby->s2.graphics.dest);
    VramFree(lobby->s3.graphics.dest);
}
