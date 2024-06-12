#include "global.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "gba/io_reg.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"
#include "sakit/globals.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ TA53_Data0 *unk0;
    /* 0x04 */ s16 unk4[4];
    /* 0x0C */ s16 unkC[4];
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u16 unk16;
    /* 0x18 */ s32 unk18;
    /* 0x1C */ void *unk1C;
    /* 0x20 */ u16 unk20;
    /* 0x22 */ u16 unk22;
    /* 0x24 */ Vec2_32 pos;
} TA53_unk1C; /* size: 0x2C */

typedef struct {
    void *unk0; // func
    s16 unk4[4];
    s16 unkC[4];
    u16 unk14[4];
    u16 unk1C[4];
    u16 unk24[4];
    u16 unk2C;
    u16 unk2E;
    s32 unk30;
    void *unk34; // ref
    u16 unk38;
    u8 filler3A[0xA];
    u32 unk44;
    u32 unk48;
    u8 unk4C;
} TA53_unk48; /* size: 0x4D ? */

// TODO: Name ("TA53_Rocket"?)
typedef struct {
    u8 filler0[0x4];
    u8 unk4;
    u16 unk6;
    u8 filler8[0x2];
    u16 unkA;
    u16 unkC;
    u16 unkE;
    u16 unk10;
    u8 filler12[0x2];
    Vec2_32 pos14;
    u8 filler1C[0x4];
    Sprite spr20;
    u8 filler50[8];
    void *unk58; // function ptr
    u8 unk5C[5];
    u16 unk62[5][2];
    u8 filler76[0x2];
    Vec2_32 pos78[5];
    Sprite sprA0[5];
} TA53_unkA8; /* size: 0x190 */

typedef struct {
    /* 0x00 */ void *unk0; // function pointer
    /* 0x04 */ u16 unk4; // some counter
    /* 0x06 */ u16 unk6;
    /* 0x08 */ s32 qUnk8;
    /* 0x0C */ s32 qUnkC;
    /* 0x10 */ TA53_unkA8 unk10[3];
} TA53_unk98; /* size: 0x4C0 */

typedef struct TA53_unk558 {
    /* 0x00 */ void (*func)(struct TA53_unk558 *); // void func (TA53_unk558 *)
    /* 0x04 */ u8 unk4[0x4];
    /* 0x08 */ s32 unk8;
    /* 0x0C */ Sprite s;
} TA53_unk558; /* size: 0x3C */

typedef struct TA53_unk594 {
    u8 filler[4];
    u8 unk4[10];
    u8 unkE[10];
    Vec2_16 unk18[10];
    Vec2_32 unk40[10];
    Sprite spr90;
} TA53_unk594; /* size: 0xC0 */

typedef struct TA53_unk654 {
    /* 0x00 */ void *func0;
    /* 0x04 */ void *func4;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u8 fillerC[0x2];
    /* 0x0E */ u8 unkE[16];
    /* 0x1E */ u8 unk1E[16];
    /* 0x2E */ Vec2_16 unk2E[16];

    /* 0x70 */ Vec2_32 unk70[16];

    /* 0xF0 */ Sprite sprF0;
    /* 0x120 */ Hitbox hbSprF0;

    /* 0x128 */ Sprite spr128;
    /* 0x158 */ Hitbox hbSpr128;
} TA53_unk654; /* size: 0x160 */

typedef struct {
    /* 0x000 */ u16 unk0;
    /* 0x002 */ u16 unk2;
    /* 0x004 */ u16 unk4;
    /* 0x006 */ u16 unk6;
    /* 0x008 */ u16 unk8;
    /* 0x00A */ u16 unkA;
    /* 0x00C */ u8 unkC;
    /* 0x00D */ u8 unkD;
    /* 0x00E */ u8 unkE;
    /* 0x00F */ u8 unkF;
    /* 0x010 */ u16 unk10;
    /* 0x012 */ u16 unk12;
    /* 0x014 */ Vec2_32 pos14;
    /* 0x01C */ TA53_unk1C unk1C;
    /* 0x048 */ TA53_unk48 unk48;
    /* 0x098 */ TA53_unk98 unk98;
    /* 0x558 */ TA53_unk558 unk558;
    /* 0x594 */ TA53_unk594 unk594;
    /* 0x654 */ TA53_unk654 unk654;
    /* 0x7B4 */ Sprite spr7B4;
    /* 0x7E4 */ u8 filler7E4[0xC];
    /* 0x7F0 */ Sprite spr7F0;
    /* 0x7E4 */ u8 filler820[0x120];
} TA53Boss; /* size: 0x940 */

typedef struct {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ u16 anim;
    /* 0x06 */ u8 unk6;
    /* 0x07 */ u8 unk7;
    /* 0x08 */ u8 unk8;
    /* 0x0A */ u16 unkA;
} TA53_80D89C8;

extern void CreateTrueArea53Boss(void);
extern void Task_EggmanKidnapsVanilla(void);
extern void TaskDestructor_TrueArea53BossGfx(struct Task *);
void Task_TrueArea53BossMain(void);
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
const s8 gUnknown_080D89A5[6] = { 0, 20, 24, 20, 18, 30 };

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

void sub_804DD9C(void *);
void sub_804E66C(void *);
void sub_804FF9C(void *);

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
void sub_804E078(TA53Boss *boss);
void sub_804E15C(TA53Boss *boss);
void sub_804E4CC(TA53Boss *boss);
void sub_8050BD8(TA53Boss *boss);
void sub_8050BE4(TA53Boss *boss);
void sub_8050BF0(TA53Boss *boss);
void sub_8050BFC(TA53Boss *boss);
void sub_8050C50(TA53Boss *boss);
void sub_8050CBC(TA53Boss *boss);
void sub_8050D24(TA53Boss *boss);
void sub_8050D9C(TA53Boss *boss);

const TA53_Data0 gUnknown_080D8D6C[] = {
    { sub_804E078, &gUnknown_080D8BFC, 40 },  { sub_804E4CC, &gUnknown_080D8BFC, 40 },
    { sub_8050BFC, &gUnknown_080D8C24, 126 }, { sub_8050C50, &gUnknown_080D8C24, 512 },
    { sub_804E15C, &gUnknown_080D8C38, 160 }, { sub_8050CBC, &gUnknown_080D8C10, 80 },
    { sub_8050D24, &gUnknown_080D8C10, 80 },  { sub_8050D9C, &gUnknown_080D8C10, 80 },
};

const TA53_Data0 gUnknown_080D8DCC[] = {
    { sub_8050BD8, &gUnknown_080D8D3C, 40 },  { sub_8050BE4, &gUnknown_080D8D54, 100 },
    { sub_8050BE4, &gUnknown_080D8D5C, 100 }, { sub_8050BE4, &gUnknown_080D8D5C, 100 },
    { sub_8050BF0, &gUnknown_080D8D44, 20 },  { sub_8050BF0, &gUnknown_080D8D4C, 100 },
};

// TODO: Parameter type
void sub_804E974(TA53Boss *boss);
void sub_804EB6C(TA53Boss *boss);
void sub_804EC6C(TA53Boss *boss);

const void *const gUnknown_080D8E14[] = { sub_804E974, sub_804EB6C, sub_804EC6C };
const u8 sRGB_080D8E20[] = {
    //
    0, 0, 0, //
    2, 2, 28, //
    6, 3, 30, //
    13, 6, 31, //
    13, 9, 31, //
    14, 13, 31, //
    17, 14, 31, //
    12, 19, 31, //
    12, 22, 31, //
    14, 25, 31, //
    16, 27, 31, //
    19, 28, 31, //
    23, 28, 31, //
    26, 28, 31, //
    27, 29, 31, //
    29, 30, 31, //
    //
    0, 0, 0, //
    2, 2, 28, //
    9, 3, 29, //
    12, 6, 31, //
    17, 6, 31, //
    18, 10, 31, //
    18, 13, 31, //
    14, 24, 31, //
    18, 25, 31, //
    22, 26, 31, //
    25, 27, 31, //
    26, 28, 31, //
    27, 28, 31, //
    28, 29, 31, //
    28, 30, 31, //
    29, 30, 31, //
    //
    0, 0, 0, //
    0, 0, 0, //
    5, 4, 12, //
    6, 1, 21, //
    9, 3, 29, //
    13, 9, 31, //
    12, 19, 31, //
    12, 23, 31, //
    13, 26, 31, //
    16, 28, 31, //
    19, 28, 31, //
    24, 28, 31, //
    26, 28, 31, //
    27, 29, 31, //
    29, 30, 31, //
    30, 30, 31, //
    //
    0, 12, 14, //
    31, 31, 31, //
    31, 22, 7, //
    15, 7, 31, //
    11, 2, 22, //
    4, 2, 2, //
    25, 29, 31, //
    20, 23, 25, //
    12, 14, 19, //
    6, 9, 12, //
    8, 0, 15, //
    31, 14, 4, //
    27, 8, 0, //
    23, 4, 0, //
    16, 4, 0, //
    10, 4, 0, //
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
    unk48->unk0 = gUnknown_080D8D6C[4].func;
    unk48->unk34 = gUnknown_080D8D6C[4].ref;
    unk48->unk2E = gUnknown_080D8D6C[4].unk8;

    unk1C->pos.x = Q(330);
    unk1C->pos.y = Q(90);
    unk1C->unk14 = gUnknown_080D8DCC[4].unk8;

    for (i = 0; i < 4; i++) {
        unk1C->unk4[i] = gUnknown_080D8C7C[i];
        unk1C->unkC[i] = gUnknown_080D8C94[i];
    }

    // TODO(Jace): why is this set above only to be rewritten?
    unk48->unk30 &= 0xFFF;
    unk48->unk0 = gUnknown_080D8D6C[5].func;
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
    boss->pos14.x = 0;
    boss->pos14.y = 0;
    boss->unk0 = 0;
    boss->unk4 = 0;
    boss->unk2 = 1;
    boss->unk6 = 20;
    boss->unk8 = 0xBF;
    boss->unkA = 1;

    unk558 = &boss->unk558;
    unk558->func = sub_8050DC8;

    unk1C->unk4[1] = 200;
    unk1C->unk4[0] = 0;
    unk1C->unk18 &= 0xFFF;

    unk1C->unk0 = gUnknown_080D8DCC->func;
    unk1C->unk1C = gUnknown_080D8DCC->ref;
    unk1C->unk16 = gUnknown_080D8DCC->unk8;

    unk1C->pos.x = Q(1267);
    unk1C->pos.y = Q(112);
    unk1C->unk20 = 0;
    unk1C->unk22 = 0;
    unk1C->unk14 = unk1C->unk16;
    unk1C->unk18 = 0;

    for (i = 0; i < 4; i++) {
        boss->unk1C.unk4[i] = gUnknown_080D8C4C[i];
        boss->unk1C.unkC[i] = gUnknown_080D8C54[i];
    }

    unk48->unk30 &= 0xFFF;
    unk48->unk0 = gUnknown_080D8D6C[1].func;
    unk48->unk34 = gUnknown_080D8D6C[1].ref;
    unk48->unk2E = gUnknown_080D8D6C[1].unk8;
    unk48->unk4C = 1;
    unk48->unk38 = 0;
    unk48->unk44 = 0;
    unk48->unk48 = 0;
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
        boss->unk594.unk18[i].x = 0;
        boss->unk594.unk18[i].y = 0;
        boss->unk594.unk40[i].x = 0;
        boss->unk594.unk40[i].y = 0;
    }

    boss->unk654.func0 = sub_804FF9C;
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

    unk98->unk0 = sub_804E66C;
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

        unkA8->unk58 = sub_804DD9C;

        // Rocket Exhaust Clouds
        for (j = 0; j < 5; j++) {
            // _0804D25C
            unkA8->unk5C[j] = 0;
            unkA8->unk62[j][0] = 0;
            unkA8->unk62[j][1] = 0;
            unkA8->pos78[j].x = 0;
            unkA8->pos78[j].y = 0;

            unkA8->sprA0[j].x = 0;
            unkA8->sprA0[j].y = 0;
            unkA8->sprA0[j].graphics.dest = vram;
            unkA8->sprA0[j].graphics.anim = SA2_ANIM_TRUE_AREA_53_BOSS_CLOUD;
            unkA8->sprA0[j].variant = 0;
            unkA8->sprA0[j].prevVariant = -1;
            unkA8->sprA0[j].unk1A = SPRITE_OAM_ORDER(16);
            unkA8->sprA0[j].graphics.size = 0;
            unkA8->sprA0[j].animCursor = 0;
            unkA8->sprA0[j].timeUntilNextFrame = 0;
            unkA8->sprA0[j].animSpeed = SPRITE_ANIM_SPEED(1.0);
            unkA8->sprA0[j].hitboxes[0].index = HITBOX_STATE_INACTIVE;
            unkA8->sprA0[j].palId = 6;
            unkA8->sprA0[j].unk10 = SPRITE_FLAG(PRIORITY, 2);
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

    unk1C->pos.x += dX;
    unk1C->pos.y += dY;
    boss->pos14.x += dX;
    boss->pos14.y += dY;

    for (i = 0; i < 3; i++) {
        unkA8 = &unk98->unk10[i];
        unkA8->pos14.x += dX;
        unkA8->pos14.y += dY;

        for (j = 0; j < ARRAY_COUNT(unkA8->sprA0); j++) {
            // _0804D620
            // @TODO/BUG: This should be [j]
            unkA8->pos78[i].x += I(dX);
            unkA8->pos78[i].y += I(dY);
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
