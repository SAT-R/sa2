#include "global.h"
#include "random.h"

extern u16 gUnknown_03005B74[];

void SeedRng(u32 a, u32 b) {
    gUnknown_03005B70 = a;
    *(u32*)gUnknown_03005B74 = b;
}
