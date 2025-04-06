#include "core.h"
#include "sprite.h"
#include "malloc_vram.h"
#include "trig.h"
#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/stage/terrain_collision.h"
#include "game/stage/camera.h"
#include "game/player_callbacks.h"
#include "game/stage/player.h"

#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/stage/boss_results_transition.h"
#include "game/cheese.h"

#include "lib/m4a/m4a.h"

#include "constants/zones.h"
#include "constants/animations.h"
#include "constants/songs.h"

#define NUM_WHEELS              6
#define CANNON_MOVE_SPEED       82
#define CANNON_RELOAD_FRAMES    12
#define CANNON_RETRIGGER_FRAMES 150

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 qSpeedX;
    /* 0x0A */ s16 qSpeedY;
    /* 0x0C */ s32 qWheelPositions[NUM_WHEELS][2];
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

    /* 0x70 */ u8 health;
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
    /* 0xE8 */ Sprite wheels[2];
    /* 0x148 */ Sprite cannon;
    /* 0x178 */ SpriteTransform transform;
    /* 0x184 */ Sprite pilot;
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
static bool8 HandleCannonCollision(EggBomberTank *boss);
static bool8 RenderCannon(EggBomberTank *boss);
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

static const u8 sExplosionTimes[] = { 90, 60, 30, 90, 60, 90, 60, 30, 30, 60, 90, 30, 60, 30, 90, 30, 0, 0, 1, 0, 0, 0, 0, 0,
                                      1,  0,  0,  0,  0,  1,  0,  0,  0,  1,  0,  0,  1,  0,  1,  1,  0, 0, 0, 0, 0, 0, 0, 0 };

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

static const BossFunction sBossModeTasks[] = { HandleCannonBombTrigger, HandleCannonlessBombTrigger };

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
    t = TaskCreate(Task_EggBomberTankIntro, sizeof(EggBomberTank), 0x4000, 0, TaskDestructor_EggBomberTankMain);
    boss = TASK_DATA(t);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->cannonHealth = 6;
        boss->health = 2;
    } else {
        boss->cannonHealth = 8;
        boss->health = 4;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->health = boss->health >> 1;
        boss->cannonHealth = boss->cannonHealth >> 1;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        boss->qWorldX = Q(6304);
        boss->qWorldY = Q(170);
    } else {
        boss->qWorldX = Q(480);
        boss->qWorldY = Q(170);
    }

    boss->qSpeedX = Q(5);
    boss->qSpeedY = Q(0);
    boss->unk54 = 0;
    boss->unk58 = 0;
    boss->unk5C = 0x80;
    boss->unk5E = -1024;
    boss->cannonAngle = 0;
    boss->cannonStep = 0;
    boss->timer = 150;

    boss->bossHitTimer = 0;
    boss->unk73 = 0;
    boss->unk74 = 0;
    boss->unk75 = 0;
    boss->unk76 = 0;
    boss->unk77 = 1;
    boss->cannonHitTimer = 0;

    boss->introTimer = 0;

    for (i = 0; i < 3; i++) {
        boss->qWheelPositions[i][0] = Q(170);
        boss->qWheelPositions[i][1] = Q(170);
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
    s->frameFlags = (gUnknown_030054B8++) | 0x2060;

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

    boss->qWorldX += boss->qSpeedX;

    UpdateWheelPositions(boss);

    if (boss->timer != 0) {
        boss->timer--;
    }

    if (HandleCannonCollision(boss) != 0) {
        boss->unk54 = Q(Div(boss->qWorldX, 0x100) - 8);
        boss->unk58 = Q(Div(boss->qWorldY, 0x100) - 22);

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

        INCREMENT_SCORE_B(500);

        if (!IS_FINAL_STAGE(gCurrentLevel)) {
            gMusicManagerState.unk1 = 0x11;
        }
    }

    // Wait for shoot animation
    if (RenderCannon(boss)) {
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
        Player_DisableInputAndBossTimer();
        boss->timer = 259;
        gCurTask->main = Task_StartBossDestruction;
    }
}

static void Task_TransitionToEscapeSequence(void)
{
    s32 rand;
    EggBomberTank *boss = TASK_DATA(gCurTask);
    s32 x = I(boss->qWorldX) - gCamera.x;
    UpdatePosition(boss);
    RenderEscapeBomberTank(boss, 1);
    UpdateBomberTankPalette(boss);
    CreateDestructionExplosions(boss);

    rand = PseudoRandom32();

    if (Mod(gStageTime + rand, 0x11) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    if (x < 50) {
        CreateEggmobileEscapeSequence(I(boss->qWorldX) - gCamera.x - 4, I(boss->qWorldY) - gCamera.y - 0x21, 0x2000);
        gCurTask->main = Task_WaitForBossOffScreen;
    }
}

static void BreakWheels(EggBomberTank *boss)
{
    u8 i, j;
    boss->qSpeedY = -768;

    for (i = 0; i < 2; i++) {
        s8 temp = -0xC;

        if (i == 0) {
            temp = 0;
        }

        for (j = 0; j < 3; j++) {
            u8 idx = j + (i * 3);
            boss->qWheelPositions[idx][0] = boss->qWorldX + QS(sBodyWheelPositionsX[j] + temp);
            boss->qWheelPositions[idx][1] = boss->qWheelPositions[j][1] + 0x400;
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
    s->x = I(boss->qWorldX) - gCamera.x;
    s->y = (I(boss->qWorldY) - gCamera.y) + 4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->brokenBody;
    s->x = I(boss->qWorldX) - gCamera.x;
    s->y = (I(boss->qWorldY) - gCamera.y) + 9;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->pilot;
    s->x = (I(boss->qWorldX) - gCamera.x) - 1;
    s->y = (I(boss->qWorldY) - gCamera.y) - 0x2A;
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
            s->x = ((I(boss->qWorldX)) + sBodyWheelPositionsX[j]) - gCamera.x + temp;
            s->y = (I(boss->qWheelPositions[j][1]) - gCamera.y) + 4;
            DisplaySprite(s);
        }
    }

    ret = 0;
    if (boss->cannonHealth != 0) {
        SpriteTransform *transform;
        s = &boss->cannon;
        transform = &boss->transform;
        s->x = (Div(boss->qWorldX, 0x100) - gCamera.x) - 8;
        s->y = (Div(boss->qWorldY, 0x100) - gCamera.y) - 0x16;

        if (s->variant == 1) {
            s->x -= Div(COS(boss->cannonAngle) * boss->timer, 25000);
            s->y -= Div(SIN(boss->cannonAngle) * boss->timer, 25000);
        }
        s->frameFlags = gUnknown_030054B8++ | 0x2060;

        transform->rotation = boss->cannonAngle;
        transform->qScaleX = Q(1);
        transform->qScaleY = Q(1);
        transform->x = s->x;
        transform->y = s->y;

        if (UpdateSpriteAnimation(s) == 0) {
            ret = 1;
        }

        TransformSprite(s, transform);
        DisplaySprite(s);
    }

    return ret;
}

static void RenderEscapeBomberTank(EggBomberTank *boss, bool8 renderPilot)
{
    Sprite *s;
    s8 i, j;

    s = &boss->body;
    s->x = I(boss->qWorldX) - gCamera.x;
    s->y = (I(boss->qWorldY) - gCamera.y) + 4;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->brokenBody;
    s->x = I(boss->qWorldX) - gCamera.x;
    s->y = (I(boss->qWorldY) - gCamera.y) + 9;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (renderPilot) {
        s = &boss->pilot;
        s->x = (I(boss->qWorldX) - gCamera.x) - 1;
        s->y = (I(boss->qWorldY) - gCamera.y) - 0x2A;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < 2; i++) {
        s = &boss->wheels[i];
        UpdateSpriteAnimation(s);

        for (j = 0; j < NUM_WHEELS / 2; j++) {
            s8 idx = j + (i * NUM_WHEELS / 2);
            s->x = I(boss->qWheelPositions[idx][0]) - gCamera.x;
            s->y = (I(boss->qWheelPositions[idx][1]) - gCamera.y) - 0x12;
            DisplaySprite(s);
        }
    }
}

static void UpdatePosition(EggBomberTank *boss)
{
    s32 ground;
    u8 i, j;

    boss->qSpeedY += 0x40;
    boss->qWorldX += boss->qSpeedX;
    boss->qWorldY += boss->qSpeedY;

    ground = sub_801E4E4(I(boss->qWorldY), I(boss->qWorldX), 1, 8, NULL, sub_801EE64);

    if (ground < 0) {
        boss->qWorldY += QS(ground);
        boss->qSpeedX -= Q(3.75 / GBA_FRAMES_PER_SECOND);
        if (boss->qSpeedX < 0) {
            boss->qSpeedX = 0;
        }
        boss->qSpeedY = Div(boss->qSpeedY * -90, 100);
    }

    for (i = 0; i < 2; i++) {
        for (j = 0; j < NUM_WHEELS / 2; j++) {
            u8 idx = j + (i * NUM_WHEELS / 2);
            boss->unk3C[idx][1] += 0x40;
            boss->qWheelPositions[idx][0] += boss->unk3C[idx][0];
            boss->qWheelPositions[idx][1] += boss->unk3C[idx][1];

            ground = sub_801E4E4(I(boss->qWheelPositions[idx][1]) - 8, I(boss->qWheelPositions[idx][0]), 1, 8, 0, sub_801EE64);
            if (ground < 0) {
                boss->qWheelPositions[idx][1] += QS(ground);
                boss->unk3C[idx][0] -= 0x20;
                boss->unk3C[idx][1] = Div(boss->unk3C[idx][1] * -80, 100);
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

    if (boss->health != 0) {
        boss->health--;
        if (boss->health & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }
// HACK: we are using a hack to skip this portion when in
// wide screen cos there are some physics from the camera
// so it's causing the run to be inconsistent from the
// native resolution runs
#if TAS_TESTING && TAS_TESTING_WIDESCREEN_HACK && DISPLAY_WIDTH > 240
        if (boss->cannonHealth == 0) {
            gInputRecorder.playbackHead += 58;
            boss->health = 0;
        }
#endif

        boss->bossHitTimer = 30;
        if (boss->health == 0) {
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
            if (boss->health == 0) {
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

// Result: bool, Cannon was rendered
static bool8 RenderCannon(EggBomberTank *boss)
{
    s32 ground;
    ExplosionPartsInfo explosion;
    s32 i;
    Sprite *s = &boss->cannon;
    SpriteTransform *transform = &boss->transform;
    bool8 wasRendered = FALSE;

    if (boss->unk77 == 0 || boss->cannonHealth != 0) {
        return FALSE;
    }

    boss->cannonAngle = (boss->cannonAngle + CANNON_MOVE_SPEED) & (SIN_PERIOD - 1);
    boss->unk5E += 0x40;

    boss->unk54 += boss->unk5C;
    boss->unk58 += boss->unk5E;

    ground = sub_801F100(I(boss->unk58) + 0x18, I(boss->unk54), 1, 8, sub_801EC3C);

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
            explosion.spawnX = (I(boss->unk54) - gCamera.x) + sExplositionPositions[i][0];
            explosion.spawnY = (I(boss->unk58) - gCamera.y) + sExplositionPositions[i][1];
            CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk76);
        }
        wasRendered = TRUE;
    } else if ((gStageTime & 3) == 0) {
        explosion.spawnX = (I(boss->unk54) - gCamera.x);
        explosion.spawnY = (I(boss->unk58) - gCamera.y);
        explosion.velocity = 0;
        explosion.rotation = 1000;
        explosion.speed = 0x200;
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;
        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk76);
    }

    s->x = (I(boss->unk54) - gCamera.x);
    s->y = (I(boss->unk58) - gCamera.y);
    s->frameFlags = gUnknown_030054B8++ | 0x2060;

    transform->rotation = boss->cannonAngle;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = s->x;
    transform->y = s->y;
    UpdateSpriteAnimation(s);
    TransformSprite(s, transform);
    DisplaySprite(s);

    return wasRendered;
}

static void HandleCannonBombTrigger(EggBomberTank *boss)
{
    s32 x, y;
    Sprite *s = &boss->cannon;

    if (HandleCannonCollision(boss) != 0) {
        boss->unk54 = QS(Div(boss->qWorldX, 256) - 8);
        boss->unk58 = QS(Div(boss->qWorldY, 256) - 22);
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

        INCREMENT_SCORE_B(500);

        if (!IS_FINAL_STAGE(gCurrentLevel)) {
            gMusicManagerState.unk1 = 0x11;
        }
    } else {
        if (boss->timer == 0) {
            x = QS(Div(boss->qWorldX, 256) - 8);
            y = QS(Div(boss->qWorldY, 256) - 22);
            x += (COS(boss->cannonAngle) * 0x32) >> 6;
            y += (SIN(boss->cannonAngle) * 50) >> 6;
            s = &boss->cannon;
            s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_CANNON;
            s->variant = 1;
            s->prevVariant = -1;

            boss->timer = 12;
            gCurTask->main = Task_BomberTankCannonReload;
            m4aSongNumStart(SE_241);
            CreateBomberTankBomb(boss, x, y, boss->cannonAngle, 64, sExplosionTimes[PseudoRandom32() & 0xF]);

        } else {
            boss->timer--;
        }
    }
}

static bool8 HandleCannonCollision(EggBomberTank *boss)
{
    s32 x, y;
    s32 dX, dY;

    s32 distance;
    u8 ret;

    dX = QS(Div(boss->qWorldX, 256) - 8);
    x = dX + ((COS(boss->cannonAngle) * 5) >> 3);

    dX = x - gPlayer.qWorldX;
    dX = I(dX);

    dY = QS(Div(boss->qWorldY, 256) - 22);
    y = dY + ((SIN(boss->cannonAngle) * 5) >> 3);

    dY = y - gPlayer.qWorldY;
    dY = I(dY);

    distance = (SQUARE(dY) + SQUARE(dX));

    ret = 0;
    Player_UpdateHomingPosition(x, y);

    if (boss->cannonHitTimer != 0) {
        return 0;
    }

    if (distance < 600) {
        Sprite *s = &gPlayer.spriteInfoBody->s;
        if (!PLAYER_IS_ALIVE || s->hitboxes[1].index == -1) {
            Player_CollisionDamage(&gPlayer);
            return 0;
        }

        if (boss->cannonHealth != 0) {
            boss->cannonHealth--;
        }

        if (boss->health & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        if (boss->cannonHealth == 0) {
            ret = 1;
        }

        Player_AdjustSpeedAfterBossCollision(&gPlayer);
        boss->cannonHitTimer = 30;
    }

    if (gCheese != NULL && gCheese->s.hitboxes[1].index != -1) {
        x -= gCheese->posX;
        x = I(x);
        y -= gCheese->posY;
        y = I(y);
        distance = SQUARE(y) + SQUARE(x);

        if (distance < 900) {
            if (boss->cannonHealth != 0) {
                boss->cannonHealth--;
            }

            if (boss->health & 1) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            if (boss->cannonHealth == 0) {
                ret = 1;
            }
            gCheeseTarget.task->unk15 = 0;
            boss->cannonHitTimer = 30;
        }
    }

    return ret;
}

static u8 CheckBossDestruction(EggBomberTank *boss, Player *player)
{
    Sprite *s = &boss->body;
    u8 ret = 0;

    if (boss->health == 0) {
        return 1;
    }

    Player_EnemyCollision(s, I(boss->qWorldX), I(boss->qWorldY), 1, player);
    if (Player_AttackBossCollision(s, I(boss->qWorldX), I(boss->qWorldY), 0, player) == 1) {
        if (boss->cannonHealth != 0) {
            Sprite *s = &boss->pilot;
            boss->unk73 = ZONE_TIME_TO_INT(0, 0.5);
            if (boss->bossHitTimer == 0) {

                s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }
            Player_CollisionDamage(player);
        } else {
            ret = HandleBossHit(boss);
        }
    } else {
        if (Player_EnemyCollision(s, I(boss->qWorldX), I(boss->qWorldY), 0, player) == 1) {
            Sprite *s = &boss->pilot;
            boss->unk73 = ZONE_TIME_TO_INT(0, 0.5);
            if (boss->bossHitTimer == 0) {

                s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }
            Player_CollisionDamage(player);
        }
    }

    Player_UpdateHomingPosition(boss->qWorldX, boss->qWorldY);

    if (boss->bossHitTimer == 0) {
        if (Cheese_IsSpriteColliding(s, I(boss->qWorldX), I(boss->qWorldY), 0, player) == 1 && boss->cannonHealth == 0) {
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
            init.spawnX = (I(boss->qWorldX) - gCamera.x) + ((rand * 0x22) & 63) - 0x34;
            rand = PseudoRandom32();
            init.spawnY = (I(boss->qWorldY) - gCamera.y) + ((rand * 0x34) & 63) - 0x30;
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
            init.spawnX = (I(boss->qWorldX) - gCamera.x) + (rand & 63) - 0x20;

            rand = PseudoRandom32();
            init.spawnY = (I(boss->qWorldY) - gCamera.y) + (rand & 63) - 0x20;
            init.velocity = 0x40;

            init.rotation = PseudoRandom32() & (SIN_PERIOD - 1);
            init.speed = 0x600;
            init.vram = (void *)OBJ_VRAM0 + (gTileInfoBossScrews[boss->unk75][0] * TILE_SIZE_4BPP);
            init.anim = gTileInfoBossScrews[boss->unk75][1];
            init.variant = gTileInfoBossScrews[boss->unk75][2];
            init.unk4 = 1;
            CreateBossParticleWithExplosionUpdate(&init, &boss->unk74);
        }
    }
}

void EggBomberTankMove(s32 dX, s32 dY)
{
    EggBomberTank *boss = TASK_DATA(gActiveBossTask);
    boss->qWorldX += dX;
    boss->qWorldY += dY;

    boss->qWheelPositions[0][0] += dX;
    boss->qWheelPositions[0][1] += dY;

    boss->qWheelPositions[1][0] += dX;
    boss->qWheelPositions[1][1] += dY;

    boss->qWheelPositions[2][0] += dX;
    boss->qWheelPositions[2][1] += dY;

    boss->unk54 += dX;
    boss->unk58 += dY;
}

static void Task_EggBomberTankIntro(void)
{
    EggBomberTank *boss = TASK_DATA(gCurTask);
    boss->qWorldX += 0x400 + boss->qSpeedX;
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
    boss->qWorldX += boss->qSpeedX;
    UpdateWheelPositions(boss);
    UpdateCannonAngle(boss);

    sBossModeTasks[boss->cannonHealth != 0 ? 0 : 1](boss);

    UpdatePilotAnimation(boss);
    RenderEggBomberTank(boss);
    UpdateBomberTankPalette(boss);

    if (CheckBossDestruction(boss, &gPlayer) != 0) {
        Player_DisableInputAndBossTimer();
        boss->timer = 259;
        gCurTask->main = Task_StartBossDestruction;
    }
}

static void Task_StartBossDestruction(void)
{
    u32 rand;
    EggBomberTank *boss = TASK_DATA(gCurTask);

    boss->qWorldX += boss->qSpeedX;
    UpdateWheelPositions(boss);
    UpdatePilotAnimation(boss);
    RenderEggBomberTank(boss);
    UpdateBomberTankPalette(boss);
    CreateDestructionExplosions(boss);

    rand = PseudoRandom32();
    if (Mod(gStageTime + rand, 21) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
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
    s32 x = I(boss->qWorldX) - gCamera.x;
    UpdatePosition(boss);
    RenderEscapeBomberTank(boss, 0);
    UpdateBomberTankPalette(boss);
    CreateDestructionExplosions(boss);

    rand = PseudoRandom32();

    if (Mod(gStageTime + rand, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
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
        s32 x = I(boss->qWorldX) + sBodyWheelPositionsX[i];
        s32 y = I(boss->qWheelPositions[i][1]) + 0x12;
        val += y;

        boss->qWheelPositions[i][1] += QS(sub_801F100(y, x, 1, 8, sub_801EC3C));
    }

    boss->qWorldY = QS(Div(val, 3)) - 0x1200;
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
        CreateBomberTankBomb(boss, boss->qWorldX - Q(8), boss->qWorldY - Q(22), DEG_TO_SIN(180), 8,
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
    boss->unk73 = ZONE_TIME_TO_INT(0, 0.5);
    if (boss->bossHitTimer == 0) {
        s->graphics.anim = SA2_ANIM_EGG_BOMBER_TANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void CreateBomberTankBomb(EggBomberTank *boss, s32 x, s32 y, u16 angle, u16 p5, u8 explosionTime)
{
    struct Task *t = TaskCreate(Task_EggBomberTankBombExplosion, sizeof(EggBomberTankBomb), 0x6100, 0, NULL);
    Sprite *s;
    EggBomberTankBomb *bomb = TASK_DATA(t);
    bomb->x = x - QS(gCamera.x);
    bomb->y = y - QS(gCamera.y);

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

    s->x = I(x);
    s->y = I(y);
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
        bomb->x -= bomb->speedX - QS(gCamera.dx);
        bomb->y += bomb->speedY + QS(gCamera.dy);
    }

    ground = sub_801E4E4(I(bomb->y) + 0xC + gCamera.y, I(bomb->x) + gCamera.x, 1, 8, &unusedByte, sub_801EE64);
    if (ground < 0) {
        bomb->y += QS(ground);
        bomb->speedY = Div(-(bomb->speedY * 8), 10);
    }

    s->x = I(bomb->x);
    s->y = I(bomb->y);

    if (bomb->boss->health != 0) {
        // If hit player
        if (Player_EnemyCollision(s, I(bomb->x) + gCamera.x, I(bomb->y) + gCamera.y, 0, &gPlayer) == 1) {
            if (bomb->boss->bossHitTimer == 0) {
                Sprite *s = &bomb->boss->pilot;
                bomb->boss->unk73 = ZONE_TIME_TO_INT(0, 0.5);

                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 1;
                s->prevVariant = -1;
            }

            bomb->explodeTimer = 1;
        }
    }

    bomb->explodeTimer--;

    if (bomb->explodeTimer == 0 || bomb->boss->health == 0) {
        ExplosionGraphics graphics;

        if (ground >= 16) {
            m4aSongNumStart(SE_242);
            graphics.vram = s->graphics.dest + 0x120;
            graphics.anim = SA2_ANIM_EXPLOSION_1;
            graphics.variant = 0;

            CreateBombExplosion(bomb->boss, I(bomb->x) + gCamera.x, I(bomb->y) + gCamera.y, graphics);
        } else {
            m4aSongNumStart(SE_243);
            graphics.vram = s->graphics.dest + 0x740;
            graphics.anim = SA2_ANIM_EXPLOSION_2;
            graphics.variant = 0;

            CreateBombExplosion(bomb->boss, I(bomb->x) + gCamera.x, I(bomb->y) + 0xF + ground + gCamera.y, graphics);
        }

        gCurTask->main = Task_EggBomberTankBombDestroy;
    } else {
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void CreateBombExplosion(EggBomberTank *boss, s32 x, s32 y, ExplosionGraphics graphics)
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
        explosion->x += gCamera.dx;
        explosion->y += gCamera.dy;
    }

    s->x = explosion->x;
    s->y = explosion->y;

    if (explosion->boss->health != 0) {
        if (Player_EnemyCollision(s, explosion->x + gCamera.x, explosion->y + gCamera.y, 0, &gPlayer) == 1) {
            if (explosion->boss->bossHitTimer == 0) {
                Sprite *s = &explosion->boss->pilot;
                explosion->boss->unk73 = ZONE_TIME_TO_INT(0, 0.5);
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
