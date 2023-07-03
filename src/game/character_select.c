#include "global.h"
#include "core.h"
#include "game/screen_transition.h"
#include "game/game.h"
#include "sprite.h"
#include "game/character_select.h"
#include "game/save.h"
#include "lib/m4a.h"
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
    struct TransitionState screenFade;
    Background unkC;
    Background unk4C;
    Background unk8C;
    Sprite screenTitleText;
    Sprite characterSprite;
    Sprite characterNameSubText;

    Sprite characterTitleTextLeft;
    struct UNK_808D124_UNK180 characterTitleLeftTransform;

    Sprite characterTitleTextRight;
    struct UNK_808D124_UNK180 characterTitleRightTransform;

    Sprite carouselBlobs[NUM_CHARACTERS];
    Sprite selectedCarouselBlob;
    struct UNK_808D124_UNK180 selectedBlobTransform;

    Sprite scrollUpArrow;
    Sprite scrollDownArrow;

    Sprite characterSecondarySprite;
    Sprite characterUnavailableIndicator;
    u8 initialSelection;
    u8 selectedCharacter;
    u8 previousSelection;

    bool8 amyUnlocked;

    u8 unk3C4;

    u8 cursorAnimFrame;

    u8 upArrowActviteFrames;
    u8 downArrowActiveFrames;

    bool8 selectionComplete;
    bool8 exiting;
    u8 availableCharacters;

    bool8 scrollingDown;

    u8 confirmationHandshakeAttempts;

    u16 characterBaseXPos;
    u16 characterSubTextBaseXPos;

    u32 animFrame;
    u32 carouselPosition;
    u32 multiplayerSelections;
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
    [CHARACTER_SONIC] = { 739, 0 }, [CHARACTER_CREAM] = { 739, 8 },
    [CHARACTER_TAILS] = { 739, 2 }, [CHARACTER_KNUCKLES] = { 739, 4 },
    [CHARACTER_AMY] = { 739, 6 },   [CHARACTER_HIDDEN_LABEL] = { 739, 10 },
};

static const u16 sCharacteTitleRightSideAssets[][2] = {
    [CHARACTER_SONIC] = { 739, 1 }, [CHARACTER_CREAM] = { 739, 9 },
    [CHARACTER_TAILS] = { 739, 3 }, [CHARACTER_KNUCKLES] = { 739, 5 },
    [CHARACTER_AMY] = { 739, 7 },   [CHARACTER_HIDDEN_LABEL] = { 739, 11 },
};

static const u16 sCharacterSpriteAssets[][2] = {
    [CHARACTER_SONIC] = { 736, 0 }, [CHARACTER_CREAM] = { 736, 2 },
    [CHARACTER_TAILS] = { 736, 4 }, [CHARACTER_KNUCKLES] = { 736, 6 },
    [CHARACTER_AMY] = { 736, 8 },
};

static const u16 sCharacterSelectedSpriteAssets[][2] = {
    [CHARACTER_SONIC] = { 736, 1 }, [CHARACTER_CREAM] = { 736, 3 },
    [CHARACTER_TAILS] = { 736, 5 }, [CHARACTER_KNUCKLES] = { 736, 7 },
    [CHARACTER_AMY] = { 736, 9 },
};

static const u16 sCharacterNameSubTextAssets[][2] = {
    { 741, 0 }, { 741, 1 }, { 741, 2 }, { 741, 3 }, { 741, 4 }, { 741, 5 },
    { 747, 0 }, { 747, 1 }, { 747, 2 }, { 747, 3 }, { 747, 4 }, { 741, 5 },
};

static const u16 sScreenTitleTextAssets[][2] = {
    [LanguageIndex(LANG_JAPANESE)] = { 740, 0 },
    [LanguageIndex(LANG_ENGLISH)] = { 743, 0 },
    [LanguageIndex(LANG_GERMAN)] = { 744, 0 },
    [LanguageIndex(LANG_FRENCH)] = { 748, 0 },
    [LanguageIndex(LANG_SPANISH)] = { 745, 0 },
    [LanguageIndex(LANG_ITALIAN)] = { 746, 0 },
};

static const u8 gUnknown_080D7274[] = { 8, 10, 10, 14 };
static const u16 gCharacterAnnouncements[] = {
    [CHARACTER_SONIC] = VOICE__ANNOUNCER__SONIC,
    [CHARACTER_CREAM] = VOICE__ANNOUNCER__CREAM,
    [CHARACTER_TAILS] = VOICE__ANNOUNCER__TAILS,
    [CHARACTER_KNUCKLES] = VOICE__ANNOUNCER__KNUCKLES,
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
    [CHARACTER_SONIC] = 30,    [CHARACTER_CREAM] = 30, [CHARACTER_TAILS] = 30,
    [CHARACTER_KNUCKLES] = 30, [CHARACTER_AMY] = 30,
};

#define CHEESE_SILHOUETTE 5

static const u8 sCharacterSilhouettes[] = {
    [CHARACTER_SONIC] = 8,    [CHARACTER_CREAM] = 4, [CHARACTER_TAILS] = 7,
    [CHARACTER_KNUCKLES] = 6, [CHARACTER_AMY] = 5,   [CHEESE_SILHOUETTE] = 3,
};

#define BackgroundAnim()                                                                \
    ({                                                                                  \
        gBgScrollRegs[0][1] = (gBgScrollRegs[0][1] - 1) & 0xFF;                         \
        gBgScrollRegs[2][0] = (gBgScrollRegs[2][0] - 1) & 0xFF;                         \
        gBgScrollRegs[2][1] = (gBgScrollRegs[2][1] + 1) & 0xFF;                         \
    })

// These values have to be passed in, as it seems some of the
// functions don't use u8 i values, who knows what's going on here
#define ReadMultiplayerSelections(characterScreen, i, packet)                           \
    ({                                                                                  \
        (characterScreen)->multiplayerSelections = 0;                                   \
        for ((i) = 0; (i) < MULTI_SIO_PLAYERS_MAX; (i)++) {                             \
            if ((i) != SIO_MULTI_CNT->id && GetBit(gMultiplayerConnections, (i))) {     \
                (packet) = &gMultiSioRecv[(i)];                                         \
                if ((packet)->pat0.unk0 > 0x4020) {                                     \
                    (characterScreen)->multiplayerSelections                            \
                        |= CHARACTER_BIT(packet->pat0.unk2);                            \
                }                                                                       \
            }                                                                           \
        }                                                                               \
    })

// Pretty close: https://decomp.me/scratch/A2o3b
NONMATCH("asm/non_matching/CreateCharacterSelectionScreen.inc",
         void CreateCharacterSelectionScreen(u8 initialSelection, bool8 allUnlocked))
{
    struct Task *t;
    struct CharacterSelectionScreen *characterScreen;
    struct TransitionState *screenFade;
    Background *background;
    Sprite *element;
    u32 a;

    u8 i = 0;
    s8 something;
    u32 selection = initialSelection;
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
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
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

    t = TaskCreate(Task_FadeInAndStartRollInAnim,
                   sizeof(struct CharacterSelectionScreen), 0x4100, 0,
                   CharacterSelectScreenOnDestroy);
    characterScreen = TaskGetStructPtr(t);

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
        characterScreen->carouselPosition
            = ((0x108 - (0x66 * initialSelection)) & 0x3FF) * 0x100 + 2;
        characterScreen->amyUnlocked = TRUE;
        characterScreen->initialSelection = initialSelection;

        if (initialSelection > CHARACTER_AMY) {
            characterScreen->initialSelection = CHARACTER_AMY;
        }
    } else {

        characterScreen->carouselPosition
            = ((0x16E - (initialSelection * 0x66)) & 0x3FF) * 0x100 + 4;
        characterScreen->amyUnlocked = FALSE;
        characterScreen->initialSelection = initialSelection;
        if (initialSelection > CHARACTER_KNUCKLES) {
            characterScreen->initialSelection = CHARACTER_KNUCKLES;
        }
    }

    screenFade = &characterScreen->screenFade;
    screenFade->unk0 = 0;
    screenFade->unk4 = 0;
    screenFade->unk2 = 2;
    screenFade->speed = 0x180;
    screenFade->unk8 = 0xFF;
    screenFade->unkA = 0;
    NextTransitionFrame(screenFade);

    background = &characterScreen->unk8C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(24);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(22);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = TM_CHAR_SELECT_WHEEL;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 1;
    sub_8002A3C(background);

    background = &characterScreen->unkC;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(0);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(20);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = TM_CHARACTER_SELECT_BACKGROUND_0;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 0;
    sub_8002A3C(background);

    background = &characterScreen->unk4C;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(8);
    background->graphics.anim = 0;
    background->tilesVram = (void *)BG_SCREEN_ADDR(21);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = TM_CHARACTER_SELECT_BACKGROUND_1;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x20;
    background->unk28 = 0x20;
    background->unk2A = 0;
    background->unk2E = 2;
    sub_8002A3C(background);

    for (i = 0; i < NUM_CHARACTERS; i++) {
        element = &characterScreen->carouselBlobs[i];
        element->x = 0;
        element->y = 0;
        element->graphics.dest = VramMalloc(0x10);
        element->graphics.anim = SA2_ANIM_CHAR_SELECT_CIRCLE;
        element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_INACTIVE + i;
        element->unk1A = 0x100;
        element->graphics.size = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk21 = 0xFF;
        element->unk22 = 0x10;
        element->palId = 0;
        element->unk28[0].unk0 = -1;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &characterScreen->selectedCarouselBlob;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = VramMalloc(0x40);
    element->graphics.anim = SA2_ANIM_CHAR_SELECT_CIRCLE;
    element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
    element->unk1A = 0xC0;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->characterNameSubText;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = VramMalloc(0x24);
    element->graphics.anim
        = sCharacterNameSubTextAssets[characterScreen->initialSelection
                                      + (something * 6)][0];
    element->variant = sCharacterNameSubTextAssets[characterScreen->initialSelection
                                                   + (something * 6)][1];
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->characterTitleTextLeft;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = VramMalloc(0x40);
    element->graphics.anim
        = sCharacterTitleLeftSideAssets[characterScreen->initialSelection][0];
    element->variant
        = sCharacterTitleLeftSideAssets[characterScreen->initialSelection][1];
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->characterTitleTextRight;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = VramMalloc(0x40);
    element->graphics.anim
        = sCharacteTitleRightSideAssets[characterScreen->initialSelection][0];
    element->variant
        = sCharacteTitleRightSideAssets[characterScreen->initialSelection][1];
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->screenTitleText;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = VramMalloc(0x36);
    element->graphics.anim = sScreenTitleTextAssets[lang][0];
    element->variant = sScreenTitleTextAssets[lang][1];
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->scrollUpArrow;
    element->x = 17;
    element->y = 18;
    element->graphics.dest = VramMalloc(0x18);
    element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
    element->variant = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->scrollDownArrow;
    element->x = 17;
    element->y = 142;
    element->graphics.dest = VramMalloc(0x18);
    element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
    element->variant = 0;
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0x800;
    sub_8004558(element);

    element = &characterScreen->characterSecondarySprite;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = (void *)(OBJ_VRAM0 + 0x400);
    element->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
    element->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(
        SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC);
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->characterUnavailableIndicator;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = (void *)(OBJ_VRAM0 + 0x2580);
    element->graphics.anim = SA2_ANIM_CHAR_SELECT_RED_CROSS_BOX;
    element->variant = 0;
    element->unk1A = 0x40;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    element = &characterScreen->characterSprite;
    element->x = 0;
    element->y = 0;
    element->graphics.dest = (void *)(OBJ_VRAM0 + 0x1000);
    element->graphics.anim
        = sCharacterSpriteAssets[characterScreen->initialSelection][0];
    element->variant = sCharacterSpriteAssets[characterScreen->initialSelection][1];
    element->unk1A = 0x100;
    element->graphics.size = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->palId = 0;
    element->unk28[0].unk0 = -1;
    element->unk10 = 0;
    sub_8004558(element);

    for (i = 0; i < 16; i++) {
        gObjPalette[i + 0xf0] = 0;
    }

    gFlags |= 0x2;
}
END_NONMATCH

static void Task_FadeInAndStartRollInAnim(void)
{
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
    if (++characterScreen->animFrame > 23) {
        characterScreen->animFrame = 0;
        gCurTask->main = Task_RollInAnim;
    }

    NextTransitionFrame(&characterScreen->screenFade);
    sub_80051E8(&characterScreen->scrollUpArrow);
    sub_80051E8(&characterScreen->scrollDownArrow);

    BackgroundAnim();
}

static void Task_RollInAnim(void)
{
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
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
        characterScreen->carouselPosition
            -= Div(gSineTable[(((r0 = animFrame + 4) << 2) & 0x3FF) + 0x100], 3);
#else
        characterScreen->carouselPosition
            -= Div(gSineTable[(((animFrame + 4) << 2) & 0x3FF) + 0x100], 3);
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
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
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
    Sprite *element;
    struct TransitionState *unk0;
    union MultiSioData *packet;
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
    characterScreen->cursorAnimFrame = (characterScreen->cursorAnimFrame & 0x3F) + 1;

    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        ReadMultiplayerSelections(characterScreen, i, packet);
    } else if (gPressedKeys & B_BUTTON || characterScreen->exiting) {
        unk0 = &characterScreen->screenFade;
        unk0->unk0 = 0;
        unk0->unk4 = 0;
        unk0->unk2 = 1;
        unk0->speed = 0x180;
        unk0->unk8 = 0xFF;
        unk0->unkA = 0;
        gCurTask->main = Task_FadeOutAndExitToPrevious;

        if (!characterScreen->exiting) {
            m4aSongNumStart(SE_RETURN);
        }

        RenderCarouselScrollAnim(characterScreen);
        return;
    }

    if (characterScreen->selectionComplete) {
        element = &characterScreen->characterSprite;
        element->graphics.anim
            = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter][0];
        element->variant
            = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter][1];
        element->unk21 = 0xFF;

        element = &characterScreen->characterSecondarySprite;
        element->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
        element->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(
            SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_SELECTED);
        element->unk21 = 0xFF;
        gSelectedCharacter = characterScreen->selectedCharacter;

        characterScreen->animFrame = 0;

        unk0 = &characterScreen->screenFade;
        unk0->unk0 = 0;
        unk0->unk4 = 0;
        unk0->unk2 = 1;
        unk0->speed = 0x180;
        unk0->unk8 = 0xFF;
        unk0->unkA = 0;

        m4aSongNumStart(gCharacterAnnouncements[characterScreen->selectedCharacter]);

        if (IS_MULTI_PLAYER) {
            gCurTask->main = Task_MultiplayerWaitForSelections;
        } else {
            gCurTask->main = Task_SelectionCompleteFadeOutAndExit;
        }
        RenderUI(characterScreen);
    } else {
        if (gInput & (DPAD_LEFT | DPAD_UP)) {
            if (characterScreen->selectedCharacter == CHARACTER_SONIC
                && !characterScreen->amyUnlocked) {
                characterScreen->carouselPosition = 0x26800;
            }

            characterScreen->cursorAnimFrame = 0;
            characterScreen->upArrowActviteFrames = 12;
            characterScreen->previousSelection = characterScreen->selectedCharacter;
            characterScreen->selectedCharacter
                = gUnknown_080D7282[characterScreen->amyUnlocked + 2]
                                   [characterScreen->selectedCharacter];
            characterScreen->animFrame = 0;
            characterScreen->unk3C4 = 0;
            characterScreen->scrollingDown = FALSE;
            element = &characterScreen->scrollUpArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
            element->unk21 = 0xFF;
            m4aSongNumStart(SE_SHIFT);
            gCurTask->main = Task_HandleCarouselScrollUp;
            RenderCarouselScrollAnim(characterScreen);
        } else if (gInput & (DPAD_RIGHT | DPAD_DOWN)) {
            characterScreen->cursorAnimFrame = 0;
            characterScreen->downArrowActiveFrames = 12;
            characterScreen->previousSelection = characterScreen->selectedCharacter;
            characterScreen->selectedCharacter
                = gUnknown_080D7282[characterScreen->amyUnlocked]
                                   [characterScreen->selectedCharacter];
            characterScreen->animFrame = 0;
            characterScreen->unk3C4 = 0;
            characterScreen->scrollingDown = TRUE;

            element = &characterScreen->scrollDownArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
            element->unk21 = 0xFF;
            m4aSongNumStart(SE_SHIFT);
            gCurTask->main = Task_HandleCarouselScrollDown;
            RenderCarouselScrollAnim(characterScreen);
        } else {
#ifndef NON_MATCHING
            if (!(IS_SINGLE_PLAYER
                  && !((gPressedKeys & A_BUTTON)
                       && (characterScreen->availableCharacters
                           & CHARACTER_BIT(characterScreen->selectedCharacter))))) {
                goto code;
            }
            while (0)
                ;
            goto label;
        code:
#else
            if (IS_SINGLE_PLAYER
                && !((gPressedKeys & A_BUTTON)
                     && (characterScreen->availableCharacters
                         & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
                RenderCarouselScrollAnim(characterScreen);
            } else
#endif
            if (IS_SINGLE_PLAYER // completely optimized out
                || (gPressedKeys & A_BUTTON
                    && !(characterScreen->multiplayerSelections
                         & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
                element = &characterScreen->characterSprite;
                element->graphics.anim
                    = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter]
                                                    [0];
                element->variant
                    = sCharacterSelectedSpriteAssets[characterScreen->selectedCharacter]
                                                    [1];
                element->unk21 = 0xFF;

                element = &characterScreen->characterSecondarySprite;
                element->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
                element->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(
                    SA2_ANIM_CHAR_ID_CHEESE,
                    SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_SELECTED);
                element->unk21 = 0xFF;

                gSelectedCharacter = characterScreen->selectedCharacter;
                characterScreen->animFrame = 0;

                unk0 = &characterScreen->screenFade;
                unk0->unk0 = 0;
                unk0->unk4 = 0;
                unk0->unk2 = 1;
                unk0->speed = 0x180;
                unk0->unk8 = 0xFF;
                unk0->unkA = 0;
                m4aSongNumStart(
                    gCharacterAnnouncements[characterScreen->selectedCharacter]);

                if (IS_MULTI_PLAYER) {
                    gCurTask->main = Task_MultiplayerWaitForSelections;
                } else {
                    gCurTask->main = Task_SelectionCompleteFadeOutAndExit;
                }
                RenderUI(characterScreen);
            } else if (IS_MULTI_PLAYER
                       && characterScreen->multiplayerSelections
                           & CHARACTER_BIT(characterScreen->selectedCharacter)) {
                if (characterScreen->scrollingDown) {
                    characterScreen->cursorAnimFrame = 0;
                    characterScreen->downArrowActiveFrames = 12;
                    characterScreen->previousSelection
                        = characterScreen->selectedCharacter;
                    characterScreen->selectedCharacter
                        = gUnknown_080D7282[characterScreen->amyUnlocked]
                                           [characterScreen->selectedCharacter];

                    characterScreen->animFrame = 0;
                    characterScreen->unk3C4 = 0;
                    element = &characterScreen->scrollDownArrow;
                    element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
                    element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
                    element->unk21 = 0xFF;
                    m4aSongNumStart(SE_SHIFT);
                    gCurTask->main = Task_HandleCarouselScrollDown;
                } else {
                    if (characterScreen->selectedCharacter == CHARACTER_SONIC
                        && !characterScreen->amyUnlocked) {
                        characterScreen->carouselPosition = 0x26800;
                    }
                    characterScreen->cursorAnimFrame = 0;
                    characterScreen->upArrowActviteFrames = 12;
                    characterScreen->previousSelection
                        = characterScreen->selectedCharacter;

                    characterScreen->selectedCharacter
                        = gUnknown_080D7282[characterScreen->amyUnlocked + 2]
                                           [characterScreen->selectedCharacter];
                    characterScreen->animFrame = 0;
                    characterScreen->unk3C4 = 0;
                    characterScreen->scrollingDown = FALSE;
                    element = &characterScreen->scrollUpArrow;
                    element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
                    element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_SCROLLING;
                    element->unk21 = 0xFF;
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
    Sprite *element;
    MultiPakHeartbeat();

    characterScreen = TaskGetStructPtr(gCurTask);

    animFrame = ++characterScreen->animFrame;
    characterScreen->unk3C4++;

    if (characterScreen->upArrowActviteFrames > 0) {
        characterScreen->upArrowActviteFrames--;
        if (characterScreen->upArrowActviteFrames == 0) {
            element = &characterScreen->scrollUpArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            element->unk21 = 0xff;
        }
    }

    characterScreen->carouselPosition += sCourselScrollAnimVelocities[animFrame];
    characterScreen->carouselPosition &= 0x3FFFF;

    if ((IS_SINGLE_PLAYER && (gPressedKeys & A_BUTTON)
         && (characterScreen->availableCharacters
             & CHARACTER_BIT(characterScreen->selectedCharacter)))
        || (IS_MULTI_PLAYER && (gPressedKeys & A_BUTTON)
            && !(characterScreen->multiplayerSelections
                 & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
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
    Sprite *element;
    MultiPakHeartbeat();

    characterScreen = TaskGetStructPtr(gCurTask);

    animFrame = ++characterScreen->animFrame;
    characterScreen->unk3C4++;

    if (characterScreen->downArrowActiveFrames != 0) {
        characterScreen->downArrowActiveFrames--;
        if (characterScreen->downArrowActiveFrames == 0) {
            element = &characterScreen->scrollDownArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            element->unk21 = 0xff;
        }
    }

    characterScreen->carouselPosition -= sCourselScrollAnimVelocities[animFrame];
    characterScreen->carouselPosition &= 0x3FFFF;

    if ((IS_SINGLE_PLAYER && (gPressedKeys & A_BUTTON)
         && (characterScreen->availableCharacters
             & CHARACTER_BIT(characterScreen->selectedCharacter)))
        || (IS_MULTI_PLAYER && (gPressedKeys & A_BUTTON)
            && !(characterScreen->multiplayerSelections
                 & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
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
    Sprite *element;
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
    u32 animFrame = ++characterScreen->animFrame;
    characterScreen->unk3C4++;

    if (characterScreen->upArrowActviteFrames != 0) {
        characterScreen->upArrowActviteFrames--;
        if (characterScreen->upArrowActviteFrames == 0) {
            element = &characterScreen->scrollUpArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            element->unk21 = 0xff;
        }
    }

    if (characterScreen->downArrowActiveFrames != 0) {
        characterScreen->downArrowActiveFrames--;
        if (characterScreen->downArrowActiveFrames == 0) {
            element = &characterScreen->scrollDownArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            element->unk21 = 0xff;
        }
    }

    if ((IS_SINGLE_PLAYER && (gPressedKeys & A_BUTTON)
         && (characterScreen->availableCharacters
             & CHARACTER_BIT(characterScreen->selectedCharacter)))
        || (IS_MULTI_PLAYER && (gPressedKeys & A_BUTTON)
            && !(characterScreen->multiplayerSelections
                 & CHARACTER_BIT(characterScreen->selectedCharacter)))) {
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
    Sprite *element;
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
    struct TransitionState *unk0 = &characterScreen->screenFade;
    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        ReadMultiplayerSelections(characterScreen, i, packet);
    }

    characterScreen->animFrame++;
    characterScreen->cursorAnimFrame = (characterScreen->cursorAnimFrame & 0x3F) + 1;

    if (characterScreen->upArrowActviteFrames != 0) {
        characterScreen->upArrowActviteFrames--;
        if (characterScreen->upArrowActviteFrames == 0) {
            element = &characterScreen->scrollUpArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            element->unk21 = 0xff;
        }
    }

    if (characterScreen->downArrowActiveFrames != 0) {
        characterScreen->downArrowActiveFrames--;
        if (characterScreen->downArrowActiveFrames == 0) {
            element = &characterScreen->scrollDownArrow;
            element->graphics.anim = SA2_ANIM_CHAR_SELECT_ARROW;
            element->variant = SA2_ANIM_VARIANT_CHAR_SELECT_ARROW_STATIC;
            element->unk21 = 0xff;
        }
    }

    if ((characterScreen->animFrame
         >= sCharacterChosenAnimLengths[characterScreen->selectedCharacter])
        && NextTransitionFrame(unk0) == SCREEN_TRANSITION_COMPLETE) {
        TaskDestroy(gCurTask);

        if (IS_MULTI_PLAYER) {
            CreateMultiplayerResultsScreen(MULTIPLAYER_RESULTS_MODE_CHARACTER_SELECTION);
            return;
        }

        if (gGameMode != GAME_MODE_SINGLE_PLAYER) {
            CreateTimeAttackLevelSelectScreen(!!(gGameMode & GAME_MODE_BOSS_TIME_ATTACK),
                                              gSelectedCharacter, gCurrentLevel);
            return;
        }

        // Only 1 zone available
        if (gLoadedSaveGame->unlockedLevels[gSelectedCharacter]
            <= LEVEL_INDEX(ZONE_1, ACT_BOSS)) {
            gCurrentLevel = LEVEL_INDEX(ZONE_1, ACT_1);
            GameStageStart();
            return;
        }

        if (gLoadedSaveGame->extraZoneStatus == 1
            && gSelectedCharacter == CHARACTER_SONIC) {
            CreateCourseSelectionScreen(
                LEVEL_INDEX(ZONE_1, ACT_1),
                gLoadedSaveGame->unlockedLevels[gSelectedCharacter],
                CUT_SCENE_UNLOCK_TRUE_AREA_53);
            return;
        }

        CreateCourseSelectionScreen(LEVEL_INDEX(ZONE_1, ACT_1),
                                    gLoadedSaveGame->unlockedLevels[gSelectedCharacter],
                                    COURSE_SELECT_CUT_SCENE_NONE);
        return;
    }

    RenderUI(characterScreen);
    BackgroundAnim();
}

static void Task_FadeOutAndExitToPrevious(void)
{
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
    struct TransitionState *unk0 = &characterScreen->screenFade;

    if (NextTransitionFrame(unk0) == SCREEN_TRANSITION_COMPLETE) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;
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
    Sprite *element;

    if (characterScreen->amyUnlocked) {
        for (i = 0; i < 10; i++) {
            if ((characterScreen->animFrame
                 > (i - characterScreen->initialSelection) * 5)
                || (characterScreen->initialSelection == 4 && i < 2
                    && (characterScreen->animFrame > 0x13))) {
                u8 temp = i - Div(i, 5) * 5;
                element = &characterScreen->carouselBlobs[temp];

                element->x = Q_2_14_TO_INT(COS(((characterScreen->carouselPosition >> 8)
                                                + (i * 0x66))
                                               & 0x3FF)
                                           * 92)
                    + 10;
                element->y
                    = Q_2_14_TO_INT(
                          SIN((((characterScreen->carouselPosition >> 8) + (i * 0x66))
                               & 0x3FF))
                          * 92)
                    + 80;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;

        for (i = 0; i < 9; i++) {
            if (characterScreen->animFrame
                > (s8)(i - characterScreen->initialSelection)) {
                u32 temp2;
                element = &characterScreen->carouselBlobs[(i + 2) & 3];

                temp2 = (temp + i * 0x66) & 0x3FF;
                element->x = Q_2_14_TO_INT(COS(temp2) * 92) + 10;
                element->y = Q_2_14_TO_INT(SIN(temp2) * 92) + 80;
                sub_80051E8(element);
            }
        }

        if (characterScreen->initialSelection > 0
            && characterScreen->initialSelection < 4
            && characterScreen->animFrame > 0x13) {
            for (; i < gUnknown_080D7274[characterScreen->initialSelection]; i++) {
                u32 temp2;
                element = &characterScreen->carouselBlobs[(i + 2) & 3];
                temp2 = (temp + i * 0x66) & 0x3FF;
                element->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->y = (gSineTable[temp2] * 0x5C >> 0xE) + 80;
                sub_80051E8(element);
            }
        }
    }

    element = &characterScreen->scrollUpArrow;
    sub_80051E8(element);
    element = &characterScreen->scrollDownArrow;
    sub_80051E8(element);
}

static void RenderTransitionInUIAnim(struct CharacterSelectionScreen *characterScreen)
{
    u8 i;
    u16 x;
    Sprite *element;
    struct UNK_808D124_UNK180 *transformOptions;

    if (characterScreen->amyUnlocked) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->selectedCharacter
                || characterScreen->unk3C4 != 0x10) {

                element = &characterScreen->carouselBlobs[temp2];

                element->x = ((gSineTable[(((characterScreen->carouselPosition >> 8)
                                            + (i * 0x66) + 2)
                                           & 0x3FF)
                                          + 0x100]
                               * 0x5C)
                              >> 0xE)
                    + 10;
                element->y = ((gSineTable[(((characterScreen->carouselPosition >> 8)
                                            + (i * 0x66) + 2)
                                           & 0x3FF)]
                               * 0x5C)
                              >> 0xE)
                    + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3 = (i + 2) & 3;
            if (temp3 != characterScreen->selectedCharacter
                || characterScreen->unk3C4 < 0xD) {
                element = &characterScreen->carouselBlobs[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                element->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->y = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }
    element = &characterScreen->selectedCarouselBlob;
    transformOptions = &characterScreen->selectedBlobTransform;

    element->x = 101;
    element->y = 79;
    element->variant = characterScreen->selectedCharacter
        + SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
    element->unk21 = 0xFF;

    transformOptions->unk0 = 0;
    transformOptions->unk2
        = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8)
        + 0xC0;
    transformOptions->unk4
        = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF] >> 8)
        + 0xC0;
    transformOptions->unk6[0] = element->x;
    transformOptions->unk6[1] = element->y;

    element->unk10 = gUnknown_030054B8++ | 0x60;
    sub_8004558(element);
    sub_8004860(element, transformOptions);
    sub_80051E8(element);

    if (characterScreen->animFrame < 8) {
        i = 0xA0;
    } else {
        i = ((0x10 - characterScreen->animFrame) * 0x14);
    }
    element = &characterScreen->screenTitleText;
    element->x = i + 0xF0;
    element->y = 0x10;
    sub_80051E8(element);

    if (characterScreen->animFrame < 8) {
        i = 8 - characterScreen->animFrame;
    } else {
        i = 0;
    }

    element = &characterScreen->characterSprite;
    if (i > 0) {
        element->x = characterScreen->characterBaseXPos
            + (0x80 - (gSineTable[i * 0x10 + 0x100] >> 7)) * 2;
    } else {
        element->x = characterScreen->characterBaseXPos;
    }

    element->y = 0x82;
    x = element->x;

    if (!(characterScreen->availableCharacters
          & CHARACTER_BIT(characterScreen->selectedCharacter))
        && IS_SINGLE_PLAYER) {
        element->unk10 |= 0x40000;
        element->palId = sCharacterSilhouettes[characterScreen->selectedCharacter];
    } else {
        element->unk10 &= ~0x40000;
        element->palId = 0;
    }
    sub_80051E8(element);

    if (characterScreen->selectedCharacter == CHARACTER_CREAM) {
        element = &characterScreen->characterSecondarySprite;
        element->x = x;
        element->y = 0x82;

        if (!(characterScreen->availableCharacters
              & CHARACTER_BIT(characterScreen->selectedCharacter))
            && IS_SINGLE_PLAYER) {
            // make shadow mode
            element->unk10 |= 0x40000;
            element->palId = sCharacterSilhouettes[CHEESE_SILHOUETTE];
        } else {
            element->unk10 &= ~0x40000;
            element->palId = 0;
        }
        sub_80051E8(element);
    }

    if (characterScreen->animFrame < 4) {
        i = 8;
    } else if (characterScreen->animFrame < 0xC) {
        i = (0xC - characterScreen->animFrame);
    } else {
        i = 0;
    }
    element = &characterScreen->characterNameSubText;
    element->x = characterScreen->characterSubTextBaseXPos + i * 0x14;
    element->y = 0x90;
    sub_80051E8(element);

    element = &characterScreen->characterTitleTextLeft;
    transformOptions = &characterScreen->characterTitleLeftTransform;

    element->x = 0x28;
    element->y = 0x4F;

    transformOptions->unk0 = 0;
    transformOptions->unk2 = 0x100;
    transformOptions->unk4 = 0x100 - ((0x10 - characterScreen->animFrame) * 0xF);
    transformOptions->unk6[0] = element->x;
    transformOptions->unk6[1] = element->y;

    element->unk10 = gUnknown_030054B8++ | 0x20;
    sub_8004558(element);
    sub_8004860(element, transformOptions);
    sub_80051E8(element);

    element = &characterScreen->characterTitleTextRight;
    transformOptions = &characterScreen->characterTitleRightTransform;

    element->x = 0x28;
    element->y = 0x4F;

    transformOptions->unk0 = 0;
    transformOptions->unk2 = 0x100;
    transformOptions->unk4 = 0x100 - ((0x10 - characterScreen->animFrame) * 0xF);
    transformOptions->unk6[0] = element->x;
    transformOptions->unk6[1] = element->y;

    element->unk10 = gUnknown_030054B8++ | 0x20;
    sub_8004558(element);
    sub_8004860(element, transformOptions);
    sub_80051E8(element);

    element = &characterScreen->scrollUpArrow;
    sub_80051E8(element);
    element = &characterScreen->scrollDownArrow;
    sub_80051E8(element);
}

static void RenderCarouselScrollAnim(struct CharacterSelectionScreen *characterScreen)
{
    u8 selectedCharacter, b, d;
    u16 c, e, f;
    u8 i;
    s8 somethinga;
    Sprite *element;
    struct UNK_808D124_UNK180 *transformOptions;

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
        element = &characterScreen->characterSprite;
        element->graphics.anim = sCharacterSpriteAssets[selectedCharacter][0];
        element->variant = sCharacterSpriteAssets[selectedCharacter][1];
        element->unk21 = 0xFF;

        if (!(characterScreen->availableCharacters
              & CHARACTER_BIT(characterScreen->selectedCharacter))
            && IS_SINGLE_PLAYER) {
            element->unk10 |= 0x40000;
            element->palId = sCharacterSilhouettes[characterScreen->selectedCharacter];
        } else {
            element->unk10 &= ~0x40000;
            element->palId = 0;
        }

        sub_8004558(element);

        if (!(characterScreen->availableCharacters
              & CHARACTER_BIT(characterScreen->selectedCharacter))
            && IS_SINGLE_PLAYER) {
            element = &characterScreen->characterNameSubText;
            element->graphics.anim
                = sCharacterNameSubTextAssets[CHARACTER_HIDDEN_LABEL][0];
            element->variant = sCharacterNameSubTextAssets[CHARACTER_HIDDEN_LABEL][1];
            element->unk21 = 0xFF;
            sub_8004558(element);

            element = &characterScreen->characterTitleTextLeft;
            element->graphics.anim
                = sCharacterTitleLeftSideAssets[CHARACTER_HIDDEN_LABEL][0];
            element->variant = sCharacterTitleLeftSideAssets[CHARACTER_HIDDEN_LABEL][1];
            element->unk21 = 0xFF;

            element = &characterScreen->characterTitleTextRight;
            element->graphics.anim
                = sCharacteTitleRightSideAssets[CHARACTER_HIDDEN_LABEL][0];
            element->variant = sCharacteTitleRightSideAssets[CHARACTER_HIDDEN_LABEL][1];
            element->unk21 = 0xFF;
        } else {
            element = &characterScreen->characterNameSubText;
            element->graphics.anim
                = sCharacterNameSubTextAssets[selectedCharacter + somethinga * 6][0];
            element->variant
                = sCharacterNameSubTextAssets[selectedCharacter + somethinga * 6][1];
            element->unk21 = 0xFF;
            sub_8004558(element);

            element = &characterScreen->characterTitleTextLeft;
            element->graphics.anim = sCharacterTitleLeftSideAssets[selectedCharacter][0];
            element->variant = sCharacterTitleLeftSideAssets[selectedCharacter][1];
            element->unk21 = 0xFF;

            element = &characterScreen->characterTitleTextRight;
            element->graphics.anim = sCharacteTitleRightSideAssets[selectedCharacter][0];
            element->variant = sCharacteTitleRightSideAssets[selectedCharacter][1];
            element->unk21 = 0xFF;
        }
    }

    if (characterScreen->amyUnlocked) {
        for (i = 0; i < 10; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->selectedCharacter
                || characterScreen->unk3C4 < 0xD) {

                element = &characterScreen->carouselBlobs[temp2];

                element->x = ((gSineTable[(((characterScreen->carouselPosition >> 8)
                                            + (i * 0x66) + 2)
                                           & 0x3FF)
                                          + 0x100]
                               * 0x5C)
                              >> 0xE)
                    + 10;
                element->y = ((gSineTable[(((characterScreen->carouselPosition >> 8)
                                            + (i * 0x66) + 2)
                                           & 0x3FF)]
                               * 0x5C)
                              >> 0xE)
                    + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < 8; i++) {
            u32 temp2;
            u32 temp3 = (i + 2) & 3;
            if (temp3 != characterScreen->selectedCharacter
                || characterScreen->unk3C4 < 0xD) {
                element = &characterScreen->carouselBlobs[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                element->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->y = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }

    if (characterScreen->unk3C4 > 9) {
        element = &characterScreen->selectedCarouselBlob;
        transformOptions = &characterScreen->selectedBlobTransform;

        element->x = 0x65;
        element->y = 0x4F;
        element->variant = characterScreen->selectedCharacter
            + SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
        element->unk21 = 0xFF;

        transformOptions->unk0 = 0;
        transformOptions->unk2
            = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF]
               >> 8)
            + 0xC0;
        transformOptions->unk4
            = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF]
               >> 8)
            + 0xC0;
        transformOptions->unk6[0] = element->x;
        transformOptions->unk6[1] = element->y;

        element->unk10 = gUnknown_030054B8++ | 0x60;
        sub_8004558(element);
        sub_8004860(element, transformOptions);
        sub_80051E8(element);
    }

    element = &characterScreen->characterSprite;

    if (b > 0) {
        element->x = characterScreen->characterBaseXPos
            + (0x80 - (gSineTable[b * 0x10 + 0x100] >> 7)) * 2;
        f = element->x;
        e = characterScreen->characterBaseXPos + (b * 0x12);

    } else {
        element->x = characterScreen->characterBaseXPos;
        f = element->x;
        e = element->x;
    }
    element->y = 0x82;

    if (!(characterScreen->availableCharacters
          & CHARACTER_BIT(characterScreen->selectedCharacter))
        && IS_SINGLE_PLAYER) {
        element->unk10 |= 0x40000;
        element->palId = sCharacterSilhouettes[characterScreen->selectedCharacter];
    } else {
        element->unk10 &= ~0x40000;
        element->palId = 0;
    }
    sub_80051E8(element);

    if (characterScreen->selectedCharacter == CHARACTER_CREAM) {
        element = &characterScreen->characterSecondarySprite;
        element->x = e;
        element->y = 0x82;

        if (!(characterScreen->availableCharacters
              & CHARACTER_BIT(characterScreen->selectedCharacter))
            && IS_SINGLE_PLAYER) {
            element->unk10 |= 0x40000;
            element->palId = sCharacterSilhouettes[CHEESE_SILHOUETTE];
        } else {
            element->unk10 &= ~0x40000;
            element->palId = 0;
        }

        sub_80051E8(element);
    }

    if (IS_MULTI_PLAYER
        && characterScreen->multiplayerSelections
            & CHARACTER_BIT(characterScreen->selectedCharacter)) {
        element = &characterScreen->characterUnavailableIndicator;
        element->x = f;
        element->y = 130;
        sub_80051E8(element);
    }

    element = &characterScreen->characterNameSubText;
    element->x = characterScreen->characterSubTextBaseXPos + (d * 5) * 4;
    element->y = 144;
    sub_80051E8(element);

#ifndef NON_MATCHING
    if (&characterScreen->screenTitleText) {
        element = &characterScreen->screenTitleText;
    } else {
        element = &characterScreen->screenTitleText;
    }
#endif

    element = &characterScreen->screenTitleText;
    element->x = DISPLAY_WIDTH;
    element->y = 16;
    sub_80051E8(element);

    element = &characterScreen->characterTitleTextLeft;
    transformOptions = &characterScreen->characterTitleLeftTransform;
    element->x = 40;
    element->y = 79;

    if (c < 8) {
        transformOptions->unk0 = 0;
        transformOptions->unk2 = 0x100;
        transformOptions->unk4 = 0x100 - ((8 - c) * 0x1E);
        transformOptions->unk6[0] = element->x;
        transformOptions->unk6[1] = element->y;

        element->unk10 = gUnknown_030054B8++ | 0x20;
        sub_8004558(element);
        sub_8004860(element, transformOptions);
    } else {
        element->unk10 = 0;
    }

    sub_80051E8(element);

    element = &characterScreen->characterTitleTextRight;
    transformOptions = &characterScreen->characterTitleRightTransform;
    element->x = 40;
    element->y = 79;

    if (c < 8) {
        transformOptions->unk0 = 0;
        transformOptions->unk2 = 0x100;
        transformOptions->unk4 = 0x100 - ((8 - c) * 0x1E);
        transformOptions->unk6[0] = element->x;
        transformOptions->unk6[1] = element->y;

        element->unk10 = gUnknown_030054B8++ | 0x20;
        sub_8004558(element);
        sub_8004860(element, transformOptions);
    } else {
        element->unk10 = 0;
    }

    sub_80051E8(element);

    element = &characterScreen->scrollUpArrow;
    sub_8004558(element);
    sub_80051E8(element);

    element = &characterScreen->scrollDownArrow;
    sub_8004558(element);
    sub_80051E8(element);
}

static void RenderUI(struct CharacterSelectionScreen *characterScreen)
{
    struct UNK_808D124_UNK180 *transformOptions;
    Sprite *element, *element2, *element3;
    u8 i;
    if (characterScreen->amyUnlocked) {
        for (i = 0; i < NUM_CHARACTERS * 2; i++) {
            u8 temp2 = i - Div(i, 5) * 5;
            if (temp2 != characterScreen->selectedCharacter
                || characterScreen->unk3C4 < 0xD) {

                element = &characterScreen->carouselBlobs[temp2];

                element->x = ((gSineTable[(((characterScreen->carouselPosition >> 8)
                                            + (i * 0x66) + 2)
                                           & 0x3FF)
                                          + 0x100]
                               * 0x5C)
                              >> 0xE)
                    + 10;
                element->y = ((gSineTable[(((characterScreen->carouselPosition >> 8)
                                            + (i * 0x66) + 2)
                                           & 0x3FF)]
                               * 0x5C)
                              >> 0xE)
                    + 0x50;
                sub_80051E8(element);
            }
        }
    } else {
        u16 temp = ((characterScreen->carouselPosition >> 8) + 0x330) & 0x3FF;
        for (i = 0; i < (NUM_CHARACTERS - 1) * 2; i++) {
            u32 temp2;
            u32 temp3 = (i + 2) & 3;
            if (temp3 != characterScreen->selectedCharacter
                || characterScreen->unk3C4 < 0xD) {
                element = &characterScreen->carouselBlobs[temp3];
                temp2 = ((temp + i * 0x66) + 4) & 0x3FF;
                element->x = (gSineTable[temp2 + 0x100] * 0x5C >> 0xE) + 10;
                element->y = (gSineTable[temp2] * 0x5C >> 0xE) + 0x50;
                sub_80051E8(element);
            }
        }
    }

    if (characterScreen->cursorAnimFrame > 0) {
        element = &characterScreen->selectedCarouselBlob;
        transformOptions = &characterScreen->selectedBlobTransform;

        element->x = 101;
        element->y = 79;
        element->variant = characterScreen->selectedCharacter
            + SA2_ANIM_VARIANT_CHAR_SELECT_CIRCLE_ACTIVE;
        element->unk21 = 0xFF;

        transformOptions->unk0 = 0;
        transformOptions->unk2
            = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF]
               >> 8)
            + 0xC0;
        transformOptions->unk4
            = (gSineTable[(characterScreen->cursorAnimFrame * 0x10 + 0x100) & 0x3FF]
               >> 8)
            + 0xC0;
        transformOptions->unk6[0] = element->x;
        transformOptions->unk6[1] = element->y;

        element->unk10 = gUnknown_030054B8++ | 0x60;
        sub_8004558(element);
        sub_8004860(element, transformOptions);
        sub_80051E8(element);
    }
    sub_8004558(&characterScreen->characterSprite);
    sub_80051E8(&characterScreen->characterSprite);

    if (characterScreen->selectedCharacter == CHARACTER_CREAM) {
        element2 = &characterScreen->characterSecondarySprite;
        sub_8004558(element2);
        sub_80051E8(element2);
    }
    if (IS_MULTI_PLAYER
        && (characterScreen->multiplayerSelections
            & CHARACTER_BIT(characterScreen->selectedCharacter))) {
        sub_80051E8(&characterScreen->characterUnavailableIndicator);
    }
    sub_80051E8(&characterScreen->characterNameSubText);
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
    sub_80051E8(element3);
#else
    sub_80051E8(&characterScreen->screenTitleText);
#endif
    sub_80051E8(&characterScreen->characterTitleTextLeft);
    sub_80051E8(&characterScreen->characterTitleTextRight);

    element = &characterScreen->scrollUpArrow;
    sub_8004558(element);
    sub_80051E8(element);

    element = &characterScreen->scrollDownArrow;
    sub_8004558(element);
    sub_80051E8(element);
}

static void Task_MultiplayerWaitForSelections(void)
{
    union MultiSioData *send, *recv;
    u32 i, j;
    Sprite *element;
    u8 charactersSelected[NUM_CHARACTERS] = { 0, 0, 0, 0, 0 };

    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(gCurTask);
    BackgroundAnim();

    MultiPakHeartbeat();

    if (IS_MULTI_PLAYER) {
        ReadMultiplayerSelections(characterScreen, i, recv);
    }

    if (gPressedKeys & B_BUTTON) {
        characterScreen->selectionComplete = FALSE;
        gCurTask->main = Task_CharacterSelectMain;

        element = &characterScreen->characterSprite;
        element->graphics.anim
            = sCharacterSpriteAssets[characterScreen->selectedCharacter][0];
        element->variant = sCharacterSpriteAssets[characterScreen->selectedCharacter][1];
        element->unk21 = 0xFF;

        element = &characterScreen->characterSecondarySprite;
        element->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
        element->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(
            SA2_ANIM_CHAR_ID_CHEESE, SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC);
        element->unk21 = 0xFF;

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
            if (recv->pat0.unk0 == 0x4021
                && recv->pat0.unk2 == characterScreen->selectedCharacter
                && i < SIO_MULTI_CNT->id) {
                gCurTask->main = Task_CharacterSelectMain;
                m4aSongNumStart(SE_RETURN);
                characterScreen->selectionComplete = FALSE;

                element = &characterScreen->characterSprite;
                element->graphics.anim
                    = sCharacterSpriteAssets[characterScreen->selectedCharacter][0];
                element->variant
                    = sCharacterSpriteAssets[characterScreen->selectedCharacter][1];
                element->unk21 = 0xFF;
                sub_8004558(element);

                element = &characterScreen->characterSecondarySprite;
                element->graphics.anim = SA2_ANIM_CHAR_SELECT_CHARACTER;
                element->variant = SA2_ANIM_VARIANT_SELECT_CHARACTER(
                    SA2_ANIM_CHAR_ID_CHEESE,
                    SA2_ANIM_VARIANT_CHAR_SELECT_CHARACTER_STATIC);
                element->unk21 = 0xFF;
                sub_8004558(element);

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
    register struct CharacterSelectionScreen *characterScreen
        = TaskGetStructPtr(gCurTask);
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
    struct CharacterSelectionScreen *characterScreen = TaskGetStructPtr(t);
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
