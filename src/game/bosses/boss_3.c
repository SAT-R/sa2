#include "global.h"
#include "global.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "sakit/collision.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/parameters/bosses.h"
#include "game/player_callbacks_1.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

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

            totem->unk3C[i].qUnk8 = 0;
            totem->unk3C[i].qUnkA = 0;
            totem->unk3C[i].qUnkC = SIN_DEG(270);
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

            totem->unk3C[i].qUnk8 = 0;
            totem->unk3C[i].qUnkA = 0;
            totem->unk3C[i].qUnkC = SIN_DEG(270);
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

    if (totem->spr2D8.graphics.dest != NULL) {
        Sprite *s = &totem->spr2D8;

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

    sub_800CA20(s, worldX, worldY, 1, &gPlayer);

    if (sub_800C320(s, worldX, worldY, 0, &gPlayer) == TRUE) {
        sub_8040D74(totem);
    } else if (sub_800CA20(s, worldX, worldY, 0, &gPlayer) == TRUE) {
        sub_80412B4(totem);
    }

    Player_UpdateHomingPosition(totem->qWorldX, totem->qWorldY - BOSS5_HEIGHT);

    if (totem->unk35 == 0) {
        if (IsColliding_Cheese(s, worldX, worldY, 0, &gPlayer) == TRUE) {
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

    s = &totem->spr2A8;
    s->x = I(totem->qWorldX) - gCamera.x;
    s->y = I(totem->qWorldY) - gCamera.y - 82;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    for (i = 0; i < ARRAY_COUNT(totem->sprF8); i++) {
        s = &totem->sprF8[i];
        s->x = I(totem->qDiscPos[i].x) - gCamera.x;
        s->y = I(totem->qDiscPos[i].y) - gCamera.y - 14;

        if (i == 2) {
            s->y += 6;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        Totem3C *t3c = &totem->unk3C[i];
        s = &totem->spr188[i].s;
        s->x = I(t3c->qWorldX) - gCamera.x;
        s->y = I(t3c->qWorldY) - gCamera.y;
        s->animSpeed = (SIN_24_8(t3c->qUnkC) >> 3) + 0x20;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        if (t3c->unk17 != 0) {
            s8 r3;
            s = (t3c->unk14 != 0) ? &totem->spr248[0] : &totem->spr248[1];

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

    if (totem->spr2D8.graphics.dest != NULL) {
        s = &totem->spr308;

        s->x = I(totem->qWorldX) - gCamera.x - 16;
        s->y = I(totem->qWorldY) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);

        s = &totem->spr2D8;
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

    for (i = 0; i < ARRAY_COUNT(totem->sprF8); i++) {
        s = &totem->sprF8[i];

        s->x = I(totem->qDiscPos[i].x) - gCamera.x;
        s->y = I(totem->qDiscPos[i].y) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    result = FALSE;

    if (totem->unk37 == 0) {
        s = &totem->spr338;
        s->x = I(totem->qUnkA8) - gCamera.x;
        s->y = I(totem->qUnkAC) - gCamera.y;

        if (UpdateSpriteAnimation(s) == ACMD_RESULT__ENDED) {
            result = TRUE;
            totem->unk37 = TRUE;
        }

        DisplaySprite(s);
    }

    s = &totem->spr368;
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
        s = &totem->spr2A8;
        s->x = I(totem->qUnk90) - gCamera.x;
        s->y = I(totem->qUnk94) - gCamera.y - 81;

        if (s->x < 50) {
            CreateEggmobileEscapeSequence(I(totem->qUnk90) - gCamera.x - 4,
                                          I(totem->qUnk94) - gCamera.y - 79, 0x2000);

            totem->unk3A = TRUE;
        }

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    for (i = 0; i < ARRAY_COUNT(totem->spr188); i++) {
        Totem3C *t3c = &totem->unk3C[i];

        s = &totem->spr188[i].s;
        s->x = I(t3c->qWorldX) - gCamera.x;
        s->y = I(t3c->qWorldY) - gCamera.y;
        DisplaySprite(s);
    }

    if (totem->spr2D8.graphics.dest != NULL) {
        s = &totem->spr2D8;
        s->x = I(totem->qUnkB8) - gCamera.x;
        s->y = I(totem->qUnkBC) - gCamera.y;
        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }

    return result;
}

NONMATCH("asm/non_matching/game/bosses/boss_3__EggTotemMove.inc",
         void EggTotemMove(s32 dx, s32 dy))
{
    u8 i;
    EggTotem *totem = TASK_DATA(gActiveBossTask);

    totem->qWorldX += dx;
    totem->qWorldY += dy;

    for (i = 0; i < ARRAY_COUNT(totem->qDiscPos); i++) {
        totem->qDiscPos[i].x += dx;
        totem->qDiscPos[i].y += dy;
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
END_NONMATCH

// (95.78%) https://decomp.me/scratch/ousCM
NONMATCH("asm/non_matching/game/bosses/boss_3__sub_803FB88.inc",
         void sub_803FB88(EggTotem *totem))
{
    s32 discY;
    s32 res;
    u8 i;

    Totem_UpdateWorldPos(totem);

    discY = 0;

    for (i = 0; i < ARRAY_COUNT(totem->qDiscPos); i++) {
        totem->qDiscPos[i].x = totem->qWorldX + gUnknown_080D7BDC[i];

        if (i == 0) {
            totem->qDiscPos[i].y += 6;
        }

        discY += totem->qDiscPos[i].y;

        res = sub_801F100(I(totem->qDiscPos[i].y) - 1, I(totem->qDiscPos[i].x), 1, +8,
                          sub_801EC3C);

        totem->qDiscPos[i].y += Q(res + 1);
    }

    res = Div(discY, 3) - Q(2.0);
    totem->unk30 = totem->qWorldY - res;
    totem->qWorldY = res;
}
END_NONMATCH

// (91.19%) https://decomp.me/scratch/29ZCq
NONMATCH("asm/non_matching/game/bosses/boss_3__sub_803FC14.inc",
         void sub_803FC14(EggTotem *totem))
{
    u8 i;
    u8 numCreatedParts;
    ExplosionPartsInfo info;
    s32 divRes;
    s32 v;

    for (i = 0; i < ARRAY_COUNT(totem->qDiscPos); i++) {
        totem->qDiscPos[i].x += totem->unk24[i][0];
    }

    totem->qUnk9C += totem->qUnkA4;
    totem->qUnk90 += totem->qUnk98;

    if (Mod(gStageTime, 14) == 0) {
        s32 rnd = PseudoRandom32();
        info.spawnX = (I(totem->qUnk90) - gCamera.x) + (rnd % 64u) - 31;

        rnd = PseudoRandom32();
        info.spawnY = ((I(totem->qUnk94) - gCamera.y) + (rnd % 32u)) - 75;

        info.velocity = 0;

        rnd = PseudoRandom32();
        info.rotation = 1000 - (rnd % 64u);

        rnd = PseudoRandom32();
        info.speed = BOSS_EXPLOSION_VELOCITY_X - (rnd % 512u);
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
        info.spawnY = ((I(totem->qUnkA0) - gCamera.y) + (rnd % 32u)) - 75;

        info.velocity = 0;
        info.rotation = 1000 - (PseudoRandom32() % 64u);

        info.speed = BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u);
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
            for (i = 0; i < 4; i++) {
                s32 rnd = PseudoRandom32();
                info.spawnX = ((I(t3c->qWorldX) - gCamera.x) + (rnd % 64u)) - 31;

                rnd = PseudoRandom32();
                info.spawnY = ((I(t3c->qWorldY) - gCamera.y) + (rnd % 8u)) - 3;
                info.velocity = 0;
                info.rotation = 1000 - (PseudoRandom32() % 64u);
                info.speed = BOSS_EXPLOSION_VELOCITY_X - (PseudoRandom32() % 512u);
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
END_NONMATCH
