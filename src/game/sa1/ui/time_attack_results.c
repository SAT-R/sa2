#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/ui/game_over.h"
#include "game/sa1/menus/title_screen.h"
#include "game/sa1/save.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"
#include "data/sa1/ui_graphics.h"

#include "constants/sa1/animations.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ GameOverB strc60;
    /* 0x78 */ GameOverB strc78;
    /* 0x90 */ GameOverB strc90;
    /* 0xA8 */ StrcUi_805423C strcA8;
    /* 0xB4 */ u8 unkB4[0x8];
    /* 0xBC */ u32 unkBC;
    /* 0xC0 */ s32 unkC0;
    /* 0xB4 */ TimeRecord recordC4;
    /* 0xC8 */ u8 *vramC8;
    /* 0xCC */ u8 unkCC;
} Game2_5;

void sub_8069994(u8 *vram);
void Task_8069E50(void);
void sub_8069EE4(bool32 unk0);
void sub_8069FDC(void);
void sub_806A02C(TimeRecord record, struct Task *t);
void TaskDestructor_806A124(struct Task *t);

extern const s16 sZoneTimeSecondsTable[];
extern const u16 sZoneTimeMinutesTable[];
extern const u8 gMillisUnpackTable[60 * 2];
extern const u8 gSecondsTable[60 * 2];

void sub_8069994(u8 *vram)
{
    Strc_80528AC sp00;
    s8 sp28;
    s8 sp2A;
    s8 sp2B;
    u8 *sp30;
    s8 *temp_r6;
    u8 *var_r0;

    UiGfxStackInit();

    sp00.uiGfxID = 32;
    sp00.unk2B = 15;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 0x580;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 6;
    sp00.vramC = vram;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = 16;
    sp00.unk2B = 16;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 0x200;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 12;
    sp00.vramC = OBJ_VRAM0 + 0x1000;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = 34;
    sp00.unk2B = 2;
    if (gCurrentLevel & 0x1) {
        sp00.tiles = (gUiGraphics[sp00.uiGfxID].tiles + (80 * TILE_SIZE_4BPP));
    } else {
        sp00.tiles = (gUiGraphics[sp00.uiGfxID].tiles);
    }
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.paletteSize = 0x20;
    sp00.unk28 = 11;
    sp00.tilesSize = 0xA00;
    sp00.vramC = OBJ_VRAM0 + 0x1800;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = 11 + gSelectedCharacter;
    sp00.unk2B = 2;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = 0x600;
    sp00.paletteSize = 0xC;
    sp00.unk28 = 11;
    sp00.vramC = OBJ_VRAM0 + 0x1200;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);
}

void CreateTimeAttackResult(TimeRecord record)
{
    struct Task *t;
    Sprite *s;
    Sprite *s2;
    StrcUi_805423C *strcA8;
    GameOverB *var_r7;
    u8 *vram;
    s32 temp_r0_2;

    Game2_5 *strc;

    sub_80535FC();
    vram = VramMalloc(44);
    sub_8069994(vram);
    t = TaskCreate(Task_8069E50, sizeof(Game2_5), 0x2000U, 0U, TaskDestructor_806A124);
    strc = TASK_DATA(t);
    strcA8 = &strc->strcA8;
    temp_r0_2 = RegisterTimeRecord(record);
    strc->recordC4 = temp_r0_2;
    if (temp_r0_2 != 0) {
        m4aSongNumStart(0x131U);
        strc->unkCC = 1;
    } else {
        m4aSongNumStart(0x132U);
        strc->unkCC = 0;
    }
    gMusicManagerState.unk0 = 0xFF;
    strc->unkBC = 0;
    strc->unkC0 = 0;
    strc->vramC8 = vram;

    s = &strc->s;
    s->graphics.dest = VramMalloc(24);
    s->graphics.anim = 884;
    s->variant = 4;
    s->x = 120;
    s->y = 120;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s2 = &strc->s2;
    s2->graphics.dest = VramMalloc(8);
    s2->graphics.anim = 884;
    s2->variant = 3;
    s2->x = 40;
    s2->y = 88;
    s2->graphics.size = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = 0x10;
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->oamFlags = 0x480;
    s2->frameFlags = 0x2000;
    UpdateSpriteAnimation(s2);

    var_r7 = &strc->strc60;
    var_r7->qUnkA = 0xF0;
    var_r7->unkC = 0x8C;
    var_r7->unkE = 8;
    var_r7->unk10 = 0x10;
    var_r7->unk12 = 0xC;
    var_r7->unk16 = 1;
    var_r7->unk8 = 0x18;
    var_r7 = &strc->strc78;
    var_r7->qUnkA = 0xF0;
    var_r7->unkC = 0x8C;
    var_r7->unkE = 9;
    var_r7->unk10 = 2;
    var_r7->unk12 = 0xB;
    var_r7->unk16 = 1;
    var_r7->unk8 = 0;
    var_r7 = &strc->strc90;
    var_r7->qUnkA = 0x50;
    var_r7->unkC = 0x50;
    var_r7->unkE = 7;
    var_r7->unk10 = 0xF;
    var_r7->unk12 = 6;
    var_r7->unk16 = 1;
    var_r7->unk8 = 0;

    strcA8->unk0 = 0;
    strcA8->unk2 = 1;
    strcA8->unk4 = 1;
    strcA8->unk6 = 0;
    strcA8->unk8 = 0x100;
    strcA8->unkA = 0x10;
    sub_806A02C(record, t);
}

void Task_8069E50()
{
    s32 *temp_r1;
    s32 unkBC;
    u32 var_r0;
    u32 var_r1;
    bool32 boolVal = FALSE;

    Game2_5 *strc = TASK_DATA(gCurTask);
    StrcUi_805423C *strcA8 = &strc->strcA8;

    unkBC = strc->unkBC;
    unkBC++;
    strc->unkBC = unkBC;

    if (strc->unkCC != 0) {
        var_r0 = 600;
        var_r1 = 540;
    } else {
        var_r0 = 330;
        var_r1 = 270;
    }

    if (unkBC > var_r0) {
        gDispCnt &= 0x1FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        TaskDestroy(gCurTask);
        GoToNextLevel();
        return;
    }

    if (unkBC > var_r1) {
        sub_805423C(strcA8);
        boolVal = TRUE;
    }

    sub_8069FDC();
    sub_8069EE4(boolVal);
}

void sub_8069EE4(u32 unk0)
{
    GameOverB *temp_r5;
    s16 temp_r0;
    s32 *temp_r4_2;
    u32 temp_r2;
    s16 temp_r4;
    Game2_5 *strc;

    const u8 arr[] = { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x20, 0x21, 0x22, 0x23, 0x24,
                       0x25, 0x26, 0x27, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x00 };

    strc = TASK_DATA(gCurTask);

    if ((u32)strc->unkBC > 60) {
        if (strc->recordC4 != 0) {
            DisplaySprite(&strc->s);
        }
        DisplaySprite(&strc->s2);
        temp_r5 = &strc->strc90;
        if (unk0 != 0) {
            sub_8052F78((const char *)strc->unkB4, temp_r5);
        } else {
            sub_80530CC((const char *)strc->unkB4, temp_r5);
        }
    }
    temp_r5 = &strc->strc60;
    temp_r4 = (u16)temp_r5->unkC;
    if (unk0 != 0) {
        sub_8052F78("        ", (GameOverB *)temp_r5);
    } else {
        sub_80530CC("        ", (GameOverB *)temp_r5);
    }

    temp_r5 = &strc->strc78;
    temp_r5->unkC = (s16)temp_r4 + 2;
    temp_r5->qUnkA -= 2;

    if (temp_r5->qUnkA < -0x1F) {
        temp_r5->qUnkA += 0x20;
        strc->unkC0 = Mod(strc->unkC0 + 1, 8);
    }
    if (unk0 != 0) {
        sub_8052F78((const char *)&arr[strc->unkC0], temp_r5);
        return;
    }

    sub_80530CC((const char *)&arr[strc->unkC0], temp_r5);
}

void sub_8069FDC()
{
    GameOverB *temp_r2;
    s32 temp_r1;

    Game2_5 *strc = TASK_DATA(gCurTask);

    temp_r2 = &strc->strc60;

    if (strc->unkBC > 30 && strc->unkBC < 40) {
        temp_r2->unkC -= 0xC;
        if (temp_r2->unkC <= 0x13) {
            temp_r2->unkC = 0x14;
        }
    } else if (strc->unkBC < 21) {
        if (strc->unkBC > 10) {
            temp_r2->qUnkA -= 0x18;
            if (temp_r2->qUnkA < 0) {
                temp_r2->qUnkA = 0;
            }
        }
    }
}

// TODO: Fake-match
void sub_806A02C(TimeRecord record, struct Task *t)
{
    s32 temp_r0_2;
    s32 temp_r2;

    Game2_5 *strc = TASK_DATA(t);

    if (record >= 36000) {
        strc->unkB4[6] = 0x29;
        strc->unkB4[5] = 0x29;
        strc->unkB4[3] = 0x29;
        strc->unkB4[2] = 0x25;
        strc->unkB4[0] = 0x29;
    } else {
#ifndef NON_MATCHING
        register u8 *r1 asm("r1");
        register s16 *r2 asm("r2");
        register s32 r5 asm("r5");
#else
        u8 *r1;
        s16 *r2;
        s32 r5;
#endif

        r5 = Div(record, 60);
        temp_r0_2 = Div(r5, 60);
        r5 = (r5 - sZoneTimeSecondsTable[temp_r0_2]) * 2;
        r2 = (void *)&sZoneTimeSecondsTable[r5 >> 1];
        temp_r2 = (record - *r2 - (sZoneTimeMinutesTable[temp_r0_2])) * 2;

        strc->unkB4[6] = gMillisUnpackTable[temp_r2 + 1];
        strc->unkB4[5] = gMillisUnpackTable[temp_r2 + 0];
        strc->unkB4[3] = gSecondsTable[r5 + 1];
        r1 = (u8 *)&gSecondsTable[r5 + 0];
        strc->unkB4[2] = *r1;
        strc->unkB4[0] = gSecondsTable[temp_r0_2 * 2 + 1];
    }

    strc->unkB4[1] = 0x2A;
    strc->unkB4[4] = 0x2A;
}

void TaskDestructor_806A124(struct Task *t)
{
    Game2_5 *strc = TASK_DATA(t);
    VramFree(strc->s.graphics.dest);
    VramFree(strc->s2.graphics.dest);
    VramFree(strc->vramC8);
}