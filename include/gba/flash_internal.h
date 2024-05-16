#ifndef GUARD_GBA_FLASH_INTERNAL_H
#define GUARD_GBA_FLASH_INTERNAL_H

#define FLASH_ROM_SIZE_1M 131072 // 1 megabit ROM
#define SECTORS_PER_BANK 16

#if !PORTABLE
#define FLASH_BASE ((u8 *)0xE000000)
#else
extern u8 FLASH_BASE[FLASH_ROM_SIZE_1M * SECTORS_PER_BANK];
#endif

#define FLASH_WRITE(addr, data) ((*(vu8 *)(FLASH_BASE + (addr))) = (data))


struct FlashSector
{
    u32 size;
    u8 shift;
    u16 count;
    u16 top;
};

struct FlashType {
    u32 romSize;
    struct FlashSector sector;
    u16 wait[2]; // game pak bus read/write wait

    // TODO: add support for anonymous unions/structs if possible
    union {
        struct {
        u8 makerId;
        u8 deviceId;
        } separate;
        u16 joined;
    } ids;
};

struct FlashSetupInfo
{
    u16 (*programFlashSector)(u16, void *);
    u16 (*eraseFlashChip)(void);
    u16 (*eraseFlashSector)(u16);
    u16 (*WaitForFlashWrite)(u8, u8 *, u8);
    const u16 *maxTime;
    struct FlashType type;
};

extern u16 gFlashNumRemainingBytes;

extern u16 (*ProgramFlashSector)(u16, void *);
extern u16 (*EraseFlashChip)(void);
extern u16 (*EraseFlashSector)(u16);
extern const u16 *gFlashMaxTime;
extern const struct FlashType *gFlash;


extern u8 gFlashTimeoutFlag;
extern u8 (*PollFlashStatus)(u8 *);

extern u16 (*WaitForFlashWrite)(u8, u8 *, u8);

extern const struct FlashSetupInfo LE39FW512;
//extern const struct FlashSetupInfo AT29LV512;
extern const struct FlashSetupInfo MN63F805MNP;
extern const struct FlashSetupInfo MX29L512;
extern const struct FlashSetupInfo DefaultFlash512K;

// extern const struct FlashSetupInfo MX29L010;
// extern const struct FlashSetupInfo LE26FV10N1TS;
// extern const struct FlashSetupInfo DefaultFlash1M;

void SwitchFlashBank(u8 bankNum);
u16 ReadFlashId(void);
void StartFlashTimer(u8 phase);
void SetReadFlash1(u16 *dest);
void StopFlashTimer(void);
u16 SetFlashTimerIntr(u8 timerNum, void (**intrFunc)(void));
u32 ProgramFlashSectorAndVerify(u16 sectorNum, u8 *src);
void ReadFlash(u16 sectorNum, u32 offset, void *dest, u32 size);
u32 ProgramFlashSectorAndVerifyNBytes(u16 sectorNum, void *dataSrc, u32 n);

u16 WaitForFlashWrite512K_Common(u8 phase, u8 *addr, u8 lastData);
u16 WaitForFlashWrite_Common(u8 phase, u8 *addr, u8 lastData);

u16 ProgramByte(u8 *src, u8 *dest);

u16 EraseFlashChip_LE(void);
u16 EraseFlashSector_LE(u16 sectorNum);
u16 ProgramFlashSector_LE(u16 sectorNum, void *src);
u16 ProgramFlashSector_MX(u16 sectorNum, void *src);

// agb_flash_1m
u16 IdentifyFlash(void);

#endif // GUARD_GBA_FLASH_INTERNAL_H
