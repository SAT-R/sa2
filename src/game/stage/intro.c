#include "global.h"
#include "game/game.h"
#include "game/bosses/common.h"
#include "game/screen_transition.h"

#include "constants/zones.h"

extern u16 zoneLoadingCharacterLogos[NUM_CHARACTERS][3];
extern u16 zoneLoadingZoneNames[40][3];

typedef struct {
    /* 0x00 */ u32 unk0;
    /* 0x04 */ u8 unk4;
} SITaskA; /* size: 0x8 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ struct TransitionState transition;
    u8 filler4[0x8];
} SITaskB; /* size: 0x18 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    /* 0x04 */ u8 filler4[0xC];
    /* 0x10 */ Vec2_16 unk10;
    /* 0x14 */ Vec2_16 unk14;
} SITaskC; /* size: 0x18 */

typedef struct {
    /* 0x00 */ SITaskA *unk0;
    u8 filler4[0x30C];
} SITaskD; /* size: 0x310 */

void Task_802F75C(void);
void Task_802F9F8(void);
void Task_802FD34(void);
void Task_802FF94(void);
void TaskDestructor_80303CC(struct Task*);
void TaskDestructor_nop_8030458(struct Task*);
void TaskDestructor_803045C(struct Task*);

struct Task *SetupStageIntro(void)
{
    struct Task *t; // sp04
    SITaskA *sit_a; // sp08
    struct Task *t2;
    SITaskB *sit_b;
    struct Task *t3;
    SITaskC *sit_c;
    struct Task *t4;
    SITaskD *sit_d; // r8
    struct TransitionState *transition;
    Vec2_16 *vec;

    gUnknown_03005424 |= EXTRA_STATE__ACT_START;
    gUnknown_03005424 |= EXTRA_STATE__100;

    gPlayer.unk90->s.unk10 |= SPRITE_FLAG_MASK_18;
    gPlayer.unk94->s.unk10 |= SPRITE_FLAG_MASK_18;

    gActiveBossTask = NULL;

    t = TaskCreate(Task_802F75C, sizeof(SITaskA), 0x2200, 0, TaskDestructor_80303CC);
    sit_a = TaskGetStructPtr(t);
    sit_a->unk0 = 2;
    sit_a->unk4 = 0;

    gPlayer.moveState |= MOVESTATE_100000;


    t2 = TaskCreate(Task_802F9F8, sizeof(SITaskB), 0x2210, 0, TaskDestructor_nop_8030458);
    sit_b = TaskGetStructPtr(t2);
    sit_b->unk0 = sit_a;

    transition = &sit_b->transition;
    transition->unk0 = 0;
    transition->unk4 = 0;
    transition->unk2 = 2;
    transition->speed = 0;
    transition->unk8 = 0x3FFF;
    transition->unkA = 0;
    NextTransitionFrame(transition);


    t3 = TaskCreate(Task_802FD34, sizeof(SITaskC), 0x2220, 0, TaskDestructor_nop_8030458);
    sit_c = TaskGetStructPtr(t3);
    sit_c->unk0 = sit_a;

    vec = &sit_c->unk10;
    vec->x = 0;
    vec->y = 0;
    
    vec = &sit_c->unk14;
    vec->x = 0;
    vec->y = 0;

    t4 = TaskCreate(Task_802FF94, sizeof(SITaskD), 0x2230, 0, TaskDestructor_803045C);
    sit_d = TaskGetStructPtr(t4);
    sit_d->unk0 = sit_a;


    if(IS_SINGLE_PLAYER) {
        u16 charLogo0  = zoneLoadingCharacterLogos[gSelectedCharacter][0];
        u16 zoneNames0 = zoneLoadingZoneNames[LEVEL_TO_ZONE(gCurrentLevel)*4][0];
    } else {
        // _0802F260
    }

    return t;
}