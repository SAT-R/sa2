#ifndef GUARD_INTRO_H
#define GUARD_INTRO_H

#include "global.h"
#include "sprite.h"

struct TitleScreen_UNK27C {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 filler3;

    const u8* unk4;
    const u8* unk8;

    u8 fillerC[40];
    u16 unk34;
    u8 unk36;
};

// TitleScreen
struct TitleScreen {
    // Possibly an array of ui elements?
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;
    struct Unk_03002400 unk80;

    // Dunno what these are yet
    struct UNK_0808B3FC_UNK240 unkC0;
    struct UNK_0808B3FC_UNK240 unkF0;

    struct UNK_0808B3FC_UNK240 menuItems[6];

    // Used
    struct UNK_0808B3FC_UNK240 unk240;

    // Some more configs
    struct UNK_802D4CC_UNK270 unk270;
    struct TitleScreen_UNK27C unk27C;

    // Something to do with the wave effects
    u16 wavesTranslationX[0xA0];
    u32 unk3F4[0xA0][4];
    u16 wavesTranslationY[0xA0];

    u16 unkF34;
    u16 unkF36;
    u16 wavesTopOffset;

    s16 unkF3A;

    u8 introTransitionStep;
    u8 introPanUpVelocity;

    u16 animFrame;
    u16 startScreenTimer;
    u8 menuCursor;

    u8 unkF43;
    u16 unkF44[16];
}; /* size 0xF64 */

// Store the intro data objects
struct UNK_3005B80 {
    struct TitleScreen_UNK27C* unk0;
    struct TitleScreen* unk4;
};

// Used outside of this module I think, so declared here
struct UNK_3005B80 gUnknown_03005B80;

void CreateTitleScreen(void);
void CreateTitleScreenAndSkipIntro(void);
// CreateTitleScreenAtPlayModeMenu
void CreateTitleScreenAtPlayModeMenu(void);
// CreateTitleScreenSkipToPlayModeMenu
void CreateTitleScreenAtSinglePlayerMenu(void);

#endif
