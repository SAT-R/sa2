#include "global.h"
#include "flags.h"
#include "rect.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "game/math.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"
#include "game/stage/player_super_sonic.h"
#include "game/stage/results.h"
#include "game/stage/ui.h"
#include "game/stage/screen_mask.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/camera.h"
#include "game/sa1_sa2_shared/player.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ u16 anim;
    /* 0x06 */ u8 variant;
    /* 0x07 */ u8 unk7;
    /* 0x08 */ u8 palId;
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
void sub_804F47C(struct TA53_unk558 *);
void sub_8050DC8(struct TA53_unk558 *);
void TaskDestructor_TrueArea53BossGfx(struct Task *);
void sub_80508C4(TA53Boss *boss, u16 blend, bool8 param2);

void sub_804DD9C(struct TA53_RocketExhaust *);
void sub_804DFB0(TA53_unk594 *unk594);
void sub_804E66C(struct TA53_unk98 *);
void sub_804E74C(struct TA53_unk98 *);
void sub_804E8E8(struct TA53_unk98 *);
void sub_804FEFC(struct TA53_unk654 *);
void sub_804FF9C(struct TA53_unk654 *);

static void UpdateExplosion(TA53Boss *);
void sub_804E078(struct TA53_unk48 *);
void sub_804E15C(struct TA53_unk48 *);
void sub_804E4CC(struct TA53_unk48 *);
void sub_804ECC4(TA53Boss *);
bool8 sub_8050030(struct TA53_unk48 *);
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

void sub_804E974(struct TA53_unkA8 *rocket);
void sub_804EB6C(struct TA53_unkA8 *rocket);
bool32 sub_804ED98(s32, s32);
void sub_804EC6C(struct TA53_unkA8 *rocket);
bool32 sub_804EE84(Sprite *s, s32 x, s32 y);
bool32 sub_804F010(Sprite *s, s32 x, s32 y, u8 param3);

const TileInfo gUnknown_080D88F0[5] = {
    { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_0, 0 }, { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_1, 0 },
    { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_SEGMENT_2, 0 }, { 8 * 8, SA2_ANIM_TRUE_AREA_53_BOSS_CANNON, 0 },
    { 10 * 9, SA2_ANIM_TRUE_AREA_53_BOSS_COCKPIT, 0 },
};

const TileInfo gUnknown_080D8918[17] = {
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 12 },    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 11 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 10 },   { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 9 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 8 },     { 12, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 7 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 6 },    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 5 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 4 },     { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 3 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 2 },    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 1 },
    { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 0 },     { 12, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 15 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 14 },   { 8, SA2_ANIM_TRUE_AREA_53_BOSS_ROCKET, 13 },
    { 16, SA2_ANIM_TRUE_AREA_53_BOSS_EXPLOSION, 0 },
};

const s8 gUnknown_080D89A0[5] = { 0, -4, -8, -12, -16 };
const u8 gUnknown_080D89A5[6] = { 0, 20, 24, 20, 18, 30 };

const TA53SubFunc gUnknown_080D89AC[7] = { sub_804F6AC, sub_804F768, sub_804F850, sub_804F9BC, sub_804FAA4, sub_804FC10, sub_804FD58 };

const TA53_80D89C8 gUnknown_080D89C8[7]
    = { { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 }, { 0, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 0, 1, 0 },
        { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 }, { 0, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 0, 1, 0 },
        { 0, SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED, 0, 0, 1, 0 }, { 0, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 0, 1, 0 },
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
    &gUnknown_080D8A1C, &gUnknown_080D8A34, &gUnknown_080D8A4C, &gUnknown_080D8A64, &gUnknown_080D8A7C,
};

const void *const gUnknown_080D8C10[5] = {
    &gUnknown_080D8A94, &gUnknown_080D8AAC, &gUnknown_080D8AC4, &gUnknown_080D8ADC, &gUnknown_080D8AF4,
};

const void *const gUnknown_080D8C24[5] = {
    &gUnknown_080D8B0C, &gUnknown_080D8B24, &gUnknown_080D8B3C, &gUnknown_080D8B54, &gUnknown_080D8B6C,
};

const void *const gUnknown_080D8C38[5] = {
    &gUnknown_080D8B84, &gUnknown_080D8B9C, &gUnknown_080D8BB4, &gUnknown_080D8BCC, &gUnknown_080D8BE4,
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

const TA53_Data0 gUnknown_080D8D6C[8] = {
    { sub_804E078, (void *)&gUnknown_080D8BFC, 40 },  { sub_804E4CC, (void *)&gUnknown_080D8BFC, 40 },
    { sub_8050BFC, (void *)&gUnknown_080D8C24, 126 }, { sub_8050C50, (void *)&gUnknown_080D8C24, 512 },
    { sub_804E15C, (void *)&gUnknown_080D8C38, 160 }, { sub_8050CBC, (void *)&gUnknown_080D8C10, 80 },
    { sub_8050D24, (void *)&gUnknown_080D8C10, 80 },  { sub_8050D9C, (void *)&gUnknown_080D8C10, 80 },
};

const TA53_Data1 gUnknown_080D8DCC[6] = {
    { sub_8050BD8, (void *)&gUnknown_080D8D3C, 40 },  { sub_8050BE4, (void *)&gUnknown_080D8D54, 100 },
    { sub_8050BE4, (void *)&gUnknown_080D8D5C, 100 }, { sub_8050BE4, (void *)&gUnknown_080D8D5C, 100 },
    { sub_8050BF0, (void *)&gUnknown_080D8D44, 20 },  { sub_8050BF0, (void *)&gUnknown_080D8D4C, 100 },
};

const TA53_Rocket_Callback gUnknown_080D8E14[3] = { sub_804E974, sub_804EB6C, sub_804EC6C };
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

const u8 gUnknown_080D8EE0[16] = { 0, 1, 2, 3, 2, 1, 0, 1, 2, 3, 2, 1, 0, 1, 2, 3 };

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

    gActiveBossTask = TaskCreate(Task_EggmanKidnapsVanilla, sizeof(TA53Boss), 0x4000, 0, TaskDestructor_TrueArea53BossGfx);

    CreateTrueArea53Boss();

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;
    boss->unk12 = 0x230;

    unk48->unk30 &= 0xFFF;
    unk48->callback = gUnknown_080D8D6C[4].callback;
    unk48->unk34 = gUnknown_080D8D6C[4].data;
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
    unk48->unk34 = gUnknown_080D8D6C[5].data;
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

    gDispCnt = (DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_1);
}

void CreateTrueArea53Boss(void)
{
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;
    TA53_unk98 *unk98;
    // Required to be here for match
    s32 unused;
    TA53_unk558 *unk558;
    TA53_unk594 *unk594;
    TA53_unk654 *unk654;
    ScreenFade *fade;
    void *vram;
    Sprite *s;
    u32 i, j;

    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

    if (gActiveBossTask == NULL) {
        gActiveBossTask = TaskCreate(Task_TrueArea53BossMain, sizeof(TA53Boss), 0x4000, 0, TaskDestructor_TrueArea53BossGfx);
    }

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;
    unk98 = &boss->unk98;
    unk558 = &boss->unk558;
    unk594 = &boss->unk594;
    unk654 = &boss->unk654;

    boss->lives = 12;
    boss->unkD = 0;

    boss->unk10 = 1;
    boss->unk12 = 80;
    boss->unkE = 0;
    boss->unkF = 0;
    boss->qPos.x = 0;
    boss->qPos.y = 0;

    fade = &boss->fade;
    fade->window = 0;
    fade->brightness = Q(0);
    fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
    fade->speed = 20;
    fade->bldCnt = (BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
    fade->bldAlpha = 0;

    unk558 = &boss->unk558;
    unk558->callback = sub_8050DC8;
    unk558->unk6 = 200;
    unk558->unk4 = 0;

    unk1C->unk18 &= 0xFFF;
    unk1C->callback = gUnknown_080D8DCC->callback;
    unk1C->unk1C = gUnknown_080D8DCC->data;
    unk1C->unk16 = gUnknown_080D8DCC->unk8;

    unk1C->qPos.x = Q(1267);
    unk1C->qPos.y = Q(112);
    unk1C->unk20 = 0;
    unk1C->unk22 = 0;
    unk1C->unk14 = unk1C->unk16;
    unk1C->unk18 = 0;

    for (j = 0; j < 4; j++) {
        unk1C->unk4[j] = gUnknown_080D8C4C[j];
        unk1C->unkC[j] = gUnknown_080D8C64[j];
    }

    unk48->unk30 &= 0xFFF;
    unk48->callback = gUnknown_080D8D6C[1].callback;
    unk48->unk34 = gUnknown_080D8D6C[1].data;
    unk48->unk2E = gUnknown_080D8D6C[1].unk8;
    unk48->unk4C = 1;
    unk48->unk38 = 0;
    unk48->qPos44.x = 0;
    unk48->qPos44.y = 0;
    unk48->unk2C = gUnknown_080D8D6C[0].unk8;
    unk48->unk30 = 0;
    unk48->unk4;

    for (j = 0; j < 4; j++) {
        unk48->unk4[j] = gUnknown_080D8A1C[0][j];
        unk48->unkC[j] = gUnknown_080D8A34[0][j];
        unk48->unk14[j] = gUnknown_080D8A4C[0][j];
        unk48->unk1C[j] = gUnknown_080D8A64[0][j];
        unk48->unk24[j] = gUnknown_080D8A7C[0][j];
    }

    unk594->callback = sub_804DFB0;

    for (i = 0; i < 10; i++) {
        // _0804D118
        unk594->unk4[i] = 0;
        unk594->unkE[i] = 0;
        unk594->unk18[i][0] = 0;
        unk594->unk18[i][1] = 0;
        unk594->unk40[i].x = 0;
        unk594->unk40[i].y = 0;
    }

    unk654->callback = sub_804FF9C;
    unk654->func4 = sub_804F768;
    unk654->unk8 = 300;
    unk654->unkA = 512;

    for (i = 0; i < 16; i++) {
        unk654->unkE[i] = 0;
        unk654->unk1E[i] = 0;
        unk654->unk2E[i][0] = 0;
        unk654->unk2E[i][1] = 0;
        unk654->qPos70[i].x = 0;
        unk654->qPos70[i].y = 0;
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
        TA53_unkA8 *unk10 = &unk98->unk10[i];
        TA53_RocketExhaust *exhaust;
        s = &unk10->spr20;

        unk10->unk4 = 0;
        unk10->unkA = 0;
        unk10->unkE = 0;
        unk10->unk10 = 0;
        unk10->pos14.x = 0;
        unk10->pos14.y = 0;

        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(16);
        s->graphics.anim = gUnknown_080D8918[0].anim;
        s->variant = gUnknown_080D8918[0].variant;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(17);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;

        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 6;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        exhaust = &unk10->exhaust;
        exhaust->callback = sub_804DD9C;

        // Rocket Exhaust Clouds
        for (j = 0; j < 5; j++) {
            // _0804D25C
            s = &exhaust->s[j];

            exhaust->unk4[j] = 0;
            exhaust->unkA[j][0] = 0;
            exhaust->unkA[j][1] = 0;
            exhaust->pos[j].x = 0;
            exhaust->pos[j].y = 0;

            s->x = 0;
            s->y = 0;
            s->graphics.dest = vram;
            s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_CLOUD;
            s->variant = 0;
            s->prevVariant = -1;
            s->oamFlags = SPRITE_OAM_ORDER(16);
            s->graphics.size = 0;
            s->animCursor = 0;
            s->qAnimDelay = 0;
            s->animSpeed = SPRITE_ANIM_SPEED(1.0);
            s->palId = 6;
            s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
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
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    // Not the correct sprite in this place, but matches with higher %
    for (i = 0; i < 4; i++) {
        s = &boss->capsule[i].s;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(gUnknown_080D88F0[i].numTiles);
        s->graphics.anim = gUnknown_080D88F0[i].anim;
        s->variant = gUnknown_080D88F0[i].variant;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(i + 20);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(OBJ_MODE, 2);
    }

    s = &unk558->s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(16);
    s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_SUCK_FX;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(21);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    // Rings that get "sucked out" by the Boss?
    s = &unk594->spr90;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_UI_RING;
    s->variant = 8;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(6);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    // Yellow Projectile
    s = &unk654->sprF0;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(9);
    s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_YELLOW;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    // Red Projectile
    s = &unk654->spr128;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_RED;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(7);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
}

void TrueArea53BossMove(s32 dX, s32 dY)
{
    u8 i, j;
    TA53Boss *boss;
#ifndef NON_MATCHING
    TA53_unk594 *hack;
#endif
    TA53_unk594 *unk594;
    TA53_unk1C *unk1C;
    TA53_unk98 *unk98;
    TA53_unkA8 *unkA8;
    TA53_unk654 *unk654;

    if (gActiveBossTask == NULL)
        return;

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;

#ifndef NON_MATCHING
    hack = &boss->unk594;
#endif

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
#ifndef NON_MATCHING
        unk594 = hack;
#endif
        unk594->unk40[i].x += dX;
        unk594->unk40[i].y += dY;
    }
    // _0804D668 - 0x6

    for (i = 0; i < 16; i++) {
        unk654 = &boss->unk654;
        unk654->qPos70[i].x += dX;
        unk654->qPos70[i].y += dY;
    }
    // _0804D684
}

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
        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        TaskDestroy(gCurTask);
        return;
    }

    unk558->callback(unk558);
    unk1C->callback(unk1C);
    unk48->callback(unk48);
    sub_80505B8(boss);

    gWinRegs[WINREG_WINOUT] = (WINOUT_WINOBJ_CLR | WINOUT_WINOBJ_BG0 | WINOUT_WINOBJ_BG1 | WINOUT_WINOBJ_BG2 | WINOUT_WIN01_CLR
                               | WINOUT_WIN01_OBJ | WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2);

    gFlags |= FLAGS_EXECUTE_HBLANK_COPY;
    gHBlankCopyTarget = (void *)&REG_BG1VOFS;
    gHBlankCopySize = 2;

    offset = gBgOffsetsHBlankPrimary;
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

    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

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
            s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
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

    if (boss->lives == 0) {
        MPlayStop(&gMPlayInfo_SE1);
        MPlayStop(&gMPlayInfo_SE2);
        MPlayStop(&gMPlayInfo_SE3);

        gStageFlags |= (STAGE_FLAG__DISABLE_PAUSE_MENU | STAGE_FLAG__2 | STAGE_FLAG__ACT_START);
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

        PAUSE_BACKGROUNDS_QUEUE();
        gBgSpritesCount = 0;

        PAUSE_GRAPHICS_QUEUE();

        gStageFlags |= STAGE_FLAG__TURN_OFF_HUD;

        CreateStageUI();
        CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);

        gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
    }
}

static void UpdateExplosion(TA53Boss *boss)
{
    ExplosionPartsInfo info;

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
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
        if (boss->lives > 4) {
            unk48->unk30 &= 0xFFF;
            unk48->callback = gUnknown_080D8D6C[4].callback;
            unk48->unk34 = gUnknown_080D8D6C[4].data;
            unk48->unk2E = gUnknown_080D8D6C[4].unk8;
        } else {
            u8 index = Mod(gStageTime, 3) + 1;
            unk48->unk30 &= 0xFFF;
            unk48->callback = gUnknown_080D8D6C[2].callback;
            unk48->unk34 = gUnknown_080D8D6C[2].data;
            unk48->unk2E = gUnknown_080D8D6C[2].unk8;
            unk1C->unk18 &= 0xFFF;

            unk1C->callback = gUnknown_080D8DCC[index].callback;
            unk1C->unk1C = gUnknown_080D8DCC[index].data;
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

void sub_804E15C(struct TA53_unk48 *unk48)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk558 *unk558 = &boss->unk558;
    TA53_unk1C *unk1C = &boss->unk1C;
    s32 qSonicX, qSonicY;
    u8 sp14, i;

    if (sub_8050030(unk48) != 0) {
        unk48->unk30 &= 0xFFF;
        unk48->callback = gUnknown_080D8D6C[0].callback;
        unk48->unk34 = gUnknown_080D8D6C[0].data;
        unk48->unk2E = gUnknown_080D8D6C[0].unk8;

        gDispCnt &= ~(DISPCNT_WIN0_ON);
        gWinRegs[WINREG_WININ] = 0;
        gWinRegs[WINREG_WINOUT] = 0;

        gBldRegs.bldCnt = 0;
        gBldRegs.bldAlpha = 0;
        gBldRegs.bldY = 0;
        return;
    }

    sp14 = (unk48->unk30 >> 12);
    if (sp14 > 2) {
        // _0804E1EC
        s32 sb = unk1C->qPos.x + Q(unk1C->unk20);
        s32 r8 = unk1C->qPos.y + Q(unk1C->unk22);

        s32 r4, r5 = CLAMP_SIN_PERIOD(I(unk48->qPos44.x) + unk48->unk3A[0]);
        u16 r6;

        sb += ((COS(r5) * gUnknown_080D89A5[0]) >> 6);
        r8 += ((SIN(r5) * gUnknown_080D89A5[0]) >> 6);

        r5 += 0x8C;

        sb += ({
            s32 val = COS((r5 - Q(1)) & ONE_CYCLE);
            val >> 2;
        });
        r8 += ({
            s32 val = SIN((r5 - Q(1)) & ONE_CYCLE);
            val >> 2;
        });

        for (i = 0; i < 3; i++) {
            // _0804E278
            r5 += unk48->unk3A[i + 1];
            r5 &= ONE_CYCLE;

            sb += ((COS(r5) * gUnknown_080D89A5[i + 1]) >> 6);
            r8 += ((SIN(r5) * gUnknown_080D89A5[i + 1]) >> 6);
        }

        sb += ((COS(r5) * gUnknown_080D89A5[4]) >> 6);
        r8 += ((SIN(r5) * gUnknown_080D89A5[4]) >> 6);

        r5 += unk48->unk42;
        r5 &= ONE_CYCLE;

        if (sp14 > 5) {
            // _0804E2EE

            if ((gMPlayTable[2].info->songHeader != gSongTable[SE_269].header) && (sp14 == 6)) {
                m4aSongNumStart(SE_269);
            }
            // _0804E30A

            SuperSonicGetPos(&qSonicX, &qSonicY);

            r5 += unk48->unk38;
            r6 = CLAMP_SIN_PERIOD(r5);

            r5 = (u16)sub_8004418(I(qSonicY - r8), I(qSonicX - sb));

            if ((r6 < (r5 + 0x10)) && (r6 > (r5 - 0x10))) {
                sub_802BB54();
                unk558->callback = sub_804F1EC;
            }
            // _0804E350

            gDispCnt |= DISPCNT_WIN0_ON;
            gWinRegs[WINREG_WIN0H] = WIN_RANGE(0, DISPLAY_HEIGHT);
            gWinRegs[WINREG_WIN0V] = WIN_RANGE(0, DISPLAY_WIDTH);
            gWinRegs[WINREG_WININ] = WININ_WIN0_ALL;
            gWinRegs[WINREG_WINOUT] = (WINOUT_WIN01_BG0 | WINOUT_WIN01_BG2 | WINOUT_WIN01_OBJ);
            gBldRegs.bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);

            r5 = 8;
            gBldRegs.bldAlpha = BLDALPHA_BLEND(r5, 0);
            gBldRegs.bldY = r5;

            // NOTE: Why would you call Mod() for % 8? *sigh*
            r4 = (s8)Mod(PseudoRandom32(), 8);
            if (r4 < 0) {
                r4 = -r4;
            }
            // _0804E39A

            sb += ((COS(r6) * gUnknown_080D89A5[5]) >> 6);
            r8 += ((SIN(r6) * gUnknown_080D89A5[5]) >> 6);

            ScreenMask_CreateShape(r6, (26 - (s8)r4), 16, (I(sb) - gCamera.x), (I(r8) - gCamera.y), r5);
        } else {
            u32 p0;
            // _0804E43C
            sub_802C704(8, &qSonicX, &qSonicY);

            r6 = sub_8004418(I(qSonicY - r8), I(qSonicX - sb));
            p0 = r5;
            p0 += unk48->unk38;
            if (sub_808558C(p0 & ONE_CYCLE, r6, 10) < 0) {
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

void sub_804E4CC(struct TA53_unk48 *unk48)
{
#ifndef NON_MATCHING
    register s32 r1 asm("r1");
#else
    s32 r1;
#endif
    s32 r3;
    u32 r5;
    u16 r6, r2;
    u8 i, c;
    u8 r, g, b;

    sub_8050030(unk48);

    r1 = unk48->unk30 & 0xFFF;
    r3 = r1;
    r5 = r3;

    r2 = unk48->unk30 >> 12;
    if (r2 == 4) {
        unk48->unk30 &= 0xFFF;
        unk48->callback = gUnknown_080D8D6C[0].callback;
        unk48->unk34 = gUnknown_080D8D6C[0].data;
        unk48->unk2E = gUnknown_080D8D6C[0].unk8;
        return;
    }

    if (r2 == 3) {
        // _0804E50C+0x4
        gDispCnt &= ~DISPCNT_BG1_ON;

        r6 = r3;
        for (c = 0; c < 16; c++) {
            r = sRGB_080D8E20[3][c][0];
            r = ((r * r6) >> 12) & 0x1F;
            g = sRGB_080D8E20[3][c][1];
            g = ((g * r6) >> 12) & 0x1F;
            b = sRGB_080D8E20[3][c][2];
            b = ((b * r6) >> 12) & 0x1F;

            gObjPalette[c + 8 * 16] = RGB16_REV(r, g, b);
            gBgPalette[c] = RGB16_REV(r, g, b);
        }

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
        unk48->unk4C = 0;
        return;
    }

    if ((r2 == 2) && (r5 > 0xE00)) {
        gDispCnt |= DISPCNT_BG1_ON;
        r6 = 0xFFF - r5;
        for (i = 0; i < ARRAY_COUNT(sRGB_080D8E20) - 1; i++) {
            for (c = 0; c < ARRAY_COUNT(sRGB_080D8E20[0]); c++) {
                r = sRGB_080D8E20[i][c][0];
                r = ((r * r6) >> 9) & 0x1F;
                g = sRGB_080D8E20[i][c][1];
                g = ((g * r6) >> 9) & 0x1F;
                b = sRGB_080D8E20[i][c][2];
                b = ((b * r6) >> 9) & 0x1F;
                gBgPalette[0x70 + c + (i * 16)] = RGB16_REV(r, g, b);
            }
        }

        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }
}

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
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
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

    sinVal = sub_8004418(I(qSonicPos.y - unkA8->pos14.y), I(qSonicPos.x - unkA8->pos14.x));
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

            s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

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
            s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
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
            if ((unkA8->unk6 == 0) && sub_804ED98(I(unkA8->pos14.x), I(unkA8->pos14.y))) {
                if (boss->lives & 0x1) {
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

                if (boss->lives > 0) {
                    boss->lives--;
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
    s32 qSonicX = 0, qSonicY = 0;
    Sprite *sprSonic = SuperSonicGetSprite();

    SuperSonicGetPos(&qSonicX, &qSonicY);

    if (SuperSonicGetFlags() & (SUPER_FLAG__200 | SUPER_FLAG__8)) {
        return FALSE;
    }

    if (!PLAYER_IS_ALIVE || !HITBOX_IS_ACTIVE(sprIn->hitboxes[1]) || !HITBOX_IS_ACTIVE(sprSonic->hitboxes[1])) {
        return FALSE;
    }

    if (RECT_COLLISION(x, y, &sprIn->hitboxes[1], I(qSonicX), I(qSonicY), &sprSonic->hitboxes[1])) {
        return TRUE;
    }

    return FALSE;
}

bool32 sub_804EF68(Sprite *sprRocket, s32 rocketX, s32 rocketY, Sprite *sprMouth, s32 mouthX, s32 mouthY)
{
    if ((!HITBOX_IS_ACTIVE(sprRocket->hitboxes[1])) || (!HITBOX_IS_ACTIVE(sprMouth->hitboxes[0]))) {
        return FALSE;
    }

    if (RECT_COLLISION(rocketX, rocketY, &sprRocket->hitboxes[1], mouthX, mouthY, &sprMouth->hitboxes[0])) {
        return TRUE;
    } else {
        return FALSE;
    }
}

bool32 sub_804F010(Sprite *s, s32 x, s32 y, u8 hbIndex)
{
    s32 qSonicX = 0, qSonicY = 0;
    Sprite *sprSonic = SuperSonicGetSprite();

    SuperSonicGetPos(&qSonicX, &qSonicY);
#ifndef NON_MATCHING
    // Effectively this func call is a no-op as the flags aren't used
    SuperSonicGetFlags();
#endif

    if (!PLAYER_IS_ALIVE || !HITBOX_IS_ACTIVE(s->hitboxes[hbIndex]) || !HITBOX_IS_ACTIVE(sprSonic->hitboxes[0])) {
        return FALSE;
    }

    if (HB_COLLISION(x, y, s->hitboxes[hbIndex], I(qSonicX), I(qSonicY), sprSonic->hitboxes[0])) {
        return TRUE;
    } else {
        return FALSE;
    }
}

// "suck" FX animation, but only in the cutscene, not the boss fight
void sub_804F108(TA53_unk558 *unk558)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    Sprite *s = &unk558->s;
    s32 qX, qY;
    s32 qSonicX, qSonicY;
    u16 index;

    if (boss->lives > 0) {
        qX = unk1C->qPos.x + Q(unk1C->unk20);
        qY = unk1C->qPos.y + Q(unk1C->unk22);

        index = (I(unk48->qPos44.x) + unk48->unk3A[0] + Q(3)) & ONE_CYCLE;
        qX += ((COS(index) * 9) >> 6);
        qY += ((SIN(index) * 9) >> 6);

        index = (index + Q(3)) & ONE_CYCLE;
        qX += ((COS(index) * 38) >> 6);
        qY += ((SIN(index) * 38) >> 6);

        s->x = I(qX) - gCamera.x - 6;
        s->y = I(qY) - gCamera.y + 5;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void sub_804F1EC(struct TA53_unk558 *unk558)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    TA53_unk98 *unk98 = &boss->unk98;
    Sprite *s = &unk558->s;

    if (boss->lives > 0) {
        s32 qX, qY;
        s32 qSonicX, qSonicY;
        s32 r7;
        u16 index;

        if (--unk558->unk6 == 0) {
            unk558->callback = sub_8050DC8;
            m4aSongNumStop(SE_SUCTION);
        }

        r7 = unk558->unk8 + 2;
        if (r7 > 464) {
            r7 = 464;
        }
        unk558->unk8 = r7;

        qX = unk1C->qPos.x + Q(unk1C->unk20);
        qY = unk1C->qPos.y + Q(unk1C->unk22);

        index = (I(unk48->qPos44.x) + unk48->unk3A[0] + Q(3)) & ONE_CYCLE;
        qX += ((COS(index) * 9) >> 6);
        qY += ((SIN(index) * 9) >> 6);

        index = (index + Q(3)) & ONE_CYCLE;
        qX += ((COS(index) * 38) >> 6);
        qY += ((SIN(index) * 38) >> 6);

        SuperSonicGetPos(&qSonicX, &qSonicY);

        qSonicX = sub_8085698(qSonicX, qX + Q(10), r7, 10, 2);
        qSonicY = sub_8085698(qSonicY, qY, r7 + Q(1), 10, 2);

        SuperSonicSetPos(qSonicX, qSonicY);

        if (sub_804F010(s, I(qX), I(qY), 0) == TRUE) {
            sub_802C798();

            unk558->callback = sub_804F47C;
            unk558->unk6 = 120;
            unk558->unk4 = 10;

            s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_MOUTH;
            s->variant = 0;
            s->prevVariant = -1;
            s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        } else {
            u8 i;
            m4aSongNumStartOrContinue(SE_SUCTION);

            s->x = I(qX) - gCamera.x;
            s->y = I(qY) - gCamera.y;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);

            for (i = 0; i < 3; i++) {
                TA53_unkA8 *unkA8 = &unk98->unk10[i];

                if (unkA8->unk4 & 1) {
                    s16 res = (sub_8004418(I(unkA8->pos14.y - qY), I(unkA8->pos14.x - qX)));
                    if ((res >= 301 && res <= 723) || (unkA8->unk6 > 0)) {
                        r7 = unkA8->unk1C + 0xA;
                        unkA8->unk6 = 1;
                        unkA8->unk1C = r7;

                        unkA8->pos14.x = sub_8085698(unkA8->pos14.x, +Q(22) + qX, (r7), 10, 2);

                        unkA8->pos14.y = sub_8085698(unkA8->pos14.y, qY, (r7 + 160), 10, 2);

                        unkA8->unkE = Div(unkA8->unkE * 90, 100);
                        unkA8->unk10 = Div(unkA8->unk10 * 90, 100);
                    }

                    if (sub_804EF68(&unkA8->spr20, I(unkA8->pos14.x), I(unkA8->pos14.y), s, I(qX) + 16, I(qY)) == TRUE) {
                        unkA8->unk4 = 0;
                    }
                }
            }
        }
    }
}

void sub_804F47C(struct TA53_unk558 *unk558)
{
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;
    Sprite *s;
    s32 qX, qY;
    u16 index;

    if (--unk558->unk6 == 0) {
        unk558->callback = sub_8050DC8;
    }

    boss = TASK_DATA(gCurTask);
    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;
    s = &unk558->s;

    if (boss->lives != 0) {
        qX = unk1C->qPos.x + Q(unk1C->unk20);
        qY = unk1C->qPos.y + Q(unk1C->unk22);

        index = (I(unk48->qPos44.x) + unk48->unk3A[0] + Q(3)) & ONE_CYCLE;
        qX += ((COS(index) * 9) >> 6);
        qY += ((SIN(index) * 9) >> 6);

        index = (index + Q(3)) & ONE_CYCLE;
        qX += ((COS(index) * 38) >> 6);
        qY += ((SIN(index) * 38) >> 6);

        s->x = I(qX) - gCamera.x;
        s->y = I(qY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        if (Mod(unk558->unk6, 10) == 0) {
            if (unk558->unk6 <= 100) {
                if (unk558->unk4 > 0) {
                    unk558->unk4--;

                    m4aSongNumStart(SE_271);

                    if (gRingCount > 0) {
                        gRingCount--;

                        sub_804DEEC(qX - Q(8), qY);
                    }
                }
            }
        }
    }
}

void sub_804F5BC(struct TA53_unk654 *unk654)
{
    Sprite *s = &unk654->spr128;
    s32 qX;
    u8 i = 0;
    bool32 animUpdated = FALSE;

    for (; i < ARRAY_COUNT(unk654->unk2E); i++) {
        if (unk654->unkE[i] > 0) {
            if (--unk654->unk1E[i] == 0) {
                unk654->unkE[i] = 0;
            }

            s->x = I(unk654->qPos70[i].x) - gCamera.x;
            s->y = I(unk654->qPos70[i].y) - gCamera.y;

            if (!animUpdated) {
                animUpdated = TRUE;
                UpdateSpriteAnimation(s);
            }

            DisplaySprite(s);

            qX = unk654->qPos70[i].x + Q(5);
            unk654->qPos70[i].x = qX;

            unk654->qPos70[i].x = qX + unk654->unk2E[i][0];
            unk654->qPos70[i].y += unk654->unk2E[i][1];

            if (!(SuperSonicGetFlags() & (SUPER_FLAG__200 | SUPER_FLAG__8))) {
                if (sub_804F010(s, I(unk654->qPos70[i].x), I(unk654->qPos70[i].y), 0) == TRUE) {
                    sub_802BA8C();
                }
            }
        }
    }
}

void sub_804F6AC(u32 qX, u32 qY, s16 param2, u32 sinIndex_)
{
    struct TA53Boss *s = TASK_DATA(gCurTask);
    struct TA53_unk654 *unk654 = &s->unk654;
    u8 i;

    u16 sinIndex = ((sinIndex_ << 22) >> 22);
    for (i = 0; i < ARRAY_COUNT(unk654->unkE); i++) {
        if (unk654->unkE[i] == 0) {
            unk654->unkE[i] = 1;
            unk654->unk1E[i] = 255;
            unk654->unk2E[i][0] = ((COS(sinIndex) * param2) >> 14);
            unk654->unk2E[i][1] = ((SIN(sinIndex) * param2) >> 14);
            unk654->qPos70[i].x = qX;
            unk654->qPos70[i].y = qY;

            m4aSongNumStart(SE_297);
            break;
        }
    }
}

void sub_804F768(u32 qX, u32 qY, s16 param2, u32 sinIndex_)
{
    struct TA53Boss *s = TASK_DATA(gCurTask);
    struct TA53_unk654 *unk654 = &s->unk654;
    u8 i;

    u16 sinIndex;
    for (i = 0; i < ARRAY_COUNT(unk654->unkE); i++) {
        if (unk654->unkE[i] == 0) {
            if (i & 0x1) {
                sinIndex = unk654->unkC + (i * 10);
            } else {
                sinIndex = unk654->unkC - (i * 10);
            }
            sinIndex &= ONE_CYCLE;

            unk654->unkE[i] = 1;
            unk654->unk1E[i] = 255;
            unk654->unk2E[i][0] = ((COS(sinIndex) * param2) >> 14);
            unk654->unk2E[i][1] = ((SIN(sinIndex) * param2) >> 14);
            unk654->qPos70[i].x = qX;
            unk654->qPos70[i].y = qY;

            m4aSongNumStart(SE_243);
            break;
        }
    }
}

void sub_804F850(u32 qX, u32 qY, s16 param2, u32 sinIndex_)
{
    u8 array[0x8];
    u8 i;

    u16 sinIndex = sinIndex_;
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk654 *unk654 = &boss->unk654;
    u8 *pArray = array;
    bool32 r5 = FALSE;
    u8 r3 = 0;
    u8 r2;

#ifndef NON_MATCHING
    register u32 r0 asm("r0");
#else
    u32 r0;
#endif

    for (r2 = 0; r2 < 16; r2++) {
        if (unk654->unkE[r2] == 0) {
            *pArray++ = r2;

            r3++;

            if (r3 == ARRAY_COUNT(array)) {
                break;
            }
        }
    }
    // _0804F8AA

    if (r3 == ARRAY_COUNT(array)) {
        r5 = TRUE;
    }

    // _0804F8B0
    if (!r5) {
        return;
    }

    if (array[ARRAY_COUNT(array) - 1] < 8) {
        sinIndex += 0x3C;
    } else {
        sinIndex -= 0x3C;
    }
    sinIndex &= ONE_CYCLE;

    // __0804F8DC
    for (i = 0; i < 8; i++) {
        // _0804F91A
        u16 arrIndex = array[i];
        unk654->unkE[arrIndex] = 1;
        unk654->unk1E[arrIndex] = 255;
        unk654->unk2E[arrIndex][0] = (COS(sinIndex) * 3) >> 6;

        r0 = sinIndex;
        unk654->unk2E[arrIndex][1] = (SIN(r0) * 3) >> 6;

        unk654->unk2E[arrIndex][0] += (COS(i * 128) * 3) >> 8;
        unk654->unk2E[arrIndex][1] += (SIN(i * 128) * 3) >> 8;

        unk654->qPos70[arrIndex].x = qX;
        unk654->qPos70[arrIndex].y = qY;
    }

    m4aSongNumStart(SE_258);
}

void sub_804F9BC(u32 qX, u32 qY, UNUSED s16 param2, UNUSED u32 sinIndex_)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk654 *unk654 = &boss->unk654;
    u16 sinIndex;
    u8 i;

    for (i = 0; i < ARRAY_COUNT(unk654->unkE); i++) {
        if (unk654->unkE[i] == 0) {
            if (i & 0x1) {
                sinIndex = unk654->unkC + (i * 6);
            } else {
                sinIndex = unk654->unkC - (i * 6);
            }
            // _0804FA18
            sinIndex &= ONE_CYCLE;

            unk654->unkE[i] = 1;
            unk654->unk1E[i] = 255;
            unk654->unk2E[i][0] = (COS(sinIndex) * 9) >> 7;
            unk654->unk2E[i][1] = (SIN(sinIndex) * 9) >> 7;

            unk654->qPos70[i].x = qX;
            unk654->qPos70[i].y = qY;
            m4aSongNumStart(SE_DASH_RING);
            break;
        }
    }
}

void sub_804FAA4(u32 qX, u32 qY, s16 param2, u32 sinIndex_)
{
    u8 array[8];
    u8 i;

    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk654 *unk654 = &boss->unk654;
    u16 sinIndex = ((sinIndex_ << 22) >> 22);
    u8 *pArray = array;
    bool32 r5 = FALSE;
    u8 r3 = 0;
    u8 r2;

    for (r2 = 0; r2 < 16; r2++) {
        if (unk654->unkE[r2] == 0) {
            *pArray++ = r2;

            r3++;

            if (r3 == ARRAY_COUNT(array)) {
                break;
            }
        }
    }
    // _0804FB00

    if (r3 == ARRAY_COUNT(array)) {
        r5 = TRUE;
    }

    // _0804FB06
    if (!r5) {
        return;
    }

    if (array[ARRAY_COUNT(array) - 1] < 8) {
        sinIndex += 0x46;
    } else {
        sinIndex -= 0x46;
    }
    sinIndex = CLAMP_SIN_PERIOD(sinIndex);

    // _0804FB28
    for (i = 0; i < 8; i++) {
        // _0804FB5E
        u16 arrIndex = array[i];
        u16 newSinIndex, index2;
        unk654->unkE[arrIndex] = 1;
        unk654->unk1E[arrIndex] = 255;

        if (i < 4) {
            newSinIndex = i * 16 + sinIndex;
            index2 = i * 48;
        } else {
            newSinIndex = sinIndex - (i - 4) * 16;
            index2 = (i - 4) * 48;
        }

        newSinIndex = CLAMP_SIN_PERIOD(newSinIndex);
        unk654->unk2E[arrIndex][0] = ((COS(newSinIndex)) * (0x280 - index2)) >> 0xE;
        unk654->unk2E[arrIndex][1] = ((SIN(newSinIndex)) * (0x280 - index2)) >> 0xE;

        unk654->qPos70[arrIndex].x = qX;
        unk654->qPos70[arrIndex].y = qY;
    }

    m4aSongNumStart(SE_258);
}

void sub_804FC10(u32 qX, u32 qY, s16 param2, u32 sinIndex_)
{
    u8 array[8];
    u16 sinIndex = sinIndex_;

    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk654 *unk654 = &boss->unk654;

    u8 r6;

    for (r6 = 0; r6 < 2; r6++) {
        u16 idx;
        u8 *pArray = array;
        bool32 r5 = FALSE;
        u8 r3 = 0;
        u8 r2, i;
        for (r2 = 0; r2 < 16; r2++) {
            if (unk654->unkE[r2] == 0) {
                *pArray++ = r2;

                r3++;

                if (r3 == ARRAY_COUNT(array)) {
                    break;
                }
            }
        }

        if (r3 == ARRAY_COUNT(array)) {
            r5 = TRUE;
        }

        if (!r5) {
            return;
        }

        if (array[ARRAY_COUNT(array) - 1] < 8) {
            idx = sinIndex + 40;
        } else {
            idx = sinIndex - 40;
        }
        idx = CLAMP_SIN_PERIOD(idx);

        for (i = 0; i < 8; i++) {
            s32 val;
            u16 arrIndex = array[i];

            unk654->unkE[arrIndex] = 1;
            unk654->unk1E[arrIndex] = 255;

            val = i * 64;

            unk654->unk2E[arrIndex][0] = ((COS(idx) * (1024 - val))) >> 14;
            unk654->unk2E[arrIndex][1] = ((SIN(idx) * (1024 - val))) >> 14;

            unk654->qPos70[arrIndex].x = qX;
            unk654->qPos70[arrIndex].y = qY;
        }
    }

    m4aSongNumStart(SE_WATERFALL_SURFACE_HIT);
}

void sub_804FD58(u32 qX, u32 qY, UNUSED s16 param2, UNUSED u32 sinIndex_)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk654 *unk654 = &boss->unk654;
    u8 i;

    for (i = 0; i < 16; i++) {
        if (unk654->unkE[i] == 0) {
            u16 index = ((gUnknown_080D8EE0[i] * 32) - 0x40) + unk654->unkC;
            index %= SIN_PERIOD;

            unk654->unkE[i] = 1;
            unk654->unk1E[i] = 255;

            unk654->unk2E[i][0] = ((COS(index) * 3) >> 6);
            unk654->unk2E[i][1] = ((SIN(index) * 3) >> 6);

            unk654->qPos70[i].x = qX;
            unk654->qPos70[i].y = qY;

            m4aSongNumStart(SE_287);
            break;
        }
    }
}

void sub_804FE24(struct TA53_unk654 *unk654)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    Sprite *s;
    u8 funcId;

    if (--unk654->unk8 == 0) {
        unk654->callback = sub_804FEFC;
        unk654->unk8 = 101;

        funcId = Mod((u8)PseudoRandom32(), ARRAY_COUNT(gUnknown_080D89AC));
        unk654->func4 = gUnknown_080D89AC[funcId];

        s = &unk654->spr128;
        s->graphics.anim = gUnknown_080D89C8[funcId].anim;
        s->variant = gUnknown_080D89C8[funcId].variant;
        s->palId = gUnknown_080D89C8[funcId].palId;
        s->prevVariant = -1;
    }

    s = &unk654->sprF0;
    s->x = (I(unk1C->qPos.x) + unk1C->unk20) - gCamera.x;
    s->y = (I(unk1C->qPos.y) + unk1C->unk22) - gCamera.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    sub_804F5BC(unk654);
}

void sub_804FEFC(struct TA53_unk654 *unk654)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    s32 qSonicX, qSonicY;
    s32 qX, qY;

    if (--unk654->unk8 == 0) {
        unk654->callback = sub_804FF9C;
        unk654->unk8 = 280;
    }

    if (Mod(unk654->unk8, 6) == 0) {
        SuperSonicGetPos(&qSonicX, &qSonicY);

        qX = unk1C->qPos.x + Q(unk1C->unk20);
        qY = unk1C->qPos.y + Q(unk1C->unk22);

        unk654->unkA = sub_8004418(I(qSonicY - qY), I(qSonicX - qX));

        unk654->func4(qX, qY, Q(5) - (unk654->unk8 * 10), unk654->unkA);
    }

    sub_804F5BC(unk654);
}

void sub_804FF9C(struct TA53_unk654 *unk654)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    s32 qSonicX, qSonicY;
    s32 qX, qY;
    Sprite *s;

    if (--unk654->unk8 == 0) {
        s = &unk654->sprF0;
        s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_PROJ_YELLOW;
        s->variant = 0;
        s->prevVariant = -1;

        SuperSonicGetPos(&qSonicX, &qSonicY);

        qX = unk1C->qPos.x + Q(unk1C->unk20);
        qY = unk1C->qPos.y + Q(unk1C->unk22);

        unk654->unkC = sub_8004418(I(qSonicY - qY), I(qSonicX - qX));

        unk654->callback = sub_804FE24;
        unk654->unk8 = 16;
    }

    sub_804F5BC(unk654);
}

bool8 sub_8050030(struct TA53_unk48 *unk48)
{

    s16 **ip = unk48->unk34;
    s16 *r4 = unk48->unk4;
    u16 *unk3A = unk48->unk3A;
    u16 sb = unk48->unk2E;

    bool8 result = FALSE;

    u32 r7;
    u8 r3, i;
#ifndef NON_MATCHING
    register u32 r2 asm("r2");
#else
    u32 r2;
#endif

    r2 = (unk48->unk30 >> 12);
    r3 = r2 + 1;

    if (r3 > 7) {
        result = TRUE;
    }

#ifndef NON_MATCHING
    {
        register u32 r0 asm("r0");
        u32 r1;
        r1 = 7;
        r0 = 7;
        asm("" ::"r"(r1));
        asm("" ::"r"(r0));
        r3 &= r0;

        r7 = (unk48->unk30 & 4095);
        r2 &= r1;
    }
#else
    r3 &= 7;
    r7 = (unk48->unk30 & 4095);
    r2 &= 7;
#endif

    if (r2 != (((unk48->unk30 - unk48->unk2C) >> 12) & 7)) {
        for (i = 0; i < 5; i++) {
            r4[0] = r4[1];
            r4++;
            r4[0] = r4[1];
            r4++;
            r4[0] = r4[1];
            r4++;
            r4[0] = (*ip++)[r3];
            r4++;
        }

        r4 = unk48->unk4;
    }

    for (i = 0; i < 5; i++) {
        *unk3A++ = sub_80859F4(&r4[i * 4], r7);
    }

    unk48->unk2C = I((unk48->unk2C - sb) * 250) + sb;
    unk48->unk30 = (unk48->unk30 + unk48->unk2C) & 0x7FFF;

    return result;
}

bool8 sub_8050104(struct TA53_unk1C *unk1C)
{
    s16 **ip = unk1C->unk1C;
    s16 *r4 = unk1C->unk4;
    s16 *unk3A = &unk1C->unk20;
    u16 sb = unk1C->unk16;
    bool8 result = FALSE;

    u16 r7;
    u8 r3, i;

#ifndef NON_MATCHING
    register u32 r2 asm("r2");
#else
    u32 r2;
#endif

    r2 = unk1C->unk18 >> 12;
    r3 = r2 + 1;

    if (r3 > 7) {
        result = TRUE;
    }

#ifndef NON_MATCHING
    {

        register u32 r0 asm("r0");
        u32 r1;
        r1 = 7;
        r0 = 7;
        asm("" ::"r"(r1));
        asm("" ::"r"(r0));
        r3 &= r0;

        r7 = (unk1C->unk18 & 4095);
        r2 &= r1;
    }
#else
    r3 &= 7;
    r7 = (unk1C->unk18 & 4095);
    r2 &= 7;
#endif

    if (r2 != (((u32)(unk1C->unk18 - unk1C->unk14) >> 12) & 7)) {
        for (i = 0; i < 2; i++) {
            r4[0] = r4[1];
            r4++;
            r4[0] = r4[1];
            r4++;
            r4[0] = r4[1];
            r4++;
            r4[0] = (*ip++)[r3];
            r4++;
        }

        r4 = unk1C->unk4;
    }

    for (i = 0; i < 2; i++) {
        *unk3A++ = sub_8085968(&r4[i * 4], r7);
    }

    unk1C->unk14 = I((unk1C->unk14 - sb) * 250) + sb;
    unk1C->unk18 = (unk1C->unk18 + unk1C->unk14) & 0x7FFF;

    return result;
}

void sub_80501D4(TA53Boss *boss)
{
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    Sprite *s;
    SpriteTransform *transform;
    CapsuleParts *capsule;
    s32 qX, qY;
    s32 screenX, screenY;
    s16 blend;
    u16 r7;
    u32 sinIndex;
    u8 i;

    if (unk48->unk4C == 0) {
        gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;

        if (boss->unkF == 0) {
            s = &boss->spr7B4;
            VramFree(s->graphics.dest);

            s->graphics.dest = VramMalloc(42);
            s->graphics.anim = SA2_ANIM_EXTRA_CUTSCENE_CAPSULE;
            s->variant = 0;
            s->prevVariant = -1;

            gDispCnt &= ~DISPCNT_OBJWIN_ON;

            gWinRegs[WINREG_WINOUT] = 0;

            gBldRegs.bldCnt = 0;
            gBldRegs.bldAlpha = 0;

            boss->unkF = 1;
        } else if (boss->lives != 0) {
            gStageFlags &= ~STAGE_FLAG__DISABLE_PAUSE_MENU;
        }
        boss->unk10 &= ~0x1;
    } else {
        gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;
    }

    if (boss->unk10 & 0x1) {
        gDispCnt &= ~DISPCNT_BG2_ON;
    } else {
        gDispCnt |= DISPCNT_BG2_ON;
    }

    if (gStageFlags & STAGE_FLAG__100) {
        return;
    }

    qX = unk1C->qPos.x + Q(unk1C->unk20);
    qY = unk1C->qPos.y + Q(unk1C->unk22);

    r7 = (I(unk48->qPos44.x) + unk48->unk3A[0]) & ONE_CYCLE;

    qX += ((COS(r7) * gUnknown_080D89A5[0]) >> 6);
    qY += ((SIN(r7) * gUnknown_080D89A5[0]) >> 6);

    screenX = I(qX) - gCamera.x;
    screenY = I(qY) - gCamera.y;

    sub_8003EE4(r7, 0x0100, 0x0100, 0x0030, 0x0033, screenX, screenY, &gBgAffineRegs[0]);

    boss->spr7B4.frameFlags = 0;

    for (i = 0; i < ARRAY_COUNT(boss->capsule); i++) {
        boss->capsule[i].s.frameFlags = 0;
    }

    blend = (SIN((gStageTime * 2) & 0x1FF) >> 6);
    sub_80508C4(boss, blend, unk48->unk4C);

    if (boss->unk10 & 0x1) {
        s = &boss->spr7B4;
        s->x = screenX;
        s->y = screenY;
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    r7 += 0x8C;
    qX += ({
        s32 val = COS((r7 - Q(1)) & ONE_CYCLE);
        val >> 2;
    });
    qY += ({
        s32 val = SIN((r7 - Q(1)) & ONE_CYCLE);
        val >> 2;
    });

    for (i = 0; i < 3; i++) {
        capsule = &boss->capsule[i];
        s = &capsule->s;
        transform = &capsule->transform;

        r7 = ({
            s32 val = (r7 + unk48->unk3A[i + 1]);
            val &ONE_CYCLE;
        });

        qX += (COS(r7) * gUnknown_080D89A5[i + 1]) >> 6;
        qY += (SIN(r7) * gUnknown_080D89A5[i + 1]) >> 6;

        s->x = I(qX) - gCamera.x;
        s->y = I(qY) - gCamera.y;

        s->frameFlags
            |= (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | gOamMatrixIndex++);

        transform->rotation = r7;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
        transform->x = s->x;
        transform->y = s->y;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
        DisplaySprite(s);
    }

    qX += (COS(r7) * gUnknown_080D89A5[4]) >> 6;
    qY += (SIN(r7) * gUnknown_080D89A5[4]) >> 6;

    s = &boss->capsule[3].s;
    transform = &boss->capsule[3].transform;
    sinIndex = ((unk48->unk42 + r7 + unk48->unk38) & ONE_CYCLE);

    s->x = I(qX) - gCamera.x;
    s->y = I(qY) - gCamera.y;

    s->frameFlags
        |= (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | gOamMatrixIndex++);

    transform->rotation = sinIndex;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);
}

void sub_80505B8(TA53Boss *boss)
{
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk48 *unk48 = &boss->unk48;
    Sprite *s;
    SpriteTransform *transform;
    CapsuleParts *capsule;
    s32 qX, qY;
    s32 screenX, screenY;
    s16 blend;
    u16 r7;
    u32 sinIndex;
    u8 i;

    if (unk48->unk4C == 0) {
        if (boss->spr7B4.graphics.dest != NULL) {
            VramFree(boss->spr7B4.graphics.dest);
            boss->spr7B4.graphics.dest = NULL;

            gDispCnt &= ~DISPCNT_OBJWIN_ON;

            gWinRegs[WINREG_WINOUT] = 0;

            gBldRegs.bldCnt = 0;
            gBldRegs.bldAlpha = 0;
        }

        boss->unk10 &= ~0x1;
    }

    qX = unk1C->qPos.x + Q(unk1C->unk20);
    qY = unk1C->qPos.y + Q(unk1C->unk22);

    r7 = (I(unk48->qPos44.x) + unk48->unk3A[0]) & ONE_CYCLE;

    qX += ((COS(r7) * gUnknown_080D89A5[0]) >> 6);
    qY += ((SIN(r7) * gUnknown_080D89A5[0]) >> 6);

    screenX = I(qX) - gCamera.x;
    screenY = I(qY) - gCamera.y;

    sub_8003EE4(r7, 0x0100, 0x0100, 0x0030, 0x0033, screenX, screenY, &gBgAffineRegs[0]);

    boss->spr7B4.frameFlags = 0;

    for (i = 0; i < ARRAY_COUNT(boss->capsule); i++) {
        boss->capsule[i].s.frameFlags = 0;
    }

    sub_80508C4(boss, 255, unk48->unk4C);

    if (boss->unk10 & 0x1) {
        s = &boss->spr7B4;
        s->x = screenX;
        s->y = screenY;
        s->frameFlags |= SPRITE_FLAG(PRIORITY, 2);
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    r7 += 0x8C;
    qX += ({
        s32 val = COS((r7 - Q(1)) & ONE_CYCLE);
        val >> 2;
    });
    qY += ({
        s32 val = SIN((r7 - Q(1)) & ONE_CYCLE);
        val >> 2;
    });

    for (i = 0; i < 3; i++) {
        capsule = &boss->capsule[i];
        s = &capsule->s;
        transform = &capsule->transform;

        r7 = ({
            s32 val = (r7 + unk48->unk3A[i + 1]);
            val &ONE_CYCLE;
        });

        qX += (COS(r7) * gUnknown_080D89A5[i + 1]) >> 6;
        qY += (SIN(r7) * gUnknown_080D89A5[i + 1]) >> 6;

        s->x = I(qX) - gCamera.x;
        s->y = I(qY) - gCamera.y;

        s->frameFlags
            |= (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | gOamMatrixIndex++);

        transform->rotation = r7;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
        transform->x = s->x;
        transform->y = s->y;
        UpdateSpriteAnimation(s);
        TransformSprite(s, transform);
        DisplaySprite(s);
    }

    qX += (COS(r7) * gUnknown_080D89A5[4]) >> 6;
    qY += (SIN(r7) * gUnknown_080D89A5[4]) >> 6;

    s = &boss->capsule[3].s;
    transform = &boss->capsule[3].transform;
    sinIndex = ((unk48->unk42 + r7 + unk48->unk38) & ONE_CYCLE);

    s->x = I(qX) - gCamera.x;
    s->y = I(qY) - gCamera.y;

    s->frameFlags
        |= (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE | (u8)gOamMatrixIndex++);

    transform->rotation = sinIndex;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);
}

void sub_80508C4(TA53Boss *boss, u16 blend, bool8 param2)
{
    u32 bldTarget1, bldTarget2;
    u8 i;
    Sprite *s;

    if (param2) {
        gDispCnt |= DISPCNT_OBJWIN_ON;
        gWinRegs[WINREG_WINOUT] = ((WINOUT_WINOBJ_ALL & ~WINOUT_WINOBJ_BG3) | (WINOUT_WIN01_ALL & ~(WINOUT_WIN01_BG1 | WINOUT_WIN01_BG3)));
        gBldRegs.bldCnt
            = ((BLDCNT_TGT2_BG0 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_OBJ) | BLDCNT_EFFECT_BLEND | (BLDCNT_TGT1_BG1 | BLDCNT_TGT1_BG2));

        bldTarget2 = (((blend * 3) >> 8) + 10) % 16u;
        bldTarget1 = (((blend * 5) >> 8) + 8) % 16u;
        gBldRegs.bldAlpha = BLDALPHA_BLEND(bldTarget1, bldTarget2);
        gBldRegs.bldY = BLDALPHA_BLEND(bldTarget1, bldTarget2);

        s = &boss->spr7B4;
        s->frameFlags |= 0x100;

        for (i = 0; i < ARRAY_COUNT(boss->capsule); i++) {
            s = &boss->capsule[i].s;
            s->frameFlags |= SPRITE_FLAG(OBJ_MODE, 2);
        }
    }
}

void sub_8050958(TA53Boss *boss)
{
    u8 i;

    if (boss->unkD > 0) {
        if (--boss->unkD == 0) {
            for (i = 0; i < 16; i++) {
                gObjPalette[i + 8 * 16] = gUnknown_080D8EF0[1][i];
                gBgPalette[i + 0 * 16] = gObjPalette[i + 8 * 16];
            }
        } else {
            // _080509B0
            u16 r6 = (gStageTime >> 1) % 16u;

            if (boss->lives < 4) {
                for (i = 0; i < 16; i++) {
                    gObjPalette[8 * 16 + ((i + r6) % 16u)] = gUnknown_080D8EF0[0][i] >> 5;
                    gBgPalette[0 * 16 + ((i + r6) % 16u)] = gObjPalette[8 * 16 + ((i + r6) % 16u)];
                }
            } else {
                for (i = 0; i < 16; i++) {
                    u32 r0;
                    u32 r2;
                    u32 colId;
                    u16 *objPalTgt = &gObjPalette[0];
                    u32 objPalId;

                    colId = ((i + r6) % 16u);
                    objPalId = 8 * 16 + colId;
                    objPalTgt[objPalId] = ((gUnknown_080D8EF0[0][i] << 5) | (gUnknown_080D8EF0[0][i] >> 5)) | gUnknown_080D8EF0[0][i];
                    gBgPalette[0 * 16 + colId]
                        = ((gUnknown_080D8EF0[0][i] << 5) | (gUnknown_080D8EF0[0][i] >> 5)) | gUnknown_080D8EF0[0][i];
                }
            }
        }
        // _08050A4C

        gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
        gFlags |= FLAGS_UPDATE_BACKGROUND_PALETTES;
    }
}

void TaskDestructor_TrueArea53BossGfx(struct Task *t)
{
    TA53Boss *boss = TASK_DATA(t);
    u8 i;
    Sprite *s;
    void **vram;

    if (boss->spr7B4.graphics.dest) {
        VramFree(boss->spr7B4.graphics.dest);
    }

    for (i = 0; i < ARRAY_COUNT(boss->capsule); i++) {
        CapsuleParts *capsule = &boss->capsule[i];
#ifdef NON_MATCHING
        if (capsule->s.graphics.dest)
#endif
        {
            VramFree(boss->capsule[i].s.graphics.dest);
        }
    }

    for (i = 0; i < ARRAY_COUNT(boss->unk98.unk10); i++) {
        VramFree(boss->unk98.unk10[i].spr20.graphics.dest);
    }

    vram = &boss->unk98.unk10->exhaust.s[0].graphics.dest;
    VramFree(*vram);

    VramFree(boss->unk558.s.graphics.dest);
    VramFree(boss->unk594.spr90.graphics.dest);
    VramFree(boss->unk654.spr128.graphics.dest);
    VramFree(boss->unk654.sprF0.graphics.dest);

    gActiveBossTask = NULL;
}

void sub_8050B2C(s32 *outX, s32 *outY)
{
    if (gActiveBossTask == NULL) {
        *outX = 0;
        *outY = 0;
    } else {
        TA53Boss *boss = TASK_DATA(gActiveBossTask);
        TA53_unk1C *unk1C = &boss->unk1C;
        s32 qX, qY;

        qX = unk1C->qPos.x + Q(unk1C->unk20);
        qY = unk1C->qPos.y + Q(unk1C->unk22);

        qX += ((COS(Q(3)) * 9) >> 6);
        qY += ((SIN(Q(3)) * 9) >> 6);

        qX += ((COS(Q(2)) * 38) >> 6);
        qY += ((SIN(Q(2)) * 38) >> 6);

        *outX = qX;
        *outY = qY;
    }
}

bool32 ExtraBossIsDead(void)
{
    bool32 bossIsDead = FALSE;

    if (gActiveBossTask != NULL) {
        TA53Boss *boss = TASK_DATA(gActiveBossTask);

        if (boss->lives == 0) {
            bossIsDead = TRUE;
        }
    }

    return bossIsDead;
}

void sub_8050BD8(struct TA53_unk1C *unk1C) { sub_8050104(unk1C); }
void sub_8050BE4(struct TA53_unk1C *unk1C) { sub_8050104(unk1C); }
void sub_8050BF0(struct TA53_unk1C *unk1C) { sub_8050104(unk1C); }

void sub_8050BFC(struct TA53_unk48 *unk48)
{
    if (sub_8050030(unk48)) {
        unk48->unk30 &= 0xFFF;
        unk48->callback = gUnknown_080D8D6C[3].callback;
        unk48->unk34 = gUnknown_080D8D6C[3].data;
        unk48->unk2E = gUnknown_080D8D6C[3].unk8;
    }

    if (unk48->unk30 >= 0x2000) {
        m4aSongNumStartOrContinue(SE_272);
        unk48->qPos44.y -= 0x57;
        unk48->qPos44.x += unk48->qPos44.y;
    }
}

void sub_8050C50(struct TA53_unk48 *unk48)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;

    sub_8050030(unk48);

    unk48->qPos44.x += unk48->qPos44.y;
    unk48->qPos44.y += 0x57;

    if (unk48->qPos44.y == 0) {
        // NOTE: For matching
        unk48->unk30 &= 0xFFF;
        unk48->unk30 = 0;

        unk48->callback = gUnknown_080D8D6C[0].callback;
        unk48->unk34 = gUnknown_080D8D6C[0].data;
        unk48->unk2E = gUnknown_080D8D6C[0].unk8;
        unk1C->unk18 &= 0xFFF;
        unk1C->callback = gUnknown_080D8DCC[0].callback;
        unk1C->unk1C = gUnknown_080D8DCC[0].data;
        unk1C->unk16 = gUnknown_080D8DCC[0].unk8;
        m4aSongNumStop(SE_272);
    }
}

void sub_8050CBC(struct TA53_unk48 *unk48)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk558 *unk558 = &boss->unk558;
    u8 value;

    sub_8050030(unk48);

    value = (unk48->unk30 >> 12);
    if (value < 3) {
        unk1C->qPos.x -= Q(0.75);
    } else if (value == 3) {
        unk48->unk30 &= 0xFFF;
        unk48->callback = gUnknown_080D8D6C[6].callback;
        unk48->unk34 = gUnknown_080D8D6C[6].data;
        unk48->unk2E = gUnknown_080D8D6C[6].unk8;
        unk558->callback = sub_804F108;
    }
}

#if 01
void sub_8050D24(struct TA53_unk48 *unk48)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;
    TA53_unk558 *unk558 = &boss->unk558;
    u8 value;

    sub_8050030(unk48);

    value = (unk48->unk30 >> 12);
    if (value >= 2) {
        unk48->unk30 &= 0xFFF;

        unk48->callback = gUnknown_080D8D6C[7].callback;
        unk48->unk34 = gUnknown_080D8D6C[7].data;
        unk48->unk2E = gUnknown_080D8D6C[7].unk8;
        unk1C->unk18 &= 0xFFF;
        unk1C->callback = gUnknown_080D8DCC[5].callback;
        unk1C->unk1C = gUnknown_080D8DCC[5].data;
        unk1C->unk16 = gUnknown_080D8DCC[5].unk8;
        unk558->callback = sub_8050DC8;
    }
}
#endif

void sub_8050D9C(struct TA53_unk48 *unk48)
{
    TA53Boss *boss = TASK_DATA(gCurTask);
    TA53_unk1C *unk1C = &boss->unk1C;

    unk1C->qPos.x += Q(1);
    sub_8050030(unk48);
}

void sub_8050DC4(struct TA53_unk98 *unk98) { }

void sub_8050DC8(struct TA53_unk558 *unk558)
{
    Sprite *s;

    unk558->unk8 = 60;
    unk558->unk6 = 180;

    s = &unk558->s;
    s->graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_SUCK_FX;
    s->variant = 0;
    s->prevVariant = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
}

void sub_8050DF8(struct TA53_unk654 *unk654) { sub_804F5BC(unk654); }