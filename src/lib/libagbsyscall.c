#include "global.h"
#include "gba/syscall.h"

#if (!(defined PLATFORM_GBA) || (PLATFORM_GBA == 0))

// Reimplementation of libagbsyscall for non-GBA platforms

inline s32 Div(s32 num, s32 denom) {
    if(denom != 0) {
        return num / denom;
    } else {
        return 0;
    }
}

inline s32 Mod(s32 num, s32 denom) {
    if(denom != 0) {
        return num % denom;
    } else {
        return 0;
    }
}

#endif
