#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_unk_806E6E8.h"
#include "special_stage_gamma.h"
#include "task.h"
#include "m4a.h"
#include "save.h"
#include "trig.h"
#include "game.h"
#include "malloc_ewram.h"
#include "constants/songs.h"

extern const s16 gUnknown_080DF768[7];
extern const s16 gUnknown_080DF776[7];

void sub_806EA04(void);
void sub_806E7C0(struct UNK_806E6E8* unkE6E8);
void sub_806EBF4(struct Task*);

struct Task* sub_806E6E8(struct SpecialStage* stage) {
    s16 unkF768[7];
    s16 unkF776[7];
    struct Task* t;
    struct UNK_806E6E8* unkE6E8;

    memcpy(unkF768, gUnknown_080DF768, 0xE);
    memcpy(unkF776, gUnknown_080DF776, 0xE);

    t = TaskCreate(sub_806EA04, 0x2A0, 0x8000, 0, sub_806EBF4);
    unkE6E8 = TaskGetStructPtr(t);
    unkE6E8->stage = stage;
    
    unkE6E8->unk4 = NULL;
    unkE6E8->unk8 = NULL;
    unkE6E8->unkC = NULL;

    sub_806CEC4(&unkE6E8->unk10, 1, 0x10, unkF776[stage->level], 0x80, 0x80, 0, 2, 0, 0);
    sub_806CEC4(&unkE6E8->unk50, 0, 7, unkF768[stage->level], 0x20, 0x20, 0, 1, 0, 0);

    sub_806E7C0(unkE6E8);

    return t;
}

extern const u8 gUnknown_080DF784[16];

void sub_806E94C(struct UNK_806E6E8* unkE6E8);
void sub_806E7C0(struct UNK_806E6E8* unkE6E8) {
    s16 i;
    struct SpecialStage* stage = unkE6E8->stage;
    s32 temp = (stage->unk5CC - stage->unk5D0) << 0x10;

    u8 unkF784[16];
    s16 unk5CE;
    s32* unk94;
    s32* unk8;
    void* unk4;
    s32* unkC;

    unkE6E8->unkC = EwramMalloc(0x280);
    for (i = 0, unkC = unkE6E8->unkC; i < 0xA0; i++, unkC++) {
        s32 temp2 = (i - stage->unk5D0);
        if (temp2 == 0) {
            *unkC = 0;
        } else {
            *unkC = temp / temp2;
        }
    }

    unkE6E8->unk8 = EwramMalloc(0x280);
    for (i = 0, unk8 = unkE6E8->unk8; i < 0xA0; i++, unk8++) {
        s32 temp2 = (i - stage->unk5D0);
        if (temp == 0) {
            *unk8 = 0;
        } else {
            *unk8 = temp2 / temp;
        }
    }

    unk94 = &stage->unk94[stage->unk5D1][0];
    unk5CE = stage->unk5CE;
    for (i = stage->unk5D1; i < 0xA0; i++) {
        s32 temp2 = (unkE6E8->unkC[i] * unk5CE) >> 8;
        s32 temp3 = (-stage->unk5CA * temp2);
        s32 temp4 = (((i - stage->unk5CC) * temp2));
        *unk94++ = (-(temp3 << 1) >> 8) * unk5CE;
        *unk94++ = (-(temp4 << 2) >> 8) * unk5CE;
    }

    unkE6E8->unk4 = EwramMalloc(0xA00);
    gUnknown_03001884 = unkE6E8->unk4;
    gUnknown_03004D54 = unkE6E8->unk4;
    gUnknown_030022C0 = unkE6E8->unk4;
    unk4 = unkE6E8->unk4;
    
    // TODO: what is unk4
    memcpy(unkF784, gUnknown_080DF784, 0x10);
    for (i = 0; i < 0xA0; i++, unk4 += 0x10) {
        memcpy(unk4, unkF784, 0x10);
        *(s16*)(unk4 + 4) = i << 8;
    }

    sub_806E94C(unkE6E8);
}

extern const s16 gUnknown_080DF6DC[7];

struct UNK_8C87920 {
    u16 unk0;
    u16 unk2;
};

extern const struct UNK_8C87920* const gUnknown_08C87920[7];

void sub_806E94C(struct UNK_806E6E8* unkE6E8) {
    s16 i;
    // Maybe some macro? Who knows...
    u8* level = &unkE6E8->stage->level;
    const struct UNK_8C87920* assets = gUnknown_08C87920[*level];
    s16 num = gUnknown_080DF6DC[*level];

    for (i = 0; i < num; i++) {
        struct UNK_0808B3FC_UNK240* element = &unkE6E8->unk90[i];
        element->unk4 = gUnknown_03005B5C;
        element->unk8 = 0;
        element->unkA = assets[i].unk0;
        element->unk10 = 0x80000;
        element->unk16 = 0;
        element->unk18 = 0;
        element->unk1A = 0;
        element->unk1C = 0;
        element->unk1E = 0xffff;
        element->unk20 = assets[i].unk2;
        element->unk21 = 0xff;
        element->unk22 = 16;
        element->unk25 = 0;
        element->unk28 = -1;
        sub_80036E0(element);
    }
}

void sub_806EB74(void);

void sub_806EA04(void) {
    struct UNK_806E6E8* unkE6E8 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkE6E8->stage;
    s32 sin1, sin2;
    s16 unk5CE;
    s32 unk5A0;
    s16 i;
    s16* unk1884;
    gUnknown_03002A80 = 0x10;
    gUnknown_03002878 = (void*)REG_ADDR_BG2PA;
    gUnknown_03001884 = unkE6E8->unk4;

    unk5A0 = stage->unk5A0;
    sin1 = gSineTable[unk5A0] * 4;
    sin2 = gSineTable[unk5A0 + 0x100] * 4;

    unk5CE = stage->unk5CE;
    gFlags |= 4;

    i = stage->unk5D1;
    unk1884 = gUnknown_03001884 + (stage->unk5D1 * 0x10);

    for (; i < 0xA0; i++) {
        s32* footer;
        s32 temp = unkE6E8->unkC[i] * unk5CE;
        s32 temp2 = (temp >> 8);
       
        s32 temp4, temp5;
        s32 temp6, temp7;
        temp4 = (0 - stage->unk5CA) * temp2;
        temp5 = (i - stage->unk5CC) * temp2 * 2;
        
        *unk1884++ = ((temp >> 0x10) * sin2) >> 0x10;
        *unk1884++ = ((temp >> 0x10) * sin1) >> 0x10;
        *unk1884++ = ((temp >> 0x10) * -sin1) >> 0x10;
        *unk1884++ = ((temp >> 0x10) * sin2) >> 0x10;

        temp6 = ((temp5 >> 0x10) * sin1) + ((temp4 >> 0x10) * sin2) + stage->unk594;
        temp7 = ((temp4 >> 0x10) * -sin1) + ((temp5 >> 0x10) * sin2) + stage->unk598;

        footer = (s32*)unk1884;
        *footer++ = temp6 >> 8;
        *footer++ = temp7 >> 8;
        
        unk1884 += 4;
    }

    sub_806EB74();
}

void sub_806EB74(void) {
    s16 i;
    struct UNK_806E6E8* unkE6E8 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkE6E8->stage;
    u8* level = &stage->level;
    s16 num = gUnknown_080DF6DC[*level];
    // Huh?
    u8 *temp = (u8*)&stage->unk5A0;
    gBgScrollRegs[1][0] = -*temp;
    gBgScrollRegs[1][1] = 0x30;

    if (stage->unk5BA != 1) {
        for (i = 0; i < num; i++) {
            struct UNK_0808B3FC_UNK240* element = &unkE6E8->unk90[i];

            sub_80036E0(element);
            sub_8003914(element);
        }
    }
}

void sub_806EBF4(struct Task* t) {
    struct UNK_806E6E8* unkE6E8 = TaskGetStructPtr(t);

    if (unkE6E8->unk8 != NULL) {
        EwramFree(unkE6E8->unk8);
    } 

    if (unkE6E8->unkC != NULL) {
        EwramFree(unkE6E8->unkC);
    } 

    if (unkE6E8->unk4 != NULL) {
        EwramFree(unkE6E8->unk4);
    } 
}
