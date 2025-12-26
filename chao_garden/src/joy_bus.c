#include "global.h"
#include "m4a.h"
#include "joy_bus.h"
#include "input.h"
#include "save.h"

extern s32 gUnknown_030005A8;
extern s32 gUnknown_030005AC;
extern vu8 gUnknown_030005B0;
extern vu8 gUnknown_030005B1;
extern s32 gUnknown_030005BC;
extern vu8 gUnknown_030043D8;
extern vu8 gUnknown_030043DC;
extern vu8 gUnknown_030043E4;
extern vu8 gUnknown_030043E8;
extern vu8 gUnknown_030043EC;

extern IntrFunc gJoyBusIntrRAM;
extern u8 *gUnknown_030005B4;
extern u16 gUnknown_030005B8;
extern u16 gUnknown_030005BA;

// This could be gUnknown_03003330->unk20?
extern s8 gUnknown_03003350;

extern s32 gUnknown_030043E0;

s32 sub_02000988(s32);
s32 sub_02000a40(s32);
void sub_02000b0c(u32);
void sub_02000b64(u32);
void sub_02000bb0(void);

void JoyBusIntr(void);

void JoyBusInit(void)
{
    REG_IME = 0;
    REG_IE &= ~0x80;
    REG_RCNT = 0xC000;
    REG_JOYSTAT = 0;
    // oops?
    REG_JOY_RECV;
    REG_JOY_TRANS = 0;
    REG_JOYCNT = 0x47;
#if !PORTABLE
    CpuCopy32(&JoyBusIntr, &gJoyBusIntrRAM, 0x520);
    gIntrTable[0] = (void *)&gJoyBusIntrRAM + 1;
#else
    gIntrTable[0] = JoyBusIntr;
#endif
    gUnknown_030043DC = 0;
    gUnknown_030043EC = 0;
    gUnknown_030005B1 = 0xA;
    gUnknown_030043E8 = 0;
    gUnknown_030043D8 = gUnknown_030043E4 = 0;
    gUnknown_030005B0 = 0;
    gUnknown_030005BC = 0;
    gUnknown_030005A8 = (*(u8 *)0x080000AF << 0x18) | 0x4F5341;
    gUnknown_030005AC = (*(u8 *)0x080000AF << 0x18) | 0x425347;
    REG_IF = 0x80;
    REG_IE |= 0x80;
    REG_IME = 1;
}

void sub_02000590(void)
{
    REG_IME = 0;
    if (gUnknown_030005B1 < 10) {
        gUnknown_030005B1++;
    } else if (gUnknown_030043EC != 0) {
        u32 before = REG_IME;
        REG_IME = 0;
        REG_RCNT = 0x8000;
        REG_RCNT = 0xC000;
        REG_JOYSTAT = 0;
        REG_JOY_RECV;
        REG_JOY_TRANS = 0;
        REG_JOYCNT = 0x47;
        gUnknown_030043DC = 0;
        gUnknown_030043EC = 0;
        gUnknown_030005B1 = 10;
        gUnknown_030043E8 = 0;
        gUnknown_030005B0 = 0;
        gUnknown_030005BC = 0;
        REG_IF = 0x80;
        REG_IME = before;
    } else if (gUnknown_030005B0 < 11) {
        gUnknown_030005B0++;
    } else {
        u32 before = REG_IME;
        REG_IME = 0;
        REG_RCNT = 0x8000;
        REG_RCNT = 0xC000;
        REG_JOYSTAT = 0;
        REG_JOY_RECV;
        REG_JOY_TRANS = 0;
        REG_JOYCNT = 0x47;
        gUnknown_030043DC = 0;
        gUnknown_030043EC = 0;
        gUnknown_030005B1 = 10;
        gUnknown_030043E8 = 0;
        gUnknown_030005B0 = 0;
        gUnknown_030005BC = 0;
        REG_IF = 0x80;
        REG_IME = before;
    }
    REG_IME = 1;
}

void JoyBusIntr(void)
{
    s32 r4;
    u16 joyCnt;

    joyCnt = REG_JOYCNT;

    switch (gUnknown_030043DC) {
        case 0:
        default:
            if ((joyCnt & 1)) {
                sub_02000bb0();
                gUnknown_030043DC += 1;
            }
            break;
        case 1:
            if (!(joyCnt & 4)) {
                if ((joyCnt & 1)) {
                    sub_02000bb0();
                } else {
                    gUnknown_030043DC = 0;
                }
            } else {
                gUnknown_030043DC++;
            }
            break;
        case 2:
            if (joyCnt & 2) {
                if (REG_JOY_RECV == gUnknown_030005AC) {
                    REG_JOYSTAT = 0x30;
                    gUnknown_030043DC++;
                    break;
                }
                gUnknown_030043DC = 0;
                break;
            }
            if ((joyCnt & 1)) {
                sub_02000bb0();
                gUnknown_030043DC = 1;
            } else {
                gUnknown_030043DC = 0;
            }
            break;
        case 3:
            gUnknown_030043DC++;
            break;
        case 4:
            if ((joyCnt & 4)) {
                REG_JOY_TRANS = gUnknown_030005BC;
            } else if ((2 & joyCnt)) {
                r4 = REG_JOY_RECV;
                if (r4 == 0x6F616843) {
                    gUnknown_030005B1 = 0;
                    gUnknown_030043EC = 1;
                } else {
                    r4 = 0;
                }
                REG_JOY_TRANS = r4;
                gUnknown_030005BC = r4;
            }
            break;
        case 5:;
            if ((joyCnt & 4) != 0) {
                REG_JOY_TRANS = gUnknown_030005BC;
                break;
            }
            if ((2 & joyCnt)) {
                r4 = REG_JOY_RECV;
                if (r4 == 0x6F616843) {
                    u16 a;
                    gUnknown_030005B1 = 0;
                    gUnknown_030043E8 = 0;
                    a = gInput.unk0;
                    r4 = ((0xFF00 & a) << 8) | 0x4B43 | ((a << 0x18));
                } else if (r4 == 0x4F414843) {
                    u16 a;
                    gUnknown_030005B1 = 0;
                    gUnknown_030043E8 = 1;
                    a = gInput.unk0;
                    r4 = ((0xFF00 & a) << 8) | 0x4B43 | ((a << 0x18));
                } else {
                    if ((r4 & 0xFF) == 0x2A) {
                        sub_02000b0c(r4);
                        gUnknown_030043DC = 6;
                    } else if ((r4 & 0xFF) == 0x22) {
                        sub_02000b64(r4);
                        gUnknown_030043DC = 8;
                    } else {
                        r4 = 0;
                    }
                }
                REG_JOY_TRANS = r4;
                gUnknown_030005BC = r4;
            }
            break;
        case 6:
            if (!(joyCnt & 4)) {
                if ((joyCnt & 2)) {
                    r4 = REG_JOY_RECV;
                    if (!(r4 & 0xFFFF)) {
                        r4 = sub_02000988(r4);
                        gUnknown_030043DC = 7;
                    } else if ((r4 & 0xFF) == 0x2A) {
                        sub_02000b0c(r4);
                    } else {
                        r4 = 0;
                    }
                    REG_JOY_TRANS = r4;
                    gUnknown_030005BC = r4;
                }
            } else {
                REG_JOY_TRANS = gUnknown_030005BC;
                break;
            }
            break;
        case 7:
            if (!(joyCnt & 4)) {
                if (joyCnt & 2) {
                    r4 = sub_02000988(REG_JOY_RECV);
                    REG_JOY_TRANS = r4;
                    gUnknown_030005BC = r4;
                }
            } else {
                REG_JOY_TRANS = gUnknown_030005BC;
                break;
            }
            break;
        case 8:
            if (!(joyCnt & 4)) {
                if (joyCnt & 2) {
                    r4 = REG_JOY_RECV;
                    if ((r4 & 0xFF) == 0x22) {
                        sub_02000b64(r4);
                    } else if ((r4 & 0xFF) == 0x26) {
                        r4 = sub_02000a40(r4);
                        gUnknown_030043DC = 9;
                    } else {
                        r4 = 0;
                    }
                    REG_JOY_TRANS = r4;
                    gUnknown_030005BC = r4;
                }
            } else {
                REG_JOY_TRANS = gUnknown_030005BC;
                break;
            }
            break;
        case 9:
            if ((joyCnt & 4)) {
                REG_JOY_TRANS = gUnknown_030005BC;
                break;
            }

            if (joyCnt & 2) {
                r4 = sub_02000a40(REG_JOY_RECV);
                REG_JOY_TRANS = r4;
                gUnknown_030005BC = r4;
                break;
            }
            break;
    }
    gUnknown_030005B0 = 0;
    REG_JOYCNT = joyCnt;
}

s32 sub_02000988(s32 in)
{
    u32 ret = in;
    if ((gUnknown_030005B8 == (gUnknown_030005BA + 1)) && (ret == 0x6F616843)) {
        gUnknown_030005B1 = 0;
        ret = ({
            u16 a = gInput.unk0;
            ((0xFF00 & a) << 8) | 0x4B43 | (a << 0x18);
        });
        gUnknown_030043DC = 5;
        gUnknown_030043D8 = 2;
    } else {
        u16 r2 = ((ret & 0xff) << 8) | ((ret >> 8) & 0xff);
        if ((r2 - gUnknown_030005BA) == 1) {
            gUnknown_030005BA = r2;
            gUnknown_030005B4 += 2;
        }
        if (r2 == gUnknown_030005BA) {
            gUnknown_030005B1 = 0;
            gUnknown_030005B4[0] = ret >> 0x10;
            gUnknown_030005B4[1] = ret >> 0x18;
        } else {
            ret = 0;
        }
    }
    return ret;
}

s32 sub_02000a40(s32 in)
{
    s32 ret = in;

    if (gUnknown_030005B8 == (gUnknown_030005BA + 1) && gUnknown_030005BC == ret) {
        gUnknown_030005B1 = 0;
        ret = ({
            u16 a = gInput.unk0;
            ((0xFF00 & a) << 8) | 0x4B43 | (a << 0x18);
        });
        gUnknown_030043DC = 5;
        gUnknown_030043E4 = 2;
    } else {
        if (gUnknown_030005BC == ret) {
            gUnknown_030005B1 = 0;
            gUnknown_030005BA += 1;
            gUnknown_030005B4 += 2;
        }
        ret = (gUnknown_030005B4[0] << 0x10) | (gUnknown_030005B4[1] << 0x18) | ((u16)gUnknown_030005BA >> 8)
            | ((0xFF & gUnknown_030005BA) << 8);
    }

    return ret;
}

void sub_02000af0(u8 p)
{
    REG_IME = 0;
    gUnknown_030043DC = p;
    REG_IME = 1;
}

void sub_02000b0c(u32 arg0)
{
    gUnknown_030005B1 = 0;
    // This could be gUnknown_03003330->unk20?
    gUnknown_030005B4 = &gUnknown_03003350;
    gUnknown_030005B8 = ((arg0 >> 8) & 0xFF00) | (arg0 >> 0x18);
    gUnknown_030005BA = 0;
    gUnknown_030043E0 = gUnknown_030005B8 * 2;
    gUnknown_030043D8 = 1;
}

void sub_02000b64(u32 p1)
{
    gUnknown_030005B1 = 0;
    gUnknown_030005B4 = &gGameState.unk58;
    gUnknown_030005B8 = ((p1 >> 8) & 0xFF00) | (p1 >> 0x18);
    gUnknown_030005BA = 0;
    gUnknown_030043E4 = 1;
}

void sub_02000bb0(void)
{
    REG_JOY_RECV;
    REG_JOY_TRANS = gUnknown_030005A8;
    REG_JOYSTAT = 0x20;
}
