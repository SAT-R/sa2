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

extern void SoftReset(u32 resetFlags);
extern void SoftResetExram(u32 resetFlags);

extern void RegisterRamReset(u32 resetFlags);

extern void VBlankIntrWait(void);

extern u16 Sqrt(u32 num);

extern u16 ArcTan2(s16 x, s16 y);

#define CPU_SET_SRC_FIXED 0x01000000
#define CPU_SET_16BIT     0x00000000
#define CPU_SET_32BIT     0x04000000

extern void CpuSet(const void *src, void *dest, u32 control);

#define CPU_FAST_SET_SRC_FIXED 0x01000000

extern void CpuFastSet(const void *src, void *dest, u32 control);

extern void BgAffineSet(struct BgAffineSrcData *src, struct BgAffineDstData *dest, s32 count);

extern void ObjAffineSet(struct ObjAffineSrcData *src, void *dest, s32 count, s32 offset);

extern void LZ77UnCompWram(const void *src, void *dest);

extern void LZ77UnCompVram(const void *src, void *dest);

extern void RLUnCompWram(const void *src, void *dest);

extern void RLUnCompVram(const void *src, void *dest);

extern int MultiBoot(struct MultiBootParam *mp);

extern s32 Div(s32 num, s32 denom);
extern s32 DivArm(s32 denom, s32 num);

extern s32 Mod(s32 num, s32 denom);
extern s32 ModArm(s32 denom, s32 num);

extern void SoundBiasReset(void);

extern void SoundBiasSet(void);

#endif // GUARD_GBA_SYSCALL_H
