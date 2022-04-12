#include "global.h"
#include "agb_flash_512k.h"
#include "data.h"

// Only used in here;
extern u16* gUnknown_03005B60;

// Returns true if 2 arrays have a different value
// not yet sure what these arrays relate to
bool32 sub_80724D4(void) {
    u16* pArrayB64 = gUnknown_03005B64;
    u16* pArrayB60 = gUnknown_03005B60;

    u32 index = 0;
    s32 compare = 444;
    u32 previousIndex;
    
     do {
        if (*pArrayB64 == *pArrayB60) {
            previousIndex = index << 0x10;
            index = 0x80 << 9;
            previousIndex += index;
             
            pArrayB64 = pArrayB64 + 1;
            pArrayB60 = pArrayB60 + 1;
            index = previousIndex >> 0x10;
        } else {
           return TRUE;
        }
    } while (((s32)previousIndex >> 0x10) < compare);

    return FALSE;
}

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
