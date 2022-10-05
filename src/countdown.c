#include "countdown.h"
#include "main.h"
#include "sprite.h"
#include "game.h"
#include "task.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "constants/songs.h"

struct CourseStartCountdown {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30;
    u32 unk60;
    u32 unk64;
    s16 unk68;
    u8 unk6A;
    u8 unk6B;
};

void sub_8036168(void);
void sub_8036638(struct Task*);

void CreateCourseStartCountdown(u8 mode) {
    struct Task* t;
    struct CourseStartCountdown* countdown;
    struct UNK_0808B3FC_UNK240* element;

    gUnknown_03005424 |= 0x100;
    t = TaskCreate(sub_8036168, 0x6C, 0x3000, 0, sub_8036638);
    countdown = TaskGetStructPtr(t);

    countdown->unk6A = 0;
    countdown->unk6B = 0;

    if (mode == 0) {
        countdown->unk68 = 0x136;
    } else {
        countdown->unk68 = 0xB4;
    }
    
    element = &countdown->unk30;
    element->unk4 = VramMalloc(4);
    element->unkA = 0x469;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0;

    element = &countdown->unk0;
    element->unk4 = VramMalloc(0xE);
    element->unkA = 0x212;
    element->unk20 = 0;
    element->unk1A = 0x480;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk21 = 0xFF;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = 0x2400;
}

void sub_8018818(void);
void sub_8036400(void);
void sub_8036398(void);

struct UNK_80D7518 {
    u32 unk0;
    u16 unk4;
    u8 unk6;
};
extern const struct UNK_80D7518 gUnknown_080D7518[5];

void sub_8036168(void) {
    struct CourseStartCountdown* countdown = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240* element;

    // Skip intro
    if (!IsMultiplayer() && countdown->unk68 > 0xB4 && gPressedKeys & (A_BUTTON | B_BUTTON)) {
        countdown->unk68 = 0xB4;
    }

    if (countdown->unk68 == 0xB4) {
        m4aSongNumStart(VOICE__ANNOUNCER__3);
    } else if (countdown->unk68 == 0x78) {
        m4aSongNumStart(VOICE__ANNOUNCER__2);
    } else if (countdown->unk68 == 0x3C) {
        m4aSongNumStart(VOICE__ANNOUNCER__1);
    }

    if (--countdown->unk68 == 0) {
        gUnknown_030059E0.unk20 &= ~0x200000;
        gUnknown_03005424 &= ~1;
        gUnknown_03005424 &= ~0x100;
        gUnknown_030059E0.unk64 = 9;
        if (countdown->unk6A != 0) {
            gUnknown_030059E0.unk14 = 0x900;
        } else {
            gUnknown_030059E0.unk14 = 0x400;
        }

        sub_8018818();
        sub_8036400();
        countdown->unk60 = gUnknown_030059E0.unk8 >> 8;
        countdown->unk64 = gUnknown_030059E0.unkC >> 8;
        m4aSongNumStart(VOICE__ANNOUNCER__GO);
        gCurTask->main = sub_8036398;
    } else {
        if (countdown->unk68 < 5) {
            if (gPressedKeys & DPAD_RIGHT && countdown->unk6B == 0) {
                countdown->unk6A = 1;
            }
        } else {
            if (gPressedKeys & DPAD_RIGHT) {
                countdown->unk6B = 1;
            }
        }
    }

    element = &countdown->unk0;
    element->unk16 = (gUnknown_030059E0.unk8 >> 8) - gUnknown_03005960.unk0;
    element->unk18 = (gUnknown_030059E0.unkC >> 8) - gUnknown_03005960.unk4;
    sub_8004558(element);
    sub_80051E8(element);

    if (countdown->unk68 < 0xB4) {
        element = &countdown->unk30;
        element->unk20 = 2 - Div(countdown->unk68, 0x3C);
        element->unk21 = 0xFF;
        element->unk16 = ((gUnknown_030059E0.unk8 >> 8) - gUnknown_03005960.unk0) + 0x18;
        element->unk18 = ((gUnknown_030059E0.unkC >> 8) - gUnknown_03005960.unk4) - 0x18;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if ((u16)(countdown->unk68 - 0x46) < 0x6E) {
        gUnknown_030059E0.unk68 = gUnknown_080D7518[gSelectedCharacter].unk4;
        gUnknown_030059E0.unk6A = gUnknown_080D7518[gSelectedCharacter].unk6;
        gUnknown_030059E0.unk6C = 1;

        if (IsMultiplayer()) {
            gUnknown_030059E0.unk90->unk31 = (SIO_MULTI_CNT)->id;
        } else {
            gUnknown_030059E0.unk90->unk31 = 0;
        }
    }
}
