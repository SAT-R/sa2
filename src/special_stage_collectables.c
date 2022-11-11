#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_collectables.h"
#include "special_stage_data.h"
#include "task.h"
#include "m4a.h"
#include "trig.h"
#include "random.h"
#include "constants/songs.h"
#include "zones.h"

// Maybe same as SpecialStageCollectables_UNK874 or UNK_806CB84
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

static void AnimateRingsLost(struct SpecialStage *stage, s16);
void sub_806DB48(void);
void sub_806DC98(void);
bool16 sub_806DE10(void);
void sub_806E4FC(struct SpecialStage *stage);
void sub_806E584(s16, struct SpecialStageCollectables_UNK874 *);
void sub_806DEA4(void);
s16 sub_806E038(s16 acc, const struct UNK_8C878E8 *, struct UNK_806DEA4 *);
void sub_806E1AC(s16, struct UNK_806DEA4 *);

const s16 gUnknown_080DF6CC[NUM_COURSE_ZONES] = {
    [ZONE_1] = 0x130, [ZONE_2] = 0x128, [ZONE_3] = 0x110, [ZONE_4] = 0x128,
    [ZONE_5] = 0x143, [ZONE_6] = 0x11C, [ZONE_7] = 0x10B,
};

void SpecialStageHandleCollectRings(struct SpecialStage *stage, s16 num)
{
    s16 i;
    stage->rings += num;

    if (stage->rings > 999) {
        stage->rings = 999;
    }

    for (i = 0; i < num; i++) {
        stage->ringsUnits++;
        if (stage->ringsUnits <= 9) {
            continue;
        }
        stage->ringsUnits = 0;

        stage->ringsTens++;
        if (stage->ringsTens <= 9) {
            continue;
        }
        stage->ringsTens = 0;

        stage->ringsHundreds++;
        if (stage->ringsHundreds <= 9) {
            continue;
        }

        stage->ringsHundreds = 9;
        stage->ringsTens = 9;
        stage->ringsUnits = 9;
    }
}

void SpecialStageHandleLoseRings(struct SpecialStage *stage, s16 num)
{
    s16 i;
    AnimateRingsLost(stage, -1);

    stage->rings -= num;
    if (stage->rings < 0) {
        stage->rings = 0;
    }

    for (i = num; i > 0; i--) {
        stage->ringsUnits--;
        if (stage->ringsUnits >= 0) {
            continue;
        }
        stage->ringsUnits = 9;

        stage->ringsTens--;
        if (stage->ringsTens >= 0) {
            continue;
        }
        stage->ringsTens = 9;

        stage->ringsHundreds--;
        if (stage->ringsHundreds >= 0) {
            continue;
        }

        stage->ringsHundreds = 0;
        stage->ringsTens = 0;
        stage->ringsUnits = 0;
    }
}

void Task_InitObjects(void)
{
    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    s16 i;

    for (i = 0; i < MAX_OBJECTS; i++) {
        collectables->objStates[i] = 1;
    }

    collectables->animFrame = 0;

    sub_806CA88(&collectables->unk4, RENDER_TARGET_SCREEN, 4, 0x372, 0x3000, 0x14, 0x14,
                0xe, 1, 0);
    sub_806CA88(&collectables->unk34, RENDER_TARGET_SCREEN, 0x10, 0x372, 0x3000, 0x14,
                0x14, 0xe, 0, 0);
    sub_806CA88(&collectables->unk64, RENDER_TARGET_SCREEN, 4, 0x374, 0x3000, 0x14, 0x1e,
                0xf, 1, 0);
    sub_806CA88(&collectables->unk94, RENDER_TARGET_SCREEN, 4, 0x372, 0x3000, 0x14, 0x14,
                0xe, 6, 0);
    sub_806CA88(&collectables->unkC4, RENDER_TARGET_SCREEN, 4, 0x372, 0x3000, 0x14, 0x14,
                0xe, 5, 0);
    sub_806CA88(&collectables->unkF4[0], RENDER_TARGET_SCREEN, 4, 0x37b, 0x3000, 0x14,
                0x14, 0xe, 0, 0);
    sub_806CA88(&collectables->unkF4[1], RENDER_TARGET_SCREEN, 4, 0x37b, 0x3000, 0x14,
                0x14, 0xe, 1, 0);
    sub_806CA88(&collectables->unkF4[2], RENDER_TARGET_SCREEN, 4, 0x37b, 0x3000, 0x14,
                0x14, 0xe, 2, 0);
    sub_806CA88(&collectables->unkF4[3], RENDER_TARGET_SCREEN, 4, 0x37b, 0x3000, 0x14,
                0x14, 0xe, 3, 0);

    gCurTask->main = sub_806DB48;
}

void sub_806DB48(void)
{
    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = collectables->stage;
    if (stage->paused == FALSE) {
        sub_8004558(&collectables->unk4);
        sub_8004558(&collectables->unk64);
        sub_8004558(&collectables->unk34);
        sub_8004558(&collectables->unk94);
        sub_8004558(&collectables->unkC4);

        sub_806DC98();

        if (sub_806DE10() == FALSE && stage->state != 7) {
            stage->state = 6;
        }

        sub_806E4FC(stage);
        collectables->animFrame = (collectables->animFrame + 1) & 1;

        if (collectables->unk874[collectables->animFrame].unk12 == 1) {
            sub_806E584(0, &collectables->unk874[collectables->animFrame]);
        }
        if (collectables->unk874[collectables->animFrame + 2].unk12 == 1) {
            sub_806E584(1, &collectables->unk874[collectables->animFrame + 2]);
        }
        if (collectables->unk874[collectables->animFrame + 4].unk12 == 1) {
            sub_806E584(2, &collectables->unk874[collectables->animFrame + 4]);
        }
        if (collectables->unk874[collectables->animFrame + 6].unk12 == 1) {
            sub_806E584(3, &collectables->unk874[collectables->animFrame + 6]);
        }
    }
    sub_806DEA4();
}

void sub_806DC98(void)
{
    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = collectables->stage;
    const struct UNK_8C878E8 **unk78E8_vals = gUnknown_08C878E8[stage->zone];
    struct SpecialStagePlayer *player = TaskGetStructPtr(stage->playerTask);

    s32 playerX = Q_16_16_TO_INT(player->x);
    s32 playerY = Q_16_16_TO_INT(player->y);
    s32 val3 = player->unkB0 >> 4;
    u32 cell = ((Q_16_16_TO_INT(player->x) >> 7) * SPECIAL_STAGE_ZONE_SIZE)
        + (Q_16_16_TO_INT(player->y) >> 7);
    const struct UNK_8C878E8 *object = unk78E8_vals[cell];

    while (object->id != -1) {
        if (collectables->objStates[object->id] == 1) {
            s16 temp2 = object->y;
            s16 temp = object->unk6 << 4;
            s16 temp3 = object->x;
            if (temp3 > (playerX - 5) && temp3 < (playerX + 5) && temp2 > (playerY - 5)
                && temp2 < (playerY + 5) && temp >= (val3 - 12) && temp <= (val3 + 20)) {
                s16 prevMultiplier = player->multiplier;
                if (object->unk7 == 0) {
                    SpecialStageHandleCollectRings(stage, player->multiplier);
                } else {
                    SpecialStageHandleCollectRings(stage, player->multiplier * 5);
                }

                if (player->multiplier < 9) {
                    player->unkBC = 60;
                    player->unkBE++;
                    player->multiplier = (player->unkBE / 6) + 1;
                }

                if (prevMultiplier != player->multiplier) {
                    m4aSongNumStart(SE_274);
                } else {
                    m4aSongNumStart(SE_RING_COPY);
                }

                collectables->objStates[object->id] = 3;
            }
        }
        object++;
    }
}

bool16 sub_806DE10(void)
{
    s16 i;
    u16 result;
    s16 unkF6CC[NUM_COURSE_ZONES];
    s16 val;
    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = collectables->stage;
    result = FALSE;
    memcpy(unkF6CC, gUnknown_080DF6CC, sizeof(gUnknown_080DF6CC));

    val = unkF6CC[stage->zone];
    for (i = 0; i < val; i++) {
        if (collectables->objStates[i] > 2) {
            collectables->objStates[i]++;
            if (collectables->objStates[i] > 17) {
                collectables->objStates[i] = 0;
            }
        }

        if (!result && collectables->objStates[i] != 0) {
            result = TRUE;
        }
    }

    return result;
}

void sub_806DEA4(void)
{
    s16 i;

    s16 stageZoneX;
    s16 stageZoneY;
    s16 acc;
    s16 cell;

    struct UNK_806DEA4 DEA4_Arr[16];
    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = collectables->stage;
    struct SpecialStagePlayer *player = TaskGetStructPtr(stage->playerTask);
    const struct UNK_8C878E8 **unk78E8_vals = gUnknown_08C878E8[stage->zone];
    const struct UNK_8C878E8 **unk78E8;
    const struct UNK_8C878E8 *unk78E8_val = NULL;

    struct UNK_806DEA4 *unkDEA4_1;

    acc = 0;
    for (i = 0, unkDEA4_1 = DEA4_Arr; i < 16; i++, unkDEA4_1++) {
        unkDEA4_1->unk0 = 0;
    }

    stageZoneX = Q_16_16_TO_INT(player->x) >> 7;
    stageZoneY = Q_16_16_TO_INT(player->y) >> 7;
    cell = (stageZoneX * 8) + stageZoneY;

    unk78E8_val = unk78E8_vals[cell];
    acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);

    if (stageZoneY != 7) {
        unk78E8_val = unk78E8_vals[cell + 1];
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
    }

    if (stageZoneY != 0) {
        unk78E8_val = unk78E8_vals[cell - 1];
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
    }

    if (stageZoneX != 7) {
        s16 idx = cell + 8;
        unk78E8_val = unk78E8_vals[idx];
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);

        if (stageZoneY != 7) {
            unk78E8_val = unk78E8_vals[idx + 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }

        if (stageZoneY != 0) {
            unk78E8_val = unk78E8_vals[idx - 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }
    }

    if (stageZoneX != 0) {
        s16 idx = cell - 8;
        unk78E8_val = unk78E8_vals[idx];
        acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);

        if (stageZoneY != 7) {
            unk78E8_val = unk78E8_vals[idx + 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }

        if (stageZoneY != 0) {
            unk78E8_val = unk78E8_vals[idx - 1];
            acc = sub_806E038(acc, unk78E8_val, DEA4_Arr);
        }
    }

    unkDEA4_1 = DEA4_Arr;
    for (i = 0; i < acc; i++, unkDEA4_1++) {
        sub_806E1AC(i, unkDEA4_1);
    }
}

s16 sub_806E038(s16 acc, const struct UNK_8C878E8 *unk78E8,
                struct UNK_806DEA4 *unkDEA4Arr)
{
    s16 i, result;

    struct SpecialStageCollectables_UNK874_2 new_unk874;
    struct UNK_806CB84 new_unkCB84;

    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    const struct UNK_8C878E8 *object = unk78E8;
    struct UNK_806DEA4 *found = NULL;

    result = acc;
    while (object->id != -1) {
        if (collectables->objStates[object->id] != 0) {
            new_unk874.unk0 = Q_16_16(object->x);
            new_unk874.unk4 = Q_16_16(object->y);
            new_unk874.unk8 = Q_16_16(object->unk6);
            new_unk874.unkC = 8;
            new_unk874.unkE = 8;
            new_unk874.unk10 = 0;
            new_unk874.unk12 = 5;
            if (sub_806CB84(&new_unkCB84, &new_unk874, collectables->stage)) {
                if (result < 16) {
                    memcpy(&unkDEA4Arr[result], &new_unkCB84, sizeof(new_unkCB84));

                    if (collectables->objStates[object->id] >= 3) {
                        unkDEA4Arr[result].unk0 = collectables->objStates[object->id];
                    } else {
                        unkDEA4Arr[result].unk0 = object->unk7 + 1;
                    }

                    result++;
                } else {
                    s16 min;
                    struct UNK_806DEA4 *unkDEA4;

                    for (i = 0, unkDEA4 = unkDEA4Arr, min = 0x7FFF; i < 0x10;
                         i++, unkDEA4++) {
                        if (unkDEA4->unk4 < min) {
                            min = unkDEA4->unk4;
                            found = unkDEA4;
                        }
                    }

                    if (new_unkCB84.screenY > min) {
                        memcpy(found, &new_unkCB84, sizeof(new_unkCB84));
                        if (collectables->objStates[object->id] >= 3) {
                            found->unk0 = collectables->objStates[object->id];
                        } else {
                            found->unk0 = object->unk7 + 1;
                        }
                    }
                }
            }
        }
        object++;
    }

    return result;
}

void sub_806E1AC(s16 index, struct UNK_806DEA4 *unkDEA4)
{
    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = collectables->stage;

    struct UNK_0808B3FC_UNK240 *element1 = &collectables->unk1B4[index];
    struct UNK_0808B3FC_UNK240 *element2 = &collectables->unk4B4[index];
    u16 *affine;

    if (unkDEA4->unk0 > 2) {
        s16 idx = unkDEA4->unk0 - 3;
        memcpy(element1, &collectables->unkF4[idx >> 2],
               sizeof(struct UNK_0808B3FC_UNK240));

        element1->unk10 = index | 0x1060 | 0xC0000;
        element1->unk16 = unkDEA4->unk2;
        element1->unk18 = unkDEA4->unk4 - unkDEA4->unk6;
        element1->unk1A = (unkDEA4->unk4 < (stage->unk5CC - 0xF)) ? 0x340 : 0x180;
    } else {
        s16 x, y;
        struct UNK_0808B3FC_UNK240 *reference;
        if (unkDEA4->unk6 == 0) {
            reference = unkDEA4->unk0 == 1 ? &collectables->unk4 : &collectables->unk94;
            x = unkDEA4->unk2;
            y = unkDEA4->unk4;
        } else {
            memcpy(element2, &collectables->unk64, sizeof(struct UNK_0808B3FC_UNK240));
            element2->unk10 = index | 0x1060 | 0xC0000;
            element2->unk16 = unkDEA4->unk2;
            element2->unk18
                = ((0xD - ((0x78 - unkDEA4->unk4) >> 5)) >> 1) + unkDEA4->unk4;
            element2->unk1A = (unkDEA4->unk4 < (stage->unk5CC - 0xF)) ? 0x380 : 0x1C0;
            sub_806CD68(element2);

            reference = unkDEA4->unk0 == 1 ? &collectables->unk34 : &collectables->unkC4;
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

static void AnimateRingsLost(struct SpecialStage *stage, s16 numLost)
{
    s16 i, j;
    struct SpecialStageCollectables *collectables
        = TaskGetStructPtr(stage->collectablesTask);
    struct SpecialStagePlayer *player = TaskGetStructPtr(stage->playerTask);

    s32 x = player->x;
    s32 y = player->y;
    s32 unkB0 = player->unkB0;
    s16 temp;

    if (numLost == -1) {
        temp = stage->rings > 8 ? 8 : stage->rings;
    } else {
        temp = numLost;
    }

    for (i = 0; i < temp; i++) {
        s32 rand1, rand2, rand3;
        s32 cos, sin;
        s32 temp3, temp4;
        struct SpecialStageCollectables_UNK874 *unk874 = &collectables->unk874[i];
        unk874->unk0 = x;
        unk874->unk4 = y;
        unk874->unk8 = unkB0;

        rand1 = Random() & 0x3FF;
        rand2 = (Random() & 0x7F) + 0x40;
        rand3 = (Random() & 0x3FF) | 0x400;

        sin = SIN(rand1) * 4;
        cos = COS(rand1) * 4;

        temp3 = Q_16_16_TO_INT(rand2 * sin);
        temp4 = Q_16_16_TO_INT(rand2 * cos);

        unk874->unkA = temp3;
        unk874->unkC = temp4;
        unk874->unkE = rand3;
        unk874->unk10 = 0xFF80;
        unk874->unk12 = 1;
        unk874->unk13 = 0;
    }

    for (j = i; j < 8; j++) {
        struct SpecialStageCollectables_UNK874 *unk874 = &collectables->unk874[j];
        unk874->unk12 = 0;
    }
}

void sub_806E4FC(struct SpecialStage *stage)
{
    s16 i;
    struct SpecialStageCollectables *collectables
        = TaskGetStructPtr(stage->collectablesTask);

    for (i = 0; i < 8; i++) {
        struct SpecialStageCollectables_UNK874 *unk874 = &collectables->unk874[i];
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

void sub_806E584(s16 index, struct SpecialStageCollectables_UNK874 *unk874)
{
    u16 *affine;
    bool16 visible;
    struct SpecialStageCollectables_UNK874_2 new_unk874;
    struct UNK_806CB84 new_unkCB84;

    struct SpecialStageCollectables *collectables = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = collectables->stage;

    struct UNK_0808B3FC_UNK240 *unk7B4 = &collectables->unk7B4[index];

    new_unk874.unk0 = unk874->unk0;
    new_unk874.unk4 = unk874->unk4;
    new_unk874.unk8 = unk874->unk8 << 4;
    new_unk874.unkC = 8;
    new_unk874.unkE = 8;
    new_unk874.unk10 = 0;
    new_unk874.unk12 = 5;

    visible = sub_806CB84(&new_unkCB84, &new_unk874, collectables->stage);
    if (visible) {
        s32 screenX = new_unkCB84.screenX;
        s32 unk4 = new_unkCB84.screenY;
        s32 screenY = unk4 - new_unkCB84.unk6;

        *unk7B4 = collectables->unk34;

        unk7B4->unk10 = (index + 0x10) | 0x1060 | 0xC0000;
        unk7B4->unk16 = screenX;
        unk7B4->unk18 = screenY;
        unk7B4->unk1A = (new_unkCB84.screenY < (stage->unk5CC - 15)) ? 0x340 : 0x180;
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

struct Task *CreateSpecialStageCollectables(struct SpecialStage *stage)
{
    s16 unkF6CC[7];
    struct Task *t;
    struct SpecialStageCollectables *collectables;
    memcpy(unkF6CC, gUnknown_080DF6CC, 0xE);

    t = TaskCreate(Task_InitObjects, 0xA5C, 0xB000, 0, NULL);
    collectables = TaskGetStructPtr(t);
    collectables->stage = stage;
    collectables->unkA58 = unkF6CC[stage->zone];
    collectables->animFrame = 0;

    return t;
}
