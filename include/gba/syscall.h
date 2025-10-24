#ifndef GUARD_GBA_SYSCALL_H
#define GUARD_GBA_SYSCALL_H

#define RESET_EWRAM      0x01
#define RESET_IWRAM      0x02
#define RESET_PALETTE    0x04
#define RESET_VRAM       0x08
#define RESET_OAM        0x10
#define RESET_SIO_REGS   0x20
#define RESET_SOUND_REGS 0x40
#define RESET_REGS       0x80
#define RESET_ALL        0xFF

typedef struct {
    u32 srcLength : 16; // in bytes
    u32 srcWidth : 8; // in bits
    u32 dstWidth : 8; // in bits
} BitUnPackData;

void SoftReset(u32 resetFlags);
void SoftResetExram(u32 resetFlags);

void RegisterRamReset(u32 resetFlags);

void VBlankIntrWait(void);

u16 Sqrt(u32 num);

u16 ArcTan2(s16 x, s16 y);

#define CPU_SET_SRC_FIXED 0x01000000
#define CPU_SET_16BIT     0x00000000
#define CPU_SET_32BIT     0x04000000

void CpuSet(const void *src, void *dest, u32 control);

#define CPU_FAST_SET_SRC_FIXED 0x01000000

void CpuFastSet(const void *src, void *dest, u32 control);

void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count);

void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset);

void LZ77UnCompWram(const void *src, void *dest);

void LZ77UnCompVram(const void *src, void *dest);

void RLUnCompWram(const void *src, void *dest);

void RLUnCompVram(const void *src, void *dest);

int MultiBoot(struct MultiBootParam *mp);


#if PLATFORM_GBA
s32 Div(s32 num, s32 denom);
s32 DivArm(s32 denom, s32 num);
s32 Mod(s32 num, s32 denom);
s32 ModArm(s32 denom, s32 num);
#else
// New GCC doesn't like us calling a function 'Mod', so we'll just inline them all.
// Also it is VERY important to also cast 'denom' to s32 on 64bit architectures,
// otherwise 'num' might be interpreted as a s64, without being properly cast as one,
// leading to a signed s32 value getting divided like an unsigned one.
#define Div(num, denom)    ({((denom) != 0) ? ((s32)(num) / (s32)(denom)) : 0;})
#define Mod(num, denom)    ({((denom) != 0) ? ((s32)(num) % (s32)(denom)) : 0;})
#define DivArm(denom, num) ({((denom) != 0) ? ((s32)(num) / (s32)(denom)) : 0;})
#define ModArm(denom, num) ({((denom) != 0) ? ((s32)(num) % (s32)(denom)) : 0;})
#endif

void SoundBiasReset(void);

void SoundBiasSet(void);

#endif // GUARD_GBA_SYSCALL_H
