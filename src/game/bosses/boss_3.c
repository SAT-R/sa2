#include "global.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/entity.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/stage/boss_results_transition.h"
#include "game/parameters/bosses.h"
#include "game/player_callbacks.h"

#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"
#include "game/save.h"
#include "game/stage/screen_shake.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 qUnk8;
    /* 0x0A */ s16 qUnkA;
    /* 0x0C */ u16 qUnkC; // rotation
    /* 0x0E */ s16 unkE; // dy ?
    /* 0x10 */ u16 unk10;
    /* 0x12 */ u8 unk12;
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 unk14; // weapon lives?
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ s8 unk17;
    /* 0x18 */ u8 unk18;
    /* 0x19 */ u8 filler19[0x3];
} Totem3C; /* size: 0x1C */

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 unk8;
    /* 0x08 */ s16 unkA;
    /* 0x0C */ Vec2_32 qWheelPos[EGGTOTEM_NUM_PLATFORMS];
    /* 0x24 */ s16 unk24[EGGTOTEM_NUM_PLATFORMS][2];
    /* 0x30 */ s16 unk30;
    /* 0x32 */ u8 lives;
    /* 0x33 */ u8 unk33;
    /* 0x34 */ u8 unk34;
    /* 0x35 */ u8 unk35;
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
    /* 0x38 */ u8 unk38;
    /* 0x39 */ u8 unk39; // numExplosions?
    /* 0x3A */ u8 unk3A;
    /* 0x3B */ u8 unk3B;
    /* 0x3C */ Totem3C unk3C[EGGTOTEM_NUM_PLATFORMS];
    /* 0x90 */ s32 qUnk90; // some x
    /* 0x94 */ s32 qUnk94; // some y
    /* 0x98 */ s16 qUnk98; // dx
    /* 0x9A */ s16 qUnk9A; // dy
    /* 0x9C */ s32 qUnk9C; // some x
    /* 0xA0 */ s32 qUnkA0; // some y
    /* 0xA4 */ s16 qUnkA4; // dx
    /* 0xA6 */ s16 qUnkA6; // dy
    /* 0xA8 */ s32 qUnkA8; // some x
    /* 0xAC */ s32 qUnkAC; // some y
    /* 0xB0 */ s16 qUnkB0; // dx
    /* 0xB2 */ s16 qUnkB2; // dy
    /* 0xB4 */ s32 unkB4;
    /* 0xB8 */ s32 qUnkB8; // some x
    /* 0xBC */ s32 qUnkBC; // some y
    /* 0xC0 */ Sprite2 sprC0; // Main body
    /* 0xF8 */ Sprite sprWheels[EGGTOTEM_NUM_PLATFORMS];
    /* 0x188 */ Sprite3 sprPlatform[EGGTOTEM_NUM_PLATFORMS];
    /* 0x248 */ Sprite sprBulletLauncher[2];
    /* 0x2A8 */ Sprite sprPilot;
    /* 0x2D8 */ Sprite sprTails;
    /* 0x308 */ Sprite sprTailsHook;
    /* 0x338 */ Sprite sprBodyEnergy;
    /* 0x368 */ Sprite sprCart;
    /* 0x398 */ void *tilesBullet;
} EggTotem; /* size: 0x39C */

typedef struct {
    /* 0x00 */ s32 qScreenX;
    /* 0x04 */ s32 qScreenY;
    /* 0x08 */ s16 qDX;
    /* 0x0A */ s16 qDY;
    /* 0x0C */ EggTotem *totem;
    /* 0x10 */ Sprite s;
} EggTotemBullet;

typedef struct {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 padding6;
} EggTotemDataA;

static void Task_803F3E8(void);
static void sub_803F4B8(EggTotem *);
static void sub_803F5E0(EggTotem *);
static void sub_803F698(EggTotem *);
static bool32 sub_803F878(EggTotem *totem);
static void sub_803FB88(EggTotem *);
void sub_803FC14(EggTotem *);
void sub_803FF44(EggTotem *);
static bool32 sub_8040B30(EggTotem *totem, u8 i);
static void sub_804063C(EggTotem *);
static void sub_80407A4(EggTotem *);
static void sub_80408C4(EggTotem *);
static void sub_8040A00(EggTotem *);
static void sub_8040D74(EggTotem *);
static void sub_8040E78(EggTotem *);
static void sub_8040F14(EggTotem *);
static void Task_80411CC(void);
static void Task_CallTaskDestroyTotem(void);
static void Totem_UpdateWorldPos(EggTotem *);
static void sub_8041264(EggTotem *);
static void sub_80412B4(EggTotem *);
static void Task_EggTotemMain(void);
static void Task_8041138(void);
static void CreateEggTotemBullet(EggTotem *totem, s32 qX, s32 qY, u16 qSpeed);
static void TaskDestructor_EggTotemMain(struct Task *t);
static void Task_EggTotemBullet(void);

const TileInfo sTileInfoWheels[] = {
    { 16, SA2_ANIM_EGG_TOTEM_WHEEL_FRONT, 0 },
    { 16, SA2_ANIM_EGG_TOTEM_WHEEL_BACK, 0 },
    { 4, SA2_ANIM_EGG_TOTEM_WHEEL_SMALL, 0 },
};

const TileInfo sTileInfoBulletLauncher[] = {
    { 6, SA2_ANIM_EGG_TOTEM_BULLET_LAUNCHER, 0 },
    { 3, SA2_ANIM_EGG_TOTEM_BULLET_LAUNCHER, 1 },
};

const u8 sWheelsOamOrderIds[] = { 21, 25, 24 };

const s16 gUnknown_080D7BDC[3] = { Q(22), Q(13), -Q(16) };

const s16 sTotemDiscYs[3] = { -Q(32), -Q(48), -Q(64) };

const EggTotemDataA gUnknown_080D7BE8[] = {
    { 0x1, 0x200, 0x200, 0 }, { 0x20, 0, 0, 0 },        { 0x40, 0, 0x100, 0 },    { 0x3c, 0, 0, 0 },        { 0x1, 0x200, 0x100, 0 },
    { 0x3f, 0, 0x100, 0 },    { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },           { 0x1, 0x200, 0x280, 0 }, { 0x20, 0, 0, 0 },
    { 0x60, 0, 0x140, 0 },    { 0x3c, 0, 0, 0 },        { 0x1, 0x200, 0x140, 0 }, { 0x5f, 0, 0x140, 0 },    { 0x20, 0, 0, 0 },
    { 0, 0, 0, 0 },           { 0x1, 0x200, 0x280, 0 }, { 0x20, 0, 0, 0 },        { 0x80, 0, 0x140, 0 },    { 0x3c, 0, 0, 0 },
    { 0x1, 0x200, 0x140, 0 }, { 0x7f, 0, 0x140, 0 },    { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },           { 0x1, 0x200, 0x200, 0 },
    { 0x20, 0, 0, 0 },        { 0x80, 0, 0x100, 0 },    { 0x3c, 0, 0, 0 },        { 0x1, 0x200, 0x100, 0 }, { 0x7f, 0, 0x100, 0 },
    { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },           { 0x1, 0x200, 0x190, 0 }, { 0x20, 0, 0, 0 },        { 0x80, 0, 0x90, 0 },
    { 0x40, 0x8, 0xc8, 0 },   { 0x80, 0, 0x90, 0 },     { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },           { 0x1, 0x200, 0x190, 0 },
    { 0x20, 0, 0, 0 },        { 0x80, 0, 0x120, 0 },    { 0x40, 0x3f8, 0xca, 0 }, { 0x80, 0, 0x120, 0 },    { 0x20, 0, 0, 0 },
    { 0, 0, 0, 0 },           { 0x1, 0x200, 0x190, 0 }, { 0x20, 0, 0, 0 },        { 0x40, 0, 0xb8, 0 },     { 0x80, 0, 0, 0 },
    { 0x1, 0x100, 0, 0 },     { 0x14, 0, 0xc8, 0 },     { 0x80, 0, 0, 0 },        { 0x1, 0x100, 0, 0 },     { 0x40, 0, 0xb8, 0 },
    { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },           { 0x1, 0x200, 0x190, 0 }, { 0x20, 0, 0, 0 },        { 0xc0, 0, 0xb8, 0 },
    { 0x1, 0x300, 0, 0 },     { 0x14, 0, 0xd0, 0 },     { 0x1, 0x300, 0, 0 },     { 0xc0, 0, 0xb8, 0 },     { 0x20, 0, 0, 0 },
    { 0, 0, 0, 0 },           { 0x1, 0x200, 0x1b0, 0 }, { 0x20, 0, 0, 0 },        { 0xc0, 0, 0xd8, 0 },     { 0x1, 0x200, 0xd8, 0 },
    { 0x96, 0, 0, 0 },        { 0xbf, 0, 0xd8, 0 },     { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },           { 0x1, 0x200, 0x190, 0 },
    { 0x20, 0, 0, 0 },        { 0xc0, 0, 0x80, 0 },     { 0x1, 0x200, 0x80, 0 },  { 0x96, 0, 0, 0 },        { 0xbf, 0, 0x80, 0 },
    { 0x20, 0, 0, 0 },        { 0, 0, 0, 0 },
};

const EggTotemDataA *const gUnknown_080D7E78[10] = {
    &gUnknown_080D7BE8[0 * 8],     &gUnknown_080D7BE8[1 * 8],     &gUnknown_080D7BE8[2 * 8],     &gUnknown_080D7BE8[3 * 8],
    &gUnknown_080D7BE8[4 * 8],     &gUnknown_080D7BE8[5 * 8 - 1], &gUnknown_080D7BE8[6 * 8 - 2], &gUnknown_080D7BE8[7 * 8 + 1],
    &gUnknown_080D7BE8[8 * 8 + 2], &gUnknown_080D7BE8[9 * 8 + 2],
};

const u8 gUnknown_080D7EA0[0x34]
    = { 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x02, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01,
        0x01, 0x00, 0x02, 0x01, 0x01, 0x02, 0x01, 0x02, 0x02, 0x01, 0x00, 0x03, 0x01, 0x01, 0x03, 0x01, 0x02, 0x03,
        0x02, 0x00, 0x04, 0x02, 0x05, 0x02, 0x01, 0x06, 0x02, 0x07, 0x02, 0x00, 0x08, 0x01, 0x09, 0x00 };

const u8 *const gUnknown_080D7ED4[] = {
    &gUnknown_080D7EA0[0 * 3],  &gUnknown_080D7EA0[1 * 3],        &gUnknown_080D7EA0[2 * 3],        &gUnknown_080D7EA0[3 * 3],
    &gUnknown_080D7EA0[4 * 3],  &gUnknown_080D7EA0[5 * 3],        &gUnknown_080D7EA0[6 * 3],        &gUnknown_080D7EA0[7 * 3],
    &gUnknown_080D7EA0[8 * 3],  &gUnknown_080D7EA0[9 * 3],        &gUnknown_080D7EA0[10 * 3],       &gUnknown_080D7EA0[11 * 3],
    &gUnknown_080D7EA0[12 * 3], &gUnknown_080D7EA0[13 * 3 + 0x2], &gUnknown_080D7EA0[14 * 3 + 0x4],
};

const s8 gUnknown_080D7F10[EGGTOTEM_NUM_PLATFORMS] = { 14, 14, 8 };

const s16 gUnknown_080D7F14[2][PALETTE_LEN_4BPP] = {
    INCBIN_U16("graphics/boss_3_a.gbapal"),
    INCBIN_U16("graphics/boss_3_b.gbapal"),
};

void CreateEggTotem(void)
{
#ifndef NON_MATCHING
    s32 temp;
#endif
    struct Task *t;
    EggTotem *totem;
    Sprite *s;
    u8 i;
    void *tiles;

    gPlayer.stoodObj = NULL;
    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    sub_8039ED4();

    gPseudoRandom = gStageTime;

    t = TaskCreate(Task_EggTotemMain, sizeof(EggTotem), 0x4000, 0, TaskDestructor_EggTotemMain);
    totem = TASK_DATA(t);

    if (DIFFICULTY_BOSS_IS_NOT_NORMAL) {
        totem->lives = 6;
    } else {
        totem->lives = 8;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        totem->lives = totem->lives /= 2u;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        // _0803ED48
        totem->qWorldX = Q(13714);
        totem->qWorldY = Q(170);

        for (i = 0; i < ARRAY_COUNT(totem->qWheelPos); i++) {
            totem->qWheelPos[i].x = Q(13714);
            totem->qWheelPos[i].y = Q(170);
        }
        // _0803EE06

        for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
            totem->unk3C[i].qWorldX = Q(13714);
            totem->unk3C[i].qWorldY = Q(170) + sTotemDiscYs[i];

            totem->unk3C[i].qUnk8 = 0;
            totem->unk3C[i].qUnkA = 0;
            totem->unk3C[i].qUnkC = Q(3);
            totem->unk3C[i].unk12 = 0;
            totem->unk3C[i].unk13 = 0;
            totem->unk3C[i].unkE = 0;
            totem->unk3C[i].unk10 = 0;

            // This is inside a if(IS_FINAL_STAGE(gCurrentLevel)), anyway?
            if (IS_FINAL_STAGE(gCurrentLevel)) {
                totem->unk3C[i].unk14 = 1;
            }

            totem->unk3C[i].unk17 = 0;
            totem->unk3C[i].unk15 = 0;
            totem->unk3C[i].unk16 = 0;
        }
    } else {
        // _0803EEB0
        totem->qWorldX = Q(680);
        totem->qWorldY = Q(170);

        for (i = 0; i < ARRAY_COUNT(totem->qWheelPos); i++) {
            totem->qWheelPos[i].x = Q(680);
            totem->qWheelPos[i].y = Q(170);
        }
        // _0803EF72

        for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
            totem->unk3C[i].qWorldX = Q(680);
            totem->unk3C[i].qWorldY = Q(170) + sTotemDiscYs[i];

            totem->unk3C[i].qUnk8 = 0;
            totem->unk3C[i].qUnkA = 0;
            totem->unk3C[i].qUnkC = Q(3);
            totem->unk3C[i].unk12 = 0;
            totem->unk3C[i].unk13 = 0;
            totem->unk3C[i].unkE = 0;
            totem->unk3C[i].unk10 = 0;

            if (DIFFICULTY_BOSS_IS_NOT_NORMAL) {
                totem->unk3C[i].unk14 = 1;
            } else {
                totem->unk3C[i].unk14 = 3;
            }

            totem->unk3C[i].unk17 = 0;
            totem->unk3C[i].unk15 = 0;
            totem->unk3C[i].unk16 = 0;
        }
    }
    // _0803F038
    totem->unk8 = Q(5);
    totem->unkA = 0;
    totem->unk33 = 240;
    totem->unk30 = 0;
    totem->unk34 = 0;
    totem->unk35 = 0;
    totem->unk36 = 0;

    totem->unkB4 = 120;
    totem->tilesBullet = VramMalloc(4 * 2);

    s = &totem->sprC0.s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(10 * 12);
    tiles = s->graphics.dest + 32 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_TOTEM_BODY, 0, 23, 2, 0);

    s = &totem->sprCart;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tiles;
    tiles += 36 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_TOTEM_CART, 0, 23, 2, 0);

    s = &totem->sprBodyEnergy;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tiles;
    tiles += 68 * TILE_SIZE_4BPP;
    SPRITE_INIT_WITHOUT_VRAM(s, SA2_ANIM_EGG_TOTEM_ENERGY, 0, 23, 2, 0);

    for (i = 0; i < ARRAY_COUNT(totem->sprWheels); i++) {
        s = &totem->sprWheels[i];
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, sTileInfoWheels[i].numTiles, sTileInfoWheels[i].anim, sTileInfoWheels[i].variant, sWheelsOamOrderIds[i], 2);
    }

    // _0803F1A8
    for (i = 0; i < ARRAY_COUNT(totem->sprPlatform); i++) {
        s = &totem->sprPlatform[i].s;
        s->x = 0;
        s->y = 0;
        SPRITE_INIT(s, 10 * 3, SA2_ANIM_EGG_TOTEM_PLATFORM, 0, 20, 2);
    }

    // _0803F206
    for (i = 0; i < ARRAY_COUNT(totem->sprBulletLauncher); i++) {
        s = &totem->sprBulletLauncher[i];
        s->x = 0;
        s->y = 0;

#ifndef NON_MATCHING
        s->graphics.dest = VramMalloc(sTileInfoBulletLauncher[i].numTiles);
        s->graphics.anim = sTileInfoBulletLauncher[i].anim;
        temp = SPRITE_ANIM_SPEED(1.0);
        s->variant = sTileInfoBulletLauncher[i].variant;
        s->oamFlags = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

#else
        SPRITE_INIT(s, sTileInfoBulletLauncher[i].numTiles, sTileInfoBulletLauncher[i].anim, sTileInfoBulletLauncher[i].variant, 21, 2);
#endif
    }

    s = &totem->sprPilot;
    s->x = 0;
    s->y = 0;

#ifndef NON_MATCHING
    s->graphics.dest = VramMalloc(12);
    s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(22);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = temp;
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
#else
    SPRITE_INIT(s, 12, SA2_ANIM_HAMMERTANK_PILOT, 0, 22, 2);
#endif

    // Tails captured animation
    if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        // __tails_kidnap
        s = &totem->sprTails;
        s->x = 0;
        s->y = 0;

#ifndef NON_MATCHING
        s->graphics.dest = VramMalloc(5 * 6);
        s->graphics.anim = SA2_ANIM_TAILS_CAPTURED;
        s->variant = 0;
        s->oamFlags = SPRITE_OAM_ORDER(20);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = temp;
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
#else
        SPRITE_INIT(s, 5 * 6, SA2_ANIM_TAILS_CAPTURED, 0, 20, 2);
#endif

        s = &totem->sprTailsHook;
        s->x = 0;
        s->y = 0;

#ifndef NON_MATCHING
        s->graphics.dest = VramMalloc(4 * 5);
        s->graphics.anim = SA2_ANIM_EGG_TOTEM_HOOK;
        s->variant = 0;
        s->oamFlags = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = temp;
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
#else
        SPRITE_INIT(s, 4 * 5, SA2_ANIM_EGG_TOTEM_HOOK, 0, 21, 2);
#endif

    } else {
        totem->sprTails.graphics.dest = NULL;
        totem->sprTailsHook.graphics.dest = NULL;
    }

    gActiveBossTask = t;
}

void Task_803F3E8(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    if (totem->unk33 > 0) {
        totem->unk33--;
    } else {
        totem->unk33 = 80;
        sub_804063C(totem);
    }

    sub_803FB88(totem);
    sub_80407A4(totem);
    sub_8041264(totem);
    sub_80408C4(totem);
    sub_8040A00(totem);
    sub_803F5E0(totem);
    sub_8040E78(totem);
    sub_803F698(totem);
    sub_8040F14(totem);

    if (totem->lives == 0) {
        Player_DisableInputAndBossTimer();

        if (gPlayer.stoodObj != NULL || gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ) {
            gPlayer.stoodObj = NULL;

            gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            gPlayer.moveState |= MOVESTATE_IN_AIR;
        }

        sub_803F4B8(totem);
        totem->unk37 = 0;
        totem->unk38 = 5;
        totem->unk39 = 0;
        totem->unk3A = 0;

        gCurTask->main = Task_8041138;
    }
}

void sub_803F4B8(EggTotem *totem)
{
    u8 i;

    totem->qWheelPos[0].x = totem->qWorldX + gUnknown_080D7BDC[0];
    totem->qWheelPos[0].y = totem->qWorldY - Q(12);

    totem->unk24[0][0] = +Q(5);
    totem->unk24[0][1] = -Q(3);

    totem->qWheelPos[1].x = totem->qWorldX + gUnknown_080D7BDC[1];
    totem->qWheelPos[1].y = totem->qWorldY - Q(12);

    totem->unk24[1][0] = +Q(5);
    totem->unk24[1][1] = -Q(3);

    totem->qWheelPos[2].x = totem->qWorldX + gUnknown_080D7BDC[2];
    totem->qWheelPos[2].y = totem->qWorldY - Q(6);

    totem->unk24[2][0] = +Q(5);
    totem->unk24[2][1] = -Q(3);

    totem->qUnk9C = totem->qWorldX;
    totem->qUnkA0 = totem->qWorldY;
    totem->qUnkA4 = +Q(5);
    totem->qUnkA6 = -Q(2);

    totem->qUnk90 = totem->qWorldX;
    totem->qUnk94 = totem->qWorldY;
    totem->qUnk98 = +Q(5);
    totem->qUnk9A = -Q(1);

    totem->qUnkA8 = totem->qWorldX;
    totem->qUnkAC = totem->qWorldY - Q(26);
    totem->qUnkB0 = +Q(5);
    totem->qUnkB2 = -Q(0);

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];
        t3c->qUnk8 = +Q(5);
        t3c->qUnkA = -Q(1);
        t3c->unk18 = i * 12 + 1;
    }

    if (totem->sprTails.graphics.dest != NULL) {
        Sprite *s = &totem->sprTails;

        totem->qUnkB8 = totem->qWorldX - Q(40);
        totem->qUnkBC = totem->qWorldY - Q(98);

        s->graphics.anim = SA2_ANIM_TAILS_CAPTURED;
        s->variant = 1;
    }
}

void sub_803F5E0(EggTotem *totem)
{
    Sprite *s = &totem->sprC0.s;

    s32 worldX = I(totem->qWorldX);
    s32 worldY = I(totem->qWorldY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    Coll_Player_Enemy(s, worldX, worldY, 1, &gPlayer);

    if (Coll_Player_Boss_Attack(s, worldX, worldY, 0, &gPlayer) == TRUE) {
        sub_8040D74(totem);
    } else if (Coll_Player_Enemy(s, worldX, worldY, 0, &gPlayer) == TRUE) {
        sub_80412B4(totem);
    }

    Player_UpdateHomingPosition(totem->qWorldX, totem->qWorldY - BOSS5_HEIGHT);

    if (totem->unk35 == 0) {
        if (Coll_Cheese_Enemy_Attack(s, worldX, worldY, 0, &gPlayer) == TRUE) {
            sub_8040D74(totem);
        }
    }
}

void sub_803F698(EggTotem *totem)
{
    u8 i;

    Sprite *s = &totem->sprC0.s;
    s->x = I(totem->qWorldX) - gCamera.x;
    s->y = I(totem->qWorldY) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &totem->sprPilot;
    s->x = I(totem->qWorldX) - gCamera.x;
    s->y = I(totem->qWorldY) - gCamera.y - 82;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < ARRAY_COUNT(totem->sprWheels); i++) {
        s = &totem->sprWheels[i];
        s->x = I(totem->qWheelPos[i].x) - gCamera.x;
        s->y = I(totem->qWheelPos[i].y) - gCamera.y - 14;

        if (i == 2) {
            s->y += 6;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];
        s = &totem->sprPlatform[i].s;
        s->x = I(t3c->qWorldX) - gCamera.x;
        s->y = I(t3c->qWorldY) - gCamera.y;
        s->animSpeed = (SIN_24_8(t3c->qUnkC) >> 3) + 0x20;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        if (t3c->unk17 != 0) {
            s8 r3;
            s = (t3c->unk14 != 0) ? &totem->sprBulletLauncher[0] : &totem->sprBulletLauncher[1];

            if (t3c->unk17 > 0) {
                r3 = 0;
                SPRITE_FLAG_CLEAR(s, Y_FLIP);
            } else {
                r3 = -1;
                SPRITE_FLAG_SET(s, Y_FLIP);
            }

            s->x = I(t3c->qWorldX) - gCamera.x;
            s->y = I(t3c->qWorldY) - gCamera.y + t3c->unk17 + r3;
            UpdateSpriteAnimation(s);
            DisplaySprite(s);
        }
    }

    if (totem->sprTails.graphics.dest != NULL) {
        s = &totem->sprTailsHook;

        s->x = I(totem->qWorldX) - gCamera.x - 16;
        s->y = I(totem->qWorldY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &totem->sprTails;
        s->x = I(totem->qWorldX) - gCamera.x - 40;
        s->y = I(totem->qWorldY) - gCamera.y - 98;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

bool32 sub_803F878(EggTotem *totem)
{
    Sprite *s;
    u8 i;
    bool32 result;

    for (i = 0; i < ARRAY_COUNT(totem->sprWheels); i++) {
        s = &totem->sprWheels[i];

        s->x = I(totem->qWheelPos[i].x) - gCamera.x;
        s->y = I(totem->qWheelPos[i].y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    result = FALSE;

    if (totem->unk37 == 0) {
        s = &totem->sprBodyEnergy;
        s->x = I(totem->qUnkA8) - gCamera.x;
        s->y = I(totem->qUnkAC) - gCamera.y;

        if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
            result = TRUE;
            totem->unk37 = TRUE;
        }

        DisplaySprite(s);
    }

    s = &totem->sprCart;
    s->x = I(totem->qUnk9C) - gCamera.x;
    s->y = I(totem->qUnkA0) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s = &totem->sprC0.s;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_COCKPIT;
    s->variant = 0;
    s->prevVariant = -1;
    s->x = I(totem->qUnk90) - gCamera.x;
    s->y = I(totem->qUnk94) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (totem->unk3A == 0) {
        s = &totem->sprPilot;
        s->x = I(totem->qUnk90) - gCamera.x;
        s->y = I(totem->qUnk94) - gCamera.y - 81;

        if (s->x < 50) {
            CreateEggmobileEscapeSequence(I(totem->qUnk90) - gCamera.x - 4, I(totem->qUnk94) - gCamera.y - 79, 0x2000);

            totem->unk3A = TRUE;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < ARRAY_COUNT(totem->sprPlatform); i++) {
        Totem3C *t3c = &totem->unk3C[i];

        s = &totem->sprPlatform[i].s;
        s->x = I(t3c->qWorldX) - gCamera.x;
        s->y = I(t3c->qWorldY) - gCamera.y;
        DisplaySprite(s);
    }

    if (totem->sprTails.graphics.dest != NULL) {
        s = &totem->sprTails;
        s->x = I(totem->qUnkB8) - gCamera.x;
        s->y = I(totem->qUnkBC) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    return result;
}

void EggTotemMove(s32 dx, s32 dy)
{
    EggTotem *totem = TASK_DATA(gActiveBossTask);
    u8 i;

    totem->qWorldX += dx;
    totem->qWorldY += dy;

    for (i = 0; i < ARRAY_COUNT(totem->qWheelPos); i++) {
        totem->qWheelPos[i].x += dx;
        totem->qWheelPos[i].y += dy;
    }

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        totem->unk3C[i].qWorldX += dx;
        totem->unk3C[i].qWorldY += dy;
    }

    totem->qUnk9C += dx;
    totem->qUnkA0 += dy;

    totem->qUnk90 += dx;
    totem->qUnk94 += dy;

    totem->qUnkA8 += dx;
    totem->qUnkAC += dy;

    totem->qUnkB8 += dx;
    totem->qUnkBC += dy;
}

void sub_803FB88(EggTotem *totem)
{
    s32 discY;
    s32 res;
    u8 i;

    Totem_UpdateWorldPos(totem);

    discY = 0;

    for (i = 0; i < ARRAY_COUNT(totem->qWheelPos); i++) {
        totem->qWheelPos[i].x = totem->qWorldX + gUnknown_080D7BDC[i];

        if (i == 0) {
            totem->qWheelPos[i].y += 6;
        }

        res = totem->qWheelPos[i].y;
        discY += res;

        totem->qWheelPos[i].y += Q(sub_801F100(I(res) - 1, I(totem->qWheelPos[i].x), 1, +8, sub_801EC3C) + 1);
    }

    res = Div(discY, 3) - Q(2.0);
    totem->unk30 = totem->qWorldY - res;
    totem->qWorldY = res;
}

void sub_803FC14(EggTotem *totem)
{
    u8 i, j;
    ExplosionPartsInfo info;
    s32 divRes;

    for (i = 0; i < ARRAY_COUNT(totem->qWheelPos); i++) {
        totem->qWheelPos[i].x += totem->unk24[i][0];
    }

    totem->qUnk9C += totem->qUnkA4;
    totem->qUnk90 += totem->qUnk98;

    if (Mod(gStageTime, 14) == 0) {
        s32 rnd = PseudoRandom32();
        info.spawnX = (I(totem->qUnk90) - gCamera.x) + (rnd % 64u) - 31;

        rnd = PseudoRandom32();
        info.spawnY = ((I(totem->qUnk94) - gCamera.y) + (rnd % 32u)) - 75;

        info.velocity = 0;
        info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
        info.speed = ({ BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u); });
        info.vram = (void *)(OBJ_VRAM0 + 0x2980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
    }
    // _0803FD04

    if (Mod(gStageTime, 13) == 0) {
        s32 rnd = PseudoRandom32();
        info.spawnX = (I(totem->qUnk9C) - gCamera.x) + (rnd % 64u) - 31;

        rnd = PseudoRandom32();
        info.spawnY = ((I(totem->qUnkA0) - gCamera.y) + (rnd % 32u)) - 0x10;

        info.velocity = 0;
        info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });

        info.speed = ({ BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u); });
        info.vram = (void *)(OBJ_VRAM0 + 0x2980);
        info.anim = SA2_ANIM_EXPLOSION;
        info.variant = 0;
        info.unk4 = 0;

        CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
    }
    // _0803FD9A

    totem->qUnkA8 += totem->qUnkB0;

    for (i = 0; i < EGGTOTEM_NUM_PLATFORMS; i++) {
        // _0803FDAE

        Totem3C *t3c = &totem->unk3C[i];

        if (t3c->unk18 == 0) {
            t3c->qUnkA += 0x20;
        } else if (--t3c->unk18 == 0) {
            // _0803FE10

            // TODO: Check loop values
            for (j = 0; j < 4; j++) {
                s32 rnd = PseudoRandom32();
                info.spawnX = ((I(t3c->qWorldX) - gCamera.x) + (rnd % 64u)) - 31;
                rnd = PseudoRandom32();
                info.spawnY = ((I(t3c->qWorldY) - gCamera.y) + (rnd % 8u)) - 3;
                info.velocity = 0;
                info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
                info.speed = ({ BOSS_EXPLOSION_VELOCITY_X - Q(1.5) - (PseudoRandom32() % 512u); });
                info.vram = (void *)(OBJ_VRAM0 + 0x2980);
                info.anim = SA2_ANIM_EXPLOSION;
                info.variant = 0;
                info.unk4 = 0;

                CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
            }
        }
        // _0803FEA8

        t3c->qWorldX += t3c->qUnk8;
        t3c->qWorldY += t3c->qUnkA;

        divRes = sub_801F100(I(t3c->qWorldY) + 3, I(t3c->qWorldX), 1, +8, sub_801EC3C);
        if (divRes < 0) {
            s32 v;
            t3c->qWorldY += Q(divRes);

            // t3c->qUnkA * 7./10.;
            v = t3c->qUnkA * 35;
            t3c->qUnkA = Div(-(v * 2), 100);

            if (t3c->qUnk8 > 0) {
                t3c->qUnk8 -= Q(1.0);
            }
        }
    }
}

void sub_803FF44(EggTotem *totem)
{
    u8 i, j;
    s32 res;
    ExplosionPartsInfo info; // sp04 -> sp24

    if (totem->unk38 == 0) {
        // _0803FF9A
        for (i = 0; i < EGGTOTEM_NUM_PLATFORMS; i++) {
            totem->unk24[i][1] += Q(0.125);
            totem->qWheelPos[i].x += totem->unk24[i][0];
            totem->qWheelPos[i].y += totem->unk24[i][1];

            res = sub_801F100(I(totem->qWheelPos[i].y) + gUnknown_080D7F10[i] - 1, I(totem->qWheelPos[i].x), 1, +8, sub_801EC3C);

            if (res < 0) {
                // __minRes
                totem->qWheelPos[i].y += Q(res);

                totem->unk24[i][1] = Div(-(totem->unk24[i][1] * 80), 100);

                if (totem->unk24[i][1] > -Q(1.0)) {
                    totem->unk24[i][1] = 0;
                }

                if (totem->unk24[i][0] > 0) {
                    totem->unk24[i][0] -= 0x20;
                    totem->unk24[i][0] -= i * 4;
                }
            }
            // _0804002E - continue
        }
        // __unk38_is_0_post_loop

        totem->qUnkA6 += 0x20;
        totem->qUnk9C += totem->qUnkA4;
        totem->qUnkA0 += totem->qUnkA6;

        res = sub_801F100(I(totem->qUnkA0) - 8, I(totem->qUnk9C), 1, +8, sub_801EC3C);

        if (res < 0) {
            totem->qUnkA0 += Q(res);

            totem->qUnkA6 = Div(-(totem->qUnkA6 * 80), 100);

            if (totem->qUnkA6 > -Q(1.0)) {
                totem->qUnkA6 = 0;
            } else if (totem->qUnkA6 < -Q(1.4375)) {
                CreateScreenShake(0x400, 0x20, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);
            }

            if (totem->qUnkA4 > 0) {
                totem->qUnkA4 -= Q(0.1875);
            }
        }
        // _080400E2
        totem->qUnk90 = totem->qUnk9C;
        totem->qUnk94 = totem->qUnkA0 + Q(50);

        if (Mod(gStageTime, 6) == 0) {
            s32 rnd32 = PseudoRandom32();
            info.spawnX = I(totem->qUnk9C) - gCamera.x + (rnd32 % 64u) - 31;

            rnd32 = PseudoRandom32();
            info.spawnY = I(totem->qUnkA0) - gCamera.y + (rnd32 % 64u) - 45;

            info.velocity = 0;
            info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
            info.speed = ({ BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u); });
            info.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info.anim = SA2_ANIM_EXPLOSION;
            info.variant = 0;
            info.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
        }
    } else {
        // _080401C0

        for (i = 0; i < EGGTOTEM_NUM_PLATFORMS; i++) {
            totem->qWheelPos[i].x += totem->unk24[i][0];
        }

        totem->qUnk9C += totem->qUnkA4;
        totem->qUnk9A += Q(0.125);
        totem->qUnk90 += totem->qUnk98;
        totem->qUnk94 += totem->qUnk9A;

        res = sub_801F100(I(totem->qUnk94) - 50, I(totem->qUnk90), 1, +8, sub_801EC3C);

        if (res < 0) {
            // _08040256
            if (--totem->unk38 == 0) {
                for (j = 0; j < 9; j++) {
                    s32 rnd32 = PseudoRandom32();
                    info.spawnX = I(totem->qUnk9C) - gCamera.x + (rnd32 % 64u) - 31;

                    rnd32 = PseudoRandom32();
                    info.spawnY = I(totem->qUnkA0) - gCamera.y + (rnd32 % 64u) - 45;

                    info.velocity = 0;

                    info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
                    info.speed = ({ Q(6.0) - (PseudoRandom32() % 512u); });
                    info.vram = (void *)(OBJ_VRAM0 + 0x2980);
                    info.anim = SA2_ANIM_EXPLOSION;
                    info.variant = 0;
                    info.unk4 = 0;

                    CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
                }
            }

            if (totem->unk38 >= 3) {
                CreateScreenShake(0x400, 0x20, 0x80, 0x14, SCREENSHAKE_VERTICAL | 0x3);
            }
            // _0804033E

            totem->qUnk94 += Q(res);

            // totem->qUnk9A *= 0.60
            totem->qUnk9A = Div(-(totem->qUnk9A * 60), 100);
        }
        // _08040360

        if (Mod(gStageTime, 14) == 0) {
            s32 rnd32 = PseudoRandom32();
            info.spawnX = I(totem->qUnk90) - gCamera.x + (rnd32 % 64u) - 31;

            rnd32 = PseudoRandom32();
            info.spawnY = I(totem->qUnk94) - gCamera.y + (rnd32 % 32u) - 75;

            info.velocity = 0;

            info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
            info.speed = ({ BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u); });
            info.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info.anim = SA2_ANIM_EXPLOSION;
            info.variant = 0;
            info.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
        }
        // _08040400

        if (Mod(gStageTime, 13) == 0) {
            s32 rnd32 = PseudoRandom32();
            info.spawnX = I(totem->qUnk9C) - gCamera.x + (rnd32 % 64u) - 31;

            rnd32 = PseudoRandom32();
            info.spawnY = I(totem->qUnkA0) - gCamera.y + (rnd32 % 32u) - 16;

            info.velocity = 0;

            info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
            info.speed = ({ BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u); });
            info.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info.anim = SA2_ANIM_EXPLOSION;
            info.variant = 0;
            info.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
        }
    }
    // _0804049E

    for (i = 0; i < 3; i++) {
        Totem3C *t3c = &totem->unk3C[i];

        if (t3c->unk18 == 0) {
            t3c->qUnkA += Q(0.125);
        } else if (--t3c->unk18 == 0) {
            for (j = 0; j < 4; j++) {
                s32 rnd32 = PseudoRandom32();
                info.spawnX = I(t3c->qWorldX) - gCamera.x + (rnd32 % 64u) - 31;

                rnd32 = PseudoRandom32();
                info.spawnY = I(t3c->qWorldY) - gCamera.y + (rnd32 % 8u) - 3;

                info.velocity = 0;

                info.rotation = ({ 1000 - (PseudoRandom32() % 64u); });
                info.speed = ({ Q(4.0) - (PseudoRandom32() % 512u); });
                info.vram = (void *)(OBJ_VRAM0 + 0x2980);
                info.anim = SA2_ANIM_EXPLOSION;
                info.variant = 0;
                info.unk4 = 0;

                CreateBossParticleWithExplosionUpdate(&info, &totem->unk39);
            }
        }
        // _080405A0
        t3c->qWorldX += t3c->qUnk8;
        t3c->qWorldY += t3c->qUnkA;

        res = sub_801F100(I(t3c->qWorldY) + 4, I(t3c->qWorldX), 1, +8, sub_801EC3C);
        if (res < 0) {
            s32 v;
            t3c->qWorldY += Q(res);

            // t3c->qUnkA * 7./10.;
            v = t3c->qUnkA * 35;
            t3c->qUnkA = Div(-(v * 2), 100);

            if (t3c->qUnk8 > 0) {
                t3c->qUnk8 -= Q(1.0);
            }
        }
    }
}

void sub_804063C(EggTotem *totem)
{
    Totem3C *t3c;
    s8 r2;
    const u8 *bp;
    s8 r6;

    u8 rnd = PseudoRandom32();
    s8 v = Mod(rnd, 3);
    s8 r4 = gStageTime % 4u;

    t3c = &totem->unk3C[v];

    if (t3c->unk13 == 0) {
        m4aSongNumStart(SE_246);

        r2 = r4 * 3 + v;

        if ((PseudoRandom32() % 2u) != 0) {
            if ((v == 0) && (totem->unk3C[EGGTOTEM_NUM_PLATFORMS - 1].unk13 == 0)) {
                r2 = 12;
            } else if ((v == 1) && (totem->unk3C[EGGTOTEM_NUM_PLATFORMS - 1].unk13 == 0)) {
                r2 = 13;
            } else if ((v == 0) && (totem->unk3C[EGGTOTEM_NUM_PLATFORMS - 2].unk13 == 0)) {
                r2 = 14;
            }
        }

        bp = gUnknown_080D7ED4[r2];
        r6 = *bp++;

        while ((--r6) >= 0) {
            const EggTotemDataA *totemDataA;
            v = *bp++;
            r4 = *bp++;
            totemDataA = gUnknown_080D7E78[r4];
            t3c = &totem->unk3C[v];
            t3c->unk13 = 1;
            t3c->unk12 = r4;
            t3c->unk10 = totemDataA->unk2;
            totemDataA++;

            t3c->unkE = totemDataA->unk0;
            t3c->qUnk8 = ((COS(t3c->unk10) * totemDataA->unk4) >> 14);
            t3c->qUnkA = ((SIN(t3c->unk10) * totemDataA->unk4) >> 14);
            t3c->qUnkC = Q(3);
        }
    }
}

void sub_80407A4(EggTotem *totem)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];

        if (t3c->unk13 != 0) {
            const EggTotemDataA *ptr = gUnknown_080D7E78[t3c->unk12];
            ptr = &ptr[t3c->unk13];

            if (--t3c->unkE != 0) {
                t3c->unk10 = CLAMP_SIN_PERIOD(t3c->unk10 + ptr->unk2);
                t3c->qUnk8 = ((COS(t3c->unk10) * ptr->unk4) >> 14);
                t3c->qUnkA = ((SIN(t3c->unk10) * ptr->unk4) >> 14);

                if (ptr->unk0 == 32 && ptr->unk2 == 0 && ptr->unk4 == 0) {
                    // t3c->qUnkC += 22.5 degrees
                    t3c->qUnkC = CLAMP_SIN_PERIOD(t3c->qUnkC + Q(0.0625));
                }
            } else if ((++ptr)->unk0 == 0) {
                t3c->unkE = 0;
                t3c->unk13 = 0;
                t3c->unk12 = 0;
                t3c->unk10 = 0;
                t3c->qUnk8 = 0;
                t3c->qUnkA = 0;
            } else {
                t3c->unk13++;
                t3c->unkE = ptr->unk0;

                t3c->unk10 = CLAMP_SIN_PERIOD(t3c->unk10 + ptr->unk2);
                t3c->qUnk8 = ((COS(t3c->unk10) * ptr->unk4) >> 14);
                t3c->qUnkA = ((SIN(t3c->unk10) * ptr->unk4) >> 14);
            }

            t3c->qWorldX += Q(5) + t3c->qUnk8;
            t3c->qWorldY += t3c->qUnkA - totem->unk30;
        }
    }
}

void sub_80408C4(EggTotem *totem)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];

        if (t3c->unk13 != 0) {
            const EggTotemDataA *ptr = gUnknown_080D7E78[t3c->unk12];
            ptr = &ptr[t3c->unk13];

            if (ptr->unk0 == 60 && ptr->unk2 == 0 && ptr->unk4 == 0) {

                if ((u16)t3c->unkE == 60) {
                    if (gPlayer.qWorldY < t3c->qWorldY) {
                        t3c->unk15 = 1;
                    } else {
                        t3c->unk15 = 0;
                    }

                    t3c->unk16 |= 0x80;
                }

                if ((u16)t3c->unkE >= 48) {
                    if (t3c->unk15 != 0) {
                        t3c->unk17--;
                    } else {
                        t3c->unk17++;
                    }
                } else if ((u16)t3c->unkE == 30 && t3c->unk14 != 0) {
                    if (t3c->unk16 & 0x80) {
                        if ((PseudoRandom32() % 2u) == 0) {
                            s32 qx = t3c->qWorldX;
                            s32 qy = t3c->qWorldY + Q(t3c->unk17);
                            qy -= Q(t3c->unk15 * 3);
                            CreateEggTotemBullet(totem, qx, qy, BOSS5_BULLET_SPEED);
                        }
                    }
                    t3c->unk16 &= ~0x80;
                } else if ((u16)t3c->unkE < 18) {
                    if (t3c->unk17 != 0) {
                        if (t3c->unk15 != 0) {
                            t3c->unk17++;
                        } else {
                            t3c->unk17--;
                        }
                    }
                }

                if ((t3c->unk17 != 0) && (totem->unk36 == 0) && (sub_8040B30(totem, i) << 24 != 0)) {
                    t3c->unk16 &= ~0x80;
                    totem->unk36 = 30;
                }
            }
        }
    }
}

void sub_8040A00(EggTotem *totem)
{
    u8 i;
    Sprite *s;
    Totem3C *t3c;

    if (totem->lives == 0) {
        return;
    }

    for (i = 0; i < EGGTOTEM_NUM_PLATFORMS; i++) {
        u32 coll;
        bool32 r7;

        s = &totem->sprPlatform[i].s;
        t3c = &totem->unk3C[i];

        if (Coll_Player_Enemy(s, I(t3c->qWorldX), I(t3c->qWorldY), 1, &gPlayer) == FALSE
            && Coll_Player_Enemy(s, I(t3c->qWorldX), I(t3c->qWorldY), 2, &gPlayer) == FALSE) {
#ifndef NON_MATCHING
            register Player *p asm("r5");
#else
            Player *p;
#endif
            u32 moveState = (gPlayer.moveState & MOVESTATE_STOOD_ON_OBJ);
            s32 x, y;
            r7 = FALSE;

            if (moveState && (gPlayer.stoodObj == s)) {
                r7 = TRUE;
            }

            x = I(t3c->qWorldX);
            y = I(t3c->qWorldY);
            p = &gPlayer;
            coll = Coll_Player_Platform(s, x, y, p);

            if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (coll & COLL_FLAG_10000)) {
                p->qWorldX += t3c->qUnk8 + Q(5);
                p->qWorldY += Q(2) + (s16)Q(coll);

                if (!r7) {
                    p->qSpeedAirX -= Q(5);
                }
            } else if (r7) {
                gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                gPlayer.stoodObj = NULL;

                if (!(gPlayer.moveState & MOVESTATE_100)) {
                    gPlayer.moveState &= ~MOVESTATE_100;
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                }
            }
        }
    }
}

bool32 sub_8040B30(EggTotem *totem, u8 i)
{
    ExplosionPartsInfo info, info2;
    Sprite *s;
    Totem3C *t3c;

    bool32 result = FALSE;

#ifndef NON_MATCHING
    register s32 val asm("r8");
#endif

    s16 t3CX, t3CY;

    if (i > ARRAY_COUNT(totem->unk3C)) {
        return FALSE;
    }

    t3c = &totem->unk3C[i];
    if ((t3c->unk14 == 0) || (totem->lives == 0)) {
        return FALSE;
    }
    // _08040B66

    s = &totem->sprBulletLauncher[0];
    t3CX = I(t3c->qWorldX);
    t3CY = I(t3c->qWorldY) + t3c->unk17;

    if (Coll_Player_Boss_Attack(s, t3CX, t3CY, 0, &gPlayer) == TRUE) {
        t3c->unk14 -= 1;

#ifndef NON_MATCHING
        val = 0xFF;
#endif

        if (t3c->unk14 == 0) {
            info.spawnX = t3CX - gCamera.x;
            info.spawnY = t3CY - gCamera.y;
            info.velocity = 0;
            info.rotation = DEG_TO_SIN(337.5);
            info.speed = Q(6.0);
            info.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info.anim = SA2_ANIM_EXPLOSION;
            info.variant = 0;
            info.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info, &t3c->unk16);
#ifndef NON_MATCHING
            {
                s32 divResA, divResB;
                s32 oldScore = gLevelScore;
                gLevelScore += 500;

                divResA = Div(gLevelScore, 50000);
                divResB = Div(oldScore, 50000);

                if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                    u16 lives = divResA - divResB;
                    lives += gNumLives;

                    gNumLives = ({
                        if (lives > 255)
                            lives = val;
                        lives;
                    });

                    gMusicManagerState.unk3 = 16;
                }
            }
#else
            INCREMENT_SCORE(500);
#endif
            m4aSongNumStart(SE_EXPLOSION);
        } else {
            // _08040C5C
            m4aSongNumStart(SE_143);
        }

        result = TRUE;
    }
    // _08040C64

    Player_UpdateHomingPosition(Q(t3CX), Q(t3CY));

    if (Coll_Cheese_Enemy_Attack(s, t3CX, t3CY, 0, &gPlayer) == TRUE) {
        t3c->unk14--;
#ifndef NON_MATCHING
        val = 0xFF;
#endif
        if (t3c->unk14 == 0) {
            // _middlestep
            info2.spawnX = t3CX - gCamera.x;
            info2.spawnY = t3CY - gCamera.y;
            info2.velocity = 0;
            info2.rotation = DEG_TO_SIN(337.5);
            info2.speed = Q(6.0);
            info2.vram = (void *)(OBJ_VRAM0 + 0x2980);
            info2.anim = SA2_ANIM_EXPLOSION;
            info2.variant = 0;
            info2.unk4 = 0;

            CreateBossParticleWithExplosionUpdate(&info2, &t3c->unk16);
#ifndef NON_MATCHING
            {
                s32 divResA, divResB;
                s32 oldScore = gLevelScore;
                gLevelScore += 500;

                divResA = Div(gLevelScore, 50000);
                divResB = Div(oldScore, 50000);

                if ((divResA != divResB) && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                    u16 lives = divResA - divResB;
                    lives += gNumLives;

                    gNumLives = ({
                        if (lives > 255)
                            lives = val;
                        lives;
                    });

                    gMusicManagerState.unk3 = 16;
                }
            }
#else
            INCREMENT_SCORE(500);
#endif

            m4aSongNumStart(SE_EXPLOSION);

            Coll_Player_Enemy_AdjustSpeed(&gPlayer);
            gCheeseTarget.task->unk15 = 0;
        } else {
            m4aSongNumStart(SE_143);
        }

        result = TRUE;
    }

    return result;
}

void sub_8040D74(EggTotem *totem)
{
    Sprite *s = &totem->sprPilot;

    if (totem->unk35 == 0) {
        // NOTE: This matches, but it'd be better if this worked without 'a'
        u32 a = totem->lives;

        if (a > 0) {
            totem->lives = a - 1;

            if (((a - 1) % 2u) != 0) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            totem->unk35 = 30;

            if (totem->lives == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
                INCREMENT_SCORE(1000);
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 2;
            }

            s->prevVariant = -1;
        }

        if (!IS_FINAL_STAGE(gCurrentLevel) && (totem->lives == 4)) {
            gMusicManagerState.unk1 = 0x11;
        }
    }
}

void sub_8040E78(EggTotem *totem)
{
    Sprite *s = &totem->sprPilot;

    if (totem->unk35 > 0) {
        totem->unk34 = 0;

        if (--totem->unk35 == 0) {
            if (totem->lives == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 0;
            }

            s->prevVariant = -1;
        }
    } else if (totem->unk34 > 0) {
        if (--totem->unk34 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

void sub_8040F14(EggTotem *totem)
{
    u8 i;

    if (totem->unk35 != 0) {
        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(8, i, gUnknown_080D7F14[((gStageTime & 0x2) / 2u)][i]);
        }
    } else {
        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(8, i, gUnknown_080D7F14[1][i]);
        }
    }

    if (totem->unk36 > 0) {
        totem->unk36--;

        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(11, i, gUnknown_080D7F14[((gStageTime & 0x2) / 2u)][i]);
        }
    } else {
        for (i = 0; i < PALETTE_LEN_4BPP; i++) {
            SET_PALETTE_COLOR_OBJ(11, i, gUnknown_080D7F14[1][i]);
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void TaskDestructor_EggTotemMain(struct Task *t)
{
    u8 i;
    EggTotem *totem = TASK_DATA(t);

    VramFree(totem->sprC0.s.graphics.dest);

    for (i = 0; i < ARRAY_COUNT(totem->sprWheels); i++) {
        VramFree(totem->sprWheels[i].graphics.dest);
    }

    for (i = 0; i < ARRAY_COUNT(totem->sprPlatform); i++) {
        VramFree(totem->sprPlatform[i].s.graphics.dest);
    }

    VramFree(totem->sprBulletLauncher[0].graphics.dest);
    VramFree(totem->sprBulletLauncher[1].graphics.dest);

    VramFree(totem->tilesBullet);

    VramFree(totem->sprPilot.graphics.dest);

    if (totem->sprTailsHook.graphics.dest != NULL) {
        VramFree(totem->sprTailsHook.graphics.dest);
    }

    if (totem->sprTails.graphics.dest != NULL) {
        VramFree(totem->sprTails.graphics.dest);
    }

    gActiveBossTask = NULL;
}

void Task_EggTotemMain(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    totem->qWorldX += Q(3.8125);

    sub_803FB88(totem);
    sub_8041264(totem);
    sub_8040E78(totem);
    sub_803F698(totem);

    if (--totem->unkB4 == 0) {
        gCurTask->main = Task_803F3E8;
    }
}

void Task_8041138(void)
{
    bool8 res;
    EggTotem *totem = TASK_DATA(gCurTask);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    if (totem->sprTails.graphics.dest != NULL) {
        totem->qUnkB8 += Q(5);

        if (totem->qUnkBC > -Q(48)) {
            totem->qUnkBC -= Q(3);
        }
    }

    sub_803FC14(totem);
    sub_8040E78(totem);

    res = sub_803F878(totem);
    if (res != FALSE) {
        gCurTask->main = Task_80411CC;
    }
}

void Task_80411CC(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_EXPLOSION);
    }

    sub_803FF44(totem);
    sub_8040E78(totem);
    sub_803F878(totem);

    if (totem->sprC0.s.x < -200) {
        sub_802EF68(-40, 150, 2);

        gCurTask->main = Task_CallTaskDestroyTotem;
    }
}

void Task_CallTaskDestroyTotem(void) { TaskDestroy(gCurTask); }

void Totem_UpdateWorldPos(EggTotem *totem)
{
    totem->qWorldX += totem->unk8;
    totem->qWorldY += totem->unkA;
}

void sub_8041264(EggTotem *totem)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        if (totem->unk3C[i].unk13 == 0) {
            totem->unk3C[i].qWorldX = totem->qWorldX;
            totem->unk3C[i].qWorldY = totem->qWorldY + sTotemDiscYs[i];
        }
    }
}

void sub_80412B4(EggTotem *totem)
{
    Sprite *s = &totem->sprPilot;

    totem->unk34 = 30;

    if (totem->unk35 == 0) {
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void CreateEggTotemBullet(EggTotem *totem, s32 qX, s32 qY, u16 qSpeed)
{
    Sprite *s;
    u16 sinIndex;

    struct Task *t = TaskCreate(Task_EggTotemBullet, sizeof(EggTotemBullet), 0x6100, 0, NULL);

    EggTotemBullet *bullet = TASK_DATA(t);

    bullet->qScreenX = qX - Q(gCamera.x);
    bullet->qScreenY = qY - Q(gCamera.y);

    sinIndex = sub_8004418(I(gPlayer.qWorldY) - I(qY), I(gPlayer.qWorldX) - I(qX));
    bullet->qDX = ((COS(sinIndex) * qSpeed) >> 14);
    bullet->qDX += BOSS_VELOCITY_X;
    bullet->qDY = ((SIN(sinIndex) * qSpeed) >> 14);
    bullet->totem = totem;

    s = &bullet->s;

    s->x = I(qX);
    s->y = I(qY);
    s->graphics.dest = totem->tilesBullet;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_BULLET;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_EggTotemBullet(void)
{
    EggTotem *totem;
    EggTotemBullet *bullet = TASK_DATA(gCurTask);
    Sprite *s = &bullet->s;

    if (!PLAYER_IS_ALIVE) {
        bullet->qScreenX += bullet->qDX;
        bullet->qScreenX -= BOSS_VELOCITY_X;
        bullet->qScreenY += bullet->qDY;
    } else {
        bullet->qScreenX += (bullet->qDX + Q(gCamera.dx));
        bullet->qScreenY += (bullet->qDY + Q(gCamera.dy));
    }

    s->x = I(bullet->qScreenX);
    s->y = I(bullet->qScreenY);

    // TODO: Make stage values global and make this a #define:
    // NOTE: 752 in the last condition =
    //       (Boss 3 Stage width in pixels [8 * 96 = 768]) - (bullet GFX width [16])
    if ((s->x < -32 && bullet->qDX < 0) || ((s->x > (DISPLAY_WIDTH + 32)) && bullet->qDX > 0) || (s->y < -32 && bullet->qDY < 0)
        || ((s->y > (DISPLAY_HEIGHT + 32)) && bullet->qDY > 0) || (s->x < -Q(2)) || s->x > 752) {
        TaskDestroy(gCurTask);
        return;
    }

    if (bullet->totem->lives != 0) {
        bool32 res;

        res = Coll_Player_Enemy(s, I(bullet->qScreenX) + gCamera.x, I(bullet->qScreenY) + gCamera.y, 0, &gPlayer);

        if (res == TRUE && bullet->totem->unk35 == 0) {
            Sprite *s2;
            totem = bullet->totem;
            s2 = &totem->sprPilot;
            totem->unk34 = 30;
            s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s2->variant = res;
            s2->prevVariant = -1;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
