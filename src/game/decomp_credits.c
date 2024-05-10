#include "global.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "core.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/save.h"
#include "game/options_screen.h"
#include "game/title_screen.h"
#include "game/stage/debug_text_printer.h"

#include "constants/animations.h"
#include "constants/characters.h"
#include "constants/songs.h"

#if 1 // def NON_MATCHING
typedef struct {
    Sprite sprSonic;
    Sprite sprTails;
    Sprite sprLogoOllie;
    Sprite sprLogoJace;
    bool8 hasProfile;

    u16 frames;
    s32 qTailsScreenX;
    s32 qLogoJaceScreenX;
    s16 qSpeed;

    IntrFunc prevHBlank;
} DCCredits;

void Task_DecompCreditsFirst();
void TaskDestructor_DecompCredits(struct Task *t);

void customHBlank(void);

#define LOGO_WIDTH  64
#define TAILS_WIDTH 32

void CreateDecompCreditsScreen(bool32 hasProfile)
{
    struct Task *t;
    DCCredits *cred;
    Sprite *s;

    Debug_CreateAsciiTask(0, 0);

    t = TaskCreate(Task_DecompCreditsFirst, sizeof(DCCredits), 0, 0,
                   TaskDestructor_DecompCredits);
    cred = TASK_DATA(t);

    cred->hasProfile = hasProfile;
    cred->frames = 0;
    cred->qSpeed = Q(0.5);

    s = &cred->sprSonic;
    s->x = DISPLAY_WIDTH + LOGO_WIDTH + TAILS_WIDTH;
    s->y = (DISPLAY_HEIGHT * 1) / 4;
    SPRITE_INIT(s, 32, SA2_ANIM_CHAR(SA2_CHAR_ANIM_34, CHARACTER_SONIC), 0, 18, 2);

    s = &cred->sprTails;
    s->x = DISPLAY_WIDTH + LOGO_WIDTH + TAILS_WIDTH;
    s->y = DISPLAY_HEIGHT - 48;
    SPRITE_INIT(s, 64, SA2_ANIM_CHAR(SA2_CHAR_ANIM_WALK, CHARACTER_TAILS), 0, 18, 2);
    s->palId = 1;
    cred->sprTails.animSpeed = SPRITE_ANIM_SPEED(1.5);
    cred->qTailsScreenX = Q(s->x);

    s = &cred->sprLogoOllie;
    s->x = (DISPLAY_WIDTH * 3) / 4 - 32;
    s->y = (DISPLAY_HEIGHT * 1) / 4;
    SPRITE_INIT(s, 64, 1133, 1, 18, 2);
    s->palId = 2;

    s = &cred->sprLogoJace;
    s->x = cred->sprTails.x - 56;
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

void Task_DecompCreditsFirst()
{
    DCCredits *cred = TASK_DATA(gCurTask);
    Sprite *s;
    REG_IE |= INTR_FLAG_HBLANK;

    Debug_PrintTextAt("Game decompiled by:", 8, 16);

    s = &cred->sprSonic;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &cred->sprTails;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    cred->qTailsScreenX -= cred->qSpeed;
    s->x = I(cred->qTailsScreenX);

    s = &cred->sprLogoOllie;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    Debug_PrintTextAt("@freshollie", 16, s->y);

    s = &cred->sprLogoJace;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    cred->qLogoJaceScreenX -= cred->qSpeed;
    s->x = I(cred->qLogoJaceScreenX);
    Debug_PrintTextAt("@JaceCear", 16, cred->sprTails.y);

    if (cred->sprLogoJace.x <= ((DISPLAY_WIDTH / 2) + 24)) {
        Debug_PrintTextAt("Press START to continue", 8, DISPLAY_HEIGHT);
        cred->qSpeed = 0;

        cred->sprTails.graphics.anim = SA2_ANIM_CHAR(33, CHARACTER_TAILS);
        cred->sprTails.animSpeed = SPRITE_ANIM_SPEED(1.0);
    }

    if (gInput & START_BUTTON) {
        TaskDestroy(gCurTask);
    }

    cred->frames++;
}

void TaskDestructor_DecompCredits(struct Task *t)
{
    DCCredits *cred = TASK_DATA(t);

    /* Deallocate all graphics from VRAM */
    Debug_TextPrinterDestroy();

    VramFree(cred->sprSonic.graphics.dest);
    VramFree(cred->sprTails.graphics.dest);
    VramFree(cred->sprLogoOllie.graphics.dest);
    VramFree(cred->sprLogoJace.graphics.dest);

    gIntrTable[INTR_INDEX_HBLANK] = cred->prevHBlank;

    /* Initialize Titlescreen */

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
#endif

// Colors the screen behind the "Press START ..." text white
void customHBlank(void)
{
    if ((REG_VCOUNT >= DISPLAY_HEIGHT - 16 - 1) && (REG_VCOUNT < DISPLAY_HEIGHT - 1)) {
        ((u16 *)BG_PLTT)[0] = RGB_WHITE;
    } else if ((REG_VCOUNT >= DISPLAY_HEIGHT - 64 - 16 - 1)
               && (REG_VCOUNT < DISPLAY_HEIGHT - 1)) {
        ((u16 *)BG_PLTT)[0] = ((u16 *)OBJ_PLTT)[3 * 16];
    } else {
        ((u16 *)BG_PLTT)[0] = ((u16 *)OBJ_PLTT)[2 * 16];
    }
}