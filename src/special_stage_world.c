#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_utils.h"
#include "special_stage_world.h"
#include "special_stage_guard_robo.h"
#include "special_stage_data.h"
#include "task.h"
#include "m4a.h"
#include "save.h"
#include "trig.h"
#include "game.h"
#include "malloc_ewram.h"
#include "zones.h"
#include "constants/songs.h"

void sub_806EA04(void);
void sub_806E7C0(struct SpecialStageWorld *world);
void sub_806EBF4(struct Task *);
void sub_806E94C(struct SpecialStageWorld *world);
void sub_806EB74(void);

// No idea why this has to be specified as, should be by default
ALIGNED(4)
static const s16 gUnknown_080DF6DC[8] = {
    [ZONE_1] = 1, [ZONE_2] = 7, [ZONE_3] = 5, [ZONE_4] = 1,
    [ZONE_5] = 7, [ZONE_6] = 5, [ZONE_7] = 5,
};

// used in gUnknown_08C87920, maybe incbinned?
const struct UNK_8C87920 gUnknown_080DF6EC[] = {
    /** ZONE_1 (0) **/
    { 909, 0 },

    /** ZONE_2 (1) **/
    { 915, 0 },
    { 916, 0 },
    { 917, 0 },
    { 918, 0 },
    { 919, 0 },
    { 920, 0 },
    { 921, 0 },

    /** ZONE_3 (8) **/
    { 935, 0 },
    { 936, 0 },
    { 937, 0 },
    { 938, 0 },
    { 939, 0 },

    /** ZONE_4 (13) **/
    { 922, 0 },

    /** ZONE_5 (14) **/
    { 923, 0 },
    { 924, 0 },
    { 925, 0 },
    { 926, 0 },
    { 927, 0 },
    { 928, 0 },
    { 929, 0 },

    /** ZONE_6 (21) **/
    { 930, 0 },
    { 931, 0 },
    { 932, 0 },
    { 933, 0 },
    { 934, 0 },

    /** ZONE_7 (26) **/
    { 910, 0 },
    { 911, 0 },
    { 912, 0 },
    { 913, 0 },
    { 914, 0 },
};

static const s16 gUnknown_080DF768[7] = {
    154, 156, 158, 160, 162, 164, 166,
};
static const s16 gUnknown_080DF776[7] = {
    153, 155, 157, 159, 161, 163, 165,
};

static const s16 gUnknown_080DF784[8] = {
    0, 256, 0, 0, 0, 256, 0, 256,
};

struct Task *CreateSpecialStageWorld(struct SpecialStage *stage)
{
    s16 unkF768[7];
    s16 unkF776[7];
    struct Task *t;
    struct SpecialStageWorld *world;

    memcpy(unkF768, gUnknown_080DF768, sizeof(gUnknown_080DF768));
    memcpy(unkF776, gUnknown_080DF776, sizeof(gUnknown_080DF776));

    t = TaskCreate(sub_806EA04, 0x2A0, 0x8000, 0, sub_806EBF4);
    world = TaskGetStructPtr(t);
    world->stage = stage;

    world->unk4 = NULL;
    world->unk8 = NULL;
    world->unkC = NULL;

    sub_806CEC4(&world->unk10, 1, 0x10, unkF776[stage->zone], 0x80, 0x80, 0, 2, 0, 0);
    sub_806CEC4(&world->unk50, 0, 7, unkF768[stage->zone], 0x20, 0x20, 0, 1, 0, 0);

    sub_806E7C0(world);

    return t;
}

void sub_806E7C0(struct SpecialStageWorld *world)
{
    s16 i;
    struct SpecialStage *stage = world->stage;
    s32 temp = Q_16_16((stage->unk5CC - stage->unk5D0));

    s16 unkF784[8];
    s16 unk5CE;
    s32 *unk94;
    s32 *unk8;
    s16 *unk4;
    s32 *unkC;

    world->unkC = EwramMalloc(0x280);
    for (i = 0, unkC = world->unkC; i < 0xA0; i++, unkC++) {
        s32 temp2 = (i - stage->unk5D0);
        if (temp2 == 0) {
            *unkC = 0;
        } else {
            *unkC = temp / temp2;
        }
    }

    world->unk8 = EwramMalloc(0x280);
    for (i = 0, unk8 = world->unk8; i < 0xA0; i++, unk8++) {
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
        s32 temp2 = (world->unkC[i] * unk5CE) >> 8;
        s32 temp3 = (-stage->unk5CA * temp2);
        s32 temp4 = (((i - stage->unk5CC) * temp2));
        *unk94++ = (-(temp3 << 1) >> 8) * unk5CE;
        *unk94++ = (-(temp4 << 2) >> 8) * unk5CE;
    }

    world->unk4 = EwramMalloc(0xA00);
    gUnknown_03001884 = world->unk4;
    gUnknown_03004D54 = world->unk4;
    gUnknown_030022C0 = world->unk4;
    unk4 = world->unk4;

    memcpy(unkF784, gUnknown_080DF784, sizeof(gUnknown_080DF784));
    for (i = 0; i < 0xA0; i++, unk4 += ARRAY_COUNT(unkF784)) {
        memcpy(unk4, unkF784, sizeof(unkF784));
        *(unk4 + 2) = i << 8;
    }

    sub_806E94C(world);
}

void sub_806E94C(struct SpecialStageWorld *world)
{
    s16 i;
    // Maybe some macro? Who knows...
    u8 *zone = &world->stage->zone;
    const struct UNK_8C87920 *assets = gUnknown_08C87920[*zone];
    s16 num = gUnknown_080DF6DC[*zone];

    for (i = 0; i < num; i++) {
        Sprite *element = &world->unk90[i];
        element->graphics.dest = gUnknown_03005B5C;
        element->graphics.size = 0;
        element->graphics.anim = assets[i].anim;
        element->unk10 = 0x80000;
        element->x = 0;
        element->y = 0;
        element->unk1A = 0;
        element->unk1C = 0;
        element->unk1E = 0xffff;
        element->variant = assets[i].variant;
        element->unk21 = 0xff;
        element->unk22 = 16;
        element->focused = 0;
        element->unk28[0].unk0 = -1;
        sub_80036E0(element);
    }
}

void sub_806EA04(void)
{
    struct SpecialStageWorld *world = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = world->stage;
    s32 sin1, sin2;
    s16 unk5CE;
    s32 unk5A0;
    s16 i;
    s16 *unk1884;
    gUnknown_03002A80 = 0x10;
    gUnknown_03002878 = (void *)REG_ADDR_BG2PA;
    gUnknown_03001884 = world->unk4;

    unk5A0 = stage->cameraBearing;
    sin1 = gSineTable[unk5A0] * 4;
    sin2 = gSineTable[unk5A0 + 0x100] * 4;

    unk5CE = stage->unk5CE;
    gFlags |= 4;

    i = stage->unk5D1;
    unk1884 = gUnknown_03001884 + (stage->unk5D1 * 0x10);

    for (; i < 0xA0; i++) {
        s32 *footer;
        s32 temp = world->unkC[i] * unk5CE;
        s32 temp2 = (temp >> 8);

        s32 temp4, temp5;
        s32 temp6, temp7;
        temp4 = (0 - stage->unk5CA) * temp2;
        temp5 = (i - stage->unk5CC) * temp2 * 2;

        *unk1884++ = (Q_16_16_TO_INT(temp) * sin2) >> 0x10;
        *unk1884++ = (Q_16_16_TO_INT(temp) * sin1) >> 0x10;
        *unk1884++ = (Q_16_16_TO_INT(temp) * -sin1) >> 0x10;
        *unk1884++ = (Q_16_16_TO_INT(temp) * sin2) >> 0x10;

        temp6 = (Q_16_16_TO_INT(temp5) * sin1) + (Q_16_16_TO_INT(temp4) * sin2)
            + stage->cameraX;
        temp7 = (Q_16_16_TO_INT(temp4) * -sin1) + (Q_16_16_TO_INT(temp5) * sin2)
            + stage->cameraY;

        footer = (s32 *)unk1884;
        *footer++ = temp6 >> 8;
        *footer++ = temp7 >> 8;

        unk1884 += 4;
    }

    sub_806EB74();
}

void sub_806EB74(void)
{
    s16 i;
    struct SpecialStageWorld *world = TaskGetStructPtr(gCurTask);
    struct SpecialStage *stage = world->stage;
    u8 *level = &stage->zone;
    s16 num = gUnknown_080DF6DC[*level];
    // Huh?
    u8 *temp = (u8 *)&stage->cameraBearing;
    gBgScrollRegs[1][0] = -*temp;
    gBgScrollRegs[1][1] = 0x30;

    if (stage->paused != TRUE) {
        for (i = 0; i < num; i++) {
            Sprite *element = &world->unk90[i];

            sub_80036E0(element);
            sub_8003914(element);
        }
    }
}

void sub_806EBF4(struct Task *t)
{
    struct SpecialStageWorld *world = TaskGetStructPtr(t);

    if (world->unk8 != NULL) {
        EwramFree(world->unk8);
    }

    if (world->unkC != NULL) {
        EwramFree(world->unkC);
    }

    if (world->unk4 != NULL) {
        EwramFree(world->unk4);
    }
}
