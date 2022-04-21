#include "intro.h"

#include "flags.h"
#include "global.h"
#include "m4a.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "main.h"
#include "data.h"


extern struct UNK_3005B80 gUnknown_03005B80;

extern u8 gUnknown_080E0EF4[0x160];
extern u8 gUnknown_080E1054[10];

extern void sub_808D598(void);
extern void sub_808B768(struct UNK_0808B3FC*);
extern void sub_802D4CC(struct UNK_0808B3FC_UNK270*);
extern void sub_808B884(struct UNK_0808B3FC*);

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

    // Possibly a fake match, need to decode the flags
    gDispCnt = 0x1640;
    gDispCnt |= 1;
    
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

    gBgScrollRegs[0][2] = 8;
    gBgScrollRegs[0][3] = 0x200;

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
