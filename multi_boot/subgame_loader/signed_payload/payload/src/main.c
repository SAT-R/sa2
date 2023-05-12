#include "global.h"
#include "multi_sio.h"
#include "sio32_multi_load.h"

extern IntrFunc gIntrTable[];

extern u8 gUnknown_030004A2[];

struct UNK_0203C280 {
    void *unk0;
};

extern const struct UNK_0203C280 gUnknown_0203C280[];

#define PROGRAM_WORK_BUFFER ((void *)EWRAM_START + 0x20000)
#define RECV_BUFFER         ((void *)EWRAM_START + 0x33000)

#define ROM_MAKER_CODE_ADDR ((vu8 *)(ROM_BASE + 0xB2))

// 8P
#define DIMPS_MAKER_CODE 0x96

#define ROM_GAME_CODE_ADDR ((vu32 *)(ROM_BASE + 0xAC))

#define ROM_TITLE_ADDR ((u8 *)(ROM_BASE + 0xA0))

#ifndef EUROPE
// "A2NE"
#define EXPECTED_GAME_CODE 0x454e3241
#else
// "A2NP"
#define EXPECTED_GAME_CODE 0x504e3241
#endif

u32 gMultiSioStatusFlags;

typedef struct {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 unkA; // state
    void *unkC;
    u16 unk10;
    u8 unk12;
    u8 unk13;
    u8 unk14;
    u8 unk15;
    u8 unk16;
} Loader; /* size 0x18 */

void sub_0203b530(Loader *);
u16 sub_0203b2f0(u16, Loader *);
u16 sub_0203b79c(u16, Loader *);
u16 sub_0203b7d0(u16, Loader *);
u16 sub_0203b3d8(u16, Loader *);
u16 sub_0203b818(u16, Loader *);
void sub_0203b898(Loader *);
u16 sub_0203b610(Loader *);

void AgbMain()
{
    Loader loader;
    sub_0203b530(&loader);

    while (TRUE) {
        VBlankIntrWait();
        switch (loader.unkA) {
            case 0:
            case 1:
                loader.unkA = sub_0203b2f0(loader.unkA, &loader);
                break;
            case 2:
                loader.unkA = sub_0203b79c(loader.unkA, &loader);
            case 3:
                loader.unkA = sub_0203b7d0(loader.unkA, &loader);
                break;
            case 4:
                loader.unkA = sub_0203b3d8(loader.unkA, &loader);
                break;
            case 5:
                loader.unkA = sub_0203b818(loader.unkA, &loader);
        }

        sub_0203b898(&loader);
    }
}

u16 sub_0203b2f0(u16 state, Loader *loader)
{
    REG_IME = 0;
    REG_IE &= ~0xC0;
    REG_IME = 1;
    gIntrTable[0] = (void *)gMultiSioIntrFuncBuf;
    MultiSioInit((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    loader->unk15 = 0;
    gMultiSioStatusFlags = 0;

    if (state == 0) {
        state = 3;
    } else {
        state = 2;
        switch (loader->unk10) {
            case 2:
                // When rom has been received, copy into EWRAM
                LZ77UnCompWram(PROGRAM_WORK_BUFFER, (void *)EWRAM_START);
                break;
            case 3:
                // When VRAM data received, copy into vram
                CpuCopy16(PROGRAM_WORK_BUFFER, (void *)VRAM, 0x8000);
                break;
            case 4:
            case 5:
            case 6:
                // When this segment has been received, decompress into work buffer
                if (loader->unk14 == loader->unk10 - 3) {
                    LZ77UnCompWram(RECV_BUFFER, PROGRAM_WORK_BUFFER);
                }
                break;
            case 7:
                // When obj vram recieved, copy into obj vram
                CpuCopy16(RECV_BUFFER, (void *)OBJ_VRAM0, 0x5000);
                break;
        }
    }

    return state;
}

extern const u8 gUnknown_0203C23C[];

u16 sub_0203b3d8(u16 state, Loader *loader)
{
    u8 *actualTitle = ROM_TITLE_ADDR;
    // TODO: change to direct string (which moves it to rodata automatically)
    // "SONICADVANC2"
    u8 expectedTitle[13];
    memcpy(expectedTitle, gUnknown_0203C23C, 13);

    loader->unk14 = SIO_MULTI_CNT->id;
    loader->unk12 = 1;
    MultiSioStop();

    if (loader->unk10 == 9) {
        REG_DISPCNT = 0;

        if (*ROM_MAKER_CODE_ADDR == DIMPS_MAKER_CODE
            && *ROM_GAME_CODE_ADDR == EXPECTED_GAME_CODE) {
            u8 i;
            for (i = 0; i < 12; i++) {
                if (actualTitle[i] != expectedTitle[i]) {
                    break;
                }
            }
            // Shouldn't this be < 12
            if (i == 12) {
                SoftResetRom(0xC0);
            }
        }

        RegisterRamReset(0xF6);
        DmaStop(0);
        DmaStop(1);
        DmaStop(2);
        DmaStop(3);
        REG_IME = 0;
        REG_IE = 0;
        REG_DISPSTAT = 0;

        // Call the function at EWRAM_START
        ((void (*)(void))(EWRAM_START))();
    }

    REG_IME = 0;
    REG_IE &= ~0xC0;
    REG_IME = 1;
    gIntrTable[0] = Sio32MultiLoadIntr;
    Sio32MultiLoadInit(0, gUnknown_0203C280[loader->unk10].unk0);
    sub_0203b610(loader);
    return 5;
}

u16 gUnknown_030004A0;

extern const IntrFunc gIntrTableTemplate[13];

extern u8 gIntrMainBuf[0x400];

void sub_0203b530(Loader *loader)
{

    loader->unk0 = 0;
    loader->unk4 = 0;
    loader->unk8 = 0;
    loader->unkA = 0;
    loader->unkC = gUnknown_030004A2;
    loader->unk10 = 0;
    loader->unk12 = 0;
    loader->unk13 = 0;
    loader->unk14 = 0;
    loader->unk15 = 0;
    loader->unk16 = 0;
    RegisterRamReset(2);

    DmaCopy32(3, gIntrTableTemplate, gIntrTable, sizeof(gIntrTableTemplate));
    DmaCopy32(3, IntrMain, gIntrMainBuf, sizeof(gIntrMainBuf));
    INTR_VECTOR = gIntrMainBuf;
    DmaFill32(3, 0xA0, OAM, OAM_SIZE);

    REG_IE = 1;
    if (*ROM_MAKER_CODE_ADDR == DIMPS_MAKER_CODE
        && *ROM_GAME_CODE_ADDR == EXPECTED_GAME_CODE) {
        REG_IE |= 0x2000;
    }

    REG_DISPSTAT = 8;
    REG_IME = 1;

    {
        u16 r0, *r1;
        r1 = &gUnknown_030004A0;
        r0 = 0xF001;
        *r1 = r0;
    }
}
