#include "global.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "game/game.h"
#include "game/save.h"
#include "game/options_screen.h"
#include "game/title_screen.h"
#include "game/stage/debug_text_printer.h"

#include "constants/animations.h"
#include "constants/characters.h"
#include "constants/songs.h"

#if ENABLE_DECOMP_CREDITS
typedef struct {
    Sprite sprSonic;
    Sprite sprTails;
    Sprite sprLogoOllie;
    Sprite sprLogoJace;
    bool8 hasProfile;

    u16 frames;
    s32 logoFrameT0;
    s32 sonicArrivedT0;
    s32 qSonicScreenX; // Q_24_8 of Sonic's screen position
    s32 qTailsScreenX; // Q_24_8 of Tails's screen position
    s32 qLogoOllieScreenX; // Q_24_8 of Ollie's screen position
    s32 qLogoJaceScreenX; // Q_24_8 of Jace's screen position
    s16 qSpeedSonic; // Q_24_8 of Sonic's speed
    s16 qSpeedTails; // Q_24_8 of Tails' speed

    IntrFunc prevHBlank;
} DCCredits;

void Task_DecompCreditsFirst();
void TaskDestructor_DecompCredits(struct Task *t);

void customHBlank(void);

void Task_SonicArrived(void);
void Task_OllieLogoMoves(void);

#define LOGO_WIDTH  64
#define TAILS_WIDTH 32

//    1
// -------
// x^4 + 0.5
s32 logoOllieMove(s32 frameNum)
{
    s32 qTime = (Q_DIV(Q(frameNum), Q(GBA_FRAMES_PER_SECOND)));

    s32 qNum = Q(1);
    s32 qDenom = Q_MUL(Q_MUL(Q_MUL(Q_MUL(qTime, qTime), qTime), qTime), qTime) + Q(1);
    return Q_DIV(qNum, qDenom);
}

void CreateDecompCreditsScreen(bool32 hasProfile)
{
    struct Task *t;
    DCCredits *cred;
    Sprite *s;

    Debug_CreateAsciiTask(0, 0);

    t = TaskCreate(Task_DecompCreditsFirst, sizeof(DCCredits), 0, 0, TaskDestructor_DecompCredits);
    cred = TASK_DATA(t);

    cred->hasProfile = hasProfile;
    cred->frames = 0;
    cred->logoFrameT0 = 0;
    cred->qSpeedSonic = +Q(5);
    cred->qSpeedTails = -Q(0.5);

    s = &cred->sprSonic;
    s->x = -508;
    s->y = (DISPLAY_HEIGHT / 2) - 16;
    SPRITE_INIT_FLAGS(s, 64, SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SONIC), 4, 18, 2, SPRITE_FLAG_MASK_X_FLIP);
    s->animSpeed = SPRITE_ANIM_SPEED(4);
    cred->qSonicScreenX = Q(s->x);

    s = &cred->sprTails;
    s->x = DISPLAY_WIDTH + LOGO_WIDTH + TAILS_WIDTH;
    s->y = DISPLAY_HEIGHT - 48;
    SPRITE_INIT(s, 64, SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_TAILS), 0, 18, 2);
    s->palId = 1;
    cred->sprTails.animSpeed = SPRITE_ANIM_SPEED(1.5);
    cred->qTailsScreenX = Q(s->x);

    s = &cred->sprLogoOllie;
    s->x = (DISPLAY_WIDTH / 2) + 24;
    s->y = (DISPLAY_HEIGHT / 2) - (LOGO_WIDTH / 2);
    SPRITE_INIT_FLAGS(s, 64, 1133, 1, 18, 2, SPRITE_FLAG_MASK_X_FLIP);
    s->palId = 2;
    cred->qLogoOllieScreenX = Q(s->x);

    s = &cred->sprLogoJace;
    s->x = cred->sprTails.x - 64;
    s->y = cred->sprTails.y;
    SPRITE_INIT(s, 64, 1133, 0, 18, 2);
    s->palId = 3;
    cred->qLogoJaceScreenX = Q(s->x);

    // Screen setup
    gDispCnt |= (DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP);
    gDispCnt &= ~DISPCNT_FORCED_BLANK;

    cred->prevHBlank = gIntrTable[INTR_INDEX_HBLANK];
    gIntrTable[INTR_INDEX_HBLANK] = customHBlank;

    // Other
    m4aSongNumStart(MUS_STAFF_CREDITS);
}

void UpdateSprites(DCCredits *cred)
{
    Sprite *s;

    bool32 tailsIsCheering = FALSE;

    REG_IE |= INTR_FLAG_HBLANK;

    Debug_PrintTextAt("Game decompiled by:", 8, 16);

    s = &cred->sprSonic;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    cred->qSonicScreenX += cred->qSpeedSonic;
    s->x = I(cred->qSonicScreenX);

    s = &cred->sprTails;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    cred->qTailsScreenX += cred->qSpeedTails;
    s->x = I(cred->qTailsScreenX);
    tailsIsCheering = (s->graphics.anim == SA2_ANIM_CHAR(33, CHARACTER_TAILS)) ? 1 : 0;

    s = &cred->sprLogoOllie;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    s->x = I(cred->qLogoOllieScreenX);
    Debug_PrintTextAt("@freshollie", 16, s->y);

    s = &cred->sprLogoJace;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    cred->qLogoJaceScreenX += cred->qSpeedTails;
    s->x = I(cred->qLogoJaceScreenX);
    Debug_PrintTextAt("@JaceCear", 16, cred->sprLogoJace.y + 8);

    if (tailsIsCheering && ((cred->frames % 64u) < 32)) {
        Debug_PrintTextAt("Press START to continue", 8, DISPLAY_HEIGHT);
    }
}

void Task_DecompCreditsFirst()
{
    DCCredits *cred = TASK_DATA(gCurTask);
    Sprite *s;

    UpdateSprites(cred);

    // Check Tails' position
    if (cred->sprLogoJace.x <= ((DISPLAY_WIDTH / 2) + 24)) {
        cred->sprTails.graphics.anim = SA2_ANIM_CHAR(33, CHARACTER_TAILS);
        cred->sprTails.variant = 0;
        cred->qSpeedTails = 0;
        cred->sprTails.animSpeed = SPRITE_ANIM_SPEED(1.0);
    }

    if (cred->sprSonic.x > (cred->sprLogoOllie.x - (LOGO_WIDTH / 3))) {
        if (cred->logoFrameT0 == 0) {
            cred->logoFrameT0 = cred->frames;
            SPRITE_FLAG_CLEAR(&cred->sprLogoOllie, X_FLIP);
            m4aSongNumStart(SE_LONG_BRAKE);
            cred->sprSonic.graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_BRAKE_GOAL, CHARACTER_SONIC);
            cred->sprSonic.variant = 0;
        }

        if (cred->qSpeedSonic > 0) {
            cred->qSpeedSonic -= Q(20.0 / 256.0);

        } else {
            m4aSongNumStop(SE_LONG_BRAKE);

            cred->sprSonic.graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_SONIC);
            cred->sprSonic.variant = 2;
            cred->sprSonic.animSpeed = SPRITE_ANIM_SPEED(1.5);
            SPRITE_FLAG_CLEAR(&cred->sprSonic, X_FLIP);
            cred->qSpeedSonic = -Q(1.5);
        }

        {
            s32 qVel = logoOllieMove(cred->frames - cred->logoFrameT0);
            cred->qLogoOllieScreenX += qVel;
        }
    }

    if ((cred->qSpeedSonic <= 0) && cred->sprSonic.x < (DISPLAY_WIDTH / 2) + 16) {
        cred->qSpeedSonic = Q(0);

        cred->sprSonic.graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_34, CHARACTER_SONIC);
        cred->sprSonic.variant = 0;
        cred->sprSonic.animSpeed = SPRITE_ANIM_SPEED(1.0);

        gCurTask->main = Task_SonicArrived;
    }

    if (gInput & START_BUTTON) {
        TaskDestroy(gCurTask);
        return;
    }

    cred->frames++;
}

void Task_SonicArrived(void)
{
    DCCredits *cred = TASK_DATA(gCurTask);

    UpdateSprites(cred);

    // Check Tails' position
    if (cred->sprLogoJace.x <= ((DISPLAY_WIDTH / 2) + 24)) {
        cred->sprTails.graphics.anim = SA2_ANIM_CHAR(33, CHARACTER_TAILS);
        cred->sprTails.variant = 0;
        cred->qSpeedTails = 0;
        cred->sprTails.animSpeed = SPRITE_ANIM_SPEED(1.0);
    }

    if (cred->sonicArrivedT0 > 7 * GBA_FRAMES_PER_SECOND) {
        cred->sprSonic.graphics.anim = SA2_ANIM_CHAR(SA2_CHAR_ANIM_TAUNT, CHARACTER_SONIC);
        cred->sprSonic.variant = 0;
    }

    if (gInput & START_BUTTON) {
        TaskDestroy(gCurTask);
        return;
    }

    cred->frames++;
    cred->sonicArrivedT0++;
}

void TaskDestructor_DecompCredits(struct Task *t)
{
    DCCredits *cred = TASK_DATA(t);

    /* If players skip the credits while the soundeffect plays,
       it continues if it isn't manually stopped. */
    m4aSongNumStop(SE_LONG_BRAKE);

    /* Deallocate all graphics from VRAM */
    Debug_TextPrinterDestroy();

    VramFree(cred->sprSonic.graphics.dest);
    VramFree(cred->sprTails.graphics.dest);
    VramFree(cred->sprLogoOllie.graphics.dest);
    VramFree(cred->sprLogoJace.graphics.dest);

    gIntrTable[INTR_INDEX_HBLANK] = cred->prevHBlank;

    /* Initialize Titlescreen */
    PAUSE_GRAPHICS_QUEUE();

    if (gFlags & FLAGS_NO_FLASH_MEMORY) {
        CreateTitleScreen();
        LoadCompletedSaveGame();
        return;
    }

    if (!cred->hasProfile) {
        CreateNewProfileScreen();
        return;
    }

    // When a special button combination is pressed
    // skip the intro and go straight to the
    // title screen
    if (gFlags & FLAGS_SKIP_INTRO) {
        CreateTitleScreenAndSkipIntro();
        gFlags &= ~FLAGS_SKIP_INTRO;
        return;
    }

    CreateTitleScreen();
}

// Changes background colors depending on the current horizontal line
void customHBlank(void)
{
    // NOTE:
    // We have to use direct accesses to palette memory here instead of
    // SET_PALETTE_COLOR_BG() and GET_PALETTE_COLOR_OBJ() because those are only taken into account
    // at the end of the frame, while this HBlank-code need to update colors while the frame gets drawn;
    int_vcount vcount = REG_VCOUNT;
    if ((vcount >= DISPLAY_HEIGHT - 16 - 1) && (vcount < DISPLAY_HEIGHT - 1)) {
        // "PRESS START to continue"
        ((u16 *)BG_PLTT)[0] = RGB_WHITE;
    } else if ((vcount >= (DISPLAY_HEIGHT / 2) - 1) && (vcount < DISPLAY_HEIGHT - 1)) {
        // Logo background (JaceCear)
        ((u16 *)BG_PLTT)[0] = ((u16 *)OBJ_PLTT)[3 * PALETTE_LEN_4BPP];
    } else {
        // Logo background (freshollie)
        ((u16 *)BG_PLTT)[0] = ((u16 *)OBJ_PLTT)[2 * PALETTE_LEN_4BPP];
    }
}
#endif
