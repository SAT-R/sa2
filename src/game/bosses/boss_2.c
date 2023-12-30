#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "sakit/globals.h"

#include "game/stage/player.h"

#include "game/bosses/common.h"

#include "constants/zones.h"
#include "constants/animations.h"

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0xC */ s32 unkC[3][2];

    // Guess
    /* 0x24 */ Sprite filler24;

    // Cannon ball maybe?
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ s16 unk5C;
    /* 0x5E */ s16 unk5E;
    /* 0x60 */ s16 unk60;
    /* 0x64 */ s32 unk64;
    /* 0x68 */ s32 unk68;
    /* 0x6C */ void *unk6C;

    /* 0x70 */ u8 unk70;
    /* 0x71 */ u8 unk71;

    /* 0x72 */ u8 unk72;
    /* 0x73 */ u8 unk73;
    /* 0x74 */ u8 unk74;
    /* 0x75 */ u8 unk75;
    /* 0x76 */ u8 unk76;
    /* 0x77 */ u8 unk77;
    /* 0x78 */ u8 unk78;

    /* 0x7C */ s32 unk7C;

    /* 0x80 */ Sprite unk80;
    /* 0xB0 */ Hitbox reserved;

    /* 0xB8 */ Sprite unkB8;
    /* 0xB8 */ Sprite unkE8;
    /* 0xB8 */ Sprite unk118;
    /* 0xB8 */ Sprite unk148;
    /* 0xB0 */ Hitbox reserved2;
    s32 filler180;
    /* 0xB8 */ Sprite unk184;

} EggBomberTank; /* size: 0x1B4 */

void Task_EggBomberTankMain(void);
void TaskDestructor_EggBomberTankMain(struct Task *);

void CreateEggBomberTank(void)
{
    Sprite *s;
    u32 i;
    struct Task *t;
    EggBomberTank *boss;
    void *vram;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    sub_8039ED4();
    gPseudoRandom = gStageTime;
    t = TaskCreate(Task_EggBomberTankMain, 0x1B4, 0x4000, 0,
                   TaskDestructor_EggBomberTankMain);
    boss = TASK_DATA(t);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->unk71 = 6;
        boss->unk70 = 2;
    } else {
        boss->unk71 = 8;
        boss->unk70 = 4;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->unk70 = boss->unk70 >> 1;
        boss->unk71 = boss->unk71 >> 1;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->x = Q_24_8(6304);
        boss->y = Q_24_8(170);
    } else {
        boss->x = Q_24_8(480);
        boss->y = Q_24_8(170);
    }

    boss->unk8 = 0x500;
    boss->unkA = 0;
    boss->unk54 = 0;
    boss->unk58 = 0;
    boss->unk5C = 0x80;
    boss->unk5E = -1024;
    boss->unk60 = 0;
    boss->unk64 = 0;
    boss->unk68 = 0x96;

    boss->unk72 = 0;
    boss->unk73 = 0;
    boss->unk74 = 0;
    boss->unk75 = 0;
    boss->unk76 = 0;
    boss->unk77 = 1;
    boss->unk78 = 0;

    boss->unk7C = 0;

    for (i = 0; i < 3; i++) {
        boss->unkC[i][0] = Q_24_8(170);
        boss->unkC[i][1] = Q_24_8(170);
    }
    vram = VramMalloc(239);
    boss->unk6C = vram;
    vram += 0xB40;

    s = &boss->unk80;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 99, SA2_ANIM_EGG_BOMBER_TANK_BODY, 0, 23, 2);

    s = &boss->unkB8;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 0x5A0;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_BODY_PARTS, 0, 26, 2, 0);

    s = &boss->unkE8;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 0x200;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_WHEEL, 0, 22, 2, 0);

    s = &boss->unk118;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 0x200;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_WHEEL_PARTS, 0, 27, 2, 0);

    s = &boss->unk148;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 0x800;
    SPRITE_INIT_ANIM_AND_SCRIPT(s, SA2_ANIM_EGG_BOMBER_TANK_CANNON, 0, 25);
    s->unk10 = (gUnknown_030054B8++) | 0x2060;

    s = &boss->unk184;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_PILOT, 0, 26, 2, 0);

    gActiveBossTask = t;
}

void sub_803E63C(EggBomberTank *boss);
u8 sub_803DF34(EggBomberTank *boss);

// void Task_803D088(void)
// {
//     EggBomberTank *boss = TASK_DATA(gCurTask);

//     boss->unk8++;

//     sub_803E63C(boss);

//     if (boss->unk68 != 0) {
//         boss->unk68--;
//     }

//     if (sub_803DF34(boss) != 0) {
//         boss->unk54 = Q_24_8(Div(boss->unk8, 0x100) - 8);
//     }
// }
