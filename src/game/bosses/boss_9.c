#include "global.h"
#include "sprite.h"
#include "task.h"
#include "game/bosses/common.h"

typedef struct {
    void *func;
    void *ref;
    u16 unk4;
} TA53_Data0;

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
    u8 filler4[0x28];
    u16 unk2C;
    u16 unk2E;
    s32 unk30;
    void *unk34; // ref
    u8 filler38[0x4];
} TA53_unk48; /* size: ??? */

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

typedef struct {
    /* 0x000 */ u8 filler0[0x12];
    /* 0x012 */ u16 unk12;
    /* 0x014 */ u8 filler14[0x8];
    /* 0x01C */ TA53_unk1C unk1C;
    /* 0x048 */ TA53_unk48 unk48;
    /* 0x098 */ TA53_unk98 unk98;
    /* 0x548 */ u8 filler548[0x26C];
    /* 0x7B4 */ Sprite spr7B4;
    /* 0x7E4 */ u8 filler7E4[0x15C];
} TA53Boss; /* size: 0x940 */

extern s16 gUnknown_080D8C7C[4];
extern s16 gUnknown_080D8C94[4];
extern TA53_Data0 gUnknown_080D8D6C[8];
extern TA53_Data0 gUnknown_080D8DCC[8];

extern void CreateTrueArea53Boss(void);
extern void Task_EggmanKidnapsVanilla(void);
extern void TaskDestructor_TrueArea53BossGfx(struct Task *);

#if 0
// Used when Vanilla gets captured
void SetupEggmanKidnapsVanillaTask(void)
{
    TA53Boss *boss;
    TA53_unk1C *unk1C;
    TA53_unk48 *unk48;
    u8 i;

    gActiveBossTask = TaskCreate(Task_EggmanKidnapsVanilla, sizeof(TA53Boss), 0x400, 0,
                                 TaskDestructor_TrueArea53BossGfx);

    CreateTrueArea53Boss();

    boss = TASK_DATA(gActiveBossTask);
    unk1C = &boss->unk1C;
    unk48 = &boss->unk48;

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
    for (i = 0; i < 4; i++) { }
}
#endif
