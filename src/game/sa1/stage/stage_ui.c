#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"
#include "data/sa1/ui_graphics.h"
#include "game/shared/stage/player.h"
#include "game/globals.h"
#include "game/sa1/special_stage/main.h"
#include "game/sa1/stage/ui_rendering.h"
#include "game/shared/stage/mp_player.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/stage_ui.h"
#include "game/shared/stage/water_effects.h"

#include "constants/sa1/songs.h"
#include "constants/sa1/ui_graphics.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/zones.h"

extern void InitWaterPalettes(void); // TODO: Move to correct Header!

void StageUI_DrawTimer(u32 courseTime);
void sub_8053BAC(void);
void Task_8055458(void);
void Task_8055730(void);
void Task_8055798(void);
void Task_8055904(void);
void Task_8055998(void);
void Task_8055AA0(void);
void Task_8055B18(void);
void TaskDestructor_8055C38(struct Task *);
void TaskDestructor_StrcUI28_8055C4C(struct Task *);

extern const char gUnknown_0865F174[];
extern const char gUnknown_0865F178[];

#if 0
// NOTE: In SA2 gMillisUnpackTable and gSecondsTable are stored as their literal values.
//       ( '{5, 9}' instead of 'UI_DIGIT(5), UI_DIGIT(9)' )
extern const u8 gMillisUnpackTable[60 * 2] = {
    {UI_DIGIT(0), UI_DIGIT(0)},
    {UI_DIGIT(0), UI_DIGIT(2)},
    {UI_DIGIT(0), UI_DIGIT(3)},
    /* ... */
    {UI_DIGIT(9), UI_DIGIT(8)},
};

// TODO: Rename gSecondsTable -> gSecondsUnpackTable in SA1, SA2 and (if it exists) SA3!
extern const u8 gSecondsTable[60 * 2] = {
    {UI_DIGIT(0), UI_DIGIT(0)},
    {UI_DIGIT(0), UI_DIGIT(1)},
    {UI_DIGIT(0), UI_DIGIT(2)},
    /* ... */
    {UI_DIGIT(5), UI_DIGIT(9)},
};
#else
extern const u8 gMillisUnpackTable[60 * 2];
extern const u8 gSecondsTable[60 * 2];
#endif
extern const s16 sZoneTimeSecondsTable[];
extern const u16 sZoneTimeMinutesTable[];

void CreateStageUI(void);
void Task_StageUIMain(void);
void Task_SpecialStageUIMain(void);
void CreateChaoHuntHUD(void);

// (98.15%) https://decomp.me/scratch/LupqY
NONMATCH("asm/non_matching/game/sa1/stage/stage_ui__Task_StageUIMain.inc", void Task_StageUIMain(void))
{
    StageUI *ui;
    GameOverB overB;
    s32 remainder;
    s32 remainder0;
    StageUI_10 *unk10_A;
    s32 i;
    u8 *ptr;
    s32 digitLives;
    u8 lives;

    overB.qUnkA = -2;
    overB.unkC = -1;
    overB.unkE = 1;
    overB.unk8 = 24;
    overB.unk10 = 3;
    overB.unk12 = 6;
    overB.unk16 = 1;

    sub_80530CC((const char *)&gUnknown_0865F178[0], &overB);

    if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
        // Lives Character Icon
        overB.unkC = DISPLAY_HEIGHT - 16;
        overB.qUnkA = 2;
        overB.unk10 = 1;

        overB.unk12 = gSelectedCharacter;
        sub_80530CC((const char *)&gUnknown_0865F178[0], &overB);
    }

    ui = TASK_DATA(gCurTask);

    if (gRingCount > 999) {
        ui->digitsRings[0] = UI_DIGIT(9);
        ui->digitsRings[1] = UI_DIGIT(9);
        ui->digitsRings[2] = UI_DIGIT(9);
    } else {
        remainder = gRingCount;

        for (i = 0; i < 3; i++) {
            remainder0 = Div(remainder, 10);

            //          ui->digitsRings[2 - i] = UI_DIGIT(remainder - (remainder0 * 10));
            ui->digitsRings[2 - i] = UI_DIGIT(remainder - ((remainder0 << 3) + (remainder0 << 1)));

            remainder = remainder0;
        }
    }
    // _0805379C

    TASK_SET_MEMBER(StageUI, gCurTask, u16, ringCount, gRingCount);

    (&TASK_GET_MEMBER(StageUI, gCurTask, StageUI_10, unk10))->unk9 = 0;

    remainder = gLevelScore;

    for (i = 8; i >= 0; i--) {
#ifdef BUG_FIX
        // How did this even happen?
        if (i >= ARRAY_COUNT(ui->digitsRings)) {
            continue;
        }
#endif
        remainder0 = Div(remainder, 10);

        ui->digitsRings[i] = UI_DIGIT(remainder - ((remainder0 << 3) + (remainder0 << 1)));

        remainder = remainder0;
    }

    StageUI_DrawTimer(gCourseTime);

    ptr = &TASK_GET_MEMBER(StageUI, gCurTask, u8, digitLives);
    if (gNumLives > 9) {
        digitLives = UI_DIGIT(9);
    } else if (gNumLives != 0) {
        digitLives = UI_DIGIT(gNumLives - 1);
    } else {
        digitLives = UI_DIGIT(0);
    }
    *ptr = digitLives;

    sub_8053BAC();

    if ((LOADED_SAVE->timeLimitDisabled != TRUE) || (gGameMode != GAME_MODE_SINGLE_PLAYER)) {
        if (gStageFlags & STAGE_FLAG__TIMER_REVERSED) {
            if (gCourseTime < TIMER_WARNING_BEGIN) {
                if ((Mod(gCourseTime, 60) == 0) && (gCourseTime != 0)) {
                    m4aSongNumStart(SE_TIMER);
                }
            }
        } else {
            if (gCourseTime > (MAX_COURSE_TIME - TIMER_WARNING_BEGIN)) {
                if ((Mod(gCourseTime, 60) == 0) && (gCourseTime < MAX_COURSE_TIME)) {
                    m4aSongNumStart(SE_TIMER);
                }
            }
        }
    }
}
END_NONMATCH

void sub_80538BC(void)
{
    Strc_80528AC sp00;
    const UiGraphics *gfx;

    sp00.uiGfxID = UIGFX_ASCII_CHARS;
    sp00.unk2B = 0;

    gfx = &gUiGraphics[UIGFX_ASCII_CHARS];
    sp00.tiles = gfx->tiles + 224 * TILE_SIZE_4BPP;
    sp00.palette = gfx->palette;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_D;
    sp00.tilesSize = 22 * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gfx->unk8;
    sp00.unk0.unk8 = gfx->unkC;
    sp00.unk0.unk9 = gfx->unk10;
    sp00.unk0.unkA = gfx->unk14;
    sp00.unk0.unkB = gfx->unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_ASCII_CHARS;
    sp00.unk2B = 0;
    sp00.tiles = gfx->tiles + 32 * TILE_SIZE_4BPP;
    sp00.palette = gfx->palette;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_C;
    sp00.tilesSize = 22 * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.unk2A = 9;
    sp00.unk0.unk4 = gfx->unk8;
    sp00.unk0.unk8 = gfx->unkC;
    sp00.unk0.unk9 = gfx->unk10;
    sp00.unk0.unkA = gfx->unk14;
    sp00.unk0.unkB = gfx->unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_UI_ICON_SONIC + gSelectedCharacter;
    sp00.unk2B = 1;
    sp00.tiles = gUiGraphics[sp00.uiGfxID].tiles;
    sp00.palette = gUiGraphics[sp00.uiGfxID].palette;
    sp00.tilesSize = (2 * 2) * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = gSelectedCharacter;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_A;
    sp00.unk2A = 9;
    sp00.unk0.unk4 = gUiGraphics[sp00.uiGfxID].unk8;
    sp00.unk0.unk8 = gUiGraphics[sp00.uiGfxID].unkC;
    sp00.unk0.unk9 = gUiGraphics[sp00.uiGfxID].unk10;
    sp00.unk0.unkA = gUiGraphics[sp00.uiGfxID].unk14;
    sp00.unk0.unkB = gUiGraphics[sp00.uiGfxID].unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_UI_ICON_RING;
    sp00.unk2B = 3;
    sp00.tiles = gUiGraphics[UIGFX_UI_ICON_RING].tiles;
    sp00.palette = gUiGraphics[UIGFX_UI_ICON_RING].palette;
    sp00.tilesSize = (4 * 4) * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_B;
    sp00.unk2A = 9;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_UI_ICON_RING].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_UI_ICON_RING].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_UI_ICON_RING].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_UI_ICON_RING].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_UI_ICON_RING].unk18;
    sub_80528AC(&sp00);
}

void StageUI_DrawTimer(u32 courseTime)
{
    StageUI *ui = TASK_DATA(gCurTask);
    StageUI_20 *unk20 = &ui->unk20;

    // Offset to red digits in VRAM, when "TIME UP" enabled
    s16 redOffset;

    if (gStageFlags & STAGE_FLAG__TIMER_REVERSED) {
        if ((gCourseTime < TIME(1, 0)) && (gStageTime & 0x10)) {
            redOffset = 11;
        } else {
            redOffset = 0;
        }
    } else {
        if ((gCourseTime > TIME(9, 0)) && (gStageTime & 0x10)) {
            redOffset = 11;
        } else {
            redOffset = 0;
        }
    }

    if ((LOADED_SAVE->timeLimitDisabled == TRUE) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
        redOffset = 0;
    }

    if (courseTime >= MAX_COURSE_TIME) {
        // Frames
        unk20->unk6 = UI_DIGIT(redOffset + 9);
        unk20->unk5 = UI_DIGIT(redOffset + 9);

        // Seconds
        unk20->unk3 = UI_DIGIT(redOffset + 9);
        unk20->unk2 = UI_DIGIT(redOffset + 5);

        // Minutes
        unk20->unk0 = UI_DIGIT(redOffset + 9);
    } else {
        s32 seconds = Div(courseTime, 60);
        s32 minutes = Div(seconds, 60);
        s32 r2;

        seconds -= sZoneTimeSecondsTable[minutes];
        r2 = sZoneTimeSecondsTable[seconds];
        r2 = courseTime - r2;
        r2 -= sZoneTimeMinutesTable[minutes];

        // Frames
        r2 *= 2;
        unk20->unk6 = redOffset + gMillisUnpackTable[r2 + 1];
        unk20->unk5 = redOffset + gMillisUnpackTable[r2 + 0];

#ifndef NON_MATCHING
        {
            register const u8 *ptr asm("r1");
            unk20->unk3 = redOffset + gSecondsTable[seconds * 2 + 1];
            ptr = &gSecondsTable[seconds * 2 + 0];
            unk20->unk2 = redOffset + *ptr;
        }
#else
        // Seconds
        unk20->unk3 = redOffset + gSecondsTable[seconds * 2 + 1];
        unk20->unk2 = redOffset + gSecondsTable[seconds * 2 + 0];
#endif

        // Minutes
        unk20->unk0 = redOffset + gSecondsTable[minutes * 2 + 1];
    }

    // Colons
    unk20->unk1 = UI_DIGIT(redOffset + 10);
    unk20->unk4 = UI_DIGIT(redOffset + 10);
}

// (95.64%) https://decomp.me/scratch/qd1UL
NONMATCH("asm/non_matching/game/sa1/stage/stage_ui__sub_8053BAC.inc", void sub_8053BAC(void))
{
    struct Task *t = gCurTask;
    StageUI *ui = TASK_DATA(t);
    u8 *ptr = &ui->digitsRings[0];
    u16 *ptr_r8 = &ui->unk48;
    u8 r7 = ui->unk48;
    GameOverB overB;
    u8 i;

    overB.unkC = 5;
    overB.unk12 = 6;
    overB.unk8 = 16;
    overB.unk10 = 0;
    overB.unk16 = 1;

    if (gRingCount <= 9) {
        overB.qUnkA = 9;
        overB.unkE = 1;

        if (gRingCount == 0) {
            u8 r4 = r7 + 1;
            sub_80530CC((const char *)&gUnknown_0865F174[r7 >> 3], &overB);

            r4 %= 32u;

            TASK_SET_MEMBER(StageUI, gCurTask, u16, unk48, r4);
        } else {
            sub_80530CC((const char *)&ui->digitsRings[2], &overB);
        }
    } else if (gRingCount <= 99) {
        overB.qUnkA = 5;
        overB.unkE = 2;
        sub_80530CC((const char *)&ui->digitsRings[1], &overB);
    } else {
        // _08053C5C
        overB.qUnkA = 1;
        overB.unkE = 3;
        sub_80530CC((const char *)&ui->digitsRings[0], &overB);
    }
    // _08053C6C

    ptr += 0x10;
    overB.unkC = -2;

    for (i = 0; i < 10; i++) {
        if (ptr[i] != 0x20) {
            break;
        }
    }

    if (gLevelScore != 0) {
        s32 r1;
        overB.unkE = (r1 = 9 - i);
        overB.qUnkA = 0x51 - (r1 * 8);
        sub_80530CC((const char *)&ptr[i], &overB);
    } else {
        // _08053CBC
        overB.unkE = 1;
        overB.qUnkA = 73;
        sub_80530CC((const char *)&gUnknown_0865F178[0], &overB);
    }
    // _08053CCC

    ptr += 0x10;
    overB.qUnkA = 0x19;
    overB.unkC = 12;
    overB.unkE = 7;
    sub_80530CC((const char *)ptr, &overB);

    if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
        // Num Lives
        ptr += 0x10;
        overB.qUnkA = 22;
        overB.unkC = DISPLAY_HEIGHT - 17;
        overB.unkE = 1;
        sub_80530CC((const char *)ptr, &overB);
    }
}
END_NONMATCH

// (99.48%) https://decomp.me/scratch/Sg21j
NONMATCH("asm/non_matching/game/sa1/stage/stage_ui__Task_SpecialStageUIMain.inc", void Task_SpecialStageUIMain(void))
{
    StageUI *ui = TASK_DATA(gCurTask);
    u8 r7 = ui->unk48;
    GameOverB overB;
    StageUI_10 *unk10;
    s32 remainder;
    s32 remainder0;
    s32 i;
    s32 sb_32;
    s16 sb;
    s16 sl;
    s16 r4;
    sb_32 = ui->unk4C + 1;

    sb = sb_32;
    ui->unk4C = sb_32;
    sl = 114;
    r4 = 90;

    if (sb >= 10 && sb < 30) {
        overB.unkC = Div((sb - 10) << 6, 20) - 70;
    } else if (sb >= 30) {
        overB.unkC = -6;
    } else {
        overB.unkC = -70;
    }

    overB.qUnkA = r4 + 4;
    overB.unkE = 1;
    overB.unk8 = 24;
    overB.unk10 = 3;
    overB.unk12 = 10;
    overB.unk16 = 1;

    sub_80530CC(gUnknown_0865F178, &overB);

#ifndef NON_MATCHING
    ui = TASK_DATA(gCurTask);
#endif

    if (gSpecialStageCollectedRings > 999) {
        ui->digitsRings[0] = UI_DIGIT(9);
        ui->digitsRings[1] = UI_DIGIT(9);
        ui->digitsRings[2] = UI_DIGIT(9);
    } else {
        // _08053DF0
        remainder = gSpecialStageCollectedRings;
        for (i = 0; i < 3; i++) {
            remainder0 = Div(remainder, 10);

            ui->digitsRings[2 - i] = UI_DIGIT(remainder - ((remainder0 << 3) + (remainder0 << 1)));

            remainder = remainder0;
        }
    }
    // _08053E24

    TASK_SET_MEMBER(StageUI, gCurTask, u16, ringCount, gSpecialStageCollectedRings);

    if (sb >= 20 && sb < 40) {
        overB.unkC = Div((sb - 20) << 6, 20) - 64;
    } else if (sb >= 40) {
        overB.unkC = 0;
    } else {
        overB.unkC = -64;
    }
    // _08053E6E+0x2

    overB.unk12 = 6;
    overB.unk8 = 16;
    overB.unk10 = 0;
    overB.unk16 = 1;

    if (gSpecialStageCollectedRings < 10) {
        overB.qUnkA = r4 + Q(12. / 256.);
        overB.unkE = 1;

        if (gSpecialStageCollectedRings == 0) {
            sub_80530CC((const char *)&gUnknown_0865F174[r7++ >> 3], &overB);

            r7 %= 32u;
            TASK_SET_MEMBER(StageUI, gCurTask, u16, unk48, r7);
        } else {
            sub_80530CC((const char *)&ui->digitsRings[2], &overB);
        }
    } else if (gSpecialStageCollectedRings < 100) {
        // _08053EE2+0x4

        overB.qUnkA = r4 + 8;
        overB.unkE = 2;

        sub_80530CC((const char *)&ui->digitsRings[1], &overB);
    } else {
        // _08053EFC
        overB.qUnkA = r4 + 4;
        overB.unkE = 3;

        sub_80530CC((const char *)&ui->digitsRings[0], &overB);
    }
    // _08053F10
    unk10 = &TASK_GET_MEMBER(StageUI, gCurTask, StageUI_10, unk10);

    if (gSpecialStageTargetRings > 999) {
        unk10->unk0[0] = UI_DIGIT(9);
        unk10->unk0[1] = UI_DIGIT(9);
        unk10->unk0[2] = UI_DIGIT(9);
    } else {
        remainder = gSpecialStageTargetRings;
        for (i = 0; i < (s32)ARRAY_COUNT(unk10->unk0); i++) {
            remainder0 = Div(remainder, 10);

            unk10->unk0[2 - i] = UI_DIGIT(remainder - ((remainder0 << 3) + (remainder0 << 1)));

            remainder = remainder0;
        }
    }
    // _08053F68

    TASK_SET_MEMBER(StageUI, gCurTask, u16, ringCount, gSpecialStageTargetRings);

    if (sb >= 15 && sb < 35) {
        overB.unkC = Div((sb - 15) << 6, 20) - 52;
    } else if (sb >= 35) {
        overB.unkC = 12;
    } else {
        overB.unkC = -52;
    }
    // _08053FB2+0x2

    overB.unk12 = 6;
    overB.unk8 = 16;
    overB.unk10 = 0;
    overB.unk16 = 1;

    if (gSpecialStageTargetRings < 10) {
        overB.qUnkA = sl + Q(12. / 256.);
        overB.unkE = 1;

        if (gSpecialStageTargetRings == 0) {
            sub_80530CC((const char *)&gUnknown_0865F174[r7++ >> 3], &overB);

            r7 %= 32u;
            TASK_SET_MEMBER(StageUI, gCurTask, u16, unk48, r7);
        } else {
            sub_80530CC((const char *)&unk10->unk0[2], &overB);
        }
    } else if (gSpecialStageTargetRings < 100) {
        overB.qUnkA = sl + 8;
        overB.unkE = 2;
        sub_80530CC((const char *)&unk10->unk0[1], &overB);
    } else {
        overB.qUnkA = sl + 4;
        overB.unkE = 3;
        sub_80530CC((const char *)&unk10->unk0[0], &overB);
    }
}
END_NONMATCH

void sub_8054068(void)
{
    Strc_80528AC sp00;
    const UiGraphics *gfx;

    sp00.uiGfxID = UIGFX_ASCII_CHARS;
    sp00.unk2B = 0;

    gfx = &gUiGraphics[UIGFX_ASCII_CHARS];
    sp00.tiles = gfx->tiles + 124 * TILE_SIZE_4BPP;
    sp00.palette = gfx->palette;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_F;
    sp00.tilesSize = 6 * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.unk2A = 9;
    sp00.unk0.unk4 = gfx->unk8;
    sp00.unk0.unk8 = gfx->unkC;
    sp00.unk0.unk9 = gfx->unk10;
    sp00.unk0.unkA = gfx->unk14;
    sp00.unk0.unkB = gfx->unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_ASCII_CHARS;
    sp00.unk2B = 0;
    sp00.tiles = gfx->tiles + 32 * TILE_SIZE_4BPP;
    sp00.palette = gfx->palette;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_E;
    sp00.tilesSize = 22 * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 6;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gfx->unk8;
    sp00.unk0.unk8 = gfx->unkC;
    sp00.unk0.unk9 = gfx->unk10;
    sp00.unk0.unkA = gfx->unk14;
    sp00.unk0.unkB = gfx->unk18;
    sub_80528AC(&sp00);

    sp00.uiGfxID = UIGFX_CHAR_SP_STAGE_RINGS_BG;
    sp00.unk2B = 3;
    sp00.tiles = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].tiles;
    sp00.palette = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].palette;
    sp00.tilesSize = (8 * 4) * TILE_SIZE_4BPP;
    sp00.paletteSize = 32;
    sp00.unk28 = 10;
    sp00.vramC = VRAM_RESERVED_UI_DIGITS_G;
    sp00.unk2A = 13;
    sp00.unk0.unk4 = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].unk8;
    sp00.unk0.unk8 = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].unkC;
    sp00.unk0.unk9 = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].unk10;
    sp00.unk0.unkA = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].unk14;
    sp00.unk0.unkB = gUiGraphics[UIGFX_CHAR_SP_STAGE_RINGS_BG].unk18;
    sub_80528AC(&sp00);
}

void CreateStageUI(void)
{
#ifndef NON_MATCHING
    register void *dtor asm("r1") = 0;
    StageUI_20 *unk20 = NULL;
    register struct Task *t asm("r1") = TaskCreate(Task_StageUIMain, sizeof(StageUI), 0x2180, 0, dtor);
#else
    void *dtor = 0;
    StageUI_20 *unk20 = NULL;
    struct Task *t = TaskCreate(Task_StageUIMain, sizeof(StageUI), 0x2180, 0, dtor);
#endif
    StageUI *ui = TASK_DATA(t);

    ui->unk40 = 0;

    // Colons
    ui = TASK_DATA(t);
    unk20 = &ui->unk20;
    unk20->unk1 = 42;
    unk20->unk4 = 42;

    UiGfxStackInit();
    sub_80538BC();
}

// https://decomp.me/scratch/3QSHy
void CreateSpecialStageUI(void)
{
#ifndef NON_MATCHING
    register void *dtor asm("r1") = 0;
    register struct Task *t asm("r1");
#else
    void *dtor = 0;
    struct Task *t;
#endif
    s32 zero;
    StageUI *ui;

    t = TaskCreate(Task_SpecialStageUIMain, sizeof(StageUI), 0x1180, (zero = 0), dtor);

    ui = TASK_DATA(t);
    ui->unk40 = zero;

#ifndef NON_MATCHING
    ui = TASK_DATA(t);
#endif
    ui->unk4C = zero;

    UiGfxStackInit();
    sub_8054068();
}

void sub_8054238(void) { }

bool8 sub_805423C(StrcUi_805423C *param0)
{
    u16 r2;

    if (param0->unk2 != 0) {
        gDispCnt |= DISPCNT_WIN1_ON;
    } else {
        gDispCnt |= DISPCNT_WIN0_ON;
    }

    if (param0->unkA & 0x1) {
        gBldRegs.bldCnt = BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL;
        gBldRegs.bldAlpha = 16;
    } else if (param0->unkA & 0x10) {
        gBldRegs.bldCnt = BLDCNT_TGT2_BD | BLDCNT_TGT1_ALL;
        gBldRegs.bldAlpha = 0;
    } else if ((u8)param0->unkA == 0) {
        gBldRegs.bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3;
        gBldRegs.bldAlpha = 0;
    } else if (param0->unkA & 0x8) {
        gBldRegs.bldCnt = BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL;
    }

    if (param0->unk2 != 0) {
        gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] |= WININ_WIN1_ALL;
        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ);
    } else {
        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] |= WININ_WIN0_ALL;
        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ);
    }

    if (param0->unk4 & 0xC) {
        gBldRegs.bldCnt |= 0x80;
    } else {
        gBldRegs.bldCnt |= 0xC0;
    }

    if (param0->unk4 & (WININ_WIN0_BG0 | WININ_WIN0_BG2)) {
        gBldRegs.bldY = param0->unk6 >> 8;
    } else {
        gBldRegs.bldY = 32 - (param0->unk6 >> 8);
    }

    r2 = param0->unk6;

    if (gBldRegs.bldY >= 32) {
        gBldRegs.bldY = 32;
    }

    HALVE(gBldRegs.bldY);

    if (param0->unk0 != 0) {
        r2 = param0->unk8;

        if (param0->unk0 >= param0->unk8) {
            param0->unk0 -= r2;
        } else {
            param0->unk0 = 0;
        }

        return FALSE;
    } else {
        param0->unk6 = r2 + param0->unk8;

        if (param0->unk6 >= Q(32)) {
            param0->unk6 = Q(32);
            return TRUE;
        }

        return FALSE;
    }
}

void sub_80543A4(StrcUi_805423C *param0)
{
    u16 r2;

    if (param0->unk2 != 0) {
        gDispCnt |= DISPCNT_WIN1_ON;
    } else {
        gDispCnt |= DISPCNT_WIN0_ON;
    }

    if (param0->unkA & 0x1) {
        gBldRegs.bldCnt = BLDCNT_TGT1_ALL | BLDCNT_TGT2_ALL;
        gBldRegs.bldAlpha = 16;
    } else if ((u8)param0->unkA == 0) {
        gBldRegs.bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2 | BLDCNT_TGT1_BG3;
        gBldRegs.bldAlpha = 0;
    }

    if (param0->unk2 != 0) {
        gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] |= WININ_WIN1_ALL;
        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ);
    } else {
        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] |= WININ_WIN0_ALL;
        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_BG_ALL | WINOUT_WIN01_OBJ);
    }

    if (param0->unk4 & 0xC) {
        gBldRegs.bldCnt |= 0x80;
    } else {
        gBldRegs.bldCnt |= 0xC0;
    }

    if (param0->unk4 & (WININ_WIN0_BG0 | WININ_WIN0_BG2)) {
        gBldRegs.bldY = param0->unk6 >> 8;
    } else {
        gBldRegs.bldY = 32 - (param0->unk6 >> 8);
    }

    if (gBldRegs.bldY >= 32) {
        gBldRegs.bldY = 32;
    }

    HALVE(gBldRegs.bldY);
}
