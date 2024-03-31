#include "global.h"
#include "malloc_vram.h"
#include "sakit/collision.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/bosses/common.h"
#include "game/player_callbacks_1.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 unkC; // dx ?
    /* 0x0E */ s16 unkE; // dy ?
    /* 0x10 */ s16 unk10;
    /* 0x12 */ u8 unk12;
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 unk14; // weapon lives?
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ u8 unk17;
    /* 0x18 */ u8 unk18;
    /* 0x19 */ u8 filler19[0x3];
} Totem3C; /* size: 0x1C */

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 unk8;
    /* 0x08 */ s16 unkA;
    /* 0x0C */ Vec2_32 qDiscPos[3];
    /* 0x24 */ s16 unk24[3][2];
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 unk32;
    /* 0x33 */ u8 unk33;
    /* 0x34 */ u8 unk34;
    /* 0x35 */ u8 unk35;
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
    /* 0x38 */ u8 unk38;
    /* 0x39 */ u8 unk39;
    /* 0x3A */ u8 unk3A;
    /* 0x3B */ u8 unk3B;
    /* 0x3C */ Totem3C unk3C[3];
    /* 0x90 */ s32 unk90; // some x
    /* 0x94 */ s32 unk94; // some y
    /* 0x98 */ s16 unk98; // dx
    /* 0x9A */ s16 unk9A; // dy
    /* 0x9C */ s32 unk9C; // some x
    /* 0xA0 */ s32 unkA0; // some y
    /* 0xA4 */ s16 unkA4; // dx
    /* 0xA6 */ s16 unkA6; // dy
    /* 0xA8 */ s32 unkA8; // some x
    /* 0xAC */ s32 unkAC; // some y
    /* 0xB0 */ s16 unkB0; // dx
    /* 0xB2 */ s16 unkB2; // dy
    /* 0xB4 */ s32 unkB4;
    /* 0xB8 */ s32 unkB8;
    /* 0xBC */ s32 unkBC;
    /* 0xC0 */ Sprite2 sprC0; // Main body
    /* 0xF8 */ Sprite sprF8[3];
    /* 0x188 */ Sprite3 spr188[3];
    /* 0x248 */ Sprite spr248[2];
    /* 0x2A8 */ Sprite spr2A8;
    /* 0x2D8 */ Sprite spr2D8;
    /* 0x308 */ Sprite spr308;
    /* 0x338 */ Sprite spr338;
    /* 0x368 */ Sprite spr368;
    /* 0x398 */ void *tilesEggman;
} EggTotem; /* size: 0x39C */

extern s16 sTotemDiscYs[3];
extern TileInfo gUnknown_080D7BB0[3];
extern TileInfo gUnknown_080D7BC8[2];
extern s16 gUnknown_080D7BDC[3];
extern u8 sOamOrderIds[3];

void sub_803F4B8(EggTotem *);
void sub_803F5E0(EggTotem *);
void sub_803F698(EggTotem *);
void sub_803FB88(EggTotem *);
void sub_804063C(EggTotem *);
void sub_80407A4(EggTotem *);
void sub_80408C4(EggTotem *);
void sub_8040A00(EggTotem *);
void sub_8040D74(EggTotem *);
void sub_8040E78(EggTotem *);
void sub_8040F14(EggTotem *);
void sub_8041264(EggTotem *);
void sub_80412B4(EggTotem *);
void Task_EggTotemMain(void);
void Task_8041138(void);
void TaskDestructor_EggTotemMain(struct Task *t);

// (95.90%) https://decomp.me/scratch/Ip1jY
NONMATCH("asm/non_matching/game/bosses/boss_3__CreateEggTotem.inc",
         void CreateEggTotem(void))
{
    struct Task *t;
    EggTotem *totem;
    Sprite *s;
    u8 i;
    void *tiles;

    gPlayer.unk3C = NULL;
    gPlayer.moveState &= ~MOVESTATE_8;
    gPlayer.moveState |= MOVESTATE_IGNORE_INPUT;

    sub_8039ED4();

    gPseudoRandom = gStageTime;

    t = TaskCreate(Task_EggTotemMain, sizeof(EggTotem), 0x4000, 0,
                   TaskDestructor_EggTotemMain);
    totem = TASK_DATA(t);

    if (DIFFICULTY_BOSS_IS_NOT_NORMAL) {
        totem->unk32 = 6;
    } else {
        totem->unk32 = 8;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        totem->unk32 = totem->unk32 /= 2u;
    }

    if (IS_FINAL_STAGE(gCurrentLevel)) {
        // _0803ED48
        totem->qWorldX = Q(13714);
        totem->qWorldY = Q(170);

        for (i = 0; i < ARRAY_COUNT(totem->qDiscPos); i++) {
            totem->qDiscPos[i].x = Q(13714);
            totem->qDiscPos[i].y = Q(170);
        }
        // _0803EE06

        for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
            totem->unk3C[i].qWorldX = Q(13714);
            totem->unk3C[i].qWorldY = Q(170) + sTotemDiscYs[i];

            totem->unk3C[i].unk8 = 0;
            totem->unk3C[i].unkA = 0;
            totem->unk3C[i].unkC = Q(3);
            totem->unk3C[i].unk12 = 0;
            totem->unk3C[i].unk13 = 0;
            totem->unk3C[i].unkE = 0;
            totem->unk3C[i].unk10 = 0;

#ifndef NON_MATCHING
            // This is inside a if(IS_FINAL_STAGE(gCurrentLevel)), anyway
            if (IS_FINAL_STAGE(gCurrentLevel))
#endif
            {
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

        for (i = 0; i < ARRAY_COUNT(totem->qDiscPos); i++) {
            totem->qDiscPos[i].x = Q(680);
            totem->qDiscPos[i].y = Q(170);
        }
        // _0803EF72

        for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
            totem->unk3C[i].qWorldX = Q(680);
            totem->unk3C[i].qWorldY = Q(170) + sTotemDiscYs[i];

            totem->unk3C[i].unk8 = 0;
            totem->unk3C[i].unkA = 0;
            totem->unk3C[i].unkC = Q(3);
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
    totem->tilesEggman = VramMalloc(4 * 2);

    s = &totem->sprC0.s;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(10 * 12);
    tiles = s->graphics.dest + 32 * TILE_SIZE_4BPP;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_BODY;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(23);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    s = &totem->spr368;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tiles;
    tiles += 68 * TILE_SIZE_4BPP;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_CART;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(23);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    s = &totem->spr338;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = tiles;
    tiles += 68 * TILE_SIZE_4BPP;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_ENERGY;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(23);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    for (i = 0; i < ARRAY_COUNT(totem->sprF8); i++) {
        s = &totem->sprF8[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(gUnknown_080D7BB0[i].numTiles);
        s->graphics.anim = gUnknown_080D7BB0[i].anim;
        s->variant = gUnknown_080D7BB0[i].variant;
        s->unk1A = SPRITE_OAM_ORDER(sOamOrderIds[i]);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    // _0803F1A8
    for (i = 0; i < ARRAY_COUNT(totem->spr188); i++) {
        s = &totem->spr188[i].s;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(10 * 3);
        s->graphics.anim = SA2_ANIM_EGG_TOTEM_PLATFORM;
        s->variant = 0;
        s->unk1A = SPRITE_OAM_ORDER(20);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    // _0803F206
    for (i = 0; i < ARRAY_COUNT(totem->spr248); i++) {
        s = &totem->spr248[i];
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(gUnknown_080D7BC8[i].numTiles);
        s->graphics.anim = gUnknown_080D7BC8[i].anim;
        s->variant = gUnknown_080D7BC8[i].variant;
        s->unk1A = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    s = &totem->spr2A8;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(12);
    s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(22);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    // Tails captured animation
    if (!IS_FINAL_STAGE(gCurrentLevel) && gSelectedCharacter == CHARACTER_SONIC
        && gLoadedSaveGame->unlockedLevels[CHARACTER_SONIC] <= gCurrentLevel) {
        // __tails_kidnap
        s = &totem->spr2D8;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(5 * 6);
        s->graphics.anim = SA2_ANIM_TAILS_CAPTURED;
        s->variant = 0;
        s->unk1A = SPRITE_OAM_ORDER(20);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        s = &totem->spr308;
        s->x = 0;
        s->y = 0;
        s->graphics.dest = VramMalloc(4 * 5);
        s->graphics.anim = SA2_ANIM_EGG_TOTEM_HOOK;
        s->variant = 0;
        s->unk1A = SPRITE_OAM_ORDER(21);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    } else {
        totem->spr2D8.graphics.dest = NULL;
        totem->spr308.graphics.dest = NULL;
    }

    gActiveBossTask = t;
}
END_NONMATCH

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

    if (totem->unk32 == 0) {
        Player_DisableInputAndBossTimer();

        if (gPlayer.unk3C != NULL || gPlayer.moveState & MOVESTATE_8) {
            gPlayer.unk3C = NULL;

            gPlayer.moveState &= ~MOVESTATE_8;
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

    totem->qDiscPos[0].x = totem->qWorldX + gUnknown_080D7BDC[0];
    totem->qDiscPos[0].y = totem->qWorldY - Q(12);

    totem->unk24[0][0] = +Q(5);
    totem->unk24[0][1] = -Q(3);

    totem->qDiscPos[1].x = totem->qWorldX + gUnknown_080D7BDC[1];
    totem->qDiscPos[1].y = totem->qWorldY - Q(12);

    totem->unk24[1][0] = +Q(5);
    totem->unk24[1][1] = -Q(3);

    totem->qDiscPos[2].x = totem->qWorldX + gUnknown_080D7BDC[2];
    totem->qDiscPos[2].y = totem->qWorldY - Q(6);

    totem->unk24[2][0] = +Q(5);
    totem->unk24[2][1] = -Q(3);

    totem->unk9C = totem->qWorldX;
    totem->unkA0 = totem->qWorldY;
    totem->unkA4 = +Q(5);
    totem->unkA6 = -Q(2);

    totem->unk90 = totem->qWorldX;
    totem->unk94 = totem->qWorldY;
    totem->unk98 = +Q(5);
    totem->unk9A = -Q(1);

    totem->unkA8 = totem->qWorldX;
    totem->unkAC = totem->qWorldY - Q(26);
    totem->unkB0 = +Q(5);
    totem->unkB2 = -Q(0);

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];
        t3c->unk8 = +Q(5);
        t3c->unkA = -Q(1);
        t3c->unk18 = i * 12 + 1;
    }

    if (totem->spr2D8.graphics.dest != NULL) {
        Sprite *s = &totem->spr2D8;

        totem->unkB8 = totem->qWorldX - Q(40);
        totem->unkBC = totem->qWorldY - Q(98);

        s->graphics.anim = SA2_ANIM_TAILS_CAPTURED;
        s->variant = 1;
    }
}

void sub_803F5E0(EggTotem *totem)
{
    Sprite *s = (Sprite *)&totem->sprC0;

    s32 worldX = I(totem->qWorldX);
    s32 worldY = I(totem->qWorldY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    sub_800CA20(s, worldX, worldY, 1, &gPlayer);

    if (sub_800C320(s, worldX, worldY, 0, &gPlayer) == TRUE) {
        sub_8040D74(totem);
    } else if (sub_800CA20(s, worldX, worldY, 0, &gPlayer) == TRUE) {
        sub_80412B4(totem);
    }

    sub_80122DC(totem->qWorldX, totem->qWorldY - Q(DISPLAY_HEIGHT / 2));

    if (totem->unk35 == 0) {
        if (IsColliding_Cheese(s, worldX, worldY, 0, &gPlayer) == TRUE) {
            sub_8040D74(totem);
        }
    }
}