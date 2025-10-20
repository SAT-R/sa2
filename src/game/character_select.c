#include "global.h"
#include "core.h"
#include "game/stage/screen_fade.h"
#include "game/stage/stage.h"
#include "sprite.h"
#include "game/character_select.h"
#include "game/save.h"
#include "lib/m4a/m4a.h"
#include "task.h"
#include "malloc_vram.h"
#include "flags.h"
#include "trig.h"
#include "game/multiplayer/multipak_connection.h"
#include "game/multiplayer/results.h"
#include "game/options_screen.h"
#include "game/course_select.h"
#include "game/title_screen.h"
#include "game/time_attack/lobby.h"
#include "game/time_attack/mode_select.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/text.h"
#include "constants/tilemaps.h"

struct CharacterSelectionScreen {
    /* 0x00 */ ScreenFade fade;
    /* 0x0C */ Background unkC;
    /* 0x4C */ Background unk4C;
    /* 0x8C */ Background unk8C;
    /* 0xCC */ Sprite screenTitleText;
    /* 0xFC */ Sprite characterSprite;
    /* 0x12C */ Sprite characterNameSubText;

    /* 0x15C */ Sprite characterTitleTextLeft;
    /* 0x18C */ SpriteTransform characterTitleLeftTransform;

    /* 0x198 */ Sprite characterTitleTextRight;
    /* 0x1C8 */ SpriteTransform characterTitleRightTransform;

    /* 0x1D4 */ Sprite carouselBlobs[NUM_CHARACTERS];
    /* 0x2C4 */ Sprite selectedCarouselBlob;
    /* 0x2F4 */ SpriteTransform selectedBlobTransform;

    /* 0x300 */ Sprite scrollUpArrow;
    /* 0x330 */ Sprite scrollDownArrow;

    /* 0x360 */ Sprite characterSecondarySprite;
    /* 0x390 */ Sprite characterUnavailableIndicator;
    /* 0x3C0 */ u8 initialSelection;
    /* 0x3C1 */ u8 selectedCharacter;
    /* 0x3C2 */ u8 previousSelection;

    /* 0x3C3 */ bool8 amyUnlocked;

    /* 0x3C4 */ u8 unk3C4;

    /* 0x3C5 */ u8 cursorAnimFrame;

    /* 0x3C6 */ u8 upArrowActviteFrames;
    /* 0x3C7 */ u8 downArrowActiveFrames;

    /* 0x3C8 */ bool8 selectionComplete;
    /* 0x3C9 */ bool8 exiting;
    /* 0x3CA */ u8 availableCharacters;

    /* 0x3CB */ bool8 scrollingDown;

    /* 0x3CC */ u8 confirmationHandshakeAttempts;

    /* 0x3CE */ u16 characterBaseXPos;
    /* 0x3D0 */ u16 characterSubTextBaseXPos;

    /* 0x3D4 */ u32 animFrame;
    /* 0x3D8 */ u32 carouselPosition;
    /* 0x3DC */ u32 multiplayerSelections;
}; /* size 0x3E0 */

static void CharacterSelectScreenOnDestroy(struct Task *);
static void Task_CharacterSelectMain(void);

static void Task_FadeInAndStartRollInAnim(void);
static void Task_RollInAnim(void);
static void RenderCarouselRollInAnim(struct CharacterSelectionScreen *characterScreen);

static void Task_TransitionInUIAnim(void);
static void RenderTransitionInUIAnim(struct CharacterSelectionScreen *characterScreen);

static void Task_HandleCarouselScrollUp(void);
static void Task_HandleCarouselScrollDown(void);
static void Task_CarouselScrollCompleteAnim(void);
static void RenderCarouselScrollAnim(struct CharacterSelectionScreen *characterScreen);

static void Task_SelectionCompleteFadeOutAndExit(void);
static void Task_MultiplayerWaitForSelections(void);
static void Task_MultiplayerVerifySelections(void);

static void Task_FadeOutAndExitToPrevious(void);

static void RenderUI(struct CharacterSelectionScreen *);

#define CHARACTER_HIDDEN_LABEL 5

static ALIGNED(4) const u16 sCharacterTitleLeftSideAssets[][2] = {
    [CHARACTER_SONIC] = { 739, 0 },    [CHARACTER_CREAM] = { 739, 8 }, [CHARACTER_TAILS] = { 739, 2 },
    [CHARACTER_KNUCKLES] = { 739, 4 }, [CHARACTER_AMY] = { 739, 6 },   [CHARACTER_HIDDEN_LABEL] = { 739, 10 },
};

static const u16 sCharacteTitleRightSideAssets[][2] = {
    [CHARACTER_SONIC] = { 739, 1 },    [CHARACTER_CREAM] = { 739, 9 }, [CHARACTER_TAILS] = { 739, 3 },
    [CHARACTER_KNUCKLES] = { 739, 5 }, [CHARACTER_AMY] = { 739, 7 },   [CHARACTER_HIDDEN_LABEL] = { 739, 11 },
};

static const u16 sCharacterSpriteAssets[][2] = {
    [CHARACTER_SONIC] = { 736, 0 },    [CHARACTER_CREAM] = { 736, 2 }, [CHARACTER_TAILS] = { 736, 4 },
    [CHARACTER_KNUCKLES] = { 736, 6 }, [CHARACTER_AMY] = { 736, 8 },
};

static const u16 sCharacterSelectedSpriteAssets[][2] = {
    [CHARACTER_SONIC] = { 736, 1 },    [CHARACTER_CREAM] = { 736, 3 }, [CHARACTER_TAILS] = { 736, 5 },
    [CHARACTER_KNUCKLES] = { 736, 7 }, [CHARACTER_AMY] = { 736, 9 },
};

static const u16 sCharacterNameSubTextAssets[][2] = {
    { 741, 0 }, { 741, 1 }, { 741, 2 }, { 741, 3 }, { 741, 4 }, { 741, 5 },
    { 747, 0 }, { 747, 1 }, { 747, 2 }, { 747, 3 }, { 747, 4 }, { 741, 5 },
};

static const u16 sScreenTitleTextAssets[][2] = {
    [LanguageIndex(LANG_JAPANESE)] = { 740, 0 }, [LanguageIndex(LANG_ENGLISH)] = { 743, 0 }, [LanguageIndex(LANG_GERMAN)] = { 744, 0 },
    [LanguageIndex(LANG_FRENCH)] = { 748, 0 },   [LanguageIndex(LANG_SPANISH)] = { 745, 0 }, [LanguageIndex(LANG_ITALIAN)] = { 746, 0 },
};

static const u8 gUnknown_080D7274[] = { 8, 10, 10, 14 };
static const u16 gCharacterAnnouncements[] = {
    [CHARACTER_SONIC] = VOICE__ANNOUNCER__SONIC, [CHARACTER_CREAM] = VOICE__ANNOUNCER__CREAM,
    [CHARACTER_TAILS] = VOICE__ANNOUNCER__TAILS, [CHARACTER_KNUCKLES] = VOICE__ANNOUNCER__KNUCKLES,
    [CHARACTER_AMY] = VOICE__ANNOUNCER__AMY,
};

static const u8 gUnknown_080D7282[][5] = {
    // part 1
    { 1, 2, 3, 0, 0 },
    { 1, 2, 3, 4, 0 },

    // part 2
    { 3, 0, 1, 2, 0 },
    { 4, 0, 1, 2, 3 },
};
static const u16 sCourselScrollAnimVelocities[] = {
    0, 1536, 2048, 2560, 3328, 3712, 3584, 3328, 2560, 2048, 1536,
};

static const u8 sCharacterChosenAnimLengths[] = {
    [CHARACTER_SONIC] = 30, [CHARACTER_CREAM] = 30, [CHARACTER_TAILS] = 30, [CHARACTER_KNUCKLES] = 30, [CHARACTER_AMY] = 30,
};

#define CHEESE_SILHOUETTE 5

static const u8 sCharacterSilhouettes[] = {
    [CHARACTER_SONIC] = 8,    [CHARACTER_CREAM] = 4, [CHARACTER_TAILS] = 7,
    [CHARACTER_KNUCKLES] = 6, [CHARACTER_AMY] = 5,   [CHEESE_SILHOUETTE] = 3,
};

#define BackgroundAnim()                                                                                                                   \
    ({                                                                                                                                     \
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;                                                                            \
        gBgScrollRegs[2][0] = (gBgScrollRegs[2][0] - 1) & 0xFF;                                                                            \
        gBgScrollRegs[2][1] = (gBgScrollRegs[2][1] + 1) & 0xFF;                                                                            \
    })

// These values have to be passed in, as it seems some of the
// functions don't use u8 i values, who knows what's going on here
#define ReadMultiplayerSelections(characterScreen, i, packet)                                                                              \
    ({                                                                                                                                     \
        (characterScreen)->multiplayerSelections = 0;                                                                                      \
        for ((i) = 0; (i) < MULTI_SIO_PLAYERS_MAX; (i)++) {                                                                                \
            if ((i) != SIO_MULTI_CNT->id && GetBit(gMultiplayerConnections, (i))) {                                                        \
                (packet) = &gMultiSioRecv[(i)];                                                                                            \
                if ((packet)->pat0.unk0 > 0x4020) {                                                                                        \
                    (characterScreen)->multiplayerSelections |= CHARACTER_BIT(packet->pat0.unk2);                                          \
                }                                                                                                                          \
            }                                                                                                                              \
        }                                                                                                                                  \
    })

void CreateCharacterSelectionScreen(u8 initialSelection, bool8 allUnlocked)
{
    struct Task *t;

    Sprite *s = NULL;
    ScreenFade *fade = NULL;
    Background *background = NULL;
    struct CharacterSelectionScreen *characterScreen;

    s8 something;
    u8 i;
    s8 lang;
    lang = gLoadedSaveGame->language - 1;
    if (lang < 0) {
        lang = 0;
    }

    if (lang < 1) {
        something = 0;
    } else {
        something = 1;
    }

    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, &gMultiSioRecv, sizeof(gMultiSioRecv));
    gMultiplayerMissingHeartbeats[3] = 0;
    gMultiplayerMissingHeartbeats[2] = 0;
    gMultiplayerMissingHeartbeats[1] = 0;
    gMultiplayerMissingHeartbeats[0] = 0;

    m4aSongNumStart(MUS_CHARACTER_SELECTION);
    gDispCnt = 0x1740;
    gBgCntRegs[2] = 0x1507;
    gBgCntRegs[1] = 0x160E;
    gBgCntRegs[0] = 0x1403;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(Task_FadeInAndStartRollInAnim, sizeof(struct CharacterSelectionScreen), 0x4100, 0, CharacterSelectScreenOnDestroy);
    characterScreen = TASK_DATA(t);

    characterScreen->availableCharacters = gLoadedSaveGame->unlockedCharacters;
    characterScreen->selectedCharacter = initialSelection;
    characterScreen->unk3C4 = 0x10;
    characterScreen->cursorAnimFrame = 0;
    characterScreen->upArrowActviteFrames = 0;
    characterScreen->downArrowActiveFrames = 0;
    characterScreen->animFrame = 0;
    characterScreen->characterBaseXPos = 0xA6;
    characterScreen->characterSubTextBaseXPos = 0xA6;
    characterScreen->selectionComplete = FALSE;
    characterScreen->multiplayerSelections = 0;
    characterScreen->exiting = FALSE;
    characterScreen->scrollingDown = FALSE;

    if (allUnlocked) {
        characterScreen->carouselPosition = ((0x108 - (0x66 * initialSelection)) & 0x3FF) * 0x100 + 2;
        characterScreen->amyUnlocked = TRUE;
        characterScreen->initialSelection = initialSelection;

        if (initialSelection > CHARACTER_AMY) {
            characterScreen->initialSelection = CHARACTER_AMY;
        }
    } else {

        characterScreen->carouselPosition = ((0x16E - (initialSelection * 0x66)) & 0x3FF) * 0x100 + 4;
        characterScreen->amyUnlocked = FALSE;
        characterScreen->initialSelection = initialSelection;
        if (initialSelection > CHARACTER_KNUCKLES) {
            characterScreen->initialSelection = CHARACTER_KNUCKLES;
        }
    }

    fade = &characterScreen->fade;
    fade->window = SCREEN_FADE_USE_WINDOW_0;
    fade->brightness = 0;
    fade->flags = (SCREEN_FADE_FLAG_DARKEN | SCREEN_FADE_FLAG_2);
    fade->speed = 0x180;
    fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
    fade->bldAlpha = 0;
    UpdateScreenFade(fade);

    background = &characterScreen->unk8C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_CHARACTER_SELECT_WHEEL;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x1E;
    background->targetTilesY = 0x14;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(1);
    DrawBackground(background);

    background = &characterScreen->unkC;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_CHARACTER_SELECT_BACKGROUND_0;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(0);
    DrawBackground(background);

    background = &characterScreen->unk4C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->layoutVram = (void *)BG_SCREEN_ADDR(21);
    background->unk18 = 0;
    background->unk1A = 0;
    background->tilemapId = TM_CHARACTER_SELECT_BACKGROUND_1;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->targetTilesX = 0x20;
    background->targetTilesY = 0x20;
    background->paletteOffset = 0;
    background->flags = BACKGROUND_FLAGS_BG_ID(2);
    DrawBackground(background);

    for (i = 0; i < NUM_CHARACTERS; i++) {
        s = &characterScreen->carouselBlobs[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(0x10);
        s->graphics.anim = SA2_ANIM_CHAR_SELECT_CIRCLE;
        s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_INACTIVE + i;
        s->oamFlags = SPRITE_OAM_ORDER(4);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0;
        UpdateSpriteAnimation(s);
    }

    s = &characterScreen->selectedCarouselBlob;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x40);
    s->graphics.anim = SA2_ANIM_CHAR_SELECT_CIRCLE;
    s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->characterNameSubText;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x24);
    s->graphics.anim = sCharacterNameSubTextAssets[characterScreen->initialSelection + (something * 6)][0];
    s->variant = sCharacterNameSubTextAssets[characterScreen->initialSelection + (something * 6)][1];
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->characterTitleTextLeft;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x40);
    s->graphics.anim = sCharacterTitleLeftSideAssets[characterScreen->initialSelection][0];
    s->variant = sCharacterTitleLeftSideAssets[characterScreen->initialSelection][1];
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->characterTitleTextRight;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x40);
    s->graphics.anim = sCharacteTitleRightSideAssets[characterScreen->initialSelection][0];
    s->variant = sCharacteTitleRightSideAssets[characterScreen->initialSelection][1];
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->screenTitleText;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(0x36);
    s->graphics.anim = sScreenTitleTextAssets[lang][0];
    s->variant = sScreenTitleTextAssets[lang][1];
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->scrollUpArrow;
    s->x = 17;
    s->y = 18;
    s->graphics.dest = VramMalloc(0x18);
    s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->scrollDownArrow;
    s->x = 17;
    s->y = 142;
    s->graphics.dest = VramMalloc(0x18);
    s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x800;
    UpdateSpriteAnimation(s);

    s = &characterScreen->characterSecondarySprite;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x400);
    s->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
    s->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC);
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->characterUnavailableIndicator;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2580);
    s->graphics.anim = SA2_ANIM_CHAR_SELECT_RED_CROSS_BOX;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(1);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
#ifndef NON_MATCHING
    gLoadedSaveGame->language += 0;
#endif
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    s = &characterScreen->characterSprite;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x1000);
    s->graphics.anim = sCharacterSpriteAssets[characterScreen->initialSelection][0];
    s->variant = sCharacterSpriteAssets[characterScreen->initialSelection][1];
    s->oamFlags = SPRITE_OAM_ORDER(4);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
#ifndef NON_MATCHING
    (&characterScreen->characterSprite)->prevVariant = -1;
#else
    s->prevVariant = -1;
#endif
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0;
    UpdateSpriteAnimation(s);

    for (i = 0; i < 16; i++) {
        gObjPalette[i + 240] = 0;
    }

    gFlags |= 0x2;
}

static void Task_FadeInAndStartRollInAnim(void)
{
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    if (++characterScreen->animFrame > 23) {
        characterScreen->animFrame = 0;
        gCurTask->main = Task_RollInAnim;
    }

    UpdateScreenFade(&characterScreen->fade);
    DisplaySprite(&characterScreen->scrollUpArrow);
    DisplaySprite(&characterScreen->scrollDownArrow);

    BackgroundAnim();
}

static void Task_RollInAnim(void)
{
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
#ifndef NON_MATCHING
    register u32 animFrame asm("r3") = ++characterScreen->animFrame;
    register u32 r0 asm("r0");
#else
    u32 animFrame = ++characterScreen->animFrame;
#endif

    if (animFrame > 60 || ((gPressedKeys & A_BUTTON) && IS_SINGLE_PLAYER)) {
        characterScreen->cursorAnimFrame++;
        characterScreen->carouselPosition = characterScreen->initialSelection * -0x6600;
        if (characterScreen->amyUnlocked) {
            characterScreen->carouselPosition += 2;
        } else {
            characterScreen->carouselPosition += 4;
        }
        characterScreen->carouselPosition &= 0x3FFFF;
        characterScreen->animFrame = 0;
        gCurTask->main = Task_TransitionInUIAnim;
        RenderTransitionInUIAnim(characterScreen);
    } else {
#ifndef NON_MATCHING
        characterScreen->carouselPosition -= Div(gSineTable[(((r0 = animFrame + 4) << 2) & 0x3FF) + 0x100], 3);
#else
        characterScreen->carouselPosition -= Div(gSineTable[(((animFrame + 4) << 2) & 0x3FF) + 0x100], 3);
#endif
        if (characterScreen->amyUnlocked) {
            characterScreen->carouselPosition += 6;
        } else {
            characterScreen->carouselPosition += 12;
        }
        characterScreen->carouselPosition &= 0x3FFFF;
        RenderCarouselRollInAnim(characterScreen);
    }

    BackgroundAnim();
}

static void Task_TransitionInUIAnim(void)
{
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    u32 animFrame = ++characterScreen->animFrame;
    characterScreen->cursorAnimFrame++;
    if (animFrame >= 16) {
        characterScreen->cursorAnimFrame++;
        characterScreen->animFrame = 0;
        gCurTask->main = Task_CharacterSelectMain;
        RenderCarouselScrollAnim(characterScreen);
        BackgroundAnim();
        return;
    }

    RenderTransitionInUIAnim(characterScreen);
    BackgroundAnim();
}

static void Task_CharacterSelectMain(void)
{
    u8 i;
    Sprite *s;
    ScreenFade *fade;
    union MultiSioData *packet;
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    characterScreen->cursorAnimFrame = (characterScreen->cursorAnimFrame & 0x3F) + 1;

    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        ReadMultiplayerSelections(characterScreen, i, packet);
    } else if (gPressedKeys & B_BUTTON || characterScreen->exiting) {
        fade = &characterScreen->fade;
        fade->window = SCREEN_FADE_USE_WINDOW_0;
        fade->brightness = 0;
        fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
        fade->speed = 0x180;
        fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
        fade->bldAlpha = 0;
        gCurTask->main = Task_FadeOutAndExitToPrevious;

        if (!characterScreen->exiting) {
            m4aSongNumStart(SE_RETURN);
        }

        RenderCarouselScrollAnim(characterScreen);
        return;
    }

    if (characterScreen->selectionComplete) {
        s = &characterScreen->characterSprite;
        s->graphics.anim = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter][0];
        s->variant = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter][1];
        s->prevVariant = -1;

        s = &characterScreen->characterSecondarySprite;
        s->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
        s->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_SELECTED);
        s->prevVariant = -1;
        gSelectedCharacter = characterScreen->selectedCharacter;

        characterScreen->animFrame = 0;

        fade = &characterScreen->fade;
        fade->window = SCREEN_FADE_USE_WINDOW_0;
        fade->brightness = 0;
        fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
        fade->speed = 0x180;
        fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
        fade->bldAlpha = 0;

        m4aSongNumStart(gCharacterAnnouncements[characterScreen->selectedCharacter]);

        if (IS_MULTI_PLAYER) {
            gCurTask->main = Task_MultiplayerWaitForSelections;
        } else {
            gCurTask->main = Task_SelectionCompleteFadeOutAndExit;
        }
        RenderUI(characterScreen);
    } else {
        if (gInput & (DPAD_LEFT | DPAD_UP)) {
            if (characterScreen->selectedCharacter == CHARACTER_SONIC && !characterScreen->amyUnlocked) {
                characterScreen->carouselPosition = 0x26800;
            }

            characterScreen->cursorAnimFrame = 0;
            characterScreen->upArrowActviteFrames = 12;
            characterScreen->previousSelection = characterScreen->selectedCharacter;
            characterScreen->selectedCharacter = gUnknown_080D7282[characterScreen->amyUnlocked + 2][characterScreen->selectedCharacter];
            characterScreen->animFrame = 0;
            characterScreen->unk3C4 = 0;
            characterScreen->scrollingDown = FALSE;
            s = &characterScreen->scrollUpArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
            s->prevVariant = -1;
            m4aSongNumStart(SE_SHIFT);
            gCurTask->main = Task_HandleCarouselScrollUp;
            RenderCarouselScrollAnim(characterScreen);
        } else if (gInput & (DPAD_RIGHT | DPAD_DOWN)) {
            characterScreen->cursorAnimFrame = 0;
            characterScreen->downArrowActiveFrames = 12;
            characterScreen->previousSelection = characterScreen->selectedCharacter;
            characterScreen->selectedCharacter = gUnknown_080D7282[characterScreen->amyUnlocked][characterScreen->selectedCharacter];
            characterScreen->animFrame = 0;
            characterScreen->unk3C4 = 0;
            characterScreen->scrollingDown = TRUE;

            s = &characterScreen->scrollDownArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
            s->prevVariant = -1;
            m4aSongNumStart(SE_SHIFT);
            gCurTask->main = Task_HandleCarouselScrollDown;
            RenderCarouselScrollAnim(characterScreen);
        } else {
#ifndef NON_MATCHING
            if (!(IS_SINGLE_PLAYER
                  && !((gPressedKeys & A_BUTTON)
                       && (characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter))))) {
                goto code;
            }
            while (0)
                ;
            goto label;
        code:
#else
            if (IS_SINGLE_PLAYER
                && !((gPressedKeys & A_BUTTON)
                     && (characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
                RenderCarouselScrollAnim(characterScreen);
            } else
#endif
            if (IS_SINGLE_PLAYER // completely optimized out
                || (gPressedKeys & A_BUTTON
                    && !(characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
                s = &characterScreen->characterSprite;
                s->graphics.anim = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter][0];
                s->variant = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter][1];
                s->prevVariant = -1;

                s = &characterScreen->characterSecondarySprite;
                s->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
                s->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_SELECTED);
                s->prevVariant = -1;

                gSelectedCharacter = characterScreen->selectedCharacter;
                characterScreen->animFrame = 0;

                fade = &characterScreen->fade;
                fade->window = SCREEN_FADE_USE_WINDOW_0;
                fade->brightness = 0;
                fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
                fade->speed = 0x180;
                fade->bldCnt = (BLDCNT_EFFECT_DARKEN | BLDCNT_TGT1_ALL);
                fade->bldAlpha = 0;
                m4aSongNumStart(gCharacterAnnouncements[characterScreen->selectedCharacter]);

                if (IS_MULTI_PLAYER) {
                    gCurTask->main = Task_MultiplayerWaitForSelections;
                } else {
                    gCurTask->main = Task_SelectionCompleteFadeOutAndExit;
                }
                RenderUI(characterScreen);
            } else if (IS_MULTI_PLAYER && characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter)) {
                if (characterScreen->scrollingDown) {
                    characterScreen->cursorAnimFrame = 0;
                    characterScreen->downArrowActiveFrames = 12;
                    characterScreen->previousSelection = characterScreen->selectedCharacter;
                    characterScreen->selectedCharacter
                        = gUnknown_080D7282[characterScreen->amyUnlocked][characterScreen->selectedCharacter];

                    characterScreen->animFrame = 0;
                    characterScreen->unk3C4 = 0;
                    s = &characterScreen->scrollDownArrow;
                    s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
                    s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
                    s->prevVariant = -1;
                    m4aSongNumStart(SE_SHIFT);
                    gCurTask->main = Task_HandleCarouselScrollDown;
                } else {
                    if (characterScreen->selectedCharacter == CHARACTER_SONIC && !characterScreen->amyUnlocked) {
                        characterScreen->carouselPosition = 0x26800;
                    }
                    characterScreen->cursorAnimFrame = 0;
                    characterScreen->upArrowActviteFrames = 12;
                    characterScreen->previousSelection = characterScreen->selectedCharacter;

                    characterScreen->selectedCharacter
                        = gUnknown_080D7282[characterScreen->amyUnlocked + 2][characterScreen->selectedCharacter];
                    characterScreen->animFrame = 0;
                    characterScreen->unk3C4 = 0;
                    characterScreen->scrollingDown = FALSE;
                    s = &characterScreen->scrollUpArrow;
                    s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
                    s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
                    s->prevVariant = -1;
                    m4aSongNumStart(SE_SHIFT);
                    gCurTask->main = Task_HandleCarouselScrollUp;
                }
                RenderCarouselScrollAnim(characterScreen);
            } else {
#ifndef NON_MATCHING
            label:
#endif
                RenderCarouselScrollAnim(characterScreen);
            }
        }
    }
    if (IS_MULTI_PLAYER) {
        packet = &gMultiSioSend;
        packet->pat0.unk0 = 0x4020;
        packet->pat0.unk2 = characterScreen->selectedCharacter;
    }

    BackgroundAnim();
}

static void Task_HandleCarouselScrollUp(void)
{
    u32 animFrame;
    struct CharacterSelectionScreen *characterScreen;
    Sprite *s;
    MultiPakHeartbeat();

    characterScreen = TASK_DATA(gCurTask);

    animFrame = ++characterScreen->animFrame;
    characterScreen->unk3C4++;

    if (characterScreen->upArrowActviteFrames > 0) {
        characterScreen->upArrowActviteFrames--;
        if (characterScreen->upArrowActviteFrames == 0) {
            s = &characterScreen->scrollUpArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            s->prevVariant = -1;
        }
    }

    characterScreen->carouselPosition += sCourselScrollAnimVelocities[animFrame];
    characterScreen->carouselPosition &= 0x3FFFF;

    if ((IS_SINGLE_PLAYER && (gPressedKeys & A_BUTTON)
         && (characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)))
        || (IS_MULTI_PLAYER && (gPressedKeys & A_BUTTON)
            && !(characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
        characterScreen->selectionComplete = TRUE;
    } else if (IS_SINGLE_PLAYER && (gPressedKeys & B_BUTTON)) {
        if (!characterScreen->exiting) {
            m4aSongNumStart(SE_RETURN);
        }
        characterScreen->exiting = TRUE;
    }

    if (animFrame > 9) {
        characterScreen->animFrame = 0;

        if (characterScreen->selectedCharacter == CHARACTER_SONIC) {
            characterScreen->carouselPosition = 0;
        }

        gCurTask->main = Task_CarouselScrollCompleteAnim;
    }

    RenderCarouselScrollAnim(characterScreen);

    BackgroundAnim();
    if (IS_MULTI_PLAYER) {
        gMultiSioSend.pat0.unk0 = 0x4020;
        gMultiSioSend.pat0.unk2 = characterScreen->selectedCharacter;
    }
}

static void Task_HandleCarouselScrollDown(void)
{
    u32 animFrame;
    struct CharacterSelectionScreen *characterScreen;
    Sprite *s;
    MultiPakHeartbeat();

    characterScreen = TASK_DATA(gCurTask);

    animFrame = ++characterScreen->animFrame;
    characterScreen->unk3C4++;

    if (characterScreen->downArrowActiveFrames != 0) {
        characterScreen->downArrowActiveFrames--;
        if (characterScreen->downArrowActiveFrames == 0) {
            s = &characterScreen->scrollDownArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            s->prevVariant = -1;
        }
    }

    characterScreen->carouselPosition -= sCourselScrollAnimVelocities[animFrame];
    characterScreen->carouselPosition &= 0x3FFFF;

    if ((IS_SINGLE_PLAYER && (gPressedKeys & A_BUTTON)
         && (characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)))
        || (IS_MULTI_PLAYER && (gPressedKeys & A_BUTTON)
            && !(characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
        characterScreen->selectionComplete = TRUE;
    } else if (IS_SINGLE_PLAYER && (gPressedKeys & B_BUTTON)) {
        if (!characterScreen->exiting) {
            m4aSongNumStart(SE_RETURN);
        }
        characterScreen->exiting = TRUE;
    }

    if (animFrame > 9) {
        characterScreen->animFrame = 0;

        if (characterScreen->selectedCharacter == CHARACTER_SONIC) {
            characterScreen->carouselPosition = 0;
        }

        gCurTask->main = Task_CarouselScrollCompleteAnim;
    }

    RenderCarouselScrollAnim(characterScreen);

    BackgroundAnim();
    if (IS_MULTI_PLAYER) {
        gMultiSioSend.pat0.unk0 = 0x4020;
        gMultiSioSend.pat0.unk2 = characterScreen->selectedCharacter;
    }
}

static void Task_CarouselScrollCompleteAnim(void)
{
    Sprite *s;
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    u32 animFrame = ++characterScreen->animFrame;
    characterScreen->unk3C4++;

    if (characterScreen->upArrowActviteFrames != 0) {
        characterScreen->upArrowActviteFrames--;
        if (characterScreen->upArrowActviteFrames == 0) {
            s = &characterScreen->scrollUpArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            s->prevVariant = -1;
        }
    }

    if (characterScreen->downArrowActiveFrames != 0) {
        characterScreen->downArrowActiveFrames--;
        if (characterScreen->downArrowActiveFrames == 0) {
            s = &characterScreen->scrollDownArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            s->prevVariant = -1;
        }
    }

    if ((IS_SINGLE_PLAYER && (gPressedKeys & A_BUTTON)
         && (characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)))
        || (IS_MULTI_PLAYER && (gPressedKeys & A_BUTTON)
            && !(characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
        characterScreen->selectionComplete = TRUE;
    }

    if (animFrame > 5) {
        characterScreen->cursorAnimFrame++;
        gCurTask->main = Task_CharacterSelectMain;
    }

    RenderCarouselScrollAnim(characterScreen);
    BackgroundAnim();
}

static void Task_SelectionCompleteFadeOutAndExit(void)
{
    u8 i;
    union MultiSioData *packet;
    Sprite *s;
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    ScreenFade *unk0 = &characterScreen->fade;
    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        ReadMultiplayerSelections(characterScreen, i, packet);
    }

    characterScreen->animFrame++;
    characterScreen->cursorAnimFrame = (characterScreen->cursorAnimFrame & 0x3F) + 1;

    if (characterScreen->upArrowActviteFrames != 0) {
        characterScreen->upArrowActviteFrames--;
        if (characterScreen->upArrowActviteFrames == 0) {
            s = &characterScreen->scrollUpArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            s->prevVariant = -1;
        }
    }

    if (characterScreen->downArrowActiveFrames != 0) {
        characterScreen->downArrowActiveFrames--;
        if (characterScreen->downArrowActiveFrames == 0) {
            s = &characterScreen->scrollDownArrow;
            s->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            s->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            s->prevVariant = -1;
        }
    }

    if ((characterScreen->animFrame >= sCharacterChosenAnimLengths[characterScreen->selectedCharacter])
        && UpdateScreenFade(unk0) == SCREEN_FADE_COMPLETE) {
        TaskDestroy(gCurTask);

        if (IS_MULTI_PLAYER) {
            CreateMultiplayerResultsScreen(MULTIPLAYER_RESULTS_MODE_CHARACTER_SELECTION);
            return;
        }

        if (gGameMode != GAME_MODE_SINGLE_PLAYER) {
            CreateTimeAttackLevelSelectScreen((gGameMode & GAME_MODE_BOSS_TIME_ATTACK) ? 1 : 0, gSelectedCharacter, gCurrentLevel);
            return;
        }

        // Only 1 zone available
        if (gLoadedSaveGame->unlockedLevels[gSelectedCharacter] <= LEVEL_INDEX(ZONE_1, ACT_BOSS)) {
            gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
            GameStageStart();
            return;
        }

        if (gLoadedSaveGame->extraZoneStatus == 1 && gSelectedCharacter == CHARACTER_SONIC) {
            CreateCourseSelectionScreen(LEVEL_INDEX(ZONE_1, ACT_1), gLoadedSaveGame->unlockedLevels[gSelectedCharacter],
                                        CUT_SCENE_UNLOCK_TRUE_AREA_53);
            return;
        }

        CreateCourseSelectionScreen(LEVEL_INDEX(ZONE_1, ACT_1), gLoadedSaveGame->unlockedLevels[gSelectedCharacter],
                                    COURSE_SELECT_CUT_SCENE_NONE);
        return;
    }

    RenderUI(characterScreen);
    BackgroundAnim();
}

static void Task_FadeOutAndExitToPrevious(void)
{
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    ScreenFade *unk0 = &characterScreen->fade;

    if (UpdateScreenFade(unk0) == SCREEN_FADE_COMPLETE) {
        TasksDestroyAll();
        PAUSE_BACKGROUNDS_QUEUE();
        gUnknown_03005390 = 0;
        PAUSE_GRAPHICS_QUEUE();
        if (gGameMode != GAME_MODE_SINGLE_PLAYER) {
            CreateTimeAttackModeSelectionScreen();
        } else {
            CreateTitleScreenAtSinglePlayerMenu();
        }
    } else {
        RenderCarouselScrollAnim(characterScreen);
        BackgroundAnim();
    }
}

static void RenderCarouselRollInAnim(struct CharacterSelectionScreen *characterScreen)
{
    u8 i;
    Sprite *s;

    if (characterScreen->amyUnlocked) {
        for (i = 0; i < 10; i++) {
            if ((characterScreen->animFrame > (i - characterScreen->initialSelection) * 5)
                || (characterScreen->initialSelection == 4 && i < 2 && (characterScreen->animFrame > 0x13))) {
                u8 temp = i - Div(i, 5) * 5;
                s = &characterScreen->carouselBlobs[temp];

                s->x = Q_2_14_TO_INT(COS(((characterScreen->carouselPosition >> 8) + (i * 0x66)) & 0x3FF) * 92) + 10;
                s->y = Q_2_14_TO_INT(SIN((((characterScreen->carouselPosition >> 8) + (i * 0x66)) & 0x3FF)) * 92) + 80;
                DisplaySprite(s);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;

        for (i = 0; i < 9; i++) {
            if (characterScreen->animFrame > (s8)(i - characterScreen->initialSelection)) {
                u32 temp2;
                s = &characterScreen->carouselBlobs[(i + 2) & 3];

                temp2 = (temp + i * 0x66) & 0x3FF;
                s->x = Q_2_14_TO_INT(COS(temp2) * 92) + 10;
                s->y = Q_2_14_TO_INT(SIN(temp2) * 92) + 80;
                DisplaySprite(s);
            }
        }

        if (characterScreen->initialSelection > 0 && characterScreen->initialSelection < 4 && characterScreen->animFrame > 0x13) {
            for (; i < gUnknown_080D7274[characterScreen->initialSelection]; i++) {
                u32 temp2;
                s = &characterScreen->carouselBlobs[(i + 2) & 3];
                temp2 = (temp + i * 0x66) & 0x3FF;
                s->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                s->y = (gSineTable[temp2] * 0x5C >> 0xE) + 80;
                DisplaySprite(s);
            }
        }
    }

    s = &characterScreen->scrollUpArrow;
    DisplaySprite(s);
    s = &characterScreen->scrollDownArrow;
    DisplaySprite(s);
}

static void RenderTransitionInUIAnim(struct CharacterSelectionScreen *characterScreen)
{
    u8 i;
    u16 x;
    Sprite *s;
    SpriteTransform *transform;

    if (characterScreen->amyUnlocked) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->selectedCharacter || characterScreen->unk3C4 != 0x10) {

                s = &characterScreen->carouselBlobs[temp2];

                s->x = ((gSineTable[(((characterScreen->carouselPosition >> 8) + (i * 0x66) + 2) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                s->y = ((gSineTable[(((characterScreen->carouselPosition >> 8) + (i * 0x66) + 2) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                DisplaySprite(s);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3 = (i + 2) & 3;
            if (temp3 != characterScreen->selectedCharacter || characterScreen->unk3C4 < 0xD) {
                s = &characterScreen->carouselBlobs[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                s->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                s->y = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                DisplaySprite(s);
            }
        }
    }
    s = &characterScreen->selectedCarouselBlob;
    transform = &characterScreen->selectedBlobTransform;

    s->x = 101;
    s->y = 79;
    s->variant = characterScreen->selectedCharacter + SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
    s->prevVariant = -1;

    transform->rotation = 0;
    transform->qScaleX = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
    transform->qScaleY = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
    transform->x = s->x;
    transform->y = s->y;

    s->frameFlags = gUnknown_030054B8++ | 0x60;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    if (characterScreen->animFrame < 8) {
        i = 160; // DISPLAY_HEIGHT
    } else {
        i = ((0x10 - characterScreen->animFrame) * 0x14);
    }
    s = &characterScreen->screenTitleText;
    s->x = i + 240; // DISPLAY_WIDTH
    s->y = 0x10;
    DisplaySprite(s);

    if (characterScreen->animFrame < 8) {
        i = 8 - characterScreen->animFrame;
    } else {
        i = 0;
    }

    s = &characterScreen->characterSprite;
    if (i > 0) {
        s->x = characterScreen->characterBaseXPos + (0x80 - (gSineTable[i * 0x10 + 0x100] >> 7)) * 2;
    } else {
        s->x = characterScreen->characterBaseXPos;
    }

    s->y = 0x82;
    x = s->x;

    if (!(characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)) && IS_SINGLE_PLAYER) {
        s->frameFlags |= 0x40000;
        s->palId = sCharacterSilhouettes[characterScreen->selectedCharacter];
    } else {
        s->frameFlags &= ~0x40000;
        s->palId = 0;
    }
    DisplaySprite(s);

    if (characterScreen->selectedCharacter == CHARACTER_CREAM) {
        s = &characterScreen->characterSecondarySprite;
        s->x = x;
        s->y = 0x82;

        if (!(characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)) && IS_SINGLE_PLAYER) {
            // make shadow mode
            s->frameFlags |= 0x40000;
            s->palId = sCharacterSilhouettes[CHEESE_SILHOUETTE];
        } else {
            s->frameFlags &= ~0x40000;
            s->palId = 0;
        }
        DisplaySprite(s);
    }

    if (characterScreen->animFrame < 4) {
        i = 8;
    } else if (characterScreen->animFrame < 0xC) {
        i = (0xC - characterScreen->animFrame);
    } else {
        i = 0;
    }
    s = &characterScreen->characterNameSubText;
    s->x = characterScreen->characterSubTextBaseXPos + i * 0x14;
    s->y = 0x90;
    DisplaySprite(s);

    s = &characterScreen->characterTitleTextLeft;
    transform = &characterScreen->characterTitleLeftTransform;

    s->x = 0x28;
    s->y = 0x4F;

    transform->rotation = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1) - ((0x10 - characterScreen->animFrame) * 0xF);
    transform->x = s->x;
    transform->y = s->y;

    s->frameFlags = gUnknown_030054B8++ | 0x20;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    s = &characterScreen->characterTitleTextRight;
    transform = &characterScreen->characterTitleRightTransform;

    s->x = 0x28;
    s->y = 0x4F;

    transform->rotation = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1) - ((0x10 - characterScreen->animFrame) * 0xF);
    transform->x = s->x;
    transform->y = s->y;

    s->frameFlags = gUnknown_030054B8++ | 0x20;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    s = &characterScreen->scrollUpArrow;
    DisplaySprite(s);
    s = &characterScreen->scrollDownArrow;
    DisplaySprite(s);
}

static void RenderCarouselScrollAnim(struct CharacterSelectionScreen *characterScreen)
{
    u8 selectedCharacter, b, d;
    u16 c, e, f;
    u8 i;
    s8 somethinga;
    Sprite *s;
    SpriteTransform *transform;

    s8 lang = gLoadedSaveGame->language - 1;

    if (lang < 0) {
        lang = 0;
    }

    if (lang < 1) {
        somethinga = 0;
    } else {
        somethinga = 1;
    }

    if (characterScreen->unk3C4 >= 8) {
        selectedCharacter = characterScreen->selectedCharacter;
        b = 0;
        c = 8;
    } else {
        selectedCharacter = characterScreen->selectedCharacter;
        b = 8 - characterScreen->unk3C4;
        c = characterScreen->unk3C4;
    }

    if (characterScreen->unk3C4 < 4) {
        d = 8;
    } else if (characterScreen->unk3C4 < 12) {
        d = 12 - characterScreen->unk3C4;
    } else {
        d = 0;
    }

    if (characterScreen->unk3C4 == 0) {
        s = &characterScreen->characterSprite;
        s->graphics.anim = sCharacterSpriteAssets[selectedCharacter][0];
        s->variant = sCharacterSpriteAssets[selectedCharacter][1];
        s->prevVariant = -1;

        if (!(characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)) && IS_SINGLE_PLAYER) {
            s->frameFlags |= 0x40000;
            s->palId = sCharacterSilhouettes[characterScreen->selectedCharacter];
        } else {
            s->frameFlags &= ~0x40000;
            s->palId = 0;
        }

        UpdateSpriteAnimation(s);

        if (!(characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)) && IS_SINGLE_PLAYER) {
            s = &characterScreen->characterNameSubText;
            s->graphics.anim = sCharacterNameSubTextAssets[CHARACTER_HIDDEN_LABEL][0];
            s->variant = sCharacterNameSubTextAssets[CHARACTER_HIDDEN_LABEL][1];
            s->prevVariant = -1;
            UpdateSpriteAnimation(s);

            s = &characterScreen->characterTitleTextLeft;
            s->graphics.anim = sCharacterTitleLeftSideAssets[CHARACTER_HIDDEN_LABEL][0];
            s->variant = sCharacterTitleLeftSideAssets[CHARACTER_HIDDEN_LABEL][1];
            s->prevVariant = -1;

            s = &characterScreen->characterTitleTextRight;
            s->graphics.anim = sCharacteTitleRightSideAssets[CHARACTER_HIDDEN_LABEL][0];
            s->variant = sCharacteTitleRightSideAssets[CHARACTER_HIDDEN_LABEL][1];
            s->prevVariant = -1;
        } else {
            s = &characterScreen->characterNameSubText;
            s->graphics.anim = sCharacterNameSubTextAssets[selectedCharacter + somethinga * 6][0];
            s->variant = sCharacterNameSubTextAssets[selectedCharacter + somethinga * 6][1];
            s->prevVariant = -1;
            UpdateSpriteAnimation(s);

            s = &characterScreen->characterTitleTextLeft;
            s->graphics.anim = sCharacterTitleLeftSideAssets[selectedCharacter][0];
            s->variant = sCharacterTitleLeftSideAssets[selectedCharacter][1];
            s->prevVariant = -1;

            s = &characterScreen->characterTitleTextRight;
            s->graphics.anim = sCharacteTitleRightSideAssets[selectedCharacter][0];
            s->variant = sCharacteTitleRightSideAssets[selectedCharacter][1];
            s->prevVariant = -1;
        }
    }

    if (characterScreen->amyUnlocked) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->selectedCharacter || characterScreen->unk3C4 < 0xD) {

                s = &characterScreen->carouselBlobs[temp2];

                s->x = ((gSineTable[(((characterScreen->carouselPosition >> 8) + (i * 0x66) + 2) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                s->y = ((gSineTable[(((characterScreen->carouselPosition >> 8) + (i * 0x66) + 2) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                DisplaySprite(s);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3 = (i + 2) & 3;
            if (temp3 != characterScreen->selectedCharacter || characterScreen->unk3C4 < 0xD) {
                s = &characterScreen->carouselBlobs[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                s->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                s->y = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                DisplaySprite(s);
            }
        }
    }

    if (characterScreen->unk3C4 > 9) {
        s = &characterScreen->selectedCarouselBlob;
        transform = &characterScreen->selectedBlobTransform;

        s->x = 0x65;
        s->y = 0x4F;
        s->variant = characterScreen->selectedCharacter + SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
        s->prevVariant = -1;

        transform->rotation = 0;
        transform->qScaleX = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        transform->qScaleY = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        transform->x = s->x;
        transform->y = s->y;

        s->frameFlags = gUnknown_030054B8++ | 0x60;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
        DisplaySprite(s);
    }

    s = &characterScreen->characterSprite;

    if (b > 0) {
        s->x = characterScreen->characterBaseXPos + (0x80 - (gSineTable[b * 0x10 + 0x100] >> 7)) * 2;
        f = s->x;
        e = characterScreen->characterBaseXPos + (b * 0x12);

    } else {
        s->x = characterScreen->characterBaseXPos;
        f = s->x;
        e = s->x;
    }
    s->y = 0x82;

    if (!(characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)) && IS_SINGLE_PLAYER) {
        s->frameFlags |= 0x40000;
        s->palId = sCharacterSilhouettes[characterScreen->selectedCharacter];
    } else {
        s->frameFlags &= ~0x40000;
        s->palId = 0;
    }
    DisplaySprite(s);

    if (characterScreen->selectedCharacter == CHARACTER_CREAM) {
        s = &characterScreen->characterSecondarySprite;
        s->x = e;
        s->y = 0x82;

        if (!(characterScreen->availableCharacters & CHARACTER_BIT(characterScreen->selectedCharacter)) && IS_SINGLE_PLAYER) {
            s->frameFlags |= 0x40000;
            s->palId = sCharacterSilhouettes[CHEESE_SILHOUETTE];
        } else {
            s->frameFlags &= ~0x40000;
            s->palId = 0;
        }

        DisplaySprite(s);
    }

    if (IS_MULTI_PLAYER && characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter)) {
        s = &characterScreen->characterUnavailableIndicator;
        s->x = f;
        s->y = 130;
        DisplaySprite(s);
    }

    s = &characterScreen->characterNameSubText;
    s->x = characterScreen->characterSubTextBaseXPos + (d * 5) * 4;
    s->y = 144;
    DisplaySprite(s);

#ifndef NON_MATCHING
    if (&characterScreen->screenTitleText) {
        s = &characterScreen->screenTitleText;
    } else {
        s = &characterScreen->screenTitleText;
    }
#endif

    s = &characterScreen->screenTitleText;
    s->x = DISPLAY_WIDTH;
    s->y = 16;
    DisplaySprite(s);

    s = &characterScreen->characterTitleTextLeft;
    transform = &characterScreen->characterTitleLeftTransform;
    s->x = 40;
    s->y = 79;

    if (c < 8) {
        transform->rotation = 0;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1) - ((8 - c) * 0x1E);
        transform->x = s->x;
        transform->y = s->y;

        s->frameFlags = gUnknown_030054B8++ | 0x20;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
    } else {
        s->frameFlags = 0;
    }

    DisplaySprite(s);

    s = &characterScreen->characterTitleTextRight;
    transform = &characterScreen->characterTitleRightTransform;
    s->x = 40;
    s->y = 79;

    if (c < 8) {
        transform->rotation = 0;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1) - ((8 - c) * 0x1E);
        transform->x = s->x;
        transform->y = s->y;

        s->frameFlags = gUnknown_030054B8++ | 0x20;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
    } else {
        s->frameFlags = 0;
    }

    DisplaySprite(s);

    s = &characterScreen->scrollUpArrow;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &characterScreen->scrollDownArrow;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void RenderUI(struct CharacterSelectionScreen *characterScreen)
{
    SpriteTransform *transform;
    Sprite *s, *element2, *element3;
    u8 i;
    if (characterScreen->amyUnlocked) {
        for (i = 0; i < NUM_CHARACTERS * 2; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->selectedCharacter || characterScreen->unk3C4 < 0xD) {

                s = &characterScreen->carouselBlobs[temp2];

                s->x = ((gSineTable[(((characterScreen->carouselPosition >> 8) + (i * 0x66) + 2) & 0x3FF) + 0x100] * 0x5C) >> 0xE) + 10;
                s->y = ((gSineTable[(((characterScreen->carouselPosition >> 8) + (i * 0x66) + 2) & 0x3FF)] * 0x5C) >> 0xE) + 0x50;
                DisplaySprite(s);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < (NUM_CHARACTERS - 1) * 2; i++) {
            u32 temp2;
            u32 temp3 = (i + 2) & 3;
            if (temp3 != characterScreen->selectedCharacter || characterScreen->unk3C4 < 0xD) {
                s = &characterScreen->carouselBlobs[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                s->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                s->y = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                DisplaySprite(s);
            }
        }
    }

    if (characterScreen->cursorAnimFrame > 0) {
        s = &characterScreen->selectedCarouselBlob;
        transform = &characterScreen->selectedBlobTransform;

        s->x = 101;
        s->y = 79;
        s->variant = characterScreen->selectedCharacter + SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
        s->prevVariant = -1;

        transform->rotation = 0;
        transform->qScaleX = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        transform->qScaleY = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8) + 0xC0;
        transform->x = s->x;
        transform->y = s->y;

        s->frameFlags = gUnknown_030054B8++ | 0x60;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
        DisplaySprite(s);
    }
    UpdateSpriteAnimation(&characterScreen->characterSprite);
    DisplaySprite(&characterScreen->characterSprite);

    if (characterScreen->selectedCharacter == CHARACTER_CREAM) {
        element2 = &characterScreen->characterSecondarySprite;
        UpdateSpriteAnimation(element2);
        DisplaySprite(element2);
    }
    if (IS_MULTI_PLAYER && (characterScreen->multiplayerSelections & CHARACTER_BIT(characterScreen->selectedCharacter))) {
        DisplaySprite(&characterScreen->characterUnavailableIndicator);
    }
    DisplaySprite(&characterScreen->characterNameSubText);
#ifndef NON_MATCHING
    if (&characterScreen->screenTitleText) {
        element3 = &characterScreen->screenTitleText;
        ++element3;
        --element3;
    } else {
        element3 = &characterScreen->screenTitleText;
        ++element3;
        --element3;
    }
    DisplaySprite(element3);
#else
    DisplaySprite(&characterScreen->screenTitleText);
#endif
    DisplaySprite(&characterScreen->characterTitleTextLeft);
    DisplaySprite(&characterScreen->characterTitleTextRight);

    s = &characterScreen->scrollUpArrow;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &characterScreen->scrollDownArrow;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static void Task_MultiplayerWaitForSelections(void)
{
    union MultiSioData *send, *recv;
    u32 i, j;
    Sprite *s;
    u8 charactersSelected[NUM_CHARACTERS] = { 0 };

    struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    BackgroundAnim();

    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        ReadMultiplayerSelections(characterScreen, i, recv);
    }

    if (gPressedKeys & B_BUTTON) {
        characterScreen->selectionComplete = FALSE;
        gCurTask->main = Task_CharacterSelectMain;

        s = &characterScreen->characterSprite;
        s->graphics.anim = sCharacterSpriteAssets[characterScreen->selectedCharacter][0];
        s->variant = sCharacterSpriteAssets[characterScreen->selectedCharacter][1];
        s->prevVariant = -1;

        s = &characterScreen->characterSecondarySprite;
        s->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
        s->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC);
        s->prevVariant = -1;

        RenderUI(characterScreen);

        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4020;
        send->pat0.unk2 = characterScreen->selectedCharacter;

        m4aSongNumStart(SE_RETURN);
        return;
    }

    recv = &gMultiSioRecv[0];
    if (recv->pat0.unk0 == 0x4022) {
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gMultiplayerConnections, i)) {
                recv = &gMultiSioRecv[i];
                gMultiplayerCharacters[i] = recv->pat0.unk2;
            }
        }

        if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
            send = &gMultiSioSend;
            send->pat0.unk0 = 0x4022;
            send->pat0.unk2 = characterScreen->selectedCharacter;
        }
        characterScreen->confirmationHandshakeAttempts = 0;
        gCurTask->main = Task_MultiplayerVerifySelections;
        RenderUI(characterScreen);
        return;
    }

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        if (GetBit(gMultiplayerConnections, i) && i != SIO_MULTI_CNT->id) {
            recv = &gMultiSioRecv[i];
            // Conflict
            if (recv->pat0.unk0 == 0x4021 && recv->pat0.unk2 == characterScreen->selectedCharacter && i < SIO_MULTI_CNT->id) {
                gCurTask->main = Task_CharacterSelectMain;
                m4aSongNumStart(SE_RETURN);
                characterScreen->selectionComplete = FALSE;

                s = &characterScreen->characterSprite;
                s->graphics.anim = sCharacterSpriteAssets[characterScreen->selectedCharacter][0];
                s->variant = sCharacterSpriteAssets[characterScreen->selectedCharacter][1];
                s->prevVariant = -1;
                UpdateSpriteAnimation(s);

                s = &characterScreen->characterSecondarySprite;
                s->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
                s->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC);
                s->prevVariant = -1;
                UpdateSpriteAnimation(s);

                send = &gMultiSioSend;
                send->pat0.unk0 = 0x4020;
                send->pat0.unk2 = characterScreen->selectedCharacter;
                RenderUI(characterScreen);
                return;
            }
        }
    }

    if ((gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4022;
        send->pat0.unk2 = characterScreen->selectedCharacter;

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gMultiplayerConnections, i)) {
                recv = &gMultiSioRecv[i];
                if (recv->pat0.unk0 != 0x4021) {
                    send->pat0.unk0 = 0x4021;
                    break;
                }

                if (++charactersSelected[recv->pat0.unk2] > 1) {
                    send->pat0.unk0 = 0x4021;
                    break;
                }
            }
        }
    } else {
        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4021;
        send->pat0.unk2 = characterScreen->selectedCharacter;
    }
    RenderUI(characterScreen);
}

static void Task_MultiplayerVerifySelections(void)
{
    u32 i;
    bool8 someoneNotConfirmed;
    u8 mostLevelsAvailable;
    union MultiSioData *send;
    union MultiSioData *recv;
    register struct CharacterSelectionScreen *characterScreen = TASK_DATA(gCurTask);
    MultiPakHeartbeat();

    for (i = 0, someoneNotConfirmed = FALSE; i < MULTI_SIO_PLAYERS_MAX; i++) {
        recv = &gMultiSioRecv[i];
        if (GetBit(gMultiplayerConnections, i) && recv->pat0.unk0 < 0x4022) {
            someoneNotConfirmed = TRUE;
            // Why not break here...
        }
    }

    if (someoneNotConfirmed) {
        if (characterScreen->confirmationHandshakeAttempts != 0) {
            characterScreen->confirmationHandshakeAttempts <<= 1;
            // 7 attempts
            if (characterScreen->confirmationHandshakeAttempts & (1 << 7)) {
                send = &gMultiSioSend;
                send->pat0.unk0 = 0x4021;
                gCurTask->main = Task_MultiplayerWaitForSelections;
            }
        } else {
            characterScreen->confirmationHandshakeAttempts = 1;
        }
        RenderUI(characterScreen);
        return;
    }

    characterScreen->confirmationHandshakeAttempts = 0;
    recv = &gMultiSioRecv[0];
    if (recv->pat0.unk0 == 0x4023) {
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gMultiplayerConnections, i)) {
                recv = &gMultiSioRecv[i];
                if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
                    gMultiplayerCharacters[i] = recv->pat0.unk2;
                }
            }
        }
        RenderUI(characterScreen);
        gCurTask->main = Task_SelectionCompleteFadeOutAndExit;
        return;
    } else if (recv->pat0.unk0 == 0x4021) {
        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4020;
        gCurTask->main = Task_MultiplayerWaitForSelections;
        return;
    }

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4023;
        send->pat0.unk2 = characterScreen->selectedCharacter;
        mostLevelsAvailable = 0;

        // WTF: why is this here
        for (i = 0; i < NUM_CHARACTERS; i++) {
            if (mostLevelsAvailable < gLoadedSaveGame->unlockedLevels[i]) {
                mostLevelsAvailable = gLoadedSaveGame->unlockedLevels[i];
            }
        }

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gMultiplayerConnections, i) && i != 0) {
                recv = &gMultiSioRecv[i];
                gMultiplayerCharacters[i] = recv->pat0.unk2;
                if (recv->pat0.unk0 != 0x4022) {
                    send->pat0.unk0 = 0x4022;
                    if (gPressedKeys & B_BUTTON) {
                        send->pat0.unk0 = 0x4021;
                    }
                    break;
                }
            }
        }
    } else {
        send = &gMultiSioSend;
        send->pat0.unk0 = 0x4022;
        // Bug: should probably be set on the packet, not the recv data
        recv->pat0.unk2 = characterScreen->selectedCharacter;
        mostLevelsAvailable = 0;

        for (i = 0; i < NUM_CHARACTERS; i++) {
            if (mostLevelsAvailable < gLoadedSaveGame->unlockedLevels[i]) {
                mostLevelsAvailable = gLoadedSaveGame->unlockedLevels[i];
            }
        }
        send->pat0.unk3 = mostLevelsAvailable;
    }

    RenderUI(characterScreen);
    BackgroundAnim();
}

static void CharacterSelectScreenOnDestroy(struct Task *t)
{
    u8 i;
    struct CharacterSelectionScreen *characterScreen = TASK_DATA(t);
    VramFree(characterScreen->characterNameSubText.graphics.dest);
    VramFree(characterScreen->characterTitleTextLeft.graphics.dest);
    VramFree(characterScreen->characterTitleTextRight.graphics.dest);
    VramFree(characterScreen->screenTitleText.graphics.dest);

    for (i = 0; i < NUM_CHARACTERS; i++) {
        VramFree(characterScreen->carouselBlobs[i].graphics.dest);
    }

    VramFree(characterScreen->selectedCarouselBlob.graphics.dest);
    VramFree(characterScreen->scrollUpArrow.graphics.dest);
    VramFree(characterScreen->scrollDownArrow.graphics.dest);
}
