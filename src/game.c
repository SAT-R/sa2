#include "global.h"
#include "main.h"

extern char gUnknown_030053B4;
extern int gUnknown_03001840;
extern char gUnknown_030026F4;
extern char gUnknown_03001954;
extern int gUnknown_03001950;
extern int gUnknown_03002790;

void m4aSoundMain();
int sub_8000420(union MultiSioData* a, union MultiSioData b[4], int c);
void sub_8002724();
void sub_80019A0();
void sub_8001C90();
void sub_80019A0();
void sub_8001D78();

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
