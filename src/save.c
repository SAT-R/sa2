#include "global.h"
#include "agb_flash_512k.h"

// Get the checksum of the given data
UNUSED u32 sub_8072514(u8* data) {
    u32 sum = 0; 
    u32 i;

    for (i = 0; i < 0x374; i += 4) {
        sum += *(u32*)&data[i];
    }

    return sum;
}

// Read flash data at given sector into data
// and verify integrity
bool32 sub_8072538(u8 *data, u16 sectorNum) {
    u32 i;
    u32 sum;
    u32* expected;
    
    ReadFlash(sectorNum, 0, data, 0x378);
    expected = (u32*)&data[0x374];
  
    sum = 0;
    for (i = 0; i < 0x374; i += 4) {
        sum += *(u32 *)&data[i];
    }

    if (*expected != sum) {
        return FALSE;
    }
    
    return TRUE;
}
