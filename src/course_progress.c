#include "course_progress.h"
#include "main.h"
#include "game.h"
#include "task.h"
#include "sprite.h"
#include "transition.h"
#include "malloc_vram.h"

struct CourseProgressIndicator {
    struct UNK_0808B3FC_UNK240 unk0[4];
    struct UNK_0808B3FC_UNK240 unkC0;
    struct UNK_0808B3FC_UNK240 unkF0;
    // course
    u8 unk120;
    // numLevels
    u8 unk121;
    u8 filler122[2];
};

void sub_8086EDC(void);
void sub_8086FC8(struct Task*);
void sub_8086D68(struct CourseProgressIndicator*);

void CourseProgressIndicator(void) {
    u8 i;
    struct Task* t = TaskCreate(sub_8086EDC, 0x124, 0x1000, 0, sub_8086FC8);
    struct CourseProgressIndicator* progressIndicator = TaskGetStructPtr(t);

    progressIndicator->unk120 = (gCurrentLevel >> 1) + (gCurrentLevel & 1);

    for (i = 0; i < 4; i++) {
        if (gUnknown_030055A0[i] == NULL) {
            break;
        }
    }
    progressIndicator->unk121 = i;
    sub_8086D68(progressIndicator);
}

extern const u8 gUnknown_080E02D4[6];

void sub_8086D68(struct CourseProgressIndicator* progressIndicator) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;
    u8 characters[6];

    memcpy(characters, gUnknown_080E02D4, 6);

    for (i = 0; i < progressIndicator->unk121; i++) {
        element = &progressIndicator->unk0[i];
        element->unk4 = VramMalloc(4);
        element->unkA = 0x465;
        element->unk20 = characters[gMultiplayerCharacters[i]];
        element->unk21 = 0xFF;
        element->unk16 = 6;
        element->unk18 = 0x8E;
        if (gMultiplayerCharacters[i] == gSelectedCharacter) {
            element->unk1A = 0x80;
        } else {
            element->unk1A = 0xC0;
        }
        element->unk8 = 0;
        element->unk14 = 0;
        element->unk1C = 0;
        element->unk22 = 0x10;
        element->unk25 = i;
        element->unk10 = 0;
        sub_8004558(element);
    }

    element = &progressIndicator->unkC0;
    element->unk4 = VramMalloc(4);
    element->unkA = 0x36F;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk16 = 0xE;
    element->unk18 = 0x96;
    element->unk1A = 0x140;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk10 = 0;
    sub_8004558(element);

    element = &progressIndicator->unkF0;
    element->unk4 = VramMalloc(4);
    element->unkA = 0x370;
    element->unk20 = 0;
    element->unk21 = 0xFF;
    element->unk16 = 0xE2;
    element->unk18 = 0x96;
    element->unk1A = 0x140;
    element->unk8 = 0;
    element->unk14 = 0;
    element->unk1C = 0;
    element->unk22 = 0x10;
    element->unk25 = 0;
    element->unk10 = 0;
    sub_8004558(element);
}

extern const u16 gUnknown_080E02B8[14];

void sub_8086F6C(struct CourseProgressIndicator*);

void sub_8086EDC(void) {
    u8 i;
    struct UNK_0808B3FC_UNK240* element;
    struct MultiplayerPlayer* player;
    struct CourseProgressIndicator* progressIndicator = TaskGetStructPtr(gCurTask);

    for (i = 0; i < progressIndicator->unk121; i++) {
        element = &progressIndicator->unk0[i];
        player = TaskGetStructPtr(gUnknown_030055A0[i]);
        element->unk16 = ((player->unk50 * gUnknown_080E02B8[progressIndicator->unk120]) >> 0x10) + 6;
    }

    sub_8086F6C(progressIndicator);
}
