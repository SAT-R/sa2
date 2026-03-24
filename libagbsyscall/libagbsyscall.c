#include <assert.h>
#include <math.h> // sqrt
#include <string.h> // memset
#if CPU_ARCH_X86
#include <immintrin.h>
#endif
#include "gba/gba.h"

#if (!(defined PLATFORM_GBA) || (PLATFORM_GBA == 0))

// Reimplementation of libagbsyscall for non-GBA platforms
// Documentation source used: https://problemkaputt.de/gbatek.htm

#if L_CpuSet
void CpuSet(const void *inSrc, void *inDest, u32 control)
{
    u32 word_count = control & 0x1FFFFF;

    if (control & CPU_SET_32BIT) {
        u32 *src = (u32 *)inSrc;
        u32 *dest = (u32 *)inDest;

        u32 *target = &dest[word_count];

        if (control & CPU_SET_SRC_FIXED) {
            while (dest < target) {
                *dest++ = *src;
            }
        } else {
            while (dest < target) {
                *dest++ = *src++;
            }
        }
    } else {
        u16 *src = (u16 *)inSrc;
        u16 *dest = (u16 *)inDest;

        u16 *target = &dest[word_count];

        if (control & CPU_SET_SRC_FIXED) {
            while (dest < target) {
                *dest++ = *src;
            }
        } else {
            while (dest < target) {
                *dest++ = *src++;
            }
        }
    }
}
#endif

#if L_CpuFastSet
static uint32_t CPUReadMemory(const void *src)
{
    uint32_t val;
    memcpy(&val, src, sizeof(val));
    return val;
}

static void CPUWriteMemory(void *dest, uint32_t val) { memcpy(dest, &val, sizeof(val)); }

void CpuFastSet(const void *inSrc, void *inDest, u32 control)
{
#if CPU_ARCH_X86
    const u32 *src = inSrc;
    const u32 *dest = inDest;
    assert(((uintptr_t)src & 0x3) == 0); // should be aligned by 4
    u32 word_count = control & 0x1FFFFF;

    // Align by 8
    word_count = ((word_count + 7) & ~0x7);

    const u32 *target = &dest[word_count];
    if (control & CPU_FAST_SET_SRC_FIXED) {
        __m128i v = _mm_set_epi32(*src, *src, *src, *src);

        // Store 4-byte source value, 32 bytes at a time.
        while (dest < target) {
            _mm_store_si128((__m128i *)dest, v);
            dest += 4;
            _mm_store_si128((__m128i *)dest, v);
            dest += 4;
        }
    } else
        while (dest < target) {
            // Copy source to dest, 32bytes at a time.
            _mm_store_si128((__m128i *)dest, _mm_load_si128((__m128i *)src));
            dest += 4;
            src += 4;
            _mm_store_si128((__m128i *)dest, _mm_load_si128((__m128i *)src));
            dest += 4;
            src += 4;
        }
#else
    int count = control & 0x1FFFFF;

    const u8 *source = inSrc;
    u8 *dest = inDest;

    // source = (u8 *)((uint32_t )source & ~3);
    // dest = (u8 *)((uint32_t )dest & ~3);

    // fill?
    if ((control >> 24) & 1) {
        uint32_t value = CPUReadMemory(source);
        while (count > 0) {
            // BIOS always transfers 32 bytes at a time
            for (int i = 0; i < 8; i++) {
                CPUWriteMemory(dest, value);
                dest += 4;
            }
            count -= 8;
        }
    } else {
        // copy
        while (count > 0) {
            // BIOS always transfers 32 bytes at a time
            for (int i = 0; i < 8; i++) {
                uint32_t value = CPUReadMemory(source);
                CPUWriteMemory(dest, value);
                source += 4;
                dest += 4;
            }
            count -= 8;
        }
    }
#endif
}
#endif

#if L_IntrWait
void IntrWait(bool32 discard, u16 flags, u32 dsiFlags)
{
    REG_IME = 0;

    if (discard) {
        REG_IE &= ~flags;
    }

    REG_IME = 1;

    // TODO: Actually go into low-power state.
    //       Is it possible to pause a thread until an interrupt is triggered (REG_IE is
    //       written)? Maybe this shouldn't be implemented here, but in each platform
    //       layer? As-is this implementation doesn't work in a single-threaded
    //       environment.
#if 0
    while (!(REG_IE & flags)) {
        ;
    }
#endif
}
#endif

#if L_VBlankIntrWait
extern void IntrWait(bool32 discard, u16 flags, u32 dsiFlags);

void VBlankIntrWait(void) { IntrWait(TRUE, INTR_FLAG_VBLANK, 0); }
#endif

#ifdef L_RegisterRamReset
void RegisterRamReset(u32 flags)
{
    REG_DISPCNT = DISPCNT_FORCED_BLANK;

    if (flags & RESET_EWRAM) {
        memset(EWRAM_START, 0, EWRAM_SIZE);
    }

    if (flags & RESET_IWRAM) {
        // NOTE: IWRAM_SIZE = 0x7E00!
        memset(IWRAM_START, 0, IWRAM_SIZE);
    }

    if (flags & RESET_PALETTE) {
        memset(PLTT, 0, PLTT_SIZE);
    }

    if (flags & RESET_VRAM) {
        memset(VRAM, 0, VRAM_SIZE);
    }

    if (flags & RESET_OAM) {
        memset(OAM, 0, OAM_SIZE);
    }

    if (flags & RESET_SIO_REGS) {
        memset((void *)REG_SIOCNT, 0, (int)((REG_SIOMULTI3 + 1) - REG_SIOCNT));
    }

    if (flags & RESET_SOUND_REGS) {
        memset((void *)REG_SOUND1CNT_L, 0, (int)((REG_FIFO_B + 1) - REG_SOUND1CNT_L));
    }

    if (flags & RESET_REGS)
        ;
}
#endif

#if L_SoftReset
extern void AgbMain(void);

void SoftReset(u32 resetFlags)
{
    REG_IME = 0;

    // <Stack_Ptr> = Initial address (0x03007F00)

    RegisterRamReset(resetFlags);

    // TODO: Better reset the entire thread to initial state if that is possible
    AgbMain();
}
#endif

#if L_SoftResetRom
extern void AgbMain(void);

void SoftResetRom(u32 resetFlags)
{
    REG_IME = 0;
    // SOFT_RESET_DIRECT_BUF(0x03007FFA) = 0
    // <Stack_Ptr> = Initial address (0x03007F00)

    RegisterRamReset(resetFlags);

    // TODO: Better reset the entire thread to initial state if that is possible
    AgbMain();
}
#endif

#if L_SoftResetExram
void SoftResetExram(u32 resetFlags)
{
    RegisterRamReset(resetFlags);

    // TODO: Just to the code at 0x02000000
}
#endif

#if L_Sqrt
u16 Sqrt(u32 num) { return (u16)sqrt((double)num); }
#endif

#if L_ArcTan || L_ArcTan2
// Source modified from mGBA
// https://github.com/mgba-emu/mgba/blob/93fed7144836d20c9087ae88bc67dfdde834db9d/src/gba/bios.c#L291
u16 ArcTan(s16 i)
{
    s32 a = -((i * i) >> 14);
    s32 b = ((0xA9 * a) >> 14) + 0x390;
    b = ((b * a) >> 14) + 0x91C;
    b = ((b * a) >> 14) + 0xFB6;
    b = ((b * a) >> 14) + 0x16AA;
    b = ((b * a) >> 14) + 0x2081;
    b = ((b * a) >> 14) + 0x3651;
    b = ((b * a) >> 14) + 0xA2F9;

    return (i * b) >> 16;
}
#endif

#if L_ArcTan2
// Source modified from mGBA
// https://github.com/mgba-emu/mgba/blob/93fed7144836d20c9087ae88bc67dfdde834db9d/src/gba/bios.c#L319
u16 ArcTan2(s16 x, s16 y)
{
    if (!y) {
        if (x >= 0)
            return 0;
        return 0x8000;
    }
    if (!x) {
        if (y >= 0)
            return 0x4000;
        return 0xC000;
    }
    if (y >= 0) {
        if (x >= 0) {
            if (x >= y)
                return ArcTan((y << 14) / x);
        } else if (-x >= y)
            return ArcTan((y << 14) / x) + 0x8000;
        return 0x4000 - ArcTan((x << 14) / y);
    } else {
        if (x <= 0) {
            if (-x > -y)
                return ArcTan((y << 14) / x) + 0x8000;
        } else if (x >= -y)
            return ArcTan((y << 14) / x) + 0x10000;
        return 0xC000 - ArcTan((x << 14) / y);
    }
}
#endif

#if L_HuffUnComp
void HuffUnComp(void) { }
#endif

#if L_LZ77UnCompWram
#include "ext/gbagfx/lz.c"

void LZ77UnCompWram(const void *src, void *dest)
{
    int size = 0;
    LZDecompressUnsafe(src, dest, &size);
}
#endif

#if L_LZ77UnCompVram
#include "ext/gbagfx/lz.c"

void LZ77UnCompVram(const void *src, void *dest)
{
    int size = 0;
    LZDecompressUnsafe(src, dest, &size);
}
#endif

#if L_RLUnCompWram
#include "ext/gbagfx/rl.c"

void RLUnCompWram(const void *src, void *dest)
{
    int size = 0;
    RLDecompressUnsafe(src, dest, &size);
}
#endif

#if L_RLUnCompVram
#include "ext/gbagfx/rl.c"

void RLUnCompVram(const void *src, void *dest)
{
    int size = 0;
    RLDecompressUnsafe(src, dest, &size);
}
#endif

#if L_ObjAffineSet || L_BgAffineSet
const s16 sineTable[256]
    = { (s16)0x0000, (s16)0x0192, (s16)0x0323, (s16)0x04B5, (s16)0x0645, (s16)0x07D5, (s16)0x0964, (s16)0x0AF1, (s16)0x0C7C, (s16)0x0E05,
        (s16)0x0F8C, (s16)0x1111, (s16)0x1294, (s16)0x1413, (s16)0x158F, (s16)0x1708, (s16)0x187D, (s16)0x19EF, (s16)0x1B5D, (s16)0x1CC6,
        (s16)0x1E2B, (s16)0x1F8B, (s16)0x20E7, (s16)0x223D, (s16)0x238E, (s16)0x24DA, (s16)0x261F, (s16)0x275F, (s16)0x2899, (s16)0x29CD,
        (s16)0x2AFA, (s16)0x2C21, (s16)0x2D41, (s16)0x2E5A, (s16)0x2F6B, (s16)0x3076, (s16)0x3179, (s16)0x3274, (s16)0x3367, (s16)0x3453,
        (s16)0x3536, (s16)0x3612, (s16)0x36E5, (s16)0x37AF, (s16)0x3871, (s16)0x392A, (s16)0x39DA, (s16)0x3A82, (s16)0x3B20, (s16)0x3BB6,
        (s16)0x3C42, (s16)0x3CC5, (s16)0x3D3E, (s16)0x3DAE, (s16)0x3E14, (s16)0x3E71, (s16)0x3EC5, (s16)0x3F0E, (s16)0x3F4E, (s16)0x3F84,
        (s16)0x3FB1, (s16)0x3FD3, (s16)0x3FEC, (s16)0x3FFB, (s16)0x4000, (s16)0x3FFB, (s16)0x3FEC, (s16)0x3FD3, (s16)0x3FB1, (s16)0x3F84,
        (s16)0x3F4E, (s16)0x3F0E, (s16)0x3EC5, (s16)0x3E71, (s16)0x3E14, (s16)0x3DAE, (s16)0x3D3E, (s16)0x3CC5, (s16)0x3C42, (s16)0x3BB6,
        (s16)0x3B20, (s16)0x3A82, (s16)0x39DA, (s16)0x392A, (s16)0x3871, (s16)0x37AF, (s16)0x36E5, (s16)0x3612, (s16)0x3536, (s16)0x3453,
        (s16)0x3367, (s16)0x3274, (s16)0x3179, (s16)0x3076, (s16)0x2F6B, (s16)0x2E5A, (s16)0x2D41, (s16)0x2C21, (s16)0x2AFA, (s16)0x29CD,
        (s16)0x2899, (s16)0x275F, (s16)0x261F, (s16)0x24DA, (s16)0x238E, (s16)0x223D, (s16)0x20E7, (s16)0x1F8B, (s16)0x1E2B, (s16)0x1CC6,
        (s16)0x1B5D, (s16)0x19EF, (s16)0x187D, (s16)0x1708, (s16)0x158F, (s16)0x1413, (s16)0x1294, (s16)0x1111, (s16)0x0F8C, (s16)0x0E05,
        (s16)0x0C7C, (s16)0x0AF1, (s16)0x0964, (s16)0x07D5, (s16)0x0645, (s16)0x04B5, (s16)0x0323, (s16)0x0192, (s16)0x0000, (s16)0xFE6E,
        (s16)0xFCDD, (s16)0xFB4B, (s16)0xF9BB, (s16)0xF82B, (s16)0xF69C, (s16)0xF50F, (s16)0xF384, (s16)0xF1FB, (s16)0xF074, (s16)0xEEEF,
        (s16)0xED6C, (s16)0xEBED, (s16)0xEA71, (s16)0xE8F8, (s16)0xE783, (s16)0xE611, (s16)0xE4A3, (s16)0xE33A, (s16)0xE1D5, (s16)0xE075,
        (s16)0xDF19, (s16)0xDDC3, (s16)0xDC72, (s16)0xDB26, (s16)0xD9E1, (s16)0xD8A1, (s16)0xD767, (s16)0xD633, (s16)0xD506, (s16)0xD3DF,
        (s16)0xD2BF, (s16)0xD1A6, (s16)0xD095, (s16)0xCF8A, (s16)0xCE87, (s16)0xCD8C, (s16)0xCC99, (s16)0xCBAD, (s16)0xCACA, (s16)0xC9EE,
        (s16)0xC91B, (s16)0xC851, (s16)0xC78F, (s16)0xC6D6, (s16)0xC626, (s16)0xC57E, (s16)0xC4E0, (s16)0xC44A, (s16)0xC3BE, (s16)0xC33B,
        (s16)0xC2C2, (s16)0xC252, (s16)0xC1EC, (s16)0xC18F, (s16)0xC13B, (s16)0xC0F2, (s16)0xC0B2, (s16)0xC07C, (s16)0xC04F, (s16)0xC02D,
        (s16)0xC014, (s16)0xC005, (s16)0xC000, (s16)0xC005, (s16)0xC014, (s16)0xC02D, (s16)0xC04F, (s16)0xC07C, (s16)0xC0B2, (s16)0xC0F2,
        (s16)0xC13B, (s16)0xC18F, (s16)0xC1EC, (s16)0xC252, (s16)0xC2C2, (s16)0xC33B, (s16)0xC3BE, (s16)0xC44A, (s16)0xC4E0, (s16)0xC57E,
        (s16)0xC626, (s16)0xC6D6, (s16)0xC78F, (s16)0xC851, (s16)0xC91B, (s16)0xC9EE, (s16)0xCACA, (s16)0xCBAD, (s16)0xCC99, (s16)0xCD8C,
        (s16)0xCE87, (s16)0xCF8A, (s16)0xD095, (s16)0xD1A6, (s16)0xD2BF, (s16)0xD3DF, (s16)0xD506, (s16)0xD633, (s16)0xD767, (s16)0xD8A1,
        (s16)0xD9E1, (s16)0xDB26, (s16)0xDC72, (s16)0xDDC3, (s16)0xDF19, (s16)0xE075, (s16)0xE1D5, (s16)0xE33A, (s16)0xE4A3, (s16)0xE611,
        (s16)0xE783, (s16)0xE8F8, (s16)0xEA71, (s16)0xEBED, (s16)0xED6C, (s16)0xEEEF, (s16)0xF074, (s16)0xF1FB, (s16)0xF384, (s16)0xF50F,
        (s16)0xF69C, (s16)0xF82B, (s16)0xF9BB, (s16)0xFB4B, (s16)0xFCDD, (s16)0xFE6E };
#endif

#if L_BgAffineSet
// Source modified from vba
// https://github.com/visualboyadvance-m/visualboyadvance-m/blob/0ceab88df51ca8b0ceb3bd30d9c296553cfa583e/src/core/gba/internal/gbaBios.cpp#L196
void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count)
{
    for (s32 i = 0; i < count; i++) {
        s32 cx = src[i].texX;
        s32 cy = src[i].texY;
        s16 dispx = src[i].scrX;
        s16 dispy = src[i].scrY;
        s16 rx = src[i].sx;
        s16 ry = src[i].sy;
        u16 theta = src[i].alpha >> 8;
        s32 a = sineTable[(theta + 0x40) & 255];
        s32 b = sineTable[theta];

        s16 dx = (rx * a) >> 14;
        s16 dmx = (rx * b) >> 14;
        s16 dy = (ry * b) >> 14;
        s16 dmy = (ry * a) >> 14;

        dest[i].pa = dx;
        dest[i].pb = -dmx;
        dest[i].pc = dy;
        dest[i].pd = dmy;

        s32 startx = cx - dx * dispx + dmx * dispy;
        s32 starty = cy - dy * dispx - dmy * dispy;

        dest[i].dx = startx;
        dest[i].dy = starty;
    }
}
#endif

#if L_ObjAffineSet
// Source modified from vba
// https://github.com/visualboyadvance-m/visualboyadvance-m/blob/0ceab88df51ca8b0ceb3bd30d9c296553cfa583e/src/core/gba/internal/gbaBios.cpp#L796
static void CPUWriteHalfWord(void *dest, uint16_t val) { memcpy(dest, &val, sizeof(val)); }

void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset)
{
    for (s32 i = 0; i < count; i++) {
        s16 rx = src[i].xScale;
        s16 ry = src[i].yScale;
        u16 theta = src[i].rotation >> 8;

        s32 a = (s32)sineTable[(theta + 64) & 255];
        s32 b = (s32)sineTable[theta];

        s16 dx = ((s32)rx * a) >> 14;
        s16 dmx = ((s32)rx * b) >> 14;
        s16 dy = ((s32)ry * b) >> 14;
        s16 dmy = ((s32)ry * a) >> 14;

        CPUWriteHalfWord(dest, dx);
        dest += offset;
        CPUWriteHalfWord(dest, -dmx);
        dest += offset;
        CPUWriteHalfWord(dest, dy);
        dest += offset;
        CPUWriteHalfWord(dest, dmy);
        dest += offset;
    }
}
#endif

/* Stubs */

#if L_Diff8bitUnFilterWram
void Diff8bitUnFilterWram(void *src, void *dest) { }
#endif

#if L_Diff8bitUnFilterVram
void Diff8bitUnFilterVram(void *src, void *dest) { }
#endif

#if L_Diff16bitUnFilter
void Diff16bitUnFilter(void *src, void *dest) { }
#endif

#if L_MusicPlayerOpen
void MusicPlayerOpen(void) { }
#endif

#if L_MusicPlayerStart
void MusicPlayerStart(void) { }
#endif

#if L_SoundBiasReset
void SoundBiasReset(void) { }
#endif

#if L_SoundBiasChange
void SoundBiasChange(void) { }
#endif

#if L_SoundDriverInit
void SoundDriverInit(void) { }
#endif

#if L_SoundDriverVSync
void SoundDriverVSync(void) { }
#endif

#if L_SoundDriverVSyncOn
void SoundDriverVSyncOn(void) { }
#endif

#if L_SoundDriverVSyncOff
void SoundDriverVSyncOff(void) { }
#endif

#if L_MusicPlayerFadeOut
void MusicPlayerFadeOut(void) { }
#endif

#if L_MusicPlayerContinue
void MusicPlayerContinue(void) { }
#endif

#if L_MusicPlayerStop
void MusicPlayerStop(void) { }
#endif

#if L_SoundDriverMain
void SoundDriverMain(void) { }
#endif

#if L_SoundDriverMode
void SoundDriverMode(void) { }
#endif

#if L_SoundChannelClear
void SoundChannelClear(void) { }
#endif

#if L_SoundBiasSet
void SoundBiasSet(void) { }
#endif

#if L_BitUnPack
void BitUnPack(void *src, void *dest, BitUnPackData *settings) { }
#endif

#if L_MidiKey2Freq
void MidiKey2Freq(void *wa, u8 mk, u8 fp) { }
#endif

#if L_MultiBoot
int MultiBoot(struct MultiBootParam *mp) { }
#endif

#endif // (!(defined PLATFORM_GBA) || (PLATFORM_GBA == 0))
