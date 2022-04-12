
#ifndef GUARD_AGB_FLASH_512k_H
#define GUARD_AGB_FLASH_512k_H

#include "global.h"

u16 IdentifyFlash512K(void);
void ReadFlash(u16 sectorNum, u32 offset, void *dest, u32 size);

#endif  // GUARD_AGB_FLASH_512k_H
