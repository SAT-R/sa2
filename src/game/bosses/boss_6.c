#include "core.h"
#include "task.h"
#include "sprite.h"
#include "trig.h"

#include "lib/m4a.h"

#include "sakit/globals.h"
#include "sakit/collision.h"

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

#define NUM_PLATFORMS 4

typedef struct {
    u8 unk0;
    s32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
} EggGoRound_unk3C;

typedef struct {
    Sprite s;
    Hitbox reserved;
    SpriteTransform transform;
} EggGoRound_platforms;

typedef struct {
    s32 unk6C;
    s32 unk70;

    s32 unk74;
    s32 unk78;
    s32 unk7C;

    // Both of these are set but never read
    s32 unk80[NUM_PLATFORMS][5];
    s32 unkD0[NUM_PLATFORMS][3][5];

    u8 unk1C0;
    u8 unk1C1;

} EggGoRound_unk6C;

typedef struct {
    u32 timer;
    s32 x;
    s32 y;
    s16 speedX;
    s16 speedY;

    s32 rotationSpeed;
    s32 unk14;
    u32 unk18;
    s16 unk1C;
    u16 unk1E;
    u16 unk20;
    u16 unk22;
    u8 unk24;
    u8 unk25;
    u8 unk26;
    u8 unk27;
    u8 health;
    u8 unk29;
    u8 unk2A;
    s8 unk2B;
    s32 prevPlatformXPositions[4];
    EggGoRound_unk3C unk3C[3];

    EggGoRound_unk6C unk6C;

    Sprite cabin;
    Hitbox reserved0;

    Sprite pilot;
    Sprite link;

    EggGoRound_platforms platforms[NUM_PLATFORMS];

    Sprite gun;
    Sprite projectile;

} EggGoRound; /* 0x3CC */

static void Task_EggGoRound(void);
static void TaskDestructor_EggGoRound(struct Task *);
static void sub_80460DC(void);

static void sub_80475D0(EggGoRound *);
static void sub_8046328(EggGoRound *);
static void sub_804766C(EggGoRound *);
static void sub_80478D4(EggGoRound *);
static void sub_804683C(EggGoRound *);
static void sub_8046C28(EggGoRound *);
static void sub_8047700(EggGoRound *);

static void sub_804732C(EggGoRound *);
static void sub_8046F00(EggGoRound *);
static void sub_8046244(void);
static void sub_8047940(EggGoRound *boss);
static void sub_804787C(EggGoRound *boss);
static void sub_8047868(void);

static void sub_804797C(EggGoRound *);
static void sub_80475D0(EggGoRound *);
static void sub_8047138(EggGoRound *);
static void sub_8046E90(EggGoRound *);
static void sub_8046198(void);

static void sub_804655C(EggGoRound *, u8);
static void sub_8045F84(EggGoRound *);
static void sub_8047060(EggGoRound *);

// arm lengths
static const u8 gUnknown_080D8030[NUM_PLATFORMS] = {
    30,
    42,
    54,
    66,
};

static const TileInfo sPlatformAnimations[] = {
    { 24, SA2_ANIM_EGG_GO_ROUND_SPIKED_PLATFORM, 0 },
    { 64, SA2_ANIM_EGG_GO_ROUND_PLATFORM, 0 },
};

static const u8 gUnknown_080D8044[] = {
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

static const u16 gUnknown_080D80C6[][16] = {
    INCBIN_U16("graphics/80D80C6.gbapal"),
    INCBIN_U16("graphics/80D80E6.gbapal"),
};

void CreateEggGoRound(void)
{
    u8 i;
    EggGoRound *boss;
    Sprite *s;
    void *vrams[2];
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;
    sub_8039ED4();
    gPseudoRandom = gStageTime;

    gUnknown_03005AF0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AF0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    gUnknown_03005AA0.s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    gUnknown_03005AA0.s.unk10 |= SPRITE_FLAG(PRIORITY, 1);

    gPlayer.unk3C = NULL;
    gPlayer.moveState &= ~MOVESTATE_8;

    gActiveBossTask = TaskCreate(Task_EggGoRound, sizeof(EggGoRound), 0x4000, 0,
                                 TaskDestructor_EggGoRound);
    boss = TASK_DATA(gActiveBossTask);

    if (gDifficultyLevel != 0 && gGameMode != GAME_MODE_BOSS_TIME_ATTACK) {
        boss->health = 6;
    } else {
        boss->health = 8;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->health = boss->health >> 1;
    }

    if (gCurrentLevel == LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)) {
        boss->x = Q_24_8(29076);
        boss->y = Q_24_8(100);
    } else {
        boss->x = Q_24_8(900);
        boss->y = Q_24_8(150);
    }

    boss->speedX = 0x500;
    boss->speedY = 0;
    boss->unk29 = 0;
    boss->unk2A = 0;
    boss->unk14 = 0;
    boss->unk18 = 0;
    boss->unk27 = 0;
    boss->unk1E = 0;
    boss->unk26 = 0;
    boss->unk20 = 0;
    boss->unk24 = 0;
    boss->unk25 = 0;
    boss->prevPlatformXPositions[0] = 0;
    boss->prevPlatformXPositions[1] = 0;
    boss->prevPlatformXPositions[2] = 0;
    boss->prevPlatformXPositions[3] = 0;
    boss->timer = 128;
    boss->rotationSpeed = Q(12);
    boss->unk2B = 0xE0;
    boss->unk22 = 0x1C2;

    for (i = 0; i < 3; i++) {
        EggGoRound_unk3C *unk3C = &boss->unk3C[i];
        unk3C->unk0 = 0;
        unk3C->unk4 = 0;
        unk3C->unk8 = 0;
        unk3C->unkC = 0;
        unk3C->unkE = 0;
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
    s->unk1A = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = SPRITE_FLAG(PRIORITY, 1);

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

        s->unk1A = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
        UpdateSpriteAnimation(s);
    }

    for (; i < NUM_PLATFORMS; i++) {
        s = &boss->platforms[i].s;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = vrams[i & 1];
        s->graphics.anim = sPlatformAnimations[i & 1].anim;
        s->variant = sPlatformAnimations[i & 1].variant;

        s->unk1A = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 1);
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
            u16 result = sub_8004418(I(gPlayer.y - boss->y), I(gPlayer.x - boss->x));

            for (i = 0; i < 3; i++) {
                EggGoRound_unk3C *unk3C = &boss->unk3C[i];
                if (unk3C->unk0 == 0) {
                    s32 sin;
                    unk3C->unk4 = boss->x;
                    unk3C->unk8 = boss->y + Q(14);
                    sin = COS(result & (SIN_PERIOD - 1));
                    unk3C->unkC = sin >> 5;
                    sin = SIN(result & (SIN_PERIOD - 1));
                    unk3C->unkE = sin >> 5;
                    unk3C->unk0 = -1;
                    return;
                }
            }
        }
    }
}

static void sub_8045F84(EggGoRound *boss)
{

    Sprite *s = &boss->projectile;
    bool32 animUpdated = FALSE;
    u8 i;

    for (i = 0; i < 3; i++) {
        EggGoRound_unk3C *unk3C = &boss->unk3C[i];

        if (unk3C->unk0 != 0) {
            unk3C->unk0--;

            if (!PLAYER_IS_ALIVE) {
                unk3C->unk4 += unk3C->unkC;
            } else {
                unk3C->unk4 += unk3C->unkC + Q(5);
            }
            unk3C->unk8 += unk3C->unkE;

            if (!animUpdated) {
                UpdateSpriteAnimation(s);
                animUpdated = TRUE;
            }

            if (boss->health != 0) {
                sub_800C84C(s, I(unk3C->unk4), I(unk3C->unk8));
            }

            s->x = I(unk3C->unk4) - gCamera.x;
            s->y = I(unk3C->unk8) - gCamera.y;
            DisplaySprite(s);
        }
    }
}

static void sub_8046040(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    sub_80478D4(boss);
    sub_804683C(boss);
    sub_8046C28(boss);
    sub_8047700(boss);
    sub_8045E78(boss);
    sub_8045F84(boss);
    sub_80475D0(boss);
    sub_8046328(boss);
    sub_804766C(boss);

    if (boss->health == 0) {
        boss->unk2B = 0;
        boss->rotationSpeed = 0;
        boss->timer = 128;
        boss->unk6C.unk1C0 = 0;

        gPlayer.unk3C = NULL;
        gPlayer.moveState &= ~MOVESTATE_8;
        gPlayer.moveState |= MOVESTATE_IN_AIR;

        Player_DisableInputAndBossTimer();
        gCurTask->main = sub_80460DC;
    }
}

static void sub_80460DC(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    s32 idx;
    if (Mod(gStageTime, 21) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (boss->timer >= 0x40) {
        idx = CLAMP_SIN_PERIOD((boss->timer - 64) * 256);

    } else {
        idx = 0;
    }

    boss->unk2B = SIN(idx) >> 12;

    sub_80478D4(boss);
    sub_8045F84(boss);
    sub_80475D0(boss);
    sub_804655C(boss, 0);
    sub_804766C(boss);
    sub_8047060(boss);

    gPlayer.unk3C = NULL;
    gPlayer.moveState &= ~MOVESTATE_8;

    if (--boss->timer == 0) {
        boss->unk2B = 0;
        boss->rotationSpeed = 0;
        boss->timer = 128;
        gCurTask->main = sub_8046198;
    }
}

static void sub_8046198(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    s32 idx;
    if (Mod(gStageTime, 17) == 0) {
        m4aSongNumStart(SE_144);
    }
    idx = CLAMP_SIN_PERIOD((boss->timer) * 256);
    boss->unk2B = SIN(idx) >> 12;
    boss->rotationSpeed = 0;
    sub_80478D4(boss);
    sub_8045F84(boss);
    sub_80475D0(boss);
    sub_804655C(boss, 1);
    sub_804766C(boss);
    sub_8046F00(boss);
    sub_8047060(boss);

    if (--boss->timer == 0) {
        boss->unk6C.unk1C1 = 0;
        sub_804732C(boss);
        gCurTask->main = sub_8046244;
    }
}

static void sub_8046244(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    sub_804797C(boss);
    sub_80475D0(boss);
    sub_8046E90(boss);
    sub_804766C(boss);
    sub_8047138(boss);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (boss->unk6C.unk1C1 == 0 && (I(unk6C->unk6C) - gCamera.x) < 50) {
        u32 flags = boss->pilot.unk10;
        flags &= SPRITE_FLAG_MASK_X_FLIP;
        flags |= SPRITE_FLAG(PRIORITY, 1);
        boss->unk6C.unk1C1 = 1;
        CreateEggmobileEscapeSequence(I(unk6C->unk6C) - gCamera.x,
                                      I(unk6C->unk70) - gCamera.y - 15, flags);
    }

    if (I(boss->unk6C.unk6C) - gCamera.x < -200 && boss->unk6C.unk1C1 != 0) {
        sub_802EF68(-40, 150, 5);
        gCurTask->main = sub_8047868;
    }
}

static void sub_8046328(EggGoRound *boss)
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
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        s = &boss->link;
        for (j = 0; j < 3; j++) {
            s->x = (I(boss->x) - gCamera.x)
                + ((gUnknown_080D8030[j]
                    * COS(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                   >> 14);
            s->y = (I(boss->y) - gCamera.y)
                + ((gUnknown_080D8030[j]
                    * SIN(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                   >> 14);
            DisplaySprite(s);
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        s = &boss->platforms[i].s;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        u8 temp2 = gUnknown_080D8030[3];
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        idx = CLAMP_SIN_PERIOD(idx + (boss->unk2B * 3));
        s = &boss->platforms[i].s;

        s->x = (I(boss->x) - gCamera.x) + ((COS(idx) * temp2) >> 14);
        s->y = (I(boss->y) - gCamera.y) + ((SIN(idx) * temp2) >> 14);

        if (boss->unk1E != 0 && boss->unk24 == 0 && (i & 1)
            && (boss->unk25 == 1 || boss->unk25 == 2)) {
            SpriteTransform *transform = &boss->platforms[i].transform;
            transform->rotation = I(boss->unk18);
            transform->width = 0x100;
            transform->height = 0x100;
            transform->x = s->x;
            transform->y = s->y;

            s->unk10 = gUnknown_030054B8++ | 0x1020;
            sub_8004860(s, transform);
        } else {
            s->unk10 = SPRITE_FLAG(PRIORITY, 1);
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

    if (boss->timer < 0x30 && val != 0) {
        temp = (Div(48 - boss->timer, 16)) + 1;
    } else {
        temp = 0;
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        s = &boss->link;
        for (j = temp; j < 3; j++) {
            if (j & 1) {
                s->x = (I(boss->x) - gCamera.x)
                    + ((gUnknown_080D8030[j]
                        * COS(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                       >> 14);
                s->y = (I(boss->y) - gCamera.y)
                    + ((gUnknown_080D8030[j]
                        * SIN(CLAMP_SIN_PERIOD(idx + (j * boss->unk2B))))
                       >> 14);
            } else {
                s->x = (I(boss->x) - gCamera.x)
                    + ((gUnknown_080D8030[j]
                        * COS(CLAMP_SIN_PERIOD(idx - (j * boss->unk2B))))
                       >> 14);
                s->y = (I(boss->y) - gCamera.y)
                    + ((gUnknown_080D8030[j]
                        * SIN(CLAMP_SIN_PERIOD(idx - (j * boss->unk2B))))
                       >> 14);
            }

            DisplaySprite(s);
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        s = &boss->platforms[i].s;
        UpdateSpriteAnimation(s);
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        u8 temp2 = gUnknown_080D8030[3];
        idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
        idx = CLAMP_SIN_PERIOD(idx + (boss->unk2B * 3));
        s = &boss->platforms[i].s;

        s->x = (I(boss->x) - gCamera.x) + ((COS(idx) * temp2) >> 14);
        s->y = (I(boss->y) - gCamera.y) + ((SIN(idx) * temp2) >> 14);

        if (boss->unk1E != 0 && boss->unk24 == 0 && (i & 1)
            && (u8)(boss->unk25 - 1) <= 1) {
            SpriteTransform *transform = &boss->platforms[i].transform;
            transform->rotation = I(boss->unk18);
            transform->width = 0x100;
            transform->height = 0x100;
            transform->x = s->x;
            transform->y = s->y;

            s->unk10 = gUnknown_030054B8++ | 0x1020;
            sub_8004860(s, transform);
        } else {
            s->unk10 = SPRITE_FLAG(PRIORITY, 1);
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
                switch (boss->unk25) {
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
                boss->unk20
                    += gUnknown_080D809E[(boss->health < 5) ? 1 : 0][boss->unk26];
                if (boss->unk20
                    == gUnknown_080D8076[boss->health < 5 ? 1 : 0][boss->unk26]) {
                    boss->unk27 = 1;
                }
            } else if (boss->unk27 == 1) {
                boss->unk20 -= gUnknown_080D809E[boss->health < 5 ? 1 : 0][boss->unk26];

                if (boss->unk20 == 0) {
                    boss->unk27 = 2;
                    boss->unk18 = 0;
                    boss->unk20 = 0;
                }
            }
        }

        boss->unk18 = (boss->unk18 + boss->unk20) & (0x3FFFF);
        if (--boss->unk1E == 0) {
            u8 i;
            for (i = 0; i < NUM_PLATFORMS; i++) {
                s = &boss->platforms[i].s;
                s->graphics.anim = sPlatformAnimations[i & 1].anim;
                s->variant = 0;
                s->prevVariant = -1;
            }
            boss->unk27 = 0;
            boss->unk18 = 0;
            boss->unk20 = 0;
        }
    } else {
        boss->unk25 = gUnknown_080D8044[Mod(PseudoRandBetween(0, 255),
                                            ARRAY_COUNT(gUnknown_080D8044))];
        boss->unk26 = Mod(PseudoRandBetween(0, 255), 10);

        boss->unk1E = gUnknown_080D804E[boss->health < 5 ? 1 : 0][boss->unk26];
        boss->unk24 = 0x1E;

        switch (boss->unk25) {
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
            u8 someVal = gUnknown_080D8030[3];
            u32 idx = CLAMP_SIN_PERIOD(
                ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16) + (boss->unk2B * 3));
            Sprite *s = &boss->platforms[i].s;
            s32 x = I(boss->x) + ((COS(idx) * someVal) >> 14);
            s32 y = I(boss->y) + ((SIN(idx) * someVal) >> 14);

            if (boss->unk1E != 0 && boss->unk24 == 0 && (i % 2)
                && (boss->unk25 == 1 || boss->unk25 == 2)
                && ((gPlayer.moveState & MOVESTATE_8) && gPlayer.unk3C == s)) {
                gPlayer.moveState &= ~MOVESTATE_8;
                gPlayer.moveState &= ~MOVESTATE_100;
                gPlayer.moveState |= 2;
                gPlayer.unk3C = NULL;
                gPlayer.speedAirX += Q(5);
                gPlayer.speedGroundX += Q(5);
                gPlayer.speedAirY = -Q(2);
                continue;
            }

            if (boss->unk1E == 0 || boss->unk24 != 0 || !(i % 2)
                || (boss->unk25 != 1 && boss->unk25 != 2)) {
                u32 val;
                u8 someBool;
                s32 speedAirY;

                if (gPlayer.unk3C == s) {
                    someBool = TRUE;
                } else {
                    someBool = FALSE;
                }
                speedAirY = gPlayer.speedAirY;

                if (gPlayer.moveState & MOVESTATE_IN_AIR
                    || (gPlayer.moveState & MOVESTATE_8 && gPlayer.unk3C == s)) {
                    val = sub_800CCB8(s, x, y, &gPlayer);
                } else {
                    val = 0;
                }

                if (val & 0x10000) {
                    if (!someBool && gPlayer.unk3C == s && speedAirY > 0) {
                        gPlayer.speedAirX -= Q(5);
                        gPlayer.speedGroundX -= Q(5);
                    }

                    if (boss->unk1E != 0 && !boss->unk24 && !(i % 2)
                        && (boss->unk25 == 0 || boss->unk25 == 2)) {
                        sub_8047940(boss);
                        sub_800CBA4(&gPlayer);
                        return;
                    }

                    gPlayer.y += Q(2) + Q_8_8(val);
                    if (boss->prevPlatformXPositions[i] != 0) {
                        gPlayer.x += Q(x - (boss->prevPlatformXPositions[i]));
                    }
                } else if (someBool) {
                    gPlayer.moveState &= ~MOVESTATE_8;
                    gPlayer.unk3C = NULL;
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

static void sub_8046E90(EggGoRound *boss)
{
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    Sprite *s = &boss->cabin;
    s->x = I(unk6C->unk6C) - gCamera.x;
    s->y = I(unk6C->unk70) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk6C.unk1C1 == 0) {
        s = &boss->pilot;
        s->x = I(unk6C->unk6C) - gCamera.x;
        s->y = I(unk6C->unk70) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

static void sub_8046F00(EggGoRound *boss)
{
    ExplosionPartsInfo explosion;
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    if (boss->timer < 50) {
        u8 i;
        u8 temp = Div(49 - boss->timer, 16);
        if (49 - (temp * 16) != boss->timer) {
            return;
        }

        m4aSongNumStart(SE_144);

        for (i = 0; i < NUM_PLATFORMS; i++) {
            u8 j;

            u16 idx = ((u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16);
            s16 x = ((I(boss->x) - gCamera.x)
                     + ((gUnknown_080D8030[temp] * COS(idx)) >> 14));
            s16 y = ((I(boss->y) - gCamera.y)
                     + ((gUnknown_080D8030[temp] * SIN(idx)) >> 14));
            for (j = 0; j < 3; j++) {
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

                CreateBossParticleWithExplosionUpdate(&explosion, &unk6C->unk1C0);
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

        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk6C.unk1C0);
    }
}

static void sub_8047138(EggGoRound *boss)
{
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    if (Mod(gStageTime, 10) == 0 && unk6C->unk1C1 == 0) {
        u32 rand;
        s16 x, y;

        ExplosionPartsInfo explosion;
        x = (I(unk6C->unk6C) - gCamera.x);
        y = (I(unk6C->unk70) - gCamera.y);
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

        CreateBossParticleWithExplosionUpdate(&explosion, &boss->unk6C.unk1C0);
    }
}

void sub_8047224(s32 dX, s32 dY)
{
    EggGoRound_unk6C *unk6C;
    EggGoRound *boss;

    u8 j, i;

    boss = TASK_DATA(gActiveBossTask);
    unk6C = &boss->unk6C;

    boss->x += dX;
    boss->y += dY;
    unk6C->unk6C += dX;
    unk6C->unk70 += dY;

    for (i = 0; i < NUM_PLATFORMS; i++) {
        for (j = 0; j < 3; j++) {
            unk6C->unkD0[i][j][0] += dX;
            unk6C->unkD0[i][j][1] += dY;
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        unk6C->unk80[i][0] = dX;
        unk6C->unk80[i][1] = dY;
        boss->prevPlatformXPositions[i] = 0;
    }

    for (i = 0; i < 3; i++) {
        EggGoRound_unk3C *unk3C = &boss->unk3C[i];
        unk3C->unk4 += dX;
        unk3C->unk8 += dY;
    }
}

static void sub_804732C(EggGoRound *boss)
{
    u8 j, i;
    u8 someVal;
// solves some stack issue
#ifndef NON_MATCHING
    EggGoRound_unk6C *unk6C_2;
#endif
    EggGoRound_unk6C *unk6C;

    u32 idx;

    unk6C = &boss->unk6C;
    boss->unk1C = 0;
#ifndef NON_MATCHING
    unk6C_2 = unk6C;
#endif
    unk6C->unk6C = boss->x;
    unk6C->unk70 = boss->y;
    unk6C->unk74 = 0x580;
    unk6C->unk78 = 0;
    unk6C->unk7C = 300;

    for (i = 0; i < NUM_PLATFORMS; i++) {
        idx = (u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16;

        for (j = 0; j < 3; j++) {
#ifndef NON_MATCHING
            unk6C_2->unkD0[i][j][0] = boss->x + ((gUnknown_080D8030[j] * COS(idx)) >> 6);
            unk6C_2->unkD0[i][j][1] = boss->y + ((gUnknown_080D8030[j] * SIN(idx)) >> 6);
#else
            unk6C->unkD0[i][j][0] = boss->x + ((gUnknown_080D8030[j] * COS(idx)) >> 6);
            unk6C->unkD0[i][j][1] = boss->y + ((gUnknown_080D8030[j] * SIN(idx)) >> 6);
#endif
            unk6C->unkD0[i][j][2] = (7 - j) * 20;
            unk6C->unkD0[i][j][3] = 1;
            unk6C->unkD0[i][j][4] = idx;
        }
    }

    for (i = 0; i < NUM_PLATFORMS; i++) {
        someVal = gUnknown_080D8030[3];
        idx = (u32)((boss->unk14 + (i << 0x10)) << 0xE) >> 0x16;
        unk6C->unk80[i][0] = boss->x + (someVal * (COS(idx)) >> 6);
        unk6C->unk80[i][1] = boss->y + (someVal * (SIN(idx)) >> 6);
        unk6C->unk80[i][2] = (6 - j) * 20;
        unk6C->unk80[i][3] = 1;
        unk6C->unk80[i][4] = idx;
    }
}

u32 sub_80474C0(EggGoRound *boss)
{
    Sprite *s = &boss->pilot;
    u32 result = 0;
    if (boss->health != 0) {
        boss->health--;
        if (boss->health & 1) {
            m4aSongNumStart(SE_143);
        } else {
            m4aSongNumStart(SE_235);
        }

        boss->unk2A = 0x1E;
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
        result = 1;
    }

    if (!IS_FINAL_STAGE(gCurrentLevel) && boss->health == 4) {
        gUnknown_030054A8.unk1 = 0x11;
    }

    return result;
}

static void sub_80475D0(EggGoRound *boss)
{
    Sprite *s = &boss->pilot;
    if (boss->unk2A != 0) {
        boss->unk29 = 0;
        if (--boss->unk2A != 0) {
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
    } else {
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
}

static void sub_804766C(EggGoRound *boss)
{
    u8 i;
    if (boss->unk2A != 0) {
        for (i = 0; i < 16; i++) {
            gObjPalette[0x80 + i] = gUnknown_080D80C6[(gStageTime & 2) >> 1][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[0x80 + i] = gUnknown_080D80C6[1][i];
        }
    }

    gFlags |= 2;
}

static void sub_8047700(EggGoRound *boss)
{
    Sprite *s = &boss->cabin;
    s32 x = I(boss->x);
    s32 y = I(boss->y);

    Player_UpdateHomingPosition(boss->x, boss->y);
    if (sub_800C320(s, x, y, 1, &gPlayer) != 0) {
        if (gPlayer.x > boss->x) {
            gPlayer.speedAirX += Q(2.25);
            gPlayer.x += Q(2);
        }

        gPlayer.speedAirY += Q(2);
        return;
    }

    if (boss->unk2A == 0) {
        if (IsColliding_Cheese(s, x, y, 0, &gPlayer) == TRUE
            || sub_800C320(s, x, y, 0, &gPlayer) == TRUE) {
            sub_80474C0(boss);
        } else {
            Sprite *s2;
            if (sub_800CA20(s, x, y, 0, &gPlayer) != TRUE) {
                return;
            }
            s2 = &boss->pilot;

            boss->unk29 = 30;
            if (boss->unk2A != 0) {
                return;
            }

            s2->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
            s2->variant = 1;
            s2->prevVariant = -1;
            return;
        }
    }
}

static void Task_EggGoRound(void)
{
    EggGoRound *boss = TASK_DATA(gCurTask);
    sub_804787C(boss);
    sub_80475D0(boss);
    sub_8046328(boss);

    if (boss->timer < 64) {
        if (boss->timer & 1) {
            boss->unk2B++;
        }
        boss->rotationSpeed -= 44;
        boss->rotationSpeed -= (boss->timer - 32) * 4;
    }

    if (--boss->timer == 0) {
        boss->unk2B = 0;
        boss->rotationSpeed = 256;
        gCurTask->main = sub_8046040;
    }
}

static void sub_8047868(void) { TaskDestroy(gCurTask); }

static void sub_804787C(EggGoRound *boss)
{
    boss->x += boss->speedX + (boss->timer * 8);
    boss->y += boss->speedY;
    boss->y += Q(sub_801E4E4(I(boss->y), I(boss->x), 0, 8, 0, sub_801EE64));
    boss->unk14 = (boss->unk14 + boss->rotationSpeed) & 0x3FFFF;
}

static void sub_80478D4(EggGoRound *boss)
{
    boss->x += boss->speedX;
    boss->y += boss->speedY;

    boss->y += Q(sub_801F07C(I(boss->y), I(boss->x), 0, 8, 0, sub_801EE64));
    boss->unk14 = (boss->unk14 + boss->rotationSpeed) & 0x3FFFF;

    if (boss->health < 5 && boss->rotationSpeed != -256) {
        boss->rotationSpeed--;
    }
}

static void sub_8047940(EggGoRound *boss)
{
    Sprite *s = &boss->pilot;
    boss->unk29 = 30;
    if (boss->unk2A == 0) {
        s->graphics.anim = SA2_ANIM_EGG_GO_ROUND_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

static void sub_804797C(EggGoRound *boss)
{
    s32 result;
    EggGoRound_unk6C *unk6C = &boss->unk6C;
    unk6C->unk78 += 0x30;
    unk6C->unk6C += unk6C->unk74;
    unk6C->unk70 += unk6C->unk78;

    result = sub_801F100(I(unk6C->unk70) + 20, I(unk6C->unk6C), 1, 8, sub_801EC3C);
    if (result < 0) {
        u32 temp;
        unk6C->unk74 -= 64;
        if (unk6C->unk74 < 0) {
            unk6C->unk74 = 0;
        }

        temp = unk6C->unk78 * 9;
        temp *= 4;
        temp -= unk6C->unk78;
        temp *= 2;

        unk6C->unk78 = Div(-temp, 100);
        unk6C->unk70 += Q(result);
    }
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
