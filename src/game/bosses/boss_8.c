#if TAS_TESTING
#include <stdlib.h>
#include <stdio.h>
#endif

#include "global.h"
#include "flags.h"
#include "task.h"
#include "trig.h"
#include "bg_triangles.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/camera.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/player.h"
#include "game/bosses/common.h"
#include "game/player_callbacks.h" // UpdateHomingPosition
#include "game/cheese.h"
#include "game/stage/camera.h"
#include "game/stage/player.h"
#include "game/stage/results.h"
#include "game/stage/boss_results_transition.h"
#include "game/stage/screen_mask.h"
#include "game/stage/screen_fade.h"
#include "game/stage/screen_shake.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/move_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

#define ARM_LEFT   0
#define ARM_RIGHT  1
#define ARM_COUNT  2
#define NUM_TOWERS 3

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
} BossSprite;

typedef struct {
    /*  0x00 */ Vec2_32 qPos;
    /*  0x08 */ u8 livesCockpit;
    /*  0x09 */ u8 livesArms[ARM_COUNT];
    /*  0x0B */ u8 unkB;
    /*  0x0C */ u8 unkC;
    /*  0x0E */ u16 unkE;
    /*  0x10 */ u16 unk10; // rotationHead ?
    /*  0x12 */ u8 unk12;
    /*  0x14 */ u32 unk14;
    /*  0x18 */ Vec2_32 qUnk18[ARM_COUNT];
    /*  0x28 */ u16 rotation[ARM_COUNT];
    /*  0x2C */ u16 rotation2[ARM_COUNT];
    /*  0x30 */ u16 unk30[ARM_COUNT];
    /*  0x34 */ s16 qUnk34[ARM_COUNT][2];
    /*  0x3C */ u8 unk3C[ARM_COUNT];
    /*  0x3E */ u8 unk3E[ARM_COUNT];
    /*  0x40 */ u8 unk40[ARM_COUNT];
    /*  0x42 */ u8 unk42[ARM_COUNT];
    /*  0x44 */ void *tilesCloud;
    /*  0x48 */ ScreenFade fade;
    /*  0x54 */ BossSprite bsHead;
    /*  0x90 */ BossSprite bsArms[ARM_COUNT];
    /* 0x108 */ Background body;
} SuperEggRoboZ; /* size: 0x148 */

typedef struct {
    u16 unk0;
    u16 unk2;
    u8 bossIndex;
    u8 unk5;
    u8 unk6;
} BossRunManager;

typedef struct {
    Sprite sprites[NUM_TOWERS][2];
    void *vram;
    Vec2_32 positions[NUM_TOWERS];
    Vec2_32 offsets[NUM_TOWERS];
    u16 unk154[NUM_TOWERS];
    u8 unk15A[NUM_TOWERS];
    u8 unk15D;
    u8 unk15E;
    u8 unk15F;
    SuperEggRoboZ *boss;
} SuperEggRoboZTowers; /* 0x164 */

typedef void (*EggRoboFn)(SuperEggRoboZ *boss, u8 arm);
typedef void (*SuperEggRoboZTowersCallback)(SuperEggRoboZTowers *, u8);

static void sub_8049F1C(SuperEggRoboZTowers *towers, u8 i);
static void sub_804A070(SuperEggRoboZTowers *towers, u8 i);
static void sub_804A1C0(SuperEggRoboZTowers *towers, u8 i);
static void sub_804A398(SuperEggRoboZTowers *towers, u8 i);
static void sub_804A53C(SuperEggRoboZTowers *towers, u8 i);
static void Task_SuperEggRoboZTowersMain(void);
static void TaskDestructor_SuperEggRoboZTowers(struct Task *);

static void Task_SuperEggRoboZMain(void);
static void TaskDestructor_SuperEggRoboZMain(struct Task *);

static void Task_BossRunManagerMain(void);
static void TaskDestructor_BossRunManager(struct Task *);

void Task_804AB24(void);
static void Task_804AD68(void);
static u8 sub_804B0EC(SuperEggRoboZ *boss, u8 arm);
static void sub_804B43C(SuperEggRoboZ *boss, u8 p1);
static void sub_804B594(SuperEggRoboZ *boss, u8 p1);
static void sub_804B734(SuperEggRoboZ *boss, u8 p1);
static void sub_804B984(SuperEggRoboZ *boss, u8 p1);
static void sub_804BAC0(SuperEggRoboZ *boss, u8 p1);
void sub_804BC44(SuperEggRoboZ *boss, u8 p1);
static void sub_804BE6C(SuperEggRoboZ *boss, u8 p1);
static void sub_804C080(SuperEggRoboZ *boss);
void sub_804C240(SuperEggRoboZ *boss, u8 p1);
static void sub_804C3AC(SuperEggRoboZ *boss);
static void sub_804C5B8(SuperEggRoboZ *boss);
static void sub_804C830(SuperEggRoboZ *boss);
static void sub_804CA08(SuperEggRoboZ *boss);
static void sub_804CA70(SuperEggRoboZ *boss);
static void Task_ShowResultsAndDelete(void);
static void sub_804CC98(SuperEggRoboZ *boss);
void sub_804AE40(SuperEggRoboZ *boss);
static void Boss8_HitCockpit(SuperEggRoboZ *boss);
static void sub_804C8F4(SuperEggRoboZ *boss);
static void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1);
static bool8 sub_804C9B4(SuperEggRoboZ *boss, u8 param1);

const u16 sBossRunCameraYTriggers[] = {
    6400, // boss 2
    13888, // boss 3
    18016, // boss 4
    23104, // boss 5
    29152, // boss 6
    38080, // boss 7
    43091, // boss 8
};

const u16 gUnknown_080D87E6[][2] = {
    { 5804, 177 }, { 13292, 177 }, { 17420, 177 }, { 22508, 177 }, { 28585, 177 }, { 37484, 201 }, { 41600, 225 }, { 41600, 225 },
};

const s32 gUnknown_080D8808[][2] = {
    { 5376, -4512 }, { 12864, -5952 }, { 17088, -2688 }, { 22080, -3552 }, { 28128, -4512 }, { 37058, -7394 }, { 42240, -3648 },
};

const s32 gUnknown_080D8840[][2] = {
    { 42869, 287 },
    { 42943, 287 },
    { 43017, 287 },
};

const u8 gUnknown_080D8858[][2] = {
    { 1, 1 }, { 2, 60 }, { 3, 120 }, { 4, 129 }, { 0, 180 }, { 0, 0 },
};

const TileInfo sTowerPiecesTileInfo[] = {
    { 0, SA2_ANIM_SUPER_EGG_ROBO_Z_PLATFORM, 0 },
    { 0, SA2_ANIM_SUPER_EGG_ROBO_Z_PLATFORM_PROP, 0 },
};

const SuperEggRoboZTowersCallback sTowerStateCallbacks[] = {
    sub_8049F1C, sub_804A070, sub_804A1C0, sub_804A398, sub_804A53C,
};

const u16 gUnknown_080D8888[2][2] = { { Q(188), Q(110) }, { Q(162), Q(110) } };

static const EggRoboFn sArmFuncs[8]
    = { sub_804B43C, sub_804B594, sub_804B734, sub_804B984, sub_804BC44, sub_804BE6C, sub_804BAC0, sub_804C240 };

const u16 sArmPalettes[2][16] = {
    INCBIN_U16("graphics/boss_8_a.gbapal"),
    INCBIN_U16("graphics/boss_8_b.gbapal"),
};

#define SWITCH_ARM_VARIANT(boss, arm, vNum)                                                                                                \
    {                                                                                                                                      \
        Sprite *s = &boss->bsArms[arm].s;                                                                                                  \
                                                                                                                                           \
        if (arm != ARM_LEFT) {                                                                                                             \
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;                                                                        \
            s->variant = vNum;                                                                                                             \
        } else {                                                                                                                           \
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;                                                                         \
            s->variant = vNum;                                                                                                             \
        }                                                                                                                                  \
        s->prevVariant = -1;                                                                                                               \
    }

void CreateBossRunManager(u8 bossIndex)
{
    struct Task *t = TaskCreate(Task_BossRunManagerMain, sizeof(BossRunManager), 0x4000, 0, TaskDestructor_BossRunManager);
    BossRunManager *manager = TASK_DATA(t);
    manager->bossIndex = bossIndex;
    manager->unk5 = 0;
    manager->unk6 = 0;
    manager->unk0 = gBossCameraYClamps[manager->bossIndex][0];
    manager->unk2 = gBossCameraYClamps[manager->bossIndex][1];

    gBossCameraClampYLower = gBossCameraYClamps[manager->bossIndex][0];
    gBossCameraClampYUpper = gBossCameraYClamps[manager->bossIndex][1];

    if (bossIndex != 0) {
        s32 x, y;
        Cheese *cheese;
        Player_DisableInputAndBossTimer();

        gPlayer.qSpeedGround = Q(5);

        // ???
        x = gUnknown_080D87E6[bossIndex - 1][0] - I(gPlayer.qWorldX);
        y = gUnknown_080D87E6[bossIndex][1] - I(gPlayer.qWorldY);
        gPlayer.qWorldX += Q(x);
        gPlayer.qWorldY += Q(y);

        gCamera.x += x - 120;
        gCamera.y += y - 120;

        gCamera.unk20 += x - 120;
        gCamera.unk24 += y - 120;
        gCamera.unk10 += x - 120;
        gCamera.unk14 += y - 120;

        cheese = gCheese;
        if (cheese != NULL) {
            cheese->posX += Q(x);
            cheese->posY += Q(y);
        }
        manager->bossIndex--;
    }

#if TAS_TESTING
    printf("Got to boss run\n");
    exit(0);
#endif
}

static void Task_BossRunManagerMain(void)
{
    BossRunManager *manager = TASK_DATA(gCurTask);
#ifndef NON_MATCHING
    register s32 r5 asm("r5");
    register s32 r1 asm("r1");
    register s32 r0 asm("r0");
    register s32 r6 asm("r6");
#else
    s32 r5, r1, r0, r6;
#endif
    s32 r4;

    if (manager->bossIndex <= 6) {
        if (manager->bossIndex == 6) {
            gBossCameraClampYLower = gBossCameraYClamps[7][0];
            gBossCameraClampYUpper = gBossCameraYClamps[7][1];
            if (gPlayer.qWorldX < Q(42960) && gPlayer.qWorldX > Q(gUnknown_080D8808[6][0] + 30)) {
                gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
                gPlayer.qSpeedGround = Q(5);
                gPlayer.frameInput = 0;
                gPlayer.heldInput = 0;
                gPlayer.rotation = 0;
                if (I(gPlayer.qWorldX) - 120 != gCamera.x) {
                    if (I(gPlayer.qWorldX) - 120 > gCamera.x) {
                        gCamera.unk20++;
                        gCamera.x++;
                        gCamera.unk10++;
                    } else {
                        gCamera.unk20--;
                        gCamera.x--;
                        gCamera.unk10--;
                    }
                }
            } else if (gPlayer.qWorldX < Q(42700) && gPlayer.qWorldX > Q(gUnknown_080D8808[6][0] + 20)) {
                if (gActiveBossTask == NULL && !(gStageFlags & STAGE_FLAG__100)) {
                    gPlayer.checkpointTime = gCourseTime;
                    CreateZoneBoss(7);
                    gStageFlags &= ~STAGE_FLAG__2;
                }
            } else {
                r5 = gPlayer.qWorldX;
                if (r5 > Q(42960)) {
                    gPlayer.moveState &= ~MOVESTATE_GOAL_REACHED;
                    gPlayer.qSpeedGround = 0;
                    gPlayer.transition = 1;
                    manager->bossIndex++;
                    manager->unk6 = 1;
                } else if (gActiveBossTask != NULL && r5 < Q(42300)) {
                    r1 = gUnknown_080D8808[manager->bossIndex][0];
                    if (r1 >= 0) {
                        r0 = Q(r1);
                        if (r5 >= r0) {
                            r4 = gUnknown_080D8808[manager->bossIndex][1];
                            r6 = Q(r4);
                            r0 = r5 + r6;
                            gPlayer.qWorldX = r0;
                            gUnknown_030054FC = r6;
                            sub_8039F50(r6, manager->bossIndex);
                            gBossRingsShallRespawn = 1;
                            gCamera.x += r4;
                            gCamera.unk20 += r4;
                            gCamera.unk10 += r4;
                            if (gCheese != NULL) {
                                gCheese->posX += r6;
                            }
                        }
                    }
                }
            }
        } else if (manager->bossIndex <= 5) {
            if (gCamera.unk10 > sBossRunCameraYTriggers[manager->bossIndex]) {
                gBossRingsShallRespawn = 1;
                gBossRingsRespawnCount = 10;
                gPlayer.checkpointTime = gCourseTime;
                CreateZoneBoss(++manager->bossIndex);
                gStageFlags &= ~STAGE_FLAG__2;
            }

            if (gUnknown_080D8808[manager->bossIndex][0] >= 0 && gActiveBossTask != NULL
                && gPlayer.qWorldX >= Q(gUnknown_080D8808[manager->bossIndex][0])) {
                r4 = gUnknown_080D8808[manager->bossIndex][1];
                r5 = Q(r4);
                gPlayer.qWorldX += r5;
                gUnknown_030054FC = r5;
                sub_8039F50(r5, manager->bossIndex);
                gBossRingsShallRespawn = 1;
                gCamera.x += r4;
                gCamera.unk20 += r4;
                gCamera.unk10 += r4;
                if (gCheese != NULL) {
                    gCheese->posX += r5;
                }
            }
        }
    }

    if (manager->unk5 < 7 && gCamera.unk10 > sBossRunCameraYTriggers[manager->unk5] - 600) {
        if (manager->unk5 == 6) {
            if (manager->unk6 == 0) {
                gCamera.unkC = 1;
                gCamera.unk8 = 1280;
            }
            gUnknown_030054B0 = 1;
        } else {
            manager->unk5++;
        }
    }

    if (manager->unk0 != gBossCameraYClamps[manager->unk5][0]) {
        if (manager->unk0 < gBossCameraYClamps[manager->unk5][0]) {
            manager->unk0++;
        } else {
            manager->unk0--;
        }
    }

    if (manager->unk2 != gBossCameraYClamps[manager->unk5][1]) {
        if (manager->unk2 < gBossCameraYClamps[manager->unk5][1]) {
            manager->unk2++;
        } else {
            manager->unk2--;
        }
    }

    gBossCameraClampYLower = manager->unk0;
    gBossCameraClampYUpper = manager->unk2;
}

static void TaskDestructor_BossRunManager(struct Task *t) { }

static void CreateSuperEggRoboZTowers(void *vram, SuperEggRoboZ *boss)
{
    u8 i, j;
    struct Task *t = TaskCreate(Task_SuperEggRoboZTowersMain, sizeof(SuperEggRoboZTowers), 0x4080, 0, TaskDestructor_SuperEggRoboZTowers);
    SuperEggRoboZTowers *towers = TASK_DATA(t);
    void *vrams[2];
    Sprite *s;

    towers->unk15D = 0;
    towers->vram = vram;
    towers->boss = boss;
    towers->unk15E = 0;
    towers->unk15F = 0;
    vrams[0] = VramMalloc(47);
    vrams[1] = vrams[0] + (15 * TILE_SIZE_4BPP);

    for (i = 0; i < NUM_TOWERS; i++) {
        towers->positions[i].x = Q(gUnknown_080D8840[i][0]);
        towers->positions[i].y = Q(gUnknown_080D8840[i][1]);
        towers->offsets[i].x = 0;
        towers->offsets[i].y = 0;
        towers->unk154[i] = (i + 2) * 300;
        towers->unk15A[i] = 0;

        for (j = 0; j < 2; j++) {
            s = &towers->sprites[i][j];
            s->x = 80;
            s->y = 80;
            s->graphics.dest = vrams[j];
            SPRITE_INIT_WITHOUT_VRAM(s, sTowerPiecesTileInfo[j].anim, sTowerPiecesTileInfo[j].variant, 28, 1, 0);
            UpdateSpriteAnimation(s);
        }
    }
}

static void Task_SuperEggRoboZTowersMain(void)
{
    u8 i;
    SuperEggRoboZTowers *towers = TASK_DATA(gCurTask);
    if (gActiveBossTask == NULL) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < NUM_TOWERS; i++) {
        sTowerStateCallbacks[towers->unk15A[i]](towers, i);
    }

    if (I(gPlayer.qWorldY) < 133) {
        Coll_DamagePlayer(&gPlayer);
    }

    if (towers->unk15F == 0 && towers->boss->livesCockpit == 0) {
        towers->unk15F = 1;
    }
}

static void sub_8049F1C(SuperEggRoboZTowers *towers, u8 towerIndex)
{
    Sprite *prop = &towers->sprites[towerIndex][0];
    Sprite *platform = &towers->sprites[towerIndex][1];

    s32 preY = -towers->offsets[towerIndex].y;

    Vec2_32 pos;
#ifndef NON_MATCHING
    register u8 *unk15F asm("r6") = &towers->unk15F;
#else
    u8 *unk15F = &towers->unk15F;
#endif
    if (*unk15F == 0) {
        towers->offsets[towerIndex].y = 0;
    }

    preY += towers->offsets[towerIndex].y;

    pos.x = I(towers->positions[towerIndex].x + towers->offsets[towerIndex].x);
    pos.y = I(towers->positions[towerIndex].y + towers->offsets[towerIndex].y);

    prop->x = pos.x - gCamera.x;
    prop->y = pos.y - gCamera.y;

    if (*unk15F == 0) {

        if (--towers->unk154[towerIndex] == 0) {
            towers->unk154[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][1];
            towers->unk15A[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == prop) {
        gPlayer.qWorldY += Q(1);
        gPlayer.qWorldY += preY;
        if (towers->unk15E == 1) {
            gPlayer.qWorldX += Q(1);
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        u32 result = Coll_Player_Platform(prop, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.qWorldY += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(prop);
    platform->x = prop->x;
    platform->y = prop->y + 64;

    DisplaySprite(platform);
}

static void sub_804A070(SuperEggRoboZTowers *towers, u8 towerIndex)
{
    Sprite *s = &towers->sprites[towerIndex][0];
    Sprite *s2 = &towers->sprites[towerIndex][1];

    Vec2_32 pos;

    if (towers->unk15F == 0) {
        towers->offsets[towerIndex].y = -Q(8);
    }

    pos.x = I(towers->positions[towerIndex].x + towers->offsets[towerIndex].x);
    pos.y = I(towers->positions[towerIndex].y + towers->offsets[towerIndex].y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        s32 result = Coll_Player_Entity_HitboxN(s, pos.x, pos.y, 0, &gPlayer, 0);
        if (result != 0) {
            gPlayer.qWorldY -= Q(8);
            gPlayer.qSpeedAirY = -Q(3.5);
            gPlayer.charState = CHARSTATE_HIT_AIR;
            gPlayer.transition = PLTRANS_PT6;
        }
    }

    if (towers->unk15F == 0) {
        m4aSongNumStart(SE_264);
        if (--towers->unk154[towerIndex] == 0) {
            towers->unk154[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][1];
            towers->unk15A[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][0];
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 64;

    DisplaySprite(s2);
}
static void sub_804A1C0(SuperEggRoboZTowers *towers, u8 towerIndex)
{
    u8 j;
    Sprite *s = &towers->sprites[towerIndex][0];
    Sprite *s2 = &towers->sprites[towerIndex][1];

    s32 preY = -towers->offsets[towerIndex].y;
    s32 yOffset;

    ExplosionPartsInfo info;

    Vec2_32 pos;
    if (towers->unk15F == 0) {
        towers->offsets[towerIndex].y = -Q(8);
    }

    preY += towers->offsets[towerIndex].y;

    yOffset = 16;
    pos.x = I(towers->positions[towerIndex].x + towers->offsets[towerIndex].x);
    pos.y = I(towers->positions[towerIndex].y + towers->offsets[towerIndex].y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (towers->unk15F == 0) {
        if (towers->unk154[towerIndex] == 60 || towers->unk154[towerIndex] == 50) {
            for (j = 0; j < 8; j++) {
                s16 sin = j * 32;
                sin = SIN(sin);
                info.spawnX = ((sin * 5) >> 0xB) + pos.x - 20;
                info.rotation = 768;
                info.spawnY = pos.y - yOffset;
                info.velocity = Q(0.1875);

                info.speed = Q(1);

                info.vram = towers->vram;
                info.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_CLOUD;
                info.variant = 0;
                info.unk4 = 0;
                CreateBossParticleStatic(&info, &towers->unk15D);
            }
        }

        if (--towers->unk154[towerIndex] == 0) {
            towers->unk154[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][1];
            towers->unk15A[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        gPlayer.qWorldY += preY + Q(1);

        if (towers->unk15E == 1) {
            gPlayer.qWorldX += Q(1);
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        u32 result = Coll_Player_Platform(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.qWorldY += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 64;

    DisplaySprite(s2);
}

static void sub_804A398(SuperEggRoboZTowers *towers, u8 towerIndex)
{
    Sprite *s = &towers->sprites[towerIndex][0];
    Sprite *s2 = &towers->sprites[towerIndex][1];

    Vec2_32 pos;

    s32 preY = -towers->offsets[towerIndex].y;

    if (towers->unk15F == 0) {
        towers->offsets[towerIndex].y -= ((COS(towers->unk154[towerIndex] * 2) * 3) >> 7);
    }
    preY += towers->offsets[towerIndex].y;

    pos.x = I(towers->positions[towerIndex].x + towers->offsets[towerIndex].x);
    pos.y = I(towers->positions[towerIndex].y + towers->offsets[towerIndex].y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (towers->unk15F == 0) {
        if (--towers->unk154[towerIndex] == 0) {
            towers->unk154[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][1];
            towers->unk15A[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        gPlayer.qWorldY += preY + Q(1);

        if (towers->unk15E == 1) {
            gPlayer.qWorldX += Q(1);
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        u32 result = Coll_Player_Platform(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.qWorldY += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 64;
    DisplaySprite(s2);
    s2->y = s->y + 128;
    DisplaySprite(s2);
    s2->y = s->y + 192;
    DisplaySprite(s2);
}

static void sub_804A53C(SuperEggRoboZTowers *towers, u8 towerIndex)
{
    Sprite *s = &towers->sprites[towerIndex][0];
    Sprite *s2 = &towers->sprites[towerIndex][1];

    Vec2_32 pos;

    s32 preY = -towers->offsets[towerIndex].y;

    if (towers->unk15F == 0) {
        towers->offsets[towerIndex].y += Q(1);
    }
    preY += towers->offsets[towerIndex].y;

    pos.x = I(towers->positions[towerIndex].x + towers->offsets[towerIndex].x);
    pos.y = I(towers->positions[towerIndex].y + towers->offsets[towerIndex].y);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (towers->unk15F == 0) {
        if (--towers->unk154[towerIndex] == 0) {
            towers->unk154[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][1];
            towers->unk15A[towerIndex] = gUnknown_080D8858[towers->unk15A[towerIndex]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s) {
        gPlayer.qWorldY += preY + Q(2);

        if (towers->unk15E == 1) {
            gPlayer.qWorldX += Q(1);
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_IA_OVERRIDE)) {
        u32 result = Coll_Player_Platform(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.qWorldY += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 64;
    DisplaySprite(s2);
    s2->y = s->y + 128;
    DisplaySprite(s2);
    s2->y = s->y + 192;
    DisplaySprite(s2);
}

static void TaskDestructor_SuperEggRoboZTowers(struct Task *t)
{
    SuperEggRoboZTowers *towers = TASK_DATA(t);
    VramFree(towers->sprites[0]->graphics.dest);
}

void CreateSuperEggRoboZ(void)
{
    struct Task *t;
    SuperEggRoboZ *boss;
    ScreenFade *fade;
    Sprite *s;
    Background *body;
    u8 arm;

    gBgCntRegs[0] = (BGCNT_TXT512x512 | BGCNT_SCREENBASE(20) | BGCNT_CHARBASE(3) | BGCNT_PRIORITY(2));
    gBgCntRegs[2] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(31) | BGCNT_CHARBASE(0) | BGCNT_PRIORITY(1));
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0][0] = 0;
    gUnknown_03002280[0][1] = 0;
    gUnknown_03002280[0][2] = 0xFF;
    gUnknown_03002280[0][3] = 0x40;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;
    gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
    gPlayerLimbsPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerLimbsPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

    t = TaskCreate(Task_SuperEggRoboZMain, sizeof(SuperEggRoboZ), 0x4000, 0, TaskDestructor_SuperEggRoboZMain);
    gActiveBossTask = t;
    boss = TASK_DATA(t);
    fade = &boss->fade;

    if (gDifficultyLevel != DIFFICULTY_NORMAL) {
        boss->livesCockpit = 6;
        boss->livesArms[ARM_LEFT] = 4;
        boss->livesArms[ARM_RIGHT] = 4;
    } else {
        boss->livesCockpit = 8;
        boss->livesArms[ARM_LEFT] = 6;
        boss->livesArms[ARM_RIGHT] = 6;
    }

    boss->qPos.x = Q(42876);
    boss->qPos.y = Q(370);
    boss->unkE = 360;
    boss->unk10 = 512;
    boss->unkB = 0;
    boss->unkC = 0;
    boss->unk14 = 30;
    boss->tilesCloud = VramMalloc(32);
    CreateSuperEggRoboZTowers(boss->tilesCloud, boss);

    for (arm = 0; arm < ARM_COUNT; arm++) {
        boss->rotation[arm] = (SIN_PERIOD / 2);
        boss->rotation2[arm] = (SIN_PERIOD / 2);
        boss->qUnk18[arm].x = Q(0.0);
        boss->qUnk18[arm].y = Q(0.0);
        boss->unk3C[arm] = 0;
        boss->unk30[arm] = arm * 360 + 360;
        boss->unk3E[arm] = Q(0.0);
        boss->unk40[arm] = Q(0.0);
        boss->unk42[arm] = Q(0.0);
        boss->qUnk34[arm][0] = Q(0.0);
        boss->qUnk34[arm][1] = Q(0.0);

        s = &boss->bsArms[arm].s;
        s->x = 0;
        s->y = 0;

        if (arm != 0) {
            s->graphics.dest = VramMalloc(8 * 8);
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;
            s->variant = 0;
        } else {
            s->graphics.dest = VramMalloc(8 * 8);
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;
            s->variant = 0;
        }

        s->oamFlags = SPRITE_OAM_ORDER(27 + (arm * 4));
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
    }

    fade->window = 0;
    fade->brightness = 0;
    fade->flags = SCREEN_FADE_FLAG_2;
    fade->speed = 0;
    fade->bldCnt = ((BLDCNT_TGT2_ALL & ~BLDCNT_TGT2_BG3) | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
    fade->bldAlpha = 0;

    body = &boss->body;
    body->graphics.dest = (void *)BG_CHAR_ADDR(3);
    body->graphics.anim = 0;
    body->layoutVram = (void *)BG_SCREEN_ADDR(20);
    body->unk18 = 0;
    body->unk1A = 0;
    body->tilemapId = TM_REGULAR_FINAL_BOSS;
    body->unk1E = 0;
    body->unk20 = 0;
    body->unk22 = 0;
    body->unk24 = 0;
    body->targetTilesX = 30;
    body->targetTilesY = 20;
    body->paletteOffset = 0;
    body->flags = 0;
    DrawBackground(body);

    s = &boss->bsHead.s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(8 * 8);
    s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(31);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 3);
    gMusicManagerState.fadeoutSpeed = 200;
    gStageFlags |= STAGE_FLAG__DISABLE_PAUSE_MENU;
}

static void Task_804A9D8(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);

    if (boss->unk14 > 60) {
        boss->qPos.y -= Q(1.0);

        if ((gStageTime % 32u) == 0) {
            m4aSongNumStart(SE_260);
        }

        if ((gStageTime % 8u) == 0) {
            CreateScreenShake(0x100, 0x10, 0x80, 0x14, (SCREENSHAKE_VERTICAL | 0x3));
        }

        if (Mod(boss->unk14, 30) == 0) {
            s8 v;
            gPlayer.moveState = 0;
            v = ((boss->unk14 - 60) / 30) - 2;

            if (v > 3) {
                v = 3;
            }

            if (v >= 0 && v <= 3) {
                gPlayer.charState = CHARSTATE_CUTSCENE_LOOK_UP_FRAME_3 - v;
                gPlayer.prevCharState = CHARSTATE_INVALID;
            }
        }
    }

    boss->unkB = 1;
    sub_804C3AC(boss);

    gPlayer.moveState |= (MOVESTATE_IGNORE_INPUT | MOVESTATE_IA_OVERRIDE);

    if (--boss->unk14 == 0) {
        gStageFlags &= ~STAGE_FLAG__DISABLE_PAUSE_MENU;
        gPlayer.moveState &= ~(MOVESTATE_IGNORE_INPUT | MOVESTATE_IA_OVERRIDE);

        m4aSongNumStart(SE_260);

        gMusicManagerState.unk0 = 0;
        gMusicManagerState.unk1 = 0x12;
        gCamera.minX = 42820;
        boss->unkB = 0;
        gPlayer.moveState &= ~(MOVESTATE_IGNORE_INPUT);

        gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        gPlayerLimbsPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        gPlayerLimbsPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);
        gCurTask->main = Task_804AB24;
    }
}

// (99.89%) https://decomp.me/scratch/kiah8
void Task_804AB24(void)
{
    s32 speed;
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    ScreenFade *fade = &boss->fade;
    Player *p;

    sub_804CC98(boss);
    sub_804CA08(boss);
    sub_804AE40(boss);

    sArmFuncs[boss->unk3C[ARM_LEFT]](boss, ARM_LEFT);
    sArmFuncs[boss->unk3C[ARM_RIGHT]](boss, ARM_RIGHT);

    sub_804C5B8(boss);
    sub_804C830(boss);
    sub_804CA70(boss);

    // TODO: maybe these are macros or inline functions?
    p = &gPlayer;
    if ((I(p->qWorldY) > 184) && (I(p->qWorldX) >= 43034)) {
        Coll_DamagePlayer(p);
        // These are just hacks to make the read use the right register
        // if we use c it uses r2 on some of these
#ifndef NON_MATCHING
        asm("mov r1, %2\n"
            "ldrsh %0, [%1, r1]"
            : "=r"(speed)
            : "r"(p), "I"(offsetof(Player, qSpeedAirX)));
#else
        speed = p->qSpeedAirX;
#endif
        if (speed > 0) {
            speed = -speed;
            p->qSpeedAirX = speed;
        }

#ifndef NON_MATCHING
        asm("mov r1, %2\n"
            "ldrsh %0, [%1, r1]"
            : "=r"(speed)
            : "r"(p), "I"(offsetof(Player, qSpeedGround)));
#else
        speed = p->qSpeedGround;
#endif
        if (speed > 0) {
            p->qSpeedGround = -speed;
        }
    }
    // _0804ABC0

    p = &gPlayer;
    if (I(p->qWorldX) >= 43088) {
        Coll_DamagePlayer(p);
#ifndef NON_MATCHING
        asm("mov r1, %2\n"
            "ldrsh %0, [%1, r1]"
            : "=r"(speed)
            : "r"(p), "I"(offsetof(Player, qSpeedAirX)));
#else
        speed = p->qSpeedAirX;
#endif
        if (speed > 0) {
            p->qSpeedAirX = -speed;
        }

#ifndef NON_MATCHING
        asm("mov r1, %2\n"
            "ldrsh %0, [%1, r1]"
            : "=r"(speed)
            : "r"(p), "I"(offsetof(Player, qSpeedGround)));
#else
        speed = p->qSpeedGround;
#endif
        if (speed > 0) {
            p->qSpeedGround = -speed;
        }
    }

    // _0804ABF2

    if (boss->livesCockpit == 0) {
        u8 arm;
        // _0804ABF2

        gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        gCurTask->main = Task_804AD68;
        boss->unk14 = 0xFF;

        Player_DisableInputAndBossTimer_FinalBoss();

        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.heldInput = 0;
        gPlayer.frameInput = 0;

        if (gPlayer.moveState & (MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR)) {
            gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
            gPlayer.qSpeedAirX = -Q(2);
            gPlayer.qSpeedAirY = -Q(0);
            gPlayer.transition = PLTRANS_UNCURL;
        } else {
            // _0804AC68
            gPlayer.qSpeedGround = Q(0);
            gPlayer.qSpeedAirX = Q(0);
            gPlayer.qSpeedAirY = Q(0);
        }
        // _0804AC6E

        fade->window = 0;
        fade->brightness = 0;
        fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
        fade->speed = 16;
        fade->bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        fade->bldAlpha = 0;

        for (arm = 0; arm < ARM_COUNT; arm++) {
            Sprite *sprArm;
            u16 anim;
            // _0804ACB2
            boss->qUnk18[arm].x += (COS(boss->rotation[arm]) * 15) >> 6;
            boss->qUnk18[arm].y += (SIN(boss->rotation[arm]) * 15) >> 6;

            boss->qUnk34[arm][0] = -Q(1.5);
            boss->qUnk34[arm][1] = -Q(3);

            boss->unk3C[arm] = 7;
            boss->unk30[arm] = 60;

            SWITCH_ARM_VARIANT(boss, arm, 2);
        }
    }
}

static void Task_804AD68(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&boss->fade) == SCREEN_FADE_COMPLETE) {
        TasksDestroyInPriorityRange(0x5010, 0x5011);
        TasksDestroyInPriorityRange(0x5431, 0x5434);

        gStageFlags |= STAGE_FLAG__TURN_OFF_HUD;

        gPlayer.moveState |= MOVESTATE_100000;
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
        gCurTask->main = Task_ShowResultsAndDelete;
    } else {
        sub_804CC98(boss);
        sub_804CA08(boss);

        sArmFuncs[boss->unk3C[ARM_LEFT]](boss, ARM_LEFT);
        sArmFuncs[boss->unk3C[ARM_RIGHT]](boss, ARM_RIGHT);

        sub_804C5B8(boss);
        sub_804CA70(boss);
        sub_804C080(boss);
    }
}

void sub_804AE40(SuperEggRoboZ *boss)
{
    Sprite *s;

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        if (boss->unkE == 0) {
            gBldRegs.bldY = 0;
            boss->fade.brightness = 0;
            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        }
        boss->unkE = 2;
    }

    if (boss->unkE > 0) {
        if (--boss->unkE == 0) {
            boss->unk12 = 120;
        }
    } else {
        // _0804AEA0

        if (boss->unkB > 0) {
            if (boss->unk12 > 0) {
                boss->unk12 = 120;

                boss->fade.brightness = Q(32);
                UpdateScreenFade(&boss->fade);
            }
            // _0804AEC2

            gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;
        } else {
            // _0804AED4
            if (--boss->unk12 == 0) {
                u32 livesCockpit;
                gFlags &= ~FLAGS_EXECUTE_HBLANK_COPY;

                boss->fade.brightness = Q(32);
                UpdateScreenFade(&boss->fade);

                livesCockpit = boss->livesCockpit;
                boss->unkE = (livesCockpit <= 4) ? 140 : 360;

                s = &boss->bsHead.s;
                s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
                s->variant = 0;
                s->prevVariant = -1;
            } else {
                // _0804AF34
                s32 r6;
                s32 r8;

                r8 = I(boss->qPos.x + Q(190));
                r8 += ((COS(boss->unk10) * 11) >> 14);
                r8 -= gCamera.x;

                r6 = I(boss->qPos.y + Q(40));
                r6 += ((SIN(boss->unk10) * 11) >> 14);
                r6 -= gCamera.y;

                if (boss->unk12 > 90) {
                    s32 val;
                    s32 rand;
                    InitHBlankBgOffsets(0);

                    sub_80075D0(0, 0, 160, r8, r6, ({
                                    rand = PseudoRandom32();
                                    I(SIN(((boss->unk12 - 90) * 8) % 256u))
                                    +(rand % 8u);
                                }));

                    boss->fade.brightness = (boss->unk12 - 90) * 273;
                    UpdateScreenFade(&boss->fade);
                } else {
                    s16 r4;

                    if (boss->unk12 == 90) {
                        // _0804B008+4
                        s = &boss->bsHead.s;
                        s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
                        s->variant = 1;
                        s->prevVariant = -1;
                        m4aSongNumStart(SE_261);
                    }
                    // _0804B02A

                    if (boss->unk12 < 70) {
                        s32 rand = (PseudoRandom32());
                        r4 = (boss->unk12 >> 1) + ((rand % 8u) + 8);

                        if (boss->unk12 > 60) {
                            sub_804CCD0(boss, Q(r4 - 10));
                        }
                    } else {
                        // _0804B074
                        s32 rand = PseudoRandom32();
                        r4 = ((116 - boss->unk12) >> 2) + ((rand % 8u) + 30);
                    }
                    // _0804B096
#ifndef NON_MATCHING
                    // Only needed because because r4 is loaded in the wrong order
                    // in the original rom
                    // (99.59%) https://decomp.me/scratch/IzRyM
                    asm("ldrh r0, [%3, #0x10]\n\t"
                        "mov r1, %0\n\t"
                        "lsl r3, r1, #0x10\n\t"
                        "asr r3, r3, #0x10\n\t"
                        "add r1, %1, #1\n\t"
                        "lsl r1, r1, #0x10\n\t"
                        "asr r1, r1, #0x10\n\t"
                        "str r1, [sp]\n\t"
                        "mov r1, #0x20\n\t"
                        "str r1, [sp, #4]\n\t"
                        "add r1, %2, #0\n\t"
                        "mov r2, #6\n\t"
                        "bl sub_802E784"
                        :
                        : "r"(r8), "r"(r6), "r"(r4), "r"(boss));
#else
                    sub_802E784(boss->unk10, r4, 6, r8, r6 + 1, 32);
#endif

                    boss->fade.brightness = Q(32) - (boss->unk12 * 91);
                    UpdateScreenFade(&boss->fade);
                }
            }
        }
    }
}

static u8 sub_804B0EC(SuperEggRoboZ *boss, u8 arm)
{
    u8 result = 0;
    s32 sp04, ip;
    s32 r3;
    s32 r4;
    s32 r5;
    s32 r6;
    s32 r7;

#if !NON_MATCHING
    register s32 sl asm("sl");
#else
    s32 sl;
#endif

    if (boss->unk3E[arm] > 0) {
        return result;
    }

    sp04 = boss->qPos.x + boss->qUnk18[arm].x;
    sl = gUnknown_080D8888[arm][0];
    r5 = sp04 + sl;

    ip = boss->qPos.y + boss->qUnk18[arm].y;
    r7 = gUnknown_080D8888[arm][1];
    r4 = ip + r7;

    r6 = COS(boss->rotation[arm]);
    r5 += (r6 * 190) >> 9;

    r3 = SIN(boss->rotation[arm]);
    r4 += (r3 * 190) >> 9;

    r5 = (gPlayer.qWorldX - r5) >> 8;
    r4 = (gPlayer.qWorldY - r4) >> 8;

    r5 = SQUARE(r5);
    r4 = SQUARE(r4);

    if ((r5 + r4) < 200) {
        Coll_DamagePlayer(&gPlayer);

        boss->unk40[arm] = 1;

        if (boss->unk3C[arm] == 3) {
            m4aSongNumStart(SE_263);
        }

        return result;
    } else {
        s32 r0, r1;
        Sprite *s = &gPlayer.spriteInfoBody->s;

        r5 = sp04 + sl;
        r4 = ip + r7;

        r1 = ((r6 * 95) >> 9);
        r0 = ((r3 * 95) >> 9);
        r6 = r5 + r1;
        r7 = r4 + r0;

        if (gSelectedCharacter != CHARACTER_SONIC) {
            Player_UpdateHomingPosition(r6, r7);
        }

        if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            r5 = I(gPlayer.qWorldX - r6);
            r4 = I(gPlayer.qWorldY - r7);

            r5 = SQUARE(r5);
            r4 = SQUARE(r4);
            if ((r5 + r4) < 376) {
                s32 speed;
                result = sub_804C9B4(boss, arm);

                speed = -gPlayer.qSpeedAirX;
                gPlayer.qSpeedAirX = speed;

                speed = -gPlayer.qSpeedAirY;
                gPlayer.qSpeedAirY = speed;

                speed = -gPlayer.qSpeedGround;
                gPlayer.qSpeedGround = speed;

                return result;
            }
        }

        if ((gCheese != NULL) && HITBOX_IS_ACTIVE(gCheese->reserved)) {
            r6 -= gCheese->posX;
            r6 = (r6) >> 8;
            r7 -= gCheese->posY;
            r7 = (r7) >> 8;

            if ((SQUARE(r6) + SQUARE(r7)) < 376) {
                result = sub_804C9B4(boss, arm);

                gCheeseTarget.task->unk15 = 0;
            }
        }
    }

    return result;
}

bool8 sub_804B2EC(SuperEggRoboZ *boss, u8 arm)
{
    u8 result = 0;
    s32 x, y;
    s32 r6, r0;
    Sprite *s;

    if (boss->unk3E[arm] > 0) {
        return result;
    }

    s = &gPlayer.spriteInfoBody->s;

#ifndef NON_MATCHING
    // unused lines required for match
    // maybe they had a calculation here they just forgot about
    r0 = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
    r6 = boss->qPos.x + boss->qUnk18[arm].x;
    r0 = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];
#endif

    x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
    y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

    if (gSelectedCharacter != CHARACTER_SONIC) {
        Player_UpdateHomingPosition(x, y);
    }

    if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
        r6 = I(gPlayer.qWorldX - x);
        r0 = I(gPlayer.qWorldY - y);

        r6 = SQUARE(r6);
        r0 = SQUARE(r0);
        if ((r6 + r0) < 376) {
            s32 speed;
            result = sub_804C9B4(boss, arm);

            speed = -gPlayer.qSpeedAirX;
            gPlayer.qSpeedAirX = speed;

            speed = -gPlayer.qSpeedAirY;
            gPlayer.qSpeedAirY = speed;

            speed = -gPlayer.qSpeedGround;
            gPlayer.qSpeedGround = speed;

            return result;
        }
    }

    if ((gCheese != NULL) && HITBOX_IS_ACTIVE(gCheese->reserved)) {
        x -= gCheese->posX;
        x = (x) >> 8;
        y -= gCheese->posY;
        y = (y) >> 8;

        if ((SQUARE(x) + SQUARE(y)) < 376) {
            result = sub_804C9B4(boss, arm);

            gCheeseTarget.task->unk15 = 0;
        }
    }

    return result;
}

static void sub_804B43C(SuperEggRoboZ *boss, u8 arm)
{
    boss->qUnk18[arm].x = 0;
    boss->qUnk18[arm].y = 0;

    if (boss->unk30[arm] == 300) {
        SWITCH_ARM_VARIANT(boss, arm, 0);
    }

    if (--boss->unk30[arm] == 0) {
        boss->unk3C[arm] = 1;
        boss->unk30[arm] = 180;
        boss->unk40[arm] = 0;
    }

    if (sub_804B0EC(boss, arm) != 0) {
        boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 15) >> 6);
        boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 15) >> 6);

        boss->qUnk34[arm][0] = -Q(1.5);
        boss->qUnk34[arm][1] = -Q(3.0);
        boss->unk3C[arm] = 7;
        boss->unk30[arm] = 60;

        SWITCH_ARM_VARIANT(boss, arm, 2);
    }
}

static void sub_804B594(SuperEggRoboZ *boss, u8 arm)
{
    u16 angle;
    Vec2_32 pos;

    boss->qUnk18[arm].x = 0;
    boss->qUnk18[arm].y = 0;

    // TODO: Seems like these were set through a macro?
    //       boss->qUnk18[arm][n] were just set to 0 after all
    pos.x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
    pos.y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

    angle = sub_8004418(I(gPlayer.qWorldY - pos.y), I(gPlayer.qWorldX - pos.x));

    if (angle != boss->rotation[arm]) {
        if (angle < boss->rotation[arm]) {
            boss->rotation[arm]--;
        } else {
            boss->rotation[arm]++;
        }
    }

    if (--boss->unk30[arm] == 0) {
        SWITCH_ARM_VARIANT(boss, arm, 1);
        boss->unk3C[arm] = 2;
        boss->unk30[arm] = 30;
    }

    if (sub_804B0EC(boss, arm) != 0) {
        boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 15) >> 6);
        boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 15) >> 6);

        boss->qUnk34[arm][0] = -Q(1.5);
        boss->qUnk34[arm][1] = -Q(3.0);
        boss->unk3C[arm] = 7;
        boss->unk30[arm] = 60;

        SWITCH_ARM_VARIANT(boss, arm, 2);
    }
}

static void sub_804B734(SuperEggRoboZ *boss, u8 arm)
{
    ExplosionPartsInfo info;
    s32 speed0;
    s32 x, y;
    u8 i, j;

    boss->qUnk18[arm].x = 0;
    boss->qUnk18[arm].y = 0;

    if (--boss->unk30[arm] == 0) {
        x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
        y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

        for (i = 0; i < 3; i++) {
            for (j = 0; j < 3; j++) {
                s32 index;

                index = (boss->rotation[arm] - (SIN_PERIOD / 4));
                info.spawnX = I(x) - ((COS(index & ONE_CYCLE) * (i - 1)) >> 11);
                index = (boss->rotation[arm] - (SIN_PERIOD / 4));
                info.spawnY = I(y) - ((SIN(index & ONE_CYCLE) * (i - 1)) >> 11);

                info.velocity = 0;
                info.rotation = (boss->rotation[arm] + (SIN_PERIOD / 2)) & ONE_CYCLE;
                speed0 = (Q(2) + (j * Q(0.5)));

                if ((1 - i) >= 0) {
                    s32 speedI = ((1 - i) * 3);
                    info.speed = speed0 - (speedI * Q(0.125));
                } else {
                    s32 speedI = ((i - 1) * 3);
                    info.speed = speed0 - (speedI * Q(0.125));
                }

                info.vram = boss->tilesCloud;
                info.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_CLOUD;
                info.variant = 0;
                info.unk4 = 0;

                CreateBossParticleStatic(&info, &boss->unkC);
            }
        }

        boss->unk3C[arm] = 3;
        boss->unk30[arm] = 10;
        m4aSongNumStart(SE_262);
    }

    if (sub_804B0EC(boss, arm) != 0) {
        boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 15) >> 6);
        boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 15) >> 6);

        boss->qUnk34[arm][0] = -Q(1.5);
        boss->qUnk34[arm][1] = -Q(3.0);
        boss->unk3C[arm] = 7;
        boss->unk30[arm] = 60;

        SWITCH_ARM_VARIANT(boss, arm, 2);
    }
}

static void sub_804B984(SuperEggRoboZ *boss, u8 arm)
{
    boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 5) >> 5);
    boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 5) >> 5);

    if (--boss->unk30[arm] == 0) {
        boss->unk3C[arm] = 6;
        boss->unk30[arm] = 30;
    }

    if (sub_804B0EC(boss, arm) != 0) {
        boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 15) >> 6);
        boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 15) >> 6);

        boss->qUnk34[arm][0] = -Q(1.5);
        boss->qUnk34[arm][1] = -Q(3.0);
        boss->unk3C[arm] = 7;
        boss->unk30[arm] = 60;

        SWITCH_ARM_VARIANT(boss, arm, 2);
    }
}

static void sub_804BAC0(SuperEggRoboZ *boss, u8 arm)
{
    if (--boss->unk30[arm] == 0) {
        boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 15) >> 6);
        boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 15) >> 6);

        if (boss->unk40[arm] != 0) {
            boss->rotation2[arm] = boss->rotation[arm];
            boss->unk3C[arm] = 4;
            boss->unk30[arm] = 50;
        } else {
            boss->unk3C[arm] = 5;
            boss->unk30[arm] = 160;
        }

        SWITCH_ARM_VARIANT(boss, arm, 2);
    } else {
        if (sub_804B0EC(boss, arm) != 0) {
            boss->qUnk18[arm].x += ((COS(boss->rotation[arm]) * 15) >> 6);
            boss->qUnk18[arm].y += ((SIN(boss->rotation[arm]) * 15) >> 6);

            boss->qUnk34[arm][0] = -Q(1.5);
            boss->qUnk34[arm][1] = -Q(3.0);
            boss->unk3C[arm] = 7;
            boss->unk30[arm] = 60;

            SWITCH_ARM_VARIANT(boss, arm, 2);
        }
    }
}

void sub_804BC44(SuperEggRoboZ *boss, u8 arm)
{
    ExplosionPartsInfo info;
    s32 x, y;
    u8 i, j;

    boss->qUnk18[arm].x -= ((COS(boss->rotation2[arm]) * 31) >> 10);
    boss->qUnk18[arm].y -= ((SIN(boss->rotation2[arm]) * 31) >> 10);

    boss->rotation[arm] = (boss->rotation[arm] + boss->unk30[arm] * 4) & ONE_CYCLE;

    if (--boss->unk30[arm] == 0) {
        x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
        y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

        x -= ((COS(boss->rotation2[arm]) * 15) >> 6);
        y -= ((SIN(boss->rotation2[arm]) * 15) >> 6);

        for (i = 0; i < 3; i++) {
            for (j = 0; j < 3; j++) {
                info.spawnX = I(x) - ((COS((boss->rotation2[arm] - (SIN_PERIOD / 4)) & ONE_CYCLE) * (i - 1)) >> 11);
                info.spawnY = I(y) - ((SIN((boss->rotation2[arm] - (SIN_PERIOD / 4)) & ONE_CYCLE) * (i - 1)) >> 11);
                info.velocity = 0;
                info.rotation = (boss->rotation2[arm] + 576 - ((i * 2) + i + j) * (32)) & ONE_CYCLE;
                info.speed = (Q(2) + (j * Q(0.5))) - ((ABS(1 - i) * 3) * Q(0.125));
                info.vram = boss->tilesCloud;
                info.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_CLOUD;
                info.variant = 0;
                info.unk4 = 0;

                CreateBossParticleStatic(&info, &boss->unkC);
            }
        }

        boss->rotation[arm] = boss->rotation2[arm];
        boss->unk3C[arm] = 0;
        boss->unk30[arm] = 300;
    }
}

static void sub_804BE6C(SuperEggRoboZ *boss, u8 arm)
{
    ExplosionPartsInfo info;
    s32 qX, qY;
    u8 i, j;

    boss->qUnk18[arm].x -= ((COS(boss->rotation[arm]) * 5) >> 9);
    boss->qUnk18[arm].y -= ((SIN(boss->rotation[arm]) * 5) >> 9);

    if (--boss->unk30[arm] == 0) {
        qX = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
        qY = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

        qX -= ((COS(boss->rotation[arm]) * 15) >> 6);
        qY -= ((SIN(boss->rotation[arm]) * 15) >> 6);

        for (i = 0; i < 3; i++) {
            for (j = 0; j < 3; j++) {
                s32 index;
                index = COS((boss->rotation[arm] - (SIN_PERIOD / 4)) & ONE_CYCLE);
                info.spawnX = I(qX) - ((index * (i - 1)) >> 11);
                index = SIN((boss->rotation[arm] - (SIN_PERIOD / 4)) & ONE_CYCLE);
                info.spawnY = I(qY) - ((index * (i - 1)) >> 11);

                info.velocity = Q(18. / 256.);
                info.rotation = (boss->rotation[arm] + (SIN_PERIOD / 2)) & ONE_CYCLE;

                {
                    s32 speed;
                    speed = ((j * Q(0.375)) + Q(0.5));
                    info.speed = ((1 - i) >= 0) ? speed - ((1 - i) * Q(0.125)) : speed - ((i - 1) * Q(0.125));
                }

                info.vram = boss->tilesCloud;
                info.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_CLOUD;
                info.variant = 0;
                info.unk4 = 0;

                CreateBossParticleStatic(&info, &boss->unkC);
            }
        }

        boss->unk3C[arm] = 0;
        boss->unk30[arm] = 300;
    } else if (sub_804B2EC(boss, arm)) {
        boss->qUnk34[arm][0] = -Q(1.5);
        boss->qUnk34[arm][1] = -Q(3.0);
        boss->unk3C[arm] = 7;
        boss->unk30[arm] = 60;
    }
}

static void sub_804C080(SuperEggRoboZ *boss)
{
    ExplosionPartsInfo info;

    if ((gStageTime & 0x7) == 0) {
        s32 rand = PseudoRandom32();
        info.spawnX = gCamera.x + (rand & 0xFF);
        info.spawnY = gCamera.y + (PseudoRandom32() & 0xFF);
        info.velocity = Q(18. / 256.);
        info.rotation = (PseudoRandBetween(0, SIN_PERIOD));
        // '= rand =' needed for matching
        info.speed = rand = (PseudoRandBetween(Q(2), Q(4)));
        info.vram = (OBJ_VRAM0 + 0x2980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 0;

        CreateBossParticleStatic(&info, &boss->unkC);
        m4aSongNumStart(SE_EXPLOSION);
        m4aMPlayImmInit(&gMPlayInfo_SE3);
    }

    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, boss->unk14);

    if ((boss->unk14 > 0) && (gStageTime & 0x1)) {
        --boss->unk14;
    }

    if (((gStageTime + 3) & 0x7) == 0) {
        s32 rand;
        u8 r4 = PseudoRandom32();
        r4 &= 0xF;
        r4 -= Div(r4, 6) * 6;

        rand = PseudoRandom32();
        info.spawnX = gCamera.x + (rand & 0xFF);
        info.spawnY = gCamera.y + (PseudoRandom32() & 0xFF);
        info.velocity = Q(0.125);
        info.rotation = (PseudoRandom32() & ONE_CYCLE);
        info.speed = Q(2);

        info.vram = (OBJ_VRAM0 + (gTileInfoBossScrews[r4][0] * TILE_SIZE_4BPP));
        info.anim = gTileInfoBossScrews[r4][1];
        info.variant = gTileInfoBossScrews[r4][2];
        info.unk4 = 0;
        CreateBossParticleStatic(&info, &boss->unkC);
    }
}

void sub_804C240(SuperEggRoboZ *boss, u8 arm)
{
    ExplosionPartsInfo info;
    s32 chance;

    if (boss->unk42[arm] != 0) {
        return;
    }

    if (I(boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1]) > 300) {
        boss->unk42[arm] = 1;
        return;
    }

    chance = 0x1F;
    boss->rotation[arm] = (boss->rotation[arm] + 800) & ONE_CYCLE;
    boss->qUnk34[arm][1] += Q(0.125);
    boss->qUnk18[arm].x += boss->qUnk34[arm][0];
    boss->qUnk18[arm].y += boss->qUnk34[arm][1];

    if ((gStageTime & 0x3) == 0) {
        s32 x, y;
#ifndef NON_MATCHING
        s32 one = 1;
#endif

        x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
        y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];
        info.spawnX = I(x);
        info.spawnY = I(y);
        info.velocity = 0;
        info.rotation = sub_8004418(-(boss->qUnk34[arm][1] >> 3), -(boss->qUnk34[arm][0] >> 3));

        info.rotation = ({ ((PseudoRandom32() & chance) + info.rotation) - 0x10; })
#ifndef NON_MATCHING
            & (SIN_PERIOD - one);
#else
            & ONE_CYCLE;
#endif
        info.speed = SIN_24_8((gStageTime * 16) & ONE_CYCLE) + Q(3);
        info.vram = (OBJ_VRAM0 + 0x2980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 0;
        CreateBossParticleStatic(&info, &boss->unkC);
    }
}

static void sub_804C3AC(SuperEggRoboZ *boss)
{
    Sprite *s;
    SpriteTransform *tf;
    u8 i;

    Vec2_32 sp00;
    Vec2_32 sp08;

    sp08.x = Q(PseudoRandBetween(-3, 5));
    sp08.y = Q(PseudoRandBetween(-3, 5));

    gBgScrollRegs[0][0] = gCamera.x - I(boss->qPos.x + sp08.x);
    gBgScrollRegs[0][1] = gCamera.y - I(boss->qPos.y + sp08.y);

    sp00.x = I(boss->qPos.x + Q(190)) - gCamera.x;

    if ((sp00.x + 50) > 330u) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
    }

    s = &boss->bsHead.s;
    tf = &boss->bsHead.transform;

    sp00.x = boss->qPos.x + sp08.x + Q(190);
    sp00.y = boss->qPos.y + sp08.y + Q(40);

    s->x = I(sp00.x) - gCamera.x;
    s->y = I(sp00.y) - gCamera.y;

    s->frameFlags
        = (gUnknown_030054B8++ | (SPRITE_FLAG(PRIORITY, 3) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

    tf->rotation = boss->unk10;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = s->x;
    tf->y = s->y;

    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    for (i = 0; i < ARM_COUNT; i++) {
        s = &boss->bsArms[i].s;
        tf = &boss->bsArms[i].transform;

        sp00.x = boss->qPos.x + sp08.x + boss->qUnk18[i].x + gUnknown_080D8888[i][0];
        sp00.y = boss->qPos.y + sp08.y + boss->qUnk18[i].y + gUnknown_080D8888[i][1];

        s->x = I(sp00.x) - gCamera.x;
        s->y = I(sp00.y) - gCamera.y;

        s->frameFlags = (gUnknown_030054B8++
                         | (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

        tf->rotation = boss->rotation[i];
        tf->qScaleX = Q(1);
        tf->qScaleY = Q(1);
        tf->x = s->x;
        tf->y = s->y;

        UpdateSpriteAnimation(s);
        TransformSprite(s, tf);
        DisplaySprite(s);
    }
}

static void sub_804C5B8(SuperEggRoboZ *boss)
{
    Sprite *s;
    SpriteTransform *tf;
    u8 r3;
    u8 i;

    Vec2_32 sp00;
    Vec2_32 sp08;

    if (boss->unkB > 0) {
        if (boss->unkB < 32) {
            sp08.x = Q(PseudoRandBetween(-3, 5));
            sp08.y = Q(PseudoRandBetween(-3, 5));
        } else {
            sp08.x = Q(PseudoRandBetween(-7, 9));
            sp08.y = Q(PseudoRandBetween(-7, 9));
        }
    } else {
        sp08.x = 0;
        sp08.y = 0;
    }

    gBgScrollRegs[0][0] = gCamera.x - I(boss->qPos.x + sp08.x);
    gBgScrollRegs[0][1] = gCamera.y - I(boss->qPos.y + sp08.y);

    sp00.x = I(boss->qPos.x + Q(190)) - gCamera.x;

    if ((sp00.x + 50) > 330u) {
        gDispCnt &= ~DISPCNT_BG0_ON;
    } else {
        gDispCnt |= DISPCNT_BG0_ON;
    }

    s = &boss->bsHead.s;
    tf = &boss->bsHead.transform;

    if (boss->unkB < 32) {
        r3 = boss->unkB >> 3;
    } else {
        r3 = (64 - boss->unkB) >> 3;
    }

    sp00.x = boss->qPos.x + sp08.x + Q(190);
    sp00.y = boss->qPos.y + sp08.y + Q(40);

    s->x = I(sp00.x) - gCamera.x;
    s->y = I(sp00.y) - gCamera.y + r3;

    s->frameFlags
        = (gUnknown_030054B8++ | (SPRITE_FLAG(PRIORITY, 3) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

    tf->rotation = boss->unk10;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = s->x;
    tf->y = s->y;

    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    for (i = 0; i < ARM_COUNT; i++) {
        if (boss->unk42[i] != 0) {
            continue;
        }

        s = &boss->bsArms[i].s;
        tf = &boss->bsArms[i].transform;

        sp00.x = boss->qPos.x + sp08.x + boss->qUnk18[i].x + gUnknown_080D8888[i][0];
        sp00.y = boss->qPos.y + sp08.y + boss->qUnk18[i].y + gUnknown_080D8888[i][1];

        s->x = I(sp00.x) - gCamera.x;
        s->y = I(sp00.y) - gCamera.y;

        s->frameFlags = (gUnknown_030054B8++
                         | (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

        tf->rotation = boss->rotation[i];
        tf->qScaleX = Q(1);
        tf->qScaleY = Q(1);
        tf->x = s->x;
        tf->y = s->y;

        UpdateSpriteAnimation(s);
        TransformSprite(s, tf);
        DisplaySprite(s);
    }
}

static void sub_804C830(SuperEggRoboZ *boss)
{
    Sprite *s;
    Player *p;
    Vec2_32 headPos;
#ifdef BUG_FIX
    // Define headPos before the if, so that
    // Player_UpdateHomingPosition doesn't receive garbage values.
    headPos.x = I(boss->qPos.x + Q(190));
    headPos.y = I(boss->qPos.y + Q(40));
    if (boss->unkB == 0) {
#else
    if (boss->unkB == 0) {
        headPos.x = I(boss->qPos.x + Q(190));
        headPos.y = I(boss->qPos.y + Q(40));
#endif

        s = &boss->bsHead.s;
        p = &gPlayer;
        if (Coll_Cheese_Enemy_Attack(s, headPos.x, headPos.y, 0, p) == TRUE) {
            Boss8_HitCockpit(boss);
            return;
        } else if (Coll_Player_Boss_Attack(s, headPos.x, headPos.y, 0, p) == TRUE) {
            Boss8_HitCockpit(boss);

            {
                s32 speed = p->qSpeedAirX;
                if (speed > 0) {
                    p->qSpeedAirX = -ABS(speed);
                }
            }
        } else if (Coll_Player_Enemy(s, headPos.x, headPos.y, 0, p) == TRUE) {
            s32 speed = p->qSpeedAirX;
            if (speed > 0) {
                p->qSpeedAirX = -speed;
            }
        }
    }

    if (gSelectedCharacter != CHARACTER_SONIC) {
        Player_UpdateHomingPosition(Q(headPos.x), Q(headPos.y));
    }
}

static void Boss8_HitCockpit(SuperEggRoboZ *boss)
{
    Sprite *s = &boss->bsHead.s;

    if ((--boss->livesCockpit & 0xFF) & 0x1) {
        m4aSongNumStart(SE_143);
    } else {
        m4aSongNumStart(SE_235);
    }

    if (boss->livesCockpit == 3) {
        gMusicManagerState.unk1 = 0x10 | 0x3;
    }

    if (boss->livesCockpit == 0) {
        INCREMENT_SCORE_A(1000)
        // Stops the music?
        gMusicManagerState.unk1 = 0x10 | 0x20;
    }

    boss->unkB = 64;

    s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
    s->variant = 2;
    s->prevVariant = -1;
}

static bool8 sub_804C9B4(SuperEggRoboZ *boss, u8 arm)
{
    if (boss->livesArms[arm] > 0) {
        if ((--boss->livesArms[arm] & 0xFF) & 0x1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->unk3E[arm] = 64;
    }

    return (boss->livesArms[arm] == 0) ? 1 : 0;
}

static void sub_804CA08(SuperEggRoboZ *boss)
{
    if ((boss->unkB != 0) && (--boss->unkB == 0)) {
        Sprite *s = &boss->bsHead.s;
        if (boss->livesCockpit > 0) {
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
            s->variant = 0;
        } else {
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
            s->variant = 3;
        }
        s->prevVariant = -1;
    }

    if (boss->unk3E[0] > 0) {
        boss->unk3E[0]--;
    }

    if (boss->unk3E[1] > 0) {
        boss->unk3E[1]--;
    }
}

static void sub_804CA70(SuperEggRoboZ *boss)
{
    s32 pal = (gStageTime & 0x2) >> 1;
    u8 i;

    if (boss->unkB != 0) {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[8 * 16 + i] = sArmPalettes[pal][i];
        }
    } else {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[8 * 16 + i] = sArmPalettes[0][i];
        }
    }

    if (boss->unk3E[0] > 0) {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[9 * 16 + i] = sArmPalettes[pal][i];
        }
    } else {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[9 * 16 + i] = sArmPalettes[0][i];
        }
    }

    if (boss->unk3E[1] > 0) {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[12 * 16 + i] = sArmPalettes[pal][i];
        }
    } else {
        for (i = 0; i < ARRAY_COUNT(sArmPalettes[0]); i++) {
            gObjPalette[12 * 16 + i] = sArmPalettes[0][i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

static void Task_SuperEggRoboZMain(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    sub_804C5B8(boss);

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    if ((gPlayer.qSpeedGround == 0) && (--boss->unk14 == 0)) {
        boss->unk14 = 300;
        gCurTask->main = Task_804A9D8;
        m4aSongNumStart(SE_260);
        gPlayer.charState = CHARSTATE_IDLE;
        gPlayer.transition = PLTRANS_TOUCH_GROUND;
    }
}

static void Task_ShowResultsAndDelete(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    boss->fade.brightness = Q(32);
    UpdateScreenFade(&boss->fade);

    CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
    m4aSongNumStop(SE_EXPLOSION);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, 0xFF);
    TaskDestroy(gCurTask);
}

static void sub_804CC98(SuperEggRoboZ *boss)
{
    u32 unkB = boss->unkB;

    if (unkB != 0) {
        s32 sin = SIN(unkB * 8);
        s32 val = (sin >> 7);
        boss->unk10 = (val + (SIN_PERIOD / 2)) & ONE_CYCLE;
    } else {
        boss->unk10 = (SIN_PERIOD / 2);
    }
}

static void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1)
{
    Vec2_32 pos = { boss->qPos.x + Q(190), boss->qPos.y + Q(40) };

    if ((I(gPlayer.qWorldY) < pos.x) && (gPlayer.qWorldY >= (pos.y - qP1)) && (gPlayer.qWorldY <= (qP1 + pos.y))) {
        Coll_DamagePlayer(&gPlayer);
    }
}

static void TaskDestructor_SuperEggRoboZMain(struct Task *t)
{
    SuperEggRoboZ *boss = TASK_DATA(t);
    VramFree(boss->tilesCloud);

    VramFree(boss->bsArms[0].s.graphics.dest);
    VramFree(boss->bsArms[1].s.graphics.dest);
    VramFree(boss->bsHead.s.graphics.dest);

    gActiveBossTask = NULL;
}
