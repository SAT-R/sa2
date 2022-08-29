#include "global.h"
#include "data.h"
#include "malloc_vram.h"

extern u16 gUnknown_03005190[256];

void* sub_8007C10(u32 size) {
    u16 i, j;
    u32 target = size;
    target = (target + 3) >> 2;

    for (i = 0; i < gUnknown_03001888 >> 2; i++) {
        if (gUnknown_03005190[i] == 0) {
            for (j = 0; j < target; j++) {
                if (i + j >= (gUnknown_03001888 >> 2)) {
                    return gUnknown_020226D0;
                }
                if (gUnknown_03005190[i + j] != 0) {
                    break;
                }
            }

            if (j == target) {
                gUnknown_03005190[i] = target;
                return gUnknown_03001940 + i * 0x80;
            }
        } else {
            i = 0xFFFF + gUnknown_03005190[i] + i;
        }
    }
    return gUnknown_020226D0;
}
