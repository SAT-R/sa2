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

struct TitleScreen_UNK270 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
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
    struct TitleScreen_UNK270 unk270;
    struct TitleScreen_UNK27C unk27C;

    // Something to do with the wave effects
    u16 wavesTranslationX[0xA0];
    u32 unk3F4[4][0xA0];
    u16 wavesTranslationY[0xA0];

    u16 unkF34;
    u16 unkF36;
    u16 wavesTopOffset;

    s16 unkF3A;

    u8 introTransitionStep;
    u8 introPanUpVelocity;

    u16 animFrame;
    u16 startScreenTimer;
    u8 menuCursorIndex;

    u8 unkF43;
    u16 unkF44[16];
}; /* size 0xF64 */

struct UNK_808CE00 {
    struct UNK_0808B3FC_UNK240 sprite;
    u16 unk30;
    u16 unk32;
    u16 unk34;
    u16 unk36;
    s16 unk38;
    s16 unk3A;
    u8 unk3C;
    u8 unk3D;
    u8 unk3E;
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

struct UNK_808D034 {
    struct UNK_0808B3FC_UNK240* sprite;
    u8 filler4[12];
    u8 unk10;
    s16 unk12;
}; /* size 0x14 */

struct UNK_808D124 {
    struct UNK_0808B3FC_UNK240 sprites[8];
    struct UNK_808D124_UNK180 unk180[8];
    s16 unk1E0[8];
    s16 unk1F0[8];
    u16 unk200;
    s16 unk202;
    u8 unk204;
    u8 unk205;
    u8 unk206;
    u8 unk207;
}; /* size 0x208 */

// Used outside of this module I think, so declared here
struct UNK_3005B80 gUnknown_03005B80;

void CreateTitleScreen(void);
void CreateTitleScreenAndSkipIntro(void);
// CreateTitleScreenAtPlayModeMenu
void sub_808D45C(void);
// CreateTitleScreenSkipToPlayModeMenu
void sub_808D49C(void);

#define MENU_ITEM_SINGLE_PLAYER 0
#define MENU_ITEM_MULTI_PLAYER 1
#define MENU_ITEM_GAME_START 2
#define MENU_ITEM_TIME_ATTACK 3
#define MENU_ITEM_OPTIONS 4
#define MENU_ITEM_TINY_CHAO_GARDEN 5

#define SPECIAL_MENU_INDEX_MULTI_PLAYER 4

#define PlayModeMenuIndex(item) (item - MENU_ITEM_SINGLE_PLAYER)
#define PlayModeMenuItem(index) (MENU_ITEM_SINGLE_PLAYER + index)

#define SinglePlayerMenuIndex(item) (item - MENU_ITEM_GAME_START)
#define SinglePlayerMenuItem(index) (MENU_ITEM_GAME_START + index)

#endif
