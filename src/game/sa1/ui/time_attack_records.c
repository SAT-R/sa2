#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "data/sa1/ui_graphics.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/globals.h"
#include "game/sa1/save.h"
#include "game/shared/stage/stage.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/characters.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/text.h"
#include "constants/sa1/zones.h"

/* These are the records appearing after selecting / before starting to play a stage */

typedef struct {
    const u8 *tiles;
    s32 tilesSize;
    const u16 *palette;
    const u8 *layout;
} CharacterCard;

typedef struct {
    /* 0x00 */ Sprite sprites[3];
    /* 0x90 */ Sprite s3;
    /* 0xC0 */ GameOverB overB;
    /* 0xD8 */ StrcUi_805423C strcD8;
    /* 0xE4 */ u8 unkE4[3][8];
    /* 0xFC */ s8 unkFC[0x4];
    /* 0x100 */ s32 qUnkY;
    /* 0x100 */ s32 unk104;
    /* 0x100 */ s32 unk108;
    /* 0x100 */ s32 unk10C;
    /* 0x110 */ void *vram110;
} TimeAttackRecords; /* 0x114 */

void TimeAttackRecordsInitUI(u8 *vram);
void Task_806BBC0(void);
void sub_806BD24(void);
void sub_806BF04(void);
void sub_806BDC4(u8 rankIndex, struct Task *t);
void TaskDestructor_806BF38(struct Task *t);

extern u16 gUnknown_086CC774[16];
extern u8 gUnknown_086CC794[0xA0];
extern u8 gUnknown_086CC834[0x500];

extern const u16 gCharacterCards_Sonic_Palette[];
extern const u8 gCharacterCards_Sonic_Tiles[0x09C0];
extern const u8 gCharacterCards_Sonic_Layout[];
extern const u16 gUnknown_086967B4[];
extern const u8 gUnknown_086969B4[];
extern const u8 gUnknown_08696BF4[];
extern const u16 gCharacterCards_Tails_Palette[];
extern const u8 gCharacterCards_Tails_Tiles[0x680];
extern const u8 gCharacterCards_Tails_Layout[];
extern const u16 gUnknown_08699E74[];
extern const u8 gUnknown_0869A074[];
extern const u8 gUnknown_0869A2B4[];
extern const u16 gCharacterCards_Knuckles_Palette[];
extern const u8 gCharacterCards_Knuckles_Tiles[0x0800];
extern const u8 gCharacterCards_Knuckles_Layout[];
extern const u16 gUnknown_0868FA34[];
extern const u8 gUnknown_0868FC34[];
extern const u8 gUnknown_0868FE74[];
extern const u16 gCharacterCards_Amy_Palette[];
extern const u8 gCharacterCards_Amy_Tiles[0x4C0];
extern const u8 gCharacterCards_Amy_Layout[];
extern const u16 gUnknown_08692E34[];
extern const u8 gUnknown_08693034[];
extern const u8 gUnknown_08693274[];
const CharacterCard gCharacterCards[NUM_CHARACTERS][2] = {
    [CHARACTER_SONIC] = {
        {gCharacterCards_Sonic_Tiles, sizeof(gCharacterCards_Sonic_Tiles), gCharacterCards_Sonic_Palette, gCharacterCards_Sonic_Layout},
        {gUnknown_086969B4, 0x500, gUnknown_086967B4, gUnknown_08696BF4},
    },
    {
        {gCharacterCards_Tails_Tiles, sizeof(gCharacterCards_Tails_Tiles), gCharacterCards_Tails_Palette, gCharacterCards_Tails_Layout },
        {gUnknown_0869A074, 0x500, gUnknown_08699E74, gUnknown_0869A2B4},
    },
    {
        {gCharacterCards_Knuckles_Tiles, sizeof(gCharacterCards_Knuckles_Tiles), gCharacterCards_Knuckles_Palette, gCharacterCards_Knuckles_Layout },
        {gUnknown_0868FC34, 0x500, gUnknown_0868FA34, gUnknown_0868FE74},
    },
    {
        {gCharacterCards_Amy_Tiles, sizeof(gCharacterCards_Amy_Tiles), gCharacterCards_Amy_Palette, gCharacterCards_Amy_Layout },
        {gUnknown_08693034, 0x500, gUnknown_08692E34, gUnknown_08693274},
    },
};
extern u16 gUnknown_0868B814[NUM_TIME_ATTACK_ZONES][3];
extern u16 gUnknown_0868B838[ACTS_PER_ZONE][3];
extern u16 gUnknown_0868B844[UILANG_COUNT][12][3];

extern const s16 sZoneTimeSecondsTable[];
extern const u16 sZoneTimeMinutesTable[];
extern const u8 gSecondsTable[60 * 2];
extern const u8 gMillisUnpackTable[60 * 2];

void TimeAttackRecordsInitUI(u8 *vram)
{
    Strc_80528AC gfx;

    gfx.uiGfxID = UIGFX_TIMER_DIGITS;
    gfx.unk2B = 1;
    gfx.tiles = gUiGraphics[gfx.uiGfxID].tiles;
    gfx.palette = gUiGraphics[gfx.uiGfxID].palette;
    gfx.tilesSize = 0x580;
    gfx.paletteSize = (16 * sizeof(u16));
    gfx.unk28 = 6;
    gfx.vramC = vram;
    gfx.unk2A = 0xD;
    gfx.unk0.unk4 = gUiGraphics[gfx.uiGfxID].unk8;
    gfx.unk0.unk8 = gUiGraphics[gfx.uiGfxID].unkC;
    gfx.unk0.unk9 = gUiGraphics[gfx.uiGfxID].unk10;
    gfx.unk0.unkA = gUiGraphics[gfx.uiGfxID].unk14;
    gfx.unk0.unkB = gUiGraphics[gfx.uiGfxID].unk18;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 0;
    gfx.tiles = gCharacterCards[gSelectedCharacter][1].tiles;
    gfx.tilesSize = gCharacterCards[gSelectedCharacter][1].tilesSize;
    gfx.palette = gCharacterCards[gSelectedCharacter][1].palette;
    gfx.paletteSize = (256 * sizeof(u16));
    gfx.layout = gCharacterCards[gSelectedCharacter][1].layout;
    gfx.layoutSize = 0x600;
    gfx.unk28 = 0;
    gfx.unk29 = 1;
    gfx.unk2A = 0x11;
    sub_80528AC(&gfx);

    gfx.uiGfxID = UIGFX_OPTIONS;
    gfx.unk2B = 2;
    gfx.tiles = gCharacterCards[gSelectedCharacter][0].tiles;
    gfx.tilesSize = gCharacterCards[gSelectedCharacter][0].tilesSize;
    gfx.palette = gCharacterCards[gSelectedCharacter][0].palette;
    gfx.paletteSize = (256 * sizeof(u16));
    gfx.layout = gCharacterCards[gSelectedCharacter][0].layout;
    gfx.layoutSize = 0x600;
    gfx.unk28 = 0;
    gfx.unk29 = 0;
    gfx.unk2A = 0x15;
    sub_80528AC(&gfx);
}

void CreateTimeAttackRecords()
{
    struct Task *t;
    GameOverB *temp_r4;
    Sprite *s;
    StrcUi_805423C *temp_r2;
    u8 i;
    void *vram;

    TimeAttackRecords *recs;

    sub_80535FC();
    UiGfxStackInit();
    gDispCnt = 0x1340;
    gBgCntRegs[0] = 0x1E83;
    gBgCntRegs[1] = 0x1C86;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;
    vram = VramMalloc(44);
    TimeAttackRecordsInitUI(vram);

    t = TaskCreate(Task_806BBC0, sizeof(TimeAttackRecords), 0x2000U, 0U, TaskDestructor_806BF38);
    recs = TASK_DATA(t);
    temp_r2 = &recs->strcD8;
    recs->unk104 = 0;
    recs->unk108 = 0;
    recs->unk10C = 0;
    recs->vram110 = vram;
    recs->unkFC[0] = 0x21;
    recs->unkFC[1] = 0x22;
    recs->unkFC[2] = 0x23;

    s = &recs->sprites[0];
    s->graphics.dest = VramMalloc(gUnknown_0868B814[LEVEL_TO_ZONE(gCurrentLevel)][0]);
    s->graphics.anim = gUnknown_0868B814[LEVEL_TO_ZONE(gCurrentLevel)][1];
    s->variant = gUnknown_0868B814[LEVEL_TO_ZONE(gCurrentLevel)][2];
    s->x = 25;
    s->y = 24;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &recs->sprites[1];
    s->graphics.dest = VramMalloc(gUnknown_0868B838[ACT_INDEX(gCurrentLevel)][0]);
    s->graphics.anim = gUnknown_0868B838[ACT_INDEX(gCurrentLevel)][1];
    s->variant = gUnknown_0868B838[ACT_INDEX(gCurrentLevel)][2];
    s->x = 93;
    s->y = 27;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &recs->sprites[2];
    s->graphics.dest = VramMalloc(0xCU);
    s->graphics.anim = SA1_ANIM_MP_ACT_MSG_EN;
    s->variant = 2;
    s->x = 25;
    s->y = 80;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    s = &recs->s3;
    s->graphics.dest = VramMalloc(gUnknown_0868B844[LOADED_SAVE->uiLanguage][gCurrentLevel][0]);
    s->graphics.anim = gUnknown_0868B844[LOADED_SAVE->uiLanguage][gCurrentLevel][1];
    s->variant = gUnknown_0868B844[LOADED_SAVE->uiLanguage][gCurrentLevel][2];
    recs->qUnkY = -Q(90);
    s->x = -90;
    s->y = 48;
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->oamFlags = 0x480;
    s->frameFlags = 0x2000;
    UpdateSpriteAnimation(s);

    temp_r4 = &recs->overB;
    temp_r4->qUnkA = 0xF0;
    temp_r4->unkC = 0x8C;
    temp_r4->unkE = 8;
    temp_r4->unk10 = 1;
    temp_r4->unk12 = 6;
    temp_r4->unk16 = 1;
    temp_r4->unk8 = 0x18;

    for (i = 0; i < 3; i++) {
        sub_806BDC4(i, t);
    }

    temp_r2->unk0 = 0;
    temp_r2->unk2 = 1;
    temp_r2->unk4 = 2;
    temp_r2->unk6 = 0;
    temp_r2->unk8 = 0x100;
    temp_r2->unkA = 0x10;
    sub_805423C(temp_r2);

    m4aSongNumStartOrContinue(MUS_COURSE_SELECTION);
}

// (92.00%) https://decomp.me/scratch/vEl3F
NONMATCH("asm/non_matching/game/sa1/ui/time_attack_records__Task_806BBC0.inc", void Task_806BBC0())
{
    StrcUi_805423C *temp_r1;
    s16 *temp_r2_2;
    u16 var_r3;
    s32 *temp_r0;
    s32 temp_r1_2;
    s32 temp_r2;
    u32 var_r1;
    u32 var_r7;
    winreg_t *var_r2;

    u8 var_r6 = 0;
    s8 sp0 = 0;
    u32 var_ip = DISPLAY_HEIGHT;
    s8 var_r4 = 0;
    s32 temp_sb = 0;
    TimeAttackRecords *recs = TASK_DATA(gCurTask);

    temp_r1 = &recs->strcD8;
    var_r7 = recs->unk104;
    var_r7++;
    temp_r2 = recs->unk108;
    temp_r2++;
    recs->unk108 = temp_r2;
    if (var_r7 > 0xF0U) {
        gFlags &= ~4;
        m4aSongNumStop(4U);
        gDispCnt &= 0x1FFF;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
        TaskDestroy(gCurTask);
        ApplyGameStageSettingsAndStart();
        return;
    }
    if (var_r7 == 0xD0) {
        temp_r1->unk4 = 1;
        temp_r1->unk6 = 0;
    } else if ((3 & gPressedKeys) && (var_r7 > 0x20U) && (var_r7 <= 0xCFU)) {
        var_r7 = 0xCF;
    }
    var_r3 = 0xFF & temp_r2;
    gFlags |= 4;
    gHBlankCopyTarget = (void *)&REG_BG0HOFS;
    gHBlankCopySize = 4;
    var_r2 = (void *)&((u32 *)gBgOffsetsHBlankPrimary)[var_r6];

    while (var_r6 < var_ip) {
        for (var_r1 = 0; var_r1 < 24 && (var_r6 < var_ip); var_r6++, var_r1++) {
            *var_r2++ = (var_r3 & 0x1FF);
            *var_r2++ = temp_sb;
        }
        var_r3 = (-(var_r3 + var_r4));
        var_r4 = -var_r4;
    };
    recs->unk104 = (s32)var_r7;
    sub_805423C(temp_r1);
    sub_806BF04();
    sub_806BD24();
}
END_NONMATCH

void sub_806BD24()
{
    GameOverB *overB;
    Sprite *s;
    s16 temp_r0_2;
    s32 temp_r0;
    u8 i;

    TimeAttackRecords *recs = TASK_DATA(gCurTask);

    overB = &recs->overB;
    for (i = 0; i < 3; i++) {
        s = &recs->sprites[i];
        DisplaySprite(s);
    }
    s = &recs->s3;
    s->x = I(recs->qUnkY);
    while (s->x < 500) {
        DisplaySprite(s);
        s->x += 200;
    }

    for (i = 0; i < 3; i++) {
        overB->unkE = 1;
        overB->qUnkA = 0x2C;
        overB->unkC = (i * 0x10) + 0x5C;
        sub_8052F78((const char *)&recs->unkFC[i], overB);

        overB->unkE = 7;
        overB->qUnkA = 0x50;
        sub_8052F78((const char *)&recs->unkE4[i][0], overB);
    }
}

void sub_806BDC4(u8 rankIndex, struct Task *t)
{
    s32 temp_r0_2;
    s32 temp_r2;
    s32 temp_r4;
    u32 temp_r6;

    TimeAttackRecords *recs = TASK_DATA(t);

    temp_r6 = LOADED_SAVE->timeRecords.table[gSelectedCharacter][gCurrentLevel][rankIndex];
    if (temp_r6 >= MAX_COURSE_TIME) {
        recs->unkE4[rankIndex][6] = 0x29;
        recs->unkE4[rankIndex][5] = 0x29;
        recs->unkE4[rankIndex][3] = 0x29;
        recs->unkE4[rankIndex][2] = 0x25;
        recs->unkE4[rankIndex][0] = 0x29;
    } else {
        temp_r4 = Div(temp_r6, 60);
        temp_r0_2 = Div(temp_r4, 60);
        temp_r4 = (temp_r4 - sZoneTimeSecondsTable[temp_r0_2]);
        temp_r2 = ((temp_r6 - sZoneTimeSecondsTable[temp_r4]) - sZoneTimeMinutesTable[temp_r0_2]) * 2;

        recs->unkE4[rankIndex][6] = gMillisUnpackTable[temp_r2 + 1];
        recs->unkE4[rankIndex][5] = gMillisUnpackTable[temp_r2 + 0];
        recs->unkE4[rankIndex][3] = gSecondsTable[temp_r4 * 2 + 1];
        recs->unkE4[rankIndex][2] = gSecondsTable[temp_r4 * 2 + 0];
        recs->unkE4[rankIndex][0] = gSecondsTable[temp_r0_2 * 2 + 1];
    }
    recs->unkE4[rankIndex][1] = 0x2A;
    recs->unkE4[rankIndex][4] = 0x2A;
}

void sub_806BF04(void)
{
    TimeAttackRecords *recs = TASK_DATA(gCurTask);
    recs->qUnkY -= Q(2);

    if (recs->qUnkY < -Q(200)) {
        recs->qUnkY += Q(200);
    }
}

void TaskDestructor_806BF38(struct Task *t)
{
    TimeAttackRecords *recs = TASK_DATA(t);

    VramFree(recs->sprites[0].graphics.dest);
    VramFree(recs->sprites[1].graphics.dest);
    VramFree(recs->sprites[2].graphics.dest);
    VramFree(recs->s3.graphics.dest);
    VramFree(recs->vram110);
}