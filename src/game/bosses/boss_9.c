#include "global.h"
#include "flags.h"
#include "sprite.h"
#include "task.h"
#include "gba/io_reg.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_9.h"
#include "sakit/globals.h"

typedef struct {
    u8 filler0[0x4];
    s16 unk4[4];
    s16 unkC[4];
    u16 unk14;
    u8 filler16[0xE];
    s32 qUnk24;
    s32 qUnk28;
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
    u8 filler38[0x8];
} TA53_unk48; /* size: 0x40 */

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
} TA53_unk98; /* size: 0x190 */

typedef struct TA53_unk558 {
    /* 0x00 */ void (*func)(struct TA53_unk558 *); // void func (TA53_unk558 *)
    /* 0x04 */ u8 unk4[0x4];
    /* 0x08 */ s32 unk8;
    /* 0x0C */ Sprite s;
} TA53_unk558; /* size: ??? */

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
    /* 0x548 */ u8 filler548[0x10];
    /* 0x558 */ TA53_unk558 unk558;
    /* 0x548 */ u8 filler55C[0x258];
    /* 0x7B4 */ Sprite spr7B4;
    /* 0x7E4 */ u8 filler7E4[0x15C];
} TA53Boss; /* size: 0x940 */

extern s16 gUnknown_080D8A94[4];
extern s16 gUnknown_080D8AAC[4];
extern s16 gUnknown_080D8AC4[4];
extern s16 gUnknown_080D8ADC[4];
extern s16 gUnknown_080D8AF4[4];
extern s16 gUnknown_080D8C7C[4];
extern s16 gUnknown_080D8C94[4];
extern TA53_Data0 gUnknown_080D8D6C[8];
extern TA53_Data0 gUnknown_080D8DCC[8];

extern void CreateTrueArea53Boss(void);
extern void Task_EggmanKidnapsVanilla(void);
extern void TaskDestructor_TrueArea53BossGfx(struct Task *);
void Task_TrueArea53BossMain(void);
void sub_8050DC8(struct TA53_unk558 *);
void TaskDestructor_TrueArea53BossGfx(struct Task *);

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
    unk48->unk2E = gUnknown_080D8D6C[4].unk4;

    unk1C->qUnk24 = Q(330);
    unk1C->qUnk28 = Q(90);
    unk1C->unk14 = gUnknown_080D8DCC[4].unk4;

    for (i = 0; i < 4; i++) {
        unk1C->unk4[i] = gUnknown_080D8C7C[i];
        unk1C->unkC[i] = gUnknown_080D8C94[i];
    }

    // TODO(Jace): why is this set above only to be rewritten?
    unk48->unk30 &= 0xFFF;
    unk48->unk0 = gUnknown_080D8D6C[5].func;
    unk48->unk34 = gUnknown_080D8D6C[5].ref;
    unk48->unk2E = gUnknown_080D8D6C[5].unk4;
    unk48->unk2C = unk48->unk2E;

    // __0804CE02
    for (i = 0; i < 4; i++) {
        unk48->unk4[i] = gUnknown_080D8A94[i];
        unk48->unkC[i] = gUnknown_080D8AAC[i];
        unk48->unk14[i] = gUnknown_080D8AC4[i];
        unk48->unk1C[i] = gUnknown_080D8ADC[i];
        unk48->unk24[i] = gUnknown_080D8AF4[i];
    }

    gDispCnt = (DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP
                | DISPCNT_MODE_1);
}

#if 0
void CreateTrueArea53Boss(void)
{
    TA53Boss *boss;
    TA53_unk558 *unk558;

    gStageFlags |= EXTRA_STATE__DISABLE_PAUSE_MENU;

    if(gActiveBossTask == NULL) {
        gActiveBossTask = TaskCreate(Task_TrueArea53BossMain, sizeof(TA53Boss), 0x400, 0, TaskDestructor_TrueArea53BossGfx);
    }

    boss = TASK_DATA(gActiveBossTask);

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


}
#endif