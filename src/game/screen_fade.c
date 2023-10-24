#include "core.h"
#include "game/game.h"
#include "game/screen_fade.h"

static inline void ScreenFadeUpdateValues_inline(ScreenFade *fade)
{
    if (fade->window != SCREEN_FADE_USE_WINDOW_0) {
        gDispCnt |= DISPCNT_WIN1_ON;
        gWinRegs[WINREG_WIN1H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN1V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] |= BLDCNT_TGT2_ALL;
        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_OBJ | WINOUT_WIN01_BG_ALL);
    } else {
        gDispCnt |= DISPCNT_WIN0_ON;
        gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_WIDTH);
        gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_HEIGHT);
        gWinRegs[WINREG_WININ] |= BLDCNT_TGT1_ALL;
        gWinRegs[WINREG_WINOUT] |= (WINOUT_WIN01_OBJ | WINOUT_WIN01_BG_ALL);
    }

    gBldRegs.bldCnt = fade->bldCnt;
    gBldRegs.bldAlpha = fade->bldAlpha;

    if (fade->flags & SCREEN_FADE_FLAG_LIGHTEN) {
        gBldRegs.bldY = Q_8_8_TO_INT(fade->brightness);
    } else {
        gBldRegs.bldY = SCREEN_FADE_BLEND_MAX - Q_8_8_TO_INT(fade->brightness);
    }

    if (gBldRegs.bldY >= SCREEN_FADE_BLEND_MAX) {
        gBldRegs.bldY = SCREEN_FADE_BLEND_MAX;
    }

    gBldRegs.bldY /= 2;
}

u8 UpdateScreenFade(ScreenFade *fade)
{
    ScreenFadeUpdateValues_inline(fade);

    fade->brightness += fade->speed;

    if (fade->brightness >= Q_8_8(SCREEN_FADE_BLEND_MAX)) {
        fade->brightness = Q_8_8(SCREEN_FADE_BLEND_MAX);
        return SCREEN_TRANSITION_COMPLETE;
    } else {
        return SCREEN_TRANSITION_RUNNING;
    }
}

static void ScreenFadeUpdateValues(ScreenFade *fade)
{
    ScreenFadeUpdateValues_inline(fade);
}
