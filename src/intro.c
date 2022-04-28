#include "intro.h"

#include "constants/songs.h"
#include "flags.h"
#include "global.h"
#include "m4a.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "main.h"
#include "data.h"
#include "input.h"

// Might not be declared here
struct UNK_3005B80 gUnknown_03005B80;

// TODO: Extract this data from ROM
// I believe these will only be used here
extern const u8 gUnknown_080E0EF4[0x160];
extern const u8 gUnknown_080E1054[10];
extern const u8 gUnknown_080E105E[5];

// Don't know who these belong to yet
extern void sub_808D598(void);
extern u8 sub_802D4CC(struct UNK_0808B3FC_UNK270*);
extern void sub_801A6D8(void);
extern void sub_803143C(u32, u8);
extern void sub_8087FC0(void);
// CreateOptionsScreen
extern void sub_8063730(u32);
extern void sub_8063A00(u16);
extern void sub_805A1CC(void);


void sub_808CE00(u32, u32, u32, u32, u32);
void sub_8003EE4(u32, u16, u16, u32, u32, u32, u32, struct BgAffineRegs*);

static void sub_808B768(struct UNK_0808B3FC*);

// TODO: make static once references to it are decompiled
void sub_808B884_InitTitleScreenUI(struct UNK_0808B3FC*);

// TODO: make static once decompiled
void sub_808CBA4(struct UNK_0808B3FC*);
void sub_808D5FC(void);
static void sub_808BB54_Task_IntroCreateSonicTeamLogo(void);
static void sub_808BBF4_Task_IntroFadeInSonicTeamLogo(void);
void sub_808D63C(void);

void sub_808D4DC(struct UNK_0808B3FC*);

static void sub_808BCC4(void);
static void sub_808BDBC(void);
static void sub_808BF7C(void);
static void sub_808C1AC(void);

void sub_808D124(void);
void sub_808D67C(void);
void sub_808D740(struct UNK_0808B3FC*);
static void sub_808C2C8(void);
void sub_808D6D4(void);
void sub_808D790(struct UNK_0808B3FC_UNK240*, u32);
void sub_808C358(void);
void sub_808C218(void);
static void sub_808C498(void);
void sub_808C58C(void);
void sub_808C710_Task_HandleTitleScreenExit(void);
void sub_808D35C(void);

// CreateTitleScreen
void sub_808B3FC_CreateTitleScreen(void) {
    struct Task* t;
    // state (TitleScreenState)
    struct UNK_0808B3FC* introConfig;
    struct UNK_0808B3FC_UNK270* config270;
    struct UNK_0808B3FC_UNK27C* config27C;
    s32 i, val;
    s16 denom;

    t = TaskCreate(sub_808D598, sizeof(struct UNK_0808B3FC), 0x1000, 0, NULL);
    introConfig = TaskGetStructPtr(t, introConfig);

    introConfig->unkF34 = 512;
    introConfig->unkF36 = 0x100;
    introConfig->unkF38 = 2;

    introConfig->unkF42 = 0;
    introConfig->unkF40 = 0;

    introConfig->unkF3E = 0;
    introConfig->unkF3A = 0x20;

    // Intro sequence step
    introConfig->unkF3C = 0;

    // Pan up velocity
    introConfig->unkF3D = 1;

    // Generate the wave effects
    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        denom = Div(65536, (i + 1) * 8);

        // I.E: (512 * demon) - Not sure why it uses this when it's constant
        val = (introConfig->unkF34 * denom) >> 8;
        
        // Goes from 16384 -> 102 in an log curve \_
        introConfig->unk2B4[i] = val;
        // Goes from 4 -> 642 in steps of 4 but becomes 
        // a slightly more jagged line as i in creases
        introConfig->unkDF4[i] = Div(65536, val);
    };

    config270 = &introConfig->unk270;
    config270->unk0 = 1;
    config270->unk4 = 0;
    config270->unk2 = 2;
    config270->unk6 = 0x100;
    config270->unk8 = 0x3FBF;
    config270->unkA = 0;

    config27C = &introConfig->unk27C;
    config27C->unk0 = 0;
    config27C->unk2 = 0;
    config27C->unk34 = introConfig->unkF38;
    config27C->unk1 = 0xE;
    config27C->unk4 = gUnknown_080E1054;
    config27C->unk8 = gUnknown_080E0EF4;
    config27C->unk36 = 0;

    gUnknown_03005B80.unk0 = config27C;
    gUnknown_03005B80.unk4 = introConfig;

    sub_808B768(introConfig);
    m4aSongNumStart(MUS_INTRO);
    gFlags |= 0x8000;

    sub_802D4CC(config270);
}

void sub_808B560(struct UNK_0808B3FC* introConfig) {
    struct UNK_0808B3FC_UNK270* config270;
    struct Unk_03002400 *config0, *config40;

    // Size of filler between unk2B4
    // and unkDF4
    introConfig->unkF34 = 0xa00;
    
    introConfig->unkF36 = 3;
    introConfig->unkF38 = 2;
    introConfig->unkF42 = 0;
    introConfig->unkF40 = 0;
    introConfig->unkF3E = 0;
    introConfig->unkF3A = 0x20;
    introConfig->unkF3C = 0;
    introConfig->unkF3D = 1;

    config270 = &introConfig->unk270;
    config270->unk0 = 1;
    config270->unk4 = 0;
    config270->unk2 = 2;
    config270->unk6 = 0x200;
    config270->unk8 = 0x3fbf;
    config270->unkA = 0;

    sub_808B884_InitTitleScreenUI(introConfig);

    // Possibly a macro, why would this be set to 0 first
    gDispCnt = 0;
    gDispCnt |= DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
    
    gBgCntRegs[0] = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR;
    gBgCntRegs[1] = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(29) | BGCNT_AFF512x512 | BGCNT_16COLOR;
    gBgCntRegs[2] = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(26) | BGCNT_AFF256x256 | BGCNT_256COLOR;

    DmaFill32(3, 0, (void*)BG_VRAM, BG_VRAM_SIZE);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 32;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 0x20;

    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 512;

    config0 = &introConfig->unk0;
    config0->unk4 = BG_SCREEN_ADDR(0);
    config0->unkA = 0;
    config0->unkC = BG_SCREEN_ADDR(26);
    config0->unk18 = 0;
    config0->unk1A = 0;
    if (gLoadedSaveGame->unk6 < 2) {
        config0->unk1C = 0x108;
    } else {
        config0->unk1C = 0x109;
    }
    config0->unk1E = 0;
    config0->unk20 = 0;
    config0->unk22 = 0;
    config0->unk24 = 0;
    config0->unk26 = 0x1a;
    config0->unk28 = 10;
    config0->unk2A = 0;
    config0->unk2E = 6;

    sub_8002A3C(config0);

    gDispCnt &= ~DISPCNT_BG0_ON;
    gDispCnt |= DISPCNT_BG1_ON | DISPCNT_BG2_ON;

    gBgCntRegs[2] &= ~BGCNT_WRAP;

    gBldRegs.bldCnt = BLDCNT_EFFECT_NONE;
    gFlags &= ~0x8000;

    config40 = &introConfig->unk40;
    config40->unk4 = BG_SCREEN_ADDR(16);
    config40->unkA = 0;
    config40->unkC = BG_SCREEN_ADDR(29);
    config40->unk18 = 0;
    config40->unk1A = 0;
    config40->unk1C = 0x105;
    config40->unk1E = 0;
    config40->unk20 = 0;
    config40->unk22 = 0;
    config40->unk24 = 0;
    config40->unk26 = 0x20;
    config40->unk28 = 0x40;
    config40->unk2A = 0;
    config40->unk2E = 1;

    sub_8002A3C(config40);

    m4aSongNumStart(MUS_TITLE_FANFARE);

    sub_802D4CC(&introConfig->unk270);
}

// Maybe create background sprites
static void sub_808B768(struct UNK_0808B3FC* introConfig) {
    struct Unk_03002400 *config80, *config0;

    gDispCnt = DISPCNT_MODE_1;
    gDispCnt |= DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
    
    gBgCntRegs[0] = 0x1f04;
    gBgCntRegs[1] = 0x9d0a;
    gBgCntRegs[2] = 0x7a81;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 0x20;

    DmaFill32(3, 0, (void*)BG_VRAM, BG_VRAM_SIZE);

    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 0x200;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    config80 = &introConfig->unk80;

    config80->unk4 = BG_SCREEN_ADDR(8);
    config80->unkA = 0;
    config80->unkC = BG_SCREEN_ADDR(31);
    config80->unk18 = 0;
    config80->unk1A = 0;
    config80->unk1C = 0x60;
    config80->unk1E = 0;
    config80->unk20 = 0;
    config80->unk22 = 0;
    config80->unk24 = 0;
    config80->unk26 = 0x1e;
    config80->unk28 = 0x14;
    config80->unk2A = 0;
    config80->unk2E = 0;

    sub_8002A3C(config80);

    config0 = &introConfig->unk0;

    config0->unk4 = BG_SCREEN_ADDR(0);
    config0->unkA = 0;
    config0->unkC =  BG_SCREEN_ADDR(26);
    config0->unk18 = 0;
    config0->unk1A = 0;
    config0->unk1C = 0x106;
    config0->unk1E = 0;
    config0->unk20 = 0;
    config0->unk22 = 0;
    config0->unk24 = 0;
    config0->unk26 = 0x20;
    config0->unk28 = 0x20;
    config0->unk2A = 0;
    config0->unk2E = 6;

    sub_8002A3C(config0);
}

#define NUM_LANGUAGES 6

void sub_808B884_InitTitleScreenUI(struct UNK_0808B3FC* introConfig) {
    // Credit to @jiang for the match on this one too
    s8 language;
    u32 menuItemId, objAddr;
    struct UNK_0808B3FC_UNK240 *config;

    // Must be 0 - 6;
    language = gLoadedSaveGame->unk6;
    objAddr = OBJ_VRAM0;

    // TODO: make these into macros maybe?
    config = &introConfig->unkC0;
    
    config->unk4 = objAddr;
    objAddr += (90 * TILE_SIZE_4BPP);
    
    config->unkA = 0x33e;
    config->unk20 = 1;
    config->unk21 = 0xFF;
    config->unk16 = 0;
    config->unk18 = 0x82;
    config->unk8 = 0;
    config->unk1A = 0x100;
    config->unk1C = 0;
    config->unk22 = 0x10;
    config->unk25 = 0;
    config->unk10 = 0;
    sub_8004558(config);

    config = &introConfig->unkF0;

    config->unk4 = objAddr;
    objAddr += (gUnknown_080E0D64[language].unk0 * TILE_SIZE_4BPP);
    
    config->unkA = gUnknown_080E0D64[language].unk4;
    config->unk20 = gUnknown_080E0D64[language].unk6;
    config->unk21 = 0xFF;
    config->unk16 = 0x78;
    config->unk18 = 0x6E;
    config->unk8 = 0;
    config->unk1A = 0xC0;
    config->unk1C = 0;
    config->unk22 = 0x10;
    config->unk25 = 0;
    config->unk10 = 0;
    sub_8004558(config);

    for (menuItemId = 0; menuItemId < ARRAY_COUNT(introConfig->unk120); menuItemId++) {
        config = &introConfig->unk120[menuItemId];

        // gUnknown_080E0D9C could be considered a 2d array ([7][6] so [language][i])
        // but this doesn't match
        config->unk4 = objAddr;
        objAddr += (gUnknown_080E0D9C[menuItemId + language * NUM_LANGUAGES].unk0 * TILE_SIZE_4BPP);
        
        config->unkA = gUnknown_080E0D9C[menuItemId + language * NUM_LANGUAGES].unk4;
        config->unk20 = gUnknown_080E0D9C[menuItemId + language * NUM_LANGUAGES].unk6;
        config->unk21 = 0xFF;
        config->unk16 = 0x78;
        
        // Generate menu item y positions
        // position * lineHeight + topPadding
        if (menuItemId < SinglePlayerMenuItem(0)) {
            // PlayModeMenu positions
            config->unk18 = (PlayModeMenuIndex(menuItemId) * 0x12) + 0x60;
        } else if (gLoadedSaveGame->unk14) {
            // SinglePlayerMenu if we have the chao garden available
            config->unk18 = (SinglePlayerMenuIndex(menuItemId) * 0x10) + 0x60;
        } else {
            // SinglePlayerMenu items if we don't have the chao garden
            config->unk18 = (SinglePlayerMenuIndex(menuItemId) * 0x12) + 0x64;
        }
        
        config->unk8 = 0;
        config->unk1A = 0xc0;
        config->unk1C = 0;
        config->unk22 = 0x10;
        config->unk25 = 0;
        config->unk10 = 0;
        sub_8004558(config);
    };

    config = &introConfig->unk240;
    config->unk4 = objAddr;
    // Use last value for this one
    config->unkA = gUnknown_080E0D9C[42].unk4;
    config->unk20 = gUnknown_080E0D9C[42].unk6;
    config->unk21 = 0xFF;
    config->unk16 = 0x78;
    config->unk18 = 0x50;
    config->unk8 = 0;
    config->unk1A = 0x780;
    config->unk1C = 0;
    config->unk22 = 0x10;
    config->unk25 = 0;
    config->unk10 = 0x3000;
    sub_8004558(config);
}

#define FadeInBlend(frame)  \
    BLDALPHA_BLEND(frame, 16 - (frame))

#define FadeOutBlend(frame) \
    BLDALPHA_BLEND(16 - (frame), frame)

void sub_808BA78_Task_IntroFadeInSegaLogo(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    gBldRegs.bldAlpha = FadeInBlend(introConfig->unkF3E);

    if (introConfig->unkF3E >= 16) {
        introConfig->unkF3E = 0;
        gBldRegs.bldAlpha = FadeInBlend(16);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        gCurTask->main = sub_808D5FC;
    }

    introConfig->unkF3E++;
}

void sub_808BAD8_Task_IntroFadeOutSegaLogo(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    gBldRegs.bldAlpha = FadeOutBlend(introConfig->unkF3E * 2);

    if (introConfig->unkF3E >= 8) {
        gDispCnt &= ~DISPCNT_BG0_ON;
        gBldRegs.bldAlpha = FadeOutBlend(16);
        introConfig->unkF3E = 0;
        gFlags &= ~0x8000;
        gCurTask->main = sub_808BB54_Task_IntroCreateSonicTeamLogo;
    }

    introConfig->unkF3E++;
}

// Task_CreateSonicTeamLogo
static void sub_808BB54_Task_IntroCreateSonicTeamLogo(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    struct Unk_03002400* config80;
    
    sub_808CBA4(introConfig);

    if (introConfig->unkF3E == 1) {
        // TODO: some macro for this
        config80 = &introConfig->unk80;
        config80->unk4 = BG_SCREEN_ADDR(8);
        config80->unkA = 0;
        config80->unkC = BG_SCREEN_ADDR(31);
        config80->unk18 = 0;
        config80->unk1A = 0;
        // GFX asset
        config80->unk1C = 0x61;
        config80->unk1E = 0;
        config80->unk20 = 0;
        config80->unk22 = 0;
        config80->unk24 = 0;
        config80->unk26 = 0x1e;
        config80->unk28 = 0x14;
        config80->unk2A = 0;
        config80->unk2E = 0x10;
        sub_8002A3C(config80);
    }

    if (introConfig->unkF3E > 2) {
        introConfig->unkF3E = 0;
        gDispCnt |= DISPCNT_BG0_ON;
        gCurTask->main = sub_808BBF4_Task_IntroFadeInSonicTeamLogo;
    }

    introConfig->unkF3E++;
}

static void sub_808BBF4_Task_IntroFadeInSonicTeamLogo(void) {
    // Wondering if this is some inline function
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    gBldRegs.bldAlpha = FadeInBlend(introConfig->unkF3E);

    if (introConfig->unkF3E >= 16) {
        introConfig->unkF3E = 0;
        gBldRegs.bldAlpha = FadeInBlend(16);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        // Only diference is this function assignment for the next task
        gCurTask->main = sub_808D63C;
    }

    introConfig->unkF3E++;
}

// Task_FadeOutSonicTeamLogo
void sub_808BC54(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    gBldRegs.bldAlpha = FadeOutBlend(introConfig->unkF3E * 2);

    if (introConfig->unkF3E >= 8) {
        gCurTask->main = sub_808BCC4;
        introConfig->unkF3E = 0;
        gDispCnt &= ~DISPCNT_BG0_ON;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;    
    }

    introConfig->unkF3E++;
}

// Task_IntroStartSkyTransition
static void sub_808BCC4(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    struct Unk_03002400* config40;
    sub_808CBA4(introConfig);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(introConfig);
        return;
    }

    // If animation frame is 59
    // Load the island sprite
    if (introConfig->unkF3E == 59) {
        config40 = &introConfig->unk40;
        config40->unk4 = BG_SCREEN_ADDR(16);
        config40->unkA = 0;
        config40->unkC = BG_SCREEN_ADDR(29);
        config40->unk18 = 0;
        config40->unk1A = 0;
        config40->unk1C = 0x105;
        config40->unk1E = 0;
        config40->unk20 = 0;
        config40->unk22 = 0;
        config40->unk24 = 0;
        config40->unk26 = 0x20;
        config40->unk28 = 0x40;
        config40->unk2A = 0;
        config40->unk2E = 1;
        sub_8002A3C(config40);
    }
    
    // Once the animation frame is at 140
    // begin the pan, and load the bird animations
    if (introConfig->unkF3E > 140) {
        gCurTask->main = sub_808BDBC;
        introConfig->unkF3E = 0;
        gDispCnt |= DISPCNT_BG1_ON;
        gBldRegs.bldAlpha = FadeOutBlend(16);
        gBldRegs.bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1;
        sub_808CE00(0x7c, 0xffffffc4, 0, 0xffdf, 0);
        sub_808CE00(0xb4, 0xffffffe8, 3, 0x20, 0);
    }
    
    introConfig->unkF3E++;
}

// Task_IntroPanSkyTransition
static void sub_808BDBC(void) {
    struct Unk_03002400* config0;
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(introConfig);
        return;
    }

    gBgScrollRegs[1][1] -= introConfig->unkF3D;
    if (gBgScrollRegs[1][1] < 0xAF) {
        gBgScrollRegs[1][1] = 0xAF;
    }

    if (gBgScrollRegs[1][1] < 0x15F) {
        gDispCnt &= 0xFBFF;
        gDispCnt &= 0xBFFF;
    } else {
        introConfig->unkF38 += introConfig->unkF3D;
        sub_808CBA4(introConfig);
    }

    // Increase the pan up velocity once the correct
    // frame is reached
    if (introConfig->unkF3E == gUnknown_080E105E[introConfig->unkF3C]) {
        introConfig->unkF3E = 0;
        introConfig->unkF3D++;
        introConfig->unkF3C++;
    }

    // After 1 second, show the lens flare
    // animation
    if (introConfig->unkF3E > 60 && introConfig->unkF3C > 2) {
        gBgCntRegs[2] &= ~BGCNT_WRAP;

        gUnknown_03004D80[0] = 2;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0x20;
        gUnknown_03002280[3] = 0x20;

        gBldRegs.bldCnt = 0;

        config0 = &introConfig->unk0;
        config0->unk4 = BG_SCREEN_ADDR(8);
        config0->unkA = 0;
        config0->unkC = BG_SCREEN_ADDR(31);
        config0->unk18 = 0;
        config0->unk1A = 0;
        config0->unk1C = 0x107;
        config0->unk1E = 0;
        config0->unk20 = 0;
        config0->unk22 = 0;
        config0->unk24 = 0;
        config0->unk26 = 7;
        config0->unk28 = 0x10;
        config0->unk2A = 0;
        config0->unk2E = 0x10;
        sub_8002A3C(config0);

        gBgScrollRegs[0][1] = 0x4F;
        gCurTask->main = sub_808BF7C;

        introConfig->unkF3E = 0;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x3F;

        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY = 0;

        gDispCnt |= DISPCNT_WIN1_ON;
        REG_SIOCNT |= SIO_INTR_ENABLE;
    }
    introConfig->unkF3E++;
}

// Task
static void sub_808BF7C(void) {
    struct Unk_03002400* config0;
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(introConfig);
        return;
    }

    if (introConfig->unkF3E == 2) {
        sub_808D124();
    }

    // Every other frame
    if (introConfig->unkF3E & 1) {
        sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 10, &gBgAffineRegs);
        gDispCnt |= 0x100;
    }

    if (introConfig->unkF3C > 2 && (u16)(introConfig->unkF3E - 0x14) < 0x77) {
        gDispCnt &= 0xFEFF;
        gDispCnt |= 0x4000;

        gWinRegs[1] = 0xF0;
        // Display height?
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x3F;

        gBldRegs.bldCnt = 0x3FBF;
        
        if (introConfig->unkF3E > 0x1D) {
            gBldRegs.bldY = 0x10 - ((introConfig->unkF3E - 0x1E) >> 3);
        } else {
            gBldRegs.bldY = 0x10;
        }
        
        if (introConfig->unkF3E == 0x15) {
            gBgScrollRegs[1][1] = 0;
        }
    }

   
    if (introConfig->unkF3E > 0x8A) {
        config0 = &introConfig->unk0;

        // Probably wrong size here (0x4000)
        DmaFill32(3, 0, (void *)VRAM, OBJ_VRAM1_SIZE);

        gUnknown_03004D80[0] = 2;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xff;
        gUnknown_03002280[3] = 0x20;
        gUnknown_03004D80[2] = 0;
        gUnknown_03002280[8] = 0;
        gUnknown_03002280[9] = 0;
        gUnknown_03002280[10] = 0xff;
        gUnknown_03002280[11] = 0x20;
        
        config0->unk4 = BG_SCREEN_ADDR(0);
        config0->unkA = 0;
        config0->unkC = BG_SCREEN_ADDR(26);
        config0->unk18 = 0;
        config0->unk1A = 0;
        
        if (gLoadedSaveGame->unk6 < 2) {
            config0->unk1C = 0x108;
        } else {
            config0->unk1C = 0x109;
        }

        config0->unk1E = 0;
        config0->unk20 = 0;
        config0->unk22 = 0;
        config0->unk24 = 0;
        config0->unk26 = 0x1A;
        config0->unk28 = 10;
        config0->unk2A = 0;
        config0->unk2E = 6;

        sub_8002A3C(config0);

        gBgCntRegs[2] &= 0xDFFF;
        gCurTask->main = sub_808C1AC;
        
        gDispCnt |= 0x400;
        gDispCnt &= 0xFEFF;

        gBldRegs.bldAlpha = 0x1000;
        gBldRegs.bldCnt = 0x244;

        introConfig->unkF3E = 0;
        gBgScrollRegs[1][1] = 0;
        
        sub_808B884_InitTitleScreenUI(introConfig);
    }
    introConfig->unkF3E++;
}

// Task_FadeInTitleScreen
static void sub_808C1AC(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(introConfig);
        return;
    }

    gBldRegs.bldAlpha = FadeInBlend(introConfig->unkF3E >> 2);

    if (introConfig->unkF3E > 64) {
        gBldRegs.bldCnt = 0;
        introConfig->unkF3E = 0;
        gCurTask->main = sub_808D67C;
    }

    introConfig->unkF3E++;
    sub_808D740(introConfig);
}

#define FRAME_TIME_SECONDS(n) ((n) * 60)

// Task_PressStartScreen
void sub_808C218(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);

    // Show the press start text for 2/3 of a second
    if (introConfig->unkF3E < 40) {
        sub_80051E8(&introConfig->unkF0);
    }

    introConfig->unkF3E++;
    // And don't show it for the next 2/3 of a second
    if (introConfig->unkF3E > 80) {
        introConfig->unkF3E = 0;
    }
    sub_80051E8(&introConfig->unkC0);

    if (gPressedKeys & START_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        introConfig->unkF3E = 0;
        introConfig->unkF42 = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        gCurTask->main = sub_808C2C8;
    }

    sub_808D740(introConfig);

    introConfig->unkF40++;
    if (introConfig->unkF40 == FRAME_TIME_SECONDS(15)) {
        // Start the demo after 15 seconds on this screen
        gCurTask->main = sub_808D6D4;
    }
}

// Task_StartPressedTransition
static void sub_808C2C8(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);

    // Flash the start button
    if ((introConfig->unkF3E & 7) > 3) {
        sub_80051E8(&introConfig->unkF0);
    }
    introConfig->unkF3E++;

    sub_80051E8(&introConfig->unkC0);

    // Show the next menu items after 1/6 of a second (10 frames) 
    if (introConfig->unkF3E == 10) {
        sub_808D790(&introConfig->unk120[PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)], 1);
        sub_808D790(&introConfig->unk120[PlayModeMenuIndex(MENU_ITEM_MULTI_PLAYER)], 1);
    }

    if (introConfig->unkF3E > 16) {
        introConfig->unkF3E = 0;
        introConfig->unkF42 = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        gCurTask->main = sub_808C358;
    }

    sub_808D740(introConfig);
}

// Task_PlayModeMenu
void sub_808C358(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    struct UNK_0808B3FC_UNK240* menuItem;
    struct UNK_0808B3FC_UNK270* config270;
    u8 menuIndex;
    
    sub_80051E8(&introConfig->unkC0);
    sub_808D740(introConfig);

    // Highlight the menu items from cursor position
    for (menuIndex = 0; menuIndex < 2; menuIndex++) {
        menuItem = &introConfig->unk120[menuIndex ^ 1];
        menuItem->unk25 = (menuIndex ^ introConfig->unkF42);
        sub_80051E8(menuItem);
    }; 

    // Move the cursor if buttons are pressed
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        if (introConfig->unkF42 != PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)) {
            introConfig->unkF42 = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        } else {
            introConfig->unkF42 = PlayModeMenuIndex(MENU_ITEM_MULTI_PLAYER);
        }

        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    // Select option
    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        if (introConfig->unkF42 == PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)) {
            introConfig->unk120[MENU_ITEM_MULTI_PLAYER].unk16 = 0x78;
            sub_808D790(&introConfig->unk120[MENU_ITEM_MULTI_PLAYER], 0);
            
            introConfig->unkF3E = SinglePlayerMenuIndex(MENU_ITEM_GAME_START);

            gCurTask->main = sub_808C498;
        } else {
            config270 = &introConfig->unk270;
            sub_808D790(&introConfig->unk120[MENU_ITEM_SINGLE_PLAYER], 0);
            
            config270->unk8 = 0x3FFF;
            config270->unk4 = 0;
            config270->unk6 = 0x100;
            config270->unk2 = 1;
            
            introConfig->unkF42 = SPECIAL_MENU_INDEX_MULTI_PLAYER;
            gCurTask->main = sub_808C710_Task_HandleTitleScreenExit;
        }
        return;
    }

    // Return to start screen
    if (gPressedKeys & B_BUTTON) {
        introConfig->unkF40 = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = sub_808C218;
    }
}

// Task_SinglePlayerSelectedTransition
static void sub_808C498(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    struct UNK_0808B3FC_UNK240* menuItems = introConfig->unk120;
    
    // Flash the previous selected single player menu item
    if ((introConfig->unkF3E & 7) > 3) {
        sub_80051E8(&menuItems[MENU_ITEM_SINGLE_PLAYER]);
    }
    introConfig->unkF3E++;

    sub_80051E8(&introConfig->unkC0);

    // Allow back to be pressed during animation
    // to cancel
    if (gPressedKeys & B_BUTTON) {
        introConfig->unkF42 = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = sub_808C358;
    }

    if (introConfig->unkF3E == 8) {
        sub_808D790(&menuItems[MENU_ITEM_GAME_START], 1);
        sub_808D790(&menuItems[MENU_ITEM_TIME_ATTACK], 1);
        sub_808D790(&menuItems[MENU_ITEM_OPTIONS], 1);
        
        if (gLoadedSaveGame->unk14) {
            sub_808D790(&menuItems[MENU_ITEM_TINY_CHAO_GARDEN], 1);
        }
    }

    if (introConfig->unkF3E > 12) {
        introConfig->unkF3E = 0;
        introConfig->unkF42 = SinglePlayerMenuIndex(MENU_ITEM_GAME_START);
        gCurTask->main = sub_808C58C;
    }

    sub_808D740(introConfig);
}

// Task_SinglePlayerMenu
void sub_808C58C(void) {
    struct UNK_0808B3FC_UNK240 * menuItem;
    struct UNK_0808B3FC* introConfig;
    struct UNK_0808B3FC_UNK270* config270;
    u8 menuIndex;

    u8 numMenuItems = 3;
    if (gLoadedSaveGame->unk14) {
        numMenuItems = 4;
    }

    introConfig = TaskGetStructPtr(gCurTask, introConfig);

    for (menuIndex = 0; menuIndex < numMenuItems; menuIndex++) {
        menuItem = &introConfig->unk120[SinglePlayerMenuItem(menuIndex)];
        if (introConfig->unkF42 == menuIndex) {
            menuItem->unk25 = 1;
        } else {
            menuItem->unk25 = 0;
        }
        sub_80051E8(menuItem);
    }

    sub_808D740(introConfig);

    // Handle input and wrap the cursor around
    if (gRepeatedKeys & DPAD_UP) {
        if (introConfig->unkF42 > 0) {
            introConfig->unkF42--;
        } else {
            introConfig->unkF42 = numMenuItems - 1;
        }
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    } else if (gRepeatedKeys & DPAD_DOWN) {
        if (introConfig->unkF42 < (numMenuItems - 1)) {
            introConfig->unkF42++;
        } else {
            introConfig->unkF42 = 0; 
        }
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }


    if (gPressedKeys & B_BUTTON) {
        introConfig->unkF42 = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = sub_808C358;
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        config270 = &introConfig->unk270;
        config270->unk8 = 0x3FFF;
        if (introConfig->unkF42 == SinglePlayerMenuIndex(MENU_ITEM_TINY_CHAO_GARDEN)) {
           config270->unk8 = 0x3FBF;
        }
        config270->unk6 = 0x100;
        config270->unk4 = 0;
        config270->unk2 = 1;

        for (menuIndex = 0; menuIndex < numMenuItems; menuIndex++) {
            if (menuIndex != introConfig->unkF42) {
                sub_808D790(&introConfig->unk120[SinglePlayerMenuItem(menuIndex)], 0);
            }
        }

        m4aSongNumStart(SE_SELECT);
        gCurTask->main = sub_808C710_Task_HandleTitleScreenExit;
    }
}

// Task_HandleTitleScreenExit
void sub_808C710_Task_HandleTitleScreenExit(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    struct UNK_0808B3FC_UNK240* menuItem;
    u8 i;

    if (sub_802D4CC(&introConfig->unk270) == 1) {
        gUnknown_03005424 = 0;
        gUnknown_030055B4 = 0;
        gUnknown_030054F0 = 0;
        
        switch(introConfig->unkF42) {
            case SinglePlayerMenuIndex(MENU_ITEM_GAME_START):
                gUnknown_030054CC = 0;
                sub_801A6D8();
                if (gLoadedSaveGame->unk13 & 0x10) {
                    sub_803143C(0, 1);
                } else {
                    sub_803143C(0, 0);   
                }
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_TIME_ATTACK):
                sub_801A6D8();
                gUnknown_030055B4 = 0;
                gUnknown_030054F0 = 0;
                gUnknown_030054CC = 1;
                sub_8087FC0();
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_OPTIONS):
                gUnknown_030054CC = 0;
                sub_8063730(0);
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_TINY_CHAO_GARDEN):
                sub_808D35C();
                break;
            case SPECIAL_MENU_INDEX_MULTI_PLAYER:
                gUnknown_030054CC = 3;
                sub_801A6D8();
                if (gLoadedSaveGame->unk20[0] != 0xFFFF) {
                    sub_805A1CC();
                } else {
                    sub_8063A00(0);
                }
                break;
        }
        TaskDestroy(gCurTask);
    } else {
        sub_808D740(introConfig);
        if (introConfig->unkF42 == SPECIAL_MENU_INDEX_MULTI_PLAYER) {
            // ?? wat, who writes for loops like this
            // is some macro for the numMenuItems so it wasn't
            // obvious
            for (i = 0; i < 1; i++) {
                menuItem = &introConfig->unk120[i ^ 1];
                menuItem->unk25 = i ^ 1;
                if ((++introConfig->unkF3E & 7) > 3) {
                    sub_80051E8(menuItem);
                }
            }
            sub_80051E8(&introConfig->unkC0);
        } else {
            menuItem = &introConfig->unk120[SinglePlayerMenuItem(introConfig->unkF42)];
            menuItem->unk25 = 1;
            if ((++introConfig->unkF3E & 7) > 3) {
                sub_80051E8(menuItem);
            }
        }
    }
}

