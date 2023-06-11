#include "global.h"
#include "core.h"
#include "flags.h"
#include "malloc_vram.h"
#include "game/game.h"
#include "game/save.h"
#include "game/stage/ui.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

#define UI_ASCII_COLON   10
#define UI_ASCII_SP_RING 11

#define UI_POS_RING_COUNT_X 32
#define UI_POS_RING_COUNT_Y 16

const u16 sAnimsAsciiDigits[12][2] = {
    { SA2_ANIM_ASCII, '0' - 32 },
    { SA2_ANIM_ASCII, '1' - 32 },
    { SA2_ANIM_ASCII, '2' - 32 },
    { SA2_ANIM_ASCII, '3' - 32 },
    { SA2_ANIM_ASCII, '4' - 32 },
    { SA2_ANIM_ASCII, '5' - 32 },
    { SA2_ANIM_ASCII, '6' - 32 },
    { SA2_ANIM_ASCII, '7' - 32 },
    { SA2_ANIM_ASCII, '8' - 32 },
    { SA2_ANIM_ASCII, '9' - 32 },
    { SA2_ANIM_ASCII, ':' - 32 },
    { SA2_ANIM_UI_SPECIAL_RING_ICON, 0 }, // Icon - Special Ring collected
};

const u16 sAnims1UpIcons[][3]
    = { [CHARACTER_SONIC] = { ONE_UP_ICON_TILE_COUNT, SA2_ANIM_LIFE_COUNTER,
                              SA2_ANIM_VARIANT_LIFE_COUNTER_SONIC },
        [CHARACTER_CREAM] = { ONE_UP_ICON_TILE_COUNT, SA2_ANIM_LIFE_COUNTER,
                              SA2_ANIM_VARIANT_LIFE_COUNTER_CREAM },
        [CHARACTER_TAILS] = { ONE_UP_ICON_TILE_COUNT, SA2_ANIM_LIFE_COUNTER,
                              SA2_ANIM_VARIANT_LIFE_COUNTER_TAILS },
        [CHARACTER_KNUCKLES] = { ONE_UP_ICON_TILE_COUNT, SA2_ANIM_LIFE_COUNTER,
                                 SA2_ANIM_VARIANT_LIFE_COUNTER_KNUCKLES },
        [CHARACTER_AMY] = { ONE_UP_ICON_TILE_COUNT, SA2_ANIM_LIFE_COUNTER,
                            SA2_ANIM_VARIANT_LIFE_COUNTER_AMY } };

// This palette might be used for the 1-Up icons
const u16 sPalette_080D6ACE[] = INCBIN_U16("graphics/80D6ACE.gbapal");

const u32 sOrdersOfMagnitude[6] = {
    100000, 10000, 1000, 100, 10, 1,
};

const u8 gSecondsTable[60][2] = {
    { 0, 0 }, { 0, 1 }, { 0, 2 }, { 0, 3 }, { 0, 4 }, { 0, 5 }, { 0, 6 }, { 0, 7 },
    { 0, 8 }, { 0, 9 }, { 1, 0 }, { 1, 1 }, { 1, 2 }, { 1, 3 }, { 1, 4 }, { 1, 5 },
    { 1, 6 }, { 1, 7 }, { 1, 8 }, { 1, 9 }, { 2, 0 }, { 2, 1 }, { 2, 2 }, { 2, 3 },
    { 2, 4 }, { 2, 5 }, { 2, 6 }, { 2, 7 }, { 2, 8 }, { 2, 9 }, { 3, 0 }, { 3, 1 },
    { 3, 2 }, { 3, 3 }, { 3, 4 }, { 3, 5 }, { 3, 6 }, { 3, 7 }, { 3, 8 }, { 3, 9 },
    { 4, 0 }, { 4, 1 }, { 4, 2 }, { 4, 3 }, { 4, 4 }, { 4, 5 }, { 4, 6 }, { 4, 7 },
    { 4, 8 }, { 4, 9 }, { 5, 0 }, { 5, 1 }, { 5, 2 }, { 5, 3 }, { 5, 4 }, { 5, 5 },
    { 5, 6 }, { 5, 7 }, { 5, 8 }, { 5, 9 },
};

const u8 gMillisUnpackTable[60][2] = {
    { 0, 0 }, { 0, 2 }, { 0, 3 }, { 0, 5 }, { 0, 7 }, { 0, 8 }, { 1, 0 }, { 1, 2 },
    { 1, 3 }, { 1, 5 }, { 1, 7 }, { 1, 8 }, { 2, 0 }, { 2, 2 }, { 2, 3 }, { 2, 5 },
    { 2, 7 }, { 2, 8 }, { 3, 0 }, { 3, 2 }, { 3, 3 }, { 3, 5 }, { 3, 7 }, { 3, 8 },
    { 4, 0 }, { 4, 2 }, { 4, 3 }, { 4, 5 }, { 4, 7 }, { 4, 8 }, { 5, 0 }, { 5, 2 },
    { 5, 3 }, { 5, 5 }, { 5, 7 }, { 5, 8 }, { 6, 0 }, { 6, 2 }, { 6, 3 }, { 6, 5 },
    { 6, 7 }, { 6, 8 }, { 7, 0 }, { 7, 2 }, { 7, 3 }, { 7, 5 }, { 7, 7 }, { 7, 8 },
    { 8, 0 }, { 8, 2 }, { 8, 3 }, { 8, 5 }, { 8, 7 }, { 8, 8 }, { 9, 0 }, { 9, 2 },
    { 9, 3 }, { 9, 5 }, { 9, 7 }, { 9, 9 },
};

const u16 sZoneTimeSecondsTable[] = {
    ZONE_TIME_TO_INT(0, 0),  ZONE_TIME_TO_INT(0, 1),  ZONE_TIME_TO_INT(0, 2),
    ZONE_TIME_TO_INT(0, 3),  ZONE_TIME_TO_INT(0, 4),  ZONE_TIME_TO_INT(0, 5),
    ZONE_TIME_TO_INT(0, 6),  ZONE_TIME_TO_INT(0, 7),  ZONE_TIME_TO_INT(0, 8),
    ZONE_TIME_TO_INT(0, 9),  ZONE_TIME_TO_INT(0, 10), ZONE_TIME_TO_INT(0, 11),
    ZONE_TIME_TO_INT(0, 12), ZONE_TIME_TO_INT(0, 13), ZONE_TIME_TO_INT(0, 14),
    ZONE_TIME_TO_INT(0, 15), ZONE_TIME_TO_INT(0, 16), ZONE_TIME_TO_INT(0, 17),
    ZONE_TIME_TO_INT(0, 18), ZONE_TIME_TO_INT(0, 19), ZONE_TIME_TO_INT(0, 20),
    ZONE_TIME_TO_INT(0, 21), ZONE_TIME_TO_INT(0, 22), ZONE_TIME_TO_INT(0, 23),
    ZONE_TIME_TO_INT(0, 24), ZONE_TIME_TO_INT(0, 25), ZONE_TIME_TO_INT(0, 26),
    ZONE_TIME_TO_INT(0, 27), ZONE_TIME_TO_INT(0, 28), ZONE_TIME_TO_INT(0, 29),
    ZONE_TIME_TO_INT(0, 30), ZONE_TIME_TO_INT(0, 31), ZONE_TIME_TO_INT(0, 32),
    ZONE_TIME_TO_INT(0, 33), ZONE_TIME_TO_INT(0, 34), ZONE_TIME_TO_INT(0, 35),
    ZONE_TIME_TO_INT(0, 36), ZONE_TIME_TO_INT(0, 37), ZONE_TIME_TO_INT(0, 38),
    ZONE_TIME_TO_INT(0, 39), ZONE_TIME_TO_INT(0, 40), ZONE_TIME_TO_INT(0, 41),
    ZONE_TIME_TO_INT(0, 42), ZONE_TIME_TO_INT(0, 43), ZONE_TIME_TO_INT(0, 44),
    ZONE_TIME_TO_INT(0, 45), ZONE_TIME_TO_INT(0, 46), ZONE_TIME_TO_INT(0, 47),
    ZONE_TIME_TO_INT(0, 48), ZONE_TIME_TO_INT(0, 49), ZONE_TIME_TO_INT(0, 50),
    ZONE_TIME_TO_INT(0, 51), ZONE_TIME_TO_INT(0, 52), ZONE_TIME_TO_INT(0, 53),
    ZONE_TIME_TO_INT(0, 54), ZONE_TIME_TO_INT(0, 55), ZONE_TIME_TO_INT(0, 56),
    ZONE_TIME_TO_INT(0, 57), ZONE_TIME_TO_INT(0, 58), ZONE_TIME_TO_INT(0, 59),
    ZONE_TIME_TO_INT(0, 60),
};

const u16 sZoneTimeMinutesTable[] = {
    ZONE_TIME_TO_INT(0, 0), ZONE_TIME_TO_INT(1, 0),  ZONE_TIME_TO_INT(2, 0),
    ZONE_TIME_TO_INT(3, 0), ZONE_TIME_TO_INT(4, 0),  ZONE_TIME_TO_INT(5, 0),
    ZONE_TIME_TO_INT(6, 0), ZONE_TIME_TO_INT(7, 0),  ZONE_TIME_TO_INT(8, 0),
    ZONE_TIME_TO_INT(9, 0), ZONE_TIME_TO_INT(10, 0),
};

typedef struct {
    /* 0x00 */ Sprite ring;
    /* 0x30 */ Sprite ringContainer;

    // Only used in Single Player
    /* 0x60 */ Sprite playerIcon;

    /* 0x90 */ Sprite digits[12];

    // Seem to be OamData.attr2
    /* 0x2D0 */ u16 unk2D0;
    /* 0x2D2 */ u16 unk2D2;
    /* 0x2D4 */ u16 unk2D4;
    /* 0x2D6 */ u16 unk2D6;
    /* 0x2D8 */ u16 unk2D8[12];
} StageUi; /* size: 0x2F0 */

void Task_CreateStageUiMain(void);
void TaskDestructor_CreateStageUi(struct Task *t);

struct Task *CreateStageUi(void)
{
    u32 i;
    u32 tile;
    u32 sixK;
    StageUi *ui;
    Sprite *s;

    struct Task *t = TaskCreate(Task_CreateStageUiMain, sizeof(StageUi), 0x2102, 0,
                                TaskDestructor_CreateStageUi);
    gStageUITask = t;
    ui = TaskGetStructPtr(t);

    for (i = 0; i < ARRAY_COUNT(ui->digits); i++) {
        s = &ui->digits[i];
        s->x = 0;
        s->y = 0;

        if (i == 0) {
            s->graphics.dest = VramMalloc(24);
        } else {
            s->graphics.dest = ui->digits[0].graphics.dest + (i * (2 * TILE_SIZE_4BPP));
        }

        ui->unk2D8[i] = (GET_TILE_NUM(s->graphics.dest) & 0x3FF) | 0x6000;

        s->unk1A = 0;
        s->graphics.size = 0;
        s->graphics.anim = sAnimsAsciiDigits[i][0];
        s->variant = sAnimsAsciiDigits[i][1];
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = 0xFF;
        s->unk22 = 0x10;
        s->palId = 0;
        s->unk28[0].unk0 = -1;
        s->unk10 = SPRITE_FLAG(18, 1);

        if (i != (ARRAY_COUNT(sAnimsAsciiDigits) - 1)) {
            sub_8004558(s);
        }
    }

    if (IS_SINGLE_PLAYER) {
        s = &ui->playerIcon;
        s->x = 6;
        s->y = 142;

        s->graphics.dest = VramMalloc(sAnims1UpIcons[gSelectedCharacter][0]);

        ui->unk2D4 = (GET_TILE_NUM(s->graphics.dest) & 0x3FF);
        s->graphics.anim = sAnims1UpIcons[gSelectedCharacter][1];
        s->variant = sAnims1UpIcons[gSelectedCharacter][2];
        s->unk1A = 0x100;
        s->graphics.size = 0;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = 0xFF;
        s->unk22 = 0x10;
        s->palId = 0;
        s->unk28[0].unk0 = -1;
        s->unk10 = 0;

        // This can never be reached
        if (IS_MULTI_PLAYER) {
            u16 id = (SIO_MULTI_CNT)->id;
            s->palId = id;
            ui->unk2D4 |= (id << 12);
        }
        sub_8004558(s);
    }

    s = &ui->ringContainer;
    s->x = 0;
    s->y = 1;
    s->graphics.dest = VramMalloc(32);
    ui->unk2D6 = (GET_TILE_NUM(s->graphics.dest) & 0x3FF);
    ui->unk2D6 |= 0x6000;
    s->graphics.anim = SA2_ANIM_UI_RING_CONTAINER;
    s->variant = 0;
    s->unk1A = 0xC0;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = 0;
    sub_8004558(s);

    s = &ui->ring;
    ui->ring.x = 7;
    s->y = 9;
    s->graphics.dest = VramMalloc(4);
    ui->unk2D2 = ((GET_TILE_NUM(s->graphics.dest) & 0x3FF));
    ui->unk2D2 |= 0x6000;
    s->graphics.anim = SA2_ANIM_UI_RING;
    s->variant = 0;
    s->unk1A = 0;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk10 = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = 0;
    ui->unk2D0 = 0;

    for (i = 0; i < 16; i++) {
        gObjPalette[0x70 + i] = sPalette_080D6ACE[i];
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
    return gStageUITask;
}

// TODO: Add DISPLAY_WIDTH/_HEIGHT to the positions of the timer and 1-Up-icons
// https://decomp.me/scratch/EhVgP
void Task_CreateStageUiMain(void)
{
    if (!GRAVITY_IS_INVERTED) {
        u32 time;
        s32 score;
        u16 lives;
        u16 i;
        u32 sl;
        OamData *oam;
        StageUi *ui = TaskGetStructPtr(gCurTask);

        if (gGameMode == GAME_MODE_SINGLE_PLAYER) {
            if (ACT_INDEX(gCurrentLevel) != ACT_BOSS) {
                sub_8004558(&ui->digits[UI_ASCII_SP_RING]);

                for (i = 0; i < gUnknown_030054F4; i++) {
                    OamData *oam = sub_80058B4(3);
                    oam->all.attr0 = 31;
                    oam->all.attr1 = i * 8 + 4;
                    oam->all.attr2 = ui->unk2D8[UI_ASCII_SP_RING];
                }
            }
            // _0802CD74
            if ((!gLoadedSaveGame->timeLimitDisabled)
                && (gCourseTime >= ZONE_TIME_TO_INT(9, 40))
                && (Mod(gCourseTime, 60) == 0)) {
                m4aSongNumStart(SE_TIMER);
            }

            /* Score Value */
            score = gUnknown_03005450;
            if (score > 999999)
                score = 999999;

            for (i = 0; i < ARRAY_COUNT(sOrdersOfMagnitude); i++) {
                s32 digit;
                u32 m = sOrdersOfMagnitude[i];

                digit = Div(score, m);
                oam = sub_80058B4(3);

                oam->all.attr0 = 0x800E;
                oam->all.attr1 = i * 8 + 28;
                oam->all.attr2 = ui->unk2D8[digit];

                score -= digit * m;
            }

            /* Player-Icon */
            oam = sub_80058B4(3);
            oam->all.attr0 = 142;
            oam->all.attr1 = (0x4000 | 6);
            oam->all.attr2 = ui->unk2D4;

            lives = (gNumLives > 0) ? gNumLives - 1 : 0;
            lives = MIN(lives, 9);

            /* Lives Counter */
            oam = sub_80058B4(3);
            oam->all.attr0 = (0x8000 | 140);
            oam->all.attr1 = 30;
            oam->all.attr2 = ui->unk2D8[lives];
        }
        // _0802CE6A

        /* Ring-Container */
        oam = sub_80058B4(4);
        oam->all.attr0 = (0x4000 | 0);
        oam->all.attr1 = (0xC000 | 509);
        oam->all.attr2 = ui->unk2D6;

        /* Ring */
        ui->unk2D0 += ((gPlayer.speedAirX >> 3) + Q_24_8(0.25));
        ui->unk2D0 &= 0x7FF;
        ui->ring.variant = ui->unk2D0 >> 8;
        ui->ring.unk21 = 0xFF;
        sub_8004558(&ui->ring);

        /* Ring-Count */
        oam = sub_80058B4(3);
        oam->all.attr0 = 8;
        oam->all.attr1 = (0x4000 | 7);
        oam->all.attr2 = ui->unk2D2;

        if (gRingCount > 999) {
            Sprite *digits = &ui->digits[0];
            digits[9].y = UI_POS_RING_COUNT_Y;
            digits[9].x = UI_POS_RING_COUNT_X + 0 * 8;
            sub_80051E8(&digits[9]);

            digits[9].y = UI_POS_RING_COUNT_Y;
            digits[9].x = UI_POS_RING_COUNT_X + 1 * 8;
            sub_80051E8(&digits[9]);

            digits[9].y = UI_POS_RING_COUNT_Y;
            digits[9].x = UI_POS_RING_COUNT_X * 2 * 8;
            sub_80051E8(&digits[9]);
        } else {
            // _0802CF28
            u16 processed;
            sl = 0;

            if ((gRingCount == 0) && gUnknown_03005590 & 0x10) {
                sl = 0x7000;
            }

            { /* 100s */
                u16 hundreds = Div(gRingCount, 100);

                oam = sub_80058B4(3);
                oam->all.attr0 = (0x8000 | 0);
                oam->all.attr1 = (28 + 0 * 8);
                oam->all.attr2 = (sl | ui->unk2D8[hundreds]);

                processed = hundreds * 100;
            }

            { /* 10s */
                u16 tens = Div(gRingCount - processed, 10);

                oam = sub_80058B4(3);
                oam->all.attr0 = (0x8000 | 0);
                oam->all.attr1 = (28 + 1 * 8);
                oam->all.attr2 = (sl | ui->unk2D8[tens]);

                processed += tens * 10;
            }

            { /* 1s */
                u16 ones = gRingCount - processed;

                oam = sub_80058B4(3);
                oam->all.attr0 = (0x8000 | 0);
                oam->all.attr1 = (28 + 2 * 8);
                oam->all.attr2 = (sl | ui->unk2D8[ones]);
            }
        }
        // _0802CFDC
        time = gCourseTime;
        if (time > MAX_COURSE_TIME - 1)
            time = MAX_COURSE_TIME - 1;

        if (!(gUnknown_03005424 & EXTRA_STATE__TURN_OFF_TIMER)) {
            // _0802CFF8
            u32 seconds, minutes;
            u32 r1, r5;
            Sprite *sd;

            sl = 0x6000;

            oam = sub_80058B4(3);
            oam->all.attr0 = (0x8000 | 0);
            oam->all.attr1 = 99;
            oam->all.attr2 = (sl | ui->unk2D8[UI_ASCII_COLON]);

            oam = sub_80058B4(3);
            oam->all.attr0 = (0x8000 | 0);
            oam->all.attr1 = 123;
            oam->all.attr2 = (sl | ui->unk2D8[UI_ASCII_COLON]);

            seconds = Div(time, GBA_FRAMES_PER_SECOND);
            minutes = Div(seconds, 60);

            seconds -= sZoneTimeSecondsTable[minutes];
            r1 = time - sZoneTimeSecondsTable[seconds];
            r5 = r1 - sZoneTimeMinutesTable[minutes];

            sl = 0;
            if (gCourseTime > ZONE_TIME_TO_INT(9, 0)) {
                sl = !!(gUnknown_03005590 & 0x10);
            }

            // Milliseconds-L
            sd = &ui->digits[gMillisUnpackTable[r5][0]];
            sd->x = 136 + 0 * 8;
            sd->y = 16;
            sd->palId = sl;
            sub_80051E8(sd);

            // Milliseconds-R
            sd = &ui->digits[gMillisUnpackTable[r5][1]];
            sd->x = 136 + 1 * 8;
            sd->y = 16;
            sd->palId = sl;
            sub_80051E8(sd);

            // Seconds-L
            sd = &ui->digits[gSecondsTable[seconds][0]];
            sd->x = 112 + 0 * 8;
            sd->y = 16;
            sd->palId = sl;
            sub_80051E8(sd);

            // Seconds-R
            sd = &ui->digits[gSecondsTable[seconds][1]];
            sd->x = 112 + 1 * 8;
            sd->y = 16;
            sd->palId = sl;
            sub_80051E8(sd);

            // Minutes
            sd = &ui->digits[minutes];
            sd->x = 112 + 1 * 8;
            sd->y = 16;
            sd->palId = sl;
            sub_80051E8(sd);
        }
    }
}

#if 0 // matches
void TaskDestructor_CreateStageUi(struct Task *t)
{
    StageUi *ui = TaskGetStructPtr(t);
    VramFree(ui->ring.graphics.dest);
    VramFree(ui->ringContainer.graphics.dest);

    if(IS_SINGLE_PLAYER)
        VramFree(ui->playerIcon.graphics.dest);

    VramFree(ui->digits.graphics.dest);
}
#endif
