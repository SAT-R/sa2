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

struct BirdAnimation {
    struct UNK_0808B3FC_UNK240 sprite;
    u16 unk30;
    u16 unk32;
    u16 unk34;
    u16 unk36;
    s16 unk38;
    s16 unk3A;
    u8 unk3C;
    u8 unk3D;
    u8 sequenceStep;
    u8 unk3F;
};

// Store the intro data objects
struct UNK_3005B80 {
    struct TitleScreen_UNK27C* unk0;
    struct TitleScreen* unk4;
};

struct UNK_080E0D64 {
    // width
    u32 unk0;
    // caption ID
    u16 unk4;
    s8 unk6;
};

struct MenuItemTransition {
    struct UNK_0808B3FC_UNK240* sprite;
    u8 filler4[12];
    u8 animFrame;
    s16 unk12;
}; /* size 0x14 */

struct LensFlare {
    struct UNK_0808B3FC_UNK240 sprites[8];
    struct UNK_808D124_UNK180 unk180[8];
    s16 posSequenceX[8];
    s16 posSequenceY[8];
    u16 unk200;
    s16 unk202;
    u8 unk204;
    // animFrame
    u8 animFrame;
    u8 unk206;
    u8 unk207;
}; /* size 0x208 */

// Used outside of this module I think, so declared here
struct UNK_3005B80 gUnknown_03005B80;

void CreateTitleScreen(void);
void CreateTitleScreenAndSkipIntro(void);
// CreateTitleScreenAtPlayModeMenu
void CreateTitleScreenAtPlayModeMenu(void);
// CreateTitleScreenSkipToPlayModeMenu
void CreateTitleScreenAtSinglePlayerMenu(void);

#endif
