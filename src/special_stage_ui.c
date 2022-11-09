#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_ui.h"
#include "special_stage_utils.h"
#include "special_stage_data.h"
#include "m4a.h"
#include "save.h"
#include "constants/songs.h"

void sub_8070C58(void);
void sub_806FFC8(void);
void sub_8070D14(void);

void sub_8070D80(struct UNK_8070B90*);
void sub_8070DD0(struct UNK_8070B90*);
void sub_8070DE0(struct UNK_8070B90*);
void sub_80701D4(struct UNK_8070B90*);
void sub_8070E68(struct UNK_8070B90*);
void sub_8070E00(struct UNK_8070B90*);

static const struct UNK_80DF670 sDigitSprites[] = {
    { 1119, 16, 2, 0, 0, },
    { 1119, 17, 2, 0, 0, },
    { 1119, 18, 2, 0, 0, },
    { 1119, 19, 2, 0, 0, },
    { 1119, 20, 2, 0, 0, },
    { 1119, 21, 2, 0, 0, },
    { 1119, 22, 2, 0, 0, },
    { 1119, 23, 2, 0, 0, },
    { 1119, 24, 2, 0, 0, },
};

static const struct UNK_80DF670 gUnknown_080DF830[] = {
    { 1119, 25, 2, 0, 0, },
    { 1119, 26, 2, 0, 0, },
};

static const struct UNK_80DF670 gUnknown_080DF840[] = {
    { 885, 0, 2, 0, 0, },
    { 885, 1, 2, 0, 0, },
    { 885, 2, 2, 0, 0, },
    { 885, 3, 2, 0, 0, },
    { 885, 4, 2, 0, 0, },
    { 885, 5, 2, 0, 0, },
    { 885, 6, 2, 0, 0, },
    { 885, 7, 2, 0, 0, },
};

static const struct UNK_80DF670 gUnknown_080DF880[] = {
    { 1121, 0, 24, 0, 0, },
    { 1121, 4, 27, 0, 0, },
    { 1121, 1, 24, 0, 0, },
    { 1121, 2, 27, 0, 0, },
    { 1121, 3, 18, 0, 0, },
};

static const struct UNK_80DF670 sChaosEmeraldUnlockedSprites[] = {
    { 895, 0, 9, 0, 0, },
    { 895, 1, 9, 0, 0, },
    { 895, 2, 9, 0, 0, },
    { 895, 3, 9, 0, 0, },
    { 895, 4, 9, 0, 0, },
    { 895, 5, 9, 0, 0, },
    { 895, 6, 9, 0, 0, },
};

static const struct UNK_80DF670 sChaosEmeraldMissingSprites[2] = {
    { 895, 7, 9, 0, 0, },
    { 895, 8, 9, 0, 0, },
};

static const u16 gUnknown_080DF8F0[6][3] = {
    { 40, 1066, 0, },
    { 40, 1067, 0, },
    { 40, 1068, 0, },
    { 40, 1069, 0, },
    { 40, 1070, 0, },
    { 40, 1071, 0, },
};

void sub_806FB04(void) {
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0B90->stage;

    sub_8070C58();
    sub_806FFC8();
    sub_8070D14();

    if (unk0B90->unk2A8 == 0) {
        if (stage->unk5B4 == 4) {
            sub_8070D80(unk0B90);
        }
    } 

    if (unk0B90->unk2A8 != 0) {
        if (stage->unk5B4 != 4) {
            sub_8070DE0(unk0B90);
        } else {
            if (stage->animFrame < 0x1E || stage->animFrame & 2) {
                sub_8070DD0(unk0B90);
            }
        }
    }

    if (unk0B90->unk2A9 == 0) {
        if (stage->paused != 0) {
            sub_80701D4(unk0B90);
        }
    }
        
    if (unk0B90->unk2A9 != 0) {
        if (stage->paused == FALSE) {
            sub_8070E68(unk0B90);
        } else {
            sub_8070E00(unk0B90);
        }
    }
}

void sub_806FBD0(struct UNK_8070B90* unk0B90) {
    struct SpecialStage* stage = unk0B90->stage;
    const struct UNK_80DF670* unkF7E8;
    struct UNK_0808B3FC_UNK240 newElement;

    s16 unk5BB = stage->unk5BB;
    s16 unk5BC = stage->unk5BC;
    s16 unk5BD = stage->unk5BD;
    
    sub_806CA88(&unk0B90->unk4, RENDER_TARGET_SCREEN, 1, 0x377, 0x1000, 0xC0, 0xE, 1, 0, 0);

    unkF7E8 = &sDigitSprites[unk5BB];
    sub_806CA88(&unk0B90->unk34, RENDER_TARGET_SCREEN, unkF7E8->unk4, unkF7E8->unk0, 0x1000, 0xCC, 0x12, 1, unkF7E8->unk2, 0);

    unkF7E8 = &sDigitSprites[unk5BC];
    sub_806CA88(&unk0B90->unk64, RENDER_TARGET_SCREEN, unkF7E8->unk4, unkF7E8->unk0, 0x1000, 0xD4, 0x12, 1, unkF7E8->unk2, 0);
    
    unkF7E8 = &sDigitSprites[unk5BD];
    sub_806CA88(&unk0B90->unk94, RENDER_TARGET_SCREEN, unkF7E8->unk4, unkF7E8->unk0, 0x1000, 0xDC, 0x12, 1, unkF7E8->unk2, 0);

    sub_806CA88(&newElement, RENDER_TARGET_SCREEN, 0, 0x379, 0, 0, 0, 0, 0, 0);
}

void sub_806FCF8(void) {
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0B90->stage;

    struct UNK_0808B3FC_UNK240* element;
    const struct UNK_80DF670* unkF7E8;
    
    u32 temp;

    s16 unk5BB = stage->unk5BB;
    s16 unk5BC = stage->unk5BC;
    s16 unk5BD = stage->unk5BD;

    unk0B90->unk2AA = (unk0B90->unk2AA + 1) & 0xFF;
    if (unk5BB == 0 && unk5BC == 0) {
        if (unk0B90->unk2AA & 0x8) {
            temp = 0;
        } else {
            temp = 3;
        }
    } else if (unk5BB == 0 && unk5BC < 3) {
        if (unk0B90->unk2AA & 0x10) {
            temp = 0;
        } else {
            temp = 3;
        }
    } else {
        temp = 0;
    }

    if (unk5BB != 0) {
        unkF7E8 = &sDigitSprites[unk5BB];
        element = &unk0B90->unk34;
        element->unkA = unkF7E8->unk0;
        element->unk20 = unkF7E8->unk2;
        element->unk10 |= 0x40000;
        element->unk25 = temp;
        sub_8004558(element);
    }

    if ((unk5BB | unk5BC) != 0) {
        unkF7E8 = &sDigitSprites[unk5BC];
        element = &unk0B90->unk64;
        element->unkA = unkF7E8->unk0;
        element->unk20 = unkF7E8->unk2;
        element->unk10 |= 0x40000;
        element->unk25 = temp;
        sub_8004558(element);
    }

    unkF7E8 = &sDigitSprites[unk5BD];
    element = &unk0B90->unk94;
    element->unkA = unkF7E8->unk0;
    element->unk20 = unkF7E8->unk2;
    element->unk10 |= 0x40000;
    element->unk25 = temp;
    sub_8004558(element);
}

void InitRingCounterDisplay(struct UNK_8070B90* unk0B90) {
    struct SpecialStage* stage = unk0B90->stage;

    struct UNK_0808B3FC_UNK240* element;
    const struct UNK_80DF670* sprite;

    sprite = &sDigitSprites[stage->ringsHundreds];
    sub_806CA88(&unk0B90->ringsHundredsDigit, RENDER_TARGET_SCREEN, sprite->unk4, sprite->unk0, 0x1000, 100, 0x10, 1, sprite->unk2, 0);

    sprite = &sDigitSprites[stage->ringsTens];
    sub_806CA88(&unk0B90->ringsTensDigit, RENDER_TARGET_SCREEN, sprite->unk4, sprite->unk0, 0x1000, 0x6C, 0x10, 1, sprite->unk2, 0);

    sprite = &sDigitSprites[stage->ringsUnits];
    sub_806CA88(&unk0B90->ringsUnitsDigit, RENDER_TARGET_SCREEN, sprite->unk4, sprite->unk0, 0x1000, 0x74, 0x10, 1, sprite->unk2, 0);

    sub_806CA88(&unk0B90->unk154, RENDER_TARGET_SCREEN, 8, 0x378, 0x1000, 0x78, 0xE, 2, 0, 0);

    sprite = &sDigitSprites[stage->ringsTargetHundreds];
    sub_806CA88(&unk0B90->ringsTargetHundredsDigit, RENDER_TARGET_SCREEN, sprite->unk4, sprite->unk0, 0x1000, 0x7C, 0x18, 1, sprite->unk2, 0);

    sprite = &sDigitSprites[stage->ringsTargetTens];
    sub_806CA88(&unk0B90->ringsTargetTensDigit, RENDER_TARGET_SCREEN, sprite->unk4, sprite->unk0, 0x1000, 0x84, 0x18, 1, sprite->unk2, 0);

    sprite = &sDigitSprites[stage->ringsTargetUnits];
    sub_806CA88(&unk0B90->ringsTargetUnitsDigit, RENDER_TARGET_SCREEN, sprite->unk4, sprite->unk0, 0x1000, 0x8C, 0x18, 1, sprite->unk2, 0);
}

void sub_8070078(void);

void sub_806FFC8(void) {
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0B90->stage;

    if (stage->paused == FALSE) {
        sub_8070078();
    }

    if (stage->ringsHundreds != 0) {
        sub_80051E8(&unk0B90->ringsHundredsDigit);
    }

    if (stage->ringsHundreds != 0 || stage->ringsTens != 0) {
        sub_80051E8(&unk0B90->ringsTensDigit);
    }

    sub_80051E8(&unk0B90->ringsUnitsDigit);
    sub_80051E8(&unk0B90->unk154);

    if (stage->ringsTargetHundreds != 0) {
        sub_80051E8(&unk0B90->ringsTargetHundredsDigit);
    }

    if (stage->ringsTargetHundreds != 0 || stage->ringsTargetTens != 0) {
        sub_80051E8(&unk0B90->ringsTargetTensDigit);
    }

    sub_80051E8(&unk0B90->ringsTargetUnitsDigit);
}

void sub_8070078(void) {
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0B90->stage;

    struct UNK_0808B3FC_UNK240* element;
    const struct UNK_80DF670* sprite;

    sprite = &sDigitSprites[stage->ringsHundreds];
    element = &unk0B90->ringsHundredsDigit;
    element->unkA = sprite->unk0;
    element->unk20 = sprite->unk2;
    sub_8004558(element);

    sprite = &sDigitSprites[stage->ringsTens];
    element = &unk0B90->ringsTensDigit;
    element->unkA = sprite->unk0;
    element->unk20 = sprite->unk2;
    sub_8004558(element);

    sprite = &sDigitSprites[stage->ringsUnits];
    element = &unk0B90->ringsUnitsDigit;
    element->unkA = sprite->unk0;
    element->unk20 = sprite->unk2;
    sub_8004558(element);

    if (stage->unk5C5 == 0) {
        if (stage->rings >= stage->ringsTarget) {
            stage->unk5C5 = 1;
            m4aSongNumStart(MUS_ACHIEVEMENT);
            stage->unk5C7 = 1;
            stage->unk5C8 = 0x78;

            element = &unk0B90->unk154;
            element->unkA = 0x378;
            element->unk20 = 1;
            sub_8004558(element);
        }
        return;
    } 
    
    if (stage->rings < stage->ringsTarget) {
        stage->unk5C5 = 0;

        element = &unk0B90->unk154;
        element->unkA = 0x378;
        element->unk20 = 0;
        sub_8004558(element);
    } else {
        element = &unk0B90->unk154;
        sub_8004558(element);
    }
}

void sub_80701D4(struct UNK_8070B90* unk0B90) {
    struct UNK_0808B3FC_UNK240* element = &unk0B90->unk274;
    s16 langIndex = gLoadedSaveGame->unk6 - 1;

    const u16 unkF8F0[6][3];
    memcpy(&unkF8F0, gUnknown_080DF8F0, 0x24);

    sub_806CA88(element, 1, unkF8F0[langIndex][0], unkF8F0[langIndex][1], 0x1000, 0x78, 0x50, 0, unkF8F0[langIndex][2], 0);

    DmaCopy16(3, &gObjPalette[249], unk0B90->unk2AC, 6);
    DmaCopy16(3, &gObjPalette[252], unk0B90->unk2B2, 6);
    unk0B90->unk2A9 = 1;
    m4aMPlayAllStop();
    m4aSongNumStart(SE_PAUSE_SCREEN);
}

#define SomeMacro807028C(i) ({ ((i) * 8) + 0x100; })

void sub_807028C(struct UNK_8070BF0* unk0BF0) {
    const struct UNK_80DF670* sprite;
    struct SpecialStage* stage = unk0BF0->stage;
    s16 a = 0x30, b = 0x30, c = 0x30;
    s16 d = 0x9E, e = 0x9E, f = 0x9E;
    s16 i;
    u32 temp;
    u32 unk5C5;
    s16 temp2;
    s16 temp3;
    
    u8 chaosEmeralds = gLoadedSaveGame->unkC[stage->character];
    u8 character = stage->character;

    gUnknown_03005B5C = stage->unk5D4;
    gUnknown_03005B58 = 0;

    unk5C5 = stage->unk5C5;
    if (stage->unk5C5 != 0) {
        sub_806CA88(&unk0BF0->unk4,1,0x28,0x37d,0,0x100 + a,0x20,0,1,0);
        sub_806CA88(&unk0BF0->unk34,1,gUnknown_080DF880[character].unk4,gUnknown_080DF880[character].unk0,0,0x100 + a,0x18,0,gUnknown_080DF880[character].unk2,0);
    } else {
        sub_806CA88(&unk0BF0->unk4,1,0x20,0x37d,0,0x100 + a,0x20,0,0,0);
    }

    sub_806CA88(&unk0BF0->unk1B4,1,0x16,0x37E,0,0x100 + a,0x48,0,0,0);
    sub_806CA88(&unk0BF0->unk1E4,1,0x16,0x37E,0,0x100 + b,0x5C,0,1,0);
    sub_806CA88(&unk0BF0->unk214,1,0x16,0x37E,0,0x100 + c,0x70,0,2,0);

    for (i = 0; i < 5; i++) {
        sub_806CA88(&unk0BF0->unk244[i],1,sDigitSprites[0].unk4,sDigitSprites[0].unk0,0, d + SomeMacro807028C(i), 0x58,0,sDigitSprites[0].unk2,0);
    }

    for (i = 0; i < 5; i++) {
        sub_806CA88(&unk0BF0->unk334[i],1,sDigitSprites[0].unk4,sDigitSprites[0].unk0,0, e + SomeMacro807028C(i), 0x6C,0,sDigitSprites[0].unk2,0);
    }

    for (i = 0; i < 5; i++) {
        sub_806CA88(&unk0BF0->unk424[i],1,sDigitSprites[0].unk4,sDigitSprites[0].unk0,0, f + SomeMacro807028C(i), 0x80,0,sDigitSprites[0].unk2,0);
    }

    for (i = 0; i < NUM_COURSE_ZONES; i++) {
        if (chaosEmeralds & CHAOS_EMERALD(i)) {
            sprite = &sChaosEmeraldUnlockedSprites[i];
        } else {
            sprite = &sChaosEmeraldMissingSprites[0];
        }


        sub_806CA88(&unk0BF0->chaosEmerald[i],1,9,sprite->unk0,0, i * 24 + 292 ,0x34,0,sprite->unk2, 0);
    }

    unk0BF0->unk514 = 0;
    unk0BF0->unk516 = 256;
    unk0BF0->unk518 = 256;
    unk0BF0->unk51A = 256;
    unk0BF0->unk51C = 256;
    unk0BF0->unk51E = 256;
}

void sub_807061C(s16);

void sub_8070680(s16);
void sub_80706D8(s16);
void sub_8070740(s16);
void sub_80707A8(s16);

void sub_807087C(void);
void sub_8070EF0(void);

void sub_8070590(void) {
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);

    if (unk0BF0->unk514 < 0xC) {
        sub_807061C(unk0BF0->unk514);
    }

    if (unk0BF0->unk514 > 7 && unk0BF0->unk514 < 20) {
        sub_8070680(unk0BF0->unk514 - 8);
    }

    if (unk0BF0->unk514 > 15 && unk0BF0->unk514 < 28) {
        sub_80706D8(unk0BF0->unk514 - 16);
    }

    
    if (unk0BF0->unk514 > 23 && unk0BF0->unk514 < 36) {
        sub_8070740(unk0BF0->unk514 - 24);
    }

    if (unk0BF0->unk514 > 31 && unk0BF0->unk514 < 44) {
        sub_80707A8(unk0BF0->unk514 - 32);
    }

    sub_807087C();

    unk0BF0->unk514++;

    if (unk0BF0->unk514 > 0x2B) {
        gCurTask->main = sub_8070EF0;
    }
}

void sub_807061C(s16 a) {
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;
    struct UNK_0808B3FC_UNK240* element;
    

    unk0BF0->unk516 = (0xB - a) * 0x16;

    element = &unk0BF0->unk4;

    if (stage->unk5C5 != 0) {
        element->unk16 = unk0BF0->unk516 + 0x4C;
        element = &unk0BF0->unk34;
        element->unk16 = unk0BF0->unk516 + 4;
    } else {
        element->unk16 = unk0BF0->unk516 + 0x30;
    }
}

void sub_8070680(s16 a) {
    s16 i;
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;

    unk0BF0->unk518 = (0xB - a) * 0x16;

    for (i = 0; i < 7; i++) {
        struct UNK_0808B3FC_UNK240* element = &unk0BF0->chaosEmerald[i];
        s32 temp2 = (i * 0x18);
        s32 temp = unk0BF0->unk518 + 0x24;
        temp2 += temp;
        element->unk16 = temp2;
    }
}

void sub_80706D8(s16 a) {
    s16 i;
    
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;

    unk0BF0->unk51A = (0xB - a) * 0x16;
    element = &unk0BF0->unk1B4;
    element->unk16 = unk0BF0->unk51A + 0x30;

    for (i = 0; i < 5; i++) {
        s32 temp2, temp;

        element = &unk0BF0->unk244[i];
        temp2 = (i * 8);
        temp = unk0BF0->unk51A + 0x9E;
        element->unk16 = temp2 + temp;
    }
}

void sub_8070740(s16 a) {
    s16 i;
    s32 temp2, temp;
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;

    unk0BF0->unk51C = (0xB - a) * 0x16;
    element = &unk0BF0->unk1E4;
    element->unk16 = unk0BF0->unk51C + 0x30;

    for (i = 0; i < 5; i++) {
        element = &unk0BF0->unk334[i];
        temp2 = (i * 8);
        temp = unk0BF0->unk51C + 0x9E;
        element->unk16 = temp2 + temp;
    }
}

void sub_80707A8(s16 a) {
    s16 i;
    s32 temp2, temp;
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;

    unk0BF0->unk51E = (0xB - a) * 0x16;
    element = &unk0BF0->unk214;
    element->unk16 = unk0BF0->unk51E + 0x30;

    for (i = 0; i < 5; i++) {
        element = &unk0BF0->unk424[i];
        temp2 = (i * 8);
        temp = unk0BF0->unk51E + 0x9E;
        element->unk16 = temp2 + temp;
    }
}

void sub_8070EE4(void);
void sub_8070814(void) {
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;
    u8 level = stage->zone;
    sub_807087C();

    unk0BF0->unk514++;

    if (unk0BF0->unk514 > 0xB) {
        s16 level2 = level;
        struct UNK_0808B3FC_UNK240* element = &unk0BF0->chaosEmerald[level2];
        element->unkA = sChaosEmeraldUnlockedSprites[level2].unk0;
        element->unk20 = sChaosEmeraldUnlockedSprites[level2].unk2;
        gCurTask->main = sub_8070EE4;
    }
}

void sub_807087C(void) {
    struct UNK_0808B3FC_UNK240* element;

    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;

    s16 i;
    s16 a[5], b[5], c[5];
    bool8 found;

    s32 unk5A8 = stage->unk5A8;
    s32 unk5AC = stage->unk5AC;
    s32 unk5B0 = stage->unk5B0;

    a[4] = unk5A8 % 10;
    unk5A8 /= 10;
    a[3] = unk5A8 % 10;
    unk5A8 /= 10;
    a[2] = unk5A8 % 10;
    unk5A8 /= 10;
    a[1] = unk5A8 % 10;
    unk5A8 /= 10;
    a[0] = unk5A8 % 10;

    b[4] = unk5AC % 10;
    unk5AC /= 10;
    b[3] = unk5AC % 10;
    unk5AC /= 10;
    b[2] = unk5AC % 10;
    unk5AC /= 10;
    b[1] = unk5AC % 10;
    unk5AC /= 10;
    b[0] = unk5AC % 10;

    c[4] = unk5B0 % 10;
    unk5B0 /= 10;
    c[3] = unk5B0 % 10;
    unk5B0 /= 10;
    c[2] = unk5B0 % 10;
    unk5B0 /= 10;
    c[1] = unk5B0 % 10;
    unk5B0 /= 10;
    c[0] = unk5B0 % 10;

    sub_80051E8(&unk0BF0->unk4);

    if (stage->unk5C5 != 0) {
        sub_80051E8(&unk0BF0->unk34);
    }

    for (i = 0; i < 7; i++) {
        sub_8004558(&unk0BF0->chaosEmerald[i]);
        sub_80051E8(&unk0BF0->chaosEmerald[i]);
    }

    sub_80051E8(&unk0BF0->unk1B4);
    sub_80051E8(&unk0BF0->unk1E4);
    sub_80051E8(&unk0BF0->unk214);

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || a[i] != 0 || i == 4) {
            found = TRUE;
            element = &unk0BF0->unk244[i];
            element->unkA = sDigitSprites[a[i]].unk0;
            element->unk20 = sDigitSprites[a[i]].unk2;
            sub_8004558(element);
            sub_80051E8(element);
        }
    }

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || b[i] != 0 || i == 4) {
            found = TRUE;
            element = &unk0BF0->unk334[i];
            element->unkA = sDigitSprites[b[i]].unk0;
            element->unk20 = sDigitSprites[b[i]].unk2;
            sub_8004558(element);
            sub_80051E8(element);
        }
    }

    for (i = 0, found = FALSE; i < 5; i++) {
        if (found || c[i] != 0 || i == 4) {
            found = TRUE;
            element = &unk0BF0->unk424[i];
            element->unkA = sDigitSprites[c[i]].unk0;
            element->unk20 = sDigitSprites[c[i]].unk2;
            sub_8004558(element);
            sub_80051E8(element);
        }
    }
}

void sub_8070BEC(struct Task*);
void sub_8070C3C(struct UNK_8070B90*);

struct Task* sub_8070B90(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_806FB04, 0x2B8, 0xD000, 0, sub_8070BEC);
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(t);
    unk0B90->stage = stage;
    unk0B90->unk2A4 = NULL;
    
    unk0B90->unk2A8 = 0;
    unk0B90->unk2A9 = 0;
    sub_8070C3C(unk0B90);

    return t;
}

void sub_8070BEC(struct Task* t) {
    // Unused logic
}

void sub_8070C2C(struct Task*);

struct Task* sub_8070BF0(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_8070590, 0x520, 0xD000, 0, sub_8070C2C);
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(t);
    unk0BF0->stage = stage;
    sub_807028C(unk0BF0);

    return t;
}

void sub_8070C2C(struct Task* t) {
    // Unsued logic
}

void sub_8070E88(void);

void sub_8070C30(struct SpecialStage* stage) {
    stage->unk10->main = sub_8070E88;
}

void sub_8070CD8(struct UNK_8070B90*);

void sub_8070C3C(struct UNK_8070B90* unk0B90) {
    sub_806FBD0(unk0B90);
    InitRingCounterDisplay(unk0B90);
    sub_8070CD8(unk0B90);
}

void sub_8070C58(void) {
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0B90->stage;

    if (stage->paused == FALSE) {
        sub_806FCF8();
    }

    sub_80051E8(&unk0B90->unk4);

    if (stage->unk5BB != 0) {
        sub_80051E8(&unk0B90->unk34);
    }

    if ((stage->unk5BB | stage->unk5BC) != 0) {
        sub_80051E8(&unk0B90->unk64);
    }

    sub_80051E8(&unk0B90->unk94);
}

void sub_8070CD8(struct UNK_8070B90* unk0B90) {
    const struct UNK_80DF670* unkF840 = &gUnknown_080DF840[0];
    sub_806CA88(&unk0B90->unk214,0,unkF840->unk4,unkF840->unk0,0x1000,0x70,100,2,unkF840->unk2,0);
}

void sub_8070D14(void) {
    struct UNK_8070B90* unk0B90 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0B90->stage;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    s16 unkC0 = player->unkC0;

    if (unkC0 > 1) {
        const struct UNK_80DF670* unkF830 = &gUnknown_080DF830[unkC0];
        struct UNK_0808B3FC_UNK240* element = &unk0B90->unk214;
        if (stage->paused == FALSE) {
            element->unkA = unkF830->unk0;
            element->unk20 = unkF830->unk2;
            sub_8004558(element);
        }
        sub_80051E8(element);
    }
}

void sub_8070D80(struct UNK_8070B90* unk0B90) {
    struct UNK_0808B3FC_UNK240* element = &unk0B90->unk244;
    unk0B90->unk2A8 = 1;
    unk0B90->unk2A4 = gUnknown_03005B5C;
    sub_806CA88(element,0,0x14,0x376,0x1000,0x78,0x50,1,0,0);
}

void sub_8070DD0(struct UNK_8070B90* unk0B90) {
    sub_80051E8(&unk0B90->unk244);
}

void sub_8070DE0(struct UNK_8070B90* unk0B90) {
    gUnknown_03005B5C = unk0B90->unk2A4;
    unk0B90->unk2A4 = NULL;
    unk0B90->unk2A8 = 0;
}

void sub_8070E00(struct UNK_8070B90* unk0B90) {
    struct UNK_0808B3FC_UNK240* element = &unk0B90->unk274;
    struct SpecialStage* stage = unk0B90->stage;
    void *a, *b;
    
    if (stage->unk5C6 == 0) {
        b = (void*)OBJ_PLTT + 0x1F8;
        a = (void*)OBJ_PLTT + 0x1F2;
    } else {
        b = (void*)OBJ_PLTT + 0x1F2;
        a = (void*)OBJ_PLTT + 0x1F8;
    }

    DmaCopy16(3, unk0B90->unk2B2, b, 6);
    DmaCopy16(3, unk0B90->unk2AC, a, 6);
    sub_80051E8(element);
}

void sub_8070E68(struct UNK_8070B90* unk0B90) {
    unk0B90->unk2A9 = 0;
    gUnknown_03005B58 = NULL;
    m4aMPlayAllContinue();
}

void sub_8070E88(void) {
    struct UNK_8070BF0* unk0BF0 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unk0BF0->stage;
    struct UNK_0808B3FC_UNK240* element = &unk0BF0->chaosEmerald[stage->zone];
    
    element->unkA = sChaosEmeraldUnlockedSprites[8].unk0;
    element->unk20 = sChaosEmeraldUnlockedSprites[8].unk2;
    sub_807087C();
    unk0BF0->unk514 = 0;
    gCurTask->main = sub_8070814;
}

void sub_8070EE4(void) {
    sub_807087C();
}

void sub_8070EF0(void) {
    sub_807087C();
}
