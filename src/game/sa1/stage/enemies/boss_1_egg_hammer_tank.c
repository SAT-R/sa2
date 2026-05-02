#include "global.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/enemies/bosses_shared.h"
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/sa1/save.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/screen_shake.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"

typedef struct EHTArm {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
    /* 0x3C */ s16 unk3C;
    /* 0x3E */ s16 unk3E;
    /* 0x40 */ u16 unk40;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s32 qUnk48;
    /* 0x4C */ s16 qUnk4C;
    /* 0x4E */ s16 qUnk4E;
    /* 0x50 */ u8 unk50;
} EHTArm; /* 0x54 */

typedef struct EHTHammer {
    /* 0x00 */ Sprite s;
    /* 0x30 */ SpriteTransform transform;
    /* 0x3C */ s16 unk3C;
    /* 0x3E */ s16 unk3E;
    /* 0x40 */ s16 unk40;
    /* 0x40 */ s16 unk42;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s32 qUnk48;
    /* 0x4C */ s16 qUnk4C;
    /* 0x4E */ s16 qUnk4E;
    /* 0x50 */ u8 unk50;
} EHTHammer; /* 0x54 */

typedef struct EggHammerTank {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ struct Task *taskHammer;
    /* 0x78 */ struct Task *tasksArm[5];
    /* 0x8C */ s32 qUnk8C;
    /* 0x90 */ s32 qUnk90;
    /* 0x94 */ s16 unk94;
    /* 0x96 */ s16 unk96;
    /* 0x98 */ u16 unk98;
    /* 0x9A */ s8 unk9A;
    /* 0x9B */ s8 unk9B;
    /* 0x9C */ u8 unk9C;
    /* 0x9C */ u8 unk9D;
    /* 0x9C */ s16 qUnk9E;
} EggHammerTank; /* 0xA0 */

void Task_EHTArm(void);
void Task_80272D0(void);
void TaskDestructor_EHTArm(struct Task *t);

struct Task *CreatePreBossCameraPan(s16, s16);
struct Task *sub_8017540(s32, s32);
void Task_802611C();
void Task_EHTArm();
void Task_EHTHammer();
void Task_EggHammerTankMain();
void Task_EggHammerTank_Intro();
void TaskDestructor_EggHammerTank(struct Task *);
void TaskDestructor_EHTHammer(struct Task *);
void Task_8025CC4();
void Task_8025D80();
void Task_8025E6C();
void Task_80264C8();
void Task_8026C44();
void Task_8026ED0(void);
void Task_80271E4();
void Task_8027600();
void Task_8027714();

void CreateEntity_EggHammerTank_Intro(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t;
    EggHammerTank *tank;
    Sprite *s;
    Sprite *s2;
    s16 tempY;
    SpriteBase *base;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_EggHammerTank_Intro, sizeof(EggHammerTank), 0x2000U, 0U, TaskDestructor_EggHammerTank);
    tank = TASK_DATA(t);
    s = &tank->s;
    base = &tank->base;
    s2 = &tank->s;
    base->regionX = regionX;
    base->regionY = regionY;

    base->me = me;
    base->meX = (u8)me->x;
    base->id = id;
    tank->unk94 = 0;
    tank->unk98 = 0;
    tank->unk9A = 0;
    tank->unk96 = -4;
    tank->unk9B = 0;
    tank->qUnk8C = 0;
    tank->unk9C = 0;
    s->x = TO_WORLD_POS(me->x, regionX);
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGMOBILE);
    s->oamFlags = 0x4C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_EGGMOBILE;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->hitboxes[1].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s2 = &tank->s2;
    s2->x = TO_WORLD_POS(me->x, regionX);
    s2->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s2->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGMAN);
    s2->oamFlags = 0x480;
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_EGGMAN;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    gCamera.minX = s2->x - DISPLAY_WIDTH;

    if (gCamera.minX < 0) {
        gCamera.minX = 0;
    }

    gCamera.maxX = s2->x + 64;
    tempY = s2->y + (DISPLAY_HEIGHT - 48);
    CreatePreBossCameraPan((s16)(s2->y - 48), tempY);

    if (tempY > (gCamera.y + DISPLAY_HEIGHT)) {
        gCamera.maxY = tempY;
    }
}

void Task_EggHammerTank_Intro(void)
{
    EggHammerTank *tank;
    SpriteBase *base;
    MapEntity *me;
    Sprite *s, *s2;
    CamCoord worldX, worldY;

    tank = TASK_DATA(gCurTask);
    base = &tank->base;
    s = &tank->s;
    s2 = &tank->s2;
    me = tank->base.me;

    worldX = TO_WORLD_POS(base->meX, base->regionX);
    worldY = TO_WORLD_POS(me->y, base->regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);

    if (gCamera.x < (gCamera.maxX - DISPLAY_WIDTH)) {
        gCamera.minX = (u16)gCamera.x;
    } else {
        gCamera.minX = (u16)gCamera.maxX - DISPLAY_WIDTH;
    }

    if (worldX - gCamera.x <= DISPLAY_WIDTH - 64) {
        gPlayer.qSpeedGround = 0;
        gPlayer.moveState |= 0x200000;
        gPlayer.heldInput = 0;
        s2->graphics.anim = SA1_ANIM_EGGMAN;
        s2->variant = 2;
        gCurTask->main = Task_8025CC4;
        gMusicManagerState.unk1 = 0x11;
    }
}

void Task_8025CC4(void)
{
    EggHammerTank *tank;
    SpriteBase *base;
    MapEntity *me;
    Sprite *s, *s2;
    CamCoord worldX, worldY;
    AnimCmdResult acmdRes;

    tank = TASK_DATA(gCurTask);
    base = &tank->base;
    s = &tank->s;
    s2 = &tank->s2;
    me = tank->base.me;

    worldX = TO_WORLD_POS(base->meX, base->regionX);
    worldY = TO_WORLD_POS(me->y, base->regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    UpdateSpriteAnimation(s);
    acmdRes = UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);

    if (acmdRes == ACMD_RESULT__ENDED) {
        s->graphics.anim = SA1_ANIM_EGGMOBILE;
        s->variant = 1;
        s2->graphics.anim = SA1_ANIM_EGGMAN;
        s2->variant = 9;
        gCurTask->main = Task_8025D80;
    }
}

void Task_8025D80(void)
{
    EggHammerTank *tank;
    SpriteBase *base;
    MapEntity *me;
    Sprite *s, *s2;
    CamCoord worldX, worldY;
    AnimCmdResult acmdRes;

    tank = TASK_DATA(gCurTask);
    base = &tank->base;
    s = &tank->s;
    s2 = &tank->s2;
    me = tank->base.me;

    worldX = TO_WORLD_POS(base->meX, base->regionX);
    worldY = TO_WORLD_POS(me->y, base->regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    acmdRes = UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);

    if (acmdRes == ACMD_RESULT__ENDED) {
        gCurTask->main = Task_8025E6C;
        s->graphics.anim = SA1_ANIM_EGGMOBILE;
        s->variant = 0;
        s->frameFlags |= 0x400;
        s2->graphics.anim = SA1_ANIM_EGGMAN;
        s2->variant = 0;
        s2->frameFlags |= 0x400;
        CreatePreBossCameraPan((worldY - 48), (worldY + (DISPLAY_HEIGHT - 48)));
    }
}

void Task_8025E6C(void)
{
    EggHammerTank *tank;
    SpriteBase *base;
    MapEntity *me;
    Sprite *s, *s2;
    CamCoord worldX, worldY;
    AnimCmdResult acmdRes;

    tank = TASK_DATA(gCurTask);
    base = &tank->base;
    s = &tank->s;
    s2 = &tank->s2;
    me = tank->base.me;

    tank->qUnk8C += Q(2);

    worldX = TO_WORLD_POS(base->meX, base->regionX) + I(tank->qUnk8C);
    worldY = TO_WORLD_POS(me->y, base->regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    if (s->x > DISPLAY_WIDTH + 64) {
        gPlayer.moveState &= ~0x200000;
        gPlayer.heldInput |= gPlayerControls.jump | gPlayerControls.attack;
        TaskDestroy(gCurTask);
        gCamera.maxX = (s16)gRefCollision->pxWidth;
        return;
    }

    acmdRes = UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

void CreateEntity_EggHammerTank(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t;
    EggHammerTank *tank;
    Sprite *s;
    s16 tempY;
    SpriteBase *base;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_EggHammerTankMain, sizeof(EggHammerTank), 0x2000U, 0U, TaskDestructor_EggHammerTank);
    tank = TASK_DATA(t);
    base = &tank->base;
    base->regionX = regionX;
    base->regionY = regionY;

    base->me = me;
    base->meX = (u8)me->x;
    base->id = id;
    tank->unk94 = 0;
    tank->unk98 = 0;
    tank->unk96 = -4;
    tank->unk9B = 0;
    tank->qUnk8C = 0;
    tank->unk9C = 0;

    if (LOADED_SAVE->difficultyLevel != DIFFICULTY_NORMAL) {
        tank->unk9A = 2;
    } else {
        tank->unk9A = 0;
    }

    s = &tank->s;
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_1_BODY);
    s->oamFlags = 0x4C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_1_BODY;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->hitboxes[1].index = HITBOX_STATE_INACTIVE;
    s->y = TO_WORLD_POS(me->y, regionY);
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s = &tank->s2;
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_1_EGGMAN);
    s->oamFlags = 0x480;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_1_EGGMAN;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    gCamera.shiftY = -56;
    gCamera.maxX = s->x - 64;

    // TODO/NOTE(Jace):
    // (DISPLAY_WIDTH * 1.5f) might break TAS tests, if we plan on adding those.
    //
    // Also, once we allow for arbitrary resolutions, it might lead to Eggman
    // indefinitely moving left, without turning around...
    gCamera.minX = (((float)gCamera.maxX) - (DISPLAY_WIDTH * 1.5f));
    gMusicManagerState.unk1 = 0x10;
}

void Task_802611C(void)
{
    EHit collPlayer;
    EHit collPartner;

    EggHammerTank *tank;
    MapEntity *me;
    Sprite *s, *s2;
    CamCoord worldX, worldY;
    AnimCmdResult acmdRes;

    tank = TASK_DATA(gCurTask);
    s = &tank->s;
    s2 = &tank->s2;
    me = tank->base.me;

    tank->unk94 += tank->unk96;
    if (!(tank->unk94 > -568 && tank->unk94 < 56)) {
        m4aSongNumStart(SE_IMPACT);
        tank->unk96 = -tank->unk96;
        CreateScreenShake(0x800U, 0x40U, 0x100U, -1U, 0x80);
    }

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        tank->qUnk8C += Q(1);
    } else {
        tank->qUnk8C -= Q(1);
    }

    worldX = TO_WORLD_POS(tank->base.meX, tank->base.regionX) + I(tank->qUnk8C);
    worldY = TO_WORLD_POS(me->y, tank->base.regionY);
    s->frameFlags &= ~0x180;
    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    if (tank->unk9B == 0) {
        collPlayer = Coll_Player_Boss_1(s, worldX, worldY, &gPlayer);
        if (gNumSingleplayerCharacters == 2) {
            collPartner = Coll_Player_Boss_1(s, worldX, worldY, &gPartner);
        } else {
            collPartner = 0;
        }
        if ((collPlayer == HIT_ENEMY) || (collPartner == HIT_ENEMY)) {
            tank->unk9A++;
            tank->unk9B = 0x20;
            if (tank->unk9A == 7) {
                tank->unk9B = 0x40;
                gCurTask->main = Task_80264C8;
            } else if (tank->unk9A > 4) {
                if (tank->unk96 > 0) {
                    tank->unk96 = (s8)tank->unk9A + 1;
                } else {
                    tank->unk96 = ~(s8)tank->unk9A;
                }
            }
            s2->variant = 2;
            m4aSongNumStart(SE_BOSS_HIT);
        } else if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
            s2->variant = 1;
        }
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = (u16)s->y;
    if (worldX < (s32)(gCamera.minX - 64)) {
        s->frameFlags = (s32)(s->frameFlags | 0x400);
        s2->frameFlags = s2->frameFlags | 0x400;
    } else if (worldX > (s32)(gCamera.maxX + 64)) {
        s->frameFlags &= ~0x400;
        s2->frameFlags &= ~0x400;
    }
    UpdateSpriteAnimation((Sprite *)s);
    UpdateSpriteAnimation((Sprite *)s2);
    if (s->variant == 2) {
        s2->y = (u16)(s2->y - 1);
    }
    if (tank->unk9B != 0) {
        if (--tank->unk9B > 0x10) {
            if (!(tank->unk9B & 2) && PLAYER_IS_ALIVE) {
                s->frameFlags = (s32)(s->frameFlags | 0x100);
                gDispCnt |= 0x8000;
                gWinRegs[WINREG_WINOUT] = 0x3F1F;
                gBldRegs.bldCnt = 0xBF;
                gBldRegs.bldY = 0x10;
            }

            DisplaySprite(s);
            DisplaySprite(s2);
        } else if (tank->unk9B & 2) {
            DisplaySprite(s);
            DisplaySprite(s2);
        }
    } else {
        DisplaySprite(s);
        DisplaySprite(s2);
    }

    if (s->frameFlags & 0x400) {
        gSpriteTransformRotation = 0x3FF & tank->unk94;
        gSpriteTransformScaleX = 0x100;
        gSpriteTransformScaleY = 0x100;
        SA2_LABEL(gUnknown_03002A8C) = 0;
        SA2_LABEL(gUnknown_03004D58) = 0;
        gSpriteTransformX = tank->s.x;
        gSpriteTransformY = tank->s.y - 0x24;
    } else {
        gSpriteTransformRotation = 0x3FF & tank->unk94;
        gSpriteTransformScaleX = 0x100;
        gSpriteTransformScaleY = 0x100;
        SA2_LABEL(gUnknown_03002A8C) = 0;
        SA2_LABEL(gUnknown_03004D58) = 0;
        gSpriteTransformX = tank->s.x;
        gSpriteTransformY = tank->s.y - 0x24;
    }
}

// (97.42%) https://decomp.me/scratch/lLJ09
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_1__Task_80264C8.inc", void Task_80264C8(void))
{
    MapEntity *me;
    EggHammerTank *tank;
    Sprite *s;
    Sprite *s2; // sp04
    s32 sp08, sp0C; // sp08, sp0C
    s16 *unk94 = &tank->unk94; // sp10
    CamCoord worldX, worldY; // sp14, sp18
    s16 theta;
    EHit collPlayer, collPartner;
    struct Task *t;
    Strc_sub_80168F0 *strc;
    u8 i;

    sp08 = 0;
    sp0C = 0;

    tank = TASK_DATA(gCurTask);
    s = &tank->s;
    s2 = &tank->s2;
    me = tank->base.me;

    if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
        tank->unk96 = (tank->unk9A * 2 - 2);
    } else {
        tank->unk96 = -4 - ((tank->unk9A - 3) * 2);
    }

    tank->unk94 += tank->unk96;
    if (tank->unk94 < -0x300) {
        tank->unk94 += 0x400;
        tank->qUnk8C -= COS(56) * 3;
    } else if (tank->unk94 > +0x100) {
        tank->unk94 -= 0x400;
        tank->qUnk8C += COS(56) * 3;
    }

    if ((tank->unk94 <= -568)) {
        if (tank->unk9C == 0) {
            tank->unk9C = 1;

            m4aSongNumStart(SE_IMPACT);
            CreateScreenShake(0x800U, 0x40U, 0x100U, -1U, 0x80);
        }

        theta = (0x200 - tank->unk94) & 0x3FF;
        sp08 = -((s32)((COS(56) - COS(theta)) * 3) >> 9);
        sp0C = -((s32)((SIN(theta) - SIN(56)) * 3) >> 9);
    } else if (tank->unk94 > 55) {
        if (tank->unk9C == 0) {
            tank->unk9C = 1;

            m4aSongNumStart(SE_IMPACT);
            CreateScreenShake(0x800U, 0x40U, 0x100U, -1U, 0x80);
        }

        theta = tank->unk94 & 0x3FF;
        sp08 = +((s32)((COS(56) - COS(theta)) * 3) >> 9);
        sp0C = -((s32)((SIN(theta) - SIN(56)) * 3) >> 9);
    } else {
        if (tank->unk9C == 1) {
            tank->unk9C = 0;
        }

        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            tank->qUnk8C += Q(1);
        } else {
            tank->qUnk8C -= Q(1);
        }
    }

    worldX = TO_WORLD_POS(tank->base.meX, tank->base.regionX) + I(tank->qUnk8C) + sp08;
    worldY = TO_WORLD_POS(me->y, tank->base.regionY) + sp0C;

    s->frameFlags &= ~0x180;
    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    if (tank->unk9B == 0) {
        collPlayer = Coll_Player_Boss_1(s, worldX, worldY, &gPlayer);
        if (gNumSingleplayerCharacters == 2) {
            collPartner = Coll_Player_Boss_1(s, worldX, worldY, &gPartner);
        } else {
            collPartner = 0;
        }
        if ((collPlayer == HIT_ENEMY) || (collPartner == HIT_ENEMY)) {
            tank->unk9A++;
            tank->unk9B = 0x20;
            s2->variant = 2;
            tank->qUnk9E = -Q(2);

            INCREMENT_SCORE_A(1000);

            m4aSongNumStart(SE_EXPLOSION);

            for (i = 0; i < 5; i++) {
                tank->tasksArm[i]->main = Task_80271E4;
            }

            tank->taskHammer->main = Task_8027600;
            tank->qUnk8C += Q(sp08);
            tank->qUnk90 = Q(sp0C);

            tank->unk98 = 0;
            s->graphics.anim = SA1_ANIM_BOSS_1_BODY_NO_BELT;
            s->variant = 0;

            {
                t = sub_80168F0(worldX, worldY, 16, 0x265, 0);
                strc = TASK_DATA(t);
                strc->qUnk46 = -Q(2);
                strc->unk48 = 0;
                strc->unk42 = 0;

                if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                    strc->transform.qScaleX = -Q(1);
                    strc->qUnk44 = +Q(4);
                } else {
                    strc->qUnk44 = -Q(4);
                }

                strc->unk40 = 60;
            }

            {
                t = sub_80168F0(worldX, worldY, 16, 614, 0);
                strc = TASK_DATA(t);
                strc->qUnk46 = -Q(2);
                strc->unk48 = 0;
                strc->unk42 = 0;

                if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                    strc->transform.qScaleX = -Q(1);
                    strc->qUnk44 = +Q(4);
                } else {
                    strc->qUnk44 = -Q(4);
                }

                strc->unk40 = 60;
            }

            {
                t = sub_80168F0(worldX, worldY, 16, 615, 0);
                strc = TASK_DATA(t);
                strc->qUnk46 = -Q(2);
                strc->unk48 = 0;
                strc->unk42 = 0;

                if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                    strc->transform.qScaleX = -Q(1);
                    strc->qUnk44 = -Q(4);
                } else {
                    strc->qUnk44 = +Q(4);
                }

                strc->unk40 = 60;
            }

            {
                t = sub_80168F0(worldX, worldY, 16, 616, 0);
                strc = TASK_DATA(t);
                strc->qUnk46 = -Q(2);
                strc->unk48 = 0;
                strc->unk42 = 0;

                if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                    strc->transform.qScaleX = -Q(1);
                    strc->qUnk44 = -Q(4);
                } else {
                    strc->qUnk44 = +Q(4);
                }

                strc->unk40 = 60;
            }

            gCamera.minX = gCamera.x;
            gCamera.maxX = gCamera.x + DISPLAY_WIDTH;
            gCurTask->main = Task_8026C44;
            gCurTask->main();
            return;
        }
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    if (sp0C == 0) {
        if (worldX < gCamera.minX - 64) {
            s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
            s2->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        } else if (worldX > gCamera.maxX + 64) {
            s->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
            s2->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
        }
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    if (s->variant == 2) {
#if !TRUE
        // s is incorrect here, but using it increases overall percentage by 2%
        s->y--; // s2
#else
        s2->y--; // s2
#endif
    }

    if (tank->unk9B != 0) {
        if (--tank->unk9B > 16) {
            if (!(tank->unk9B & 2) && PLAYER_IS_ALIVE) {
                s->frameFlags |= SPRITE_FLAG(OBJ_MODE, 2);
                gDispCnt |= 0x8000;
                gWinRegs[WINREG_WINOUT] = 0x3F1F;
                gBldRegs.bldCnt = 0xBF;
                gBldRegs.bldY = 0x10;
            }

            DisplaySprite(s);
            DisplaySprite(s2);
        } else if (tank->unk9B & 2) {
            DisplaySprite(s);
            DisplaySprite(s2);
        }
    } else {
        DisplaySprite(s);
        DisplaySprite(s2);
    }

    if (s->frameFlags & 0x400) {
        gSpriteTransformRotation = tank->unk94 & 0x3FF;
        gSpriteTransformScaleX = 0x100;
        gSpriteTransformScaleY = 0x100;
        SA2_LABEL(gUnknown_03002A8C) = 0;
        SA2_LABEL(gUnknown_03004D58) = 0;
        gSpriteTransformX = tank->s.x;
        gSpriteTransformY = tank->s.y - 0x24;
    } else {
        gSpriteTransformRotation = tank->unk94 & 0x3FF;
        gSpriteTransformScaleX = 0x100;
        gSpriteTransformScaleY = 0x100;
        SA2_LABEL(gUnknown_03002A8C) = 0;
        SA2_LABEL(gUnknown_03004D58) = 0;
        gSpriteTransformX = tank->s.x;
        gSpriteTransformY = tank->s.y - 0x24;
    }
}
END_NONMATCH

void Task_8026C44(void)
{
    EggHammerTank *tank;
    s32 res;
    Sprite *s;
    Sprite *s2;
    SpriteBase *base;
    MapEntity *me;
    s16 rndTheta;
    CamCoord worldX;
    CamCoord worldY;

    tank = TASK_DATA(gCurTask);
    base = &tank->base;
    s = &tank->s;
    s2 = &tank->s2;
    me = base->me;
    tank->qUnk9E += 0x28;
    tank->qUnk90 += tank->qUnk9E;
    worldX = TO_WORLD_POS(base->meX, base->regionX) + I(tank->qUnk8C);
    worldY = TO_WORLD_POS(me->y, base->regionY) + I(tank->qUnk90);

    res = SA2_LABEL(sub_801F100)(worldY - 8, worldX, 1, 8, SA2_LABEL(sub_801EC3C));
    if (res < 0) {
        tank->qUnk90 += Q(res);

        tank->qUnk9E = (tank->qUnk9E >> 2) - tank->qUnk9E;
        if (tank->qUnk9E > -Q(1)) {
            tank->qUnk9E = 0U;
            gCurTask->main = Task_8026ED0;
        }
    }
    s->frameFlags &= ~0x180;
    if (PLAYER_IS_ALIVE) {
        gDispCnt &= ~0x8000;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }
    tank->unk98++;

    if (!(tank->unk98 & 7)) {
        struct Task *t;
        NutsAndBolts *bolts;
        Sprite *sprBolts;
        s32 rndIndex = PseudoRandom32() % ARRAY_COUNT(gUnknown_080BB41C);
        s32 rndTheta;
        s32 a0, a1;
        s32 rnd;
        t = CreateNutsAndBoltsTask(0x2000U, VramMalloc(gUnknown_080BB434[rndIndex]), gUnknown_080BB41C[rndIndex],
                                   gUnknown_080BB42C[rndIndex], TaskDestructor_NutsAndBolts);
        bolts = TASK_DATA(t);
        sprBolts = &bolts->s;
        bolts->qUnk30 = Q(worldX);
        bolts->qUnk34 = Q(worldY - 0x20);
        sprBolts->frameFlags = 0x2000;
        sprBolts->oamFlags = 0x440;
        bolts->qUnk3E = Q(40. / 256.);
        bolts->qUnk40 = Q(32. / 256.);
        rndTheta = PseudoRandom32();
        bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
        bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

        rnd = PseudoRandom32();
        a0 = Q((worldX + (0x3F & rnd)) - 0x20);
        a1 = (((rnd & 0x3F0000) >> 0x10));
        a1 += 32;
        sub_8017540(a0, Q(worldY) - Q(a1));
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    UpdateSpriteAnimation((Sprite *)s);
    UpdateSpriteAnimation((Sprite *)s2);

    if (s->variant == 2) {
        s2->y--;
    }

    DisplaySprite(s);
    DisplaySprite(s2);
}

void Task_8026ED0(void)
{
    EggHammerTank *tank;
    s32 res;
    Sprite *s;
    Sprite *s2;
    SpriteBase *base;
    MapEntity *me;
    s16 rndTheta;
    CamCoord worldX;
    CamCoord worldY;

    tank = TASK_DATA(gCurTask);
    base = &tank->base;
    s = &tank->s;
    s2 = &tank->s2;
    me = base->me;

    worldX = TO_WORLD_POS(base->meX, base->regionX) + I(tank->qUnk8C);
    worldY = TO_WORLD_POS(me->y, base->regionY) + I(tank->qUnk90);

    if (tank->unk98++ > DISPLAY_WIDTH) {
        CreatePostBossEggMobile(worldX, worldY - 32);
        CreateBossCapsule(worldX, worldY);
        gMusicManagerState.unk1 = 0x30;
        TaskDestroy(gCurTask);
        return;
    }

    if (!(tank->unk98 & 7)) {
        struct Task *t;
        NutsAndBolts *bolts;
        Sprite *sprBolts;
        s32 rndIndex = PseudoRandom32() % ARRAY_COUNT(gUnknown_080BB41C);
        s32 rndTheta;
        s32 a0, a1;
        s32 rnd;
        t = CreateNutsAndBoltsTask(0x2000U, VramMalloc(gUnknown_080BB434[rndIndex]), gUnknown_080BB41C[rndIndex],
                                   gUnknown_080BB42C[rndIndex], TaskDestructor_NutsAndBolts);
        bolts = TASK_DATA(t);
        sprBolts = &bolts->s;
        bolts->qUnk30 = Q(worldX);
        bolts->qUnk34 = Q(worldY - 0x20);
        sprBolts->frameFlags = 0x2000;
        sprBolts->oamFlags = 0x440;
        bolts->qUnk3E = Q(40. / 256.);
        bolts->qUnk40 = Q(32. / 256.);
        rndTheta = PseudoRandom32();
        bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
        bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

        rnd = PseudoRandom32();
        a0 = Q((worldX + (0x3F & rnd)) - 0x20);
        a1 = (((rnd & 0x3F0000) >> 0x10));
        a1 += 32;
        sub_8017540(a0, Q(worldY) - Q(a1));
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    s2->x = s->x;
    s2->y = s->y;

    UpdateSpriteAnimation((Sprite *)s);
    UpdateSpriteAnimation((Sprite *)s2);

    if (s->variant == 2) {
        s2->y--;
    }

    DisplaySprite(s);
    DisplaySprite(s2);
}

struct Task *CreateEHTArm(u8 arg0)
{
    s32 sp4;
    SpriteTransform *tf;
    Sprite *s;
    struct Task *t;
    EHTArm *ehtArm;

    t = TaskCreate(Task_EHTArm, sizeof(EHTArm), 0x2000 | arg0, 0U, TaskDestructor_EHTArm);
    ehtArm = TASK_DATA(t);
    s = &ehtArm->s;
    tf = &ehtArm->transform;
    ehtArm->unk50 = arg0;

    s->x = 0;
    s->y = 0;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_1_HAMMER_SEGMENT);
    s->oamFlags = 0x440;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_1_HAMMER_SEGMENT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2030;

    tf->rotation = 0;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = arg0 * 16;
    tf->y = 0;

    UpdateSpriteAnimation(s);

    return t;
}

// (62.78%) https://decomp.me/scratch/0oTRq
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_1__Task_80271E4.inc", void Task_80271E4(void))
{
    EHTArm *arm;
    Sprite *s;
    SpriteTransform *tf;

    arm = TASK_DATA(gCurTask);
    s = &arm->s;
    tf = &arm->transform;
    tf->rotation = 0;

    arm->unk3C = ((COS(gSpriteTransformRotation) * 0x10 * arm->unk50) >> 0xE) + (gCamera.x + gSpriteTransformX);
    arm->unk3E = ((SIN(gSpriteTransformRotation) * 0x10 * arm->unk50) >> 0xE) + (gCamera.y + gSpriteTransformY);

    if (arm->unk50) {
        arm->qUnk4C = +Q(2);
    } else {
        arm->qUnk4C = -Q(2);
    }

    arm->qUnk4E = -Q(6);
    arm->qUnk44 = 0;
    arm->qUnk48 = 0;
    arm->unk40 = 0;
    s->frameFlags &= ~0x20;
    gCurTask->main = Task_80272D0;
    gCurTask->main();
}
END_NONMATCH

void Task_80272D0(void)
{
    s32 temp_r1;
    s32 temp_r1_3;
    s32 temp_r1_4;
    s32 temp_r2;
    s32 temp_r2_2;
    s32 temp_r6;
    EHTArm *arm;
    Sprite *s;

    arm = TASK_DATA(gCurTask);
    s = &arm->s;

    if (arm->unk40++ > 0xB4U) {
        TaskDestroy(gCurTask);
        return;
    }
    arm->qUnk4E += 0x28;
    arm->qUnk44 += arm->qUnk4C;
    arm->qUnk48 += arm->qUnk4E;

    if (arm->qUnk4E > 0) {
        s32 res = sa2__sub_801F100(arm->unk3E + I(arm->qUnk48), arm->unk3C + I(arm->qUnk44), 1, 8, sa2__sub_801EC3C);
        if (res < 0) {
            arm->qUnk48 = arm->qUnk48 + Q(res);
            arm->qUnk4E = (arm->qUnk4E >> 2) - arm->qUnk4E;
        }
    }

    temp_r1_3 = arm->unk3C + I(arm->qUnk44);
    if ((temp_r1_3 > (s32)(gCamera.x + DISPLAY_WIDTH)) || (temp_r1_3 < gCamera.x)) {
        arm->qUnk4C = -arm->qUnk4C;
    }

    if (!(arm->unk40 & 0x7)) {
        sub_8017540(Q(arm->unk3C) + arm->qUnk44, Q(arm->unk3E) + arm->qUnk48);
    }

    s->x = (s16)((((s32)arm->qUnk44 >> 8) + arm->unk3C) - (u16)gCamera.x);
    s->y = (s16)((((s32)arm->qUnk48 >> 8) + arm->unk3E) - (u16)gCamera.y);
    DisplaySprite(s);
}

struct Task *CreateEHTHammer(void)
{
    s32 sp4;
    SpriteTransform *tf;
    Sprite *s;
    struct Task *t;
    EHTHammer *hammer;

    t = TaskCreate(Task_EHTHammer, sizeof(EHTHammer), 0x2005, 0U, TaskDestructor_EHTHammer);
    hammer = TASK_DATA(t);
    s = &hammer->s;
    tf = &hammer->transform;

    s->x = 0;
    s->y = 0;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_1_HAMMER);
    s->oamFlags = 0x440;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_1_HAMMER;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2030;

    tf->rotation = 0;
    tf->qScaleX = Q(1);
    tf->qScaleY = Q(1);
    tf->x = 0x60;
    tf->y = 0;

    UpdateSpriteAnimation(s);

    return t;
}

// (99.53%) https://decomp.me/scratch/AmBa2
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_1__Task_EHTHammer.inc", void Task_EHTHammer(void))
{
    s16 temp_r0_4;
    s16 temp_r4;
    s16 temp_r5;
    s32 temp_r0_3;
    s32 temp_r0_5;
    s32 temp_r6;
    EggHammerTank *tank;
    EHTHammer *hammer;
    Sprite *s;
    Sprite *sprTank;
    SpriteTransform *tf;
    u32 var_r4;
    s16 x, y;
    s32 res;
    s16 theta;

    hammer = TASK_DATA(gCurTask);
    s = &hammer->s;
    tf = &hammer->transform;
    tank = TASK_DATA(TASK_PARENT(gCurTask));
    sprTank = &tank->s2;
    tf->rotation = 0U;

    if (tank->unk94 < 0) {
        s16 temp_r1_2 = -tank->unk94 - Q(2);
        if (temp_r1_2 > 0) {
            tf->rotation = temp_r1_2;
        }
    } else if (tank->unk94 > 0) {
        tf->rotation = -tank->unk94;
    }
    UnusedTransform((Sprite *)s, (SpriteTransform *)tf);

    {
#ifndef NON_MATCHING
        register s32 x32 asm("r1");
        register s32 y32 asm("r2");
#else
        s32 x32;
        s32 y32;
#endif
        x32 = COS(gSpriteTransformRotation) * 3;
        y32 = SIN(gSpriteTransformRotation) * 3;
        x = gSpriteTransformX + gCamera.x + (x32 >> 9);
        y = gSpriteTransformY + gCamera.y + (y32 >> 9);
    }
    if (tank->unk9B == 0) {
        res = Coll_Player_Entity_Intersection((Sprite *)s, x, y, &gPlayer);
        if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
            var_r4 = Coll_Player_Entity_Intersection((Sprite *)s, x, y, &gPartner);
        } else {
            var_r4 = 0;
        }
        if (res == 0x80000) {
            Coll_DamagePlayer(&gPlayer);
            sprTank->variant = 1;
        }
        if (var_r4 == 0x80000) {
            Coll_DamagePlayer(&gPartner);
            sprTank->variant = 1;
        }
    }
    DisplaySprite((Sprite *)s);
}
END_NONMATCH

// (92.28%) https://decomp.me/scratch/hvbRq
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_1__Task_8027600.inc", void Task_8027600(void))
{
    s16 temp_r0_4;
    s16 temp_r4;
    s16 temp_r5;
    s32 temp_r0_3;
    s32 temp_r0_5;
    s32 temp_r6;
    EggHammerTank *tank;
    EHTHammer *hammer;
    Sprite *s;
    SpriteTransform *tf;
    u32 var_r4;
    s16 x, y;
    s32 res;
    s16 theta;

    hammer = TASK_DATA(gCurTask);
    s = &hammer->s;
    tf = &hammer->transform;
    tank = TASK_DATA(TASK_PARENT(gCurTask));
    tf->rotation = 0U;

    if (tank->unk94 < 0) {
        s16 temp_r1_2 = -tank->unk94 - Q(2);
        if (temp_r1_2 > 0) {
            tf->rotation = temp_r1_2;
        }
    } else if (tank->unk94 > 0) {
        tf->rotation = -tank->unk94;
        tf->rotation += gSpriteTransformRotation;
    }

    {
        s32 x32;
        s32 y32;
        x32 = COS(gSpriteTransformRotation) * 3;
        y32 = SIN(gSpriteTransformRotation) * 3;
        x = gSpriteTransformX + gCamera.x + (x32 >> 9);
        y = gSpriteTransformY + gCamera.y + (y32 >> 9);
        hammer->unk3C = x;
        hammer->unk3E = y;
    }

    if (x < gCamera.x + DISPLAY_CENTER_X) {
        hammer->qUnk4C = +Q(2);
    } else {
        hammer->qUnk4C = -Q(2);
    }
    hammer->qUnk4E = -Q(6);

    hammer->qUnk44 = Q(0);
    hammer->qUnk48 = Q(0);
    hammer->unk40 = 0;
    hammer->unk42 = 42;

    gCurTask->main = Task_8027714;
    gCurTask->main();
}
END_NONMATCH

void Task_8027714(void)
{
    s32 temp_r1;
    s32 temp_r1_3;
    s32 temp_r1_4;
    s32 temp_r2;
    s32 temp_r2_2;
    s32 temp_r6;
    Sprite *s;
    SpriteTransform *tf;

    EHTHammer *hammer = TASK_DATA(gCurTask);
    s = &hammer->s;
    tf = &hammer->transform;

    if (hammer->unk40++ > 0xB4U) {
        TaskDestroy(gCurTask);
        return;
    }
    hammer->qUnk4E += 0x28;
    hammer->qUnk44 += hammer->qUnk4C;
    hammer->qUnk48 += hammer->qUnk4E;

    if (hammer->qUnk4E > 0) {
        s32 res = sa2__sub_801F100(hammer->unk3E + I(hammer->qUnk48), hammer->unk3C + I(hammer->qUnk44), 1, 8, sa2__sub_801EC3C);
        if (res < 0) {
            hammer->qUnk48 = hammer->qUnk48 + Q(res);
            hammer->qUnk4E = (hammer->qUnk4E >> 2) - hammer->qUnk4E;
            hammer->unk42 = -hammer->unk42;
        }
    }

    if (!(hammer->unk40 & 0x7)) {
        sub_8017540(Q(hammer->unk3C) + hammer->qUnk44, Q(hammer->unk3E) + hammer->qUnk48);
    }

    s->x = (s16)((((s32)hammer->qUnk44 >> 8) + hammer->unk3C) - (u16)gCamera.x);
    s->y = (s16)((((s32)hammer->qUnk48 >> 8) + hammer->unk3E) - (u16)gCamera.y);

    tf->rotation = (tf->rotation + hammer->unk42) & 0x3FF;
    tf->x = s->x;
    tf->y = s->y;
    TransformSprite(s, tf);
    DisplaySprite(s);
}

void sub_802784C(struct Task *t)
{
    EggHammerTank *tank = TASK_DATA(t);

    VramFree(tank->s.graphics.dest);
    VramFree(tank->s2.graphics.dest);
}

void Task_EggHammerTankMain(void)
{
    s32 temp_r2;
    u16 temp_r0;
    EggHammerTank *tank;
    u8 i;

    tank = TASK_DATA(gCurTask);
    if (tank->unk98++ > 120) {
        for (i = 0; i < ARRAY_COUNT(tank->tasksArm); i++) {
            tank->tasksArm[i] = CreateEHTArm(i);
        };
        tank->taskHammer = CreateEHTHammer();

        gCurTask->main = Task_802611C;
        gCurTask->main();
    }
}

void TaskDestructor_EggHammerTank(struct Task *t)
{
    EggHammerTank *tank = TASK_DATA(t);

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    VramFree(tank->s.graphics.dest);
    VramFree(tank->s2.graphics.dest);
}

void Task_EHTArm(void)
{
    EHTArm *arm;
    Sprite *s;
    SpriteTransform *tf;

    arm = TASK_DATA(gCurTask);
    s = &arm->s;

    tf = &arm->transform;
    tf->rotation = 0;

    UnusedTransform(s, tf);
    DisplaySprite(s);
}

void TaskDestructor_EHTArm(struct Task *t)
{
    EHTArm *arm = TASK_DATA(t);
    VramFree(arm->s.graphics.dest);
}

void TaskDestructor_EHTHammer(struct Task *t)
{
    EHTHammer *ehtHammer = TASK_DATA(t);
    VramFree(ehtHammer->s.graphics.dest);
}
