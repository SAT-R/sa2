#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "sakit/globals.h"

#include "game/game.h"
#include "game/stage/camera.h"

#include "game/stage/player.h"

#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/player_callbacks_1.h"

#include "lib/m4a.h"

#include "constants/zones.h"
#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0xC */ s32 unkC[6][2];
    /* 0x3C */ s16 unk3C[6][2];
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
    /* 0xB8 */ Sprite unkE8[2];
    /* 0xB8 */ Sprite unk148;
    SpriteTransform transform;
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

    s = &boss->unkE8[0];
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 0x200;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_WHEEL, 0, 22, 2, 0);

    s = &boss->unkE8[1];
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
void sub_803E494(void);
u8 sub_803DF34(EggBomberTank *boss);
u8 sub_803DB1C(EggBomberTank *boss);
void sub_803DA8C(EggBomberTank *boss);
u8 sub_803D430(EggBomberTank *boss);
void sub_803D978(EggBomberTank *boss);
u8 sub_803E0D8(EggBomberTank *boss, Player *player);
void Task_803E520(void);

void Task_803D088(void)
{
    Sprite *s;
    EggBomberTank *boss = TASK_DATA(gCurTask);
    s = &boss->unk148;

    boss->x += boss->unk8;

    sub_803E63C(boss);

    if (boss->unk68 != 0) {
        boss->unk68--;
    }

    if (sub_803DF34(boss) != 0) {

        boss->unk54 = Q_24_8(Div(boss->x, 0x100) - 8);
        boss->unk58 = Q_24_8(Div(boss->y, 0x100) - 22);

        boss->unk54 += (COS(boss->unk60) * 0xF) >> 5;
        boss->unk58 += (SIN(boss->unk60) * 0xF) >> 5;

        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_CANNON;
        s->variant = 2;
        s->prevVariant = -1;

        s = &boss->unk80;
        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_BODY;
        s->variant = 1;
        s->prevVariant = -1;

        s = &boss->unkB8;
        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_BODY_PARTS;
        s->variant = 1;
        s->prevVariant = -1;

        {
            s32 divResA, divResB;
            s32 oldScore = gLevelScore;
            gLevelScore += 500;

            divResA = Div(gLevelScore, 50000);
            divResB = Div(oldScore, 50000);

            if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                u16 lives = divResA - divResB;
                lives += gNumLives;

                if (lives > 255) {
                    gNumLives = 255;
                } else {
                    gNumLives = lives;
                }

                gUnknown_030054A8.unk3 = 16;
            }
        }

        if (!IS_FINAL_STAGE(gCurrentLevel)) {
            gUnknown_030054A8.unk1 = 0x11;
        }
    }

    if (sub_803DB1C(boss) != 0) {
        boss->unk68 = 0x96;
        gCurTask->main = sub_803E494;
    }

    sub_803DA8C(boss);
    if (sub_803D430(boss) != 0) {
        if (boss->unk71 != 0) {
            Sprite *s2;
            s2 = &boss->unk148;
            s2->graphics.anim = 0x286;
            s2->variant = 0;
            s2->prevVariant = -1;
        }

        boss->unk68 = 0x96;
        gCurTask->main = sub_803E494;
    }

    sub_803D978(boss);
    if (sub_803E0D8(boss, &gPlayer)) {
        sub_802A018();
        boss->unk68 = 0x103;
        gCurTask->main = Task_803E520;
    }
}

void sub_803D754(EggBomberTank *boss);
void sub_803D640(EggBomberTank *boss, u8);
void sub_803E214(EggBomberTank *boss);
void sub_803E5B0(void);

void sub_803D2C0(void)
{
    s32 rand;
    EggBomberTank *boss = TASK_DATA(gCurTask);
    s32 x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    sub_803D754(boss);
    sub_803D640(boss, 1);
    sub_803D978(boss);
    sub_803E214(boss);

    rand = PseudoRandom32();

    if (Mod(gStageTime + rand, 0x11) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (x < 0x32) {
        CreateEggmobileEscapeSequence(Q_24_8_TO_INT(boss->x) - gCamera.x - 4,
                                      Q_24_8_TO_INT(boss->y) - gCamera.y - 0x21, 0x2000);
        gCurTask->main = sub_803E5B0;
    }
}

extern const s8 gUnknown_080D7B10[];
extern const u16 gUnknown_080D7B4E[][2];

void sub_803D368(EggBomberTank *boss)
{
    u8 i, j;
    boss->unkA = -768;

    for (i = 0; i < 2; i++) {
        s8 temp = -0xC;

        if (i == 0) {
            temp = 0;
        }

        for (j = 0; j < 3; j++) {
            u8 idx = j + (i * 3);
            boss->unkC[idx][0] = boss->x + Q_24_8_NEW(gUnknown_080D7B10[j] + temp);
            boss->unkC[idx][1] = boss->unkC[j][1] + 0x400;
            boss->unk3C[idx][0] = gUnknown_080D7B4E[idx][0];
            boss->unk3C[idx][1] = gUnknown_080D7B4E[idx][1];
        }
    }
}

u8 sub_803D430(EggBomberTank *boss)
{
    Sprite *s;
    s8 i, j;
    u8 ret;

    s = &boss->unk80;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unkB8;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 9;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unk184;
    s->x = (Q_24_8_TO_INT(boss->x) - gCamera.x) - 1;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) - 0x2A;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < 2; i++) {
        s8 temp;
        s = &boss->unkE8[i];
        UpdateSpriteAnimation(s);

        temp = -12;

        if (i == 0) {
            temp = 0;
        }

        for (j = 0; j < 3; j++) {
            s->x = ((Q_24_8_TO_INT(boss->x)) + gUnknown_080D7B10[j]) - gCamera.x + temp;
            s->y = (Q_24_8_TO_INT(boss->unkC[j][1]) - gCamera.y) + 4;
            DisplaySprite(s);
        }
    }

    ret = 0;
    if (boss->unk71 != 0) {
        s32 temp2;
        SpriteTransform *transform;
        s = &boss->unk148;
        transform = &boss->transform;
        s->x = (Div(boss->x, 0x100) - gCamera.x) - 8;
        s->y = (Div(boss->y, 0x100) - gCamera.y) - 0x16;

        if (s->variant == 1) {
            s->x -= Div(COS(boss->unk60) * boss->unk68, 25000);
            s->y -= Div(SIN(boss->unk60) * boss->unk68, 25000);
        }
        s->unk10 = gUnknown_030054B8++ | 0x2060;

        transform->rotation = boss->unk60;
        transform->width = 0x100;
        transform->height = 0x100;
        transform->x = s->x;
        transform->y = s->y;

        if (UpdateSpriteAnimation(s) == 0) {
            ret = 1;
        }

        sub_8004860(s, transform);
        DisplaySprite(s);
    }

    return ret;
}

void sub_803D640(EggBomberTank *boss, u8 p1)
{
    Sprite *s;
    s8 i, j;

    s = &boss->unk80;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->unkB8;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 9;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (p1 != 0) {
        s = &boss->unk184;
        s->x = (Q_24_8_TO_INT(boss->x) - gCamera.x) - 1;
        s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) - 0x2A;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < 2; i++) {
        s8 temp;
        s = &boss->unkE8[i];
        UpdateSpriteAnimation(s);

        for (j = 0; j < 3; j++) {
            s8 idx = j + (i * 3);
            s->x = Q_24_8_TO_INT(boss->unkC[idx][0]) - gCamera.x;
            s->y = (Q_24_8_TO_INT(boss->unkC[idx][1]) - gCamera.y) - 0x12;
            DisplaySprite(s);
        }
    }
}

void sub_803D754(EggBomberTank *boss)
{
    s32 bottomX, bottomY, ground;
    u8 i, j;

    boss->unkA += 0x40;
    boss->x += boss->unk8;
    boss->y += boss->unkA;

    ground = sub_801E4E4(Q_24_8_TO_INT(boss->y), Q_24_8_TO_INT(boss->x), 1, 8, NULL,
                         sub_801EE64);

    if (ground < 0) {
        boss->y += Q_24_8_NEW(ground);
        boss->unk8 -= 0x10;
        if (boss->unk8 < 0) {
            boss->unk8 = 0;
        }
        boss->unkA = Div(boss->unkA * -0x5A, 100);
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < 3; j++) {
            u8 idx = j + (i * 3);
            boss->unk3C[idx][1] += 0x40;
            boss->unkC[idx][0] += boss->unk3C[idx][0];
            boss->unkC[idx][1] += boss->unk3C[idx][1];

            ground
                = sub_801E4E4(Q_24_8_TO_INT(boss->unkC[idx][1]) - 8,
                              Q_24_8_TO_INT(boss->unkC[idx][0]), 1, 8, 0, sub_801EE64);
            if (ground < 0) {
                boss->unkC[idx][1] += Q_24_8_NEW(ground);
                boss->unk3C[idx][0] -= 0x20;
                boss->unk3C[idx][1] = Div(boss->unk3C[idx][1] * -0x50, 100);
            }
        }
    }
}
