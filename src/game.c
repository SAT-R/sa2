#include "global.h"

#define DISPSTAT ((volatile uint16_t *)0x04000004)

extern char gUnknown_030053B4;
extern int gUnknown_03001840;
extern char gUnknown_030026F4;
extern char gUnknown_03001954;
extern int gUnknown_03001950;
extern int gUnknown_03002860;
extern int gUnknown_03001890;
extern int gUnknown_03002790;

extern void sub_8095320();
extern void sub_800227C();
extern int sub_8000420(int* a, int* b, int c);
extern void sub_8002724();
extern void sub_80019A0();
extern void sub_8001C90();
extern void sub_80019A0();
extern void sub_8002450();
extern void sub_8001D78();

void MainLoop(void) {
    do {
        gUnknown_030053B4 = 0;
        if ((gUnknown_03001840 & 0x4000) == 0) {
            sub_8095320();
        }
        if (gUnknown_030026F4 == 255) {
            sub_800227C();
            if (gUnknown_03001954 != '\0') {
                gUnknown_03001950 =
                    sub_8000420(&gUnknown_03002860, &gUnknown_03001890, 0);
            }
            sub_8002724();
        }
        gUnknown_03002790 = gUnknown_03001840;
        VBlankIntrWait();
        if ((gUnknown_03001840 & 0x4000) != 0) {
            sub_8001D78();
            if ((gUnknown_03001840 & 0x400) == 0) {
                sub_8002450();
            }
        } else {
            sub_80019A0();
            if ((gUnknown_03001840 & 0x400) != 0) goto LAB_08001968;

            sub_8001C90();
        }
        if ((gUnknown_03001840 & 0x400) != 0) {
        LAB_08001968:
            gUnknown_03001840 = gUnknown_03001840 | 0x800;
        } else {
            gUnknown_03001840 = gUnknown_03001840 & 0xfffff7ff;
        }

        do {
        } while ((*DISPSTAT & 1) != 0);
    } while (1);
}
