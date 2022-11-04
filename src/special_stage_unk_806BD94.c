#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_unk_806BD94.h"
#include "task.h"
#include "m4a.h"
#include "trig.h"
#include "random.h"
#include "constants/songs.h"

void sub_806D890(struct SpecialStage* stage, s16 num) {
    s16 i;
    stage->unk5A4 += num;

    if (stage->unk5A4 > 999) {
        stage->unk5A4 = 999;
    }

    for (i = 0; i < num; i++) {
        stage->unk5C1++;
        if (stage->unk5C1 <= 9) {
            continue;
        }
        stage->unk5C1 = 0;
        
        stage->unk5C0++;
        if (stage->unk5C0 <= 9) {
            continue;
        }
        stage->unk5C0 = 0;

        stage->unk5BF++;
        if (stage->unk5BF <= 9) {
            continue;
        }

        stage->unk5BF = 9;
        stage->unk5C0 = 9;
        stage->unk5C1 = 9;
    }
}

void sub_806E3B8(struct SpecialStage* stage, s16);

void sub_806D924(struct SpecialStage* stage, s16 num) {
    s16 i;
    sub_806E3B8(stage, -1);
    
    stage->unk5A4 -= num; 
    if (stage->unk5A4 < 0) {
        stage->unk5A4 = 0;
    }

    for (i = num; i > 0; i--) {
        stage->unk5C1--;
        if (stage->unk5C1 >= 0) {
            continue;
        }
        stage->unk5C1 = 9;
        
        stage->unk5C0--;
        if (stage->unk5C0 >= 0) {
            continue;
        }
        stage->unk5C0 = 9;

        stage->unk5BF--;
        if (stage->unk5BF >= 0) {
            continue;
        }

        stage->unk5BF = 0;
        stage->unk5C0 = 0;
        stage->unk5C1 = 0;
    }
}

void sub_806DB48(void);

void sub_806D9B4(void) {
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    s16 i;

    for (i = 0; i < 323; i++) {
        unkBD94->unk914[i] = 1;
    }

    unkBD94->unkA5A = 0;

    sub_806CA88(&unkBD94->unk4,0,4,0x372,0x3000,0x14,0x14,0xe,1,0);
    sub_806CA88(&unkBD94->unk34,0,0x10,0x372,0x3000,0x14,0x14,0xe,0,0);
    sub_806CA88(&unkBD94->unk64,0,4,0x374,0x3000,0x14,0x1e,0xf,1,0);
    sub_806CA88(&unkBD94->unk94,0,4,0x372,0x3000,0x14,0x14,0xe,6,0);
    sub_806CA88(&unkBD94->unkC4,0,4,0x372,0x3000,0x14,0x14,0xe,5,0);
    sub_806CA88(&unkBD94->unkF4[0],0,4,0x37b,0x3000,0x14,0x14,0xe,0,0);
    sub_806CA88(&unkBD94->unkF4[1],0,4,0x37b,0x3000,0x14,0x14,0xe,1,0);
    sub_806CA88(&unkBD94->unkF4[2],0,4,0x37b,0x3000,0x14,0x14,0xe,2,0);
    sub_806CA88(&unkBD94->unkF4[3],0,4,0x37b,0x3000,0x14,0x14,0xe,3,0);

    gCurTask->main = sub_806DB48;
}

void sub_806DC98(void);

bool16 sub_806DE10(void);
void sub_806E4FC(struct SpecialStage* stage);
void sub_806E584(s16, struct UNK_806BD94_UNK874*);
void sub_806DEA4(void);

void sub_806DB48(void) {
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkBD94->unk0;
    if (stage->unk5BA == 0) {
        sub_8004558(&unkBD94->unk4);
        sub_8004558(&unkBD94->unk64);
        sub_8004558(&unkBD94->unk34);
        sub_8004558(&unkBD94->unk94);
        sub_8004558(&unkBD94->unkC4);

        sub_806DC98();
        
        if (sub_806DE10() == 0 && stage->unk5B4 != 7) {
            stage->unk5B4 = 6;
        }

        sub_806E4FC(stage);
        unkBD94->unkA5A = (unkBD94->unkA5A + 1) & 1;
        
        if (unkBD94->unk874[unkBD94->unkA5A].unk12 == 1) {
            sub_806E584(0, &unkBD94->unk874[unkBD94->unkA5A]);
        }
        if (unkBD94->unk874[unkBD94->unkA5A + 2].unk12 == 1) {
            sub_806E584(1, &unkBD94->unk874[unkBD94->unkA5A + 2]);
        }
        if (unkBD94->unk874[unkBD94->unkA5A + 4].unk12 == 1) {
            sub_806E584(2, &unkBD94->unk874[unkBD94->unkA5A + 4]);
        }
        if (unkBD94->unk874[unkBD94->unkA5A + 6].unk12 == 1) {
            sub_806E584(3, &unkBD94->unk874[unkBD94->unkA5A + 6]);
        }
    }
    sub_806DEA4();
}


struct UNK_8C878E8 {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s8 unk6;
    s8 unk7;
}; /* size 0x8 */

extern const struct UNK_8C878E8** const gUnknown_08C878E8[7];

void sub_806DC98(void) {
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkBD94->unk0;
    const struct UNK_8C878E8** unk78E8_vals = gUnknown_08C878E8[stage->unk5B8];
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);

    s32 val1 = player->unkA8 >> 0x10;
    s32 val2 = player->unkAC >> 0x10;
    s32 val3 = player->unkB0 >> 4;
    u32 index = ((player->unkA8 >> 0x17) * 8) + (player->unkAC >> 0x17);
    const struct UNK_8C878E8* unk78E8 = unk78E8_vals[index];

    while (unk78E8->unk0 != -1) {
        if (unkBD94->unk914[unk78E8->unk0] == 1) {
            s16 temp2 = unk78E8->unk4;
            s16 temp = unk78E8->unk6 << 4;
            s16 temp3 = unk78E8->unk2;
            if (
                temp3 > (val1 - 5) && temp3 < (val1 + 5) && 
                temp2 > (val2 - 5) && temp2 < (val2 + 5) && 
                temp >= (val3 - 0xC) && temp <= (val3 + 0x14)
            ) {
                s16 before = player->unkC0;
                if (unk78E8->unk7 == 0) {
                    sub_806D890(stage, player->unkC0);
                } else {
                    sub_806D890(stage, player->unkC0 * 5);
                }

                if (player->unkC0 < 9) {
                    player->unkBC = 0x3C;
                    player->unkBE++;
                    player->unkC0 = (player->unkBE / 6) + 1;
                }

                if (before != player->unkC0) {
                    m4aSongNumStart(SE_274);
                } else {
                    m4aSongNumStart(SE_RING_COPY);
                }

                unkBD94->unk914[unk78E8->unk0] = 3;
            }
        }
        unk78E8++;
    }
}

extern const s16 gUnknown_080DF6CC[7];

bool16 sub_806DE10(void) {
    s16 i;
    u16 result;
    s16 unkF6CC[7];
    s16 val;
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkBD94->unk0;
    result = FALSE;
    memcpy(unkF6CC, gUnknown_080DF6CC, 0xE);

    val = unkF6CC[stage->unk5B8];
    for (i = 0; i < val; i++) {
        if (unkBD94->unk914[i] > 2) {
            unkBD94->unk914[i]++;
            if (unkBD94->unk914[i] > 17) {
                unkBD94->unk914[i] = 0;
            }
        }

        if (result == FALSE && unkBD94->unk914[i] != 0) {
            result = TRUE;
        }
    }

    return result;
}

// Maybe same as UNK_806BD94_UNK874 or UNK_806CB84
struct UNK_806DEA4 {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    s16 unk10;
    s16 unk12;
}; /* size 0x14 */

s16 sub_806E038(s16 acc, const struct UNK_8C878E8*, struct UNK_806DEA4*);

void sub_806E1AC(s16, struct UNK_806DEA4*);

void sub_806DEA4(void) {
    s16 i;

    s16 val1;
    s16 val2;
    s16 acc;
    s16 index;

    struct UNK_806DEA4 DEA4_Arr[16];
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkBD94->unk0;
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);
    const struct UNK_8C878E8** unk78E8_vals = gUnknown_08C878E8[stage->unk5B8];
    const struct UNK_8C878E8** unk78E8;
    const struct UNK_8C878E8* unk78E8_val = NULL;

    struct UNK_806DEA4* unkDEA4_1;

    acc = 0;
    for (i = 0, unkDEA4_1 = DEA4_Arr; i < 16; i++, unkDEA4_1++) {
        unkDEA4_1->unk0 = 0;
    }

    val1 = player->unkA8 >> 0x17;
    val2 = player->unkAC >> 0x17;
    index = (val1 * 8) + val2;

    unk78E8_val = unk78E8_vals[index]; 
    acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);

    if (val2 != 7) {
        unk78E8_val = unk78E8_vals[index + 1]; 
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
    }

    if (val2 != 0) {
        unk78E8_val = unk78E8_vals[index - 1]; 
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
    }

    if (val1 != 7) {
        s16 idx = index + 8;
        unk78E8_val = unk78E8_vals[idx];
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);

        if (val2 != 7) {
            unk78E8_val = unk78E8_vals[idx + 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }


        if (val2 != 0) {
            unk78E8_val = unk78E8_vals[idx - 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }
    }

    if (val1 != 0) {
        s16 idx = index - 8;
        unk78E8_val = unk78E8_vals[idx];
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);

        if (val2 != 7) {
            unk78E8_val = unk78E8_vals[idx + 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }

        if (val2 != 0) {
            unk78E8_val = unk78E8_vals[idx - 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }
    }

    unkDEA4_1 = DEA4_Arr;
    for (i = 0; i < acc; i++, unkDEA4_1++) {
        sub_806E1AC(i, unkDEA4_1);
    }
}

s16 sub_806E038(s16 acc, const struct UNK_8C878E8* unk78E8, struct UNK_806DEA4* unkDEA4Arr) {
    s16 i, result;

    struct UNK_806BD94_UNK874 new_unk874;
    struct UNK_806CB84 new_unkCB84;

    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    const struct UNK_8C878E8* val = unk78E8;
    struct UNK_806DEA4* found = NULL;

    result = acc;
    while (val->unk0 != -1) {
        if (unkBD94->unk914[val->unk0] != 0) {
            new_unk874.unk0 = val->unk2 << 0x10;
            new_unk874.unk4 = val->unk4 << 0x10;
            // TODO: resolve
            *(s32*)&new_unk874.unk8 = val->unk6 << 0x10;
            new_unk874.unkC = 8;
            new_unk874.unkE = 8;
            new_unk874.unk10 = 0;
            // TODO: resolve
            *(s16*)&new_unk874.unk12 = 5;
            if (sub_806CB84(&new_unkCB84, &new_unk874, unkBD94->unk0)) {
                if (result < 0x10) {
                    memcpy(&unkDEA4Arr[result], &new_unkCB84, sizeof(new_unkCB84));

                    if (unkBD94->unk914[val->unk0] >= 3) {
                        unkDEA4Arr[result].unk0 = unkBD94->unk914[val->unk0];
                    } else {
                        unkDEA4Arr[result].unk0 = val->unk7 + 1;
                    }
                
                    result++;
                } else {
                    s16 min;
                    struct UNK_806DEA4* unkDEA4;

                    for (i = 0, unkDEA4 = unkDEA4Arr, min = 0x7FFF; i < 0x10; i++, unkDEA4++) {
                        if (unkDEA4->unk4 < min) {
                            min = unkDEA4->unk4;
                            found = unkDEA4;
                        }
                    }

                    if (new_unkCB84.unk4 > min) {
                        memcpy(found, &new_unkCB84, sizeof(new_unkCB84));
                        if (unkBD94->unk914[val->unk0] >= 3) {
                            found->unk0 = unkBD94->unk914[val->unk0];
                        } else {
                            found->unk0 = val->unk7 + 1;
                        }
                    }
                }
            }
        }
        val++;
    }

    return result;
}

void sub_806E1AC(s16 index, struct UNK_806DEA4* unkDEA4) {
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkBD94->unk0;

    struct UNK_0808B3FC_UNK240* element1 = &unkBD94->unk1B4[index];
    struct UNK_0808B3FC_UNK240* element2 = &unkBD94->unk4B4[index];
    u16* affine;

    if (unkDEA4->unk0 > 2) {
        s16 idx = unkDEA4->unk0 - 3;
        memcpy(element1, &unkBD94->unkF4[idx >> 2], sizeof(struct UNK_0808B3FC_UNK240));

        element1->unk10 = index | 0x1060 | 0xC0000;
        element1->unk16 = unkDEA4->unk2;
        element1->unk18 = unkDEA4->unk4 - unkDEA4->unk6;
        element1->unk1A = (unkDEA4->unk4 < (stage->unk5CC - 0xF)) ? 0x340 : 0x180;
    } else {
        s16 x, y;
        struct UNK_0808B3FC_UNK240* reference;
        if (unkDEA4->unk6 == 0) {
            reference = unkDEA4->unk0 == 1 ? &unkBD94->unk4 : &unkBD94->unk94;
            x = unkDEA4->unk2;
            y = unkDEA4->unk4;
        } else {
            memcpy(element2, &unkBD94->unk64, sizeof(struct UNK_0808B3FC_UNK240));
            element2->unk10 = index | 0x1060 | 0xC0000;
            element2->unk16 = unkDEA4->unk2;
            element2->unk18 = ((0xD - ((0x78 - unkDEA4->unk4) >> 5)) >> 1) + unkDEA4->unk4;
            element2->unk1A = (unkDEA4->unk4 < (stage->unk5CC - 0xF)) ? 0x380 : 0x1C0;
            sub_806CD68(element2);
    
            reference = unkDEA4->unk0 == 1 ? &unkBD94->unk34 : &unkBD94->unkC4;
            x = unkDEA4->unk2;
            y = unkDEA4->unk4 - unkDEA4->unk6;
        }
        memcpy(element1, reference, sizeof(struct UNK_0808B3FC_UNK240));
        element1->unk10 = index | 0x1060 | 0xC0000;
        element1->unk16 = x;
        element1->unk18 = y;
        element1->unk1A = (unkDEA4->unk4 < (stage->unk5CC - 0xF)) ? 0x340 : 0x180;
    }

    sub_806CD68(element1);
    affine = &gOamBuffer[index * 4].all.affineParam;
    *affine = unkDEA4->unkC;
    affine += 4;
    *affine = unkDEA4->unkE;
    affine += 4;
    *affine = unkDEA4->unk10;
    affine += 4;
    *affine = unkDEA4->unk12;
}

void sub_806E3B8(struct SpecialStage* stage, s16 mode) {
    s16 i, j;
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(stage->unk8);
    struct UNK_806CF78* player = TaskGetStructPtr(stage->unkC);

    s32 unkA8 = player->unkA8;
    s32 unkAC = player->unkAC;
    s32 unkB0 = player->unkB0;
    s16 temp;

    if (mode == -1) {
        temp = stage->unk5A4 > 8 ? 8 : stage->unk5A4;
    } else {
        temp = mode;
    }

    for (i = 0; i < temp; i++) {
        s32 rand1, rand2, rand3;
        s32 sin1, sin2;
        s32 temp3, temp4;
        struct UNK_806BD94_UNK874* unk874 = &unkBD94->unk874[i];
        unk874->unk0 = unkA8;
        unk874->unk4 = unkAC;
        unk874->unk8 = unkB0;

        rand1 = Random() & 0x3FF;
        rand2 = (Random() & 0x7F) + 0x40;
        rand3 = (Random() & 0x3FF) | 0x400;

        sin2 = gSineTable[rand1] << 2;
        sin1 = gSineTable[rand1 + 0x100] << 2;
        
        temp3 = (rand2 * sin2) >> 0x10;
        temp4 = (rand2 * sin1) >> 0x10;

        unk874->unkA = temp3;
        unk874->unkC = temp4;
        unk874->unkE = rand3;
        unk874->unk10 = 0xFF80;
        unk874->unk12 = 1;
        unk874->unk13 = 0;
    }

    for (j = i; j < 8; j++) {
        struct UNK_806BD94_UNK874* unk874 = &unkBD94->unk874[j];
        unk874->unk12 = 0;
    }
}

void sub_806E4FC(struct SpecialStage* stage) {
    s16 i;
    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(stage->unk8);

    for (i = 0; i < 8; i++) {
        struct UNK_806BD94_UNK874* unk874 = &unkBD94->unk874[i];
        if (unk874->unk12 != 0) {
            unk874->unk0 += (unk874->unkA) * 0x100;
            unk874->unk4 += (unk874->unkC) * 0x100;
            unk874->unk8 += unk874->unkE;

            if (unk874->unk8 < 1) {
                s16 unkE;
                unk874->unk8 = 0;
                unkE = unk874->unkE;
                unk874->unkE = -unkE;
            }
            unk874->unkE += unk874->unk10;
            unk874->unk13++;

            if (unk874->unk13 > 0x1D) {
                unk874->unk12 = 0;
            }
        }
    }
}

void sub_806E584(s16 index, struct UNK_806BD94_UNK874* unk874) {
    u16* affine;
    struct UNK_806BD94_UNK874 new_unk874;
    struct UNK_806CB84 new_unkCB84;

    struct UNK_806BD94* unkBD94 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkBD94->unk0;

    struct UNK_0808B3FC_UNK240* unk7B4 = &unkBD94->unk7B4[index];

    new_unk874.unk0 = unk874->unk0;
    new_unk874.unk4 = unk874->unk4;
    // TODO: resolve
    *(s32*)&new_unk874.unk8 = unk874->unk8 << 4;
    new_unk874.unkC = 8;
    new_unk874.unkE = 8;
    new_unk874.unk10 = 0;
    // TODO: resolve
    *(s16*)&new_unk874.unk12 = 5;
    

    if (sub_806CB84(&new_unkCB84, &new_unk874, unkBD94->unk0)) {
        s32 unk2 = new_unkCB84.unk2;
        s32 unk4 = new_unkCB84.unk4;
        s32 unk6 = unk4 - new_unkCB84.unk6;
        
        memcpy(unk7B4, &unkBD94->unk34, sizeof(unkBD94->unk34));
        
        unk7B4->unk10 = (index + 0x10) | 0x1060 | 0xC0000;
        unk7B4->unk16 = unk2;
        unk7B4->unk18 = unk6;
        unk7B4->unk1A = (new_unkCB84.unk4 < (stage->unk5CC - 0xF)) ? 0x340 : 0x180;
        sub_806CD68(unk7B4);
    
        affine = &gOamBuffer[(index + 0x10) * 4].all.affineParam;
        *affine = new_unkCB84.unkC;
        affine += 4;
        *affine = new_unkCB84.unkE;
        affine += 4;
        *affine = new_unkCB84.unk10;
        affine += 4;
        *affine = new_unkCB84.unk12;
    }
}

struct Task* sub_806E684(struct SpecialStage* stage) {
    s16 unkF6CC[7];
    struct Task* t;
    struct UNK_806BD94* unkBD94;
    memcpy(unkF6CC, gUnknown_080DF6CC, 0xE);
    
    t = TaskCreate(sub_806D9B4, 0xA5C, 0xB000, 0, NULL);
    unkBD94 = TaskGetStructPtr(t);
    unkBD94->unk0 = stage;
    unkBD94->unkA58 = unkF6CC[stage->unk5B8];
    unkBD94->unkA5A = 0;

    return t;
}
