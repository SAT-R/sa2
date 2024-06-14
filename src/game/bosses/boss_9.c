#include "global.h"
#include "flags.h"
#include "rect.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "gba/io_reg.h"
#include "lib/m4a.h"
#include "game/math.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"
#include "game/stage/player_super_sonic.h"
#include "game/stage/results.h"
#include "game/stage/ui.h"
#include "game/stage/game_7.h"
#include "sakit/globals.h"
#include "sakit/camera.h"
#include "sakit/player.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ u16 anim;
    /* 0x06 */ u8 unk6;
    /* 0x07 */ u8 unk7;
    /* 0x08 */ u8 unk8;
    /* 0x0A */ u16 unkA;
} TA53_80D89C8;

extern void Task_804D9DC(void);
extern void Task_804DB34(void);
extern void Task_804DC60(void);
extern void CreateTrueArea53Boss(void);
extern void sub_80505B8(struct TA53Boss *);
extern void Task_EggmanKidnapsVanilla(void);
extern void TaskDestructor_TrueArea53BossGfx(struct Task *);
void Task_TrueArea53BossMain(void);
void sub_804F1EC(struct TA53_unk558 *);
void sub_8050DC8(struct TA53_unk558 *);
void TaskDestructor_TrueArea53BossGfx(struct Task *);

const TileInfo gUnknown_080D88F0[5] = {
    { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_0, 0 },
    { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_1, 0 },
    { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_2, 0 },
    { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_CANNON, 0 },
    { 10 * 9, SA2_ANIM_TRUE_AREA_53_BOSS_COCKPIT, 0 },
};

const TileInfo gUnknown_080D8918[17] = {
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 12 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 11 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 10 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 9 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 8 },
    { 12, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 7 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 6 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 5 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 4 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 3 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 2 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 1 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 0 },
    { 12, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 15 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 14 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 13 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_EXPLOSION, 0 },
};

const s8 gUnknown_080D89A0[5] = { 0, -4, -8, -12, -16 };
const u8 gUnknown_080D89A5[6] = { 0, 20, 24, 20, 18, 30 };

// TODO: Parameter types
typedef void (*TA53SubFunc)(u32, u32, u32, u32);
void sub_804F6AC(u32, u32, u32, u32);
void sub_804F768(u32, u32, u32, u32);
void sub_804F850(u32, u32, u32, u32);
void sub_804F9BC(u32, u32, u32, u32);
void sub_804FAA4(u32, u32, u32, u32);
void sub_804FC10(u32, u32, u32, u32);
void sub_804FD58(u32, u32, u32, u32);
const TA53SubFunc gUnknown_080D89AC[7]
    = { sub_804F6AC, sub_804F768, sub_804F850, sub_804F9BC,
        sub_804FAA4, sub_804FC10, sub_804FD58 };

void sub_804DD9C(struct TA53_RocketExhaust *);
void sub_804E66C(struct TA53_unk98 *);
void sub_804E74C(struct TA53_unk98 *);
void sub_804E8E8(struct TA53_unk98 *);
void sub_804FF9C(struct TA53_unk654 *);

const TA53_80D89C8 gUnknown_080D89C8[]
    = { { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 },
        { 0, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 0, 1, 0 },
        { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 },
        { 0, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 0, 1, 0 },
        { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 },
        { 0, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 0, 1, 0 },
        { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 } };

const s16 gUnknown_080D8A1C[3][4] = {
    { 0x7EC, 0x82C, 0x7EC, 0x82C },
    { 0x7EC, 0x82C, 0x7EC, 0x82C },
    { 0x7EC, 0x82C, 0x7EC, 0x82C },
};

const s16 gUnknown_080D8A34[3][4] = {
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
};

const s16 gUnknown_080D8A4C[3][4] = {
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
};

const s16 gUnknown_080D8A64[3][4] = {
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
};

const s16 gUnknown_080D8A7C[3][4] = {
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
};

const s16 gUnknown_080D8A94[3][4] = {
    { 0x7EC, 0x82C, 0x7EC, 0x82C },
    { 0x7EC, 0x82C, 0x7EC, 0x82C },
    { 0x7EC, 0x82C, 0x7EC, 0x82C },
};

const s16 gUnknown_080D8AAC[3][4] = {
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
};

const s16 gUnknown_080D8AC4[3][4] = {
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
};

const s16 gUnknown_080D8ADC[3][4] = {
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
    { 0x000, 0x03C, 0x000, 0x03C },
};

const s16 gUnknown_080D8AF4[3][4] = {
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
    { 0x000, 0x040, 0x000, 0x040 },
};

const s16 gUnknown_080D8B0C[3][4] = {
    { 0x800, 0x800, 0x800, 0x800 },
    { 0x800, 0x800, 0x800, 0x800 },
    { 0x800, 0x800, 0x800, 0x800 },
};

const s16 gUnknown_080D8B24[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const s16 gUnknown_080D8B3C[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const s16 gUnknown_080D8B54[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const s16 gUnknown_080D8B6C[3][4] = {
    { 0x0A2, 0x0A2, 0x0A2, 0x0A2 },
    { 0x0A2, 0x0A2, 0x0A2, 0x0A2 },
    { 0x0A2, 0x0A2, 0x0A2, 0x0A2 },
};

const s16 gUnknown_080D8B84[3][4] = {
    { 0x800, 0x800, 0x800, 0x800 },
    { 0x800, 0x800, 0x800, 0x800 },
    { 0x800, 0x800, 0x800, 0x800 },
};

const s16 gUnknown_080D8B9C[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const s16 gUnknown_080D8BB4[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const s16 gUnknown_080D8BCC[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const s16 gUnknown_080D8BE4[3][4] = {
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
    { 0x066, 0x066, 0x066, 0x066 },
};

const void *const gUnknown_080D8BFC[5] = {
    &gUnknown_080D8A1C, &gUnknown_080D8A34, &gUnknown_080D8A4C,
    &gUnknown_080D8A64, &gUnknown_080D8A7C,
};

const void *const gUnknown_080D8C10[5] = {
    &gUnknown_080D8A94, &gUnknown_080D8AAC, &gUnknown_080D8AC4,
    &gUnknown_080D8ADC, &gUnknown_080D8AF4,
};

const void *const gUnknown_080D8C24[5] = {
    &gUnknown_080D8B0C, &gUnknown_080D8B24, &gUnknown_080D8B3C,
    &gUnknown_080D8B54, &gUnknown_080D8B6C,
};

const void *const gUnknown_080D8C38[5] = {
    &gUnknown_080D8B84, &gUnknown_080D8B9C, &gUnknown_080D8BB4,
    &gUnknown_080D8BCC, &gUnknown_080D8BE4,
};

const s16 gUnknown_080D8C4C[4] = { +10, -10, +10, -10 };
const s16 gUnknown_080D8C54[4] = { +10, -10, +10, -10 };
const s16 gUnknown_080D8C5C[4] = { +10, -10, +10, -10 };

const s16 gUnknown_080D8C64[4] = { +10, -10, -10, +10 };
const s16 gUnknown_080D8C6C[4] = { +10, -10, -10, +10 };
const s16 gUnknown_080D8C74[4] = { +10, -10, -10, +10 };

const s16 gUnknown_080D8C7C[4] = { +10, -10, +10, -10 };
const s16 gUnknown_080D8C84[4] = { +10, -10, +10, -10 };
const s16 gUnknown_080D8C8C[4] = { +10, -10, +10, -10 };

const s16 gUnknown_080D8C94[4] = { +10, -10, -10, +10 };
const s16 gUnknown_080D8C9C[4] = { +10, -10, -10, +10 };
const s16 gUnknown_080D8CA4[4] = { +10, -10, -10, +10 };

const s16 gUnknown_080D8CAC[4] = { 0, -20, -40, -60 };
const s16 gUnknown_080D8CB4[4] = { -80, -100, -120, -140 };
const s16 gUnknown_080D8CBC[4] = { -160, -180, -200, -220 };

const s16 gUnknown_080D8CC4[4] = { 10, 30, 30, -90 };
const s16 gUnknown_080D8CCC[4] = { -120, -150, -180, -210 };
const s16 gUnknown_080D8CD4[4] = { -240, -270, -300, -330 };

const s16 gUnknown_080D8CDC[4] = { 10, -40, -90, -140 };
const s16 gUnknown_080D8CE4[4] = { -190, -190, -140, -90 };
const s16 gUnknown_080D8CEC[4] = { -40, 10, 10, -10 };

const s16 gUnknown_080D8CF4[4] = { +10, -10, +10, -10 };
const s16 gUnknown_080D8CFC[4] = { -20, -30, -20, -10 };
const s16 gUnknown_080D8D04[4] = { +10, -10, -10, +10 };

const s16 gUnknown_080D8D0C[4] = { +10, 40, 60, 80 };
const s16 gUnknown_080D8D14[4] = { 100, 100, 80, 60 };
const s16 gUnknown_080D8D1C[4] = { 40, 20, 10, 10 };

const s16 gUnknown_080D8D24[4] = { 10, 20, 30, 40 };
const s16 gUnknown_080D8D2C[4] = { 50, 50, 40, 30 };
const s16 gUnknown_080D8D34[4] = { 20, 10, -10, 10 };

const void *const gUnknown_080D8D3C[] = {
    &gUnknown_080D8C4C,
    &gUnknown_080D8C64,
};
const void *const gUnknown_080D8D44[] = {
    &gUnknown_080D8C7C,
    &gUnknown_080D8C94,
};
const void *const gUnknown_080D8D4C[] = {
    &gUnknown_080D8CAC,
    &gUnknown_080D8CC4,
};
const void *const gUnknown_080D8D54[] = {
    &gUnknown_080D8CDC,
    &gUnknown_080D8CF4,
};
const void *const gUnknown_080D8D5C[] = {
    &gUnknown_080D8CDC,
    &gUnknown_080D8D0C,
};
const void *const gUnknown_080D8D64[] = {
    &gUnknown_080D8CDC,
    &gUnknown_080D8D24,
};

// TODO: Parameter type
static void UpdateExplosion(TA53Boss *);
void sub_804E078(struct TA53_unk48 *);
void sub_804E15C(struct TA53_unk48 *);
void sub_804E4CC(struct TA53_unk48 *);
void sub_804ECC4(TA53Boss *);
u8 sub_8050030(struct TA53_unk48 *);
void sub_80501D4(TA53Boss *);
void sub_8050958(TA53Boss *);
void sub_8050BD8(struct TA53_unk1C *);
void sub_8050BE4(struct TA53_unk1C *);
void sub_8050BF0(struct TA53_unk1C *);
void sub_8050BFC(struct TA53_unk48 *);
void sub_8050C50(struct TA53_unk48 *);
void sub_8050CBC(struct TA53_unk48 *);
void sub_8050D24(struct TA53_unk48 *);
void sub_8050D9C(struct TA53_unk48 *);
void sub_8050DC4(struct TA53_unk98 *);
void sub_8050DF8(struct TA53_unk654 *);

const TA53_Data0 gUnknown_080D8D6C[] = {
    { sub_804E078, (void *)&gUnknown_080D8BFC, 40 },
    { sub_804E4CC, (void *)&gUnknown_080D8BFC, 40 },
    { sub_8050BFC, (void *)&gUnknown_080D8C24, 126 },
    { sub_8050C50, (void *)&gUnknown_080D8C24, 512 },
    { sub_804E15C, (void *)&gUnknown_080D8C38, 160 },
    { sub_8050CBC, (void *)&gUnknown_080D8C10, 80 },
    { sub_8050D24, (void *)&gUnknown_080D8C10, 80 },
    { sub_8050D9C, (void *)&gUnknown_080D8C10, 80 },
};

const TA53_Data1 gUnknown_080D8DCC[] = {
    { sub_8050BD8, (void *)&gUnknown_080D8D3C, 40 },
    { sub_8050BE4, (void *)&gUnknown_080D8D54, 100 },
    { sub_8050BE4, (void *)&gUnknown_080D8D5C, 100 },
    { sub_8050BE4, (void *)&gUnknown_080D8D5C, 100 },
    { sub_8050BF0, (void *)&gUnknown_080D8D44, 20 },
    { sub_8050BF0, (void *)&gUnknown_080D8D4C, 100 },
};

void sub_804E974(struct TA53_unkA8 *rocket);
void sub_804EB6C(struct TA53_unkA8 *rocket);
bool32 sub_804ED98(s32, s32);
void sub_804EC6C(struct TA53_unkA8 *rocket);
bool32 sub_804EE84(Sprite *s, s32 x, s32 y);
bool32 sub_804F010(Sprite *s, s32 x, s32 y, u8 param3);

const TA53_Rocket_Callback gUnknown_080D8E14[3]
    = { sub_804E974, sub_804EB6C, sub_804EC6C };
const u8 sRGB_080D8E20[4][16][3] = {
    {
        { 0, 0, 0 },
        { 2, 2, 28 },
        { 6, 3, 30 },
        { 13, 6, 31 },
        { 13, 9, 31 },
        { 14, 13, 31 },
        { 17, 14, 31 },
        { 12, 19, 31 },
        { 12, 22, 31 },
        { 14, 25, 31 },
        { 16, 27, 31 },
        { 19, 28, 31 },
        { 23, 28, 31 },
        { 26, 28, 31 },
        { 27, 29, 31 },
        { 29, 30, 31 },
    },
    {
        { 0, 0, 0 },
        { 2, 2, 28 },
        { 9, 3, 29 },
        { 12, 6, 31 },
        { 17, 6, 31 },
        { 18, 10, 31 },
        { 18, 13, 31 },
        { 14, 24, 31 },
        { 18, 25, 31 },
        { 22, 26, 31 },
        { 25, 27, 31 },
        { 26, 28, 31 },
        { 27, 28, 31 },
        { 28, 29, 31 },
        { 28, 30, 31 },
        { 29, 30, 31 },
    },
    {
        { 0, 0, 0 },
        { 0, 0, 0 },
        { 5, 4, 12 },
        { 6, 1, 21 },
        { 9, 3, 29 },
        { 13, 9, 31 },
        { 12, 19, 31 },
        { 12, 23, 31 },
        { 13, 26, 31 },
        { 16, 28, 31 },
        { 19, 28, 31 },
        { 24, 28, 31 },
        { 26, 28, 31 },
        { 27, 29, 31 },
        { 29, 30, 31 },
        { 30, 30, 31 },
    },
    {
        { 0, 12, 14 },
        { 31, 31, 31 },
        { 31, 22, 7 },
        { 15, 7, 31 },
        { 11, 2, 22 },
        { 4, 2, 2 },
        { 25, 29, 31 },
        { 20, 23, 25 },
        { 12, 14, 19 },
        { 6, 9, 12 },
        { 8, 0, 15 },
        { 31, 14, 4 },
        { 27, 8, 0 },
        { 23, 4, 0 },
        { 16, 4, 0 },
        { 10, 4, 0 },
    },
};

const u8 gUnknown_080D8EE0[] = { 0, 1, 2, 3, 2, 1, 0, 1, 2, 3, 2, 1, 0, 1, 2, 3 };

const u16 gUnknown_080D8EF0[2][16] = {
    INCBIN_U16("graphics/boss_9_a.gbapal"),
    INCBIN_U16("graphics/boss_9_b.gbapal"),
};

// Used when Vanilla gets captured
void SetupEggmanKidnapsVanillaTask(void)
{
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;
    u8 i;

    gActiveBossTask = TaskCreate(Task_EggmanKidnapsVanilla, sizeof(TA53Boss), 0x4000, 0,
                                 TaskDestructor_TrueArea53BossGfx);

    CreateTrueArea53Boss();

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;
    boss->unk12 = 0x230;

    unk48->unk30 &= 0xFFF;
    unk48->callback = gUnknown_080D8D6C[4].callback;
    unk48->unk34 = gUnknown_080D8D6C[4].ref;
    unk48->unk2E = gUnknown_080D8D6C[4].unk8;

    unk1C->qPos.x = Q(330);
    unk1C->qPos.y = Q(90);
    unk1C->unk14 = gUnknown_080D8DCC[4].unk8;

    for (i = 0; i < 4; i++) {
        unk1C->unk4[i] = gUnknown_080D8C7C[i];
        unk1C->unkC[i] = gUnknown_080D8C94[i];
    }

    // TODO(Jace): why is this set above only to be rewritten?
    unk48->unk30 &= 0xFFF;
    unk48->callback = gUnknown_080D8D6C[5].callback;
    unk48->unk34 = gUnknown_080D8D6C[5].ref;
    unk48->unk2E = gUnknown_080D8D6C[5].unk8;
    unk48->unk2C = unk48->unk2E;

    // __0804CE02
    for (i = 0; i < 4; i++) {
        unk48->unk4[i] = gUnknown_080D8A94[0][i];
        unk48->unkC[i] = gUnknown_080D8AAC[0][i];
        unk48->unk14[i] = gUnknown_080D8AC4[0][i];
        unk48->unk1C[i] = gUnknown_080D8ADC[0][i];
        unk48->unk24[i] = gUnknown_080D8AF4[0][i];
    }

    gDispCnt = (DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP
                | DISPCNT_MODE_1);
}

// (36.97%) https://decomp.me/scratch/KnEGg
NONMATCH("asm/non_matching/game/bosses/boss_9__CreateTrueArea53Boss.inc",
         void CreateTrueArea53Boss(void))
{
    void *vram;
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;
    TA53_unk98 *unk98;
    TA53_unk558 *unk558;
    TA53_unk654 *unk654;
    Sprite *s;
    u32 i, j;

    gStageFlags |= EXTRA_STATE__DISABLE_PAUSE_MENU;

    if (gActiveBossTask == NULL) {
        gActiveBossTask = TaskCreate(Task_TrueArea53BossMain, sizeof(TA53Boss), 0x400, 0,
                                     TaskDestructor_TrueArea53BossGfx);
    }

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;

    boss->unkC = 12;
    boss->unkD = 0;
    boss->unk10 = 1;
    boss->unk12 = 80;
    boss->unkE = 0;
    boss->unkF = 0;
    boss->qPos.x = 0;
    boss->qPos.y = 0;
    boss->fade.window = 0;
    boss->fade.brightness = Q(0);
    boss->fade.flags = SCREEN_FADE_FLAG_LIGHTEN;
    boss->fade.speed = 20;
    boss->fade.bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
    boss->fade.bldAlpha = 1;

    unk558 = &boss->unk558;
    unk558->callback = sub_8050DC8;

    unk1C->unk4[1] = 200;
    unk1C->unk4[0] = 0;
    unk1C->unk18 &= 0xFFF;

    unk1C->callback = gUnknown_080D8DCC->callback;
    unk1C->unk1C = gUnknown_080D8DCC->ref;
    unk1C->unk16 = gUnknown_080D8DCC->unk8;

    unk1C->qPos.x = Q(1267);
    unk1C->qPos.y = Q(112);
    unk1C->unk20 = 0;
    unk1C->unk22 = 0;
    unk1C->unk14 = unk1C->unk16;
    unk1C->unk18 = 0;

    for (i = 0; i < 4; i++) {
        boss->unk1C.unk4[i] = gUnknown_080D8C4C[i];
        boss->unk1C.unkC[i] = gUnknown_080D8C54[i];
    }

    unk48->unk30 &= 0xFFF;
    unk48->callback = gUnknown_080D8D6C[1].callback;
    unk48->unk34 = gUnknown_080D8D6C[1].ref;
    unk48->unk2E = gUnknown_080D8D6C[1].unk8;
    unk48->unk4C = 1;
    unk48->unk38 = 0;
    unk48->qPos44.x = 0;
    unk48->qPos44.y = 0;
    unk48->unk2C = gUnknown_080D8D6C[0].unk8;
    unk48->unk30 = 0;
    unk48->unk4;

    for (i = 0; i < 4; i++) {
        unk48->unk4[i] = gUnknown_080D8A1C[0][i];
        unk48->unkC[i] = gUnknown_080D8A34[0][i];
        unk48->unk14[i] = gUnknown_080D8A4C[0][i];
        unk48->unk1C[i] = gUnknown_080D8A64[0][i];
        unk48->unk24[i] = gUnknown_080D8A7C[0][i];
    }

    for (i = 0; i < 10; i++) {
        // _0804D118
        boss->unk594.unk4[i] = 0;
        boss->unk594.unkE[i] = 0;
        boss->unk594.unk18[i][0] = 0;
        boss->unk594.unk18[i][1] = 0;
        boss->unk594.unk40[i].x = 0;
        boss->unk594.unk40[i].y = 0;
    }

    boss->unk654.callback = sub_804FF9C;
    boss->unk654.func4 = sub_804F768;
    boss->unk654.unk8 = 300;
    boss->unk654.unkA = 512;

    for (i = 0; i < 16; i++) {
        boss->unk654.unkE[i] = 0;
        boss->unk654.unk1E[i] = 0;
        boss->unk654.unk2E[i].x = 0;
        boss->unk654.unk2E[i].y = 0;
        boss->unk654.unk70[i].x = 0;
        boss->unk654.unk70[i].y = 0;
    }
    // __0804D194

    unk98->callback = sub_804E66C;
    unk98->unk4 = 300;
    unk98->unk6 = 512;
    unk98->qUnk8 = 0;
    unk98->qUnkC = 0;

    // Rocket Exhaust Cloud Tiles
    vram = VramMalloc(32);

    // Rockets
    for (i = 0; i < 3; i++) {
        // _0804D1F0
        TA53_unkA8 *unkA8 = &unk98->unk10[i];
        TA53_RocketExhaust *exhaust;
        s = &unkA8->spr20;

        unkA8->unk4 = 0;
        unkA8->unkA = 0;
        unkA8->unkE = 0;
        unkA8->unk10 = 0;
        unkA8->pos14.x = 0;
        unkA8->pos14.y = 0;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = gUnknown_080D8918[0].anim;
        s->variant = gUnknown_080D8918[0].variant;
        s->prevVariant = -1;
        s->unk1A = SPRITE_OAM_ORDER(17);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;

        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 6;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        exhaust = &unkA8->exhaust;
        exhaust->callback = sub_804DD9C;

        // Rocket Exhaust Clouds
        for (j = 0; j < 5; j++) {
            // _0804D25C
            exhaust->unk4[j] = 0;
            exhaust->unkA[j][0] = 0;
            exhaust->unkA[j][1] = 0;
            exhaust->pos[j].x = 0;
            exhaust->pos[j].y = 0;

            exhaust->s[j].x = 0;
            exhaust->s[j].y = 0;
            exhaust->s[j].graphics.dest = vram;
            exhaust->s[j].graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_CLOUD;
            exhaust->s[j].variant = 0;
            exhaust->s[j].prevVariant = -1;
            exhaust->s[j].unk1A = SPRITE_OAM_ORDER(16);
            exhaust->s[j].graphics.size = 0;
            exhaust->s[j].animCursor = 0;
            exhaust->s[j].timeUntilNextFrame = 0;
            exhaust->s[j].animSpeed = SPRITE_ANIM_SPEED(1.0);
            exhaust->s[j].hitboxes[0].index = HITBOX_STATE_INACTIVE;
            exhaust->s[j].palId = 6;
            exhaust->s[j].unk10 = SPRITE_FLAG(PRIORITY, 2);
        }
    }
    // _0804D39A

    // Cockpit?
    s = &boss->spr7B4;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(gUnknown_080D88F0[4].numTiles);
    s->graphics.anim = gUnknown_080D88F0[4].anim;
    s->variant = gUnknown_080D88F0[4].variant;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    // Rings that get "sucked out" by the Boss?
    s = &boss->spr7F0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_UI_RING; // huh?
    s->variant = 8;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(6);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    // Yellow Projectile
    s = &boss->unk654.sprF0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(9);
    s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_YELLOW;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(7);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    // Red Projectile
    s = &boss->unk654.spr128;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(7);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
}
END_NONMATCH

// (95.99%) https://decomp.me/scratch/05cvE
NONMATCH("asm/non_matching/game/bosses/boss_9__TrueArea53BossMove.inc",
         void TrueArea53BossMove(s32 dX, s32 dY))
{
    u8 i, j;
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk98 *unk98;
    TA53_unkA8 *unkA8;
    TA53_unk594 *unk594;
    TA53_unk654 *unk654;

    if (gActiveBossTask == NULL)
        return;

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;
    unk98 = &boss->unk98;

    unk1C->qPos.x += dX;
    unk1C->qPos.y += dY;
    boss->qPos.x += dX;
    boss->qPos.y += dY;

    for (i = 0; i < 3; i++) {
        unkA8 = &unk98->unk10[i];
        unkA8->pos14.x += dX;
        unkA8->pos14.y += dY;

        for (j = 0; j < ARRAY_COUNT(unkA8->exhaust.pos); j++) {
            // _0804D620
            // @TODO/BUG: This should be [j]
            unkA8->exhaust.pos[i].x += I(dX);
            unkA8->exhaust.pos[i].y += I(dY);
        }
    }
    // _0804D646 - 0x6

    for (i = 0; i < 10; i++) {
        unk594 = &boss->unk594;
        unk594->unk40[i].x += dX;
        unk594->unk40[i].y += dY;
    }
    // _0804D668 - 0x6

    for (i = 0; i < 16; i++) {
        unk654 = &boss->unk654;
        unk654->unk70[i].x += dX;
        unk654->unk70[i].y += dY;
    }
    // _0804D684
}
END_NONMATCH

void Task_EggmanKidnapsVanilla(void)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    TA53_unk558 *unk558 = &boss->unk558;
    u16 *offset;
    int_vcount y;

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);

    if (--boss->unk12 == 0) {
        gFlags &= ~FLAGS_4;
        TaskDestroy(gCurTask);
        return;
    }

    unk558->callback(unk558);
    unk1C->callback(unk1C);
    unk48->callback(unk48);
    sub_80505B8(boss);

    gWinRegs[WINREG_WINOUT]
        = (WINOUT_WINOBJ_CLR | WINOUT_WINOBJ_BG0 | WINOUT_WINOBJ_BG1 | WINOUT_WINOBJ_BG2
           | WINOUT_WIN01_CLR | WINOUT_WIN01_OBJ | WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2);

    gFlags |= FLAGS_4;
    gUnknown_03002878 = (void *)&REG_BG1VOFS;
    gUnknown_03002A80 = 2;

    offset = gBgOffsetsHBlank;
    for (y = 0; y < DISPLAY_HEIGHT - 1; y++) {
        s16 val = (SIN(((y + gStageTime) * 40) & ONE_CYCLE) >> 12) + 0x2C;
        *offset++ = val;
    }
}

void Task_TrueArea53BossMain(void)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    TA53_unk98 *unk98 = &boss->unk98;

    gStageFlags |= EXTRA_STATE__DISABLE_PAUSE_MENU;

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    unk1C->qPos.x += Q(5);
    unk98->unk6 = unk48->unk3A[0];
    unk98->unk6 = ((unk98->unk6 + I(unk48->qPos44.x) + 860) & ONE_CYCLE);

    unk98->qUnk8 = unk1C->qPos.x + Q(unk1C->unk20);
    unk98->qUnkC = unk1C->qPos.y + Q(unk1C->unk22);

    unk98->callback(unk98);
    unk1C->callback(unk1C);
    unk48->callback(unk48);
    sub_80501D4(boss);
    sub_8050958(boss);

    unk1C->qPos.x += Q(1);

    if (--boss->unk12 == 0) {
        gCurTask->main = Task_804D9DC;
    } else if (boss->unk12 == (80 - 1)) {
        Background *cockpit = &boss->bg900;

        cockpit->graphics.dest = (void *)BG_VRAM;
        cockpit->graphics.anim = 0;
        cockpit->layoutVram = (void *)BG_SCREEN_ADDR(TA53_BOSS_SCREENBASE);
        cockpit->unk18 = 0;
        cockpit->unk1A = 0;
        cockpit->tilemapId = TM_EXTRA_BOSS_BACKGROUND_COPY;
        cockpit->unk1E = 0;
        cockpit->unk20 = 0;
        cockpit->unk22 = 0;
        cockpit->unk24 = 0;
        cockpit->targetTilesX = 32;
        cockpit->targetTilesY = 20;
        cockpit->paletteOffset = 0;
        cockpit->flags = BACKGROUND_FLAGS_BG_ID(TA53_BOSS_BACKGROUND_ID);
        DrawBackground(cockpit);

        gBgCntRegs[1] = (BGCNT_SCREENBASE(TA53_BOSS_SCREENBASE) | BGCNT_PRIORITY(2));
    }
}

void sub_804D8E0(TA53Boss *boss)
{
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    TA53_unk98 *unk98 = &boss->unk98;
    TA53_unk558 *unk558 = &boss->unk558;
    TA53_unk654 *unk654 = &boss->unk654;
    Sprite *s;
    u8 i;

    if (SuperSonicGetFlags() & SUPER_FLAG__200) {
        sub_802BA8C();
    }

    for (i = 0; i < ARRAY_COUNT(unk98->unk10); i++) {
        TA53_unkA8 *unkA8 = &unk98->unk10[i];
        s = &unkA8->spr20;

        unkA8->unk4 |= 0x4;

        if (unkA8->callback != gUnknown_080D8E14[2]) {
            s->graphics.anim = gUnknown_080D8918[16].anim;
            s->variant = gUnknown_080D8918[16].variant;
            s->prevVariant = -1;
            s->unk10 = SPRITE_FLAG(PRIORITY, 1);
            unkA8->unk8 = 16;
        }
    }

    unk98->callback = sub_804E66C;

    unk654->callback = sub_804FF9C;
    unk654->unk8 = 300;

    unk558->callback = sub_8050DC8;

    unk48->unk2C = 0;
    unk1C->unk14 = 0;

    boss->qPos.x = unk1C->qPos.x + Q(unk1C->unk20);
    boss->qPos.y = unk1C->qPos.y + Q(unk1C->unk22);
}

void Task_804D9DC(void)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    TA53_unk98 *unk98 = &boss->unk98;
    TA53_unk558 *unk558 = &boss->unk558;
    TA53_unk594 *unk594 = &boss->unk594;
    TA53_unk654 *unk654 = &boss->unk654;

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);
    unk1C->qPos.x += Q(5);
    unk98->unk6 = unk48->unk3A[0];
    unk98->unk6 = ((unk98->unk6 + I(unk48->qPos44.x) + 860) & ONE_CYCLE);

    unk98->qUnk8 = unk1C->qPos.x + Q(unk1C->unk20);
    unk98->qUnkC = unk1C->qPos.y + Q(unk1C->unk22);

    if (boss->unkC == 0) {
        MPlayStop(&gMPlayInfo_SE1);
        MPlayStop(&gMPlayInfo_SE2);
        MPlayStop(&gMPlayInfo_SE3);

        gStageFlags |= (EXTRA_STATE__DISABLE_PAUSE_MENU | EXTRA_STATE__2
                        | EXTRA_STATE__ACT_START);
        sub_802B81C();
        sub_804D8E0(boss);
        sub_80501D4(boss);
        sub_8050958(boss);

        unk98->callback = sub_8050DC4;
        unk654->callback = sub_8050DF8;

        boss->unk12 = 120;
        gCurTask->main = Task_804DB34;
    } else {
        unk98->callback(unk98);
        unk558->callback(unk558);
        unk594->callback(unk594);
        unk654->callback(unk654);
        unk1C->callback(unk1C);
        unk48->callback(unk48);

        sub_804ECC4(boss);
        sub_80501D4(boss);
        sub_8050958(boss);
    }
}

void Task_804DB34(void)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk98 *unk98 = &boss->unk98;
    TA53_unk594 *unk594 = &boss->unk594;
    TA53_unk654 *unk654 = &boss->unk654;
    Sprite *s;
    s32 x, y;

    gDispCnt &= ~(DISPCNT_WIN0_ON | DISPCNT_WIN1_ON);

    unk1C->qPos.x += Q(4.75);
    unk1C->qPos.y += Q(0.25);

    unk98->callback(unk98);
    unk594->callback(unk594);
    unk654->callback(unk654);

    sub_80501D4(boss);
    sub_8050958(boss);
    UpdateExplosion(boss);

    s = &boss->spr7B4;

    x = Q(gCamera.x + 536);
    y = Q(gCamera.y + 60);
    boss->qPos.x += Div((x - boss->qPos.x) * 2, 100);
    boss->qPos.y += Div((y - boss->qPos.y) * 2, 100);

    s->x = I(boss->qPos.x) - gCamera.x;
    s->y = I(boss->qPos.y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk12 > 0) {
        boss->unk12--;
    } else {
        if (UpdateScreenFade(&boss->fade) == SCREEN_FADE_COMPLETE) {
            boss->unk12 = 2;
            gBldRegs.bldY = 16;
            gCurTask->main = Task_804DC60;
        }
    }
}

void Task_804DC60(void)
{
    TA53Boss *boss = TASK_DATA(gCurTask);

    if (--boss->unk12 == 0) {
        TasksDestroyAll();

        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;

        gVramGraphicsCopyCursor = gVramGraphicsCopyQueueIndex;

        gStageFlags |= EXTRA_STATE__TURN_OFF_HUD;

        CreateStageUI();
        CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);

        gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
    }
}

static void UpdateExplosion(TA53Boss *boss)
{
    ExplosionPartsInfo info;

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if ((gStageTime % 4u) == 0) {
        info.spawnX = PseudoRandBetween(64, (64 + 128));
        info.spawnY = PseudoRandBetween(16, (16 + 128));
        info.velocity = 0;
        info.rotation = PseudoRandBetween(0, SIN_PERIOD);
        info.speed = Q(2);
        info.vram = (OBJ_VRAM0 + 0x2980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 1;
        CreateBossParticleWithExplosionUpdate(&info, &boss->unkE);
    }
}

void sub_804DD9C(struct TA53_RocketExhaust *exhaust)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(exhaust->pos); i++) {
        if (exhaust->unk4[i] != 0) {
            Sprite *s = &exhaust->s[i];

            exhaust->unk4[i]--;

            exhaust->pos[i].x += Q(5);

            exhaust->pos[i].x += exhaust->unkA[i][0];
            exhaust->pos[i].y += exhaust->unkA[i][1];

            exhaust->unkA[i][0] -= (exhaust->unkA[i][0] >> 4);
            exhaust->unkA[i][1] -= (exhaust->unkA[i][1] >> 4);

            s->x = I(exhaust->pos[i].x) - gCamera.x;
            s->y = I(exhaust->pos[i].y) - gCamera.y;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void sub_804DE5C(s32 qX, s32 qY, TA53_RocketExhaust *exhaust, u16 param3)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(exhaust->pos); i++) {
        if (exhaust->unk4[i] == 0) {
            exhaust->unkA[i][0] = -(COS(param3) >> 5);
            exhaust->unkA[i][1] = -(SIN(param3) >> 5);

            exhaust->pos[i].x = qX;
            exhaust->pos[i].y = qY;

            exhaust->unk4[i] = 16;

            exhaust->s[i].prevVariant = -1;
            break;
        }
    }
}

void sub_804DEEC(s32 qX, s32 qY)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk594 *unk594 = &boss->unk594;
    u8 i;

    for (i = 0; i < ARRAY_COUNT(unk594->unk4); i++) {
        if (unk594->unk4[i] == 0) {
            unk594->unk4[i] = 1;
            unk594->unkE[i] = 60;
            unk594->unk18[i][0] = (PseudoRandom32() & 0xFF) - Q(2);
            unk594->unk18[i][1] = (PseudoRandom32() & 0xFF) - Q(2);

            unk594->unk40[i].x = qX;
            unk594->unk40[i].y = qY;

            break;
        }
    }
}

void sub_804DFB0(TA53_unk594 *unk594)
{
    Sprite *s = &unk594->spr90;
    u8 i = 0;
    bool32 animUpdated = FALSE;

    for (; i < ARRAY_COUNT(unk594->unk4); i++) {
        if (unk594->unk4[i] != 0) {
            if (--unk594->unkE[i] == 0) {
                unk594->unk4[i] = 0;
            }

            unk594->unk18[i][1] += Q(0.125);

            unk594->unk40[i].x += Q(5) + unk594->unk18[i][0];
            unk594->unk40[i].y += Q(0) + unk594->unk18[i][1];

            s->x = I(unk594->unk40[i].x) - gCamera.x;
            s->y = I(unk594->unk40[i].y) - gCamera.y;

            if (!animUpdated) {
                UpdateSpriteAnimation(s);
                animUpdated = TRUE;
            }

            DisplaySprite(s);
        }
    }
}

void sub_804E078(struct TA53_unk48 *unk48)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;

    if (sub_8050030(unk48) != 0) {
        if (boss->unkC > 4) {
            unk48->unk30 &= 0xFFF;
            unk48->callback = gUnknown_080D8D6C[4].callback;
            unk48->unk34 = gUnknown_080D8D6C[4].ref;
            unk48->unk2E = gUnknown_080D8D6C[4].unk8;
        } else {
            u8 index = Mod(gStageTime, 3) + 1;
            unk48->unk30 &= 0xFFF;
            unk48->callback = gUnknown_080D8D6C[2].callback;
            unk48->unk34 = gUnknown_080D8D6C[2].ref;
            unk48->unk2E = gUnknown_080D8D6C[2].unk8;
            unk1C->unk18 &= 0xFFF;

            unk1C->callback = gUnknown_080D8DCC[index].callback;
            unk1C->unk1C = gUnknown_080D8DCC[index].ref;
            unk1C->unk16 = gUnknown_080D8DCC[index].unk8;
            unk48->unk2C = gUnknown_080D8D6C[0].unk8;
            unk1C->unk14 = gUnknown_080D8DCC[0].unk8;
        }
    }

    unk48->qPos44.x = 0;
    unk48->qPos44.y = 0;

    if (unk48->unk38 != 0) {
        if (sub_808558C(unk48->unk38, 0, 10) < 0) {
            unk48->unk38--;
        } else {
            unk48->unk38++;
        }
    }
    unk48->unk38 &= ONE_CYCLE;
}

// (94.10%) https://decomp.me/scratch/rjfvR
NONMATCH("asm/non_matching/game/bosses/boss_9__sub_804E15C.inc",
         void sub_804E15C(struct TA53_unk48 *unk48))
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk558 *unk558 = &boss->unk558;
    TA53_unk1C *unk1C = &boss->unk1C;
    Vec2_32 qSonicPos;
    u8 i;

    if (sub_8050030(unk48) != 0) {
        unk48->unk30 &= 0xFFF;
        unk48->callback = gUnknown_080D8D6C[0].callback;
        unk48->unk34 = gUnknown_080D8D6C[0].ref;
        unk48->unk2E = gUnknown_080D8D6C[0].unk8;

        gDispCnt &= ~(DISPCNT_WIN0_ON);
        gWinRegs[WINREG_WININ] = 0;
        gWinRegs[WINREG_WINOUT] = 0;

        gBldRegs.bldCnt = 0;
        gBldRegs.bldAlpha = 0;
        gBldRegs.bldY = 0;
    } else {
        u8 sp14 = (unk48->unk30 >> 12);

        if (sp14 > 2) {
            // _0804E1EC
            s32 index;
            s32 sb = unk1C->qPos.x + Q(unk1C->unk20);
            s32 r8 = unk1C->qPos.y + Q(unk1C->unk22);
            s32 r5 = (I(unk48->qPos44.x) + unk48->unk3A[0]) & ONE_CYCLE;
            s32 r6;

            sb += ((COS(r5) * gUnknown_080D89A5[0]) >> 6);
            r8 += ((SIN(r5) * gUnknown_080D89A5[0]) >> 6);

            r5 += 0x8C;

            index = (r5 - Q(1)) & ONE_CYCLE;
            sb += (COS(index) >> 2);
            r8 += (SIN(index) >> 2);

            for (i = 0; i < 3; i++) {
                // _0804E278
                r5 = (r5 + unk48->unk3A[i + 1]) & ONE_CYCLE;

                sb += ((COS(r5) * gUnknown_080D89A5[i + 1]) >> 6);
                r8 += ((SIN(r5) * gUnknown_080D89A5[i + 1]) >> 6);
            }

            sb += ((COS(r5) * gUnknown_080D89A5[4]) >> 6);
            r8 += ((SIN(r5) * gUnknown_080D89A5[4]) >> 6);

            r5 = (r5 + unk48->unk42) & ONE_CYCLE;

            if (sp14 > 5) {
                // _0804E2EE

                // TODO: Type
                u16 result;
                s32 r4;
                u16 r1;
                s32 x, y;

                if ((gMPlayTable[2].info->songHeader != gSongTable[SE_269].header)
                    && (sp14 == 6)) {
                    m4aSongNumStart(SE_269);
                }
                // _0804E30A

                SuperSonicGetPos(&qSonicPos.x, &qSonicPos.y);

                r6 = (r5 + unk48->unk38) & ONE_CYCLE;

                result = sub_8004418(I(qSonicPos.y - r8), I(qSonicPos.x - sb));

                if ((r6 < (result + 0x10)) && (r6 > (result - 0x10))) {
                    sub_802BB54();
                    unk558->callback = sub_804F1EC;
                }
                // _0804E350

                gDispCnt |= DISPCNT_WIN0_ON;
                gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_HEIGHT);
                gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_WIDTH);
                gWinRegs[WINREG_WININ] = WININ_WIN0_ALL;
                gWinRegs[WINREG_WINOUT]
                    = (WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2 | WINOUT_WIN01_OBJ);
                gBldRegs.bldCnt
                    = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
                gBldRegs.bldAlpha = BLDALPHA_BLEND(8, 0);
                gBldRegs.bldY = 8;

                // NOTE: Why would you call Mod() for % 8? *sigh*
                r4 = (s8)Mod(PseudoRandom32(), 8);
                if (r4 < 0) {
                    r4 = -r4;
                }
                // _0804E39A

                sb += ((COS(r6) * gUnknown_080D89A5[5]) >> 6);
                r8 += ((SIN(r6) * gUnknown_080D89A5[5]) >> 6);

                r1 = (26 - (s8)r4);

                sub_802E784(r6, r1, 16, (I(sb) - gCamera.x), (I(r8) - gCamera.y), r5);
            } else {
                u16 result;
                u32 p0;
                // _0804E43C
                sub_802C704(8, &qSonicPos.x, &qSonicPos.y);

                result = sub_8004418(I(qSonicPos.y - r8), I(qSonicPos.x - sb));
                if (sub_808558C((r5 + unk48->unk38) & ONE_CYCLE, result, 10) < 0) {
                    if (unk48->unk38 > 512) {
                        if (unk48->unk38 > 0x380)
                            unk48->unk38 -= 4;
                    } else {
                        unk48->unk38 -= 4;
                    }
                } else {
                    if (unk48->unk38 < 512) {
                        if (unk48->unk38 < 128)
                            unk48->unk38 += 4;
                    } else {
                        unk48->unk38 += 4;
                    }
                }

                unk48->unk38 &= ONE_CYCLE;
            }
        }
    }
}
END_NONMATCH

// (89.56%) https://decomp.me/scratch/sGKWf
NONMATCH("asm/non_matching/game/bosses/boss_9__sub_804E4CC.inc",
         void sub_804E4CC(struct TA53_unk48 *unk48))
{
    u16 r2;

    s32 r5;
    u8 i, c;

    sub_8050030(unk48);

    r5 = unk48->unk30 & 0xFFF;
    r2 = unk48->unk30 >> 12;

    if (r2 == 4) {
        unk48->unk30 &= 0xFFF;
        unk48->callback = gUnknown_080D8D6C[0].callback;
        unk48->unk34 = gUnknown_080D8D6C[0].ref;
        unk48->unk2E = gUnknown_080D8D6C[0].unk8;
    } else if (r2 == 3) {
        // _0804E50C+0x4
        gDispCnt &= ~DISPCNT_BG1_ON;

        for (c = 0; c < 16; c++) {
            s32 r = ((sRGB_080D8E20[3][c][0] * r5) >> 12) & 0x1F;
            s32 g = ((sRGB_080D8E20[3][c][1] * r5) >> 12) & 0x1F;
            s32 b = ((sRGB_080D8E20[3][c][2] * r5) >> 12) & 0x1F;

            gObjPalette[8 * 16 + c] = RGB16_REV(r, g, b);
            gBgPalette[8 * 16 + c] = RGB16_REV(r, g, b);
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        unk48->unk4C = 0;
    } else if ((r2 == 2) && ((u32)r5 > 0xE00)) {
        // __0804E5BC
        u16 r6;

        gDispCnt |= DISPCNT_BG1_ON;

        r6 = 0xFFF - r5;

        for (i = 0; i < ARRAY_COUNT(sRGB_080D8E20) - 1; i++) {
            for (c = 0; c < ARRAY_COUNT(sRGB_080D8E20[0]); c++) {
                s32 r = ((sRGB_080D8E20[i][c][0] * r6) >> 9) & 0x1F;
                s32 g = ((sRGB_080D8E20[i][c][1] * r6) >> 9) & 0x1F;
                s32 b = ((sRGB_080D8E20[i][c][2] * r6) >> 9) & 0x1F;

                gBgPalette[((7 + i) * 16) + c] = RGB16_REV(r, g, b);
            }
        }

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }
}
END_NONMATCH

void sub_804E66C(struct TA53_unk98 *unk98)
{
    bool32 sb;
    u8 i;

    if (--unk98->unk4 == 0) {
        unk98->callback = sub_804E74C;
        unk98->unk4 = 300;
    }

    // They call Mod() with a power-of-2 again...
    sb = (Mod(gStageTime, 4) == 0) ? 1 : 0;

    for (i = 0; i < 3; i++) {
        TA53_unkA8 *unkA8 = &unk98->unk10[i];
        TA53_RocketExhaust *exhaust = &unkA8->exhaust;

        exhaust->callback(exhaust);

        if (unkA8->unk4 & 0x1) {
            if (sb && unkA8->callback != sub_804EC6C) {
                u16 index = (unkA8->unkC + Q(0.125)) & ONE_CYCLE;
                s32 qX = (unkA8->pos14.x - ((COS(index) * 5) >> 5));
                s32 qY = (unkA8->pos14.y - ((SIN(index) * 5) >> 5));
                sub_804DE5C(qX, qY, exhaust, index);
            }

            unkA8->callback(unkA8);
        }
    }

    sub_804E8E8(unk98);
}

void sub_804E74C(struct TA53_unk98 *unk98)
{
    bool32 sb;
    TA53_unkA8 *unkA8;
    TA53_RocketExhaust *exhaust;
    u16 unk4 = --unk98->unk4;
    u8 i = 3;

    if (unk4 == 0) {
        unk98->callback = sub_804E66C;
        unk98->unk4 = 600;
    } else if (unk4 == 270) {
        i = 0;
    } else if (unk4 == 210) {
        i = 1;
    } else if (unk4 == 150) {
        i = 2;
    }

    if (i < 3) {
        Sprite *s;
        s32 unk8, unkC;
        unkA8 = &unk98->unk10[i];
        unkA8->callback = gUnknown_080D8E14[0];
        unkA8->unk4 = 3;
        i = 0;

        unkA8->unk8 = 600;
        unkA8->unkA = (unk98->unk6 & ONE_CYCLE);

        unkA8->unkE = COS(unk98->unk6) >> 5;
        unkA8->unk10 = SIN(unk98->unk6) >> 5;

        unk8 = unk98->qUnk8;
        unkA8->pos14.x = unk98->qUnk8;

        unkC = unk98->qUnkC;
        unkA8->pos14.x = unk8 + unkA8->unkE * 13;
        unkA8->pos14.y = unkC + unkA8->unk10 * 13;

        unkA8->unk1C = 0x80;
        unkA8->unk6 = i;
        unkA8->unk5 = 5;

        s = &unkA8->spr20;
        s->graphics.anim = gUnknown_080D8918[0].anim;
        s->variant = gUnknown_080D8918[0].variant;
        s->prevVariant = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
        s->palId = 6;
        m4aSongNumStart(SE_266);
    }

    sb = (Mod(gStageTime, 4) == 0) ? 1 : 0;

    for (i = 0; i < 3; i++) {
        unkA8 = &unk98->unk10[i];
        exhaust = &unkA8->exhaust;

        exhaust->callback(exhaust);

        if (unkA8->unk4 & 0x1) {
            if (sb) {
                s32 qX = (unkA8->pos14.x - ((COS(unkA8->unkA) * 5) >> 5));
                s32 qY = (unkA8->pos14.y - ((SIN(unkA8->unkA) * 5) >> 5));
                sub_804DE5C(qX, qY, exhaust, unkA8->unkA);
            }

            unkA8->callback(unkA8);
        }
    }

    sub_804E8E8(unk98);
}

void sub_804E8E8(TA53_unk98 *unk98)
{
    TA53_unkA8 *unkA8;
    Sprite *s;
    u16 index;
    u8 i;

    for (i = 0; i < 3; i++) {
        unkA8 = &unk98->unk10[i];

        if (unkA8->unk4 & 0x1) {
            s = &unkA8->spr20;

            index = ((unkA8->unkC + Q(0.125)) & ONE_CYCLE) >> 6;

            if (s->graphics.anim == gUnknown_080D8918[0].anim) {
                s->variant = gUnknown_080D8918[index].variant;
            }

            s->x = I(unkA8->pos14.x) - gCamera.x;
            s->y = I(unkA8->pos14.y) - gCamera.y;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }
}

void sub_804E974(struct TA53_unkA8 *unkA8)
{
    Vec2_32 qSonicPos;
    Sprite *s = &unkA8->spr20;
    bool32 r8 = FALSE;
    u16 sinVal;

    SuperSonicGetPos(&qSonicPos.x, &qSonicPos.y);

    qSonicPos.x += Q(16);
    qSonicPos.y += Q(0);

    if (--unkA8->unk8 == 0) {
        r8 = TRUE;
    } else if (unkA8->unk8 < 170) {
        unkA8->unk4 &= ~0x2;
    }

    sinVal
        = sub_8004418(I(qSonicPos.y - unkA8->pos14.y), I(qSonicPos.x - unkA8->pos14.x));
    ;
    unkA8->unkC = sinVal;

    if (unkA8->unk5 > 0) {
        --unkA8->unk5;
    } else {
        if (sub_808558C(unkA8->unkA, sinVal, 10) < 0) {
            unkA8->unkA -= 5;
        } else {
            unkA8->unkA += 5;
        }
    }

    unkA8->unkA &= ONE_CYCLE;
    unkA8->unkE -= Div(unkA8->unkE, 40);
    unkA8->unk10 -= Div(unkA8->unk10, 40);

    unkA8->unkE += Div(COS(unkA8->unkA), 850);
    unkA8->unk10 += Div(SIN(unkA8->unkA), 850);
    unkA8->pos14.x += Q(5) + unkA8->unkE;
    unkA8->pos14.y += Q(0) + unkA8->unk10;

    if (!(SuperSonicGetFlags() & (SUPER_FLAG__200 | SUPER_FLAG__8))) {
        if (sub_804EE84(s, I(unkA8->pos14.x), I(unkA8->pos14.y)) == TRUE) {
            u16 rot;

            unkA8->callback = gUnknown_080D8E14[1];
            rot = SuperSonicGetRotation();

            unkA8->unkE = COS(rot) >> 4;
            unkA8->unk10 = SIN(rot) >> 4;

            s->unk10 = SPRITE_FLAG(PRIORITY, 1);

            r8 = FALSE;
            m4aSongNumStart(SE_268);
        } else if (sub_804F010(s, I(unkA8->pos14.x), I(unkA8->pos14.y), 1) == TRUE) {
            if (sub_802BA8C() == TRUE) {
                r8 = TRUE;
            }
        }

        if (r8) {
            unkA8->unk4 |= 0x4;
            unkA8->callback = gUnknown_080D8E14[2];
            unkA8->unk8 = 16;

            s->graphics.anim = gUnknown_080D8918[16].anim;
            s->variant = gUnknown_080D8918[16].variant;
            s->prevVariant = -1;
            s->unk10 = SPRITE_FLAG(PRIORITY, 1);
            s->palId = 0;
            m4aSongNumStart(SE_267);
        }
    }
}

void sub_804EB6C(struct TA53_unkA8 *unkA8)
{
    Sprite *s = &unkA8->spr20;

    TA53Boss *boss = TASK_DATA(gCurTask);

    if (--unkA8->unk8 == 0) {
        s->graphics.anim = gUnknown_080D8918[16].anim;
        s->variant = gUnknown_080D8918[16].variant;
        s->prevVariant = -1;
        s->palId = 0;
        unkA8->callback = gUnknown_080D8E14[2];
        unkA8->unk8 = 16;
    } else {
        u32 index = (unkA8->unkA + 0x8C) & ONE_CYCLE;
        unkA8->unkA = index;
        unkA8->unkC = index;

        unkA8->pos14.x += Q(5) + unkA8->unkE;
        unkA8->pos14.y += Q(0) + unkA8->unk10;

        if (boss->unkD == 0) {
            if ((unkA8->unk6 == 0)
                && sub_804ED98(I(unkA8->pos14.x), I(unkA8->pos14.y))) {
                if (boss->unkC & 0x1) {
                    m4aSongNumStart(SE_143);
                } else {
                    m4aSongNumStart(SE_235);
                }

                s->graphics.anim = gUnknown_080D8918[16].anim;
                s->variant = gUnknown_080D8918[16].variant;
                s->prevVariant = -1;
                s->palId = 0;
                unkA8->callback = gUnknown_080D8E14[2];
                unkA8->unk8 = 16;

                boss->unkD = 48;

                if (boss->unkC > 0) {
                    boss->unkC--;
                }
            }
        }
    }
}

void sub_804EC6C(struct TA53_unkA8 *unkA8)
{
    if (--unkA8->unk8 == 0) {
        unkA8->unk4 = 0;
    } else {
        unkA8->unkE -= Div(unkA8->unkE, 40);
        unkA8->unk10 -= Div(unkA8->unk10, 40);

        unkA8->pos14.x += unkA8->unkE;
        unkA8->pos14.y += unkA8->unk10;

        unkA8->pos14.x += Q(5);
        unkA8->pos14.y += Q(0);
    }
}

void sub_804ECC4(TA53Boss *boss)
{
    Vec2_32 qSonicPos;
    s32 x, y, xSq, ySq;
    u16 r1;
    s32 distSonicSq;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;

    SuperSonicGetPos(&qSonicPos.x, &qSonicPos.y);

    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;

    x = unk1C->qPos.x + Q(unk1C->unk20);
    y = unk1C->qPos.y + Q(unk1C->unk22);

    r1 = (I(unk48->qPos44.x) + unk48->unk3A[0] + Q(3)) & ONE_CYCLE;

    x += ((COS(r1) * 5) >> 4);
    y += ((SIN(r1) * 5) >> 4);

    r1 = (r1 + Q(3)) & ONE_CYCLE;
    x += ((COS(r1) * 5) >> 5);
    y += ((SIN(r1) * 5) >> 5);

    x -= qSonicPos.x;
    y -= qSonicPos.y;

    xSq = I(x);
    ySq = I(y);
    xSq = xSq * xSq;
    ySq = ySq * ySq;
    distSonicSq = xSq + ySq;

    if (distSonicSq < SQUARE(40)) {
        sub_802BA8C();
    }
}

bool32 sub_804ED98(s32 _x, s32 _y)
{
    bool32 result = FALSE;
    TA53Boss *boss = TASK_DATA(gCurTask);
    s32 x, y, xSq, ySq;
    u16 r1;
    s32 distSonicSq;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;

    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;

    x = unk1C->qPos.x + Q(unk1C->unk20);
    y = unk1C->qPos.y + Q(unk1C->unk22);

    r1 = (I(unk48->qPos44.x) + unk48->unk3A[0] + Q(3)) & ONE_CYCLE;

    x += ((COS(r1) * 5) >> 4);
    y += ((SIN(r1) * 5) >> 4);

    r1 = (r1 + Q(3)) & ONE_CYCLE;
    x += ((COS(r1) * 5) >> 5);
    y += ((SIN(r1) * 5) >> 5);

    xSq = I(x);
    ySq = I(y);
    xSq -= _x;
    ySq -= _y;

    xSq = xSq * xSq;
    ySq = ySq * ySq;
    distSonicSq = xSq + ySq;

    if (distSonicSq < SQUARE(40)) {
        result = TRUE;
    }

    return result;
}

bool32 sub_804EE84(Sprite *sprIn, s32 x, s32 y)
{
    s32 sonicX = 0, sonicY = 0;
    Sprite *sprSonic = SuperSonicGetSprite();

    SuperSonicGetPos(&sonicX, &sonicY);

    if (SuperSonicGetFlags() & (SUPER_FLAG__200 | SUPER_FLAG__8)) {
        return FALSE;
    }

    if (!PLAYER_IS_ALIVE || !HITBOX_IS_ACTIVE(sprIn->hitboxes[1])
        || !HITBOX_IS_ACTIVE(sprSonic->hitboxes[1])) {
        return FALSE;
    }

    if (RECT_COLLISION(x, y, &sprIn->hitboxes[1], I(sonicX), I(sonicY),
                       &sprSonic->hitboxes[1])) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_804EF68(Sprite *sprRocket, s32 rocketX, s32 rocketY, Sprite *sprMouth,
                   s32 mouthX, s32 mouthY)
{
    if ((!HITBOX_IS_ACTIVE(sprRocket->hitboxes[1]))
        || (!HITBOX_IS_ACTIVE(sprMouth->hitboxes[0]))) {
        return FALSE;
    }

    if (RECT_COLLISION(rocketX, rocketY, &sprRocket->hitboxes[1], mouthX, mouthY,
                       &sprMouth->hitboxes[0])) {
        return TRUE;
    } else {
        return FALSE;
    }
}

bool32 sub_804F010(Sprite *s, s32 x, s32 y, u8 hbIndex)
{
    s32 sonicX = 0, sonicY = 0;
    Sprite *sprSonic = SuperSonicGetSprite();

    SuperSonicGetPos(&sonicX, &sonicY);
#ifndef NON_MATCHING
    // Effectively this func call is a no-op as the flags aren't used
    SuperSonicGetFlags();
#endif

    if (!PLAYER_IS_ALIVE || !HITBOX_IS_ACTIVE(s->hitboxes[hbIndex])
        || !HITBOX_IS_ACTIVE(sprSonic->hitboxes[0])) {
        return FALSE;
    }

    if (HB_COLLISION(x, y, s->hitboxes[hbIndex], I(sonicX), I(sonicY),
                     sprSonic->hitboxes[0])) {
        return TRUE;
    } else {
        return FALSE;
    }
}
