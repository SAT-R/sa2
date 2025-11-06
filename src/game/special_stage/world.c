#include "core.h"
#include "game/special_stage/main.h"
#include "game/special_stage/player.h"
#include "game/special_stage/utils.h"
#include "game/special_stage/world.h"
#include "game/special_stage/guard_robo.h"
#include "game/special_stage/data.h"
#include "task.h"
#include "lib/m4a/m4a.h"
#include "game/save.h"
#include "trig.h"
#include "flags.h"
#include "malloc_ewram.h"
#include "constants/zones.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

void sub_806EA04(void);
void sub_806E7C0(struct SpecialStageWorld *world);
void sub_806EBF4(struct Task *);
void sub_806E94C(struct SpecialStageWorld *world);
void sub_806EB74(void);

// No idea why this has to be specified as, should be by default
ALIGNED(4)
static const s16 gUnknown_080DF6DC[8] = {
    [ZONE_1] = 1, [ZONE_2] = 7, [ZONE_3] = 5, [ZONE_4] = 1, [ZONE_5] = 7, [ZONE_6] = 5, [ZONE_7] = 5,
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

struct Task *CreateSpecialStageWorld(struct SpecialStage *stage)
{

    struct Task *t;
    struct SpecialStageWorld *world;

    s16 skys[7] = {
        TM_SPECIAL_STAGE_1_BG, TM_SPECIAL_STAGE_2_BG, TM_SPECIAL_STAGE_3_BG, TM_SPECIAL_STAGE_4_BG,
        TM_SPECIAL_STAGE_5_BG, TM_SPECIAL_STAGE_6_BG, TM_SPECIAL_STAGE_7_BG,
    };
    s16 floors[7] = {
        TM_SPECIAL_STAGE_1, TM_SPECIAL_STAGE_2, TM_SPECIAL_STAGE_3, TM_SPECIAL_STAGE_4,
        TM_SPECIAL_STAGE_5, TM_SPECIAL_STAGE_6, TM_SPECIAL_STAGE_7,
    };

    t = TaskCreate(sub_806EA04, sizeof(struct SpecialStageWorld), 0x8000, 0, sub_806EBF4);
    world = TASK_DATA(t);
    world->stage = stage;

    world->bgTransforms = NULL;
    world->unk8 = NULL;
    world->qPerspectiveTable = NULL;

    SpecialStageDrawBackground(&world->background, 1, 16, floors[stage->zone], 0x80, 0x80, 0, 2, 0, 0);
    SpecialStageDrawBackground(&world->floor, 0, 7, skys[stage->zone], 0x20, 0x20, 0, 1, 0, 0);

    sub_806E7C0(world);

    return t;
}

void sub_806E7C0(struct SpecialStageWorld *world)
{
    s16 i;
    struct SpecialStage *stage = world->stage;
    s32 temp = Q_16_16(stage->cameraHeight - stage->cameraPitch);

    s16 worldScale;
    s32 *unk94;
    s32 *unk8;
    s16 *unk4;
    s32 *unkC;

    world->qPerspectiveTable = EwramMalloc(DISPLAY_HEIGHT * sizeof(s32));
    for (i = 0, unkC = world->qPerspectiveTable; i < DISPLAY_HEIGHT; i++, unkC++) {
        s32 temp2 = (i - stage->cameraPitch);
        if (temp2 == 0) {
            *unkC = 0;
        } else {
            *unkC = temp / temp2;
        }
    }

    // unused, these values are also always 0
    world->unk8 = EwramMalloc(DISPLAY_HEIGHT * sizeof(s32));
    for (i = 0, unk8 = world->unk8; i < DISPLAY_HEIGHT; i++, unk8++) {
        s32 temp2 = (i - stage->cameraPitch);
        if (temp == 0) {
            *unk8 = 0;
        } else {
            *unk8 = temp2 / temp;
        }
    }

    unk94 = &stage->unk94[stage->horizonHeight][0];
    worldScale = stage->worldScale;
    for (i = stage->horizonHeight; i < DISPLAY_HEIGHT; i++) {
        s32 temp2 = I(world->qPerspectiveTable[i] * worldScale);
        s32 temp3 = (-stage->cameraOriginX * temp2);
        s32 temp4 = (((i - stage->cameraHeight) * temp2));
        *unk94++ = I(-(temp3 << 1)) * worldScale;
        *unk94++ = I(-(temp4 << 2)) * worldScale;
    }

    world->bgTransforms = EwramMalloc(DISPLAY_HEIGHT * sizeof(BgAffineReg));
    gBgOffsetsHBlankPrimary = world->bgTransforms;
    gBgOffsetsPrimary = world->bgTransforms;
    gBgOffsetsSecondary = world->bgTransforms;
    unk4 = world->bgTransforms;

    {
        const s16 template[] = {
            0, // PA
            256, // PB
            0, // PC,
            0, // PD,

            0,   256, // x

            0,   256, // y
        };
        for (i = 0; i < DISPLAY_HEIGHT; i++, unk4 += 8) {
            memcpy(unk4, template, sizeof(BgAffineReg));
            ((BgAffineReg *)unk4)->pc = Q(i);
        }
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
        Sprite *s = &world->unk90[i];
        s->graphics.dest = gUnknown_03005B5C;
        s->graphics.size = 0;
        s->graphics.anim = assets[i].anim;
        s->frameFlags = 0x80000;
        s->x = 0;
        s->y = 0;
        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->qAnimDelay = 0;
        s->prevAnim = 0xffff;
        s->variant = assets[i].variant;
        s->prevVariant = -1;
        s->animSpeed = 16;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        UpdateSpriteAnimation_BG(s);
    }
}

void sub_806EA04(void)
{
    struct SpecialStageWorld *world = TASK_DATA(gCurTask);
    struct SpecialStage *stage = world->stage;
    s32 sin, cos;
    s16 worldScale;
    s32 unk5A0;
    s16 i;
    s16 *unk1884;

    gHBlankCopySize = sizeof(BgAffineReg);
    gHBlankCopyTarget = (void *)REG_ADDR_BG2PA;
    gBgOffsetsHBlankPrimary = world->bgTransforms;

    unk5A0 = stage->cameraRotX;
    sin = SIN(unk5A0) * 4;
    cos = COS(unk5A0) * 4;

    worldScale = stage->worldScale;
    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;

    i = stage->horizonHeight;
    unk1884 = gBgOffsetsHBlankPrimary + (stage->horizonHeight * sizeof(BgAffineReg));

    for (; i < DISPLAY_HEIGHT; i++) {
        s32 *pos;
        s32 temp = world->qPerspectiveTable[i] * worldScale;
        s32 temp2 = I(temp);

        s32 temp4, temp5;
        s32 x, y;
        temp4 = (0 - stage->cameraOriginX) * temp2;
        temp5 = (i - stage->cameraHeight) * temp2 * 2;

        *unk1884++ = (Q_16_16_TO_INT(temp) * cos) >> 0x10; // BG2PA
        // HACK: in SDL we don't handle these PB and PD values properly
#if PLATFORM_SDL
        *unk1884++ = 0;
#else
        *unk1884++ = (Q_16_16_TO_INT(temp) * sin) >> 0x10; // BG2PB
#endif

        *unk1884++ = (Q_16_16_TO_INT(temp) * -sin) >> 0x10; // BG2PC
#if PLATFORM_SDL
        *unk1884++ = 0;
#else
        *unk1884++ = (Q_16_16_TO_INT(temp) * cos) >> 0x10; // BG2PD
#endif

        x = (Q_16_16_TO_INT(temp5) * sin) + (Q_16_16_TO_INT(temp4) * cos) + stage->q16CameraX;
        y = (Q_16_16_TO_INT(temp4) * -sin) + (Q_16_16_TO_INT(temp5) * cos) + stage->q16CameraY;

        pos = (s32 *)unk1884;
        *pos++ = I(x); // x
        *pos++ = I(y); // y

        unk1884 = ((void *)unk1884) + sizeof(s32) * 2;
    }

    sub_806EB74();
}

void sub_806EB74(void)
{
    s16 i;
    struct SpecialStageWorld *world = TASK_DATA(gCurTask);
    struct SpecialStage *stage = world->stage;
    u8 *level = &stage->zone;
    s16 num = gUnknown_080DF6DC[*level];
    // Huh?
    u8 *rot = (u8 *)&stage->cameraRotX;
    gBgScrollRegs[1][0] = -*rot;
    gBgScrollRegs[1][1] = 48;

    if (stage->paused != TRUE) {
        for (i = 0; i < num; i++) {
            Sprite *s = &world->unk90[i];

            UpdateSpriteAnimation_BG(s);
            DisplaySprite_BG(s);
        }
    }
}

void sub_806EBF4(struct Task *t)
{
    struct SpecialStageWorld *world = TASK_DATA(t);

    if (world->unk8 != NULL) {
        EwramFree(world->unk8);
    }

    if (world->qPerspectiveTable != NULL) {
        EwramFree(world->qPerspectiveTable);
    }

    if (world->bgTransforms != NULL) {
        EwramFree(world->bgTransforms);
    }
}
