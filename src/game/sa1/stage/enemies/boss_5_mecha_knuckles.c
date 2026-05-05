#include "global.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/enemies/bosses_shared.h"
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/sa1/save.h"
#include "game/shared/stage/dust_effect_braking.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/rings_scatter.h"
#include "game/shared/stage/screen_shake.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/water_effects.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "game/shared/stage/underwater_effects.h"

// TODO: Automate inserting 'MECHA_KNUX_PARTS_VARIANTS' from animation itself!
#define MECHA_KNUX_PARTS_VARIANTS 6

typedef enum {
    MKPHASE_A,
    MKPHASE_B,

    MKPHASE_COUNT
} MechaKnucklesPhases;

typedef enum {
    /*  0 */ MKSTATE_ACTIVATE,
    /*  1 */ MKSTATE_B,
    /*  2 */ MKSTATE_C,
    /*  3 */ MKPHASE_ACTIVATE_2,
    /*  4 */ MKSTATE_IDLE,
    /*  5 */ MKSTATE_IDLE_2,
    /*  6 */ MKSTATE_SPIN,
    /*  7 */ MKSTATE_GLIDE,
    /*  8 */ MKSTATE_LAND,
    /*  9 */ MKSTATE_LAND_2,
    /* 10 */ MKSTATE_COVER,
    /* 11 */ MKSTATE_SPINDASH,
    /* 12 */ MKSTATE_SPIN_2,
    /* 13 */ MKSTATE_PUNCH,
    /* 14 */ MKSTATE_PUNCH_2,
    /* 15 */ MKSTATE_LAUNCH_ROCKET,
    /* 16 */ MKSTATE_LAUNCH_ROCKET_2,
    /* 17 */ MKSTATE_HIT,
    /* 18 */ MKSTATE_HIT_2,
    /* 19 */ MKSTATE_DEFEATED,
    /* 20 */ MKSTATE_DEFEATED_2,
    /* 21 */ MKSTATE_DEFEATED_3,
    /* 22 */ MKSTATE_EGGMOBILE,
    /* 23 */ MKSTATE_EGGMOBILE_2,
    /* 24 */ MKSTATE_EGGMOBILE_3,

    /* 25 */ MKSTATE_COUNT
} MechaKnucklesStates;

typedef struct MechaKnuckles {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ s32 qUnk74;
    /* 0x78 */ s32 qUnk78;
    /* 0x7C */ s16 unk7C;
    /* 0x7E */ s16 unk7E;
    /* 0x80 */ s16 unk80;
    /* 0x82 */ s16 unk82;
    /* 0x84 */ u16 unk84;
    /* 0x88 */ u32 flags88;
    /* 0x8C */ s32 spawnX;
    /* 0x90 */ s32 spawnY;
    /* 0x94 */ s8 phase;
    /* 0x95 */ s8 lives;
    /* 0x96 */ s8 unk96;
    /* 0x97 */ s8 unk97;
    /* 0x98 */ s8 unk98;
    /* 0x99 */ s8 unk99;
    /* 0x9A */ s8 state;
    /* 0x9B */ s8 state2;
} MechaKnuckles; /* 0x9C */

typedef struct MechaKnucklesRocket {
    /* 0x00 */ s32 unk0;
    /* 0x00 */ s32 unk4;
    /* 0x00 */ s16 unk8;
    /* 0x00 */ s16 unkA;
    /* 0x00 */ s16 unkC;
    /* 0x00 */ s16 unkE;
    /* 0x00 */ s16 unk10;
    /* 0x00 */ s16 unk12;
    /* 0x14 */ Sprite s;
    /* 0x44 */ SpriteTransform transform;
} MechaKnucklesRocket; /* 0x50 */

typedef struct MechaKnucklesParts {
    /* 0x00 */ s32 unk0;
    /* 0x04 */ s32 unk4;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s16 unk14;
    /* 0x18 */ Sprite s;
    /* 0x48 */ SpriteTransform transform;
} MechaKnucklesParts; /* 0x54 */

typedef bool32 (*MechaKnuxPlayerFn)(MechaKnuckles *boss, Player *p);
typedef void (*MechaKnuxFn)(MechaKnuckles *boss, Player *p);

typedef struct Unk {
    s16 anim;
    u8 variant;
    u8 unk3;
} Unk;

void Task_MechaKnucklesInit(void);
void TaskDestructor_MechaKnuckles(struct Task *t);
void sub_804E8D4(MechaKnuckles *boss, s32 param1);
void sub_804EC60(MechaKnuckles *boss, MapEntity *me);

void CreateMechaKnucklesRocket(MechaKnuckles *boss);
void Task_MechaKnucklesRocketInit(void);
void TaskDestructor_MechaKnuckles_Rocket(struct Task *t);

struct Task *CreateMechaKnucklesParts(MechaKnuckles *boss, s32 variant);
void Task_MechaKnucklesPartsInit(void);
void TaskDestructor_MechaKnuckles_Parts(struct Task *t);

void sub_804EB04(MechaKnuckles *boss);
void sub_804EB90(MechaKnuckles *boss);
bool32 sub_804EE20(MechaKnuckles *boss);
void sub_804FDD4(MechaKnuckles *boss);

void sub_804F73C(MechaKnuckles *boss, Player *p);
void sub_804F760(MechaKnuckles *boss, Player *p);
void sub_804F788(MechaKnuckles *boss, Player *p);
void sub_804F78C(MechaKnuckles *boss, Player *p);
void sub_804F790(MechaKnuckles *boss, Player *p);
void sub_804F7B0(MechaKnuckles *boss, Player *p);
void sub_804F7B4(MechaKnuckles *boss, Player *p);
void sub_804F7C0(MechaKnuckles *boss, Player *p);
void sub_804F7C4(MechaKnuckles *boss, Player *p);
void sub_804F7C8(MechaKnuckles *boss, Player *p);
void sub_804F7CC(MechaKnuckles *boss, Player *p);
void sub_804F7D0(MechaKnuckles *boss, Player *p);
void sub_804F7D4(MechaKnuckles *boss, Player *p);
void sub_804F7D8(MechaKnuckles *boss, Player *p);
void sub_804F7DC(MechaKnuckles *boss, Player *p);
void sub_804F7E8(MechaKnuckles *boss, Player *p);
void sub_804F7EC(MechaKnuckles *boss, Player *p);
void sub_804F7F0(MechaKnuckles *boss, Player *p);
void sub_804F7F4(MechaKnuckles *boss, Player *p);
void sub_804F834(MechaKnuckles *boss, Player *p);
void sub_804F860(MechaKnuckles *boss, Player *p);
void sub_804F888(MechaKnuckles *boss, Player *p);
void sub_804F8D4(MechaKnuckles *boss, Player *p);
void sub_804F8D8(MechaKnuckles *boss, Player *p);
void sub_804F8DC(MechaKnuckles *boss, Player *p);
void sub_804F934(MechaKnuckles *boss, Player *p);
void sub_804F95C(MechaKnuckles *boss, Player *p);

bool32 sub_804EEA8(MechaKnuckles *boss, Player *p);
bool32 sub_804EF18(MechaKnuckles *boss, Player *p);
bool32 sub_804EFA0(MechaKnuckles *boss, Player *p);
bool32 sub_804F020(MechaKnuckles *boss, Player *p);
bool32 sub_804F984(MechaKnuckles *boss, Player *p);
bool32 sub_804F990(MechaKnuckles *boss, Player *p);
bool32 sub_804F9B0(MechaKnuckles *boss, Player *p);
bool32 sub_804FA08(MechaKnuckles *boss, Player *p);
bool32 sub_804FA38(MechaKnuckles *boss, Player *p);
bool32 sub_804FA54(MechaKnuckles *boss, Player *p);
bool32 sub_804FA70(MechaKnuckles *boss, Player *p);
bool32 sub_804FA9C(MechaKnuckles *boss, Player *p);
bool32 sub_804FAC8(MechaKnuckles *boss, Player *p);
bool32 sub_804FAF0(MechaKnuckles *boss, Player *p);
bool32 sub_804FB10(MechaKnuckles *boss, Player *p);
bool32 sub_804FB30(MechaKnuckles *boss, Player *p);
bool32 sub_804FB5C(MechaKnuckles *boss, Player *p);
bool32 sub_804FB7C(MechaKnuckles *boss, Player *p);
bool32 sub_804FBA8(MechaKnuckles *boss, Player *p);
bool32 sub_804FBE4(MechaKnuckles *boss, Player *p);
bool32 sub_804FC28(MechaKnuckles *boss, Player *p);
bool32 sub_804FC78(MechaKnuckles *boss, Player *p);
bool32 sub_804FCA4(MechaKnuckles *boss, Player *p);
bool32 sub_804FCEC(MechaKnuckles *boss, Player *p);
bool32 sub_804FD54(MechaKnuckles *boss, Player *p);
MechaKnucklesStates sub_804ED80(MechaKnuckles *boss, Player *p);

typedef struct ProcDataBoss5 {
    MechaKnuxPlayerFn knuxPlayerFn;
    MechaKnuxFn changeState;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    u16 unk10;
    u16 unk12;
    s32 unk14;

    s8 unk18;
    s8 unk19;
    Unk unk1C[MKPHASE_COUNT];
} ProcDataBoss5; /* 0x24 */

const ProcDataBoss5 sBoss5ProcData[MKSTATE_COUNT] = {
    [MKSTATE_ACTIVATE] = { sub_804EEA8,
                           sub_804F73C,
                           0x0000,
                           0x0000,
                           00,
                           00,
                           0x00,
                           0,
                           0x0000,
                           6,
                           14,
                           { { SA1_ANIM_BOSS_5_PHASE1_ACTIVATE, 0, 0 }, { -1, -1, 0 } } },
    [MKSTATE_B] = { sub_804EF18, sub_804F760, 0x0000, 0x0000, 00, 00, 0x00, 0, 0x0000, 6, 14, { { -1, -1, 0 }, { -1, -1, 0 } } },
    [MKSTATE_C] = { sub_804F984, sub_804F788, 0x0000, 0x0000, 00, 00, 0x00, 0, 0x0000, 6, 14, { { -1, -1, 0 }, { -1, -1, 0 } } },
    [MKPHASE_ACTIVATE_2] = { sub_804F990,
                             sub_804F78C,
                             0x0000,
                             0x0000,
                             00,
                             00,
                             0x00,
                             0,
                             0x0000,
                             6,
                             14,
                             { { SA1_ANIM_BOSS_5_PHASE1_ACTIVATE, 1, 0 }, { -1, -1, 0 } } },
    [MKSTATE_IDLE] = { sub_804F9B0,
                       sub_804F790,
                       0x0000,
                       0x0000,
                       00,
                       00,
                       0x00,
                       0,
                       0x0000,
                       6,
                       14,
                       { { SA1_ANIM_BOSS_5_PHASE1_IDLE, 0, 0 }, { -1, -1, 0 } } },
    [MKSTATE_IDLE_2] = { sub_804FA08,
                         sub_804F7B0,
                         0x0000,
                         0x0000,
                         00,
                         00,
                         0x5A,
                         0,
                         0x0200,
                         6,
                         14,
                         { { SA1_ANIM_BOSS_5_PHASE1_IDLE, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_IDLE, 0, 0 } } },
    [MKSTATE_SPIN] = { sub_804FA38,
                       sub_804F7B4,
                       0x0000,
                       0xFB20,
                       00,
                       42,
                       0x00,
                       0,
                       0x0210,
                       6,
                       9,
                       { { SA1_ANIM_BOSS_5_PHASE1_SPIN, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_SPIN, 0, 0 } } },
    [MKSTATE_GLIDE] = { sub_804EFA0,
                        sub_804F7C0,
                        0x0300,
                        0x0180,
                        03,
                        00,
                        0x00,
                        0,
                        0x1210,
                        6,
                        6,
                        { { SA1_ANIM_BOSS_5_PHASE1_GLIDE, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_GLIDE, 0, 0 } } },
    [MKSTATE_LAND] = { sub_804FA54,
                       sub_804F7C4,
                       0x0000,
                       0x0000,
                       00,
                       42,
                       0x00,
                       0,
                       0x0010,
                       6,
                       14,
                       { { SA1_ANIM_BOSS_5_PHASE1_LAND, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_LAND, 0, 0 } } },
    [MKSTATE_LAND_2] = { sub_804FA70,
                         sub_804F7C8,
                         0x0000,
                         0x0000,
                         00,
                         00,
                         0x00,
                         0,
                         0x0000,
                         6,
                         14,
                         { { SA1_ANIM_BOSS_5_PHASE1_LAND, 1, 0 }, { SA1_ANIM_BOSS_5_PHASE2_LAND, 1, 0 } } },
    [MKSTATE_COVER] = { sub_804FA9C,
                        sub_804F7CC,
                        0x0000,
                        0x0000,
                        00,
                        00,
                        0x00,
                        0,
                        0x1200,
                        6,
                        14,
                        { { SA1_ANIM_BOSS_5_PHASE1_COVER, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_COVER, 0, 0 } } },
    [MKSTATE_SPINDASH] = { sub_804FAC8,
                           sub_804F7D0,
                           0x0000,
                           0x0000,
                           00,
                           00,
                           0x3C,
                           0,
                           0x0900,
                           6,
                           9,
                           { { SA1_ANIM_BOSS_5_PHASE1_SPINDASH, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_SPINDASH, 0, 0 } } },
    [MKSTATE_SPIN_2] = { sub_804FAF0,
                         sub_804F7DC,
                         0x0480,
                         0x0000,
                         00,
                         00,
                         0x00,
                         0,
                         0x2400,
                         6,
                         9,
                         { { SA1_ANIM_BOSS_5_PHASE1_SPIN, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_SPIN, 0, 0 } } },
    [MKSTATE_PUNCH] = { sub_804FB10,
                        sub_804F7E8,
                        0x0000,
                        0x0000,
                        00,
                        00,
                        0x00,
                        0,
                        0x0200,
                        6,
                        14,
                        { { SA1_ANIM_BOSS_5_PHASE1_PUNCH, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE1_PUNCH, 0, 0 } } },
    [MKSTATE_PUNCH_2] = { sub_804FB30,
                          sub_804F7EC,
                          0x0000,
                          0x0000,
                          00,
                          00,
                          0x00,
                          0,
                          0x0200,
                          6,
                          14,
                          { { SA1_ANIM_BOSS_5_PHASE1_PUNCH, 1, 0 }, { SA1_ANIM_BOSS_5_PHASE1_PUNCH, 1, 0 } } },
    [MKSTATE_LAUNCH_ROCKET] = { sub_804FB5C,
                                sub_804F7F0,
                                0x0000,
                                0x0000,
                                00,
                                00,
                                0x00,
                                0,
                                0x1200,
                                6,
                                14,
                                { { SA1_ANIM_BOSS_5_PHASE2_LAUNCH_ROCKET, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_LAUNCH_ROCKET, 0, 0 } } },
    [MKSTATE_LAUNCH_ROCKET_2] = { sub_804FB7C,
                                  sub_804F7F4,
                                  0xFB80,
                                  0x0000,
                                  96,
                                  00,
                                  0x00,
                                  0,
                                  0x6400,
                                  6,
                                  14,
                                  { { SA1_ANIM_BOSS_5_PHASE2_LAUNCH_ROCKET, 1, 0 }, { SA1_ANIM_BOSS_5_PHASE2_LAUNCH_ROCKET, 1, 0 } } },
    [MKSTATE_HIT] = { sub_804FBA8,
                      sub_804F834,
                      0xFE80,
                      0xFD00,
                      00,
                      42,
                      0x00,
                      0,
                      0x1210,
                      6,
                      9,
                      { { SA1_ANIM_BOSS_5_PHASE1_HIT, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_HIT, 0, 0 } } },
    [MKSTATE_HIT_2] = { sub_804FBE4,
                        sub_804F860,
                        0x0000,
                        0x0000,
                        00,
                        00,
                        0x00,
                        0,
                        0x0000,
                        6,
                        9,
                        { { SA1_ANIM_BOSS_5_PHASE1_GROUND, 0, 0 }, { SA1_ANIM_BOSS_5_PHASE2_HIT, 0, 0 } } },
    [MKSTATE_DEFEATED] = { sub_804FC28,
                           sub_804F888,
                           0xFE80,
                           0xFD00,
                           00,
                           21,
                           0x00,
                           0,
                           0x1210,
                           6,
                           9,
                           { { SA1_ANIM_BOSS_5_PHASE2_DEFEATED, 0x00, 0 }, { SA1_ANIM_BOSS_5_PHASE2_DEFEATED, 0x00, 0 } } },
    [MKSTATE_DEFEATED_2] = { sub_804FC78,
                             sub_804F8D4,
                             0x0000,
                             0x0000,
                             00,
                             00,
                             0x78,
                             0,
                             0x0000,
                             6,
                             9,
                             { { SA1_ANIM_BOSS_5_PHASE2_DEFEATED, 0x01, 0 }, { SA1_ANIM_BOSS_5_PHASE2_DEFEATED, 0x01, 0 } } },
    [MKSTATE_DEFEATED_3] = { sub_804FCA4,
                             sub_804F8D8,
                             0x0000,
                             0x0000,
                             00,
                             00,
                             0x78,
                             0,
                             0x0000,
                             6,
                             14,
                             { { SA1_ANIM_BOSS_5_PHASE2_DEFEATED, 0x01, 0 }, { SA1_ANIM_BOSS_5_PHASE2_DEFEATED, 0x01, 0 } } },
    [MKSTATE_EGGMOBILE] = { sub_804FCEC,
                            sub_804F8DC,
                            0x0000,
                            0x0000,
                            00,
                            00,
                            0x00,
                            0,
                            0x6000000,
                            0,
                            0,
                            { { SA1_ANIM_EGGMOBILE, 0x00, 0 }, { SA1_ANIM_EGGMOBILE, 0x00, 0 } } },
    [MKSTATE_EGGMOBILE_2] = { sub_804F020,
                              sub_804F934,
                              0x0000,
                              0x0000,
                              00,
                              00,
                              0x00,
                              0,
                              0x6000000,
                              0,
                              0,
                              { { SA1_ANIM_EGGMOBILE, 0x01, 0 }, { SA1_ANIM_EGGMOBILE, 0x01, 0 } } },
    [MKSTATE_EGGMOBILE_3] = { sub_804FD54,
                              sub_804F95C,
                              0x0400,
                              0x0000,
                              00,
                              00,
                              0x00,
                              0,
                              0x6000000,
                              0,
                              0,
                              { { SA1_ANIM_EGGMOBILE, 0x00, 0 }, { SA1_ANIM_EGGMOBILE, 0x00, 0 } } },
};

const TileInfoFirework sMechaKnucklesParts[MECHA_KNUX_PARTS_VARIANTS] = {
    { SA1_ANIM_BOSS_5_PHASE2_PARTS, 0, MAX_TILES_VARIANT(SA1_ANIM_BOSS_5_PHASE2_PARTS, 0) },
    { SA1_ANIM_BOSS_5_PHASE2_PARTS, 1, MAX_TILES_VARIANT(SA1_ANIM_BOSS_5_PHASE2_PARTS, 1) },
    { SA1_ANIM_BOSS_5_PHASE2_PARTS, 2, MAX_TILES_VARIANT(SA1_ANIM_BOSS_5_PHASE2_PARTS, 2) },
    { SA1_ANIM_BOSS_5_PHASE2_PARTS, 3, MAX_TILES_VARIANT(SA1_ANIM_BOSS_5_PHASE2_PARTS, 3) },
    { SA1_ANIM_BOSS_5_PHASE2_PARTS, 4, MAX_TILES_VARIANT(SA1_ANIM_BOSS_5_PHASE2_PARTS, 4) },
    { SA1_ANIM_BOSS_5_PHASE2_PARTS, 5, MAX_TILES_VARIANT(SA1_ANIM_BOSS_5_PHASE2_PARTS, 5) },
};

// TODO: Fake-match
void CreateEntity_MechaKnuckles(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t;
    MechaKnuckles *boss;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_MechaKnucklesInit, sizeof(MechaKnuckles), 0x2000, 0, TaskDestructor_MechaKnuckles);
    boss = TASK_DATA(t);

#ifndef NON_MATCHING
    {
        register s32 r8 asm("r8") = 0;
        asm("" ::"r"(r8));
        asm("" ::: "r2");
    }
#endif

    boss->base.regionX = regionX;
    boss->base.regionY = regionY;
    boss->base.me = me;
    boss->base.meX = me->x;
    boss->base.id = id;
    SET_MAP_ENTITY_INITIALIZED(me);

    sub_804EC60(boss, me);

    if (gRingsScatterTask != NULL) {
        RingsScatter *scatter = TASK_DATA(gRingsScatterTask);
        scatter->SA2_LABEL(unk2B6) |= 1;
    }
}

// (97.27%) https://decomp.me/scratch/IOy1q
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_5__Task_MechaKnucklesInit.inc", void Task_MechaKnucklesInit())
{
    Sprite *s;
    Sprite *s2;
    s32 sp4;
    u32 var_r0;
    u32 var_r5;

    Player *p = &gPlayer;
    MechaKnuckles *boss;
#ifndef NON_MATCHING
    asm("" ::"r"(p));
#endif
    boss = TASK_DATA(gCurTask);

    s = &boss->s;
    s2 = &boss->s2;

    if (IS_ALIVE(p)) {
        gDispCnt &= ~0x8000;
        s->frameFlags &= ~0x180;
    }

    sp4 = sBoss5ProcData[boss->state].knuxPlayerFn(boss, p);
    sub_804EB04(boss);
    if (!(boss->flags88 & 0x04000000)) {
        sub_804FDD4(boss);
    }
    if (!(boss->flags88 & 0x02000000)) {
        sub_804EB90(boss);
    }

    var_r5 = sub_800BFEC(s, boss->spawnX + I(boss->qUnk74), boss->spawnY + I(boss->qUnk78), p);
    if (gNumSingleplayerCharacters == 2) {
        var_r5 |= sub_800BFEC(s, boss->spawnX + I(boss->qUnk74), boss->spawnY + I(boss->qUnk78), &gPartner);
    }

    if (var_r5 == 0) {
        if (boss->unk97 <= 0) {
#ifndef NON_MATCHING
            register Player *player asm("r3");
#else
            Player *player;
#endif
            var_r5 = sub_800C0E0(s, boss->spawnX + I(boss->qUnk74), boss->spawnY + I(boss->qUnk78), p);
            if (gNumSingleplayerCharacters == 2) {
                var_r0 = sub_800C0E0(s, boss->spawnX + I(boss->qUnk74), boss->spawnY + I(boss->qUnk78), &gPartner);
            } else {
                var_r0 = 0;
            }

            if (var_r5 != 0) {
                if (((boss->state == MKSTATE_IDLE_2) || (boss->state == MKSTATE_COVER)) && !(p->moveState & 2)) {
                    if (boss->state != MKSTATE_COVER) {
                        sp4 = 0;
                        boss->state2 = MKSTATE_COVER;
                        player = p;
                        player->qSpeedAirX = -player->qSpeedAirX;
                        player->qSpeedGround = -player->qSpeedGround;
                    }
                } else {
                    sp4 = 0;
                    boss->state2 = MKSTATE_HIT;
                    if (--boss->lives <= 0) {
                        boss->state2 = MKSTATE_DEFEATED;
                    }
                    boss->unk97 = 0x20;
                }
            } else if (var_r0 != 0) {
                if (((boss->state == MKSTATE_IDLE_2) || (boss->state == MKSTATE_COVER)) && ((gPartner.moveState & 2) == 0)) {
                    if (boss->state != MKSTATE_COVER) {
                        sp4 = 0;
                        boss->state2 = MKSTATE_COVER;
                        player = &gPartner;
                        player->qSpeedAirX = -player->qSpeedAirX;
                        player->qSpeedGround = -player->qSpeedGround;
                    }
                } else {
                    sp4 = 0;
                    boss->state2 = MKSTATE_HIT;
                    if (--boss->lives <= 0) {
                        boss->state2 = MKSTATE_DEFEATED;
                    }
                    boss->unk97 = 0x20;
                }
            }
        }
    }

    if (boss->unk97 != 0) {
        if (!(gStageTime & 2) && !(gPlayer.moveState & 0x80)) {
            s->frameFlags |= 0x100;
            gDispCnt |= 0x8000;
            gWinRegs[5] = 0x3F3F;
        }

        if (boss->state2 != MKSTATE_HIT && boss->state2 != MKSTATE_HIT_2) {
            boss->unk97--;
        }
    }

    s->x = s2->x = (boss->spawnX + I(boss->qUnk74)) - gCamera.x;
    s->y = s2->y = (boss->spawnY + I(boss->qUnk78)) - gCamera.y;

    if (boss->flags88 & 0x20) {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
    if (boss->flags88 & 0x40) {
        UpdateSpriteAnimation(s2);
        DisplaySprite(s2);
    }

    if (sp4 == 0) {
        boss->state = boss->state2;
        sub_804E8D4(boss, boss->state);
    }
}
END_NONMATCH

void sub_804E8D4(MechaKnuckles *boss, s32 state)
{
    s32 phase;
    const ProcDataBoss5 *procData;
    Player *p;
    Sprite *s;
    s32 var_r7;
    s32 var_r8;
    s32 temp_r1;
    s32 temp_r3;
    s32 temp_r5_2;
    s32 var_r2;

    procData = &sBoss5ProcData[state];

    p = &gPlayer;

    s = &boss->s;
    phase = boss->phase;
    var_r7 = procData->unk8;
    var_r8 = procData->unkC;
    var_r2 = boss->flags88;
    temp_r3 = procData->unk14;
    temp_r5_2 = (0x400 & temp_r3);
    if (temp_r5_2 == 0) {
        var_r2 = (var_r2 & 0xFFFFF8FF) | (0x300 & temp_r3);
    }
    temp_r1 = 0x2000 & temp_r3;
    if (temp_r1 == 0) {
        var_r2 = (var_r2 & 0xFFFFC7FF) | (0x1800 & temp_r3);
    }
    var_r2 = ((((((((var_r2 | temp_r5_2 | temp_r1) & ~0x10) | (temp_r3 & 0x10)) & 0xFFFF3FFF) | (0xC000 & temp_r3)) & 0xFDFFFFFF)
               | (0x02000000 & temp_r3))
              & 0xFBFFFFFF)
        | (temp_r3 & 0x04000000);
    if (var_r2 & 0x10) {
        var_r2 &= ~1;
    }
    boss->flags88 = var_r2;

    temp_r1 = procData->unk10;
    boss->unk84 = temp_r1;

    temp_r1 = procData->unk18;
    if (temp_r1 != boss->unk98) {
        boss->unk98 = procData->unk18;
    }

    temp_r1 = procData->unk19;
    if (temp_r1 != boss->unk99) {
        boss->qUnk78 -= Q(boss->unk99 - temp_r1);
        boss->unk99 = procData->unk19;
    }

    switch (0x1800 & var_r2) {
        case 0x800: {
            if (I(boss->qUnk74) > 0x77) {
                var_r7 = -var_r7;
                var_r8 = -var_r8;
            }
        } break;
        case 0x1000: {
            if ((I(boss->qUnk74) + boss->spawnX) >= I(p->qWorldX)) {
                var_r7 = -var_r7;
                var_r8 = -var_r8;
            }
        } break;
    }
    boss->unk7C = var_r7;
    boss->unk7E = procData->unkA;
    boss->unk80 = var_r8;
    boss->unk82 = procData->unkE;

    switch (0x300 & var_r2) {
        case 0x100: {
            if (I(boss->qUnk74) > 0x77) {
                SPRITE_FLAG_CLEAR(s, X_FLIP);
            } else {
                SPRITE_FLAG_SET(s, X_FLIP);
            }

        } break;

        case 0x200: {
            if ((I(boss->qUnk74) + boss->spawnX) >= I(p->qWorldX)) {
                SPRITE_FLAG_CLEAR(s, X_FLIP);
            } else {
                SPRITE_FLAG_SET(s, X_FLIP);
            }

        } break;
    }

    if ((procData->unk1C[phase].anim >= 0)
        && ((s->graphics.anim != procData->unk1C[phase].anim) || (s->variant != procData->unk1C[phase].variant))) {
        s->graphics.anim = procData->unk1C[phase].anim;
        s->variant = procData->unk1C[phase].variant;
        s->prevVariant = -1;
        SPRITE_FLAG_CLEAR(s, ANIM_OVER);
        s->hitboxes[0].index = -1;
        s->hitboxes[1].index = -1;
    }

    procData->changeState(boss, p);
}

void sub_804EB04(MechaKnuckles *boss)
{
    s32 var_r2;
    s32 var_r3;
    s32 var_r4;

    var_r3 = boss->unk7C;
    var_r4 = boss->unk7E;
    boss->qUnk74 += var_r3;
    boss->qUnk78 += var_r4;
    var_r2 = var_r3 & 0x80000000;
    var_r3 += boss->unk80;

    if ((boss->flags88 & 0x4000) && (var_r2 != (var_r3 & 0x80000000))) {
        var_r3 = 0;
        boss->unk80 = 0;
    }

    boss->unk7C = var_r3;
    var_r2 = var_r4;
    var_r2 &= 0x80000000;
    var_r4 = var_r4 + boss->unk82;

    if ((boss->flags88 & 0x8000) && (var_r2 != (var_r4 & 0x80000000))) {
        var_r4 = 0;
        boss->unk82 = 0;
    }

    boss->unk7E = var_r4;
}

void sub_804EB90(MechaKnuckles *boss)
{
    s32 *parts;
    s32 *temp_r5_2;
    s32 temp_r0;
    s32 res;
    s32 temp_r6;
    s32 temp_r7;

    temp_r7 = boss->spawnX + I(boss->qUnk74);
    temp_r6 = boss->spawnY + I(boss->qUnk78);

    boss->flags88 &= ~1;

    res = sa2__sub_801E4E4(temp_r6 + boss->unk99, temp_r7, 1, 8, NULL, sa2__sub_801EE64);
    if (boss->flags88 & 0x10) {
        if (res < 0) {
            boss->qUnk78 += res << 8;
            boss->flags88 |= 1;
        }
    } else if (res <= 0xA) {
        boss->qUnk78 += res << 8;
        boss->flags88 |= 1;
    }

    boss->flags88 &= ~2;

    if (boss->unk7E < 0) {
        res = sa2__sub_801E4E4(temp_r6 - boss->unk99, temp_r7, 1, -8, NULL, sa2__sub_801EE64);

        if (res < 0) {
            boss->qUnk78 -= Q(res);
            boss->flags88 |= 2;
        }
    }
}

void sub_804EC60(MechaKnuckles *boss, MapEntity *me)
{
    Sprite *s;
    s8 *ptr_r1;
    s8 *ptr_r3;
    s32 off_r1;
    Sprite *s2;
    u32 difficulty;

    boss->spawnX = TO_WORLD_POS(boss->base.meX, boss->base.regionX);
    boss->spawnY = TO_WORLD_POS(me->y, boss->base.regionY);
    boss->qUnk74 = Q(208);
    boss->qUnk78 = -Q(32);
    boss->unk7C = 0;
    boss->unk7E = 0;
    boss->unk80 = 0;
    boss->unk82 = 0;
    boss->flags88 = 0;
    boss->unk84 = 0;
    boss->phase = MKPHASE_A;

    ptr_r3 = &boss->lives;
    off_r1 = 8;
    difficulty = LOADED_SAVE->difficultyLevel;
    *ptr_r3 = off_r1 -= (difficulty * 2);
    ptr_r1 = &boss->unk96;
    *ptr_r1 = 4 - difficulty;

    boss->unk97 = 0;
    boss->unk98 = 0;
    boss->unk99 = 0;
    boss->state = MKSTATE_ACTIVATE;
    boss->state2 = MKSTATE_ACTIVATE;

    s = &boss->s;
    // TODO: ALLOC_TILES!
    s->graphics.dest = VramMalloc(64);
    s->oamFlags = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->hitboxes[1].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s2 = &boss->s2;
    // TODO: ALLOC_TILES!
    s2->graphics.dest = VramMalloc(30);
    s2->oamFlags = SPRITE_OAM_ORDER(20);
    s2->graphics.size = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = 0x10;
    s2->palId = 0;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    sub_804E8D4(boss, boss->state);
}

MechaKnucklesStates sub_804ED80(MechaKnuckles *boss, Player *p)
{
    s32 temp_r1;
    s32 temp_r2;
    s32 rnd;
    u32 result;
    s32 diffX;

    temp_r2 = I(p->qWorldX);
    temp_r1 = boss->spawnX + I(boss->qUnk74);
    diffX = temp_r2 - temp_r1;
    if (diffX < 0) {
        diffX = temp_r1 - temp_r2;
    }

    rnd = PseudoRandom32();

    if (boss->phase == MKPHASE_A) {
        if (diffX < 80) {
            if (diffX < 32) {
                result = (p->moveState & MOVESTATE_IN_AIR) ? 6 : 13;
            } else {
                if (0x1000 & rnd) {
                    result = 5;
                } else {
                    result = (rnd & 0x100) ? 11 : 6;
                }
            }
        } else {
            result = (rnd & 0x100) ? 11 : 6;
        }
    } else {
        if (diffX >= 80) {
            if (0x3000 & rnd) {
                result = 0xF;
            } else {
                result = (rnd & 0x100) ? 11 : 6;
            }
        } else if (p->moveState & MOVESTATE_IN_AIR) {
            result = 6;
        } else {
            result = (rnd & 0x100) ? 11 : 6;
        }
    }

    return result;
}

bool32 sub_804EE20(MechaKnuckles *boss)
{
    u32 temp_r0;
    u32 temp_r3;
    s32 result = FALSE;

    if (!(gStageTime & 7)) {
        struct Task *t;
        NutsAndBolts *bolts;

        temp_r0 = (((u32)PseudoRandom32() & 0x1FFF00) >> 8) - 4096;
        temp_r3 = (((u32)PseudoRandom32() & 0x1FFF00) >> 8) - 4096;
        t = sub_8017540(boss->qUnk74 + Q(boss->spawnX) + temp_r0, boss->qUnk78 + Q(boss->spawnY) + temp_r3);

        bolts = TASK_DATA(t);
        bolts->s.oamFlags = SPRITE_OAM_ORDER(19);
        result = TRUE;
    }
    return result;
}

bool32 sub_804EEA8(MechaKnuckles *boss, Player *p)
{
    bool32 result = TRUE;
    Camera *cam = &gCamera;

#ifndef NON_MATCHING
    register s32 r2 asm("r2");
    asm("" ::"r"(r2));
#endif

    cam->minX = cam->x;

    if (cam->maxY > boss->spawnY) {
        cam->maxY--;
    } else if (cam->maxY < boss->spawnY) {
        cam->maxY++;
    }

    if (cam->minY > boss->spawnY - DISPLAY_HEIGHT) {
        cam->minY--;
    } else if (cam->minY < boss->spawnY - DISPLAY_HEIGHT) {
        cam->minY++;
    }

    if (I(p->qWorldX) >= (boss->spawnX + 0x20)) {
        boss->state2 = MKSTATE_B;
        result = 0;
    }

    return result;
}

u32 sub_804EF18(MechaKnuckles *boss, Player *p)
{
    bool32 result = TRUE;
    Camera *cam = &gCamera;

#ifndef NON_MATCHING
    register s32 r2 asm("r2");
    asm("" ::"r"(r2));
#endif

    if (cam->minX < boss->spawnX) {
        cam->minX++;
    }

    if (cam->maxY > boss->spawnY) {
        cam->maxY--;
    } else if (cam->maxY < boss->spawnY) {
        cam->maxY++;
    }

    if (cam->minY > boss->spawnY - DISPLAY_HEIGHT) {
        cam->minY--;
    } else if (cam->minY < boss->spawnY - DISPLAY_HEIGHT) {
        cam->minY++;
    }

    if (boss->spawnX <= cam->minX) {
        if (boss->spawnY >= cam->maxY) {
            boss->state2 = MKSTATE_C;
            result = 0;
        }
    }

    return result;
}

bool32 sub_804EFA0(MechaKnuckles *boss, Player *p)
{
    s16 *temp_r0;
    s16 *temp_r1;
    s16 temp_r4;
    s16 var_r0;
    bool32 result;
    u16 temp_r2;

    result = TRUE;
    if (boss->unk7E < 0x80) {
        boss->unk7E += 0x18;
    } else {
        boss->unk7E -= 0x18;
    }

    if ((boss->flags88 & 0xC) || ((boss->unk7C < 0) && ((I(p->qWorldX) - (boss->spawnX + I(boss->qUnk74))) > 0x20))
        || ((boss->unk7C > 0) && (I(p->qWorldX) - (boss->spawnX + I(boss->qUnk74)) < -0x20))) {
        boss->state2 = MKSTATE_LAND;
        result = FALSE;
    }
    return result;
}

bool32 sub_804F020(MechaKnuckles *boss, Player *p)
{
    bool32 result;

    result = TRUE;
    if (gCamera.minX < gCamera.maxX - DISPLAY_WIDTH) {
        gCamera.minX++;
    }
    if (gCamera.minX < gCamera.x) {
        gCamera.minX = gCamera.x;
    }
    if (SPRITE_FLAG_GET(&boss->s, ANIM_OVER)) {
        boss->state2 = MKSTATE_EGGMOBILE_3;
        result = FALSE;
        CreateBossCapsule(boss->spawnX + I(boss->qUnk74), boss->spawnY + I(boss->qUnk78));
        gMusicManagerState.unk1 = 0x32;
    }
    return result;
}

void CreateMechaKnucklesRocket(MechaKnuckles *boss)
{
    s32 isFlippedX;
    Sprite *s;
    SpriteTransform *tf;
    struct Task *t;
    MechaKnucklesRocket *rocket;
    t = TaskCreate(Task_MechaKnucklesRocketInit, sizeof(MechaKnucklesRocket), 0x2001U, 0U, TaskDestructor_MechaKnuckles_Rocket);
    rocket = TASK_DATA(t);

    s = &rocket->s;
    tf = &rocket->transform;
    isFlippedX = boss->s.frameFlags & SPRITE_FLAG_MASK_X_FLIP;

    rocket->unk0 = (Q(boss->spawnX) + boss->qUnk74);
    rocket->unk4 = (Q(boss->spawnY) + boss->qUnk78 - Q(6));
    rocket->unk8 = -Q(0.25);

    if (isFlippedX) {
        rocket->unk8 = 0x40;
    }
    rocket->unkA = 0;
    rocket->unkC = 0x40;

    if (PseudoRandom32() & 0x1000) {
        rocket->unkC = 0x20;
    }

    rocket->unk10 = 0;
    rocket->unk12 = 0;
    if (!isFlippedX) {
        rocket->unk12 = 0x80;
    }

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_5_ROCKET);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_5_PHASE2_ROCKET;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(21);
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = 0x2000;

    tf->rotation = 0;
    tf->qScaleX = Q(1);
    if (isFlippedX) {
        tf->qScaleX = -tf->qScaleX;
    }

    tf->qScaleY = Q(1);
    tf->x = 0;
    tf->y = 0;
}

// (98.53%) https://decomp.me/scratch/6KEfY
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_5__Task_MechaKnucklesRocketInit.inc", void Task_MechaKnucklesRocketInit(void))
{
    Sprite *s;
    SpriteTransform *tf;
    s32 qWorldX;
    s32 qWorldY;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r4;
    s32 screenX;
    s32 screenY;
    s32 temp_r0;
    s32 temp_r2;
    s32 temp_r2_2;
    s32 temp_r6;
    s32 collPlayer;
    s32 collPartner;
    s32 var_r0;
    s32 var_r1;
    u32 var_r8;
    s32 var_r9;

    s32 unk8, unkA;

    MechaKnucklesRocket *rocket = TASK_DATA(gCurTask);

    s = &rocket->s;
    tf = &rocket->transform;
    qWorldX = rocket->unk0;
    qWorldY = rocket->unk4;
    var_r8 = rocket->unk12 & 0xFF;
    if (rocket->unk10 > 0x18) {
        s32 qPlayerX = gPlayer.qWorldX;
        s32 qPlayerY = gPlayer.qWorldY;
        temp_r6 = (qPlayerY - qWorldY);

        unk8 = rocket->unk8;
        unkA = rocket->unkA;
        var_r1 = unkA + (SIN_24_8((var_r9 = (var_r8 & 0xFF) * 4)) * 8);
        var_r0 = qPlayerX - qWorldX;
        var_r0 = ABS(var_r0);
        temp_r0 = var_r1 * var_r0 / ABS((unk8 + ((COS_24_8((var_r8 & 0xFF) * 4)) * 8)));

        if (temp_r0 < (temp_r6 - Q(8))) {
            if (unk8 > 0) {
                var_r8 += 3;
            } else {
                var_r8 -= 3;
            }
        } else if (temp_r0 > temp_r6) {
            if (unk8 > 0) {
                var_r8 -= 3;
            } else {
                var_r8 += 3;
            }
        }

        var_r8 &= 0xFF;
        rocket->unk12 = var_r8;
    }
    qWorldX += rocket->unk8;
    qWorldY += rocket->unkA;
    if (rocket->unk10 > 16) {
        rocket->unk8 += I(rocket->unkC * COS_24_8((var_r8 & 0xFF) * 4));
        rocket->unkA += I(rocket->unkC * SIN_24_8((var_r8 & 0xFF) * 4));
    }

    rocket->unk0 = qWorldX;
    rocket->unk4 = qWorldY;

    collPlayer = sub_800BF10(s, I(qWorldX), I(qWorldY), &gPlayer);
    if (gNumSingleplayerCharacters == 2) {
        collPartner = sub_800BF10(s, I(qWorldX), I(qWorldY), &gPartner);
    } else {
        collPartner = 0;
    }
    if ((collPlayer | collPartner) != 0) {
        s32 q21 = Q(21);
        sub_8017540(qWorldX + Q_MUL(q21, COS_24_8((0xFF & var_r8) * 4)), qWorldY + Q_MUL(q21, SIN_24_8((0xFF & var_r8) * 4)));
        TaskDestroy(gCurTask);
        return;
    }
    screenX = I(qWorldX) - gCamera.x;
    screenY = I(qWorldY) - gCamera.y;
    temp_r2_2 = (PseudoRandom32() & 0x3FF) - Q(26);

    CreateBrakingDustEffect(I(qWorldX + Q_MUL(temp_r2_2, COS_24_8((var_r8 & 0xFF) * 4))),
                            I(qWorldY + Q_MUL(temp_r2_2, SIN_24_8((var_r8 & 0xFF) * 4))));

    if (((u32)(screenX + 32) >= DISPLAY_WIDTH + 64) || ((u32)(screenY + 64) >= DISPLAY_HEIGHT + 128)) {
        TaskDestroy(gCurTask);
        return;
    }

    rocket->unk10++;
    tf->x = screenX;
    tf->y = screenY;
    var_r1 = var_r8;
    if (tf->qScaleX < 0) {
        var_r1 += 0x80;
    }
    tf->rotation = ((var_r1 + 0x80) * 4) & 0x3FF;
    s->frameFlags = 0x2000;
    s->frameFlags |= (gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);
}
END_NONMATCH

struct Task *CreateMechaKnucklesParts(MechaKnuckles *boss, s32 variant)
{
    struct Task *sp4;
    TileInfoFirework *temp_r4;
    s32 temp_r0_2;
    s32 temp_r0_3;
    s32 temp_r1;
    s32 temp_r2;
    s32 temp_r2_2;
    u32 numTiles;
    struct Task *t;
    MechaKnucklesParts *parts;
    SpriteTransform *tf;
    Sprite *s;
    s32 val;

    t = TaskCreate(Task_MechaKnucklesPartsInit, sizeof(MechaKnucklesParts), 0x4001U, 0U, TaskDestructor_MechaKnuckles_Parts);
    parts = TASK_DATA(t);
    s = &parts->s;
    tf = &parts->transform;
    {
        const TileInfoFirework *tileInfo = &sMechaKnucklesParts[variant];
        s->graphics.dest = VramMalloc(tileInfo->numTiles);
        s->graphics.anim = tileInfo->anim;
        s->variant = tileInfo->variant;
    }
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->frameFlags = 0x2000;
    parts->unk0 = Q(boss->spawnX) + boss->qUnk74;
    parts->unk4 = Q(boss->spawnY) + boss->qUnk78;
    val = (((u32)(PseudoRandom32() << 0xD) >> 0x15) - Q(4));
    parts->unk8 = val;
    {
        s32 val = -((u32)(PseudoRandom32() << 15) >> 23) - Q(2);
        parts->unkA = val;
    }
    parts->unkC = 0;
    parts->unkE = (s16)(0x2A - ((u32)(0x1F00 & PseudoRandom32()) >> 8));
    parts->unk10 = 0;
    parts->unk12 = ((u32)PseudoRandom32() >> 8);
    val = ((u32)(PseudoRandom32() << 0xC) >> 0x14) - Q(8);
    parts->unk14 = val;
    s->graphics.size = 0;
    s->prevVariant = -1;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;

    tf->rotation = 0;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = 0;
    tf->y = 0;

    return t;
}

void Task_MechaKnucklesPartsInit()
{
    Sprite *s;
    SpriteTransform *tf;
    Camera *cam;
    s32 screenX;
    s32 screenY;

    MechaKnucklesParts *parts = TASK_DATA(gCurTask);

    s = &parts->s;
    tf = &parts->transform;
    cam = &gCamera;

    parts->unk0 += parts->unk8;
    parts->unk4 += parts->unkA;
    parts->unk8 += parts->unkC;
    parts->unkA += parts->unkE;
    parts->unk12 += parts->unk14;

    if (parts->unk14 != 0) {
        if (parts->unk14 > 0) {
            parts->unk14 = parts->unk14 - 8;

            if (parts->unk14 < 0) {
                parts->unk14 = 0;
            }
        }

        if (parts->unk14 < 0) {
            parts->unk14 += 8;

            if (parts->unk14 > 0) {
                parts->unk14 = 0;
            }
        }
    }

    screenX = I(parts->unk0) - cam->x;
    screenY = I(parts->unk4) - cam->y;

    if (((screenX + 0x20) > 0x12FU) || (screenY > 0xDF)) {
        TaskDestroy(gCurTask);
        return;
    }

    tf->x = screenX;
    tf->y = screenY;
    tf->rotation = ((u16)parts->unk12 >> 6);
    s->frameFlags &= ~0x1F;

    s->frameFlags |= (gOamMatrixIndex++ | 0x20);
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);
}

void sub_804F73C(MechaKnuckles *boss, Player *p)
{
    gCamera.maxX = boss->spawnX + DISPLAY_WIDTH;
    gCamera.minY = gCamera.y;
    gCamera.maxY = gCamera.y + DISPLAY_HEIGHT;
    boss->flags88 |= 0x20;
}

void sub_804F760(MechaKnuckles *boss, Player *p)
{
    gCamera.minX = gCamera.x;
    p->qSpeedGround = 0;
    p->qSpeedAirX = 0;
    p->qSpeedAirY = 0;
    p->moveState |= MOVESTATE_IGNORE_INPUT;
    p->moveState &= ~MOVESTATE_FACING_LEFT;
    p->heldInput = 0;
    p->frameInput = 0;
}

void sub_804F788(MechaKnuckles *boss, Player *p) { }

void sub_804F78C(MechaKnuckles *boss, Player *p) { }

void sub_804F790(MechaKnuckles *boss, Player *p)
{
    p->charState = CHARSTATE_39;
    p->moveState |= MOVESTATE_800000;
    gMusicManagerState.unk1 = 0x11;
}

void sub_804F7B0(MechaKnuckles *boss, Player *p) { }

void sub_804F7B4(MechaKnuckles *boss, Player *p) { m4aSongNumStart(SE_JUMP); }

void sub_804F7C0(MechaKnuckles *boss, Player *p) { }

void sub_804F7C4(MechaKnuckles *boss, Player *p) { }

void sub_804F7C8(MechaKnuckles *boss, Player *p) { }

void sub_804F7CC(MechaKnuckles *boss, Player *p) { }

void sub_804F7D0(MechaKnuckles *boss, Player *p) { m4aSongNumStart(SE_SPIN_ATTACK); }

void sub_804F7DC(MechaKnuckles *boss, Player *p) { m4aSongNumStart(SE_SPINDASH_RELEASE); }

void sub_804F7E8(MechaKnuckles *boss, Player *p) { }

void sub_804F7EC(MechaKnuckles *boss, Player *p) { }

void sub_804F7F0(MechaKnuckles *boss, Player *p) { }

void sub_804F7F4(MechaKnuckles *boss, Player *p)
{
    CreateMechaKnucklesRocket(boss);
    m4aSongNumStart(SE_200);
    CreateScreenShake(0x200U, 0x10U, 0x100U, -1U, 0x80U);
    CreateScreenShake(0x400U, 0x10U, 0x80U, -1U, 0x40U);
}

void sub_804F834(MechaKnuckles *boss, Player *p)
{
    if (boss->lives == (s8)boss->unk96) {
        boss->unk80 >>= 1;
        boss->unk82 >>= 1;
    }
}

void sub_804F860(MechaKnuckles *boss, Player *p)
{
    if (boss->lives == (s8)boss->unk96) {
        boss->phase = MKPHASE_B;
        gMusicManagerState.unk1 = 0x12;
    }
}

void sub_804F888(MechaKnuckles *boss, Player *p) { INCREMENT_SCORE_A(1000); }

void sub_804F8D4(MechaKnuckles *boss, Player *p) { }

void sub_804F8D8(MechaKnuckles *boss, Player *p) { }

void sub_804F8DC(MechaKnuckles *boss, Player *p)
{
    Camera *cam = &gCamera;
    boss->qUnk74 = +Q(272); // TODO: Is this (DISPLAY_WIDTH + 32)?
    boss->qUnk78 = -Q(100);
    cam->maxX = gRefCollision->pxWidth;
    boss->s.frameFlags &= ~0x400;
    boss->s2.frameFlags &= ~0x400;
    boss->s2.graphics.anim = SA1_ANIM_EGGMAN;
    boss->s2.variant = 3;
    boss->s2.prevVariant = -1;
    boss->flags88 |= 0x40;
}

void sub_804F934(MechaKnuckles *boss, Player *p)
{
    boss->s.frameFlags &= ~0x400;
    boss->s2.graphics.anim = SA1_ANIM_EGGMAN;
    boss->s2.variant = 9;
    boss->s2.prevVariant = -1;
}

void sub_804F95C(MechaKnuckles *boss, Player *p)
{
    boss->s.frameFlags |= 0x400;
    boss->s2.graphics.anim = SA1_ANIM_EGGMAN;
    boss->s2.variant = 6;
    boss->s2.prevVariant = -1;
}

u32 sub_804F984(MechaKnuckles *boss, Player *p)
{
    boss->state2 = MKPHASE_ACTIVATE_2;
    return 0;
}

bool32 sub_804F990(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = MKSTATE_IDLE;
        result = FALSE;
    }

    return result;
}

u32 sub_804F9B0(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (p->spriteInfoBody->s.frameFlags & 0x4000) {
        boss->state2 = MKSTATE_IDLE_2;
        result = FALSE;
        p->moveState &= ~MOVESTATE_IGNORE_INPUT;
        p->heldInput |= gPlayerControls.jump | gPlayerControls.attack;
        p->moveState &= ~MOVESTATE_800000;
        p->charState = CHARSTATE_IDLE;
    }

    return result;
}

u32 sub_804FA08(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;
    u16 *temp_r0;
    s16 temp_r1 = boss->unk84;
    boss->unk84--;

    if (temp_r1 <= 0) {
        boss->state2 = sub_804ED80(boss, p);
        result = FALSE;
    }
    return result;
}

u32 sub_804FA38(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;
    if (boss->unk7E >= 0) {
        boss->state2 = MKSTATE_GLIDE;
        result = FALSE;
    }
    return result;
}

u32 sub_804FA54(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->flags88 & 1) {
        boss->state2 = MKSTATE_LAND_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FA70(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = sub_804ED80(boss, p);
        result = FALSE;
    }

    return result;
}

u32 sub_804FA9C(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = sub_804ED80(boss, p);
        result = FALSE;
    }

    return result;
}

u32 sub_804FAC8(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;
    u16 *temp_r0;
    s16 temp_r1 = boss->unk84;
    boss->unk84--;

    if (temp_r1 <= 0) {
        boss->state2 = MKSTATE_SPIN_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FAF0(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->flags88 & (0x8 | 0x4)) {
        boss->state2 = MKSTATE_IDLE_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FB10(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = MKSTATE_PUNCH_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FB30(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = sub_804ED80(boss, p);
        result = FALSE;
    }

    return result;
}

u32 sub_804FB5C(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = MKSTATE_LAUNCH_ROCKET_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FB7C(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = sub_804ED80(boss, p);
        result = FALSE;
    }

    return result;
}

u32 sub_804FBA8(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->lives == boss->unk96) {
        sub_804EE20(boss);
    }

    if (boss->flags88 & 1) {
        boss->state2 = MKSTATE_HIT_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FBE4(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (boss->lives == boss->unk96) {
        sub_804EE20(boss);
    }

    if (boss->s.frameFlags & 0x4000) {
        boss->state2 = sub_804ED80(boss, p);
        result = FALSE;
    }

    return result;
}

u32 sub_804FC28(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    sub_804EE20(boss);

    if (boss->flags88 & 4) {
        boss->unk7C = -boss->unk7C;
    }
    if (boss->flags88 & 8) {
        boss->unk7C = -boss->unk7C;
    }
    if (boss->flags88 & 1) {
        boss->state2 = MKSTATE_DEFEATED_2;
        result = FALSE;
    }
    return result;
}

u32 sub_804FC78(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;
    u16 *temp_r0;
    s16 temp_r1;

    sub_804EE20(boss);

    temp_r1 = boss->unk84;
    boss->unk84--;

    if (temp_r1 <= 0) {
        boss->state2 = MKSTATE_DEFEATED_3;
        result = FALSE;
    }

    return result;
}

u32 sub_804FCA4(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;
    if (sub_804EE20(boss)) {
        boss->state2 = MKSTATE_EGGMOBILE;
        result = FALSE;

        CreateMechaKnucklesParts(boss, 0);
        CreateMechaKnucklesParts(boss, 1);
        CreateMechaKnucklesParts(boss, 2);
        CreateMechaKnucklesParts(boss, 3);
        CreateMechaKnucklesParts(boss, 4);
#ifdef BUG_FIX
        // One additional leg can get spawned but isn't in the original.
        // It might have introduced a graphical bug or was simply forgotten.
        CreateMechaKnucklesParts(boss, 5);
#endif
    }
    return result;
}

u32 sub_804FCEC(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (gCamera.minX < (gCamera.maxX - DISPLAY_WIDTH)) {
        gCamera.minX++;
    }

    if (gCamera.minX < gCamera.x) {
        gCamera.minX = gCamera.x;
    }

    if (((boss->spawnX + I(boss->qUnk74) + 0x20) <= (gCamera.x + DISPLAY_WIDTH))
        && ((s32)gCamera.minX >= (s32)(gCamera.maxX - DISPLAY_WIDTH))) {
        boss->state2 = MKSTATE_EGGMOBILE_2;
        result = FALSE;
    }

    return result;
}

u32 sub_804FD54(MechaKnuckles *boss, Player *p)
{
    s32 result = TRUE;

    if (gCamera.minX < (gCamera.maxX - DISPLAY_WIDTH)) {
        gCamera.minX++;
    }

    if (gCamera.minX < gCamera.x) {
        gCamera.minX = gCamera.x;
    }

    if (boss->spawnX + I(boss->qUnk74) >= (gCamera.maxX + 32)) {
        boss->flags88 &= ~0x60;
        TaskDestroy(gCurTask);
    }

    return result;
}

void TaskDestructor_MechaKnuckles(struct Task *t)
{
    MechaKnuckles *boss = TASK_DATA(t);
    VramFree(boss->s.graphics.dest);
    VramFree(boss->s2.graphics.dest);
}

void sub_804FDD4(MechaKnuckles *boss)
{
    s32 temp_r0;
    s32 temp_r0_2;
    s32 var_r2;
    s32 var_r3;

    var_r2 = boss->qUnk74;
    var_r3 = boss->flags88;
    var_r3 &= ~(0x4 | 0x8);
    temp_r0 = (I(boss->qUnk74) - boss->unk98) - 6;

    if (temp_r0 < 0) {
        var_r2 -= Q(temp_r0);
        var_r3 |= 4;
    }

    temp_r0 = (I(var_r2) + boss->unk98) - 234;
    if (temp_r0 > 0) {
        var_r2 -= Q(temp_r0);
        var_r3 |= 8;
    }

    boss->qUnk74 = var_r2;
    boss->flags88 = var_r3;
}

void TaskDestructor_MechaKnuckles_Rocket(struct Task *t)
{
    MechaKnucklesRocket *rocket = TASK_DATA(t);
    Sprite *s = &rocket->s;
    VramFree(s->graphics.dest);
    m4aSongNumStop(SE_200);
}

void TaskDestructor_MechaKnuckles_Parts(struct Task *t)
{
    MechaKnucklesParts *parts = TASK_DATA(t);
    Sprite *s = &parts->s;
    VramFree(s->graphics.dest);
}
