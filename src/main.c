#include "global.h"

void sub_8001404(void);
void sub_801A51C(void);

extern char gUnknown_0300188C;
extern int gUnknown_03001840;
extern int gUnknown_03001884;
extern int gUnknown_03004D54;
extern int gUnknown_030022C0;
extern int gUnknown_030022AC;

extern int gUnknown_03004D90;
extern char gUnknown_03004D50;

void SetReg5(void) {
    REG_IF = 4;
    return;
}

void SetReg100(void) {
    REG_IF = 0x100;
    return;
}

void SetReg200(void) {
    REG_IF = 0x200;
    return;
}

void SetReg400(void) {
    REG_IF = 0x400;
    return;
}

void SetReg800(void) {
    REG_IF = 0x800;
    return;
}

void SetReg8(void) {
    REG_IF = 8;
    return;
}

void SetReg10(void) {
    REG_IF = 0x10;
    return;
}

void SetReg20(void) {
    REG_IF = 0x20;
    return;
}

void SetReg1000(void) {
    REG_IF = 0x1000;
    return;
}

void SetReg2000(void) {
    REG_IF = 0x2000;
    return;
}

void DummyFunc(void) { return; }

void sub_8002450(void) {
    gUnknown_0300188C = 0;

    gUnknown_03001840 &= ~8;
    if ((gUnknown_03001840 & (0x20)) == 0) {
        if (gUnknown_03001884 == gUnknown_03004D54) {
            gUnknown_03001884 = gUnknown_030022C0;
            gUnknown_030022AC = gUnknown_03004D54;
        } else {
            gUnknown_03001884 = gUnknown_03004D54;
            gUnknown_030022AC = gUnknown_030022C0;
        }
    }
    gUnknown_03001840 &= ~4;
    CpuFastFill(0x200, &gUnknown_03004D90, 1024);
    gUnknown_03004D50 = 0;
    gUnknown_03001840 &= ~16;
}

void AgbMain(void) {
    sub_8001404();
    sub_801A51C();
    MainLoop();
}
