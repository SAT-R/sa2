#include "global.h"
#include "core.h"
#include "flags.h"
#include "task.h"
#include "trig.h"
#include "bg_triangles.h"
#include "malloc_vram.h"
#include "gba/defines.h"
#include "gba/io_reg.h"
#include "lib/m4a.h"
#include "sakit/globals.h"
#include "sakit/camera.h"
#include "sakit/collision.h"
#include "sakit/player.h"
#include "game/bosses/common.h"
#include "game/player_callbacks.h" // UpdateHomingPosition
#include "game/cheese.h"
#include "game/stage/player.h"
#include "game/stage/results.h"
#include "game/stage/boss_results_transition.h"
#include "game/stage/game_7.h"
#include "game/stage/screen_fade.h"
#include "game/stage/screen_shake.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/tilemaps.h"

#define BOSS_8_ARM_LEFT  0
#define BOSS_8_ARM_RIGHT 1
#define BOSS_8_ARM_COUNT 2

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
} BossSprite;

typedef struct {
    /*  0x00 */ Vec2_32 qPos;
    /*  0x08 */ u8 livesCockpit;
    /*  0x09 */ u8 livesArms[BOSS_8_ARM_COUNT];
    /*  0x0B */ u8 unkB;
    /*  0x0C */ u8 unkC;
    /*  0x0E */ u16 unkE;
    /*  0x10 */ u16 unk10; // rotationHead ?
    /*  0x12 */ u8 unk12;
    /*  0x14 */ u32 unk14;
    /*  0x18 */ Vec2_32 qUnk18[BOSS_8_ARM_COUNT];
    /*  0x28 */ u16 rotation[BOSS_8_ARM_COUNT];
    /*  0x2C */ u16 rotation2[BOSS_8_ARM_COUNT];
    /*  0x30 */ u16 unk30[BOSS_8_ARM_COUNT];
    /*  0x34 */ s16 qUnk34[BOSS_8_ARM_COUNT][2];
    /*  0x3C */ u8 unk3C[BOSS_8_ARM_COUNT];
    /*  0x3E */ u8 unk3E[BOSS_8_ARM_COUNT];
    /*  0x40 */ u8 unk40[BOSS_8_ARM_COUNT];
    /*  0x42 */ u8 unk42[BOSS_8_ARM_COUNT];
    /*  0x44 */ void *tilesCloud;
    /*  0x48 */ ScreenFade fade;
    /*  0x54 */ BossSprite bsHead;
    /*  0x90 */ BossSprite bsArms[BOSS_8_ARM_COUNT];
    /* 0x108 */ Background body;
} SuperEggRoboZ; /* size: 0x148 */

typedef struct {
    Sprite unk0[3][2];
    s32 unk120;
    s32 unk124[3][2];
    s32 unk13C[3][2];
    u16 unk154[3];
    u8 unk15A[3];
    u8 unk15D;
    u8 unk15E;
    u8 unk15F;
    SuperEggRoboZ *unk160;
} UNK_8049D20; /* 0x164 */

typedef void (*EggRoboFn)(SuperEggRoboZ *boss, u8 arm);
typedef void (*UNK_8049D20Callback)(UNK_8049D20 *, u8);

void Task_SuperEggRoboZMain(void);
void TaskDestructor_SuperEggRoboZMain(struct Task *);

void Task_804AB24(void);
void Task_804AD68(void);
u8 sub_804B0EC(SuperEggRoboZ *boss, u8 arm);
void sub_804B43C(SuperEggRoboZ *boss, u8 p1);
void sub_804B594(SuperEggRoboZ *boss, u8 p1);
void sub_804B734(SuperEggRoboZ *boss, u8 p1);
void sub_804B984(SuperEggRoboZ *boss, u8 p1);
void sub_804BAC0(SuperEggRoboZ *boss, u8 p1);
void sub_804BC44(SuperEggRoboZ *boss, u8 p1);
void sub_804BE6C(SuperEggRoboZ *boss, u8 p1);
void sub_804C080(SuperEggRoboZ *boss);
void sub_804C240(SuperEggRoboZ *boss, u8 p1);
void sub_804C3AC(SuperEggRoboZ *boss);
void sub_804C5B8(SuperEggRoboZ *boss);
void sub_804C830(SuperEggRoboZ *boss);
void sub_804CA08(SuperEggRoboZ *boss);
void sub_804CA70(SuperEggRoboZ *boss);
void Task_ShowResultsAndDelete(void);
void sub_804CC98(SuperEggRoboZ *boss);
void sub_804AE40(SuperEggRoboZ *boss);
void Boss8_HitCockpit(SuperEggRoboZ *boss);
void sub_804C8F4(SuperEggRoboZ *boss);
void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1);
bool8 sub_804C9B4(SuperEggRoboZ *boss, u8 param1);
void sub_8049E90(void);
void sub_804A6B4(struct Task *);

extern const UNK_8049D20Callback gUnknown_080D8874[];
extern const s32 gUnknown_080D8840[][2];
extern const TileInfo gUnknown_080D8864[];
extern const u8 gUnknown_080D8858[][2];

// const u16 gUnknown_080D87D8[] = {
//     6400, 13888, 18016, 23104, 29152, 38080, 43091,
// };

const u16 gUnknown_080D8888[2][2] = { { Q(188), Q(110) }, { Q(162), Q(110) } };
const EggRoboFn gUnknown_080D8890[8]
    = { sub_804B43C, sub_804B594, sub_804B734, sub_804B984,
        sub_804BC44, sub_804BE6C, sub_804BAC0, sub_804C240 };

const u16 sArmPalettes[2][16] = {
    INCBIN_U16("graphics/boss_8_a.gbapal"),
    INCBIN_U16("graphics/boss_8_b.gbapal"),
};

#define SWITCH_ARM_VARIANT(boss, arm, vNum)                                             \
    {                                                                                   \
        Sprite *s = &boss->bsArms[arm].s;                                               \
                                                                                        \
        if (arm != BOSS_8_ARM_LEFT) {                                                   \
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;                     \
            s->variant = vNum;                                                          \
        } else {                                                                        \
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;                      \
            s->variant = vNum;                                                          \
        }                                                                               \
        s->prevVariant = -1;                                                            \
    }

void sub_8049D20(void *vram, SuperEggRoboZ *boss)
{
    u8 i, j;
    void *vrams[2];
    struct Task *t = TaskCreate(sub_8049E90, 0x164, 0x4080, 0, sub_804A6B4);
    UNK_8049D20 *unkD20 = TASK_DATA(t);
    Sprite *s;

    unkD20->unk15D = 0;
    unkD20->unk120 = (s32)vram;
    unkD20->unk160 = boss;
    unkD20->unk15E = 0;
    unkD20->unk15F = 0;
    vrams[0] = VramMalloc(47);
    vrams[1] = vrams[0] + 0x1E0;

    for (i = 0; i < 3; i++) {
        unkD20->unk124[i][0] = Q(gUnknown_080D8840[i][0]);
        unkD20->unk124[i][1] = Q(gUnknown_080D8840[i][1]);
        unkD20->unk13C[i][0] = 0;
        unkD20->unk13C[i][1] = 0;
        unkD20->unk154[i] = (i + 2) * 300;
        unkD20->unk15A[i] = 0;
        for (j = 0; j < 2; j++) {
            s = &unkD20->unk0[i][j];
            s->x = 80;
            s->y = 80;
            s->graphics.dest = vrams[j];
            SPRITE_INIT_WITHOUT_VRAM(s, gUnknown_080D8864[j].anim,
                                     gUnknown_080D8864[j].variant, 28, 1, 0);
            UpdateSpriteAnimation(s);
        }
    }
}

void sub_8049E90(void)
{
    u8 i;
    UNK_8049D20 *unkD20 = TASK_DATA(gCurTask);
    if (gActiveBossTask == NULL) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < 3; i++) {
        gUnknown_080D8874[unkD20->unk15A[i]](unkD20, i);
    }

    if (I(gPlayer.y) < 133) {
        sub_800CBA4(&gPlayer);
    }

    if (unkD20->unk15F == 0 && unkD20->unk160->livesCockpit == 0) {
        unkD20->unk15F = 1;
    }
}

void sub_8049F1C(UNK_8049D20 *unkD20, u8 i)
{
    Sprite *s = &unkD20->unk0[i][0];
    Sprite *s2 = &unkD20->unk0[i][1];

    s32 preY = -unkD20->unk13C[i][1];

    Vec2_32 pos;
#ifndef NON_MATCHING
    register u8 *unk15F asm("r6") = &unkD20->unk15F;
#else
    u8 *unk15F = &unkD20->unk15F;
#endif
    if (*unk15F == 0) {
        unkD20->unk13C[i][1] = 0;
    }

    preY += unkD20->unk13C[i][1];

    pos.x = I(unkD20->unk124[i][0] + unkD20->unk13C[i][0]);
    pos.y = I(unkD20->unk124[i][1] + unkD20->unk13C[i][1]);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (*unk15F == 0) {

        if (--unkD20->unk154[i] == 0) {
            unkD20->unk154[i] = gUnknown_080D8858[unkD20->unk15A[i]][1];
            unkD20->unk15A[i] = gUnknown_080D8858[unkD20->unk15A[i]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
        gPlayer.y += Q(1);
        gPlayer.y += preY;
        if (unkD20->unk15E == 1) {
            gPlayer.x += Q(1);
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_400000)) {
        u32 result = sub_800CCB8(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.y += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 0x40;

    DisplaySprite(s2);
}

void sub_804A070(UNK_8049D20 *unkD20, u8 i)
{
    Sprite *s = &unkD20->unk0[i][0];
    Sprite *s2 = &unkD20->unk0[i][1];

    Vec2_32 pos;

    if (unkD20->unk15F == 0) {
        unkD20->unk13C[i][1] = -2048;
    }

    pos.x = I(unkD20->unk124[i][0] + unkD20->unk13C[i][0]);
    pos.y = I(unkD20->unk124[i][1] + unkD20->unk13C[i][1]);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (!(gPlayer.moveState & MOVESTATE_400000)) {
        s32 result = sub_800C204(s, pos.x, pos.y, 0, &gPlayer, 0);
        if (result != 0) {
            gPlayer.y -= 0x800;
            gPlayer.speedAirY = -896;
            gPlayer.unk64 = 0x14;
            gPlayer.transition = PLTRANS_PT6;
        }
    }

    if (unkD20->unk15F == 0) {
        m4aSongNumStart(SE_264);
        if (--unkD20->unk154[i] == 0) {
            unkD20->unk154[i] = gUnknown_080D8858[unkD20->unk15A[i]][1];
            unkD20->unk15A[i] = gUnknown_080D8858[unkD20->unk15A[i]][0];
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 0x40;

    DisplaySprite(s2);
}
void sub_804A1C0(UNK_8049D20 *unkD20, u8 i)
{
    u8 j;
    Sprite *s = &unkD20->unk0[i][0];
    Sprite *s2 = &unkD20->unk0[i][1];

    s32 preY = -unkD20->unk13C[i][1];
    s32 yOffset;

    ExplosionPartsInfo info;

    Vec2_32 pos;
    if (unkD20->unk15F == 0) {
        unkD20->unk13C[i][1] = -2048;
    }

    preY += unkD20->unk13C[i][1];

    yOffset = 16;
    pos.x = I(unkD20->unk124[i][0] + unkD20->unk13C[i][0]);
    pos.y = I(unkD20->unk124[i][1] + unkD20->unk13C[i][1]);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (unkD20->unk15F == 0) {
        if (unkD20->unk154[i] == 60 || unkD20->unk154[i] == 0x32) {
            for (j = 0; j < 8; j++) {
                s16 sin = j * 32;
                sin = SIN(sin);
                info.spawnX = ((sin * 5) >> 0xB) + pos.x - 20;
                info.rotation = 768;
                info.spawnY = pos.y - yOffset;
                info.velocity = Q(0.1875);

                info.speed = Q(1);

                info.vram = (void *)unkD20->unk120;
                info.anim = 707;
                info.variant = 0;
                info.unk4 = 0;
                CreateBossParticleStatic(&info, &unkD20->unk15D);
            }
        }

        if (--unkD20->unk154[i] == 0) {
            unkD20->unk154[i] = gUnknown_080D8858[unkD20->unk15A[i]][1];
            unkD20->unk15A[i] = gUnknown_080D8858[unkD20->unk15A[i]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
        gPlayer.y += preY + 0x100;

        if (unkD20->unk15E == 1) {
            gPlayer.x += 0x100;
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_400000)) {
        u32 result = sub_800CCB8(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.y += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 0x40;

    DisplaySprite(s2);
}

void sub_804A398(UNK_8049D20 *unkD20, u8 i)
{
    Sprite *s = &unkD20->unk0[i][0];
    Sprite *s2 = &unkD20->unk0[i][1];

    Vec2_32 pos;

    s32 preY = -unkD20->unk13C[i][1];

    if (unkD20->unk15F == 0) {
        unkD20->unk13C[i][1] -= ((COS(unkD20->unk154[i] * 2) * 3) >> 7);
    }
    preY += unkD20->unk13C[i][1];

    pos.x = I(unkD20->unk124[i][0] + unkD20->unk13C[i][0]);
    pos.y = I(unkD20->unk124[i][1] + unkD20->unk13C[i][1]);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (unkD20->unk15F == 0) {
        if (--unkD20->unk154[i] == 0) {
            unkD20->unk154[i] = gUnknown_080D8858[unkD20->unk15A[i]][1];
            unkD20->unk15A[i] = gUnknown_080D8858[unkD20->unk15A[i]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
        gPlayer.y += preY + 0x100;

        if (unkD20->unk15E == 1) {
            gPlayer.x += 0x100;
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_400000)) {
        u32 result = sub_800CCB8(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.y += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 0x40;
    DisplaySprite(s2);
    s2->y = s->y + 0x80;
    DisplaySprite(s2);
    s2->y = s->y + 0xC0;
    DisplaySprite(s2);
}

void sub_804A53C(UNK_8049D20 *unkD20, u8 i)
{
    Sprite *s = &unkD20->unk0[i][0];
    Sprite *s2 = &unkD20->unk0[i][1];

    Vec2_32 pos;

    s32 preY = -unkD20->unk13C[i][1];

    if (unkD20->unk15F == 0) {
        unkD20->unk13C[i][1] += 0x100;
    }
    preY += unkD20->unk13C[i][1];

    pos.x = I(unkD20->unk124[i][0] + unkD20->unk13C[i][0]);
    pos.y = I(unkD20->unk124[i][1] + unkD20->unk13C[i][1]);

    s->x = pos.x - gCamera.x;
    s->y = pos.y - gCamera.y;

    if (unkD20->unk15F == 0) {
        if (--unkD20->unk154[i] == 0) {
            unkD20->unk154[i] = gUnknown_080D8858[unkD20->unk15A[i]][1];
            unkD20->unk15A[i] = gUnknown_080D8858[unkD20->unk15A[i]][0];
        }
    }

    if (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s) {
        gPlayer.y += preY + 0x200;

        if (unkD20->unk15E == 1) {
            gPlayer.x += 0x100;
        }
    }

    if (!(gPlayer.moveState & MOVESTATE_400000)) {
        u32 result = sub_800CCB8(s, pos.x, pos.y, &gPlayer);

        if (result & 0x10000) {
            gPlayer.y += Q(result << 0x10) >> 0x10;
        }
    }

    DisplaySprite(s);
    s2->x = s->x;
    s2->y = s->y + 0x40;
    DisplaySprite(s2);
    s2->y = s->y + 0x80;
    DisplaySprite(s2);
    s2->y = s->y + 0xC0;
    DisplaySprite(s2);
}

void sub_804A6B4(struct Task *t)
{
    UNK_8049D20 *unkD20 = TASK_DATA(t);
    VramFree(unkD20->unk0[0]->graphics.dest);
}

void CreateSuperEggRoboZ(void)
{
    struct Task *t;
    SuperEggRoboZ *boss;
    ScreenFade *fade;
    Sprite *s;
    Background *body;
    u8 arm;

    gBgCntRegs[0] = (BGCNT_TXT512x512 | BGCNT_SCREENBASE(20) | BGCNT_CHARBASE(3)
                     | BGCNT_PRIORITY(2));
    gBgCntRegs[2] = (BGCNT_TXT256x256 | BGCNT_SCREENBASE(31) | BGCNT_CHARBASE(0)
                     | BGCNT_PRIORITY(1));
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
    gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
    gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    t = TaskCreate(Task_SuperEggRoboZMain, sizeof(SuperEggRoboZ), 0x4000, 0,
                   TaskDestructor_SuperEggRoboZMain);
    gActiveBossTask = t;
    boss = TASK_DATA(t);
    fade = &boss->fade;

    if (gDifficultyLevel != DIFFICULTY_NORMAL) {
        boss->livesCockpit = 6;
        boss->livesArms[BOSS_8_ARM_LEFT] = 4;
        boss->livesArms[BOSS_8_ARM_RIGHT] = 4;
    } else {
        boss->livesCockpit = 8;
        boss->livesArms[BOSS_8_ARM_LEFT] = 6;
        boss->livesArms[BOSS_8_ARM_RIGHT] = 6;
    }

    boss->qPos.x = Q(42876);
    boss->qPos.y = Q(370);
    boss->unkE = 360;
    boss->unk10 = 512;
    boss->unkB = 0;
    boss->unkC = 0;
    boss->unk14 = 30;
    boss->tilesCloud = VramMalloc(32);
    sub_8049D20(boss->tilesCloud, boss);

    for (arm = 0; arm < BOSS_8_ARM_COUNT; arm++) {
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

        s->unk1A = SPRITE_OAM_ORDER(27 + (arm * 4));
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
    }

    fade->window = 0;
    fade->brightness = 0;
    fade->flags = SCREEN_FADE_FLAG_2;
    fade->speed = 0;
    fade->bldCnt = ((BLDCNT_TGT2_ALL & ~BLDCNT_TGT2_BG3) | BLDCNT_EFFECT_LIGHTEN
                    | BLDCNT_TGT1_ALL);
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
    s->unk1A = SPRITE_OAM_ORDER(31);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 3);
    gUnknown_030054A8.unk6 = 200;
    gStageFlags |= EXTRA_STATE__DISABLE_PAUSE_MENU;
}

void Task_804A9D8(void)
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
                gPlayer.unk64 = 70 - v;
                gPlayer.unk66 = -1;
            }
        }
    }

    boss->unkB = 1;
    sub_804C3AC(boss);

    gPlayer.moveState |= (MOVESTATE_IGNORE_INPUT | MOVESTATE_400000);

    if (--boss->unk14 == 0) {
        gStageFlags &= ~EXTRA_STATE__DISABLE_PAUSE_MENU;
        gPlayer.moveState &= ~(MOVESTATE_IGNORE_INPUT | MOVESTATE_400000);

        m4aSongNumStart(SE_260);

        gUnknown_030054A8.unk0 = 0;
        gUnknown_030054A8.unk1 = 18;
        gCamera.minX = 42820;
        boss->unkB = 0;
        gPlayer.moveState &= ~(MOVESTATE_IGNORE_INPUT);

        gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
        gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);
        gCurTask->main = Task_804AB24;
    }
}

// (99.89%) https://decomp.me/scratch/kiah8
NONMATCH("asm/non_matching/game/bosses/boss_8__Task_804AB24.inc",
         void Task_804AB24(void))
{
    s32 speed;
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    ScreenFade *fade = &boss->fade;

    sub_804CC98(boss);
    sub_804CA08(boss);
    sub_804AE40(boss);

    gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_LEFT]](boss, BOSS_8_ARM_LEFT);
    gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_RIGHT]](boss, BOSS_8_ARM_RIGHT);

    sub_804C5B8(boss);
    sub_804C830(boss);
    sub_804CA70(boss);

    if ((I(gPlayer.y) > 184) && (I(gPlayer.x) >= 43034)) {
        sub_800CBA4(&gPlayer);

        speed = gPlayer.speedAirX;
        if (speed > 0) {
            gPlayer.speedAirX = -speed;
        }

        speed = gPlayer.speedGroundX;
        if (speed > 0) {
            gPlayer.speedGroundX = -speed;
        }
    }
    // _0804ABC0

    if (I(gPlayer.x) >= 43088) {
        sub_800CBA4(&gPlayer);

        speed = gPlayer.speedAirX;
        if (speed > 0) {
            gPlayer.speedAirX = -speed;
        }

        speed = gPlayer.speedGroundX;
        if (speed > 0) {
            gPlayer.speedGroundX = -speed;
        }
    }
    // _0804ABF2

    if (boss->livesCockpit == 0) {
        u8 arm;
        // _0804ABF2

        gFlags &= ~FLAGS_4;
        gCurTask->main = Task_804AD68;
        boss->unk14 = 0xFF;

        Player_DisableInputAndBossTimer_FinalBoss();

        gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
        gPlayer.unk5C = 0;
        gPlayer.unk5E = 0;

        if (gPlayer.moveState & (MOVESTATE_8 | MOVESTATE_IN_AIR)) {
            gPlayer.unk64 = 50;
            gPlayer.speedAirX = -Q(2);
            gPlayer.speedAirY = -Q(0);
            gPlayer.transition = PLTRANS_PT5;
        } else {
            // _0804AC68
            gPlayer.speedGroundX = Q(0);
            gPlayer.speedAirX = Q(0);
            gPlayer.speedAirY = Q(0);
        }
        // _0804AC6E

        fade->window = 0;
        fade->brightness = 0;
        fade->flags = SCREEN_FADE_FLAG_LIGHTEN;
        fade->speed = 16;
        fade->bldCnt = (BLDCNT_TGT2_ALL | BLDCNT_EFFECT_LIGHTEN | BLDCNT_TGT1_ALL);
        fade->bldAlpha = 0;

        for (arm = 0; arm < BOSS_8_ARM_COUNT; arm++) {
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
END_NONMATCH

void Task_804AD68(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);

    if (UpdateScreenFade(&boss->fade) == SCREEN_FADE_COMPLETE) {
        TasksDestroyInPriorityRange(0x5010, 0x5011);
        TasksDestroyInPriorityRange(0x5431, 0x5434);

        gStageFlags |= EXTRA_STATE__TURN_OFF_HUD;

        gPlayer.moveState |= MOVESTATE_100000;
        gPlayer.moveState |= MOVESTATE_400000;
        gCurTask->main = Task_ShowResultsAndDelete;
    } else {
        sub_804CC98(boss);
        sub_804CA08(boss);

        gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_LEFT]](boss, BOSS_8_ARM_LEFT);
        gUnknown_080D8890[boss->unk3C[BOSS_8_ARM_RIGHT]](boss, BOSS_8_ARM_RIGHT);

        sub_804C5B8(boss);
        sub_804CA70(boss);
        sub_804C080(boss);
    }
}

// (95.06%) https://decomp.me/scratch/of4k0
// (98.77%) https://decomp.me/scratch/Kzx1m
// (99.59%)
NONMATCH("asm/non_matching/game/bosses/boss_8__sub_804AE40.inc",
         void sub_804AE40(SuperEggRoboZ *boss))
{
    Sprite *s;

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        if (boss->unkE == 0) {
            gBldRegs.bldY = 0;
            boss->fade.brightness = 0;
            gFlags &= ~FLAGS_4;
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

            gFlags &= ~FLAGS_4;
        } else {
            // _0804AED4
            if (--boss->unk12 == 0) {
                u32 livesCockpit;
                gFlags &= ~FLAGS_4;

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

                    sub_802E784(boss->unk10, r4, 6, r8, r6 + 1, 32);

                    boss->fade.brightness = Q(32) - (boss->unk12 * 91);
                    UpdateScreenFade(&boss->fade);
                }
            }
        }
    }
}

END_NONMATCH

u8 sub_804B0EC(SuperEggRoboZ *boss, u8 arm)
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

    r5 = (gPlayer.x - r5) >> 8;
    r4 = (gPlayer.y - r4) >> 8;

    r5 = SQUARE(r5);
    r4 = SQUARE(r4);

    if ((r5 + r4) < 200) {
        sub_800CBA4(&gPlayer);

        boss->unk40[arm] = 1;

        if (boss->unk3C[arm] == 3) {
            m4aSongNumStart(SE_263);
        }

        return result;
    } else {
        s32 r0, r1;
        Sprite *s = &gPlayer.unk90->s;

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
            r5 = I(gPlayer.x - r6);
            r4 = I(gPlayer.y - r7);

            r5 = SQUARE(r5);
            r4 = SQUARE(r4);
            if ((r5 + r4) < 376) {
                s32 speed;
                result = sub_804C9B4(boss, arm);

                speed = -gPlayer.speedAirX;
                gPlayer.speedAirX = speed;

                speed = -gPlayer.speedAirY;
                gPlayer.speedAirY = speed;

                speed = -gPlayer.speedGroundX;
                gPlayer.speedGroundX = speed;

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

                gUnknown_03005498.t->unk15 = 0;
            }
        }
    }

    return result;
}

// Copy-paste of sub_804B0EC() aside from code above:
// if (gSelectedCharacter != CHARACTER_SONIC) {
//     ...
// }
// (93.51%) https://decomp.me/scratch/ecqNB
NONMATCH("asm/non_matching/game/bosses/boss_8__sub_804B2EC.inc",
         bool8 sub_804B2EC(SuperEggRoboZ *boss, u8 arm))
{
    u8 result = 0;
    s32 sp04, ip;
    s32 r3;
    s32 r4;
    s32 r5;
    s32 r6;
    s32 r7;
    s32 sl;

    if (boss->unk3E[arm] > 0) {
        return result;
    }
    // _0804B314

    {
        s32 r0, r1;
        Sprite *s = &gPlayer.unk90->s;

        r6 = boss->qPos.x + boss->qUnk18[arm].x;
        r4 = r6 + gUnknown_080D8888[arm][0];

        r5 = boss->qPos.y + boss->qUnk18[arm].y;
        r5 = r5 + gUnknown_080D8888[arm][1];

        if (gSelectedCharacter != CHARACTER_SONIC) {
            Player_UpdateHomingPosition(r4, r5);
        }

        if (PLAYER_IS_ALIVE && HITBOX_IS_ACTIVE(s->hitboxes[1])) {
            r5 = I(gPlayer.x - r6);
            r4 = I(gPlayer.y - r7);

            r5 = SQUARE(r5);
            r4 = SQUARE(r4);
            if ((r5 + r4) < 376) {
                s32 speed;
                result = sub_804C9B4(boss, arm);

                speed = -gPlayer.speedAirX;
                gPlayer.speedAirX = speed;

                speed = -gPlayer.speedAirY;
                gPlayer.speedAirY = speed;

                speed = -gPlayer.speedGroundX;
                gPlayer.speedGroundX = speed;

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

                gUnknown_03005498.t->unk15 = 0;
            }
        }
    }

    return result;
}
END_NONMATCH

void sub_804B43C(SuperEggRoboZ *boss, u8 arm)
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

void sub_804B594(SuperEggRoboZ *boss, u8 arm)
{
    u16 angle;
    Vec2_32 pos;

    boss->qUnk18[arm].x = 0;
    boss->qUnk18[arm].y = 0;

    // TODO: Seems like these were set through a macro?
    //       boss->qUnk18[arm][n] were just set to 0 after all
    pos.x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
    pos.y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

    angle = sub_8004418(I(gPlayer.y - pos.y), I(gPlayer.x - pos.x));

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

void sub_804B734(SuperEggRoboZ *boss, u8 arm)
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

void sub_804B984(SuperEggRoboZ *boss, u8 arm)
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

void sub_804BAC0(SuperEggRoboZ *boss, u8 arm)
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

// (81.31%) https://decomp.me/scratch/432q4
NONMATCH("asm/non_matching/game/bosses/boss_8__sub_804BC44.inc",
         void sub_804BC44(SuperEggRoboZ *boss, u8 arm))
{
    ExplosionPartsInfo info;
    s32 speed0;
    s32 x, y;
    u8 i, j;
#ifndef NON_MATCHING
    register u16 *r3 asm("r3");
#else
    u16 *r3;
#endif

    boss->qUnk18[arm].x -= ((COS(boss->rotation2[arm]) * 31) >> 10);
    boss->qUnk18[arm].y -= ((SIN(boss->rotation2[arm]) * 31) >> 10);

    r3 = &boss->unk30[arm];
    boss->rotation[arm] = ((*r3 * 4 + boss->rotation[arm]) & ONE_CYCLE);

    if (--boss->rotation2[arm] == 0) {
        // _0804BCD6
        x = boss->qPos.x + boss->qUnk18[arm].x + gUnknown_080D8888[arm][0];
        y = boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1];

        x -= ((COS(boss->rotation2[arm]) * 15) >> 6);
        y -= ((SIN(boss->rotation2[arm]) * 15) >> 6);

        for (i = 0; i < 3; i++) {
            for (j = 0; j < 3; j++) {
                s32 index;

                index = (boss->rotation[arm] - (SIN_PERIOD / 4));
                info.spawnX = I(x) - ((COS(index & ONE_CYCLE) * (i - 1)) >> 11);
                index = (boss->rotation[arm] - (SIN_PERIOD / 4));
                info.spawnY = I(y) - ((SIN(index & ONE_CYCLE) * (i - 1)) >> 11);

                info.velocity = 0;
                info.rotation
                    = (boss->rotation[arm] + 576 - boss->rotation2[arm]) & ONE_CYCLE;
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

        boss->rotation2[arm] = boss->rotation[arm];
        boss->unk3C[arm] = 0;
        boss->unk30[arm] = 300;
    }
}
END_NONMATCH

void sub_804BE6C(SuperEggRoboZ *boss, u8 arm)
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
                    info.speed = ((1 - i) >= 0) ? speed - ((1 - i) * Q(0.125))
                                                : speed - ((i - 1) * Q(0.125));
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

void sub_804C080(SuperEggRoboZ *boss)
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
        m4aSongNumStart(SE_144);
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

// (87.37%) https://decomp.me/scratch/98Mjg
NONMATCH("asm/non_matching/game/bosses/boss_8__sub_804C240.inc",
         void sub_804C240(SuperEggRoboZ *boss, u8 arm))
{
    ExplosionPartsInfo info;
    s32 x, y;
    s32 index;

    if (boss->unk42[arm] != 0) {
        return;
    }

    y = I(boss->qPos.y + boss->qUnk18[arm].y + gUnknown_080D8888[arm][1]);

    if (y > 300) {
        boss->unk42[arm] = 1;
        return;
    }

    boss->rotation[arm] = (boss->rotation[arm] + 800);
    boss->rotation[arm] &= ONE_CYCLE;
    boss->qUnk34[arm][1] += Q(0.125);
    boss->qUnk18[arm].x += boss->qUnk34[arm][0];
    boss->qUnk18[arm].y += boss->qUnk34[arm][1];

    if ((gStageTime & 0x3) == 0) {
        s32 rand;
        x = boss->qPos.x;
        x += gUnknown_080D8888[arm][0];
        x += boss->qUnk18[arm].x;
        y = boss->qPos.y;
        y += boss->qUnk18[arm].y;
        y += gUnknown_080D8888[arm][1];
        info.spawnX = I(x);
        info.spawnY = I(y);
        info.velocity = 0;
        info.rotation
            = sub_8004418(-(boss->qUnk34[arm][1] >> 3), -(boss->qUnk34[arm][0] >> 3));

        rand = PseudoRandom32();
        index = (info.rotation + (rand & 0x1F));
        info.rotation = (index - 0x10) & ONE_CYCLE;
        info.speed = SIN_24_8((gStageTime * 16) & ONE_CYCLE) + Q(3);
        info.vram = (OBJ_VRAM0 + 0x12980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 0;
        CreateBossParticleStatic(&info, &boss->unkC);
    }
}
END_NONMATCH

void sub_804C3AC(SuperEggRoboZ *boss)
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

    s->unk10 = (gUnknown_030054B8++
                | (SPRITE_FLAG(PRIORITY, 3) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                   | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

    tf->rotation = boss->unk10;
    tf->width = Q(1);
    tf->height = Q(1);
    tf->x = s->x;
    tf->y = s->y;

    UpdateSpriteAnimation(s);
    sub_8004860(s, tf);
    DisplaySprite(s);

    for (i = 0; i < BOSS_8_ARM_COUNT; i++) {
        s = &boss->bsArms[i].s;
        tf = &boss->bsArms[i].transform;

        sp00.x = boss->qPos.x + sp08.x + boss->qUnk18[i].x + gUnknown_080D8888[i][0];
        sp00.y = boss->qPos.y + sp08.y + boss->qUnk18[i].y + gUnknown_080D8888[i][1];

        s->x = I(sp00.x) - gCamera.x;
        s->y = I(sp00.y) - gCamera.y;

        s->unk10 = (gUnknown_030054B8++
                    | (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                       | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

        tf->rotation = boss->rotation[i];
        tf->width = Q(1);
        tf->height = Q(1);
        tf->x = s->x;
        tf->y = s->y;

        UpdateSpriteAnimation(s);
        sub_8004860(s, tf);
        DisplaySprite(s);
    }
}

void sub_804C5B8(SuperEggRoboZ *boss)
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

    s->unk10 = (gUnknown_030054B8++
                | (SPRITE_FLAG(PRIORITY, 3) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                   | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

    tf->rotation = boss->unk10;
    tf->width = Q(1);
    tf->height = Q(1);
    tf->x = s->x;
    tf->y = s->y;

    UpdateSpriteAnimation(s);
    sub_8004860(s, tf);
    DisplaySprite(s);

    for (i = 0; i < BOSS_8_ARM_COUNT; i++) {
        if (boss->unk42[i] != 0) {
            continue;
        }

        s = &boss->bsArms[i].s;
        tf = &boss->bsArms[i].transform;

        sp00.x = boss->qPos.x + sp08.x + boss->qUnk18[i].x + gUnknown_080D8888[i][0];
        sp00.y = boss->qPos.y + sp08.y + boss->qUnk18[i].y + gUnknown_080D8888[i][1];

        s->x = I(sp00.x) - gCamera.x;
        s->y = I(sp00.y) - gCamera.y;

        s->unk10 = (gUnknown_030054B8++
                    | (SPRITE_FLAG(PRIORITY, 1) | SPRITE_FLAG_MASK_ROT_SCALE_ENABLE
                       | SPRITE_FLAG_MASK_ROT_SCALE_DOUBLE_SIZE));

        tf->rotation = boss->rotation[i];
        tf->width = Q(1);
        tf->height = Q(1);
        tf->x = s->x;
        tf->y = s->y;

        UpdateSpriteAnimation(s);
        sub_8004860(s, tf);
        DisplaySprite(s);
    }
}

void sub_804C830(SuperEggRoboZ *boss)
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
        if (IsColliding_Cheese(s, headPos.x, headPos.y, 0, p) == TRUE) {
            Boss8_HitCockpit(boss);
            return;
        } else if (sub_800C320(s, headPos.x, headPos.y, 0, p) == TRUE) {
            Boss8_HitCockpit(boss);

            {
                s32 speed = p->speedAirX;
                if (speed > 0) {
                    p->speedAirX = -ABS(speed);
                }
            }
        } else if (sub_800CA20(s, headPos.x, headPos.y, 0, p) == TRUE) {
            s32 speed = p->speedAirX;
            if (speed > 0) {
                p->speedAirX = -speed;
            }
        }
    }

    if (gSelectedCharacter != CHARACTER_SONIC) {
        Player_UpdateHomingPosition(Q(headPos.x), Q(headPos.y));
    }
}

void Boss8_HitCockpit(SuperEggRoboZ *boss)
{
    Sprite *s = &boss->bsHead.s;

    if ((--boss->livesCockpit & 0xFF) & 0x1) {
        m4aSongNumStart(SE_143);
    } else {
        m4aSongNumStart(SE_235);
    }

    if (boss->livesCockpit == 3) {
        gUnknown_030054A8.unk1 = 19;
    }

    if (boss->livesCockpit == 0) {
        INCREMENT_SCORE_C(1000);
    }

    boss->unkB = 64;

    s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_HEAD;
    s->variant = 2;
    s->prevVariant = -1;
}

bool8 sub_804C9B4(SuperEggRoboZ *boss, u8 arm)
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

void sub_804CA08(SuperEggRoboZ *boss)
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

void sub_804CA70(SuperEggRoboZ *boss)
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

void Task_SuperEggRoboZMain(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    sub_804C5B8(boss);

    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    if ((gPlayer.speedGroundX == 0) && (--boss->unk14 == 0)) {
        boss->unk14 = 300;
        gCurTask->main = Task_804A9D8;
        m4aSongNumStart(SE_260);
        gPlayer.unk64 = 0;
        gPlayer.transition = PLTRANS_PT1;
    }
}

void Task_ShowResultsAndDelete(void)
{
    SuperEggRoboZ *boss = TASK_DATA(gCurTask);
    boss->fade.brightness = Q(32);
    UpdateScreenFade(&boss->fade);

    CreateStageResults(gCourseTime, gRingCount, gSpecialRingCount);
    m4aSongNumStop(SE_144);
    m4aMPlayVolumeControl(&gMPlayInfo_SE3, 0xFFFF, 0xFF);
    TaskDestroy(gCurTask);
}

void sub_804CC98(SuperEggRoboZ *boss)
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

void sub_804CCD0(SuperEggRoboZ *boss, s32 qP1)
{
    Vec2_32 pos = { boss->qPos.x + Q(190), boss->qPos.y + Q(40) };

    if ((I(gPlayer.y) < pos.x) && (gPlayer.y >= (pos.y - qP1))
        && (gPlayer.y <= (qP1 + pos.y))) {
        sub_800CBA4(&gPlayer);
    }
}

void TaskDestructor_SuperEggRoboZMain(struct Task *t)
{
    SuperEggRoboZ *boss = TASK_DATA(t);
    VramFree(boss->tilesCloud);

    VramFree(boss->bsArms[0].s.graphics.dest);
    VramFree(boss->bsArms[1].s.graphics.dest);
    VramFree(boss->bsHead.s.graphics.dest);

    gActiveBossTask = NULL;
}
