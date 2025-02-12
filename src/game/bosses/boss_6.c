#include "core.h"
#include "task.h"
#include "sprite.h"
#include "trig.h"

#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/bosses/boss_6.h"
#include "game/bosses/common.h"
#include "game/bosses/eggmobile_escape_sequence.h"

#include "game/stage/boss_results_transition.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/collision.h"
#include "game/player_callbacks.h"

#include "constants/move_states.h"
#include "constants/animations.h"
#include "constants/songs.h"

#define NUM_PLATFORMS      4
#define NUM_LINKS          3
#define NUM_PROJECTILES    3
#define NUM_PLATFORM_TYPES 2

// TODO: why did they do this when they could have used boss->speedX
#define BOSS_X_SPEED Q(5)

typedef struct {
    u8 timer;
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;
} ProjectilePosition;

typedef struct {
    Sprite s;
    Hitbox reserved;
    SpriteTransform transform;
} Platform;

typedef struct {
    s32 x;
    s32 y;
    s32 speedX;
    s32 speedY;
    s32 unk10;
} DestructionProp;

typedef struct {
    DestructionProp cabin;

    // Both of these are set but never read
    DestructionProp platforms[NUM_PLATFORMS];
    DestructionProp platformLinks[NUM_PLATFORMS][NUM_LINKS];

    u8 explosionState;
    u8 unk1C1;

} DestructionProps;

typedef struct {
    u32 timer;
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;

    s32 rotationSpeed;
    u32 rotation;
    u32 platformRotation;
    s16 unk1C;
    u16 unk1E;
    u16 platformRotSpeed;
    u16 unk22;
    u8 unk24;
    u8 state;
    u8 unk26;
    u8 unk27;
    u8 health;
    u8 unk29;
    u8 invincibilityTimer;

    // Used to give the illusion the links are connected when rotation
    // speeds up and slows down
    s8 linkRotOffset;

    s32 prevPlatformXPositions[NUM_PLATFORMS];
    ProjectilePosition projectilePositions[NUM_PROJECTILES];

    DestructionProps destructionProps;

    Sprite cabin;
    Hitbox reserved0;

    Sprite pilot;
    Sprite link;

    Platform platforms[NUM_PLATFORMS];

    Sprite gun;
    Sprite projectile;

} EggGoRound; /* 0x3CC */

static void Task_IntroRollIn(void);
static void TaskDestructor_EggGoRound(struct Task *);
static void Task_DestructionCutScene1(void);

static void UpdatePilotAnim(EggGoRound *);
static void Render(EggGoRound *);
static void SetPalette(EggGoRound *);
static void UpdatePos(EggGoRound *);
static void sub_804683C(EggGoRound *);
static void sub_8046C28(EggGoRound *);
static void HandleCollisions(EggGoRound *);

static void sub_804732C(EggGoRound *);
static void sub_8046F00(EggGoRound *);
static void Task_DestructionCutScene3(void);
static void sub_8047940(EggGoRound *boss);
static void UpdateIntroPos(EggGoRound *boss);
static void Task_HandleDestroy(void);

static void UpdateDestructionPropPositions(EggGoRound *);
static void UpdatePilotAnim(EggGoRound *);
static void sub_8047138(EggGoRound *);
static void RenderDestructionProps(EggGoRound *);
static void Task_DestructionCutScene2(void);

static void sub_804655C(EggGoRound *, u8);
static void UpdateProjectiles(EggGoRound *);
static void sub_8047060(EggGoRound *);

static const u8 sLinkPositions[NUM_LINKS + 1] = {
    30,
    42,
    54,
    66,
};

static const TileInfo sPlatformAnimations[NUM_PLATFORM_TYPES] = {
    { 24, SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM, 0 },
    { 64, SA2_ANIM_EGG_GO_ROUND_PLATFORM, 0 },
};

static const u8 sStateChoices[] = {
    0, 0, 0, 1, 1, 1, 1, 2, 3, 3,
};

static const u16 gUnknown_080D804E[][10] = {
    { 120, 120, 180, 180, 180, 180, 240, 240, 240, 300 },
    { 120, 120, 120, 120, 120, 180, 180, 180, 240, 240 },
};

static const u16 gUnknown_080D8076[][10] = {
    { 11565, 11565, 16384, 16384, 16384, 16384, 22866, 22866, 22866, 27531 },
    { 11565, 11565, 11565, 11565, 11565, 16384, 16384, 16384, 22866, 22866 },
};

static const u16 gUnknown_080D809E[][10] = {
    { 257, 257, 256, 256, 256, 256, 222, 222, 222, 207 },
    { 257, 257, 257, 257, 257, 256, 256, 256, 222, 222 },
};

static const u16 sPalettes[][16] = {
    INCBIN_U16("graphics/80D80C6.gbapal"), // hit palette
    INCBIN_U16("graphics/80D80E6.gbapal"), // normal palette
};

void CreateEggGoRound(void)
{
    u8 i;
    EggGoRound *boss;
    Sprite *s;
    void *vrams[NUM_PLATFORM_TYPES];
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;

    gPlayerBodyPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerBodyPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

    gPlayerLimbsPSI.s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    gPlayerLimbsPSI.s.frameFlags |= SPRITE_FLAG(PRIORITY, 1);

    gPlayer.stoodObj = NULL;
    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;

    gActiveBossTask = TaskCreate(Task_IntroRollIn, sizeof(EggGoRound), 0x4000, 0, TaskDestructor_EggGoRound);
    boss = TASK_DATA(gActiveBossTask);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->health = 6;
    } else {
        boss->health = 8;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->health = boss->health / 2;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->x = Q(29076);
        boss->y = Q(100);
    } else {
        boss->x = Q(900);
        boss->y = Q(150);
    }

    boss->speedX = BOSS_X_SPEED;
    boss->speedY = 0;
    boss->unk29 = 0;
    boss->invincibilityTimer = 0;
    boss->rotation = 0;
    boss->platformRotation = 0;
    boss->unk27 = 0;
    boss->unk1E = 0;
    boss->unk26 = 0;
    boss->platformRotSpeed = 0;
    boss->unk24 = 0;
    boss->state = 0;
    boss->prevPlatformXPositions[0] = 0;
    boss->prevPlatformXPositions[1] = 0;
    boss->prevPlatformXPositions[2] = 0;
    boss->prevPlatformXPositions[3] = 0;
    boss->timer = 128;
    boss->rotationSpeed = Q(12);
    boss->linkRotOffset = 0xE0;
    boss->unk22 = 0x1C2;

    for (i = 0; i < NUM_LINKS; i++) {
        ProjectilePosition *projPos = &boss->projectilePositions[i];
        projPos->timer = 0;
        projPos->x = 0;
        projPos->y = 0;
        projPos->speedX = 0;
        projPos->speedY = 0;
    }

    s = &boss->projectile;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_EGG_GO_ROUND_PROJECTILE, 0, 6, 1);

    s = &boss->gun;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_EGG_GO_ROUND_GUN, 0, 7, 1);

    s = &boss->cabin;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 42, SA2_ANIM_EGG_GO_ROUND_CABIN, 1, 20, 1);

    s = &boss->pilot;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(8);
    s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    s = &boss->link;
    s->x = 0;
    s->y = 0;
    SPRITE_INIT(s, 4, SA2_ANIM_EGG_GO_ROUND_LINK, 0, 22, 1);
    UpdateSpriteAnimation(s);

    for (i = 0; i < 2; i++) {
        s = &boss->platforms[i].s;
        s->x = 0;
        s->y = 0;

        s->graphics.dest = VramMalloc(sPlatformAnimations[i].numTiles);
        vrams[i] = s->graphics.dest;
        s->graphics.anim = sPlatformAnimations[i].anim;
        s->variant = sPlatformAnimations[i].variant;

        s->oamFlags = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
        UpdateSpriteAnimation(s);
    }

    for (; i < NUM_PLATFORMS; i++) {
        s = &boss->platforms[i].s;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = vrams[i % NUM_PLATFORM_TYPES];
        s->graphics.anim = sPlatformAnimations[i % NUM_PLATFORM_TYPES].anim;
        s->variant = sPlatformAnimations[i % NUM_PLATFORM_TYPES].variant;

        s->oamFlags = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
        UpdateSpriteAnimation(s);
    }
}

static void sub_8045E78(EggGoRound *boss)
{
    if (--boss->unk22 < 106) {
        if (boss->unk22 > 90 && boss->unk22 < 106) {
            Sprite *s = &boss->gun;
            s->x = I(boss->x) - gCamera.x;
            s->y = I(boss->y) - gCamera.y;
            if (boss->unk22 == 45) {
                s->prevVariant = -1;
            }
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
            return;
        }

        if (boss->unk22 == 0) {
            if (boss->health < 5) {
                boss->unk22 = 320;
            } else {
                boss->unk22 = 450;
            }
        }

        if (Mod(boss->unk22, 30) == 0) {
            u8 i;
            u16 targetAngle = sub_8004418(I(gPlayer.qWorldY - boss->y), I(gPlayer.qWorldX - boss->x));

            for (i = 0; i < NUM_PROJECTILES; i++) {
                ProjectilePosition *projPos = &boss->projectilePositions[i];
                if (projPos->timer == 0) {
                    s32 sin;
                    projPos->x = boss->x;
                    projPos->y = boss->y + Q(14);
                    sin = COS(targetAngle & (SIN_PERIOD - 1));
                    projPos->speedX = sin >> 5;
                    sin = SIN(targetAngle & (SIN_PERIOD - 1));
                    projPos->speedY = sin >> 5;
                    projPos->timer = 255;
                    return;
                }
            }
        }
    }
}

static void UpdateProjectiles(EggGoRound *boss)
{

    Sprite *s = &boss->projectile;
    bool32 animUpdated = FALSE;
    u8 i;

    for (i = 0; i < NUM_PROJECTILES; i++) {
        ProjectilePosition *projPos = &boss->projectilePositions[i];

        if (projPos->timer != 0) {
            projPos->timer--;

            if (!PLAYER_IS_ALIVE) {
                projPos->x += projPos->speedX;
            } else {
                projPos->x += projPos->speedX + BOSS_X_SPEED;
            }
            projPos->y += projPos->speedY;

            if (!animUpdated) {
                UpdateSpriteAnimation(s);
                animUpdated = TRUE;
            }

            if (boss->health > 0) {
                sub_800C84C(s, I(projPos->x), I(projPos->y));
            }

            s->x = I(projPos->x) - gCamera.x;
            s->y = I(projPos->y) - gCamera.y;
            DisplaySprite(s);
        }
    }
}

static void Task_Main(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    UpdatePos(boss);
    sub_804683C(boss);
    sub_8046C28(boss);
    HandleCollisions(boss);
    sub_8045E78(boss);
    UpdateProjectiles(boss);
    UpdatePilotAnim(boss);
    Render(boss);
    SetPalette(boss);

    if (boss->health == 0) {
        boss->linkRotOffset = 0;
        boss->rotationSpeed = 0;
        boss->timer = 128;
        boss->destructionProps.explosionState = 0;

        gPlayer.stoodObj = NULL;
        gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        gPlayer.moveState |= MOVESTATE_IN_AIR;

        Player_DisableInputAndBossTimer();
        gCurTask->main = Task_DestructionCutScene1;
    }
}

static void Task_DestructionCutScene1(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    s32 idx;
    if (Mod(gStageTime, 21) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    if (boss->timer >= 64) {
        idx = CLAMP_SIN_PERIOD((boss->timer - 64) * 256);

    } else {
        idx = 0;
    }

    boss->linkRotOffset = SIN(idx) >> 12;

    UpdatePos(boss);
    UpdateProjectiles(boss);
    UpdatePilotAnim(boss);
    sub_804655C(boss, 0);
    SetPalette(boss);
    sub_8047060(boss);

    gPlayer.stoodObj = NULL;
    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;

    if (--boss->timer == 0) {
        boss->linkRotOffset = 0;
        boss->rotationSpeed = 0;
        boss->timer = 128;
        gCurTask->main = Task_DestructionCutScene2;
    }
}

static void Task_DestructionCutScene2(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    s32 idx;
    if (Mod(gStageTime, 17) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }
    idx = CLAMP_SIN_PERIOD(boss->timer * 256);
    boss->linkRotOffset = SIN(idx) >> 12;
    boss->rotationSpeed = 0;
    UpdatePos(boss);
    UpdateProjectiles(boss);
    UpdatePilotAnim(boss);
    sub_804655C(boss, 1);
    SetPalette(boss);
    sub_8046F00(boss);
    sub_8047060(boss);

    if (--boss->timer == 0) {
        boss->destructionProps.unk1C1 = 0;
        sub_804732C(boss);
        gCurTask->main = Task_DestructionCutScene3;
    }
}

static void Task_DestructionCutScene3(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    DestructionProps *destruction = &boss->destructionProps;
    UpdateDestructionPropPositions(boss);
    UpdatePilotAnim(boss);
    RenderDestructionProps(boss);
    SetPalette(boss);
    sub_8047138(boss);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    if (boss->destructionProps.unk1C1 == 0 && (I(destruction->cabin.x) - gCamera.x) < 50) {
        u32 flags = boss->pilot.frameFlags;
        flags &= SPRITE_FLAG_MASK_X_FLIP;
        flags |= SPRITE_FLAG(PRIORITY, 1);
        boss->destructionProps.unk1C1 = 1;
        CreateEggmobileEscapeSequence(I(destruction->cabin.x) - gCamera.x, I(destruction->cabin.y) - gCamera.y - 15, flags);
    }

    // when off screen
    if (I(boss->destructionProps.cabin.x) - gCamera.x < -200 && boss->destructionProps.unk1C1 != 0) {
        sub_802EF68(-40, 150, 5);
        // destroy the task on the next frame
        gCurTask->main = Task_HandleDestroy;
    }
}

static void Render(EggGoRound *boss)
{
    u8 i, j;
    Sprite *s = &boss->cabin;
    u32 idx;

    s->x = I(boss->x) - gCamera.x;
    s->y = I(boss->y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->pilot;
    s->x = I(boss->x) - gCamera.x;
    s->y = I(boss->y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < NUM_PLATFORMS; i++) {
        idx = ((u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16);
        s = &boss->link;
        for (j = 0; j < NUM_LINKS; j++) {
            s->x = (I(boss->x) - gCamera.x) + ((sLinkPositions[j] * COS(CLAMP_SIN_PERIOD(idx + (j * boss->linkRotOffset)))) >> 14);
            s->y = (I(boss->y) - gCamera.y) + ((sLinkPositions[j] * SIN(CLAMP_SIN_PERIOD(idx + (j * boss->linkRotOffset)))) >> 14);
            DisplaySprite(s);
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        s = &boss->platforms[i].s;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        u8 platformPos = sLinkPositions[ARRAY_COUNT(sLinkPositions) - 1];
        idx = ((u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16);
        idx = CLAMP_SIN_PERIOD(idx + (boss->linkRotOffset * NUM_LINKS));
        s = &boss->platforms[i].s;

        s->x = (I(boss->x) - gCamera.x) + ((COS(idx) * platformPos) >> 14);
        s->y = (I(boss->y) - gCamera.y) + ((SIN(idx) * platformPos) >> 14);

        if (boss->unk1E != 0 && boss->unk24 == 0 && (i % 2) && (boss->state == 1 || boss->state == 2)) {
            SpriteTransform *transform = &boss->platforms[i].transform;
            transform->rotation = I(boss->platformRotation);
            transform->qScaleX = Q(1);
            transform->qScaleY = Q(1);
            transform->x = s->x;
            transform->y = s->y;

            s->frameFlags = gUnknown_030054B8++ | 0x1020;
            TransformSprite(s, transform);
        } else {
            s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
        }
        DisplaySprite(s);
    }
}

static void sub_804655C(EggGoRound *boss, u8 val)
{
    Sprite *s = &boss->cabin;
    u8 temp;
    u8 i, j;
    u32 idx;

    s->x = I(boss->x) - gCamera.x;
    s->y = I(boss->y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &boss->pilot;
    s->x = I(boss->x) - gCamera.x;
    s->y = I(boss->y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->timer < 48 && val != 0) {
        temp = (Div(48 - boss->timer, 16)) + 1;
    } else {
        temp = 0;
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        idx = ((u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16);
        s = &boss->link;
        for (j = temp; j < NUM_LINKS; j++) {
            if (j & 1) {
                s->x = (I(boss->x) - gCamera.x) + ((sLinkPositions[j] * COS(CLAMP_SIN_PERIOD(idx + (j * boss->linkRotOffset)))) >> 14);
                s->y = (I(boss->y) - gCamera.y) + ((sLinkPositions[j] * SIN(CLAMP_SIN_PERIOD(idx + (j * boss->linkRotOffset)))) >> 14);
            } else {
                s->x = (I(boss->x) - gCamera.x) + ((sLinkPositions[j] * COS(CLAMP_SIN_PERIOD(idx - (j * boss->linkRotOffset)))) >> 14);
                s->y = (I(boss->y) - gCamera.y) + ((sLinkPositions[j] * SIN(CLAMP_SIN_PERIOD(idx - (j * boss->linkRotOffset)))) >> 14);
            }

            DisplaySprite(s);
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        s = &boss->platforms[i].s;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        u8 platformPos = sLinkPositions[ARRAY_COUNT(sLinkPositions) - 1];
        idx = ((u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16);
        idx = CLAMP_SIN_PERIOD(idx + (boss->linkRotOffset * NUM_LINKS));
        s = &boss->platforms[i].s;

        s->x = (I(boss->x) - gCamera.x) + ((COS(idx) * platformPos) >> 14);
        s->y = (I(boss->y) - gCamera.y) + ((SIN(idx) * platformPos) >> 14);

        if (boss->unk1E != 0 && boss->unk24 == 0 && (i % 2) && (boss->state == 1 || boss->state == 2)) {
            SpriteTransform *transform = &boss->platforms[i].transform;
            transform->rotation = I(boss->platformRotation);
            transform->qScaleX = Q(1);
            transform->qScaleY = Q(1);
            transform->x = s->x;
            transform->y = s->y;

            s->frameFlags = gUnknown_030054B8++ | 0x1020;
            TransformSprite(s, transform);
        } else {
            s->frameFlags = SPRITE_FLAG(PRIORITY, 1);
        }
        DisplaySprite(s);
    }
}

static void sub_804683C(EggGoRound *boss)
{
    Sprite *s;

    if (boss->unk1E != 0) {
        if (boss->unk24 != 0) {
            if (--boss->unk24 == 0) {
                switch (boss->state) {
                    case 0:
                        m4aSongNumStart(SE_255);
                        s = &boss->platforms[0].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;

                        s = &boss->platforms[2].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;
                        break;

                    case 1:
                        m4aSongNumStart(SE_255);
                        s = &boss->platforms[1].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;

                        s = &boss->platforms[3].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;
                        break;

                    case 2:
                        m4aSongNumStart(SE_255);
                        s = &boss->platforms[0].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;

                        s = &boss->platforms[2].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                        s->variant = 3;
                        s->prevVariant = -1;

                        s = &boss->platforms[1].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;

                        s = &boss->platforms[3].s;
                        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                        s->variant = 1;
                        s->prevVariant = -1;
                        break;
                }
            }
        } else {
            if (boss->unk27 == 0) {
                boss->platformRotSpeed += gUnknown_080D809E[(boss->health < 5) ? 1 : 0][boss->unk26];
                if (boss->platformRotSpeed == gUnknown_080D8076[boss->health < 5 ? 1 : 0][boss->unk26]) {
                    boss->unk27 = 1;
                }
            } else if (boss->unk27 == 1) {
                boss->platformRotSpeed -= gUnknown_080D809E[boss->health < 5 ? 1 : 0][boss->unk26];

                if (boss->platformRotSpeed == 0) {
                    boss->unk27 = 2;
                    boss->platformRotation = 0;
                    boss->platformRotSpeed = 0;
                }
            }
        }

        boss->platformRotation = (boss->platformRotation + boss->platformRotSpeed) % (unsigned)Q(1024);
        if (--boss->unk1E == 0) {
            u8 i;
            for (i = 0; i < NUM_PLATFORMS; i++) {
                s = &boss->platforms[i].s;
                s->graphics.anim = sPlatformAnimations[i % 2].anim;
                s->variant = 0;
                s->prevVariant = -1;
            }
            boss->unk27 = 0;
            boss->platformRotation = 0;
            boss->platformRotSpeed = 0;
        }
    } else {
        boss->state = sStateChoices[Mod(PseudoRandBetween(0, 256), ARRAY_COUNT(sStateChoices))];
        boss->unk26 = Mod(PseudoRandBetween(0, 256), 10);

        boss->unk1E = gUnknown_080D804E[boss->health < 5 ? 1 : 0][boss->unk26];
        boss->unk24 = 30;

        switch (boss->state) {
            case 0:
                m4aSongNumStart(SE_254);
                s = &boss->platforms[0].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->platforms[2].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;
                break;

            case 1:
                m4aSongNumStart(SE_254);
                s = &boss->platforms[1].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->platforms[3].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;
                break;

            case 2:
                m4aSongNumStart(SE_254);
                s = &boss->platforms[0].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->platforms[2].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->platforms[1].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;

                s = &boss->platforms[3].s;
                s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PLATFORM;
                s->variant = 2;
                s->prevVariant = -1;
                break;
        }
    }
}

static void sub_8046C28(EggGoRound *boss)
{
    if (boss->health != 0) {
        u8 i;

        for (i = 0; i < NUM_PLATFORMS; i++) {
            u8 platformPos = sLinkPositions[ARRAY_COUNT(sLinkPositions) - 1];
            u32 idx = CLAMP_SIN_PERIOD(((u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16) + (boss->linkRotOffset * NUM_LINKS));
            Sprite *s = &boss->platforms[i].s;
            s32 x = I(boss->x) + ((COS(idx) * platformPos) >> 14);
            s32 y = I(boss->y) + ((SIN(idx) * platformPos) >> 14);

            if (boss->unk1E != 0 && boss->unk24 == 0 && (i % 2) && (boss->state == 1 || boss->state == 2)
                && ((gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) && gPlayer.stoodObj == s)) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.moveState &= ~MOVESTATE_100;
                gPlayer.moveState |= 2;
                gPlayer.stoodObj = NULL;
                gPlayer.qSpeedAirX += BOSS_X_SPEED;
                gPlayer.qSpeedGround += BOSS_X_SPEED;
                gPlayer.qSpeedAirY = -Q(2);
                continue;
            }

            if (boss->unk1E == 0 || boss->unk24 != 0 || !(i % 2) || (boss->state != 1 && boss->state != 2)) {
                u32 val;
                u8 someBool;
                s32 speedAirY;

                if (gPlayer.stoodObj == s) {
                    someBool = TRUE;
                } else {
                    someBool = FALSE;
                }
                speedAirY = gPlayer.qSpeedAirY;

                if (gPlayer.moveState & MOVESTATE_IN_AIR || (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ && gPlayer.stoodObj == s)) {
                    val = sub_800CCB8(s, x, y, &gPlayer);
                } else {
                    val = 0;
                }

                if (val & 0x10000) {
                    if (!someBool && gPlayer.stoodObj == s && speedAirY > 0) {
                        gPlayer.qSpeedAirX -= BOSS_X_SPEED;
                        gPlayer.qSpeedGround -= BOSS_X_SPEED;
                    }

                    if (boss->unk1E != 0 && !boss->unk24 && !(i % 2) && (boss->state == 0 || boss->state == 2)) {
                        sub_8047940(boss);
                        sub_800CBA4(&gPlayer);
                        return;
                    }

                    gPlayer.qWorldY += Q(2) + Q_8_8(val);
                    if (boss->prevPlatformXPositions[i] != 0) {
                        gPlayer.qWorldX += Q(x - (boss->prevPlatformXPositions[i]));
                    }
                } else if (someBool) {
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    gPlayer.stoodObj = NULL;
                    if (!(gPlayer.moveState & MOVESTATE_100)) {
                        gPlayer.moveState &= ~MOVESTATE_100;
                        gPlayer.moveState |= MOVESTATE_IN_AIR;
                    }
                }
            }

            boss->prevPlatformXPositions[i] = x;
        }
    }
}

static void RenderDestructionProps(EggGoRound *boss)
{
    u8 i, j;
    DestructionProps *destruction = &boss->destructionProps;
    Sprite *s = &boss->cabin;
    s->x = I(destruction->cabin.x) - gCamera.x;
    s->y = I(destruction->cabin.y) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->destructionProps.unk1C1 == 0) {
        s = &boss->pilot;
        s->x = I(destruction->cabin.x) - gCamera.x;
        s->y = I(destruction->cabin.y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    // not in the rom but this code may have existed
    // for (i = 0; i < NUM_PLATFORMS; i++) {
    //     s = &boss->platforms[i].s;
    //     s->x = I(destruction->platforms[i].x) - gCamera.x;
    //     s->y = I(destruction->platforms[i].y) - gCamera.y;
    //     UpdateSpriteAnimation(s);
    //     DisplaySprite(s);

    //     for (j = 0; j < NUM_LINKS; j++) {
    //         s = &boss->link;
    //         s->x = I(destruction->platformLinks[i][j].x) - gCamera.x;
    //         s->y = I(destruction->platformLinks[i][j].y) - gCamera.y;
    //         UpdateSpriteAnimation(s);
    //         DisplaySprite(s);
    //     }
    // }
}

static void sub_8046F00(EggGoRound *boss)
{
    ExplosionPartsInfo explosion;
    DestructionProps *destruction = &boss->destructionProps;
    if (boss->timer < 50) {
        u8 i;
        u8 temp = Div(49 - boss->timer, 16);
        if (49 - (temp * 16) != boss->timer) {
            return;
        }

        m4aSongNumStart(SE_EXPLOSION);

        for (i = 0; i < NUM_PLATFORMS; i++) {
            u8 j;

            u16 idx = ((u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16);
            s16 x = ((I(boss->x) - gCamera.x) + ((sLinkPositions[temp] * COS(idx)) >> 14));
            s16 y = ((I(boss->y) - gCamera.y) + ((sLinkPositions[temp] * SIN(idx)) >> 14));
            for (j = 0; j < NUM_LINKS; j++) {
                u32 rand;

                rand = PseudoRandom32();
                explosion.spawnX = x + (rand % 16) - 8;

                rand = PseudoRandom32();
                explosion.spawnY = y + (rand % 16) - 8;

                explosion.velocity = 0;
                rand = PseudoRandom32();
                explosion.rotation = idx - (rand % 64) + 31;
                explosion.speed = Q(10) - (j * Q(2));
                explosion.vram = (void *)OBJ_VRAM0 + (0x2980);
                explosion.anim = SA2_ANIM_EXPLOSION;
                explosion.variant = 0;
                explosion.unk4 = 0;

                CreateBossParticleWithExplosionUpdate(&explosion, &destruction->explosionState);
            }
        }
    }
}

static void sub_8047060(EggGoRound *boss)
{
    if ((gStageTime % 16) == 0) {
        u32 rand;
        s16 x, y;

        ExplosionPartsInfo explosion;
        x = (I(boss->x) - gCamera.x);
        y = (I(boss->y) - gCamera.y);
        rand = PseudoRandom32();
        explosion.spawnX = x + (rand % 64) - 31;

        rand = PseudoRandom32();
        explosion.spawnY = y + (rand % 64) - 31;

        explosion.velocity = 0;
        explosion.rotation = ({ 1031 - ((PseudoRandom32() % 64u)); });
        explosion.speed = ({ Q(4) - (PseudoRandom32() % (unsigned)Q(2)); });
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&explosion, &boss->destructionProps.explosionState);
    }
}

static void sub_8047138(EggGoRound *boss)
{
    DestructionProps *destruction = &boss->destructionProps;
    if (Mod(gStageTime, 10) == 0 && destruction->unk1C1 == 0) {
        u32 rand;
        s16 x, y;

        ExplosionPartsInfo explosion;
        x = (I(destruction->cabin.x) - gCamera.x);
        y = (I(destruction->cabin.y) - gCamera.y);
        rand = PseudoRandom32();
        explosion.spawnX = x + (rand % 64) - 31;

        rand = PseudoRandom32();
        explosion.spawnY = y + (rand % 64) - 31;

        explosion.velocity = 0;
        explosion.rotation = ({ 1031 - ((PseudoRandom32() % 64u)); });
        explosion.speed = ({ Q(4) - (PseudoRandom32() % (unsigned)Q(2)); });
        explosion.vram = (void *)OBJ_VRAM0 + 0x2980;
        explosion.anim = SA2_ANIM_EXPLOSION;
        explosion.variant = 0;
        explosion.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&explosion, &boss->destructionProps.explosionState);
    }
}

void EggGoRoundMove(s32 dX, s32 dY)
{
    DestructionProps *destruction;
    EggGoRound *boss;

    u8 j, i;

    boss = TASK_DATA(gActiveBossTask);
    destruction = &boss->destructionProps;

    boss->x += dX;
    boss->y += dY;
    destruction->cabin.x += dX;
    destruction->cabin.y += dY;

    for (i = 0; i < NUM_PLATFORMS; i++) {
        for (j = 0; j < NUM_LINKS; j++) {
            destruction->platformLinks[i][j].x += dX;
            destruction->platformLinks[i][j].y += dY;
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        destruction->platforms[i].x = dX;
        destruction->platforms[i].y = dY;
        boss->prevPlatformXPositions[i] = 0;
    }

    for (i = 0; i < NUM_PROJECTILES; i++) {
        ProjectilePosition *projPos = &boss->projectilePositions[i];
        projPos->x += dX;
        projPos->y += dY;
    }
}

static void sub_804732C(EggGoRound *boss)
{
    u8 j, i;

// solves some stack issue
#ifndef NON_MATCHING
    DestructionProps *destruction_2;
#endif
    DestructionProps *destruction;

    u32 idx;

    destruction = &boss->destructionProps;
    boss->unk1C = 0;
#ifndef NON_MATCHING
    destruction_2 = destruction;
#endif
    destruction->cabin.x = boss->x;
    destruction->cabin.y = boss->y;
    destruction->cabin.speedX = Q(5.5);
    destruction->cabin.speedY = 0;
    destruction->cabin.unk10 = 300;

    for (i = 0; i < NUM_PLATFORMS; i++) {
        idx = (u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16;

        for (j = 0; j < NUM_LINKS; j++) {
#ifndef NON_MATCHING
            destruction_2->platformLinks[i][j].x = boss->x + ((sLinkPositions[j] * COS(idx)) >> 6);
            destruction_2->platformLinks[i][j].y = boss->y + ((sLinkPositions[j] * SIN(idx)) >> 6);
#else
            destruction->platformLinks[i][j].x = boss->x + ((sLinkPositions[j] * COS(idx)) >> 6);
            destruction->platformLinks[i][j].y = boss->y + ((sLinkPositions[j] * SIN(idx)) >> 6);
#endif
            destruction->platformLinks[i][j].speedX = (7 - j) * 20;
            destruction->platformLinks[i][j].speedY = 1;
            destruction->platformLinks[i][j].unk10 = idx;
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        u8 platformPos = sLinkPositions[ARRAY_COUNT(sLinkPositions) - 1];
        idx = (u32)((boss->rotation + (i << 0x10)) << 0xE) >> 0x16;
        destruction->platforms[i].x = boss->x + (platformPos * (COS(idx)) >> 6);
        destruction->platforms[i].y = boss->y + (platformPos * (SIN(idx)) >> 6);
        destruction->platforms[i].speedX = (6 - j) * 20;
        destruction->platforms[i].speedY = 1;
        destruction->platforms[i].unk10 = idx;
    }
}

bool32 HandleHit(EggGoRound *boss)
{
    Sprite *s = &boss->pilot;
    bool32 result = FALSE;
    if (boss->health > 0) {
        boss->health--;
        if (boss->health & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->invincibilityTimer = 30;
        if (boss->health == 0) {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 3;
            INCREMENT_SCORE(1000);
        } else {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 0;
        }
        s->prevVariant = -1;

    } else {
        result = TRUE;
    }

    if (!IS_FINAL_STAGE(gCurrentLevel) && boss->health == 4) {
        gMusicManagerState.unk1 = 0x11;
    }

    return result;
}

static void UpdatePilotAnim(EggGoRound *boss)
{
    Sprite *s = &boss->pilot;

    if (boss->invincibilityTimer > 0) {
        boss->unk29 = 0;
        if (--boss->invincibilityTimer > 0) {
            return;
        }

        if (boss->health == 0) {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 3;
        } else {
            s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s->variant = 0;
        }
        s->prevVariant = -1;
        return;
    }

    if (boss->unk29 == 0) {
        return;
    }

    if (--boss->unk29 != 0) {
        return;
    }

    s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
    s->variant = 0;
    s->prevVariant = -1;
}

static void SetPalette(EggGoRound *boss)
{
    u8 i;
    if (boss->invincibilityTimer > 0) {
        for (i = 0; i < 16; i++) {
            gObjPalette[128 + i] = sPalettes[(gStageTime & 2) / 2][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[128 + i] = sPalettes[1][i];
        }
    }

    gFlags |= 2;
}

static void HandleCollisions(EggGoRound *boss)
{
    Sprite *s = &boss->cabin;
    s32 x = I(boss->x);
    s32 y = I(boss->y);

    Player_UpdateHomingPosition(boss->x, boss->y);

    if (sub_800C320(s, x, y, 1, &gPlayer) != 0) {
        if (gPlayer.qWorldX > boss->x) {
            gPlayer.qSpeedAirX += Q(2.25);
            gPlayer.qWorldX += Q(2);
        }

        gPlayer.qSpeedAirY += Q(2);
        return;
    }

    if (boss->invincibilityTimer > 0) {
        return;
    }

    if (IsColliding_Cheese(s, x, y, 0, &gPlayer) == TRUE || sub_800C320(s, x, y, 0, &gPlayer) == TRUE) {
        HandleHit(boss);
        return;
    }

    if (sub_800CA20(s, x, y, 0, &gPlayer) == TRUE) {
        Sprite *s2 = &boss->pilot;

        boss->unk29 = 30;

        // always true
        if (boss->invincibilityTimer == 0) {
            s2->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s2->variant = 1;
            s2->prevVariant = -1;
        }
    }
}

static void Task_IntroRollIn(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    UpdateIntroPos(boss);
    UpdatePilotAnim(boss);
    Render(boss);

    if (boss->timer < 64) {
        if (boss->timer & 1) {
            boss->linkRotOffset++;
        }
        boss->rotationSpeed -= Q(0.171875);
        boss->rotationSpeed -= (boss->timer - Q(0.125)) * 4;
    }

    if (--boss->timer == 0) {
        boss->linkRotOffset = 0;
        boss->rotationSpeed = Q(1);
        gCurTask->main = Task_Main;
    }
}

static void Task_HandleDestroy(void) { TaskDestroy(gCurTask); }

static void UpdateIntroPos(EggGoRound *boss)
{
    boss->x += boss->speedX + (boss->timer * 8);
    boss->y += boss->speedY;
    boss->y += Q(sub_801E4E4(I(boss->y), I(boss->x), 0, 8, 0, sub_801EE64));
    boss->rotation = (boss->rotation + boss->rotationSpeed) % (unsigned)Q(1024);
}

static void UpdatePos(EggGoRound *boss)
{
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    boss->y += Q(sub_801F07C(I(boss->y), I(boss->x), 0, 8, 0, sub_801EE64));
    boss->rotation = (boss->rotation + boss->rotationSpeed) % (unsigned)Q(1024);

    if (boss->health < 5 && boss->rotationSpeed != -256) {
        boss->rotationSpeed--;
    }
}

static void sub_8047940(EggGoRound *boss)
{
    Sprite *s = &boss->pilot;
    boss->unk29 = 30;
    if (boss->invincibilityTimer == 0) {
        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

// this doesn't need to be an inline function but it matches
// and may have been what they did to handle the other prop
// positions
static inline void UpdatePropPos(DestructionProp *prop)
{
    s32 result;
    prop->speedY += Q(0.1875);
    prop->x += prop->speedX;
    prop->y += prop->speedY;

    result = sub_801F100(I(prop->y) + 20, I(prop->x), 1, 8, sub_801EC3C);
    if (result < 0) {
        u32 temp;
        prop->speedX -= Q(0.25);
        if (prop->speedX < 0) {
            prop->speedX = 0;
        }

        temp = prop->speedY * 9;
        temp *= 4;
        temp -= prop->speedY;
        temp *= 2;

        prop->speedY = Div(-temp, 100);
        prop->y += Q(result);
    }
}

static void UpdateDestructionPropPositions(EggGoRound *boss)
{
    u8 i, j;
    DestructionProps *destruction = &boss->destructionProps;
    UpdatePropPos(&destruction->cabin);

    // not real code, but may have been used to render the rest of the props
    // for (i = 0; i < NUM_PLATFORMS; i++) {
    //     UpdatePropPos(&destruction->platforms[i]);
    //     for (j = 0; j < NUM_LINKS; j++) {
    //         UpdatePropPos(&destruction->platformLinks[i][j]);
    //     }
    // }
}

static void TaskDestructor_EggGoRound(struct Task *t)
{
    EggGoRound *boss = TASK_DATA(t);
    VramFree(boss->projectile.graphics.dest);
    VramFree(boss->gun.graphics.dest);
    VramFree(boss->cabin.graphics.dest);
    VramFree(boss->pilot.graphics.dest);
    VramFree(boss->platforms[0].s.graphics.dest);
    VramFree(boss->platforms[1].s.graphics.dest);
    VramFree(boss->link.graphics.dest);

    gActiveBossTask = NULL;
}
