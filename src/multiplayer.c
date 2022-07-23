#include "global.h"
#include "multiplayer.h"
#include "save.h"
#include "data.h"
#include "multi_sio.h"
#include "task.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "data.h"
#include "m4a.h"
#include "constants/songs.h"

struct MultiplayerModeScreen {
    struct Unk_03002400 unk0;
    struct Unk_03002400 unk40;

    struct UNK_0808B3FC_UNK240 unk80;
    struct UNK_0808B3FC_UNK240 unkB0;
    struct UNK_0808B3FC_UNK240 unkE0;
    struct UNK_0808B3FC_UNK240 unk110;

    struct UNK_802D4CC_UNK270 unk140;
    u8 unk14C;
    u8 unk14D;
    u8 unk14E;
};

void sub_805A9B0(void);
void sub_805AA94(struct Task*);

extern const struct UNK_080E0D64 gUnknown_080D8F70[28];

void sub_805A1CC(void) {
    struct Task* t;
    struct MultiplayerModeScreen* modeScreen;
    struct UNK_802D4CC_UNK270* unk140;
    struct UNK_0808B3FC_UNK240* unk80;
    struct Unk_03002400* unk0;

    u8 lang = gLoadedSaveGame->unk6 * 4;
    gDispCnt = 0;
    gDispCnt |= 0x1341;
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gBgCntRegs[1] = 0x560C;
    gBgCntRegs[0] = 0x1401;

    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_805A9B0, 0x150, 0x2000, 0, sub_805AA94);
    modeScreen = TaskGetStructPtr(t, modeScreen);
    modeScreen->unk14C = 0;
    modeScreen->unk14D = 0;
    modeScreen->unk14E = 0;

    unk140 = &modeScreen->unk140;
    unk140->unk0 = 1;
    unk140->unk4 = 0;
    unk140->unk2 = 2;
    unk140->unk6 = 0x100;
    unk140->unk8 = 0x3FFF;
    unk140->unkA = 0;
    sub_802D4CC(unk140);

    unk80 = &modeScreen->unk80;
    unk80->unk4 = sub_8007C10(0x32);
    unk80->unkA = 0x431;
    unk80->unk20 = 0;
    unk80->unk21 = 0xFF;
    unk80->unk16 = 0;
    unk80->unk18 = 0;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0x1000;
    sub_8004558(unk80);

    unk80 = &modeScreen->unkB0;
    unk80->unk4 = sub_8007C10(gUnknown_080D8F70[lang].unk0);
    unk80->unkA = gUnknown_080D8F70[lang].unk4;
    unk80->unk20 = gUnknown_080D8F70[lang].unk6;
    unk80->unk21 = 0xFF;

    unk80->unk16 = 0;
    unk80->unk18 = 0;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0x1000;
    sub_8004558(unk80);

    unk80 = &modeScreen->unkE0;
    unk80->unk4 = sub_8007C10(gUnknown_080D8F70[lang + 1].unk0);
    unk80->unkA = gUnknown_080D8F70[lang + 1].unk4;
    unk80->unk20 = gUnknown_080D8F70[lang + 1].unk6;
    unk80->unk21 = 0xFF;

    unk80->unk16 = 0;
    unk80->unk18 = 0;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0x1000;
    sub_8004558(unk80);

    unk80 = &modeScreen->unk110;
    unk80->unk4 = sub_8007C10(gUnknown_080D8F70[lang + 2].unk0);
    unk80->unkA = gUnknown_080D8F70[lang + 2].unk4;
    unk80->unk20 = gUnknown_080D8F70[lang + 2].unk6;
    unk80->unk21 = 0xFF;

    unk80->unk16 = 8;
    unk80->unk18 = 0x67;
    unk80->unk1A = 0x100;
    unk80->unk8 = 0;
    unk80->unk14 = 0;
    unk80->unk1C = 0;
    unk80->unk22 = 0x10;
    unk80->unk25 = 0;
    unk80->unk28 = -1;
    unk80->unk10 = 0;

    unk0 = &modeScreen->unk0;
    unk0->unk4 = BG_SCREEN_ADDR(0);
    unk0->unkA = 0;
    unk0->unkC = BG_SCREEN_ADDR(20);
    unk0->unk18 = 0;
    unk0->unk18 = 0;
    unk0->unk18 = 0;
    unk0->unk1A = 0;
    unk0->unk1C = 0x6E;
    unk0->unk1E = 0;
    unk0->unk20 = 0;
    unk0->unk22 = 0;
    unk0->unk24 = 0;
    unk0->unk26 = 0x20;
    unk0->unk28 = 0x20;
    unk0->unk2A = 0;
    unk0->unk2E = 0;
    sub_8002A3C(unk0);

    unk0 = &modeScreen->unk40;
    unk0->unk4 = BG_SCREEN_ADDR(24);
    unk0->unkA = 0;
    unk0->unkC = BG_SCREEN_ADDR(22);
    unk0->unk18 = 0;
    unk0->unk18 = 0;
    unk0->unk18 = 0;
    unk0->unk1A = 0;
    unk0->unk1C = 0x6F;
    unk0->unk1E = 0;
    unk0->unk20 = 0;
    unk0->unk22 = 0;
    unk0->unk24 = 0;
    unk0->unk26 = 0x20;
    unk0->unk28 = 0x20;
    unk0->unk2A = 0;
    unk0->unk2E = 1;
    sub_8002A3C(unk0);
    m4aSongNumStart(MUS_VS_SELECT_PAK_MODE);
}
