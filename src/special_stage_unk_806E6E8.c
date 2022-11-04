#include "main.h"
#include "special_stage.h"
#include "special_stage_utils.h"
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
    unkE6E8->unk0 = stage;
    
    unkE6E8->unk4 = NULL;
    unkE6E8->unk8 = NULL;
    unkE6E8->unkC = NULL;

    sub_806CEC4(&unkE6E8->unk10, 1, 0x10, unkF776[stage->unk5B8], 0x80, 0x80, 0, 2, 0, 0);
    sub_806CEC4(&unkE6E8->unk50, 0, 7, unkF768[stage->unk5B8], 0x20, 0x20, 0, 1, 0, 0);

    sub_806E7C0(unkE6E8);

    return t;
}

extern const u8 gUnknown_080DF784[16];

void sub_806E94C(struct UNK_806E6E8* unkE6E8);
void sub_806E7C0(struct UNK_806E6E8* unkE6E8) {
    s16 i;
    struct SpecialStage* stage = unkE6E8->unk0;
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
    u8* level = &unkE6E8->unk0->unk5B8;
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
    struct SpecialStage* stage = unkE6E8->unk0;
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
    struct SpecialStage* stage = unkE6E8->unk0;
    u8* level = &stage->unk5B8;
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

typedef void (*TaskFunc_80DF7A0)(void);

extern const TaskFunc_80DF7A0 gUnknown_080DF7A0[18];

s16 sub_806F69C(struct SpecialStage*);
void sub_806FAA0(void);

void sub_806EC24(void) {
    s16* unkAC;
    s32 temp5;
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkF910->unk0;
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);
    
    TaskFunc_80DF7A0 funcs[18];
    memcpy(funcs, gUnknown_080DF7A0, sizeof(gUnknown_080DF7A0));

    switch (stage->unk5B4) {
        case 4:
        case 5:
        case 6:
            if (stage->unk5BA == 0) {
                funcs[player->unkB4 + 1]();
            }
            break;
        case 7:
            if (player->unkB4 < 0xB) {
                player->unkB4 = 0xB;
            }
            if (stage->unk5BA == 0) {
                funcs[player->unkB4 + 1]();
            }
            break;
    }

    if (player->unkB4 < 0xB) {
        s32 temp, temp2;
        struct UNK_0808B3FC_UNK240* element;
        s16 result = sub_806F69C(stage);
        s32 sin2 = gSineTable[result] << 2;
        s32 sin = gSineTable[result + 0x100] <<  2;

        temp = sin2 * 0x14;
        temp2 = sin * 0x14;
    
        temp = (temp >> 0x10) + 0x70;
        temp2 = -(temp2 >> 0x11) + 0x78;
        
        player->unk68.unk16 = temp;
        player->unk68.unk18 = temp2;

        if (result > 0x100 && result < 0x300) {
            player->unk68.unk1A = 0;
        } else {
            player->unk68.unk1A = 0x280;
        }

        sub_80047A0(result, 0x100, 0x100, 0x1E);

        if (stage->unk5BA == 0) {
            sub_8004558(&player->unk68);
        }
        sub_80051E8(&player->unk68);
    }

    sub_806FAA0();
    stage->unk594 = player->unkA8;
    stage->unk598 = player->unkAC;
    stage->unk5A0 = player->unkB2;

    unkAC = (s16*)&player->unkAC;
    gBgScrollRegs[2][1] = temp5 = -unkAC[1];
    unkAC = (s16*)&player->unkA8;
    gBgScrollRegs[2][0] = temp5 = -unkAC[1];
}

void sub_806EDB4(UNUSED u32 unused) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    s32 c8 = player->unkC8;
    s32 e4 = player->unkE4;

    u16 b2 = player->unkB2;
    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if (gInput & DPAD_UP) {
        s32 d8 = player->unkD8;
        if (c8 < e4) {
            if ((c8 + d8) < e4) {
                player->unkC8 = c8 + d8;
                c8 = player->unkC8;
                
                if (player->unkC8 > 0x2300) {
                    player->unkB4 = 2;
                } else {
                    player->unkB4 = 1;
                }
            } else {
                player->unkC8 = e4;
                c8 = player->unkC8;
                player->unkB4 = 2;
            }
        } else {
            player->unkC8 = c8 + player->unkDC;
            c8 = player->unkC8;
            player->unkB4 = 2;
        }
        player->unkA4 = c8 >> 9;
    } else if (gInput & DPAD_DOWN) {
        s32 e0 = player->unkE0;
        if (player->unkB4 == 0) {
            player->unkB4 = 7;
            return;
        }

        if ((c8 + e0) > 0) {
            player->unkC8 = c8 + e0; 
            c8 = player->unkC8;
        } else {
            player->unkC8 = 0;
            c8 = 0;
        }

        if (c8 == 0) {
            player->unkA4 = 0;
            player->unkB4 = 8;
        } else {
            player->unkB4 = 3;
        }
    } else {
        if (c8 + player->unkDC > 0) {
            player->unkC8 = c8 + player->unkDC;
            c8 = player->unkC8;
        } else {
            player->unkC8 = 0;
            c8 = 0;
            
        }
    
        if (c8 == 0) {
            player->unkA4 = 0;
            player->unkB4 = 0;
        } else {
            if (c8 > 0x2300) {
                player->unkB4 = 2;
                player->unkA4 = c8 >> 9;
            } else {
                player->unkB4 = 1;
                player->unkA4 = c8 >> 9;
            }
        }
    }
    {
        s32 temp = (sin1 * c8) >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->unkA8 -= temp;
        player->unkAC -= temp2;
    }
}

void sub_806EF44(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    u16 b2 = player->unkB2;
    
    if (gInput & (DPAD_LEFT | DPAD_RIGHT)) {
        if (gInput & DPAD_LEFT) {
            b2 += player->unkCC;
        }
        if (gInput & DPAD_RIGHT) {
            b2 -= player->unkCC;
        }
        
        player->unkB2 = b2;
        player->unkB2 &= 0x3FF;
    }
}

void sub_806F56C(void);

void sub_806EFB4(void) { 
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);
    sub_806EF44();
    sub_806F56C();

    player->unkBA++;

    player->unkB8 += player->unkF2;

    if (player->unkBA >= player->unkF0 || !(gInput & gUnknown_03005B38.unk0)) {
        player->unkB4 = 5;
    }
}

void sub_806F034(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);
    sub_806EF44();
    sub_806F56C();
    
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        s32 c8 = player->unkC8;
        player->unkB0 = 0;
        if (c8 < 1) {
            player->unkB4 = 8;
        } else if (c8 < 0x2301) {
            player->unkB4 = 1;
        } else {
            player->unkB4 = 2;
        }
    }
}

void sub_806F604(void);

void sub_806F0C4(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);
    sub_806EF44();
    sub_806F604();
    
    player->unkB8 += player->unkF6;

    if (player->unkB0 < 1) {
        s32 c8 = player->unkC8;
        player->unkB0 = 0;
        if (c8 < 1) {
            player->unkB4 = 8;
        } else if (c8 < 0x2301) {
            player->unkB4 = 1;
        } else {
            player->unkB4 = 2;
        }
    }
}

void sub_806F154(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    sub_806EF44();
    sub_806F604();

    player->unkA8 += player->unkD0;
    player->unkAC += player->unkD4;
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        player->unkC8 = 0x2000;
        player->unkB0 = 0;
        player->unkB4 = 1;
    }
}

void sub_806F1E8(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);
    unkF910->unk4++;
    player->unkB8 += player->unkFA;
    sub_806F56C();

    if (player->unkB0 < 1) {
        unkF910->unk4 = 0;
        player->unkB8 = 0;
        player->unkB0 = 0;
        
        if (player->unkC8 == 0) {
            player->unkB4 = 0xD;
        } else {
            player->unkB4 = 0xC;
        }
    }
}

void sub_806F268(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    s32 e0 = player->unkE0;
    s32 c8 = player->unkC8;
    u16 b2 = player->unkB2;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];
    if ((c8 + e0) > 0) {
        player->unkC8 = c8 + e0;
        c8 += e0;
    } else {
        player->unkC8 = 0;
        c8 = 0;
    }

    {
        s32 temp2 = (sin1 * c8) >> 10;
        s32 temp3 = (sin2 * c8) >> 10;
        player->unkA8 -= temp2;
        player->unkAC -= temp3;
    }

    if (c8 == 0) {
        player->unkB4 = 0xD;
    }
}

void sub_806F300(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    unkF910->unk4++;
    player->unkB8 += player->unkFE;

    if (player->unkB0 < -0x4000) {
        unkF910->unk4 = 0;
        player->unkB8 = 0;
        player->unkB0 = -0x4000;
        player->unkB4 = 0xF;
    }
}

void sub_806F36C(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    u16 temp = (player->unkB2 + 0x10);
    player->unkB2 = temp & 0x3FF;
    unkF910->unk4++;

    if (unkF910->unk4 > 0x1F) {
        unkF910->unk4 = 0;
        player->unkC8 = 0;
        player->unkB4 = 8;
    }
}

void sub_806F3C4(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    if (player->unkA8 <= 0x300000) {
        player->unkA8 = 0x300000;
    } 

    if (player->unkA8 >= 0x3D00000) {
        player->unkA8 = 0x3D00000;
    }

    if (player->unkAC <= 0x300000) {
        player->unkAC = 0x300000;
    }

    if (player->unkAC >= 0x3D00000) {
        player->unkAC = 0x3D00000;
    }

    unkF910->unk4++;

    player->unkB8 += player->unkFA;

    if (player->unkB0 < 0) {
        player->unkB0 = 0;
        player->unkB8 = 0;
        unkF910->unk4 = 0;

        // TODO: must be a macro
        player->unkB8 = 0;
        player->unkB0 = 0;
        player->unkB4 = 0;
    }
}

struct UNK_8C87904 { 
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s16 unk8;
    s16 unkA;
};

extern const struct UNK_8C87904* const gUnknown_08C87904[7];

void sub_806F468(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkF910->unk0;
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);
    const struct UNK_8C87904* unk7904 = gUnknown_08C87904[stage->unk5B8];

    s16 unkA8 = player->unkA8 >> 0x10;
    s16 unkAC = player->unkAC >> 0x10;

    while (unk7904->unk0 != -1) {
        if (unkA8 >= unk7904->unk2 && unkA8 < (unk7904->unk2 + unk7904->unk6)) {
            if (unkAC >= unk7904->unk4 && unkAC < (unk7904->unk4 + unk7904->unk8)) {
                switch(unk7904->unk0) {
                    case 0:
                        player->unkC8 = player->unkE8;
                        player->unkB4 = 2;
                        m4aSongNumStart(SE_277);
                        return;
                    case 1:
                        player->unkC8 = player->unkC8 < 0x600 ? 
                            0x600 : 
                            player->unkC8;
            
                        player->unkB4 = 9;
                        player->unkB0 = 0;
                        player->unkB8 = player->unkEE;
                        player->unkBA = 0;
                        m4aSongNumStart(SE_276);
                        return;
                }
            }
        }
        unk7904++;
    }
}

void sub_806F56C(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    s32 c8 = player->unkC8;
    u16 b2 = player->unkB2;
    s32 unk100 = player->unk100;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if ((c8 + unk100) > 0) {
        player->unkC8 = (c8 + unk100);
        c8 = (c8 + unk100);
    } else {
        player->unkC8 = 0;
        c8 = 0;
    }
    {
        s32 temp1 = (sin1 * c8) >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->unkA8 -= temp1;
        player->unkAC -= temp2;
    }
}

void sub_806F604(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    s32 c8 = player->unkC8;
    u16 b2 = player->unkB2;
    s32 unk104 = player->unk104;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if ((c8 + unk104) > 0) {
        player->unkC8 = c8 + unk104;
        c8 += unk104;
    } else {
        player->unkC8 = 0;
        c8 = 0;
    }

    {
        s32 temp1 = (sin1 * c8)  >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->unkA8 -= temp1;
        player->unkAC -= temp2;
    }
}

struct UNK_80DF794 {
    u16 unk0;
    u16 unk2;
};

extern const struct UNK_80DF794 gUnknown_080DF794[3];

s16 sub_806F69C(struct SpecialStage* stage) {
    u32 i;
    s32 sin14, sin16;
    struct UNK_0808B3FC_UNK240* element;
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);
    struct UNK_8071438* unk1438 = TaskGetStructPtr(stage->unk14);

    u32 temp1;
    u32 temp2;
    u16 temp3;
    s32 unkA;
    s32 unkB;
    s16 unk40;
    s16 ac;

    u16 b2 = -player->unkB2 & 0x3FF;

    unkA = unk1438->unk40 - player->unkA8;
    unkB = unk1438->unk44 - player->unkAC;
    unk40 = unkA >> 0x10;
    ac = unkB  >> 0x10;

    if (unk40 > -0x10 && unk40 < 0x10 && ac > -0x10 && ac < 0x10) {
        temp1 = 0xC;
    } else {
        if (unk40 > -0x100 && unk40 < 0x100 && ac > -0x100 && ac < 0x100) {
            temp1 = 0x10;
        } else {
            temp1 = 0x14;
        }
    }
    

    if (unk40 > -0x30 && unk40 < 0x30 && ac > -0x30 && ac < 0x30) {
        temp2 = 0;
    } else {
        if (unk40 > -0x60 && unk40 < 0x60 && ac > -0x60 && ac < 0x60) {
            temp2 = 1;
        } else {
            temp2 = 2;
        }
    }

    player->unk68.unk20 = gUnknown_080DF794[temp2].unk0;
    player->unk68.unkA = gUnknown_080DF794[temp2].unk2;

    temp3 = temp1;
    unkA = unkA >> temp3;
    unkB = unkB >> temp3;

    sin16 = gSineTable[b2];
    sin14 = gSineTable[b2 + 0x100];

    {
        s32 sin5 = sin16 * unkB;
        s32 sin6 = sin14 * unkA;
        s32 sin3 = -sin16 * unkA;
        s32 sin4 = sin14 * unkB;
    
        unkA = sin5 + sin6;
        unkB = sin3 + sin4;
    }
    
    for (i = 0x100; i > 0; i >>= 1) {
        sin16 = gSineTable[b2] >> 6;
        sin14 = gSineTable[b2 + 0x100] >> 6;

        if ((sin16 * unkB + sin14 * unkA) > 0) {
            b2 = (b2 + i) & 0x3FF;
        } else {
            if ((sin16 * unkB + sin14 * unkA) >= 0) {
                s32 a = -sin16 * unkA;
                s32 b = sin14 * unkB;
                b = a + sin14 * unkB;
                if (b >= 0) {
                    return (b2 + 0x200) & 0x3FF;
                }
                break;
            }
            b2 = (b2 - i) & 0x3FF;
        }
    }

    return b2;
}

s16 sub_806F84C(s32 a, s32 b) {
    u32 r2, r3;
    u16 r1, r3_2;
    s32 r4;

    s32 x = (a >> 8);
    s32 y = (b >> 8);
    s16 i = 0;

    x *= x;
    y *= y;
    r4 = (x + y);

    if (r4 == 0 || r4 == 1) {
        return r4;
    }

    while (r4 > 0) {
        r4 *= 2;
        i++;
    };

    r2 = (u16)(~((u32)r4 >> 0x10));

#ifndef NON_MATCHING
    r2++; r2--;
#endif

    r3 = (r2 >> 1);
    r1 = r3;
    r3 = (r3 * r2) >> 0x12;
    r1 += r3;
    r3 = (r3 * r2) >> 0x11;
    r1 += r3;
    r3 = (r3 * r2) >> 0x10;
    r3_2 = (r3 * 0xA000) >> 0x10;

    r1 = r1 + r3_2;
    r3_2 = (r3_2 * r2) >> 0x10;
    r3_2 = (r3_2 * 0xB333) >> 0x10;
    r1 += r3_2;
    r3_2 = r1 ^ 0xFFFF;
    r3_2 = r3_2 + ((r4 - (r3_2 * r3_2)) >> 0x11);

    if (i & 1) {
        r3_2 = (((r3_2 >> (i >> 1)) * 0xB505) + 0x8000) >> 0x10;
    } else {
        r3_2 = r3_2 >> (i >> 1);
    }

    return r3_2;
}

struct Task* sub_806F910(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_806EC24, 8, 0x4000, 0, 0);
    struct UNK_806F910* unkF910 = TaskGetStructPtr(t);

    unkF910->unk0 = stage;
    unkF910->unk4 = 0;
    unkF910->unk6 = 0x3C;

    return t;
}

void sub_806F944(struct SpecialStage* stage) {
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);
    struct UNK_8071438* unk1438 = TaskGetStructPtr(stage->unk14);

    s32 a8 = player->unkA8;
    s32 ac = player->unkAC;
    s32 unk40 = unk1438->unk40;
    s32 unk44 = unk1438->unk44;

    s16 result = sub_806F84C((a8 - unk40) >> 4, (ac - unk44) >> 4);
    player->unkD0 = ((a8 - unk40) * 0x20) / result;
    player->unkD4 = ((ac - unk44) * 0x20) / result;

    player->unkB8 = 0x300;
}

void sub_806FA34(void);

void sub_806F9CC(void) {
    sub_806EDB4(0);
    sub_806EF44();
    sub_806FA34();
    sub_806F468();
}

void sub_806F9E4(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    sub_806EDB4(1);
    sub_806EF44();
    sub_806FA34();
    if (!(gInput & DPAD_DOWN)) {
        player->unkB4 = 0;
    }
    sub_806F468();
}

void sub_806FA34(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    if (gPressedKeys & gUnknown_03005B38.unk0) {
        player->unkB4 = 4;
        player->unkB0 = 0;
        player->unkB8 = player->unkEC;
        player->unkBA = 0;
        m4aSongNumStart(SE_JUMP);
    }
}

void sub_806FAA0(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct UNK_806CF78* player = TaskGetStructPtr(unkF910->unk0->unkC);

    if (player->unkA8 < 0x300000) {
        player->unkA8 = 0x300000;
    }

    if (player->unkA8 > 0x3D00000) {
        player->unkA8 = 0x3D00000;
    }

    if (player->unkAC < 0x300000) {
        player->unkAC = 0x300000;
    }

    if (player->unkAC > 0x3D00000) {
        player->unkAC = 0x3D00000;
    }
}

void sub_806FB00(void) {

}
