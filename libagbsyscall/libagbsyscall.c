#include <assert.h>
#include <math.h> // sqrt
#include <string.h> // memset
#if CPU_ARCH_X86
#include <immintrin.h>
#endif
#include "global.h"
#include "gba/syscall.h"

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
void CpuFastSet(const void *inSrc, void *inDest, u32 control)
{
    const u32 *src = inSrc;
    const u32 *dest = inDest;
    assert(((uintptr_t)src & 0x3) == 0); // should be aligned by 4
    u32 word_count = control & 0x1FFFFF;

    // Align by 8
    word_count = ((word_count + 7) & ~0x7);

    u32 *target = &dest[word_count];

#if CPU_ARCH_X86
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
#error "Arch not implemented"
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
        memset(REG_SIOCNT, 0, ((REG_SIOMULTI3 + 1) - REG_SIOCNT));
    }

    if (flags & RESET_SOUND_REGS) {
        memset(REG_SOUND1CNT_L, 0, ((REG_FIFO_B + 1) - REG_SOUND1CNT_L));
    }

    if (flags & RESET_REGS)
        ;
}
#endif

#if L_Div
s32 Div(s32 num, s32 denom)
{
    if (denom != 0) {
        return num / denom;
    } else {
        return 0;
    }
}
#endif

#if L_DivArm
// Div but with flipped params
s32 DivArm(s32 denom, s32 num)
{
    if (denom != 0) {
        return num / denom;
    } else {
        return 0;
    }
}
#endif

#if L_Mod
// NOTE: With -fno-leading-underscores set in GCC, calling a function Mod, leads to this
// error, but we don't do that anymore:
//       >> Error: invalid use of operator "Mod"
s32 Mod(s32 num, s32 denom)
{
    if (denom != 0) {
        return num % denom;
    } else {
        return 0;
    }
}
#endif

#if L_ModArm
// Mod but with flipped params
s32 ModArm(s32 denom, s32 num)
{
    if (denom != 0) {
        return num % denom;
    } else {
        return 0;
    }
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

#if L_ArcTan
u16 ArcTan(s16 x) { return (u16)atanf((float)x); }
#endif

#if L_ArcTan2
u16 ArcTan2(s16 x, s16 y) { return (u16)atan2f((float)x, (float)y); }
#endif

#if L_HuffUnComp
void HuffUnComp(void) { }
#endif

#if L_LZ77UnCompWram
#include "platform/platform.h"

void LZ77UnCompWram(const void *src, void *dest) { Platform_LZDecompressUnsafe(src, dest); }
#endif

#if L_LZ77UnCompVram
#include "platform/platform.h"

void LZ77UnCompVram(const void *src, void *dest) { Platform_LZDecompressUnsafe(src, dest); }
#endif

#if L_RLUnCompWram
#include "platform/platform.h"

void RLUnCompWram(const void *src, void *dest) { Platform_RLDecompressUnsafe(src, dest); }
#endif

#if L_RLUnCompVram
#include "platform/platform.h"

void RLUnCompVram(const void *src, void *dest) { Platform_RLDecompressUnsafe(src, dest); }
#endif

#if L_BgAffineSet
void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count) {
}
#endif

#if L_ObjAffineSet
void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset) { }
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
