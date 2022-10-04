#include "countdown.h"
#include "main.h"
#include "sprite.h"
#include "game.h"
#include "task.h"
#include "malloc_vram.h"

struct CourseStartCountdown {
    struct UNK_0808B3FC_UNK240 unk0;
    struct UNK_0808B3FC_UNK240 unk30;
    u8 unk60[8];
    u16 unk68;
    u8 unk6A;
    u8 unk6B;
};

void sub_8036168(void);
void sub_8036638(struct Task*);

void CreateCourseStartCountdown(u8 mode) {
    struct Task* t;
    struct CourseStartCountdown* effect;
    struct UNK_0808B3FC_UNK240* element;

    gUnknown_03005424 |= 0x100;
    t = TaskCreate(sub_8036168, 0x6C, 0x3000, 0, sub_8036638);
    effect = TaskGetStructPtr(t);

    effect->unk6A = 0;
    effect->unk6B = 0;

    if (mode == 0) {
        effect->unk68 = 0x136;
    } else {
        effect->unk68 = 0xB4;
    }
    
    element = &effect->unk30;
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

    element = &effect->unk0;
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
