#include "global.h"
#include "data.h"
#include "multiplayer.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "multi_sio.h"

struct MultiplayerConnectScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_0808B3FC_UNK240 unk6C;
    struct Unk_03002400 unk9C;
    u8 fillerDC[15];
    u8 unkEB;
    u8 fillerEC[2];
    u8 unkEE[4];
    u8 unkF2[4];

    u8 unkF6;
    u8 fillerF7[3];
    u8 unkFA;
    u8 fillerFB;
    u8 unkFC;
    u8 unkFD;
    u8 fillerFE[2];
}; /** size 0x100 */

void sub_805ADAC(void);

extern const struct UNK_080E0D64 gUnknown_080D9050[7];
u8 gUnknown_03005594;
u8 gUnknown_030054D8;

void sub_805AAD8(void) {
    struct Task* t;
    struct MultiplayerConnectScreen* connectScreen;
    struct UNK_802D4CC_UNK270* unk0;
    struct UNK_0808B3FC_UNK240* unkC;
    struct Unk_03002400* unk9C;
    const struct UNK_080E0D64* unkD64;
    void* vramAddr = (void*)OBJ_VRAM0;
    u8 i;

    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1401;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_805ADAC, 0x100, 0x2000, 0, NULL);
    connectScreen = TaskGetStructPtr(t, connectScreen);
    connectScreen->unkEB = 0;
    connectScreen->unkFC = 1;
    connectScreen->unkFD = 0;

    for (i = 0; i < 4; i++) {
        connectScreen->unkEE[i] = 0;
        connectScreen->unkF2[i] = 0;
    }

    unk0 = &connectScreen->unk0;
    unk0->unk0 = 1;
    unk0->unk4 = 0;
    unk0->unk2 = 2;
    unk0->unk6 = 0x100;
    unk0->unk8 = 0x3FFF;
    unk0->unkA = 0;
    sub_802D4CC(unk0);
    
    unkC = &connectScreen->unkC;
    unkC->unk4 = vramAddr;
    vramAddr += gUnknown_080D9050[gLoadedSaveGame->unk6].unk0 * TILE_SIZE_4BPP;
    unkC->unkA = gUnknown_080D9050[gLoadedSaveGame->unk6].unk4;
    unkC->unk20 = gUnknown_080D9050[gLoadedSaveGame->unk6].unk6;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 8;
    unkC->unk18 = 0x18;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;
    sub_8004558(unkC);

    unkC = &connectScreen->unk3C;
    unkC->unk4 = vramAddr;
    vramAddr += gPressStartTiles[gLoadedSaveGame->unk6].unk0 * TILE_SIZE_4BPP;
    unkC->unkA = gPressStartTiles[gLoadedSaveGame->unk6].unk4;
    unkC->unk20 = gPressStartTiles[gLoadedSaveGame->unk6].unk6;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 0x78;
    unkC->unk18 = 0x7A;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;

    unkC = &connectScreen->unk6C;
    unkC->unk4 = vramAddr;
    unkC->unkA = 0x432;
    unkC->unk20 = 8;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 0x78;
    unkC->unk18 = 0x8C;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;

    // TODO: make macro
    unk9C = &connectScreen->unk9C;
    unk9C->unk4 = BG_SCREEN_ADDR(0);
    unk9C->unkA = 0;
    unk9C->unkC = BG_SCREEN_ADDR(20);
    unk9C->unk18 = 0;
    unk9C->unk1A = 0;
    unk9C->unk1C = 0x72;
    unk9C->unk1E = 0;
    unk9C->unk20 = 0;
    unk9C->unk22 = 0;
    unk9C->unk24 = 0;
    unk9C->unk26 = 0x1E;
    unk9C->unk28 = 0x14;
    unk9C->unk2A = 0;
    unk9C->unk2E = 0;
    sub_8002A3C(unk9C);
    
    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        MultiSioStart();
    }

    gUnknown_03005594 = gLoadedSaveGame->unk13 | 0xF;
    gUnknown_030054D8 = 1;
    
    for (i = 0; i < 5; i++) {
        if (gUnknown_030054D8 < gLoadedSaveGame->unk7[i]) {
            gUnknown_030054D8 = gLoadedSaveGame->unk7[i];
        }
    }

    if (gUnknown_030054D8 > 0x1B) {
        gUnknown_030054D8 = 0x1B;
    }

    connectScreen->unkF6 = 0;
    connectScreen->unkFA = 0;
}
