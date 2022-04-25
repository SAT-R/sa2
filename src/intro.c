#include "intro.h"

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

extern void sub_808D598(void);
extern void sub_802D4CC(struct UNK_0808B3FC_UNK270*);

static void sub_808B768(struct UNK_0808B3FC*);

// TODO make static once decompiled
void sub_808B884(struct UNK_0808B3FC*);
void sub_808CBA4(struct UNK_0808B3FC*);
void sub_808D5FC(void);
static void sub_808BB54(void);
static void sub_808BBF4(void);
void sub_808D63C(void);
static void sub_808BCC4(void);
void sub_808CE00(u32, u32, u32, u32, u32);
void sub_808D4DC(struct UNK_0808B3FC*);

void sub_808B3FC_CreateIntro(void) {
    struct Task* t;
    struct UNK_0808B3FC* introConfig;
    struct UNK_0808B3FC_UNK270* config270;
    struct UNK_0808B3FC_UNK27C* config27C;
    s32 i, val, res;
    u16 unknownWaveAttr;

    t = TaskCreate(sub_808D598, sizeof(struct UNK_0808B3FC), 0x1000, 0, NULL);
    introConfig = TaskGetStructPtr(t, introConfig);

    introConfig->unkF34 = 0x200;
    introConfig->unkF36 = 0x100;
    introConfig->unkF38 = 2;

    introConfig->unkF42 = 0;
    introConfig->unkF40 = 0;

    introConfig->unkF3E = 0;
    introConfig->unkF3A = 0x20;

    introConfig->unkF3C = 0;
    introConfig->unkF3D = 1;

    // Generate the wave effects
    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        res = Div(0x10000, (i + 1) * 8);
        unknownWaveAttr = introConfig->unkF34;

        val = ((s16)res * unknownWaveAttr) >> 8;
        introConfig->unk2B4[i] = val;
        introConfig->unkDF4[i] = Div(0x10000, val);
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
    m4aSongNumStart(1);
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

    sub_808B884(introConfig);

    gDispCnt = 0;
    gDispCnt |= 0x1641;
    
    gBgCntRegs[0] = 0x1f04;
    gBgCntRegs[1] = 0x9d0a;
    gBgCntRegs[2] = 0x5a81;

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
    gBgScrollRegs[1][1] = 0x200;

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

    gDispCnt &= 0xfeff;
    gDispCnt |= DISPCNT_BG1_ON | DISPCNT_BG2_ON;

    gBgCntRegs[2] &= ~BGCNT_WRAP;

    gBldRegs.bldCnt = 0;
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

    m4aSongNumStart(2);

    sub_802D4CC(&introConfig->unk270);
}

static void sub_808B768(struct UNK_0808B3FC* introConfig) {
    struct Unk_03002400 *config80, *config0;

    gDispCnt = 1;
    gDispCnt |= 0x1440;
    
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

void sub_808B884(struct UNK_0808B3FC* introConfig) {
    // Credit to @jiang for the match on this one too
    s8 saveValue;
    u32 i, objAddr;
    struct UNK_0808B3FC_UNK240 *config;

    // Must be 0 - 6;
    saveValue = gLoadedSaveGame->unk6;
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
    objAddr += (gUnknown_080E0D64[saveValue].unk0 * TILE_SIZE_4BPP);
    
    config->unkA = gUnknown_080E0D64[saveValue].unk4;
    config->unk20 = gUnknown_080E0D64[saveValue].unk6;
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

    for (i = 0; i < 6; i++) {
        config = &introConfig->unk120[i];

        // gUnknown_080E0D9C could be considered a 2d array ([7][6] so [saveValue][i])
        // but this doesn't match
        config->unk4 = objAddr;
        objAddr += (gUnknown_080E0D9C[i + saveValue * 6].unk0 * TILE_SIZE_4BPP);
        
        config->unkA = gUnknown_080E0D9C[i + saveValue * 6].unk4;
        config->unk20 = gUnknown_080E0D9C[i + saveValue * 6].unk6;
        config->unk21 = 0xFF;
        config->unk16 = 0x78;
        
        // TODO: understand this
        if (i < 2) {
          config->unk18 = (i * 0x12) + 0x60;
        } else {
          if (gLoadedSaveGame->unk14 != 0) {
            config->unk18 = (i - 2) * 0x10 + 0x60;
          } else {
            config->unk18 = (i - 2) * 0x12 + 0x64;
          }
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

#define FadeInAlpha(frame, fadeSpeed)  \
    ((16 - frame) << (7 + fadeSpeed)) | (frame * fadeSpeed)

#define FadeOutAlpha(frame, fadeSpeed)       \
({                                           \
    u32 tmp = frame * fadeSpeed;             \
    (frame << (7 + fadeSpeed)) | (16 - tmp); \
})

// Task_FadeInSegaLogo
void sub_808BA78(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    gBldRegs.bldAlpha = FadeInAlpha(introConfig->unkF3E, 1);

    if (introConfig->unkF3E >= 16) {
        introConfig->unkF3E = 0;
        gBldRegs.bldAlpha = 16;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        gCurTask->main = sub_808D5FC;
    }

    introConfig->unkF3E++;
}

// Task_FadeOutSegaLogo
void sub_808BAD8(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    // Fade out?
    gBldRegs.bldAlpha = FadeOutAlpha(introConfig->unkF3E, 2);

    if (introConfig->unkF3E >= 8) {
        gDispCnt &= ~0x100;
        gBldRegs.bldAlpha = 0x1000;
        introConfig->unkF3E = 0;
        gFlags &= ~0x8000;
        gCurTask->main = sub_808BB54;
    }

    introConfig->unkF3E++;
}

// Task_InitSonicTeamLogo
static void sub_808BB54(void) {
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
        gDispCnt |= 0x100;
        gCurTask->main = sub_808BBF4;
    }

    introConfig->unkF3E++;
}

// Task_FadeInSonicTeamLogo
static void sub_808BBF4(void) {
    // Wondering if this is some inline function
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    sub_808CBA4(introConfig);

    gBldRegs.bldAlpha = FadeInAlpha(introConfig->unkF3E, 1);

    if (introConfig->unkF3E >= 16) {
        introConfig->unkF3E = 0;
        gBldRegs.bldAlpha = 16;
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

    gBldRegs.bldAlpha = FadeOutAlpha(introConfig->unkF3E, 2);

    if (introConfig->unkF3E >= 8) {
        gCurTask->main = sub_808BCC4;
        introConfig->unkF3E = 0;
        gDispCnt &= ~0x100;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;    
    }

    introConfig->unkF3E++;
}

void sub_808BDBC(void);

// Detect user input and do something
static void sub_808BCC4(void) {
    struct UNK_0808B3FC* introConfig = TaskGetStructPtr(gCurTask, introConfig);
    struct Unk_03002400* config40;
    sub_808CBA4(introConfig);

    if ((gPressedKeys & (A_BUTTON | START_BUTTON))) {
        sub_808D4DC(introConfig);
        return;
    }

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
    
    // Doesn't match as as else if for
    // some reason. Maybe this is how they wrote it.
    // Interesting that GCC is not good enough
    // to understand that this is not possible
    // to trigger if the previous if is true
    if (introConfig->unkF3E > 140) {
        gCurTask->main = sub_808BDBC;
        introConfig->unkF3E = 0;
        gDispCnt |= 0x200;
        gBldRegs.bldAlpha = 0x1000;
        gBldRegs.bldCnt = 0x241;
        sub_808CE00(0x7c, 0xffffffc4, 0, 0xffdf, 0);
        sub_808CE00(0xb4, 0xffffffe8, 3, 0x20, 0);
    }
    
    introConfig->unkF3E++;
}
