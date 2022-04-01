#include "global.h"
#include "main.h"
#include "m4a.h"

ASM_FUNC("asm/non_matching/main/sub_8001404.inc", void sub_8001404(void));

void MainLoop(void) {
    while (TRUE) {
        gUnknown_030053B4 = 0;
        if (!(gUnknown_03001840 & 0x4000)) {
            m4aSoundMain();
        }
        if (gUnknown_030026F4 == 255) {
            GetInput();
            if (gUnknown_03001954 != '\0') {
                gUnknown_03001950 =
                    sub_8000420(&gUnknown_03002860, gUnknown_03001890, 0);
            }
            sub_8002724();
        }
        gUnknown_03002790 = gUnknown_03001840;
        VBlankIntrWait();
        if ((gUnknown_03001840 & 0x4000) != 0) {
            sub_8001D78();
            if ((gUnknown_03001840 & 0x400) == 0) {
                ClearOamBufferCpuSet();
            }
        } else {
            sub_80019A0();
            if (!(gUnknown_03001840 & 0x400)) {
                sub_8001C90();
            }
        }
        if ((gUnknown_03001840 & 0x400)) {
            gUnknown_03001840 |= 0x800;
        } else {
            gUnknown_03001840 &= ~2048;
        }
        
        // Wait for vblank
        while (REG_DISPSTAT & DISPSTAT_VBLANK);
    } ;
}
