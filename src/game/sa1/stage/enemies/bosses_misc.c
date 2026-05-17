#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/enemies/bosses_shared.h"
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/screen_shake.h"
#include "game/sa1/ui/stage_results.h" // CreateStageResults
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ SpriteTransform transform;
    /* 0x6C */ CamCoord worldX;
    /* 0x6E */ CamCoord worldY;
    /* 0x70 */ s16 offsetX;
    /* 0x72 */ s16 offsetY;
    /* 0x74 */ s16 unk74;
    /* 0x74 */ u16 unk76;
} BossCapsule;

typedef struct {
    /* 0x00 */ s16 unk0;
    /* 0x02 */ s16 unk2;
    /* 0x04 */ s16 unk4;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
} Strc_sub_801749C;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 qUnk30;
    /* 0x30 */ s32 qUnk34;
    /* 0x38 */ s16 unk38;
    /* 0x38 */ s16 unk3A;
    /* 0x38 */ s16 qUnk3C;
    /* 0x38 */ s16 qUnk3E;
    /* 0x38 */ s16 qUnk40;
} Strc_sub_8016D80;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x40 */ u16 unk44;
    /* 0x40 */ s16 unk46;
    /* 0x40 */ s16 qUnk48;
    /* 0x48 */ u8 filler4A[0x2];
    /* 0x40 */ u16 unk4C;
    /* 0x40 */ s16 unk4E;
    /* 0x40 */ u16 unk50;
    /* 0x40 */ s16 unk52;
} Strc_sub_8016F44; /* 0x54 */

typedef struct {
    /* 0x00 */ CamCoord unk0;
    /* 0x02 */ CamCoord unk2;
    /* 0x04 */ CamCoord unk4;
    /* 0x06 */ CamCoord unk6;
} CameraPanning;

typedef struct {
    /* 0x00 */ s16 unk0;
    /* 0x02 */ s16 unk2;
    /* 0x04 */ Player *p;
} Strc_sub_801766C;

void Task_BossCapsuleInit(void);
void Task_801623C(void);
void Task_8016650(void);
void Task_BossCapsuleUpdate(void);
void sub_801766C(Player *p);
Task *sub_801749C(CamCoord worldX, CamCoord worldY);
void Task_801685C(void);
void Task_8016A14(void); // :Strc_sub_80168F0
void Task_8016B6C(void); // :Strc_sub_801749C
Task *sub_8016D80(CamCoord worldX, CamCoord worldY, AnimId anim, u8 variant); // -> Strc_sub_8016D80
Task *sub_8016F44(CamCoord worldX, CamCoord worldY, AnimId anim, u8 variant); // -> Strc_sub_8016F44

void sub_8017054(void);
void Task_8017244(void); // :CameraPanning
void Task_8017400(void);

void TaskDestructor_BossCapsule(Task *t);
void TaskDestructor_sub_80168F0(Task *t);

extern u16 gUnknown_080BB43C[5][3];

void CreateBossCapsule(CamCoord worldX, CamCoord worldY)
{
    Task *t;
    BossCapsule *capsule;
    Sprite *s;
    SpriteTransform *tf;

    t = TaskCreate(Task_BossCapsuleInit, sizeof(BossCapsule), 0x2000U, 0U, TaskDestructor_BossCapsule);
    capsule = TASK_DATA(t);

    capsule->worldX = worldX;
    capsule->worldY = worldY;
    capsule->offsetX = 0;
    capsule->offsetY = 0;
    capsule->unk74 = 0x800;

    s = &capsule->s;
    s->x = worldX;
    s->y = worldY;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_CAPSULE_LARGE);
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_CAPSULE_SMALL;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2030;

    s = &capsule->s2;
    s->x = worldX;
    s->y = worldY;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_CAPSULE_SWITCH);
    s->oamFlags = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_CAPSULE_SWITCH;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    tf = &capsule->transform;
    tf->rotation = 0;
    tf->qScaleX = Q(0.25);
    tf->qScaleY = Q(0.25);
}

void Task_BossCapsuleInit()
{
    BossCapsule *matchCapsule = TASK_DATA(gCurTask);
    BossCapsule *capsule = matchCapsule;
    SpriteTransform *tf = &capsule->transform;
    Sprite *s = &capsule->s;

    tf->x = capsule->worldX - gCamera.x;
    tf->y = (capsule->worldY - gCamera.y) - capsule->offsetY;
    if (tf->qScaleX < Q(1)) {
        tf->qScaleY = tf->qScaleX = tf->qScaleX + 8;
    }
    tf->rotation += 0x10;

    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);

    capsule->unk74 -= 0x10;
    capsule->offsetY += I(capsule->unk74);

    if (capsule->offsetY > 0xE0) {
        gCurTask->main = Task_801623C;
        capsule->unk76 = 0;
        s->graphics.anim = 0x23F;
        s->variant = 0;
        s->frameFlags &= ~0x20;
    }
}

// TODO: Register fake-match...
void Task_801623C()
{
    Player *p;
    Sprite *s;
    Sprite *s2;
    s32 res;
    s32 sideX;
    s32 i;

    BossCapsule *capsule = TASK_DATA(gCurTask);

    s = &capsule->s;
    s2 = &capsule->s2;
    s->x = DISPLAY_CENTER_X;
    s->y = (capsule->worldY - gCamera.y) - capsule->offsetY;
    s2->x = s->x;
    s2->y = s->y;
    if (s->y >= 0) {
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        DisplaySprite(s);
        DisplaySprite(s2);
    }

    capsule->unk74 -= 0x10;
    capsule->offsetY += I(capsule->unk74);
    if (s->y < 96) {
        return;
    }

    res = SA2_LABEL(sub_801F100)(gCamera.y + s->y + 8, gCamera.x + s->x, 1, 8, SA2_LABEL(sub_801EC3C));
    if (res > 0) {
        return;
    }
    capsule->worldY = (capsule->worldY - capsule->offsetY) + res;
    gCurTask->main = Task_BossCapsuleUpdate;
    capsule->worldX = gCamera.x + DISPLAY_CENTER_X;
    CreateScreenShake(0x800U, 0x40U, 0x100U, -1U, 0x80U);
    m4aSongNumStart(SE_136);

    i = 0;
    do {
#ifndef NON_MATCHING
        register s32 r0 asm("r0");
#endif
        p = &PLAYER(i);

        if ((Coll_Player_Entity_Intersection(s, capsule->worldX, capsule->worldY, p) & 0x80000)
            || (Coll_Player_Entity_Intersection(s2, capsule->worldX, capsule->worldY, p) & 0x80000)) {
            p->timerInvulnerability = TIME(0, 2);
            if (I(p->qWorldX) < gCamera.x + DISPLAY_CENTER_X) {
                p->qSpeedAirX = -Q(2);
                sideX = (capsule->worldX + s->hitboxes[0].b.left) - p->spriteOffsetX;
                if (I(p->qWorldX) > sideX) {
                    p->qWorldX = Q(sideX);
                }
            } else {
                p->qSpeedAirX = +Q(2);
                sideX = (capsule->worldX + s->hitboxes[0].b.right) + p->spriteOffsetX;
                if (I(p->qWorldX) < sideX) {
                    p->qWorldX = Q(sideX);
                }
            }

            if (MOVESTATE_IN_WATER & p->moveState) {
                p->qSpeedAirY = -0x2A0;
            } else {
                p->qSpeedAirY = -0x4E0;
            }

            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            p->moveState &= ~MOVESTATE_20;
            p->moveState &= ~MOVESTATE_SPIN_ATTACK;
            p->moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
            p->moveState |= MOVESTATE_IN_AIR;
            p->moveState &= ~MOVESTATE_SPINDASH;
            p->moveState &= ~MOVESTATE_100;
            p->charState = CHARSTATE_15;

            PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 14)
            p->SA2_LABEL(unk61) = 0;
            p->SA2_LABEL(unk62) = 0;
        }

#ifndef NON_MATCHING
        r0 = 1;
        i += r0;
        asm("" ::"r"(r0));
#else
        i++;
#endif
    } while (i < gNumSingleplayerCharacters);
}

void Task_BossCapsuleUpdate(void)
{
    s32 var_r4;
    s32 var_sl;

    BossCapsule *capsule;
    s32 sp4;
    Sprite *s;
    Sprite *s2;

    sp4 = 0;
    capsule = TASK_DATA(gCurTask);
    s = &capsule->s;
    s2;

    s2 = &capsule->s2;
    s->x = capsule->worldX - gCamera.x;
    s->y = capsule->worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);

    {
        s32 i = 0;
        do {
            Player *p = &PLAYER(i);

            if (p->charState != CHARSTATE_15) {
                CamCoord prevPlayerY = I(gPlayer.qWorldY);
                Coll_Player_Platform(s, capsule->worldX, capsule->worldY, p);

                if (PLAYER_IS_ALIVE && ((prevPlayerY < I(gPlayer.qWorldY)) || (capsule->worldY < I(gPlayer.qWorldY)))) {
                    p->qWorldX = Q((capsule->worldX + s->hitboxes[0].b.left) - p->spriteOffsetX);
                    p->qWorldY = Q(capsule->worldY - p->spriteOffsetY);
                }

                if ((8 & Coll_Player_Platform(s2, capsule->worldX, capsule->worldY, p))
                    || (Coll_AmyHammer_Spring(s2, capsule->worldX, capsule->worldY, p) != 0)) {
                    sp4 = 1;
                }
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    if (sp4) {
        gCurTask->main = Task_8016650;
        gStageFlags |= 3;
        s->graphics.anim = SA1_ANIM_BOSS_CAPSULE_LARGE;
        s->variant = 1;
        m4aSongNumStart(0x89U);

        {
            s32 i = 0;

            do {
                Player *p = &PLAYER(i);
                p->qSpeedGround = 0;
                p->moveState |= 0x200000;
                p->heldInput = 0;
                sub_801766C(p);
            } while (++i < gNumSingleplayerCharacters);
        }
    }
}

void Task_8016650(void)
{
    s32 var_r4;
    s32 var_sl;

    BossCapsule *capsule;
    Sprite *s;
    Sprite *s2;
    AnimCmdResult acmdRes;

    capsule = TASK_DATA(gCurTask);
    s = &capsule->s;
    s2 = &capsule->s2;
    s->x = capsule->worldX - gCamera.x;
    s->y = capsule->worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y + 4;
    acmdRes = UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    {
        s32 i = 0;
        do {
            Player *p = &PLAYER(i);

            if (p->charState != CHARSTATE_15) {
                CamCoord prevPlayerY = I(gPlayer.qWorldY);
                Coll_Player_Platform(s, capsule->worldX, capsule->worldY, p);
                Coll_Player_Platform(s2, capsule->worldX, capsule->worldY + 4, p);
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    DisplaySprite(s);
    DisplaySprite(s2);

    if (acmdRes == ACMD_RESULT__ENDED) {
        Strc_sub_80168F0 *strcA;
        Strc_sub_80168F0 *strcB;
        s32 i = 0;

        do {
            Player *p = &PLAYER(i);

            if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && (p->stoodObj == s2)) {
                p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                p->moveState |= MOVESTATE_IN_AIR;
            }
        } while (++i < gNumSingleplayerCharacters);

        gCurTask->main = Task_801685C;
        s->graphics.anim = SA1_ANIM_BOSS_CAPSULE_LARGE;
        s->variant = 2;

        strcA = TASK_DATA(sub_80168F0(capsule->worldX, capsule->worldY, 0x40, 0x241, 0U));
        strcA->qUnk44 = -Q(1);
        strcA->qUnk46 = -Q(2);
        strcA->unk48 = 0;
        strcA->unk42 = 4;
        strcA->unk40 = 0x3C;

        strcB = TASK_DATA(sub_80168F0(capsule->worldX, capsule->worldY, 0x40, 0x241, 0U));
        strcB->qUnk44 = +Q(1);
        strcB->qUnk46 = -Q(2);
        strcB->unk48 = 0;
        strcB->unk42 = 4;
        strcB->transform.qScaleX = -Q(1);
        strcB->unk40 = 0x3C;

        sub_801749C(capsule->worldX, capsule->worldY);
    }
}

void Task_801685C(void)
{
    BossCapsule *capsule = TASK_DATA(gCurTask);
    Sprite *s = &capsule->s;

    s->x = capsule->worldX - gCamera.x;
    s->y = capsule->worldY - gCamera.y;
    UpdateSpriteAnimation(s);

    {
        s32 i = 0;

        do {
            Player *p = &PLAYER(i);

            if (p->charState != CHARSTATE_15) {
                Coll_Player_Platform(s, capsule->worldX, capsule->worldY, p);
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    DisplaySprite(s);
}

Task *sub_80168F0(CamCoord worldX, CamCoord worldY, u16 numTiles, AnimId anim, u8 variant)
{
    SpriteTransform *spC;
    s32 sp10;
    SpriteTransform *temp_r2;
    Task *t;
    Strc_sub_80168F0 *strc;

    t = TaskCreate(Task_8016A14, sizeof(Strc_sub_80168F0), 0x2000U, 0U, TaskDestructor_sub_80168F0);

    strc = TASK_DATA(t);
    temp_r2 = &strc->transform;
    strc->unk40 = 0x3C;
    strc->unk3C = worldX;
    strc->unk3E = worldY;
    strc->qUnk44 = +Q(1);
    strc->qUnk46 = -Q(2);
    strc->unk48 = 8;
    spC = temp_r2;
    sp10 = 0;
    strc->s.graphics.dest = VramMalloc(numTiles);
    strc->s.oamFlags = SPRITE_OAM_ORDER(20);
    strc->s.graphics.size = 0;
    strc->s.graphics.anim = anim;
    strc->s.variant = variant;
    strc->s.animCursor = 0;
    strc->s.qAnimDelay = 0;
    strc->s.prevVariant = -1;
    strc->s.animSpeed = SPRITE_ANIM_SPEED(1.0);
    strc->s.palId = 0;
    strc->s.frameFlags = 0x70;
    temp_r2->rotation = 0;
    temp_r2->qScaleX = Q(1);
    temp_r2->qScaleY = Q(1);
    temp_r2->x = worldX;
    temp_r2->y = worldY;
    UpdateSpriteAnimation(&strc->s);
    return t;
}

void Task_8016A14()
{
    Strc_sub_80168F0 *strc = TASK_DATA(gCurTask);
    SpriteTransform *tf;

    tf = &strc->transform;
    if (strc->unk40-- == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    strc->qUnk46 += Q(40. / 256.);

    strc->unk3C += I(strc->qUnk44);
    strc->unk3E += I(strc->qUnk46);
    tf->x = strc->unk3C - gCamera.x;
    tf->y = strc->unk3E - gCamera.y;

    if (strc->qUnk44 > 0) {
        tf->rotation = (tf->rotation + strc->unk42) & 0x3FF;
        if (tf->qScaleX > -Q(2)) {
            tf->qScaleX -= strc->unk48;
        }

        if (tf->qScaleX >= 0) {
            tf->qScaleY = tf->qScaleX;
        } else {
            tf->qScaleY = -tf->qScaleX;
        }
    } else {
        tf->rotation = (tf->rotation - strc->unk42) & 0x3FF;

        if (tf->qScaleX < +Q(2)) {
            tf->qScaleX += strc->unk48;
        }

        if (tf->qScaleX >= 0) {
            tf->qScaleY = tf->qScaleX;
        } else {
            tf->qScaleY = -tf->qScaleX;
        }
    }

    if (0x20 & strc->s.frameFlags) {
        strc->s.frameFlags = strc->s.frameFlags & ~0x1F;
        strc->s.frameFlags |= gOamMatrixIndex++;
        TransformSprite(&strc->s, tf);
    } else {
        strc->s.x = tf->x;
        strc->s.y = tf->y;
    }
    DisplaySprite(&strc->s);
}

void Task_8016B6C(void)
{
    s32 temp_r0_2;
    s32 temp_r0_4;
    s32 var_r4;
    u16 temp_r1;

    Strc_sub_801749C *strc;
    Strc_sub_8016D80 *strc44;
    Strc_sub_8016F44 *strc54;

    strc = TASK_DATA(gCurTask);

    if ((strc->unk4++ & 0x3) == 0) {
        if (strc->unk4 != 5) {
            strc44 = TASK_DATA(sub_8016D80(strc->unk0, strc->unk2 - 32, gUnknown_080BB43C[LEVEL_TO_ZONE(gCurrentLevel)][0], 0));
            var_r4 = PseudoRandom32();
            strc44->qUnk3E += var_r4 & 0xFF;
            if (1 & strc->unk8) {
                strc44->qUnk3E = -strc44->qUnk3E;
            }
            strc44->qUnk3C += ((u32)(0x1F00 & var_r4) >> 4);
            strc44->qUnk40 = strc44->qUnk3C;
        }

        strc44 = TASK_DATA(sub_8016D80(strc->unk0, strc->unk2 - 32, gUnknown_080BB43C[LEVEL_TO_ZONE(gCurrentLevel)][1], 0));
        var_r4 = PseudoRandom32();
        strc44->qUnk3E += var_r4 & 0xFF;
        if (!(1 & strc->unk8)) {
            strc44->qUnk3E = -strc44->qUnk3E;
        }
        strc44->qUnk3C += ((u32)(0x1F00 & var_r4) >> 4);
        strc44->qUnk40 = strc44->qUnk3C;
        if (strc->unk4 != 5) {
            strc54 = TASK_DATA(sub_8016F44(strc->unk0, strc->unk2 - 32, 0x1C0, 0));
            var_r4 = PseudoRandom32();
            strc54->unk52 += (var_r4 & 7);
            if (1 & strc->unk8) {
                strc54->unk52 = -strc54->unk52;
                strc54->unk50 = 0x200;
            }
            strc54->unk4E = ((s32)gPlayer.qWorldY >> 8) - 0x20;
        }
        strc54 = TASK_DATA(sub_8016F44(strc->unk0, strc->unk2 - 32, 0x1BA, 0));
        var_r4 >>= 8;
        strc54->unk52 += ((var_r4)&7);
        if (1 & strc->unk8) {
            strc54->unk52 = -strc54->unk52;
            strc54->unk50 = 0x200;
        }
        strc54->unk4E = I(gPlayer.qWorldY) - 32;
        strc->unk8++;
    }
    if (strc->unk4 > 12) {
        strc->unk4 = 0;
        strc->unk6 = 0;
        TaskDestroy(gCurTask);
    }
}

void sub_8016E54(void);
void TaskDestructor_sub_8017658(Task *t);

Task *sub_8016D80(s16 worldX, s16 worldY, u16 anim, u8 variant)
{
    Task *t;
    Strc_sub_8016D80 *strc;

    t = TaskCreate(sub_8016E54, sizeof(Strc_sub_8016D80), 0x2000U, 0U, TaskDestructor_sub_8017658);

    strc = TASK_DATA(t);
    strc->unk38 = (u16)worldX;
    strc->unk3A = (u16)worldY;
    strc->qUnk3C = -Q(4);
    strc->qUnk40 = -Q(4);
    strc->qUnk3E = Q(1);
    strc->qUnk34 = 0;
    strc->qUnk30 = 0;
    strc->s.graphics.dest = VramMalloc(4U);
    strc->s.oamFlags = 0x3C0;
    strc->s.graphics.size = 0;
    strc->s.graphics.anim = anim;
    strc->s.variant = variant;
    strc->s.animCursor = 0;
    strc->s.qAnimDelay = 0;
    strc->s.prevVariant = 0xFF;
    strc->s.animSpeed = 0x10;
    strc->s.palId = 0;
    strc->s.frameFlags = 0x2000;

    return t;
}

void sub_8016E54()
{
    Strc_sub_8016D80 *strc = TASK_DATA(gCurTask);
    Sprite *s = &strc->s;

    strc->qUnk3C += Q(40. / 256.);
    strc->qUnk34 += strc->qUnk3C;
    strc->qUnk30 += strc->qUnk3E;

    if ((strc->qUnk3C > 0)
        && (SA2_LABEL(sub_801F100)(strc->unk3A + I(strc->qUnk34), strc->unk38 + I(strc->qUnk30), 1, 8, SA2_LABEL(sub_801EC3C)) < 0)) {
        strc->qUnk3C = strc->qUnk40;

        if ((I(strc->qUnk30) < -32) && (strc->qUnk3E < 0)) {
            strc->qUnk3E = -strc->qUnk3E;
        } else if ((I(strc->qUnk30) > 32) && (strc->qUnk3E > 0)) {
            strc->qUnk3E = -strc->qUnk3E;
        }
    }

    if (strc->qUnk3E < 0) {
        s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
    } else {
        s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
    }

    s->x = (I(strc->qUnk30) + strc->unk38) - gCamera.x;
    s->y = (I(strc->qUnk34) + strc->unk3A) - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

Task *sub_8016F44(CamCoord worldX, CamCoord worldY, AnimId anim, u8 variant)
{
    Strc_sub_8016F44 *strc;
    Task *t;
    SpriteTransform *tf;
    Sprite *s;

    t = TaskCreate(sub_8017054, sizeof(Strc_sub_8016F44), 0x2000U, 0U, TaskDestructor_sub_8017658);
    strc = TASK_DATA(t);
    s = &strc->s;
    tf = &strc->transform;
    strc->unk44 = worldX;
    strc->unk46 = worldY;
    strc->qUnk48 = -Q(4);
    strc->unk40 = 0;
    strc->unk3C = 0;
    strc->unk4C = 0;
    strc->unk4E = 0;
    strc->unk50 = 0;
    strc->unk52 = 1;
    s->graphics.dest = VramMalloc(4U);
    s->oamFlags = 0x500;
    s->graphics.size = 0;
    s->graphics.anim = anim;
    s->variant = variant;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->frameFlags = 0x2070;
    tf->rotation = 0;
    tf->qScaleX = 0x100;
    tf->qScaleY = 0x100;

    return t;
}

void sub_8017054()
{
    Strc_sub_8016F44 *strc;
    SpriteTransform *tf;
    s16 *temp_r1;
    s16 *temp_r2;
    s16 *temp_r3;
    s16 temp_r0;
    s16 var_r0_2;
    u16 temp_r2_2;
    u16 temp_r2_3;
    u16 var_r0;
    u8 temp_r1_2;
    s32 sinA, sinB;
    s32 cosA;
    s16 cosB;
    Sprite *s;

    strc = TASK_DATA(gCurTask);
    s = &strc->s;
    tf = &strc->transform;
    strc->unk4C = (strc->unk4C + 0x10) & 0x3FF;
    strc->unk50 = (strc->unk50 + strc->unk52) & 0x3FF;
    sinA = SIN(strc->unk4C);
    strc->unk40 = sinA >> 2;
    strc->unk3C = SIN(strc->unk50);
    cosA = COS(strc->unk50);
    cosB = (cosA >> 8) + Q(1);
    tf->qScaleY = cosB;

    if (tf->qScaleY > Q(1)) {
        s->oamFlags = 0x3C0;
    } else {
        s->oamFlags = 0x440;
    }

    if (strc->unk52 > 0) {
        if (((strc->unk50 - Q(1)) & 0x200)) {
            tf->qScaleX = -cosB;
        } else {
            tf->qScaleX = cosB;
        }
    } else {
        if ((strc->unk50 - Q(1)) & 0x200) {
            tf->qScaleX = cosB;
        } else {
            tf->qScaleX = -cosB;
        }
    }

    temp_r0 = strc->unk46 - strc->unk4E;
    if (temp_r0 > 0) {
        strc->unk46--;
    } else if (temp_r0 < 0) {
        strc->unk46++;
    }

    tf->x = (strc->unk44 + I(strc->unk3C)) - gCamera.x;
    tf->y = (strc->unk46 + I(strc->unk40)) - gCamera.y;
    s->frameFlags &= ~0x1F;
    s->frameFlags |= gOamMatrixIndex++;
    UpdateSpriteAnimation(s);
    TransformSprite(s, tf);
    DisplaySprite(s);
}

Task *Bosses_SetCamBounds(CamCoord minY, CamCoord maxY, CamCoord minX, CamCoord maxX)
{
    s16 temp_r1;
    Task *t;
    CameraPanning *temp_r2;

    t = TaskCreate(Task_8017244, 8U, 0x2000U, 0U, NULL);
    temp_r2 = TASK_DATA(t);
    temp_r2->unk0 = minY;
    temp_r2->unk2 = maxY;
    temp_r2->unk4 = minX;
    temp_r2->unk6 = maxX;
    gCamera.minY = gCamera.y;
    gCamera.maxY = gCamera.y + DISPLAY_HEIGHT;
    gCamera.minX = gCamera.x;
    gCamera.maxX = maxX;
    if (temp_r2->unk2 > gCamera.maxY) {
        gCamera.maxY = gCamera.y + 320;
    }
    return t;
}

void Task_8017244()
{
    CameraPanning *strc = TASK_DATA(gCurTask);

    if (strc->unk0 > gCamera.minY) {
        gCamera.minY++;
    } else if (strc->unk0 < gCamera.minY) {
        gCamera.minY--;
    }

    if (strc->unk2 > gCamera.maxY) {
        gCamera.maxY++;
    } else if (strc->unk2 < gCamera.maxY) {
        gCamera.maxY--;
    }

    if (strc->unk4 > gCamera.minX) {
        gCamera.minX++;
    } else if (strc->unk4 < gCamera.minX) {
        gCamera.minX--;
    }
    if ((strc->unk0 == gCamera.minY) && (strc->unk2 == gCamera.maxY) && (strc->unk4 == gCamera.minX) && (strc->unk6 == gCamera.maxX)) {
        TaskDestroy(gCurTask);
    }
}

void Task_PreBossCameraPan(void)
{
    CameraPanning *strc = TASK_DATA(gCurTask);

    if (strc->unk0 > gCamera.minY) {
        gCamera.minY++;
    } else if (strc->unk0 < gCamera.minY) {
        gCamera.minY--;
    }

    if (strc->unk2 > gCamera.maxY) {
        gCamera.maxY++;
    } else if (strc->unk2 < gCamera.maxY) {
        gCamera.maxY--;
    }

    if ((strc->unk0 == gCamera.minY) && (strc->unk2 == gCamera.maxY)) {
        TaskDestroy(gCurTask);
    }
}

void Task_8017334()
{
    Player *p;
    s16 screenX;
    u32 temp_r1;
    u32 temp_r3;

    Strc_sub_801766C *strc = TASK_DATA(gCurTask);

    p = strc->p;
    screenX = I(p->qWorldX) - gCamera.x;

    if (screenX > DISPLAY_CENTER_X) {
        p->moveState |= MOVESTATE_IGNORE_INPUT;
        p->heldInput = DPAD_RIGHT;
        if ((200 - (p->playerID * 8)) < screenX) {
            p->qSpeedGround = 0;
            p->qSpeedAirX = 0;
            p->moveState |= MOVESTATE_IGNORE_INPUT;
            p->heldInput = 0;
            p->moveState |= MOVESTATE_FACING_LEFT;
            p->charState = CHARSTATE_ACT_CLEAR_B;
            p->moveState |= 0x800000;
            strc->unk0 = 0;
            strc->unk2 = 0;
            gCurTask->main = Task_8017400;
        }
    } else {
        p->moveState |= MOVESTATE_IGNORE_INPUT;
        p->heldInput = DPAD_LEFT;
        if (((p->playerID * 8) + 40) > screenX) {
            p->qSpeedGround = 0;
            p->qSpeedAirX = 0;
            p->moveState |= MOVESTATE_IGNORE_INPUT;
            p->heldInput = 0;
            p->moveState |= MOVESTATE_FACING_LEFT;
            p->charState = CHARSTATE_ACT_CLEAR_B;
            p->moveState |= 0x800000;
            strc->unk0 = 0;
            strc->unk2 = 0;
            gCurTask->main = Task_8017400;
        }
    }
}

void Task_8017400(void)
{
    u16 temp_r0;
    u16 temp_r0_2;

    Strc_sub_801766C *strc = TASK_DATA(gCurTask);
    Player *p = strc->p;

    if (!(p->moveState & MOVESTATE_IN_AIR)) {
        p->charState = CHARSTATE_ACT_CLEAR_B;
    }

    if (p->playerID == PLAYER_1) {
        if (p->spriteInfoBody->s.frameFlags & 0x4000) {
            if (strc->unk0++ > 60) {
                CreateStageResults(gRingCount, gCourseTime);
                TaskDestroy(gCurTask);
            }
        }
        if (strc->unk0 == 0) {
            if (strc->unk2++ > 240) {
                CreateStageResults(gRingCount, gCourseTime);
                TaskDestroy(gCurTask);
            }
        }
    }
}

Task *sub_801749C(CamCoord worldX, CamCoord worldY)
{
    Task *t;
    Strc_sub_801749C *strc;
    t = TaskCreate(Task_8016B6C, sizeof(Strc_sub_801749C), 0x2000U, 0U, NULL);
    strc = TASK_DATA(t);
    strc->unk4 = 0;
    strc->unk8 = 0;
    strc->unk0 = worldX;
    strc->unk2 = worldY;

    return t;
}

void Task_PreBossCameraPan(void);

Task *CreatePreBossCameraPan(s16 yMin, s16 yMax)
{
    Task *t;
    CameraPanning *pan;

    t = TaskCreate(Task_PreBossCameraPan, 8U, 0x2000U, 0U, NULL);
    pan = TASK_DATA(t);

    pan->unk0 = yMin;
    pan->unk2 = yMax;
    gCamera.minY = (s16)(u16)gCamera.y;
    gCamera.maxY = gCamera.y + DISPLAY_HEIGHT;
    if ((s32)pan->unk2 > gCamera.maxY) {
        gCamera.maxY = gCamera.y + 320;
    }
    return (Task *)t;
}

Task *sub_8017540(s32 qParam0, s32 qParam1)
{
    Task *t = NULL;
    s32 temp_r0_2;
    NutsAndBolts *bolts;
    Sprite *s;

    t = CreateNutsAndBoltsTask(0x2000U, (void *)(OBJ_VRAM0 + 0x1000), 0x263U, 0U, NULL);
    bolts = TASK_DATA(t);
    s = &bolts->s;
    bolts->qUnk30 = qParam0;
    bolts->qUnk34 = qParam1;
    s->frameFlags = 0x2000;
    s->oamFlags = 0x500;
    s->frameFlags |= ((PseudoRandom32() & 0xC00) | 0x2000);
    return t;
}

void TaskDestructor_BossCapsule(Task *t)
{
    BossCapsule *capsule = TASK_DATA(t);
    VramFree(capsule->s.graphics.dest);
    VramFree(capsule->s2.graphics.dest);
}

void TaskDestructor_sub_80168F0(Task *t)
{
    Strc_sub_80168F0 *strc = TASK_DATA(t);
    VramFree(strc->s.graphics.dest);
}

void sub_80175D8(void)
{
    u16 temp_r0;
    u16 temp_r0_2;

    // NOTE(Jace): Struct type is speculative.
    //             This function seems to never get called.
    CameraPanning *strc = TASK_DATA(gCurTask);
    Player *p = &gPlayer;

    {
        if (p->spriteInfoBody->s.frameFlags & 0x4000) {
            if (strc->unk4++ > 60) {
                CreateStageResults(gRingCount, gCourseTime);
                TaskDestroy(gCurTask);
            }
        }
        if (strc->unk4 == 0) {
            if (strc->unk6++ > 240) {
                CreateStageResults(gRingCount, gCourseTime);
                TaskDestroy(gCurTask);
            }
        }
    }
}

void TaskDestructor_sub_8017658(Task *t)
{
    Strc_sub_8016D80 *strc = TASK_DATA(t);
    VramFree(strc->s.graphics.dest);
}

void sub_801766C(Player *p)
{
    Task *t = TaskCreate(Task_8017334, sizeof(Strc_sub_801766C), 0x2000, 0, NULL);
    Strc_sub_801766C *strc = TASK_DATA(t);
    strc->unk0 = 0;
    strc->p = p;
}