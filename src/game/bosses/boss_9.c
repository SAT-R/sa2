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
    /* 0x24 */ s32 qUnk24;
    /* 0x28 */ s32 qUnk28;
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

typedef struct {
    u8 filler0[0x4];
    u8 unk4;
    u8 filler5[0x3 + 0x4];
    u16 unkC;
    u8 fillerE[0x6];
    s32 qUnk14; // worldX?
    s32 qUnk18; // worldY?
    u8 filler1C[0x4];
    Sprite spr20;
    u8 filler50[0x140];
} TA53_unkA8; /* size: 0x190 */

typedef struct {
    void *unk0; // function pointer
    u16 unk4; // some counter
    u16 unk6;
    s32 qUnk8;
    s32 qUnkC;
    TA53_unkA8 unkA8[3];
} TA53_unk98; /* size: 0x190 */ // (0x4C0)

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
} TA53_unk594; /* size: 0x90 */

typedef struct TA53_unk654 {
    /* 0x00 */ u8 filler0[0xE];
    /* 0x0E */ u8 unkE[16];
    /* 0x1E */ u8 unk1E[16];

    /* 0x2E */ u8 filler2E[0x62];

    /* 0x90 */ Sprite spr90;

    /* 0xC0 */ Sprite sprC0;

    /* 0xF0 */ Sprite sprF0;

    /* 0x120 */ u8 filler120[0x8];

    /* 0x128 */ Sprite spr128;
    /* 0x158 */ u8 filler158[0x8]; // Hitbox reserved; ?
} TA53_unk654; /* size: ??? */

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
    /* 0x014 */ s32 unk14;
    /* 0x018 */ s32 unk18;
    /* 0x01C */ TA53_unk1C unk1C;
    /* 0x048 */ TA53_unk48 unk48;
    /* 0x098 */ TA53_unk98 unk98;
    /* 0x558 */ TA53_unk558 unk558;
    /* 0x594 */ TA53_unk594 unk594;
    /* 0x624 */ u8 filler624[0x30]; // Sprite spr624; ?
    /* 0x654 */ TA53_unk654 unk654;
    /* 0x7B4 */ Sprite spr7B4;
    /* 0x7E4 */ u8 filler7E4[0x15C];
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
const u8 sRGB_080D8E20[]
    = { 0,    0,    0, //
        2,    2,    28, //
        0x06, 0x03, 0x1E, 0x0D, 0x06, 0x1F, 0x0D, 0x09, 0x1F, 0x0E, 0x0D, 0x1F, 0x11,
        0x0E, 0x1F, 0x0C, 0x13, 0x1F, 0x0C, 0x16, 0x1F, 0x0E, 0x19, 0x1F, 0x10, 0x1B,
        0x1F, 0x13, 0x1C, 0x1F, 0x17, 0x1C, 0x1F, 0x1A, 0x1C, 0x1F, 0x1B, 0x1D, 0x1F,
        0x1D, 0x1E, 0x1F, 0x00, 0x00, 0x00, 0x02, 0x02, 0x1C, 0x09, 0x03, 0x1D, 0x0C,
        0x06, 0x1F, 0x11, 0x06, 0x1F, 0x12, 0x0A, 0x1F, 0x12, 0x0D, 0x1F, 0x0E, 0x18,
        0x1F, 0x12, 0x19, 0x1F, 0x16, 0x1A, 0x1F, 0x19, 0x1B, 0x1F, 0x1A, 0x1C, 0x1F,
        0x1B, 0x1C, 0x1F, 0x1C, 0x1D, 0x1F, 0x1C, 0x1E, 0x1F, 0x1D, 0x1E, 0x1F, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x04, 0x0C, 0x06, 0x01, 0x15, 0x09, 0x03,
        0x1D, 0x0D, 0x09, 0x1F, 0x0C, 0x13, 0x1F, 0x0C, 0x17, 0x1F, 0x0D, 0x1A, 0x1F,
        0x10, 0x1C, 0x1F, 0x13, 0x1C, 0x1F, 0x18, 0x1C, 0x1F, 0x1A, 0x1C, 0x1F, 0x1B,
        0x1D, 0x1F, 0x1D, 0x1E, 0x1F, 0x1E, 0x1E, 0x1F, 0x00, 0x0C, 0x0E, 0x1F, 0x1F,
        0x1F, 0x1F, 0x16, 0x07, 0x0F, 0x07, 0x1F, 0x0B, 0x02, 0x16, 0x04, 0x02, 0x02,
        0x19, 0x1D, 0x1F, 0x14, 0x17, 0x19, 0x0C, 0x0E, 0x13, 0x06, 0x09, 0x0C, 0x08,
        0x00, 0x0F, 0x1F, 0x0E, 0x04, 0x1B, 0x08, 0x00, 0x17, 0x04, 0x00, 0x10, 0x04,
        0x00, 0x0A, 0x04, 0x00 };

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

    unk1C->qUnk24 = Q(330);
    unk1C->qUnk28 = Q(90);
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

#if 0
void CreateTrueArea53Boss(void)
{
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;
    TA53_unk558 *unk558;
    TA53_unk654 *unk654;
    u32 i;

    gStageFlags |= EXTRA_STATE__DISABLE_PAUSE_MENU;

    if(gActiveBossTask == NULL) {
        gActiveBossTask = TaskCreate(Task_TrueArea53BossMain, sizeof(TA53Boss), 0x400, 0, TaskDestructor_TrueArea53BossGfx);
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
    boss->unk14 = 0;
    boss->unk18 = 0;
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

    unk1C->qUnk24 = Q(1267);
    unk1C->qUnk28 = Q(112);
    unk1C->unk20 = 0;
    unk1C->unk22 = 0;
    unk1C->unk14 = gUnknown_080D8DCC->unk8;

    for(i = 0; i < 4; i++) {
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

    for(i = 0; i < 4; i++) {
        unk48->unk4[i] = gUnknown_080D8A1C[3][i];
        unk48->unkC[i] = gUnknown_080D8A34[3][i];
        unk48->unk14[i] = gUnknown_080D8A4C[3][i];
        unk48->unk1C[i] = gUnknown_080D8A64[3][i];
        unk48->unk24[i] = gUnknown_080D8A7C[3][i];
    }

    for(i = 0; i < 10; i++) {
        boss->unk594.unk4[i] = 0;
        boss->unk594.unkE[i] = 0;
        boss->unk594.unk18[i].x = 0;
        boss->unk594.unk18[i].y = 0;
        boss->unk594.unk40[i].x = 0;
        boss->unk594.unk40[i].y = 0;
    }


}
#endif
