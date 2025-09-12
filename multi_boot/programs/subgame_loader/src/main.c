#include "global.h"
#include "multi_sio.h"
#include "sio32_multi_load.h"
#include "loader_tables.h"

typedef struct {
    u32 unk0;
    u32 unk4;
    u16 unk8;
    u16 state;
    u8 *resp;
    u16 segment;
    u8 unk12;
    u8 unk13;
    u8 sioId;
    u8 loadRequest;
    u8 unk16;
} Loader; /* size 0x18 */

struct MultiSioData_0_0 {
    // id
    u16 unk0;
    // value
    u8 unk2;
    u8 filler[17];
};

union MultiSioData {
    struct MultiSioData_0_0 pat0;
}; /* size = MULTI_SIO_BLOCK_SIZE */

// .data
IntrFunc gIntrTable[16] = {};
union MultiSioData gMultiSioRecv[4] = {};
u32 gMultiSioStatusFlags = 0;
u8 gIntrMainBuf[0x400] ALIGNED(16) = {};
union MultiSioData gMultiSioSend = {};

void LoaderInit(Loader *);
static u16 sub_0203b2f0(u16, Loader *);
static u16 sub_0203b79c(u16, Loader *);
static u16 sub_0203b7d0(u16, Loader *);
static u16 sub_0203b3d8(u16, Loader *);
static u16 sub_0203b818(u16, Loader *);
static void sub_0203b898(Loader *);
static void sub_0203b610(Loader *);
static void sub_0203b86c(Loader *loader);

static void sub_0203b788(void);
static void sub_0203b798(void);

#define ROM_MAKER_CODE_ADDR ((vu8 *)(ROM_BASE + 0xB2))
#define ROM_GAME_CODE_ADDR  ((vu32 *)(ROM_BASE + 0xAC))
#define ROM_TITLE_ADDR      ((u8 *)(ROM_BASE + 0xA0))

// 8P
#define DIMPS_MAKER_CODE 0x96

#ifdef USA
// "A2NE"
#define EXPECTED_GAME_CODE 0x454e3241
#elif EUROPE
// "A2NP"
#define EXPECTED_GAME_CODE 0x504e3241
#else
// "A2NJ"
#define EXPECTED_GAME_CODE 0x4a4e3241
#endif

// .rodata
IntrFunc const gIntrTableTemplate[13] = {
    (void *)gMultiSioIntrFuncBuf,
    sub_0203b788,
    sub_0203b798,
    sub_0203b798,
    sub_0203b798,
    sub_0203b798,
    sub_0203b798,
    sub_0203b798,
    sub_0203b798,
    NULL,
    NULL,
    NULL,
    NULL,
};

void AgbMain()
{
    Loader loader;
    LoaderInit(&loader);

    while (TRUE) {
        VBlankIntrWait();
        switch (loader.state) {
            case 0:
            case 1:
                loader.state = sub_0203b2f0(loader.state, &loader);
                break;
            case 2:
                loader.state = sub_0203b79c(loader.state, &loader);
            case 3:
                loader.state = sub_0203b7d0(loader.state, &loader);
                break;
            case 4:
                loader.state = sub_0203b3d8(loader.state, &loader);
                break;
            case 5:
                loader.state = sub_0203b818(loader.state, &loader);
        }

        sub_0203b898(&loader);
    }
}

#define SEGMENT_ROM_CODE_1 0
#define SEGMENT_ROM_CODE_2 1
#define SEGMENT_ROM_CODE_3 2

#define SEGMENT_TILEMAPS_3 3

#define SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_1 4
#define SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_2 5
#define SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_3 6
#define SEGMENT_TILEMAPS_2                    7
#define SEGMENT_TILEMAPS_1                    8

static u16 sub_0203b2f0(u16 state, Loader *loader)
{
    REG_IME = 0;
    REG_IE &= ~0xC0;
    REG_IME = 1;
    gIntrTable[0] = (void *)gMultiSioIntrFuncBuf;
    MultiSioInit((gMultiSioStatusFlags & MULTI_SIO_ALL_CONNECTED) >> 8);
    loader->loadRequest = 0;
    gMultiSioStatusFlags = 0;

    if (state == 0) {
        state = 3;
    } else {
        state = 2;
        switch (loader->segment) {
            case SEGMENT_ROM_CODE_3:
                // When ROM Code has been received, copy into EWRAM
                LZ77UnCompWram(PROGRAM_WORK_BUFFER, (void *)EWRAM_START);
                break;
            case SEGMENT_TILEMAPS_3:
                // When the BG tileset received, copy into BG VRAM
                CpuCopy16(PROGRAM_WORK_BUFFER, (void *)BG_VRAM, SIO32ML_BLOCK_SIZE);
                break;
            case SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_1:
            case SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_2:
            case SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_3:
                // Uncompress the sprite object tiles for our device, ignore the others
                if (loader->sioId == loader->segment - (SEGMENT_COMPRESSED_SPRITE_OBJ_TILES_1 - 1)) {
                    LZ77UnCompWram(RECV_BUFFER, PROGRAM_WORK_BUFFER);
                }
                break;
            case SEGMENT_TILEMAPS_2:

                // When the text obj tiles recieved, copy into obj vram
                CpuCopy16(RECV_BUFFER, (void *)OBJ_VRAM0, 0x5000);
                break;

#if 0 // The tilemaps are left in the RECV_BUFFER so the case is ignored
            case SEGMENT_TILEMAPS_1:
                break;
#endif
        }
    }

    return state;
}

static u16 sub_0203b3d8(u16 state, Loader *loader)
{
    u8 *actualTitle = ROM_TITLE_ADDR;
    u8 expectedTitle[] = "SONICADVANC2";

    loader->sioId = SIO_MULTI_CNT->id;
    loader->unk12 = 1;
    MultiSioStop();

    if (loader->segment == 9) {
        REG_DISPCNT = 0;

        if (*ROM_MAKER_CODE_ADDR == DIMPS_MAKER_CODE && *ROM_GAME_CODE_ADDR == EXPECTED_GAME_CODE) {
            u8 i;
            for (i = 0; i < ARRAY_COUNT(expectedTitle) - 1; i++) {
                if (actualTitle[i] != expectedTitle[i]) {
                    break;
                }
            }

            // matches
            if (i == ARRAY_COUNT(expectedTitle) - 1) {
                SoftResetRom(RESET_SOUND_REGS | RESET_REGS);
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
    Sio32MultiLoadInit(0, gSegmentLoadBuffers[loader->segment]);
    sub_0203b610(loader);
    return 5;
}

void LoaderInit(Loader *loader)
{
    loader->unk0 = 0;
    loader->unk4 = 0;
    loader->unk8 = 0;
    loader->state = 0;
    loader->resp = &gMultiSioSend.pat0.unk2;
    loader->segment = 0;
    loader->unk12 = 0;
    loader->unk13 = 0;
    loader->sioId = 0;
    loader->loadRequest = 0;
    loader->unk16 = 0;
    RegisterRamReset(2);

    DmaCopy32(3, gIntrTableTemplate, gIntrTable, sizeof(gIntrTableTemplate));
    DmaCopy32(3, IntrMain, gIntrMainBuf, sizeof(gIntrMainBuf));
    INTR_VECTOR = gIntrMainBuf;
    DmaFill32(3, 0xA0, OAM, OAM_SIZE);

    REG_IE = 1;
    if (*ROM_MAKER_CODE_ADDR == DIMPS_MAKER_CODE && *ROM_GAME_CODE_ADDR == EXPECTED_GAME_CODE) {
        REG_IE |= 0x2000;
    }

    REG_DISPSTAT = 8;
    REG_IME = 1;

    gMultiSioSend.pat0.unk0 = 0xF001;
}

static void sub_0203b610(Loader *loader)
{
    u16 i;
    if (loader->unk16 == 0) {
        REG_BG0CNT = 0x170B;
        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;

        CpuCopy16(gUnknown_0203EBC0, (void *)PLTT, 0x200);
        CpuCopy16(gUnknown_0203EDC0, (void *)VRAM + 0x8000, 0x4A0);

        for (i = 0; i < 0x14; i++) {
            CpuCopy16(&gUnknown_0203F260[i], (void *)VRAM + 0xB800 + (i * 0x40), 0x3C);
        }

        REG_BG1CNT = 0x1F0E;

        if (loader->unk13 != 0) {
            REG_BG1HOFS = 0xFFE8;
            REG_BG1VOFS = ((loader->unk13 - 1) * 0x18) - 0x30;
        } else {
            REG_BG1HOFS = 0xFFE8;
#ifdef JAPAN
            REG_BG1VOFS = 0xFFD0;
#else
            REG_BG1VOFS = 0xFFE8;
#endif
        }

        CpuCopy16(gUnknown_0203C4A4, (void *)VRAM + 0xC000, 0x23A0);

        for (i = 0; i < 0x12; i++) {
            CpuCopy16(&gUnknown_0203E844[i], (void *)VRAM + 0xF800 + (i * 0x40), 0x30);
        }

        REG_WIN0H = 0x18D8;
        REG_WIN0V = 0x3048;
        REG_WININ = 2;
        REG_WINOUT = 1;

        CpuFill16(0, (void *)PLTT + 0x22, 0x1E);

        REG_WIN1H = 0x2828;
        REG_WIN1V = 0x5058;
        loader->unk16 = 1;
    }
}

static void sub_0203b788(void) { INTR_CHECK |= 1; }

static void sub_0203b798(void) { }

static u16 sub_0203b79c(u16 state, Loader *loader)
{
    if (gMultiSioStatusFlags & MULTI_SIO_LD_ENABLE) {
        if (gMultiSioStatusFlags & MULTI_SIO_LD_SUCCESS) {
            (*loader->resp)++;
        }
        state = 3;
    }

    MultiSioStart();

    return state;
}

static u16 sub_0203b7d0(u16 state, Loader *loader)
{
    if (gMultiSioStatusFlags & MULTI_SIO_LD_REQUEST) {
        state = 4;
    }

    gMultiSioStatusFlags = MultiSioMain(&gMultiSioSend, gMultiSioRecv, loader->loadRequest);
    loader->unk13 = gMultiSioRecv[0].pat0.unk0;
    if (loader->segment != gMultiSioRecv[0].pat0.unk2) {
        loader->segment = gMultiSioRecv[0].pat0.unk2;
    }

    return state;
}

static u16 sub_0203b818(u16 state, Loader *loader)
{
    u32 progress = 0;

    if (Sio32MultiLoadMain(&progress) != 0) {
        state = 1;
    }

    if (progress > loader->unk4) {
        loader->unk0 += (progress - loader->unk4);
        loader->unk4 = progress;
    } else if (progress < loader->unk4) {
        u32 temp = loader->unk0 + 0x2000;
        loader->unk0 = (temp - loader->unk4) + progress;
        loader->unk4 = progress;
    }

    sub_0203b86c(loader);

    return state;
}

static void sub_0203b86c(Loader *loader)
{
    u8 val = (loader->unk0 * 0xA0) / 0x12000;
    REG_WIN1H = (val + 0x28) | 0x2800;
}

static void sub_0203b898(Loader *loader)
{
    if (loader->unk12 != 0) {
        REG_DISPCNT = 0x6300;
        REG_WININ = 2;
        REG_WINOUT = 1;
    } else {
        REG_DISPCNT = 0x80;
    }
}
