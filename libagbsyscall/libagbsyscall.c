#include <math.h> // sqrt
#include <string.h> // memset
#include "global.h"
#include "gba/syscall.h"

#if (!(defined PLATFORM_GBA) || (PLATFORM_GBA == 0))

// Reimplementation of libagbsyscall for non-GBA platforms
// Documentation source used: https://problemkaputt.de/gbatek.htm

#if L_CpuSet
void CpuSet(const void *src, void *dest, u32 control) { }
#endif

#if L_CpuFastSet
void CpuFastSet(const void *src, void *dest, u32 control) { }
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
    while (!(REG_IE & flags)) {
        ;
    }
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
u16 ArcTan(s16 x) { return atanf((float)x); }
#endif

#if L_ArcTan2
u16 ArcTan2(s16 x, s16 y) { return atan2f((float)x, (float)y); }
#endif

#if L_HuffUnComp
void HuffUnComp(void) { }
#endif

#if L_LZ77UnCompWram
void LZ77UnCompWram(const void *src, void *dest) { }
#endif

#if L_LZ77UnCompVram
void LZ77UnCompVram(const void *src, void *dest) { }
#endif

#if L_RLUnCompWram
void RLUnCompWram(const void *src, void *dest) { }
#endif

#if L_RLUnCompVram
void RLUnCompVram(const void *src, void *dest) { }
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
