#include "countdown.h"
#include "main.h"
#include "sprite.h"
#include "game.h"
#include "task.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "constants/songs.h"
#include "constants/text.h"

struct CourseStartCountdown {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30;
    u32 unk60;
    u32 unk64;
    s16 unk68;
    u8 unk6A;
    u8 unk6B;
};

const struct UNK_080E0D64 gUnknown_080D7518[5] = {
    TextElementAlt4(1, 0, 30),  TextElementAlt4(1, 0, 121), TextElementAlt4(1, 0, 212),
    TextElementAlt4(1, 0, 303), TextElementAlt4(1, 0, 394),
};

void sub_8036168(void);
void sub_8036638(struct Task *);

void CreateCourseStartCountdown(u8 mode)
{
    struct Task *t;
    struct CourseStartCountdown *countdown;
    struct UNK_0808B3FC_UNK240 *element;

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
void CreateRaceStartMessage(void);
void sub_8036398(void);

void sub_8036168(void)
{
    struct CourseStartCountdown *countdown = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element;

    // Skip intro
    if (!IsMultiplayer() && countdown->unk68 > 0xB4
        && gPressedKeys & (A_BUTTON | B_BUTTON)) {
        countdown->unk68 = 0xB4;
    }

    if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 3) {
        m4aSongNumStart(VOICE__ANNOUNCER__3);
    } else if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 2) {
        m4aSongNumStart(VOICE__ANNOUNCER__2);
    } else if (countdown->unk68 == GBA_FRAMES_PER_SECOND * 1) {
        m4aSongNumStart(VOICE__ANNOUNCER__1);
    }

    if (--countdown->unk68 == 0) {
        gPlayer.unk20 &= ~0x200000;
        gUnknown_03005424 &= ~1;
        gUnknown_03005424 &= ~0x100;
        gPlayer.unk64 = 9;
        if (countdown->unk6A != 0) {
            gPlayer.unk14 = 0x900;
        } else {
            gPlayer.unk14 = 0x400;
        }

        sub_8018818();
        CreateRaceStartMessage();
        countdown->unk60 = gPlayer.unk8 >> 8;
        countdown->unk64 = gPlayer.unkC >> 8;
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
    element->unk16 = (gPlayer.unk8 >> 8) - gCamera.unk0;
    element->unk18 = (gPlayer.unkC >> 8) - gCamera.unk4;
    sub_8004558(element);
    sub_80051E8(element);

    if (countdown->unk68 < 0xB4) {
        element = &countdown->unk30;
        element->unk20 = 2 - Div(countdown->unk68, GBA_FRAMES_PER_SECOND);
        element->unk21 = 0xFF;
        element->unk16 = ((gPlayer.unk8 >> 8) - gCamera.unk0) + 0x18;
        element->unk18 = ((gPlayer.unkC >> 8) - gCamera.unk4) - 0x18;
        sub_8004558(element);
        sub_80051E8(element);
    }

    if ((u16)(countdown->unk68 - 0x46) < 0x6E) {
        gPlayer.unk68 = gUnknown_080D7518[gSelectedCharacter].unk4;
        gPlayer.unk6A = gUnknown_080D7518[gSelectedCharacter].unk6;
        gPlayer.unk6C = 1;

        if (IsMultiplayer()) {
            gPlayer.unk90->unk31 = (SIO_MULTI_CNT)->id;
        } else {
            gPlayer.unk90->unk31 = 0;
        }
    }
}

void sub_8036398(void)
{
    struct CourseStartCountdown *countdown = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element = &countdown->unk0;

    element->unk16 = countdown->unk60 - gCamera.unk0;
    element->unk18 = countdown->unk64 - gCamera.unk4;

    if ((u16)(element->unk16 + 0x80) > 496 || ((s16)(element->unk18) + 0x80) < 0
        || (s16)element->unk18 > 288) {
        TaskDestroy(gCurTask);
        return;
    }

    sub_8004558(element);
    sub_80051E8(element);
}

void sub_8036524(void);
void sub_8036654(struct Task *);

struct RaceStartMessage {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_808D124_UNK180 unk30;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_808D124_UNK180 unk6C;
    u16 unk78;
    u16 filler7A;
}; /* 0x7C */

void CreateRaceStartMessage(void)
{
    struct Task *t = TaskCreate(sub_8036524, 0x7C, 0x3000, 0, sub_8036654);
    struct RaceStartMessage *startMessage = TaskGetStructPtr(t);
    struct UNK_0808B3FC_UNK240 *element;

    startMessage->unk78 = 0x3C;
    element = &startMessage->unk0;
    element->unk4 = VramMalloc(0x40);
    element->unkA = 0x46A;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = gUnknown_030054B8++ | 0x60;

    element = &startMessage->unk3C;
    element->unk4 = VramMalloc(0x40);
    element->unkA = 0x46A;
    element->unk20 = 1;
    element->unk21 = 0xFF;
    element->unk1A = 0x100;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk28 = -1;
    element->unk10 = gUnknown_030054B8++ | 0x60;
}

void sub_8036524(void)
{
    struct RaceStartMessage *startMessage = TaskGetStructPtr(gCurTask);
    struct UNK_0808B3FC_UNK240 *element, *element2;
    struct UNK_808D124_UNK180 *transformConfig;
    s16 unk78;
    startMessage->unk78--;

    if (startMessage->unk78 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    element = &startMessage->unk0;
    transformConfig = &startMessage->unk30;

    element->unk16 = 0x78;
    element->unk18 = 0x28;
    element->unk10 = gUnknown_030054B8++ | 0x60;
    transformConfig->unk0 = 0;
    unk78 = startMessage->unk78;
    if (unk78 < 0x10) {
        transformConfig->unk2 = 0x200 - startMessage->unk78 * 0x10;
        transformConfig->unk4 = (startMessage->unk78 + 1) * 0x10;
    } else {
        transformConfig->unk2 = 0x100;
        transformConfig->unk4 = 0x100;
    }

    transformConfig->unk6[0] = element->unk16;
    transformConfig->unk6[1] = element->unk18;
    sub_8004558(element);
    sub_8004860(element, transformConfig);
    sub_80051E8(element);

    element = &startMessage->unk3C;
    transformConfig = &startMessage->unk6C;

    element->unk16 = 0x78;
    element->unk18 = 0x28;
    element->unk10 = gUnknown_030054B8++ | 0x60;
    transformConfig->unk0 = 0;
    unk78 = startMessage->unk78;
    if (unk78 < 0x10) {
        transformConfig->unk2 = 0x200 - startMessage->unk78 * 0x10;
        transformConfig->unk4 = (startMessage->unk78 + 1) * 0x10;
    } else {
        transformConfig->unk2 = 0x100;
        transformConfig->unk4 = 0x100;
    }

    transformConfig->unk6[0] = element->unk16;
    transformConfig->unk6[1] = element->unk18;
    sub_8004558(element);
    sub_8004860(element, transformConfig);
    sub_80051E8(element);
}

void sub_8036638(struct Task *t)
{
    struct CourseStartCountdown *countdown = TaskGetStructPtr(t);
    VramFree(countdown->unk0.unk4);
    VramFree(countdown->unk30.unk4);
}

void sub_8036654(struct Task *t)
{
    struct RaceStartMessage *startMessage = TaskGetStructPtr(t);
    VramFree(startMessage->unk3C.unk4);
    VramFree(startMessage->unk0.unk4);
}
