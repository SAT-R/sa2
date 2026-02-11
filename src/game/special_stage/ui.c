#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"
#include "game/special_stage/main.h"
#include "game/special_stage/player.h"
#include "game/special_stage/ui.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/data.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"

void RenderTime(void);
void RenderRingCounters(void);
void RenderMultiplier(void);
void CreateStartText(struct SpecialStageUI *);
void RenderStartText(struct SpecialStageUI *);
void sub_8070DE0(struct SpecialStageUI *);
static void HandlePaused(struct SpecialStageUI *);
static void HandleUnpaused(struct SpecialStageUI *);
static void RenderPauseMenu(struct SpecialStageUI *);
static void Task_ResultsScreenStartNewEmeraldSequence(void);
static void CreateMultiplierValue(struct SpecialStageUI *);
void sub_807061C(s16);
void sub_8070680(s16);
void sub_80706D8(s16);
void sub_8070740(s16);
void sub_80707A8(s16);
static void RenderScoresAnim(void);
void Task_ResultsScreenSequencePart2(void);
void Task_ResultsScreenNewEmeraldSequencePart2(void);
void UpdateRingCounters(void);
void sub_8070BEC(struct Task *);
static void CreateDisplays(struct SpecialStageUI *);
void SpecialStageResultsScreenOnDestroy(struct Task *);

static const struct UNK_80DF670 sValueSprites[] = {
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('0'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('1'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('2'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('3'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('4'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('5'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('6'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('7'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('8'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR('9'), 2, 0, 0 },
    { SA2_ANIM_ASCII, SA2_ANIM_ASCII_CHAR(':'), 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x2, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x3, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x4, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x5, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x6, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x7, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x8, 2, 0, 0 },
    { SA2_ANIM_SP_STAGE_MULTIPLIER, SA2_ANIM_VARIANT_SP_STAGE_MULTIPLIER_x9, 2, 0, 0 },
};

static const struct UNK_80DF670 gUnknown_080DF880[] = {
    { SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_SONIC, 24, 0, 0 },
    { SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_CREAM, 27, 0, 0 },
    { SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_TAILS, 24, 0, 0 },
    { SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_KNUCKLES, 27, 0, 0 },
    { SA2_ANIM_CHAR_GOT_THROUGH, SA2_ANIM_VARIANT_CHAR_GOT_THROUGH_AMY, 18, 0, 0 },
};

static const struct UNK_80DF670 sChaosEmeraldUnlockedSprites[] = {
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_RED, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_BLUE, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_YELLOW, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_GREEN, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_WHITE, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_CYAN, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_PURPLE, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_EMPTY, 9, 0, 0 },
    { SA2_ANIM_CHAOS_EMERALDS_UNLOCKED, SA2_ANIM_VARIANT_CHAOS_EMERALDS_UNLOCKED_SHINE, 9, 0, 0 },
};

void sub_806FB04(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    RenderTime();
    RenderRingCounters();
    RenderMultiplier();

    if (ui->unk2A8 == 0) {
        if (stage->state == 4) {
            CreateStartText(ui);
        }
    }

    if (ui->unk2A8 != 0) {
        if (stage->state != 4) {
            sub_8070DE0(ui);
        } else {
            if (stage->animFrame < 0x1E || stage->animFrame & 2) {
                RenderStartText(ui);
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
    Sprite unused;

    s16 timeHundreds = stage->timeHundreds;
    s16 timeTens = stage->timeTens;
    s16 timeUnits = stage->timeUnits;

    sub_806CA88(&ui->timeSymbol, RENDER_TARGET_SCREEN, 1, 0x377, 0x1000, DISPLAY_WIDTH - 48, 14, 1, 0, 0);

    unkF7E8 = &sValueSprites[timeHundreds];
    sub_806CA88(&ui->timeHundreds, RENDER_TARGET_SCREEN, unkF7E8->size, unkF7E8->anim, 0x1000, DISPLAY_WIDTH - 36, 18, 1, unkF7E8->variant,
                0);

    unkF7E8 = &sValueSprites[timeTens];
    sub_806CA88(&ui->timeTens, RENDER_TARGET_SCREEN, unkF7E8->size, unkF7E8->anim, 0x1000, DISPLAY_WIDTH - 28, 18, 1, unkF7E8->variant, 0);

    unkF7E8 = &sValueSprites[timeUnits];
    sub_806CA88(&ui->timeUnits, RENDER_TARGET_SCREEN, unkF7E8->size, unkF7E8->anim, 0x1000, DISPLAY_WIDTH - 20, 18, 1, unkF7E8->variant, 0);

    sub_806CA88(&unused, RENDER_TARGET_SCREEN, 0, 0x379, 0, 0, 0, 0, 0, 0);
}

static void UpdateStageTime(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    Sprite *s;
    const struct UNK_80DF670 *unkF7E8;

    u32 pal;

    s16 timeHundreds = stage->timeHundreds;
    s16 timeTens = stage->timeTens;
    s16 timeUnits = stage->timeUnits;

    ui->unk2AA = (ui->unk2AA + 1) & 255;

    if (timeHundreds == 0 && timeTens == 0) {
        if (ui->unk2AA & 8) {
            pal = 0;
        } else {
            pal = 3;
        }
    } else if (timeHundreds == 0 && timeTens < 3) {
        if (ui->unk2AA & 16) {
            pal = 0;
        } else {
            pal = 3;
        }
    } else {
        pal = 0;
    }

    if (timeHundreds != 0) {
        unkF7E8 = &sValueSprites[timeHundreds];
        s = &ui->timeHundreds;
        s->graphics.anim = unkF7E8->anim;
        s->variant = unkF7E8->variant;
        s->frameFlags |= 0x40000;
        s->palId = pal;
        UpdateSpriteAnimation(s);
    }

    if ((timeHundreds | timeTens) != 0) {
        unkF7E8 = &sValueSprites[timeTens];
        s = &ui->timeTens;
        s->graphics.anim = unkF7E8->anim;
        s->variant = unkF7E8->variant;
        s->frameFlags |= 0x40000;
        s->palId = pal;
        UpdateSpriteAnimation(s);
    }

    unkF7E8 = &sValueSprites[timeUnits];
    s = &ui->timeUnits;
    s->graphics.anim = unkF7E8->anim;
    s->variant = unkF7E8->variant;
    s->frameFlags |= 0x40000;
    s->palId = pal;
    UpdateSpriteAnimation(s);
}

static void CreateRingCounter(struct SpecialStageUI *ui)
{
    struct SpecialStage *stage = ui->stage;

    Sprite *s;
    const struct UNK_80DF670 *sprite;

    sprite = &sValueSprites[stage->ringsHundreds];
    sub_806CA88(&ui->ringsHundredsDigit, RENDER_TARGET_SCREEN, sprite->size, sprite->anim, 0x1000, (DISPLAY_WIDTH / 2) - 20, 16, 1,
                sprite->variant, 0);

    sprite = &sValueSprites[stage->ringsTens];
    sub_806CA88(&ui->ringsTensDigit, RENDER_TARGET_SCREEN, sprite->size, sprite->anim, 0x1000, (DISPLAY_WIDTH / 2) - 12, 16, 1,
                sprite->variant, 0);

    sprite = &sValueSprites[stage->ringsUnits];
    sub_806CA88(&ui->ringsUnitsDigit, RENDER_TARGET_SCREEN, sprite->size, sprite->anim, 0x1000, (DISPLAY_WIDTH / 2) - 4, 16, 1,
                sprite->variant, 0);

    sub_806CA88(&ui->unk154, RENDER_TARGET_SCREEN, 8, 0x378, 0x1000, (DISPLAY_WIDTH / 2), 14, 2, 0, 0);

    sprite = &sValueSprites[stage->ringsTargetHundreds];
    sub_806CA88(&ui->ringsTargetHundredsDigit, RENDER_TARGET_SCREEN, sprite->size, sprite->anim, 0x1000, (DISPLAY_WIDTH / 2) + 4, 24, 1,
                sprite->variant, 0);

    sprite = &sValueSprites[stage->ringsTargetTens];
    sub_806CA88(&ui->ringsTargetTensDigit, RENDER_TARGET_SCREEN, sprite->size, sprite->anim, 0x1000, (DISPLAY_WIDTH / 2) + 12, 24, 1,
                sprite->variant, 0);

    sprite = &sValueSprites[stage->ringsTargetUnits];
    sub_806CA88(&ui->ringsTargetUnitsDigit, RENDER_TARGET_SCREEN, sprite->size, sprite->anim, 0x1000, (DISPLAY_WIDTH / 2) + 20, 24, 1,
                sprite->variant, 0);
}

void RenderRingCounters(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    if (stage->paused == FALSE) {
        UpdateRingCounters();
    }

    if (stage->ringsHundreds != 0) {
        DisplaySprite(&ui->ringsHundredsDigit);
    }

    if (stage->ringsHundreds != 0 || stage->ringsTens != 0) {
        DisplaySprite(&ui->ringsTensDigit);
    }

    DisplaySprite(&ui->ringsUnitsDigit);
    DisplaySprite(&ui->unk154);

    if (stage->ringsTargetHundreds != 0) {
        DisplaySprite(&ui->ringsTargetHundredsDigit);
    }

    if (stage->ringsTargetHundreds != 0 || stage->ringsTargetTens != 0) {
        DisplaySprite(&ui->ringsTargetTensDigit);
    }

    DisplaySprite(&ui->ringsTargetUnitsDigit);
}

void UpdateRingCounters(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    Sprite *s;
    const struct UNK_80DF670 *sprite;

    sprite = &sValueSprites[stage->ringsHundreds];
    s = &ui->ringsHundredsDigit;
    s->graphics.anim = sprite->anim;
    s->variant = sprite->variant;
    UpdateSpriteAnimation(s);

    sprite = &sValueSprites[stage->ringsTens];
    s = &ui->ringsTensDigit;
    s->graphics.anim = sprite->anim;
    s->variant = sprite->variant;
    UpdateSpriteAnimation(s);

    sprite = &sValueSprites[stage->ringsUnits];
    s = &ui->ringsUnitsDigit;
    s->graphics.anim = sprite->anim;
    s->variant = sprite->variant;
    UpdateSpriteAnimation(s);

    if (stage->targetReached == FALSE) {
        if (stage->rings >= stage->ringsTarget) {
            stage->targetReached = TRUE;
            m4aSongNumStart(MUS_ACHIEVEMENT);
            stage->unk5C7 = 1;
            stage->unk5C8 = 120;

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

    const u16 pauseMenuVariants[][3] = {
        { 40, SA2_ANIM_PAUSE_MENU_JP, 0 }, { 40, SA2_ANIM_PAUSE_MENU_EN, 0 }, { 40, SA2_ANIM_PAUSE_MENU_DE, 0 },
        { 40, SA2_ANIM_PAUSE_MENU_FR, 0 }, { 40, SA2_ANIM_PAUSE_MENU_ES, 0 }, { 40, SA2_ANIM_PAUSE_MENU_IT, 0 },
    };

    sub_806CA88(s, 1, pauseMenuVariants[lang][0], pauseMenuVariants[lang][1], 0x1000, (DISPLAY_WIDTH / 2), (DISPLAY_HEIGHT / 2), 0,
                pauseMenuVariants[lang][2], 0);

    DmaCopy16(3, &gObjPalette[15 * 16 + 9], ui->pauseMenuPalette1, sizeof(ui->pauseMenuPalette1));
    DmaCopy16(3, &gObjPalette[15 * 16 + 12], ui->pauseMenuPalette2, sizeof(ui->pauseMenuPalette2));
    ui->wasPaused = TRUE;
    m4aMPlayAllStop();
    m4aSongNumStart(SE_PAUSE_SCREEN);
}

#define SomeMacro807028C(i) ({ ((i)*8) + DISPLAY_WIDTH + 16; })

static void SpecialStageResultsScreenCreateUI(struct SpecialStageResultsScreen *resultsScreen)
{
    const struct UNK_80DF670 *sprite;
    struct SpecialStage *stage = resultsScreen->stage;
    s16 a = (DISPLAY_WIDTH / 2) - 72, b = (DISPLAY_WIDTH / 2) - 72, c = (DISPLAY_WIDTH / 2) - 72;
    s16 d = (DISPLAY_WIDTH / 2) + 38, e = (DISPLAY_WIDTH / 2) + 38, f = (DISPLAY_WIDTH / 2) + 38;
    s16 i;

    u8 chaosEmeralds = gLoadedSaveGame->chaosEmeralds[stage->character];
    u8 character = stage->character;

    gUnknown_03005B5C = stage->screenVram;
    gUnknown_03005B58 = NULL;

    if (stage->targetReached) {
        sub_806CA88(&resultsScreen->unk4, 1, 0x28, SA2_ANIM_SP_STAGE_NOTIFS, 0, DISPLAY_WIDTH + 16 + a, (DISPLAY_HEIGHT / 2) - 48, 0, 1, 0);
        sub_806CA88(&resultsScreen->unk34, 1, gUnknown_080DF880[character].size, gUnknown_080DF880[character].anim, 0,
                    DISPLAY_WIDTH + 16 + a, (DISPLAY_HEIGHT / 2) - 56, 0, gUnknown_080DF880[character].variant, 0);
    } else {
        sub_806CA88(&resultsScreen->unk4, 1, 0x20, SA2_ANIM_SP_STAGE_NOTIFS, 0, DISPLAY_WIDTH + 16 + a, (DISPLAY_HEIGHT / 2) - 48, 0, 0, 0);
    }

    sub_806CA88(&resultsScreen->unk1B4, 1, 0x16, SA2_ANIM_SP_STAGE_SCORE_BONUSES, 0, DISPLAY_WIDTH + 16 + a, (DISPLAY_HEIGHT / 2) - 8, 0, 0,
                0);
    sub_806CA88(&resultsScreen->unk1E4, 1, 0x16, SA2_ANIM_SP_STAGE_SCORE_BONUSES, 0, DISPLAY_WIDTH + 16 + b, (DISPLAY_HEIGHT / 2) + 12, 0,
                1, 0);
    sub_806CA88(&resultsScreen->unk214, 1, 0x16, SA2_ANIM_SP_STAGE_SCORE_BONUSES, 0, DISPLAY_WIDTH + 16 + c, (DISPLAY_HEIGHT / 2) + 32, 0,
                2, 0);

    for (i = 0; i < 5; i++) {
        sub_806CA88(&resultsScreen->unk244[i], 1, sValueSprites[0].size, sValueSprites[0].anim, 0, d + SomeMacro807028C(i),
                    (DISPLAY_HEIGHT / 2) + 8, 0, sValueSprites[0].variant, 0);
    }

    for (i = 0; i < 5; i++) {
        sub_806CA88(&resultsScreen->unk334[i], 1, sValueSprites[0].size, sValueSprites[0].anim, 0, e + SomeMacro807028C(i),
                    (DISPLAY_HEIGHT / 2) + 28, 0, sValueSprites[0].variant, 0);
    }

    for (i = 0; i < 5; i++) {
        sub_806CA88(&resultsScreen->unk424[i], 1, sValueSprites[0].size, sValueSprites[0].anim, 0, f + SomeMacro807028C(i),
                    (DISPLAY_HEIGHT / 2) + 48, 0, sValueSprites[0].variant, 0);
    }

    for (i = 0; i < NUM_COURSE_ZONES; i++) {
        if (chaosEmeralds & CHAOS_EMERALD(i)) {
            sprite = &sChaosEmeraldUnlockedSprites[i];
        } else {
            sprite = &sChaosEmeraldUnlockedSprites[7];
        }

        sub_806CA88(&resultsScreen->chaosEmerald[i], 1, 9, sprite->anim, 0, i * 24 + DISPLAY_WIDTH + 52, (DISPLAY_HEIGHT / 2) - 28, 0,
                    sprite->variant, 0);
    }

    resultsScreen->animFrame = 0;
    resultsScreen->unk516 = DISPLAY_WIDTH + 16;
    resultsScreen->unk518 = DISPLAY_WIDTH + 16;
    resultsScreen->unk51A = DISPLAY_WIDTH + 16;
    resultsScreen->unk51C = DISPLAY_WIDTH + 16;
    resultsScreen->unk51E = DISPLAY_WIDTH + 16;
}

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

    resultsScreen->unk516 = (11 - a) * 22;

    s = &resultsScreen->unk4;

    if (stage->targetReached) {
        s->x = resultsScreen->unk516 + (DISPLAY_WIDTH / 2) - 44;
        s = &resultsScreen->unk34;
        s->x = resultsScreen->unk516 + (DISPLAY_WIDTH / 2) - 116;
    } else {
        s->x = resultsScreen->unk516 + (DISPLAY_WIDTH / 2) - 72;
    }
}

void sub_8070680(s16 a)
{
    s16 i;
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    resultsScreen->unk518 = (11 - a) * 22;

    for (i = 0; i < 7; i++) {
        Sprite *s = &resultsScreen->chaosEmerald[i];
        s32 x = (i * 24);
        s32 base = resultsScreen->unk518 + (DISPLAY_WIDTH / 2) - 84;
        x += base;
        s->x = x;
    }
}

void sub_80706D8(s16 a)
{
    s16 i;

    Sprite *s;
    struct SpecialStageResultsScreen *resultsScreen = TASK_DATA(gCurTask);
    struct SpecialStage *stage = resultsScreen->stage;

    resultsScreen->unk51A = (11 - a) * 22;
    s = &resultsScreen->unk1B4;
    s->x = resultsScreen->unk51A + (DISPLAY_WIDTH / 2) - 72;

    for (i = 0; i < 5; i++) {
        s32 temp2, temp;

        s = &resultsScreen->unk244[i];
        temp2 = (i * 8);
        temp = resultsScreen->unk51A + (DISPLAY_WIDTH / 2) + 38;
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

    resultsScreen->unk51C = (11 - a) * 22;
    s = &resultsScreen->unk1E4;
    s->x = resultsScreen->unk51C + (DISPLAY_WIDTH / 2) - 72;

    for (i = 0; i < 5; i++) {
        s = &resultsScreen->unk334[i];
        temp2 = (i * 8);
        temp = resultsScreen->unk51C + (DISPLAY_WIDTH / 2) + 38;
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

    resultsScreen->unk51E = (11 - xPos) * 22;
    s = &resultsScreen->unk214;
    s->x = resultsScreen->unk51E + (DISPLAY_WIDTH / 2) - 72;

    for (i = 0; i < 5; i++) {
        s = &resultsScreen->unk424[i];
        temp2 = (i * 8);
        temp = resultsScreen->unk51E + (DISPLAY_WIDTH / 2) + 38;
        s->x = temp2 + temp;
    }
}

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
            s->graphics.anim = sValueSprites[a[i]].anim;
            s->variant = sValueSprites[a[i]].variant;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || b[i] != 0 || i == 4) {
            found = TRUE;
            s = &resultsScreen->unk334[i];
            s->graphics.anim = sValueSprites[b[i]].anim;
            s->variant = sValueSprites[b[i]].variant;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || c[i] != 0 || i == 4) {
            found = TRUE;
            s = &resultsScreen->unk424[i];
            s->graphics.anim = sValueSprites[c[i]].anim;
            s->variant = sValueSprites[c[i]].variant;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

struct Task *CreateSpecialStageUI(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(sub_806FB04, sizeof(struct SpecialStageUI), 0xD000, 0, sub_8070BEC);
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

struct Task *CreateSpecialStageResultsScreen(struct SpecialStage *stage)
{
    struct Task *t = TaskCreate(Task_ResultsScreenSequencePart1, sizeof(struct SpecialStageResultsScreen), 0xD000, 0,
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

void SpecialStageResultsScreenNewEmeraldSequence(struct SpecialStage *stage)
{
    stage->uiTask->main = Task_ResultsScreenStartNewEmeraldSequence;
}

static void CreateDisplays(struct SpecialStageUI *ui)
{
    CreateStageTime(ui);
    CreateRingCounter(ui);
    CreateMultiplierValue(ui);
}

void RenderTime(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;

    if (stage->paused == FALSE) {
        UpdateStageTime();
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
    const struct UNK_80DF670 *unkF840 = &sValueSprites[11];
    sub_806CA88(&ui->multiplier, 0, unkF840->size, unkF840->anim, 0x1000, (DISPLAY_WIDTH / 2) - 8, (DISPLAY_HEIGHT / 2) + 20, 2,
                unkF840->variant, 0);
}

void RenderMultiplier(void)
{
    struct SpecialStageUI *ui = TASK_DATA(gCurTask);
    struct SpecialStage *stage = ui->stage;
    struct SpecialStagePlayer *player = TASK_DATA(stage->playerTask);
    s16 unkC0 = player->multiplier;

    if (unkC0 > 1) {
        const struct UNK_80DF670 *unkF830 = &sValueSprites[unkC0 + 9];
        Sprite *s = &ui->multiplier;
        if (stage->paused == FALSE) {
            s->graphics.anim = unkF830->anim;
            s->variant = unkF830->variant;
            UpdateSpriteAnimation(s);
        }
        DisplaySprite(s);
    }
}

void CreateStartText(struct SpecialStageUI *ui)
{
    Sprite *s = &ui->startText;
    ui->unk2A8 = 1;
    ui->unk2A4 = gUnknown_03005B5C;
    sub_806CA88(s, 0, 20, 0x376, 0x1000, DISPLAY_WIDTH / 2, DISPLAY_HEIGHT / 2, 1, 0, 0);
}

void RenderStartText(struct SpecialStageUI *ui) { DisplaySprite(&ui->startText); }

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

    DmaCopy16(3, ui->pauseMenuPalette2, b, sizeof(ui->pauseMenuPalette2));
    DmaCopy16(3, ui->pauseMenuPalette1, a, sizeof(ui->pauseMenuPalette1));
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
