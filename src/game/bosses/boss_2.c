#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "sakit/globals.h"
#include "sakit/entities_0.h"

#include "game/game.h"
#include "game/stage/camera.h"

#include "game/stage/player.h"

#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/stage/boss_results_transition.h"
#include "game/player_callbacks_1.h"
#include "game/cheese.h"

#include "lib/m4a.h"

#include "constants/zones.h"
#include "constants/animations.h"
#include "constants/songs.h"

#define NUM_WHEELS              6
#define CANNON_MOVE_SPEED       82
#define CANNON_RELOAD_FRAMES    12
#define CANNON_RETRIGGER_FRAMES 150

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 speedX;
    /* 0x0A */ s16 speedY;
    /* 0xC */ s32 wheelPositions[NUM_WHEELS][2];
    /* 0x3C */ s16 unk3C[NUM_WHEELS][2];
    // Cannon ball maybe?
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x5C */ s16 unk5C;
    /* 0x5E */ s16 unk5E;
    /* 0x60 */ s16 cannonAngle;
    /* 0x64 */ s32 cannonStep;
    /* 0x68 */ u32 timer;
    /* 0x6C */ void *vram;

    /* 0x70 */ u8 unk70;
    /* 0x71 */ u8 cannonHealth;

    /* 0x72 */ u8 bossHitTimer;
    /* 0x73 */ u8 unk73;
    /* 0x74 */ u8 unk74;
    /* 0x75 */ u8 unk75;
    /* 0x76 */ u8 unk76;
    /* 0x77 */ u8 unk77;
    /* 0x78 */ u8 cannonHitTimer;

    /* 0x7C */ u32 introTimer;

    /* 0x80 */ Sprite body;
    /* 0xB0 */ Hitbox reserved;

    /* 0xB8 */ Sprite brokenBody;
    /* 0xB8 */ Sprite wheels[2];
    /* 0xB8 */ Sprite cannon;
    SpriteTransform transform;
    /* 0xB8 */ Sprite pilot;

} EggBomberTank; /* size: 0x1B4 */

typedef struct {
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;
    u8 explodeTimer;
    EggBomberTank *boss;
    Sprite s;
} EggBomberTankBomb; /* 0x44*/

typedef struct {
    void *vram;
    AnimId anim;
    u8 variant;
} ExplosionGraphics;

typedef void (*BossFunction)(EggBomberTank *boss);

static void Task_EggBomberTankIntro(void);
static void Task_BomberTankMain(void);
static void Task_StartBossDestruction(void);
static void Task_WaitForBossOffScreen(void);

static void TaskDestructor_EggBomberTankMain(struct Task *);

static void UpdateWheelPositions(EggBomberTank *boss);
static u8 HandleCannonCollision(EggBomberTank *boss);
static u8 RenderCannon(EggBomberTank *boss);
static void UpdatePilotAnimation(EggBomberTank *boss);
static u8 RenderEggBomberTank(EggBomberTank *boss);
static void UpdateBomberTankPalette(EggBomberTank *boss);
static void UpdateCannonAngle(EggBomberTank *boss);
static u8 CheckBossDestruction(EggBomberTank *boss, Player *player);

static void UpdatePosition(EggBomberTank *boss);
static void RenderEscapeBomberTank(EggBomberTank *boss, bool8);
static void CreateDestructionExplosions(EggBomberTank *boss);

static void HandleCannonBombTrigger(EggBomberTank *boss);
static void HandleCannonlessBombTrigger(EggBomberTank *boss);

static void CreateBomberTankBomb(EggBomberTank *boss, s32 x, s32 y, u16 angle, u16, u8);

static void CreateBombExplosion(EggBomberTank *boss, s32 x, s32 y, ExplosionGraphics);
static void Task_EggBomberTankBombExplosion(void);
static void Task_EggBomberTankBombDestroy(void);
static void Task_BombExplosionMain(void);

static const s8 sBodyWheelPositionsX[] = { -28, 2, 32 };

static const u8 sExplosionTimes[]
    = { 90, 60, 30, 90, 60, 90, 60, 30, 30, 60, 90, 30, 60, 30, 90, 30,
        0,  0,  1,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  1,  0,  0,
        0,  1,  0,  0,  1,  0,  1,  1,  0,  0,  0,  0,  0,  0,  0,  0 };

static const s8 sExplositionPositions[][2] = {
    { 0, 0 }, { -16, 16 }, { -16, -16 }, { 16, 16 }, { 16, -16 },
};

static const u16 gUnknown_080D7B4E[][2] = {
    {
        640,
        64512,
    },
    {
        704,
        64384,
    },
    {
        768,
        64256,
    },
    {
        768,
        64512,
    },
    {
        704,
        64384,
    },
    {
        640,
        64256,
    },
};

static const BossFunction sBossModeTasks[]
    = { HandleCannonBombTrigger, HandleCannonlessBombTrigger };

static const u16 gUnknown_080D7B70[][16] = {
    INCBIN_U16("graphics/80D7B70.gbapal"),
    INCBIN_U16("graphics/80D7B90.gbapal"),
};

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
    t = TaskCreate(Task_EggBomberTankIntro, sizeof(EggBomberTank), 0x4000, 0,
                   TaskDestructor_EggBomberTankMain);
    boss = TASK_DATA(t);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->cannonHealth = 6;
        boss->unk70 = 2;
    } else {
        boss->cannonHealth = 8;
        boss->unk70 = 4;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->unk70 = boss->unk70 >> 1;
        boss->cannonHealth = boss->cannonHealth >> 1;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->x = Q_24_8(6304);
        boss->y = Q_24_8(170);
    } else {
        boss->x = Q_24_8(480);
        boss->y = Q_24_8(170);
    }

    boss->speedX = 0x500;
    boss->speedY = 0;
    boss->unk54 = 0;
    boss->unk58 = 0;
    boss->unk5C = 0x80;
    boss->unk5E = -1024;
    boss->cannonAngle = 0;
    boss->cannonStep = 0;
    boss->timer = 0x96;

    boss->bossHitTimer = 0;
    boss->unk73 = 0;
    boss->unk74 = 0;
    boss->unk75 = 0;
    boss->unk76 = 0;
    boss->unk77 = 1;
    boss->cannonHitTimer = 0;

    boss->introTimer = 0;

    for (i = 0; i < 3; i++) {
        boss->wheelPositions[i][0] = Q_24_8(170);
        boss->wheelPositions[i][1] = Q_24_8(170);
    }
    vram = VramMalloc(239);
    boss->vram = vram;

    // reserved space for the cannon ball
    vram += 90 * TILE_SIZE_4BPP;

    s = &boss->body;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 99, SA2_ANIM_EGG_BOMBER_TANK_BODY, 0, 23, 2);

    s = &boss->brokenBody;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 45 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_BODY_PARTS, 0, 26, 2, 0);

    s = &boss->wheels[0];
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 16 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_WHEEL_FOREGROUND, 0, 22, 2, 0);

    s = &boss->wheels[1];
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 16 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_WHEEL_BACKGROUND, 0, 27, 2, 0);

    s = &boss->cannon;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    vram += 64 * TILE_SIZE_4BPP;
    SPRITE_INIT_ANIM_AND_SCRIPT(s, SA2_ANIM_EGG_BOMBER_TANK_CANNON, 0, 25);
    s->unk10 = (gUnknown_030054B8++) | 0x2060;

    s = &boss->pilot;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = vram;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_PILOT, 0, 26, 2, 0);

    gActiveBossTask = t;
}

static void Task_BomberTankCannonReload(void)
{
    Sprite *s;
    EggBomberTank *boss = TASK_DATA(gCurTask);
    s = &boss->cannon;

    boss->x += boss->speedX;

    UpdateWheelPositions(boss);

    if (boss->timer != 0) {
        boss->timer--;
    }

    if (HandleCannonCollision(boss) != 0) {

        boss->unk54 = Q_24_8(Div(boss->x, 0x100) - 8);
        boss->unk58 = Q_24_8(Div(boss->y, 0x100) - 22);

        boss->unk54 += (COS(boss->cannonAngle) * 0xF) >> 5;
        boss->unk58 += (SIN(boss->cannonAngle) * 0xF) >> 5;

        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_CANNON;
        s->variant = 2;
        s->prevVariant = -1;

        s = &boss->body;
        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_BODY;
        s->variant = 1;
        s->prevVariant = -1;

        s = &boss->brokenBody;
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

    // Wait for shoot animation
    if (RenderCannon(boss) != 0) {
        boss->timer = CANNON_RETRIGGER_FRAMES;
        gCurTask->main = Task_BomberTankMain;
    }

    UpdatePilotAnimation(boss);
    if (RenderEggBomberTank(boss) != 0) {
        if (boss->cannonHealth != 0) {
            Sprite *s2;
            s2 = &boss->cannon;
            s2->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_CANNON;
            s2->variant = 0;
            s2->prevVariant = -1;
        }

        boss->timer = CANNON_RETRIGGER_FRAMES;
        gCurTask->main = Task_BomberTankMain;
    }

    UpdateBomberTankPalette(boss);
    if (CheckBossDestruction(boss, &gPlayer)) {
        sub_802A018();
        boss->timer = 259;
        gCurTask->main = Task_StartBossDestruction;
    }
}

static void Task_TransitionToEscapeSequence(void)
{
    s32 rand;
    EggBomberTank *boss = TASK_DATA(gCurTask);
    s32 x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    UpdatePosition(boss);
    RenderEscapeBomberTank(boss, 1);
    UpdateBomberTankPalette(boss);
    CreateDestructionExplosions(boss);

    rand = PseudoRandom32();

    if (Mod(gStageTime + rand, 0x11) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (x < 50) {
        CreateEggmobileEscapeSequence(Q_24_8_TO_INT(boss->x) - gCamera.x - 4,
                                      Q_24_8_TO_INT(boss->y) - gCamera.y - 0x21, 0x2000);
        gCurTask->main = Task_WaitForBossOffScreen;
    }
}

static void BreakWheels(EggBomberTank *boss)
{
    u8 i, j;
    boss->speedY = -768;

    for (i = 0; i < 2; i++) {
        s8 temp = -0xC;

        if (i == 0) {
            temp = 0;
        }

        for (j = 0; j < 3; j++) {
            u8 idx = j + (i * 3);
            boss->wheelPositions[idx][0]
                = boss->x + Q_24_8_NEW(sBodyWheelPositionsX[j] + temp);
            boss->wheelPositions[idx][1] = boss->wheelPositions[j][1] + 0x400;
            boss->unk3C[idx][0] = gUnknown_080D7B4E[idx][0];
            boss->unk3C[idx][1] = gUnknown_080D7B4E[idx][1];
        }
    }
}

static u8 RenderEggBomberTank(EggBomberTank *boss)
{
    Sprite *s;
    s8 i, j;
    u8 ret;

    s = &boss->body;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->brokenBody;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 9;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->pilot;
    s->x = (Q_24_8_TO_INT(boss->x) - gCamera.x) - 1;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) - 0x2A;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < 2; i++) {
        s8 temp;
        s = &boss->wheels[i];
        UpdateSpriteAnimation(s);

        temp = -12;

        if (i == 0) {
            temp = 0;
        }

        for (j = 0; j < NUM_WHEELS / 2; j++) {
            s->x = ((Q_24_8_TO_INT(boss->x)) + sBodyWheelPositionsX[j]) - gCamera.x
                + temp;
            s->y = (Q_24_8_TO_INT(boss->wheelPositions[j][1]) - gCamera.y) + 4;
            DisplaySprite(s);
        }
    }

    ret = 0;
    if (boss->cannonHealth != 0) {
        s32 temp2;
        SpriteTransform *transform;
        s = &boss->cannon;
        transform = &boss->transform;
        s->x = (Div(boss->x, 0x100) - gCamera.x) - 8;
        s->y = (Div(boss->y, 0x100) - gCamera.y) - 0x16;

        if (s->variant == 1) {
            s->x -= Div(COS(boss->cannonAngle) * boss->timer, 25000);
            s->y -= Div(SIN(boss->cannonAngle) * boss->timer, 25000);
        }
        s->unk10 = gUnknown_030054B8++ | 0x2060;

        transform->rotation = boss->cannonAngle;
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

static void RenderEscapeBomberTank(EggBomberTank *boss, bool8 renderPilot)
{
    Sprite *s;
    s8 i, j;

    s = &boss->body;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->brokenBody;
    s->x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) + 9;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (renderPilot) {
        s = &boss->pilot;
        s->x = (Q_24_8_TO_INT(boss->x) - gCamera.x) - 1;
        s->y = (Q_24_8_TO_INT(boss->y) - gCamera.y) - 0x2A;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < 2; i++) {
        s8 temp;
        s = &boss->wheels[i];
        UpdateSpriteAnimation(s);

        for (j = 0; j < NUM_WHEELS / 2; j++) {
            s8 idx = j + (i * NUM_WHEELS / 2);
            s->x = Q_24_8_TO_INT(boss->wheelPositions[idx][0]) - gCamera.x;
            s->y = (Q_24_8_TO_INT(boss->wheelPositions[idx][1]) - gCamera.y) - 0x12;
            DisplaySprite(s);
        }
    }
}

static void UpdatePosition(EggBomberTank *boss)
{
    s32 ground;
    u8 i, j;

    boss->speedY += 0x40;
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    ground = sub_801E4E4(Q_24_8_TO_INT(boss->y), Q_24_8_TO_INT(boss->x), 1, 8, NULL,
                         sub_801EE64);

    if (ground < 0) {
        boss->y += Q_24_8_NEW(ground);
        boss->speedX -= 0x10;
        if (boss->speedX < 0) {
            boss->speedX = 0;
        }
        boss->speedY = Div(boss->speedY * -0x5A, 100);
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < NUM_WHEELS / 2; j++) {
            u8 idx = j + (i * NUM_WHEELS / 2);
            boss->unk3C[idx][1] += 0x40;
            boss->wheelPositions[idx][0] += boss->unk3C[idx][0];
            boss->wheelPositions[idx][1] += boss->unk3C[idx][1];

            ground = sub_801E4E4(Q_24_8_TO_INT(boss->wheelPositions[idx][1]) - 8,
                                 Q_24_8_TO_INT(boss->wheelPositions[idx][0]), 1, 8, 0,
                                 sub_801EE64);
            if (ground < 0) {
                boss->wheelPositions[idx][1] += Q_24_8_NEW(ground);
                boss->unk3C[idx][0] -= 0x20;
                boss->unk3C[idx][1] = Div(boss->unk3C[idx][1] * -0x50, 100);
            }
        }
    }
}

u32 HandleBossHit(EggBomberTank *boss)
{
    Sprite *s = &boss->pilot;
    u32 ret = 0;

    if (boss->bossHitTimer != 0) {
        return 0;
    }

    if (boss->unk70 != 0) {
        boss->unk70--;
        if (boss->unk70 & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->bossHitTimer = 30;
        if (boss->unk70 == 0) {

            s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
            s->variant = 2;
        }
        s->prevVariant = -1;
    } else {
        ret = 1;
    }

    return ret;
}

static void UpdateBomberTankPalette(EggBomberTank *boss)
{
    u8 i;
    if (boss->bossHitTimer != 0) {
        for (i = 0; i < 16; i++) {
            gObjPalette[i + 0x80] = gUnknown_080D7B70[(gStageTime & 2) >> 1][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[i + 0x80] = gUnknown_080D7B70[1][i];
        }
    }

    if (boss->cannonHitTimer != 0) {
        boss->cannonHitTimer--;
        for (i = 0; i < 16; i++) {
            gObjPalette[i + 0xD0] = gUnknown_080D7B70[(gStageTime & 2) >> 1][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[i + 0xD0] = gUnknown_080D7B70[1][i];
        }
    }

    gFlags |= 2;
}

static void UpdatePilotAnimation(EggBomberTank *boss)
{
    Sprite *s = &boss->pilot;
    if (boss->bossHitTimer != 0) {
        boss->unk73 = 0;
        boss->bossHitTimer--;
        if (boss->bossHitTimer == 0) {
            if (boss->unk70 == 0) {
                s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
                s->variant = 3;
            } else {
                s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
                s->variant = 0;
            }
            s->prevVariant = -1;
        }
    } else {
        if (boss->unk73 == 0) {
            return;
        }

        boss->unk73--;

        if (boss->unk73 == 0) {
            s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

static u8 RenderCannon(EggBomberTank *boss)
{
    s32 ground;
    ExplosionPartsInfo explosion;
    s32 i;
    Sprite *s = &boss->cannon;
    SpriteTransform *transform = &boss->transform;
    u8 ret = 0;

    if (boss->unk77 == 0 || boss->cannonHealth != 0) {
        return 0;
    }

    boss->cannonAngle = (boss->cannonAngle + CANNON_MOVE_SPEED) & (SIN_PERIOD - 1);
    boss->unk5E += 0x40;

    boss->unk54 += boss->unk5C;
    boss->unk58 += boss->unk5E;

    ground = sub_801F100(Q_24_8_TO_INT(boss->unk58) + 0x18, Q_24_8_TO_INT(boss->unk54),
                         1, 8, sub_801EC3C);

    if (ground < 0) {
        m4aSongNumStart(SE_143);
        boss->unk77 = 0;
        explosion.velocity = 0;
        explosion.rotation = 1000;
        explosion.speed = 0x600;
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;

        for (i = 0; i < 5; i++) {
            explosion.spawnX
                = (Q_24_8_TO_INT(boss->unk54) - gCamera.x) + sExplositionPositions[i][0];
            explosion.spawnY
                = (Q_24_8_TO_INT(boss->unk58) - gCamera.y) + sExplositionPositions[i][1];
            CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk76);
        }
        ret = 1;
    } else if ((gStageTime & 3) == 0) {
        explosion.spawnX = (Q_24_8_TO_INT(boss->unk54) - gCamera.x);
        explosion.spawnY = (Q_24_8_TO_INT(boss->unk58) - gCamera.y);
        explosion.velocity = 0;
        explosion.rotation = 1000;
        explosion.speed = 0x200;
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;
        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk76);
    }

    s->x = (Q_24_8_TO_INT(boss->unk54) - gCamera.x);
    s->y = (Q_24_8_TO_INT(boss->unk58) - gCamera.y);
    s->unk10 = gUnknown_030054B8++ | 0x2060;

    transform->rotation = boss->cannonAngle;
    transform->width = 0x100;
    transform->height = 0x100;
    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    sub_8004860(s, transform);
    DisplaySprite(s);

    return ret;
}

static void HandleCannonBombTrigger(EggBomberTank *boss)
{
    s32 x, y;
    s32 cos, sin;
    Sprite *s = &boss->cannon;
    if (HandleCannonCollision(boss) != 0) {
        boss->unk54 = Q_24_8_NEW(Div(boss->x, 256) - 8);
        boss->unk58 = Q_24_8_NEW(Div(boss->y, 256) - 22);
        boss->unk54 += ((COS(boss->cannonAngle) * 0xF) >> 5);
        boss->unk58 += ((SIN(boss->cannonAngle) * 0xF) >> 5);

        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_CANNON;
        s->variant = 2;
        s->prevVariant = -1;
        RenderCannon(boss);

        s = &boss->body;
        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_BODY;
        s->variant = 1;
        s->prevVariant = -1;

        s = &boss->brokenBody;
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
    } else {
        if (boss->timer == 0) {
            x = Q_24_8_NEW(Div(boss->x, 256) - 8);
            y = Q_24_8_NEW(Div(boss->y, 256) - 22);
            x += (COS(boss->cannonAngle) * 0x32) >> 6;
            y += (SIN(boss->cannonAngle) * 50) >> 6;
            s = &boss->cannon;
            s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_CANNON;
            s->variant = 1;
            s->prevVariant = -1;

            boss->timer = 12;
            gCurTask->main = Task_BomberTankCannonReload;
            m4aSongNumStart(SE_241);
            CreateBomberTankBomb(boss, x, y, boss->cannonAngle, 64,
                                 sExplosionTimes[PseudoRandom32() & 0xF]);

        } else {
            boss->timer--;
        }
    }
}

static u8 HandleCannonCollision(EggBomberTank *boss)
{
    s32 x, y;
    s32 dX, dY;

    s32 distance;
    u8 ret;

    dX = Q_24_8_NEW(Div(boss->x, 256) - 8);
    x = dX + ((COS(boss->cannonAngle) * 5) >> 3);

    dX = x - gPlayer.x;
    dX = Q_24_8_TO_INT(dX);

    dY = Q_24_8_NEW(Div(boss->y, 256) - 22);
    y = dY + ((SIN(boss->cannonAngle) * 5) >> 3);

    dY = y - gPlayer.y;
    dY = Q_24_8_TO_INT(dY);

    distance = (SQUARE(dY) + SQUARE(dX));

    ret = 0;
    sub_80122DC(x, y);

    if (boss->cannonHitTimer != 0) {
        return 0;
    }

    if (distance < 600) {
        Sprite *s = &gPlayer.unk90->s;
        if (!PLAYER_IS_ALIVE || s->hitboxes[1].index == -1) {
            sub_800CBA4(&gPlayer);
            return 0;
        }

        if (boss->cannonHealth != 0) {
            boss->cannonHealth--;
        }

        if (boss->unk70 & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        if (boss->cannonHealth == 0) {
            ret = 1;
        }

        sub_800CB18(&gPlayer);
        boss->cannonHitTimer = 30;
    }

    if (gCheese != NULL && gCheese->s.hitboxes[1].index != -1) {
        x -= gCheese->posX;
        x = Q_24_8_TO_INT(x);
        y -= gCheese->posY;
        y = Q_24_8_TO_INT(y);
        distance = SQUARE(y) + SQUARE(x);

        if (distance < 900) {
            if (boss->cannonHealth != 0) {
                boss->cannonHealth--;
            }

            if (boss->unk70 & 1) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            if (boss->cannonHealth == 0) {
                ret = 1;
            }
            gUnknown_03005498.t->unk15 = 0;
            boss->cannonHitTimer = 30;
        }
    }

    return ret;
}

static u8 CheckBossDestruction(EggBomberTank *boss, Player *player)
{
    Sprite *s = &boss->body;
    u8 ret = 0;

    if (boss->unk70 == 0) {
        return 1;
    }

    sub_800CA20(s, Q_24_8_TO_INT(boss->x), Q_24_8_TO_INT(boss->y), 1, player);
    if (sub_800C320(s, Q_24_8_TO_INT(boss->x), Q_24_8_TO_INT(boss->y), 0, player) == 1) {
        if (boss->cannonHealth != 0) {
            Sprite *s = &boss->pilot;
            boss->unk73 = 30;
            if (boss->bossHitTimer == 0) {

                s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }
            sub_800CBA4(player);
        } else {
            ret = HandleBossHit(boss);
        }
    } else {
        if (sub_800CA20(s, Q_24_8_TO_INT(boss->x), Q_24_8_TO_INT(boss->y), 0, player)
            == 1) {
            Sprite *s = &boss->pilot;
            boss->unk73 = 30;
            if (boss->bossHitTimer == 0) {

                s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }
            sub_800CBA4(player);
        }
    }

    sub_80122DC(boss->x, boss->y);

    if (boss->bossHitTimer == 0) {
        if (sub_800C418(s, Q_24_8_TO_INT(boss->x), Q_24_8_TO_INT(boss->y), 0, player)
                == 1
            && boss->cannonHealth == 0) {
            ret = HandleBossHit(boss);
        }
    }

    return ret;
}

static void CreateDestructionExplosions(EggBomberTank *boss)
{
    if (!(gStageTime & 7)) {
        if ((0x103U - boss->timer) >> 5 > boss->unk76) {
            u32 rand;
            ExplosionPartsInfo init;
            rand = PseudoRandom32();
            init.spawnX
                = (Q_24_8_TO_INT(boss->x) - gCamera.x) + ((rand * 0x22) & 63) - 0x34;
            rand = PseudoRandom32();
            init.spawnY
                = (Q_24_8_TO_INT(boss->y) - gCamera.y) + ((rand * 0x34) & 63) - 0x30;
            init.velocity = 0;

            init.rotation = 1000;
            init.speed = 0x600;
            init.vram = (void *)OBJ_VRAM0 + 0x2980;
            init.anim = SA2_ANIM_EXPLOSION;
            init.variant = 0;
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &boss->unk76);
        }
    } else {
        if ((PseudoRandom32() & 5) == 0 && (0x103U - boss->timer) >> 5 > boss->unk74) {
            u32 rand;
            ExplosionPartsInfo init;
            boss->unk75++;
            if (boss->unk75 > 5) {
                boss->unk75 = 0;
            }

            rand = PseudoRandom32();
            init.spawnX = (Q_24_8_TO_INT(boss->x) - gCamera.x) + (rand & 63) - 0x20;

            rand = PseudoRandom32();
            init.spawnY = (Q_24_8_TO_INT(boss->y) - gCamera.y) + (rand & 63) - 0x20;
            init.velocity = 0x40;

            init.rotation = PseudoRandom32() & (SIN_PERIOD - 1);
            init.speed = 0x600;
            init.vram = (void *)OBJ_VRAM0
                + (gUnknown_080D79D0[boss->unk75][0] * TILE_SIZE_4BPP);
            init.anim = gUnknown_080D79D0[boss->unk75][1];
            init.variant = gUnknown_080D79D0[boss->unk75][2];
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &boss->unk74);
        }
    }
}

void EggBomberTankMove(s32 dX, s32 dY)
{
    EggBomberTank *boss = TASK_DATA(gActiveBossTask);
    boss->x += dX;
    boss->y += dY;

    boss->wheelPositions[0][0] += dX;
    boss->wheelPositions[0][1] += dY;

    boss->wheelPositions[1][0] += dX;
    boss->wheelPositions[1][1] += dY;

    boss->wheelPositions[2][0] += dX;
    boss->wheelPositions[2][1] += dY;

    boss->unk54 += dX;
    boss->unk58 += dY;
}

static void Task_EggBomberTankIntro(void)
{
    EggBomberTank *boss = TASK_DATA(gCurTask);
    boss->x += 0x400 + boss->speedX;
    UpdateWheelPositions(boss);
    UpdateCannonAngle(boss);
    UpdatePilotAnimation(boss);
    RenderEggBomberTank(boss);

    boss->introTimer += 1;

    if (boss->introTimer > 89) {
        boss->introTimer = 0;
        gCurTask->main = Task_BomberTankMain;
    }
}

static void Task_BomberTankMain(void)
{
    EggBomberTank *boss = TASK_DATA(gCurTask);
    boss->x += boss->speedX;
    UpdateWheelPositions(boss);
    UpdateCannonAngle(boss);

    sBossModeTasks[boss->cannonHealth != 0 ? 0 : 1](boss);

    UpdatePilotAnimation(boss);
    RenderEggBomberTank(boss);
    UpdateBomberTankPalette(boss);

    if (CheckBossDestruction(boss, &gPlayer) != 0) {
        sub_802A018();
        boss->timer = 259;
        gCurTask->main = Task_StartBossDestruction;
    }
}

static void Task_StartBossDestruction(void)
{
    u32 rand;
    EggBomberTank *boss = TASK_DATA(gCurTask);

    boss->x += boss->speedX;
    UpdateWheelPositions(boss);
    UpdatePilotAnimation(boss);
    RenderEggBomberTank(boss);
    UpdateBomberTankPalette(boss);
    CreateDestructionExplosions(boss);

    rand = PseudoRandom32();
    if (Mod(gStageTime + rand, 21) == 0) {
        m4aSongNumStart(SE_144);
    }

    boss->timer--;

    if (boss->timer == 0) {
        BreakWheels(boss);
        gCurTask->main = Task_TransitionToEscapeSequence;
    }
}

static void Task_WaitForBossOffScreen(void)
{
    u32 rand;
    EggBomberTank *boss = TASK_DATA(gCurTask);
    s32 x = Q_24_8_TO_INT(boss->x) - gCamera.x;
    UpdatePosition(boss);
    RenderEscapeBomberTank(boss, 0);
    UpdateBomberTankPalette(boss);
    CreateDestructionExplosions(boss);

    rand = PseudoRandom32();

    if (Mod(gStageTime + rand, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (x < -200) {
        sub_802EF68(-20, 140, 1);
        TaskDestroy(gCurTask);
    }
}

static void UpdateWheelPositions(EggBomberTank *boss)
{
    u32 val = 0;
    u8 i;

    for (i = 0; i < 3; i++) {
        s32 x = Q_24_8_TO_INT(boss->x) + sBodyWheelPositionsX[i];
        s32 y = Q_24_8_TO_INT(boss->wheelPositions[i][1]) + 0x12;
        val += y;

        boss->wheelPositions[i][1] += Q_24_8_NEW(sub_801F100(y, x, 1, 8, sub_801EC3C));
    }

    boss->y = Q_24_8_NEW(Div(val, 3)) - 0x1200;
}

static void UpdateCannonAngle(EggBomberTank *boss)
{
    s32 idx = CLAMP_SIN_PERIOD(boss->cannonStep * 5);
    boss->cannonStep += 1;

    if (boss->cannonHealth != 0) {
        boss->cannonAngle = Div(SIN(idx), 192) + 512;
    }
}

static void HandleCannonlessBombTrigger(EggBomberTank *boss)
{
    RenderCannon(boss);
    if (boss->timer == 0) {
        CreateBomberTankBomb(boss, boss->x - 0x800, boss->y - 0x1600, 0x200, 8,
                             sExplosionTimes[PseudoRandom32() & 0xF]);
        boss->timer = 113;
    } else {
        if (boss->timer > 150) {
            boss->timer = 150;
        }
        boss->timer--;
    }
}

static void TaskDestructor_EggBomberTankMain(struct Task *t)
{
    EggBomberTank *boss = TASK_DATA(t);
    VramFree(boss->vram);
    VramFree(boss->body.graphics.dest);
    gActiveBossTask = NULL;
}

UNUSED static void sub_803E798(EggBomberTank *boss)
{
    Sprite *s = &boss->pilot;
    boss->unk73 = 30;
    if (boss->bossHitTimer == 0) {
        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void CreateBomberTankBomb(EggBomberTank *boss, s32 x, s32 y, u16 angle, u16 p5,
                                 u8 explosionTime)
{
    struct Task *t = TaskCreate(Task_EggBomberTankBombExplosion,
                                sizeof(EggBomberTankBomb), 0x6100, 0, NULL);
    Sprite *s;
    EggBomberTankBomb *bomb = TASK_DATA(t);
    bomb->x = x - Q_24_8_NEW(gCamera.x);
    bomb->y = y - Q_24_8_NEW(gCamera.y);

    bomb->speedX = ((p5)*COS(angle)) >> 14;
    bomb->speedY = ((p5)*SIN(angle)) >> 13;

    bomb->explodeTimer = explosionTime;
    bomb->boss = boss;

    if (angle > 512) {
        m4aSongNumStart(SE_245);
    } else {
        m4aSongNumStart(SE_244);
    }

    s = &bomb->s;

    s->x = Q_24_8_TO_INT(x);
    s->y = Q_24_8_TO_INT(y);
    s->graphics.dest = boss->vram;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_BOMBER_TANK_BOMB, 0, 25, 2, 0);
}

static void Task_EggBomberTankBombExplosion(void)
{
    EggBomberTankBomb *bomb = TASK_DATA(gCurTask);
    u8 unusedByte;
    s16 ground;
    Sprite *s = &bomb->s;

    // gravity
    bomb->speedY += 0x20;

    if (!PLAYER_IS_ALIVE) {
        bomb->x += bomb->speedX;
        bomb->y += bomb->speedY;
    } else {
        bomb->x -= bomb->speedX - Q_24_8_NEW(gCamera.unk38);
        bomb->y += bomb->speedY + Q_24_8_NEW(gCamera.unk3C);
    }

    ground = sub_801E4E4(Q_24_8_TO_INT(bomb->y) + 0xC + gCamera.y,
                         Q_24_8_TO_INT(bomb->x) + gCamera.x, 1, 8, &unusedByte,
                         sub_801EE64);
    if (ground < 0) {
        bomb->y += Q_24_8_NEW(ground);
        bomb->speedY = Div(-(bomb->speedY * 8), 10);
    }

    s->x = Q_24_8_TO_INT(bomb->x);
    s->y = Q_24_8_TO_INT(bomb->y);

    if (bomb->boss->unk70) {
        // If hit player
        if (sub_800CA20(s, Q_24_8_TO_INT(bomb->x) + gCamera.x,
                        Q_24_8_TO_INT(bomb->y) + gCamera.y, 0, &gPlayer)
            == 1) {
            if (bomb->boss->bossHitTimer == 0) {
                Sprite *s = &bomb->boss->pilot;
                bomb->boss->unk73 = 30;

                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }

            bomb->explodeTimer = 1;
        }
    }

    bomb->explodeTimer--;

    if (bomb->explodeTimer == 0 || bomb->boss->unk70 == 0) {
        ExplosionGraphics graphics;

        if (ground >= 16) {
            m4aSongNumStart(SE_242);
            graphics.vram = s->graphics.dest + 0x120;
            graphics.anim = SA2_ANIM_EXPLOSION_1;
            graphics.variant = 0;

            CreateBombExplosion(bomb->boss, Q_24_8_TO_INT(bomb->x) + gCamera.x,
                                Q_24_8_TO_INT(bomb->y) + gCamera.y, graphics);
        } else {
            m4aSongNumStart(SE_243);
            graphics.vram = s->graphics.dest + 0x740;
            graphics.anim = SA2_ANIM_EXPLOSION_2;
            graphics.variant = 0;

            CreateBombExplosion(bomb->boss, Q_24_8_TO_INT(bomb->x) + gCamera.x,
                                Q_24_8_TO_INT(bomb->y) + 0xF + ground + gCamera.y,
                                graphics);
        }

        gCurTask->main = Task_EggBomberTankBombDestroy;
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void CreateBombExplosion(EggBomberTank *boss, s32 x, s32 y,
                                ExplosionGraphics graphics)
{
    struct Task *t;
    Sprite *s;
    EggBomberTankBomb *bomb;

    t = TaskCreate(Task_BombExplosionMain, sizeof(EggBomberTankBomb), 0x6200, 0, NULL);

    bomb = TASK_DATA(t);
    bomb->x = x - gCamera.x;
    bomb->y = y - gCamera.y;
    bomb->speedX = 0;
    bomb->speedY = 0;
    bomb->boss = boss;

    s = &bomb->s;
    s->x = x;
    s->y = y;

    s->graphics.dest = graphics.vram;
    SPRITE_INIT_WITHOUT_VRAM(s, graphics.anim, graphics.variant, 25, 2, 0);
}

static void Task_BombExplosionMain(void)
{
    EggBomberTankBomb *explosion = TASK_DATA(gCurTask);
    Sprite *s = &explosion->s;
    if (PLAYER_IS_ALIVE) {
        explosion->x += gCamera.unk38;
        explosion->y += gCamera.unk3C;
    }

    s->x = explosion->x;
    s->y = explosion->y;

    if (explosion->boss->unk70 != 0) {
        if (sub_800CA20(s, explosion->x + gCamera.x, explosion->y + gCamera.y, 0,
                        &gPlayer)
            == 1) {
            if (explosion->boss->bossHitTimer == 0) {
                Sprite *s = &explosion->boss->pilot;
                explosion->boss->unk73 = 30;
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }
        }
    }

    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = Task_EggBomberTankBombDestroy;
    }
    DisplaySprite(s);
}

static void Task_EggBomberTankBombDestroy(void) { TaskDestroy(gCurTask); }
