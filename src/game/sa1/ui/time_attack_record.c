#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/ui/course_select.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/ui_graphics.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ GameOverB overB;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ u8 unk50;
    /* 0x51 */ u8 unk51;
    /* 0x52 */ u8 unk52;
    /* 0x53 */ u8 unk53;
    /* 0x54 */ u8 unk54;
} TimeAttackRecord_58;

typedef struct {
    StrcUi_805423C strc0;
    Sprite s;
    Sprite s2;
    Sprite s3;
    Sprite s4;
    struct Task *taskCC; // -> TimeAttackRecord_58
    struct Task *taskD0; // -> TimeAttackRecord_58
    s32 unkD4;
    s32 unkD8;
    u8 unkDC;
    u8 unkDD;
    u8 unkDE;
    u8 unkDF;
    u8 unkE0;
} TimeAttackRecord_E4;

void sub_8060C88(void);
void sub_8061144(void);
void sub_8061480(void);
void Task_8061830(void);
void sub_80613D0(void);
void TaskDestructor_806182C(struct Task *t);

extern u16 gUnknown_0868B0D4[][2];
extern u16 gUnknown_0868B0EC[][2];
extern u8 gUnknown_0868B0F4[];
extern u16 gUnknown_0868B0FC[][2];

extern u8 gUnknown_08690574[];
extern u8 gUnknown_08691D74[];
extern u16 gCharacterCards_Amy_Palette[];
extern u8 gCharacterCards_Amy_Tiles[];
extern u8 gCharacterCards_Amy_Layout[];
extern u8 gUnknown_08693974[];
extern u16 gCharacterCards_Sonic_Palette[];
extern u8 gUnknown_086951F4[];
extern u8 gCharacterCards_Sonic_Tiles[];
extern u8 gCharacterCards_Sonic_Layout[];
extern u8 gUnknown_086972F4[];
extern u8 gUnknown_08698BF4[];
extern u16 gCharacterCards_Tails_Palette[];
extern u8 gCharacterCards_Tails_Layout[];
extern u8 gUnknown_0869A9B4[];
extern u8 gUnknown_0869C5F4[];

// TODO: Header
extern const s16 sZoneTimeSecondsTable[];
extern const u16 sZoneTimeMinutesTable[];
extern const u8 gMillisUnpackTable[60 * 2];
extern const u8 gSecondsTable[60 * 2];
extern void sub_805321C(u8 *param0, GameOverB *param1);
extern u8 gCharacterCards_Knuckles_Layout[];
extern u8 gCharacterCards_Tails_Tiles[];
extern u8 gCharacterCards_Knuckles_Tiles[];
extern u16 gCharacterCards_Knuckles_Palette[];

void sub_8060C88(void)
{
    Strc_80528AC gfx;
    s8 *temp_r5;
    s8 *temp_r7;

    UiGfxStackInit();

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 1;
    gfx.tiles = gUnknown_086972F4;
    gfx.tilesSize = 0x1900;
    gfx.layout = gUnknown_08698BF4;
    gfx.layoutSize = 0x500;
    gfx.unk29 = 0x1;
    gfx.unk2A = 0x11;
    gfx.unk0.unk4 = 0;
    gfx.unk0.unk8 = 0;
    gfx.unk0.unk9 = 0;
    gfx.unk0.unkA = 0;
    gfx.unk0.unkB = 0;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = gCharacterCards_Sonic_Tiles;
    gfx.tilesSize = 0x9C0;
    gfx.palette = gCharacterCards_Sonic_Palette;
    gfx.paletteSize = 0x200;
    gfx.layout = gCharacterCards_Sonic_Layout;
    gfx.layoutSize = 0x500;
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_TIMER_DIGITS;
    gfx.unk2B = 2;
    gfx.tiles = gUiGraphics[UIGFX_TIMER_DIGITS].tiles;
    gfx.palette = gUiGraphics[UIGFX_TIMER_DIGITS].palette;
    gfx.tilesSize = 0x580;
    gfx.paletteSize = 0x20;
    gfx.unk28 = 2;
    gfx.vramC = (u8 *)OBJ_VRAM0 + 0x20;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[UIGFX_TIMER_DIGITS].unk8;
    gfx.unk0.unk8 = gUiGraphics[UIGFX_TIMER_DIGITS].unkC;
    gfx.unk0.unk9 = gUiGraphics[UIGFX_TIMER_DIGITS].unk10;
    gfx.unk0.unkA = gUiGraphics[UIGFX_TIMER_DIGITS].unk14;
    gfx.unk0.unkB = gUiGraphics[UIGFX_TIMER_DIGITS].unk18;
    sub_80528AC(&gfx);
}

void CreateTimeAttackRecord(u8 arg0)
{
    s32 temp_r0_2;
    struct Task *t;
    s32 temp_r0_4;
    Sprite *s;
    TimeAttackRecord_E4 *strcE4;
    TimeAttackRecord_58 *strc58;
    s32 index;

    sub_80535FC();
    gDispCnt = 0x1340;
    m4aSongNumStart(MUS_VS_RECORD);
    gBgCntRegs[0] = 0x1D83;
    gBgCntRegs[1] = 0x1886;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    sub_8060C88();

    strcE4 = TASK_DATA(TaskCreate(sub_8061144, sizeof(TimeAttackRecord_E4), 0x2000U, 0U, TaskDestructor_806182C));
    strcE4->unkD4 = 0;
    strcE4->unkDE = 8;
    strcE4->unkD8 = 0;
    strcE4->strc0.unk0 = 0;
    strcE4->strc0.unk2 = 1;
    strcE4->strc0.unk4 = 2;
    strcE4->strc0.unk6 = 0;
    strcE4->strc0.unk8 = 0x100;
    strcE4->strc0.unkA = 8;
    strcE4->unkDC = 0;
    strcE4->unkDD = 0;
    strcE4->unkDF = 0;
    strcE4->unkE0 = arg0;

    s = &strcE4->s;
    s->graphics.dest = OBJ_VRAM0 + 0xC80;
    s->graphics.anim = gUnknown_0868B0D4[arg0 >> 1][0];
    s->variant = gUnknown_0868B0D4[arg0 >> 1][1];
    s->graphics.size = 0;
    s->x = 17;
    s->y = 24;
    s->oamFlags = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &strcE4->s2;
    s->graphics.dest = OBJ_VRAM0 + 0x1900;
    s->graphics.anim = gUnknown_0868B0EC[arg0 & 1][0];
    s->variant = gUnknown_0868B0EC[arg0 & 1][1];
    s->graphics.size = 0;
    s->x = 85;
    s->y = 27;
    s->oamFlags = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &strcE4->s3;
    s->graphics.dest = OBJ_VRAM0 + 0x2580;
    s->graphics.anim = 884;
    s->variant = 2;
    s->graphics.size = 0;
    s->x = 21;
    s->y = 81;
    s->oamFlags = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &strcE4->s4;
    s->graphics.dest = OBJ_VRAM0 + 0x3200;
    s->graphics.anim = SA1_ANIM_MENU_CURSOR;
    s->variant = 0;
    s->graphics.size = 0;
    s->x = 20;
    s->y = 80;
    s->oamFlags = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    t = TaskCreate(sub_8061480, sizeof(TimeAttackRecord_58), 0x2030U, 0U, NULL);
    strc58 = TASK_DATA(t);
    strc58->unk4C = 0;
    strc58->overB.qUnkA = 0;
    strc58->overB.unkC = 0;
    strc58->overB.unkE = 0;
    strc58->overB.unk10 = 2;
    strc58->overB.unk12 = 2;
    strc58->overB.unk16 = 1;
    strc58->overB.unk8 = 0;
    strc58->unk48 = 0;
    strc58->unk50 = 0;
    strc58->unk52 = 0;
    strc58->unk53 = 0;
    strc58->unk54 = arg0;
    strcE4->taskCC = t;

    t = TaskCreate(Task_8061830, sizeof(TimeAttackRecord_58), 0x2080U, 0U, NULL);
    strc58 = TASK_DATA(t);
    strc58->unk4C = 0;
    strc58->unk48 = 0;
    strc58->unk50 = 0;
    strc58->unk52 = 0;
    strc58->unk53 = 0;
    strc58->unk54 = arg0;
    strcE4->taskD0 = t;

    s = &strc58->s;
    s->graphics.dest = OBJ_VRAM0 + 0x8E0;
    s->graphics.anim = 0x371;
    s->variant = 8;
    s->graphics.size = 0;
    s->x = 20;
    s->y = 61;
    s->oamFlags = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    sub_805423C(&strcE4->strc0);
    m4aSongNumStartOrContinue(MUS_VS_RECORD);
}

// (87.95%) https://decomp.me/scratch/Bkzoh
NONMATCH("asm/non_matching/game/sa1/ui/time_attack_record__sub_8061144.inc", void sub_8061144())
{
    u32 var_r7 = 0;
    u8 sp0 = 0;
    s16 *temp_r2_6;
    s32 *temp_r0_3;
    s32 *temp_r2;
    u32 temp_r1;
    s32 temp_r2_5;
    s32 temp_sb;
    s8 temp_r1_2;
    TimeAttackRecord_58 *temp_r0;
    TimeAttackRecord_58 *temp_r0_2;
    u8 *temp_r2_2;
    u8 *temp_r2_3;
    u8 *temp_r2_4;
    u8 *temp_r3;
    u8 *var_r4;
    u8 temp_r0_4;
    u8 var_r1;
    u16 var_r3;
    u16 *var_r2;

    TimeAttackRecord_E4 *strcE4 = TASK_DATA(gCurTask);

    temp_r0 = TASK_DATA(strcE4->taskCC);
    temp_r0_2 = TASK_DATA(strcE4->taskD0);
    temp_r2 = &strcE4->unkD8;
    temp_r0_3 = &strcE4->unkD4;
    temp_r1 = *temp_r2;

    temp_sb = *temp_r0_3 + 1;
    *temp_r0_3 = temp_sb;
    temp_r0->unk48 = temp_sb;
    temp_r0_2->unk48 = temp_sb;
    *temp_r2 = temp_r1;
    temp_r0->unk4C = temp_r1;
    temp_r0_2->unk4C = temp_r1;

    if (strcE4->unkDE == 0 && strcE4->unkDF == 0) {
        if (0x10 & gRepeatedKeys) {
            m4aSongNumStart(0x6CU);
            strcE4->unkDE = 2;
            temp_r2_2 = &strcE4->unkDC;
            strcE4->unkDD = strcE4->unkDC;
            strcE4->unkDC = (strcE4->unkDC + 1) & 3;
            m4aSongNumStart(0x6CU);
        } else if (0x20 & gRepeatedKeys) {
            m4aSongNumStart(0x6CU);
            strcE4->unkDE = 2;

            strcE4->unkDD = strcE4->unkDC;
            strcE4->unkDC = (strcE4->unkDC - 1) & 3;
            m4aSongNumStart(0x6CU);
        }

        if (2 & gPressedKeys) {
            m4aSongNumStart(0x6BU);
            strcE4->unkDF = 1;
            strcE4->strc0.unk4 = 1;
            strcE4->strc0.unk6 = 0x2000 - (u16)strcE4->strc0.unk6;
            m4aSongNumStart(0x6BU);
        }
    } else {
        temp_r0_4 = strcE4->unkDE;
        if (temp_r0_4 != 0) {
            strcE4->unkDE = (u8)(temp_r0_4 - 1);
        }
    }
    sub_805423C(&strcE4->strc0);
    temp_r0->unk52 = strcE4->unkDE;
    temp_r0_2->unk52 = strcE4->unkDE;
    temp_r3 = &strcE4->unkDD;
    temp_r0->unk51 = strcE4->unkDD;
    temp_r0->unk50 = strcE4->unkDC;
    temp_r0_2->unk51 = strcE4->unkDD;
    temp_r0_2->unk50 = strcE4->unkDC;
    if ((strcE4->unkDF != 0) && ((s32)strcE4->strc0.unk6 > 0x1800) && (strcE4->strc0.unk4 == 1)) {
        gFlags &= ~4;
        m4aSongNumStop(0xAU);
        gDispCnt &= 0x1FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        TaskDestroy(strcE4->taskCC);
        TaskDestroy(strcE4->taskD0);
        TaskDestroy(gCurTask);
        CreateCourseSelect(1U);
        return;
    }

    var_r3 = temp_sb;
    gFlags |= 4;
    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 4;
    {
        var_r2 = gBgOffsetsHBlankPrimary;
        for (var_r7; var_r7 < DISPLAY_HEIGHT; var_r7++) {
            for (var_r1 = 0; var_r7 < DISPLAY_HEIGHT && var_r1 < 24; var_r1++) {
                *var_r2++ = (s16)(var_r3 & 0x1FF);
                *var_r2++ = 0;
                var_r7 = (u32)(u8)(var_r7 + 1);
            }
            temp_r1_2 = (s8)sp0;
            var_r3 = (0 - (var_r3 + temp_r1_2));
            sp0 = (0 - temp_r1_2);
        }
    }
    sub_80613D0();
}
END_NONMATCH

void sub_80613D0()
{
    Sprite *s;
    u8 temp_r0;
    u8 offsetX;

    TimeAttackRecord_E4 *strcE4 = TASK_DATA(gCurTask);

    s = &strcE4->s;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &strcE4->s2;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &strcE4->s3;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &strcE4->s4;
    UpdateSpriteAnimation(s);

    temp_r0 = Div(strcE4->unkD4, 10);
    s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    offsetX = gUnknown_0868B0F4[temp_r0 % 8u];
    s->x = offsetX + 15;
    DisplaySprite(s);
    s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    s->x = DISPLAY_WIDTH - (offsetX + 15);
    DisplaySprite(s);
}

// (96.12%) https://decomp.me/scratch/l6XXR
NONMATCH("asm/non_matching/game/sa1/ui/time_attack_record__sub_8061480.inc", void sub_8061480())
{
    Strc_80528AC gfx;
    u8 sp30[8];
    TimeAttackRecord_58 *strc58;
    u8 sp3C;
    s32 temp_r0;
    s32 temp_r0_2;
    s32 temp_r2_2;
    s32 temp_r4_3;
    u8 var_r7_2;
    s8 *var_r7;
    TimeRecord temp_r5_4;
    u8 *var_r0;

    strc58 = TASK_DATA(gCurTask);

    if (strc58->unk52 < 2) {
        sp3C = strc58->unk50;
    } else {
        sp3C = strc58->unk51;
    }

    if (strc58->unk52 == 1) {
        UiGfxStackInit();
        if (strc58->unk50 == 0) {
            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 1;
            gfx.tiles = gUnknown_086972F4;
            gfx.tilesSize = 0x1900;
            gfx.layout = gUnknown_08698BF4;
            gfx.layoutSize = 0x500;
            gfx.unk29 = 1;
            gfx.unk2A = 0x11;
            gfx.unk0.unk4 = 0;
            gfx.unk0.unk8 = 0;
            gfx.unk0.unk9 = 0;
            gfx.unk0.unkA = 0;
            gfx.unk0.unkB = 0;
            sub_80528AC(&gfx);

            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 0;
            gfx.tiles = gCharacterCards_Sonic_Tiles;
            gfx.tilesSize = 0x9C0;
            gfx.palette = gCharacterCards_Sonic_Palette;
            gfx.paletteSize = 0x200;
            gfx.layout = gCharacterCards_Sonic_Layout;
            gfx.layoutSize = 0x500;
            gfx.unk28 = 0;
            gfx.unk29 = 0;
            gfx.unk2A = 0x15;
            sub_80528AC(&gfx);
        } else if (strc58->unk50 == 1) {
            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 1;
            gfx.tiles = gUnknown_0869A9B4;
            gfx.tilesSize = 0x1C40;
            gfx.layout = gUnknown_0869C5F4;
            gfx.layoutSize = 0x500;
            gfx.unk29 = 1;
            gfx.unk2A = 0x11;
            gfx.unk0.unk4 = 0;
            gfx.unk0.unk8 = 0;
            gfx.unk0.unk9 = 0;
            gfx.unk0.unkA = 0;
            gfx.unk0.unkB = 0;
            sub_80528AC(&gfx);

            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 0;
            gfx.tiles = gCharacterCards_Tails_Tiles;
            gfx.tilesSize = 0x680;
            gfx.palette = gCharacterCards_Tails_Palette;
            gfx.paletteSize = 0x200;
            gfx.layout = gCharacterCards_Tails_Layout;
            gfx.layoutSize = 0x500;
            gfx.unk28 = 0;
            gfx.unk29 = 0;
            gfx.unk2A = 0x15;
            sub_80528AC(&gfx);
        } else if (strc58->unk50 == 2) {
            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 1;
            gfx.tiles = gUnknown_08690574;
            gfx.tilesSize = 0x1800;
            gfx.layout = gUnknown_08691D74;
            gfx.layoutSize = 0x500;
            gfx.unk29 = 1;
            gfx.unk2A = 0x11;
            gfx.unk0.unk4 = 0;
            gfx.unk0.unk8 = 0;
            gfx.unk0.unk9 = 0;
            gfx.unk0.unkA = 0;
            gfx.unk0.unkB = 0;
            sub_80528AC(&gfx);

            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 0;
            gfx.tiles = gCharacterCards_Knuckles_Tiles;
            gfx.tilesSize = 0x7C0;
            gfx.palette = gCharacterCards_Knuckles_Palette;
            gfx.paletteSize = 0x200;
            gfx.layout = gCharacterCards_Knuckles_Layout;
            gfx.layoutSize = 0x500;
            gfx.unk28 = 0;
            gfx.unk29 = 0;
            gfx.unk2A = 0x15;
            sub_80528AC(&gfx);
        } else {
            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 1;
            gfx.tiles = gUnknown_08693974;
            gfx.tilesSize = 0x1880;
            gfx.layout = gUnknown_086951F4;
            gfx.layoutSize = 0x500;
            gfx.unk29 = 1;
            gfx.unk2A = 0x11;
            gfx.unk0.unk4 = 0;
            gfx.unk0.unk8 = 0;
            gfx.unk0.unk9 = 0;
            gfx.unk0.unkA = 0;
            gfx.unk0.unkB = 0;
            sub_80528AC(&gfx);

            gfx.uiGfxID = UIGFX_OPTIONS;
            gfx.unk2B = 0;
            gfx.tiles = gCharacterCards_Amy_Tiles;
            gfx.tilesSize = 0x4C0;
            gfx.palette = gCharacterCards_Amy_Palette;
            gfx.paletteSize = 0x200;
            gfx.layout = gCharacterCards_Amy_Layout;
            gfx.layoutSize = 0x500;
            gfx.unk28 = 0;
            gfx.unk29 = 0;
            gfx.unk2A = 0x15;
            sub_80528AC(&gfx);
        }
    }

    for (var_r7_2 = 0; var_r7_2 < 3; var_r7_2++) {
        struct TimeRecords *records = &LOADED_SAVE->timeRecords;
        strc58->overB.unkE = 1;
        sp30[0] = var_r7_2 + 0x21;
        strc58->overB.qUnkA = 0x2C;
        strc58->overB.unkC = (var_r7_2 << 4) + 92;
        sub_805321C(sp30, &strc58->overB);
        strc58->overB.unkE = 7;
        strc58->overB.qUnkA = 0x54;
        strc58->overB.unkC = (var_r7_2 << 4) + 92;
        temp_r5_4 = records->table[sp3C][strc58->unk54][var_r7_2];
        if (temp_r5_4 >= MAX_COURSE_TIME) {
            sp30[6] = 0x29U;
            sp30[5] = 0x29U;
            sp30[3] = 0x29U;
            sp30[2] = 0x25U;
            sp30[0] = 0x29;
        } else {
            temp_r0 = Div(temp_r5_4, 60);
            temp_r0_2 = Div(temp_r0, 60);
            temp_r4_3 = (temp_r0 - sZoneTimeSecondsTable[temp_r0_2]);
            temp_r2_2 = ((temp_r5_4 - sZoneTimeSecondsTable[temp_r4_3]) - sZoneTimeMinutesTable[temp_r0_2]);

            sp30[6] = gMillisUnpackTable[temp_r2_2 * 2 + 1];
            sp30[5] = gMillisUnpackTable[temp_r2_2 * 2 + 0];
            sp30[3] = gSecondsTable[temp_r4_3 * 2 + 1];
            sp30[2] = gSecondsTable[temp_r4_3 * 2 + 0];
            sp30[0] = gSecondsTable[temp_r0_2 + 1];
        }
        sp30[1] = 0x2A;
        sp30[4] = 0x2A;
        sub_805321C(sp30, &strc58->overB);
    }
}
END_NONMATCH

void TaskDestructor_806182C(struct Task *t) { }

void Task_8061830()
{
    s32 index;

    TimeAttackRecord_58 *strc58 = TASK_DATA(gCurTask);
    Sprite *s = &strc58->s;

    if (strc58->unk52 < 2) {
        index = strc58->unk50;
    } else {
        index = strc58->unk51;
    }

    s->graphics.anim = gUnknown_0868B0FC[index][0];
    s->variant = gUnknown_0868B0FC[index][1];
    s->prevVariant = -1;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
