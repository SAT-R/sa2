#include "global.h"
#include "core.h"
#include "task.h"
#include "malloc_vram.h"
#include "gba/defines.h"
#include "gba/io_reg.h"
#include "sakit/globals.h"
#include "sakit/player.h"
#include "game/bosses/common.h"
#include "game/stage/screen_fade.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/tilemaps.h"

#define BOSS_8_ARM_COUNT 2

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u8 filler30[0xC];
} BossSprite;

typedef struct {
    /*  0x00 */ s32 qUnk0;
    /*  0x04 */ s32 qUnk4;
    /*  0x08 */ u8 livesCockpit;
    /*  0x09 */ u8 livesArmLeft;
    /*  0x0A */ u8 livesArmRight;
    /*  0x0B */ u8 unkB;
    /*  0x0C */ u8 unkC;
    /*  0x0E */ u16 unkE;
    /*  0x10 */ u16 unk10;
    /*  0x14 */ u32 unk14;
    /*  0x28 */ s32 qUnk18[BOSS_8_ARM_COUNT][2];
    /*  0x28 */ s16 qUnk28[BOSS_8_ARM_COUNT];
    /*  0x2C */ s16 qUnk2C[BOSS_8_ARM_COUNT];
    /*  0x30 */ s16 qUnk30[BOSS_8_ARM_COUNT];
    /*  0x34 */ u16 qUnk34[BOSS_8_ARM_COUNT][2];
    /*  0x3C */ u8 qUnk3C[BOSS_8_ARM_COUNT];
    /*  0x3E */ u8 qUnk3E[BOSS_8_ARM_COUNT];
    /*  0x40 */ u8 qUnk40[BOSS_8_ARM_COUNT];
    /*  0x40 */ u8 qUnk42[BOSS_8_ARM_COUNT];
    /*  0x44 */ void *tilesUnk44;
    /*  0x48 */ ScreenFade fade;
    /*  0x54 */ BossSprite bsHead;
    /*  0x90 */ BossSprite bsArms[BOSS_8_ARM_COUNT];
    /* 0x108 */ Background body;
} SuperEggRoboZ; /* size: 0x148 */

void Task_SuperEggRoboZMain(void);
void TaskDestructor_SuperEggRoboZMain(struct Task *);

// TODO: Remove once boss_run.h has its own prototype for this function.
//       (or once it is integrated into this module, if it makes sense)
extern void sub_8049D20(void *vramTiles, SuperEggRoboZ *boss);

void CreateSuperEggRoboZ(void)
{
    struct Task *t;
    SuperEggRoboZ *boss;
    ScreenFade *fade;
    Sprite *s;
    Background *body;
    u8 r4;

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
        boss->livesArmLeft = 4;
        boss->livesArmRight = 4;
    } else {
        boss->livesCockpit = 8;
        boss->livesArmLeft = 6;
        boss->livesArmRight = 6;
    }

    boss->qUnk0 = Q(42876);
    boss->qUnk4 = Q(370);
    boss->unkE = 360;
    boss->unk10 = 512;
    boss->unkB = 0;
    boss->unkC = 0;
    boss->unk14 = 30;
    boss->tilesUnk44 = VramMalloc(32);
    sub_8049D20(boss->tilesUnk44, boss);

    for (r4 = 0; r4 < BOSS_8_ARM_COUNT; r4++) {
        // _0804A832
        boss->qUnk28[r4] = Q(2.0);
        boss->qUnk2C[r4] = Q(2.0);
        boss->qUnk18[r4][0] = Q(0.0);
        boss->qUnk18[r4][1] = Q(0.0);
        boss->qUnk3C[r4] = Q(0.0);
        boss->qUnk30[r4] = r4 * 360 + 360;
        boss->qUnk3E[r4] = Q(0.0);
        boss->qUnk40[r4] = Q(0.0);
        boss->qUnk42[r4] = Q(0.0);
        boss->qUnk34[r4][0] = Q(0.0);
        boss->qUnk34[r4][1] = Q(0.0);

        s = &boss->bsArms[r4].s;
        s->x = 0;
        s->y = 0;

        if (r4 != 0) {
            s->graphics.dest = VramMalloc(8 * 8);
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_RIGHT;
            s->variant = 0;
        } else {
            s->graphics.dest = VramMalloc(8 * 8);
            s->graphics.anim = SA2_ANIM_SUPER_EGG_ROBO_Z_ARM_LEFT;
            s->variant = 0;
        }

        s->unk1A = SPRITE_OAM_ORDER(27 + (r4 * 4));
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
