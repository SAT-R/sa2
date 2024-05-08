#include <string.h> // memcpy

#include "core.h"
#include "game/special_stage/main.h"
#include "game/special_stage/player.h"
#include "game/special_stage/ui.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/data.h"
#include "lib/m4a.h"
#include "game/save.h"
#include "constants/songs.h"
#include "constants/text.h"

void sub_8070C58(void);
void sub_806FFC8(void);
void sub_8070D14(void);

void sub_8070D80(struct SpecialStageUI *);
void sub_8070DD0(struct SpecialStageUI *);
void sub_8070DE0(struct SpecialStageUI *);
static void HandlePaused(struct SpecialStageUI *);
static void HandleUnpaused(struct SpecialStageUI *);
static void RenderPauseMenu(struct SpecialStageUI *);

static const struct UNK_80DF670 sDigitSprites[] = {
    { 1119, 16, 2, 0, 0 }, { 1119, 17, 2, 0, 0 }, { 1119, 18, 2, 0, 0 },
    { 1119, 19, 2, 0, 0 }, { 1119, 20, 2, 0, 0 }, { 1119, 21, 2, 0, 0 },
    { 1119, 22, 2, 0, 0 }, { 1119, 23, 2, 0, 0 }, { 1119, 24, 2, 0, 0 },
};

static const struct UNK_80DF670 gUnknown_080DF830[] = {
    { 1119, 25, 2, 0, 0 },
    { 1119, 26, 2, 0, 0 },
};

static const struct UNK_80DF670 gUnknown_080DF840[] = {
    { 885, 0, 2, 0, 0 }, { 885, 1, 2, 0, 0 }, { 885, 2, 2, 0, 0 }, { 885, 3, 2, 0, 0 },
    { 885, 4, 2, 0, 0 }, { 885, 5, 2, 0, 0 }, { 885, 6, 2, 0, 0 }, { 885, 7, 2, 0, 0 },
};

static const struct UNK_80DF670 gUnknown_080DF880[] = {
    { 1121, 0, 24, 0, 0 }, { 1121, 4, 27, 0, 0 }, { 1121, 1, 24, 0, 0 },
    { 1121, 2, 27, 0, 0 }, { 1121, 3, 18, 0, 0 },
};

static const struct UNK_80DF670 sChaosEmeraldUnlockedSprites[] = {
    { 895, 0, 9, 0, 0 }, { 895, 1, 9, 0, 0 }, { 895, 2, 9, 0, 0 }, { 895, 3, 9, 0, 0 },
    { 895, 4, 9, 0, 0 }, { 895, 5, 9, 0, 0 }, { 895, 6, 9, 0, 0 },
};

static const struct UNK_80DF670 sChaosEmeraldMissingSprites[2] = {
    { 895, 7, 9, 0, 0 },
    { 895, 8, 9, 0, 0 },
};

static const u16 sPauseMenuVariants[][3] = {
    { 40, 1066, 0 }, { 40, 1067, 0 }, { 40, 1068, 0 },
    { 40, 1069, 0 }, { 40, 1070, 0 }, { 40, 1071, 0 },
};

void sub_806FB04(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    sub_8070C58();
    sub_806FFC8();
    sub_8070D14();

    if (ui->unk2A8 == 0) {
        if (stage->state == 4) {
            sub_8070D80(ui);
        }
    }

    if (ui->unk2A8 != 0) {
        if (stage->state != 4) {
            sub_8070DE0(ui);
        } else {
            if (stage->animFrame < 0x1E || stage->animFrame & 2) {
                sub_8070DD0(ui);
            }
        }
    }

    if (ui->wasPaused == FALSE) {
        if (stage->paused) {
            HandlePaused(ui);
        }
    }

    if (ui->wasPaused) {
        if (!stage->paused) {
            HandleUnpaused(ui);
        } else {
            RenderPauseMenu(ui);
        }
    }
}

static void CreateStageTime(struct SpecialStageUI *ui)
{
    struct SpecialStage *stage = ui->stage;
    const struct UNK_80DF670 *unkF7E8;
    Sprite newElement;

    s16 timeHundreds = stage->timeHundreds;
    s16 timeTens = stage->timeTens;
    s16 timeUnits = stage->timeUnits;

    sub_806CA88(&ui->timeSymbol, RENDER_TARGET_SCREEN, 1, 0x377, 0x1000, 0xC0, 0xE, 1, 0,
                0);

    unkF7E8 = &sDigitSprites[timeHundreds];
    sub_806CA88(&ui->timeHundreds, RENDER_TARGET_SCREEN, unkF7E8->unk4, unkF7E8->anim,
                0x1000, 0xCC, 0x12, 1, unkF7E8->variant, 0);

    unkF7E8 = &sDigitSprites[timeTens];
    sub_806CA88(&ui->timeTens, RENDER_TARGET_SCREEN, unkF7E8->unk4, unkF7E8->anim,
                0x1000, 0xD4, 0x12, 1, unkF7E8->variant, 0);

    unkF7E8 = &sDigitSprites[timeUnits];
    sub_806CA88(&ui->timeUnits, RENDER_TARGET_SCREEN, unkF7E8->unk4, unkF7E8->anim,
                0x1000, 0xDC, 0x12, 1, unkF7E8->variant, 0);

    sub_806CA88(&newElement, RENDER_TARGET_SCREEN, 0, 0x379, 0, 0, 0, 0, 0, 0);
}

void sub_806FCF8(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    Sprite *s;
    const struct UNK_80DF670 *unkF7E8;

    u32 temp;

    s16 timeHundreds = stage->timeHundreds;
    s16 timeTens = stage->timeTens;
    s16 timeUnits = stage->timeUnits;

    ui->unk2AA = (ui->unk2AA + 1) & 0xFF;
    if (timeHundreds == 0 && timeTens == 0) {
        if (ui->unk2AA & 0x8) {
            temp = 0;
        } else {
            temp = 3;
        }
    } else if (timeHundreds == 0 && timeTens < 3) {
        if (ui->unk2AA & 0x10) {
            temp = 0;
        } else {
            temp = 3;
        }
    } else {
        temp = 0;
    }

    if (timeHundreds != 0) {
        unkF7E8 = &sDigitSprites[timeHundreds];
        s = &ui->timeHundreds;
        s->graphics.anim = unkF7E8->anim;
        s->variant = unkF7E8->variant;
        s->unk10 |= 0x40000;
        s->palId = temp;
        UpdateSpriteAnimation(s);
    }

    if ((timeHundreds | timeTens) != 0) {
        unkF7E8 = &sDigitSprites[timeTens];
        s = &ui->timeTens;
        s->graphics.anim = unkF7E8->anim;
        s->variant = unkF7E8->variant;
        s->unk10 |= 0x40000;
        s->palId = temp;
        UpdateSpriteAnimation(s);
    }

    unkF7E8 = &sDigitSprites[timeUnits];
    s = &ui->timeUnits;
    s->graphics.anim = unkF7E8->anim;
    s->variant = unkF7E8->variant;
    s->unk10 |= 0x40000;
    s->palId = temp;
    UpdateSpriteAnimation(s);
}

static void CreateRingCounter(struct SpecialStageUI *ui)
{
    struct SpecialStage *stage = ui->stage;

    Sprite *s;
    const struct UNK_80DF670 *sprite;

    sprite = &sDigitSprites[stage->ringsHundreds];
    sub_806CA88(&ui->ringsHundredsDigit, RENDER_TARGET_SCREEN, sprite->unk4,
                sprite->anim, 0x1000, 100, 0x10, 1, sprite->variant, 0);

    sprite = &sDigitSprites[stage->ringsTens];
    sub_806CA88(&ui->ringsTENS_DIGIT, RENDER_TARGET_SCREEN, sprite->unk4, sprite->anim,
                0x1000, 0x6C, 0x10, 1, sprite->variant, 0);

    sprite = &sDigitSprites[stage->ringsUnits];
    sub_806CA88(&ui->ringsUNITS_DIGIT, RENDER_TARGET_SCREEN, sprite->unk4, sprite->anim,
                0x1000, 0x74, 0x10, 1, sprite->variant, 0);

    sub_806CA88(&ui->unk154, RENDER_TARGET_SCREEN, 8, 0x378, 0x1000, 0x78, 0xE, 2, 0, 0);

    sprite = &sDigitSprites[stage->ringsTargetHundreds];
    sub_806CA88(&ui->ringsTargetHundredsDigit, RENDER_TARGET_SCREEN, sprite->unk4,
                sprite->anim, 0x1000, 0x7C, 0x18, 1, sprite->variant, 0);

    sprite = &sDigitSprites[stage->ringsTargetTens];
    sub_806CA88(&ui->ringsTargetTENS_DIGIT, RENDER_TARGET_SCREEN, sprite->unk4,
                sprite->anim, 0x1000, 0x84, 0x18, 1, sprite->variant, 0);

    sprite = &sDigitSprites[stage->ringsTargetUnits];
    sub_806CA88(&ui->ringsTargetUNITS_DIGIT, RENDER_TARGET_SCREEN, sprite->unk4,
                sprite->anim, 0x1000, 0x8C, 0x18, 1, sprite->variant, 0);
}

void sub_8070078(void);

void sub_806FFC8(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    if (stage->paused == FALSE) {
        sub_8070078();
    }

    if (stage->ringsHundreds != 0) {
        DisplaySprite(&ui->ringsHundredsDigit);
    }

    if (stage->ringsHundreds != 0 || stage->ringsTens != 0) {
        DisplaySprite(&ui->ringsTENS_DIGIT);
    }

    DisplaySprite(&ui->ringsUNITS_DIGIT);
    DisplaySprite(&ui->unk154);

    if (stage->ringsTargetHundreds != 0) {
        DisplaySprite(&ui->ringsTargetHundredsDigit);
    }

    if (stage->ringsTargetHundreds != 0 || stage->ringsTargetTens != 0) {
        DisplaySprite(&ui->ringsTargetTENS_DIGIT);
    }

    DisplaySprite(&ui->ringsTargetUNITS_DIGIT);
}

void sub_8070078(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    Sprite *s;
    const struct UNK_80DF670 *sprite;

    sprite = &sDigitSprites[stage->ringsHundreds];
    s = &ui->ringsHundredsDigit;
    s->graphics.anim = sprite->anim;
    s->variant = sprite->variant;
    UpdateSpriteAnimation(s);

    sprite = &sDigitSprites[stage->ringsTens];
    s = &ui->ringsTENS_DIGIT;
    s->graphics.anim = sprite->anim;
    s->variant = sprite->variant;
    UpdateSpriteAnimation(s);

    sprite = &sDigitSprites[stage->ringsUnits];
    s = &ui->ringsUNITS_DIGIT;
    s->graphics.anim = sprite->anim;
    s->variant = sprite->variant;
    UpdateSpriteAnimation(s);

    if (stage->targetReached == FALSE) {
        if (stage->rings >= stage->ringsTarget) {
            stage->targetReached = TRUE;
            m4aSongNumStart(MUS_ACHIEVEMENT);
            stage->unk5C7 = 1;
            stage->unk5C8 = 0x78;

            s = &ui->unk154;
            s->graphics.anim = 0x378;
            s->variant = 1;
            UpdateSpriteAnimation(s);
        }
        return;
    }

    if (stage->rings < stage->ringsTarget) {
        stage->targetReached = FALSE;

        s = &ui->unk154;
        s->graphics.anim = 0x378;
        s->variant = 0;
        UpdateSpriteAnimation(s);
    } else {
        s = &ui->unk154;
        UpdateSpriteAnimation(s);
    }
}

static void HandlePaused(struct SpecialStageUI *ui)
{
    Sprite *s = &ui->pauseMenu;
    s16 lang = LanguageIndex(gLoadedSaveGame->language);

    const u16 pauseMenuSprites[6][3];
    memcpy((void *)&pauseMenuSprites, sPauseMenuVariants, 0x24);

    sub_806CA88(s, 1, pauseMenuSprites[lang][0], pauseMenuSprites[lang][1], 0x1000, 0x78,
                0x50, 0, pauseMenuSprites[lang][2], 0);

    DmaCopy16(3, &gObjPalette[249], ui->pauseMenuPalette1, 6);
    DmaCopy16(3, &gObjPalette[252], ui->pauseMenuPalette2, 6);
    ui->wasPaused = TRUE;
    m4aMPlayAllStop();
    m4aSongNumStart(SE_PAUSE_SCREEN);
}

#define SomeMacro807028C(i) ({ ((i)*8) + 0x100; })

static void
SpecialStageResultsScreenCreateUI(struct SpecialStageResultsScreen *resultsScreen)
{
    const struct UNK_80DF670 *sprite;
    struct SpecialStage *stage = resultsScreen->stage;
    s16 a = 0x30, b = 0x30, c = 0x30;
    s16 d = 0x9E, e = 0x9E, f = 0x9E;
    s16 i;

    u8 chaosEmeralds = gLoadedSaveGame->chaosEmeralds[stage->character];
    u8 character = stage->character;

    gUnknown_03005B5C = stage->screenVram;
    gUnknown_03005B58 = NULL;

    if (stage->targetReached) {
        sub_806CA88(&resultsScreen->unk4, 1, 0x28, 0x37d, 0, 0x100 + a, 0x20, 0, 1, 0);
        sub_806CA88(&resultsScreen->unk34, 1, gUnknown_080DF880[character].unk4,
                    gUnknown_080DF880[character].anim, 0, 0x100 + a, 0x18, 0,
                    gUnknown_080DF880[character].variant, 0);
    } else {
        sub_806CA88(&resultsScreen->unk4, 1, 0x20, 0x37d, 0, 0x100 + a, 0x20, 0, 0, 0);
    }

    sub_806CA88(&resultsScreen->unk1B4, 1, 0x16, 0x37E, 0, 0x100 + a, 0x48, 0, 0, 0);
    sub_806CA88(&resultsScreen->unk1E4, 1, 0x16, 0x37E, 0, 0x100 + b, 0x5C, 0, 1, 0);
    sub_806CA88(&resultsScreen->unk214, 1, 0x16, 0x37E, 0, 0x100 + c, 0x70, 0, 2, 0);

    for (i = 0; i < 5; i++) {
        sub_806CA88(&resultsScreen->unk244[i], 1, sDigitSprites[0].unk4,
                    sDigitSprites[0].anim, 0, d + SomeMacro807028C(i), 0x58, 0,
                    sDigitSprites[0].variant, 0);
    }

    for (i = 0; i < 5; i++) {
        sub_806CA88(&resultsScreen->unk334[i], 1, sDigitSprites[0].unk4,
                    sDigitSprites[0].anim, 0, e + SomeMacro807028C(i), 0x6C, 0,
                    sDigitSprites[0].variant, 0);
    }

    for (i = 0; i < 5; i++) {
        sub_806CA88(&resultsScreen->unk424[i], 1, sDigitSprites[0].unk4,
                    sDigitSprites[0].anim, 0, f + SomeMacro807028C(i), 0x80, 0,
                    sDigitSprites[0].variant, 0);
    }

    for (i = 0; i < NUM_COURSE_ZONES; i++) {
        if (chaosEmeralds & CHAOS_EMERALD(i)) {
            sprite = &sChaosEmeraldUnlockedSprites[i];
        } else {
            sprite = &sChaosEmeraldMissingSprites[0];
        }

        sub_806CA88(&resultsScreen->chaosEmerald[i], 1, 9, sprite->anim, 0, i * 24 + 292,
                    0x34, 0, sprite->variant, 0);
    }

    resultsScreen->animFrame = 0;
    resultsScreen->unk516 = 256;
    resultsScreen->unk518 = 256;
    resultsScreen->unk51A = 256;
    resultsScreen->unk51C = 256;
    resultsScreen->unk51E = 256;
}

void sub_807061C(s16);

void sub_8070680(s16);
void sub_80706D8(s16);
void sub_8070740(s16);
void sub_80707A8(s16);

static void RenderScoresAnim(void);
void Task_ResultsScreenSequencePart2(void);

void Task_ResultsScreenSequencePart1(void)
{
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);

    if (resultsScreen->animFrame < 12) {
        sub_807061C(resultsScreen->animFrame);
    }

    if (resultsScreen->animFrame > 7 && resultsScreen->animFrame < 20) {
        sub_8070680(resultsScreen->animFrame - 8);
    }

    if (resultsScreen->animFrame > 15 && resultsScreen->animFrame < 28) {
        sub_80706D8(resultsScreen->animFrame - 16);
    }

    if (resultsScreen->animFrame > 23 && resultsScreen->animFrame < 36) {
        sub_8070740(resultsScreen->animFrame - 24);
    }

    if (resultsScreen->animFrame > 31 && resultsScreen->animFrame < 44) {
        sub_80707A8(resultsScreen->animFrame - 32);
    }

    RenderScoresAnim();

    resultsScreen->animFrame++;

    if (resultsScreen->animFrame > 43) {
        gCurTask->main = Task_ResultsScreenSequencePart2;
    }
}

void sub_807061C(s16 a)
{
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;
    Sprite *s;

    resultsScreen->unk516 = (0xB - a) * 0x16;

    s = &resultsScreen->unk4;

    if (stage->targetReached) {
        s->x = resultsScreen->unk516 + 0x4C;
        s = &resultsScreen->unk34;
        s->x = resultsScreen->unk516 + 4;
    } else {
        s->x = resultsScreen->unk516 + 0x30;
    }
}

void sub_8070680(s16 a)
{
    s16 i;
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    resultsScreen->unk518 = (0xB - a) * 0x16;

    for (i = 0; i < 7; i++) {
        Sprite *s = &resultsScreen->chaosEmerald[i];
        s32 temp2 = (i * 0x18);
        s32 temp = resultsScreen->unk518 + 0x24;
        temp2 += temp;
        s->x = temp2;
    }
}

void sub_80706D8(s16 a)
{
    s16 i;

    Sprite *s;
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    resultsScreen->unk51A = (0xB - a) * 0x16;
    s = &resultsScreen->unk1B4;
    s->x = resultsScreen->unk51A + 0x30;

    for (i = 0; i < 5; i++) {
        s32 temp2, temp;

        s = &resultsScreen->unk244[i];
        temp2 = (i * 8);
        temp = resultsScreen->unk51A + 0x9E;
        s->x = temp2 + temp;
    }
}

void sub_8070740(s16 a)
{
    s16 i;
    s32 temp2, temp;
    Sprite *s;
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    resultsScreen->unk51C = (0xB - a) * 0x16;
    s = &resultsScreen->unk1E4;
    s->x = resultsScreen->unk51C + 0x30;

    for (i = 0; i < 5; i++) {
        s = &resultsScreen->unk334[i];
        temp2 = (i * 8);
        temp = resultsScreen->unk51C + 0x9E;
        s->x = temp2 + temp;
    }
}

void sub_80707A8(s16 xPos)
{
    s16 i;
    s32 temp2, temp;
    Sprite *s;
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    resultsScreen->unk51E = (0xB - xPos) * 0x16;
    s = &resultsScreen->unk214;
    s->x = resultsScreen->unk51E + 0x30;

    for (i = 0; i < 5; i++) {
        s = &resultsScreen->unk424[i];
        temp2 = (i * 8);
        temp = resultsScreen->unk51E + 0x9E;
        s->x = temp2 + temp;
    }
}

void Task_ResultsScreenNewEmeraldSequencePart2(void);
void Task_ResultsScreenNewEmeraldSequencePart1(void)
{
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;
    u8 zone = stage->zone;
    RenderScoresAnim();

    resultsScreen->animFrame++;

    if (resultsScreen->animFrame > 11) {
        s16 emeraldIndex = zone;
        Sprite *s = &resultsScreen->chaosEmerald[emeraldIndex];
        s->graphics.anim = sChaosEmeraldUnlockedSprites[emeraldIndex].anim;
        s->variant = sChaosEmeraldUnlockedSprites[emeraldIndex].variant;
        gCurTask->main = Task_ResultsScreenNewEmeraldSequencePart2;
    }
}

static void RenderScoresAnim(void)
{
    Sprite *s;

    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    s16 i;
    s16 a[5], b[5], c[5];
    bool8 found;

    s32 points = stage->points;
    s32 bonusPoints = stage->bonusPoints;
    s32 finalScore = stage->finalScore;

    a[4] = points % 10;
    points /= 10;
    a[3] = points % 10;
    points /= 10;
    a[2] = points % 10;
    points /= 10;
    a[1] = points % 10;
    points /= 10;
    a[0] = points % 10;

    b[4] = bonusPoints % 10;
    bonusPoints /= 10;
    b[3] = bonusPoints % 10;
    bonusPoints /= 10;
    b[2] = bonusPoints % 10;
    bonusPoints /= 10;
    b[1] = bonusPoints % 10;
    bonusPoints /= 10;
    b[0] = bonusPoints % 10;

    c[4] = finalScore % 10;
    finalScore /= 10;
    c[3] = finalScore % 10;
    finalScore /= 10;
    c[2] = finalScore % 10;
    finalScore /= 10;
    c[1] = finalScore % 10;
    finalScore /= 10;
    c[0] = finalScore % 10;

    DisplaySprite(&resultsScreen->unk4);

    if (stage->targetReached) {
        DisplaySprite(&resultsScreen->unk34);
    }

    for (i = 0; i < 7; i++) {
        UpdateSpriteAnimation(&resultsScreen->chaosEmerald[i]);
        DisplaySprite(&resultsScreen->chaosEmerald[i]);
    }

    DisplaySprite(&resultsScreen->unk1B4);
    DisplaySprite(&resultsScreen->unk1E4);
    DisplaySprite(&resultsScreen->unk214);

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || a[i] != 0 || i == 4) {
            found = TRUE;
            s = &resultsScreen->unk244[i];
            s->graphics.anim = sDigitSprites[a[i]].anim;
            s->variant = sDigitSprites[a[i]].variant;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || b[i] != 0 || i == 4) {
            found = TRUE;
            s = &resultsScreen->unk334[i];
            s->graphics.anim = sDigitSprites[b[i]].anim;
            s->variant = sDigitSprites[b[i]].variant;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || c[i] != 0 || i == 4) {
            found = TRUE;
            s = &resultsScreen->unk424[i];
            s->graphics.anim = sDigitSprites[c[i]].anim;
            s->variant = sDigitSprites[c[i]].variant;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void sub_8070BEC(struct Task *);
static void CreateDisplays(struct SpecialStageUI *);

struct Task *CreateSpecialStageUI(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(sub_806FB04, 0x2B8, 0xD000, 0, sub_8070BEC);
    struct SpecialStageUI *ui = TASK_DATA(t);
    ui->stage = stage;
    ui->unk2A4 = NULL;

    ui->unk2A8 = 0;
    ui->wasPaused = 0;
    CreateDisplays(ui);

    return t;
}

void sub_8070BEC(struct Task *t)
{
    // Unused logic
}

void SpecialStageResultsScreenOnDestroy(struct Task *);

struct Task *CreateSpecialStageResultsScreen(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(Task_ResultsScreenSequencePart1, 0x520, 0xD000, 0,
                                SpecialStageResultsScreenOnDestroy);
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(t);
    resultsScreen->stage = stage;
    SpecialStageResultsScreenCreateUI(resultsScreen);

    return t;
}

void SpecialStageResultsScreenOnDestroy(struct Task *t)
{
    // Unsued logic
}

static void Task_ResultsScreenStartNewEmeraldSequence(void);

void SpecialStageResultsScreenNewEmeraldSequence(struct SpecialStage *stage)
{
    stage->uiTask->main = Task_ResultsScreenStartNewEmeraldSequence;
}

static void CreateMultiplierValue(struct SpecialStageUI *);

static void CreateDisplays(struct SpecialStageUI *ui)
{
    CreateStageTime(ui);
    CreateRingCounter(ui);
    CreateMultiplierValue(ui);
}

void sub_8070C58(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    if (stage->paused == FALSE) {
        sub_806FCF8();
    }

    DisplaySprite(&ui->timeSymbol);

    if (stage->timeHundreds != 0) {
        DisplaySprite(&ui->timeHundreds);
    }

    if ((stage->timeHundreds | stage->timeTens) != 0) {
        DisplaySprite(&ui->timeTens);
    }

    DisplaySprite(&ui->timeUnits);
}

static void CreateMultiplierValue(struct SpecialStageUI *ui)
{
    const struct UNK_80DF670 *unkF840 = &gUnknown_080DF840[0];
    sub_806CA88(&ui->multiplier, 0, unkF840->unk4, unkF840->anim, 0x1000, 0x70, 100, 2,
                unkF840->variant, 0);
}

void sub_8070D14(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);
    s16 unkC0 = player->multiplier;

    if (unkC0 > 1) {
        const struct UNK_80DF670 *unkF830 = &gUnknown_080DF830[unkC0];
        Sprite *s = &ui->multiplier;
        if (stage->paused == FALSE) {
            s->graphics.anim = unkF830->anim;
            s->variant = unkF830->variant;
            UpdateSpriteAnimation(s);
        }
        DisplaySprite(s);
    }
}

void sub_8070D80(struct SpecialStageUI *ui)
{
    Sprite *s = &ui->unk244;
    ui->unk2A8 = 1;
    ui->unk2A4 = gUnknown_03005B5C;
    sub_806CA88(s, 0, 0x14, 0x376, 0x1000, 0x78, 0x50, 1, 0, 0);
}

void sub_8070DD0(struct SpecialStageUI *ui) { DisplaySprite(&ui->unk244); }

void sub_8070DE0(struct SpecialStageUI *ui)
{
    gUnknown_03005B5C = ui->unk2A4;
    ui->unk2A4 = NULL;
    ui->unk2A8 = 0;
}

static void RenderPauseMenu(struct SpecialStageUI *ui)
{
    Sprite *s = &ui->pauseMenu;
    struct SpecialStage *stage = ui->stage;
    void *a, *b;

    if (stage->pauseMenuCursor == 0) {
        b = (void *)OBJ_PLTT + 0x1F8;
        a = (void *)OBJ_PLTT + 0x1F2;
    } else {
        b = (void *)OBJ_PLTT + 0x1F2;
        a = (void *)OBJ_PLTT + 0x1F8;
    }

    DmaCopy16(3, ui->pauseMenuPalette2, b, 6);
    DmaCopy16(3, ui->pauseMenuPalette1, a, 6);
    DisplaySprite(s);
}

static void HandleUnpaused(struct SpecialStageUI *ui)
{
    ui->wasPaused = 0;
    gUnknown_03005B58 = NULL;
    m4aMPlayAllContinue();
}

static void Task_ResultsScreenStartNewEmeraldSequence(void)
{
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;
    Sprite *s = &resultsScreen->chaosEmerald[stage->zone];

    s->graphics.anim = sChaosEmeraldUnlockedSprites[8].anim;
    s->variant = sChaosEmeraldUnlockedSprites[8].variant;
    RenderScoresAnim();
    resultsScreen->animFrame = 0;
    gCurTask->main = Task_ResultsScreenNewEmeraldSequencePart1;
}

void Task_ResultsScreenNewEmeraldSequencePart2(void) { RenderScoresAnim(); }

void Task_ResultsScreenSequencePart2(void) { RenderScoresAnim(); }
