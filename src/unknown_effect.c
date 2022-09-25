#include "main.h"
#include "game.h"
#include "unknown_effect.h"
#include "m4a.h"
#include "constants/songs.h"

struct UnknownEffect87028 {
    u8 unk0;
} /* size 0x4 */;

extern u32 sub_800CBA4(struct SomeStruct_59E0*);

void sub_80871C4(s16, s16, u32);

void sub_8087088(void);
void sub_80870E8(void);

void sub_8087028(void) {
    s16 a = (gUnknown_030059E0.unk8 >> 8) - gUnknown_03005960.unk0;
    s16 b = (gUnknown_030059E0.unkC >> 8) - gUnknown_03005960.unk4;
    struct UnknownEffect87028* effect = TaskGetStructPtr(gCurTask);

    sub_80871C4(a, b, 0xA0 - effect->unk0);

    effect->unk0 += 4;
    if (effect->unk0 > 0x32) {
        gCurTask->main = sub_8087088;
    }
}

void sub_8087088(void) {
    s16 a = (gUnknown_030059E0.unk8 >> 8) - gUnknown_03005960.unk0;
    s16 b = (gUnknown_030059E0.unkC >> 8) - gUnknown_03005960.unk4;
    struct UnknownEffect87028* effect = TaskGetStructPtr(gCurTask);

    sub_80871C4(a, b, 0x6E);

    effect->unk0 += 1;
    if (effect->unk0 > 0x78) {
        effect->unk0 = 0x32;
        gCurTask->main = sub_80870E8;
    }
}

extern const s8 gUnknown_080E02DC[8][2];

void sub_80870E8(void) {
    s16 a = (gUnknown_030059E0.unk8 >> 8) - gUnknown_03005960.unk0;
    s16 b = (gUnknown_030059E0.unkC >> 8) - gUnknown_03005960.unk4;
    struct UnknownEffect87028* effect = TaskGetStructPtr(gCurTask);

    sub_80871C4(a + gUnknown_080E02DC[effect->unk0 & 7][0], b + gUnknown_080E02DC[effect->unk0 & 7][1], 0xA0 - effect->unk0);

    gBldRegs.bldY = (effect->unk0 >> 4) + 4;

    effect->unk0 += 1;
    if (effect->unk0 > 0xA0) {
        if (!(gUnknown_030059E0.unk20 & 0x40600000) && !(gUnknown_030059E0.unk37 & 0x82) && sub_800CBA4(&gUnknown_030059E0) != 0) {
            m4aSongNumStart(SE_SPIKES);
        }
        gBldRegs.bldY = 0;
        gDispCnt &= ~0x2000;
        TaskDestroy(gCurTask);
    }
}
