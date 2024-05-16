#include "core.h"

u8 REG_BASE[IO_SIZE] = { 0 };
u16 INTR_CHECK = 0;
IntrFunc INTR_VECTOR = IntrMain;

void IntrMain(void)
{
#define CHECK_INTR(res, input, flags)                                                   \
    {                                                                                   \
        res = input & flags;                                                            \
        if (res) {                                                                      \
            goto found_instr;                                                           \
        }                                                                               \
        index++;                                                                        \
    }

    u16 flags = REG_IE & REG_IF;
    u16 flag;

    u32 index = 0;
    CHECK_INTR(flag, flags, (INTR_FLAG_TIMER3 | INTR_FLAG_SERIAL));
    CHECK_INTR(flag, flags, INTR_FLAG_VBLANK);
    CHECK_INTR(flag, flags, INTR_FLAG_HBLANK);
    CHECK_INTR(flag, flags, INTR_FLAG_VCOUNT);
    CHECK_INTR(flag, flags, INTR_FLAG_TIMER0);
    CHECK_INTR(flag, flags, INTR_FLAG_TIMER1);
    CHECK_INTR(flag, flags, INTR_FLAG_TIMER2);
    CHECK_INTR(flag, flags, INTR_FLAG_DMA0);
    CHECK_INTR(flag, flags, INTR_FLAG_DMA1);
    CHECK_INTR(flag, flags, INTR_FLAG_DMA2);
    CHECK_INTR(flag, flags, INTR_FLAG_DMA3);
    CHECK_INTR(flag, flags, INTR_FLAG_KEYPAD);
    CHECK_INTR(flag, flags, INTR_FLAG_GAMEPAK);

found_instr:
    REG_IF = flag;

    gIntrTable[index]();

#undef CHECK_INTR
}
