#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/enemies/bosses_shared.h" // CreatePreBossCameraPan
#include "game/sa1/stage/nuts_and_bolts_task.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"

/* Sonic 1's Green Hill Zone Boss */

#define NUM_CHAIN_SEGMENTS 4

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ s32 unk6C;
    /* 0x70 */ s32 unk70;
    /* 0x74 */ s32 unk74;
    /* 0x78 */ s32 unk78;
    /* 0x7C */ CamCoord worldX;
    /* 0x7E */ CamCoord worldY;
    /* 0x80 */ CamCoord unk80;
    /* 0x82 */ CamCoord unk82;
    /* 0x84 */ u16 unk84;
    /* 0x86 */ s8 unk86;
    /* 0x87 */ s8 unk87;
    /* 0x88 */ s16 unk88;
    /* 0x8A */ s16 unk8A;
    /* 0x8C */ u8 unk8C;
    /* 0x8D */ u8 unk8D;
    /* 0x8D */ u8 unk8E;
} EggWrecker; /* 0x90 */

typedef struct EggWrecker_44 {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u16 unk30;
    /* 0x30 */ s16 unk32;
    /* 0x30 */ s16 unk34;
    /* 0x30 */ s16 unk36;
    /* 0x30 */ u8 filler38[4];
    /* 0x3C */ s16 unk3C;
    /* 0x3E */ s16 unk3E;
    /* 0x3E */ u8 unk40;
} EggWrecker_44;

void Task_EggWreckerInit(void);
void sub_80343E0(void);
void Task_8034718(void);
void Task_803491C(void);
void sub_8034B7C(void);
void Task_8034CA0(void);
void sub_8034EE0(CamCoord worldX, CamCoord worldY);
void sub_8035010(void);
void Task_80352C0(void);
void Task_8035354(void);
void Task_803540C(void);
void Task_80354F4(void);
void Task_8035588(void);
void Task_8035768(void);
void TaskDestructor_8035818(struct Task *t);
void TaskDestructor_EggWrecker(struct Task *t);

static inline void sub_803582C_inline(CamCoord worldX, CamCoord worldY)
{
    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    Sprite *s = &boss_44->s;
    EHit collPlayer, collPartner;

    collPlayer = sub_800BF10(s, worldX, worldY, &gPlayer);
    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
    } else {
        collPartner = 0;
    }

    if ((collPlayer == 2) || (collPartner == 2)) {
        EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
        Sprite *s2 = &boss->s2;

        s2->variant = 1;
        s2->prevVariant = -1;
        s2->frameFlags &= ~0x4000;
    }
}

static inline void sub_80358C8_inline(void)
{
    EggWrecker *boss = TASK_DATA(gCurTask);
    Sprite *s2 = &boss->s2;

    if ((s2->variant != 0) && (s2->frameFlags & 0x4000)) {
        s2->variant = 0U;
        s2->prevVariant = 0xFF;
    }
}

static inline void sub_8035904_inline()
{
    EggWrecker *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    s2->x = s->x;
    s2->y = s->y;

    if (s2->graphics.anim == SA1_ANIM_EGGMAN) {
        s2->y -= 3;
    }
}

static inline void setPlayerPos_inline(CamCoord worldX, CamCoord worldY)
{
    EggWrecker *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}

void sub_80342A0(s16 worldX, s16 worldY)
{
    s16 temp_r6;
    s16 temp_r7;
    s32 temp_r0;
    s32 temp_r1;
    s32 temp_r2;
    u16 temp_r3;
    EggWrecker *boss;
    Sprite *s;
    Sprite *s2;
    EHit collPlayer;
    EHit collPartner;

    boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s->frameFlags &= ~0x180;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    if (boss->unk87 == 0) {
        collPlayer = Coll_Player_Enemy(s, worldX, worldY, &gPlayer);

        collPartner = 0;
        if (gNumSingleplayerCharacters == 2) {
            collPartner = Coll_Player_Enemy(s, worldX, worldY, &gPartner);
        }

        s2 = &boss->s2;
        if ((collPlayer == HIT_ENEMY) || (collPartner == HIT_ENEMY)) {
            boss->unk86++;
            boss->unk87 = 0x20U;
            s2->variant = 2;
            s2->prevVariant = -1;
            s2->frameFlags &= 0xFFFFBFFF;
            m4aSongNumStart(SE_BOSS_HIT);
            return;
        }

        if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
            s2->variant = 1;
            s2->prevVariant = -1;
            s2->frameFlags &= 0xFFFFBFFF;
        }
    }
}

// NOTE: Same as sub_8035AAC
void sub_80343E0(void)
{
    EggWrecker *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    if (boss->unk87 != 0) {
        if ((--boss->unk87 > 0x10) && !(boss->unk87 & 2) && PLAYER_IS_ALIVE) {
            s->frameFlags |= 0x100;
            gDispCnt |= DISPCNT_OBJWIN_ON;
            gWinRegs[WINREG_WINOUT] = 0x3F1F;
            gBldRegs.bldCnt = 0xBF;
            gBldRegs.bldY = 0x10;
        }
    }

    DisplaySprite(s);
    DisplaySprite(s2);
}

void CreateEntity_EggWrecker(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    s32 sp4;
    s32 temp_r1_2;
    s32 temp_r6;
    u16 temp_r1;
    u16 temp_r2;
    u8 *temp_r1_3;
    u8 *temp_r2_2;
    struct Task *t;
    EggWrecker *boss;
    Sprite *s;
    Sprite *s2;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_EggWreckerInit, sizeof(EggWrecker), 0x2000U, 0U, TaskDestructor_EggWrecker);
    boss = TASK_DATA(t);
    boss->base.regionX = regionX;
    boss->base.regionY = regionY;
    boss->base.me = me;
    boss->base.meX = me->x;
    boss->base.id = id;
    boss->unk84 = 120;
    boss->unk86 = 0;
    boss->unk87 = 0;
    boss->unk8D = 0;
    boss->unk8C = 0;
    boss->unk6C = 0x4000;
    boss->unk70 = -0x6000;
    boss->unk74 = 0;
    boss->unk78 = 0;
    boss->unk88 = 0;
    boss->unk8A = 0;
    boss->worldX = TO_WORLD_POS(me->x, regionX);
    boss->worldY = TO_WORLD_POS(me->y, regionY);

    s = &boss->s;
    s->x = boss->worldX;
    s->y = boss->worldY;
    sp4 = 0;
    s->graphics.dest = VramMalloc(30);
    s->oamFlags = SPRITE_OAM_ORDER(22);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_X1_EGGMOBILE;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    s2 = &boss->s2;
    s2->x = TO_WORLD_POS(me->x, regionX);
    s2->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);
    sp4 = 0;
    s2->graphics.dest = VramMalloc(8U);
    s2->oamFlags = SPRITE_OAM_ORDER(21);
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_BOSS_X1_EGGMAN;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = 0x2000;
}

void Task_EggWreckerInit(void)
{
    EggWrecker *boss;

    boss = TASK_DATA(gCurTask);

    switch (boss->unk8D) {
        case 0: {
            if (boss->worldX - DISPLAY_CENTER_X <= gCamera.x) {
                gCamera.minX = boss->worldX - DISPLAY_CENTER_X;
                gCamera.maxX = gCamera.minX + DISPLAY_WIDTH;
                boss->unk8D = 1;
            }
        } break;

        case 1: {
            if (boss->worldY - 64 <= gCamera.y) {
                CreatePreBossCameraPan(boss->worldY, (boss->worldY + DISPLAY_HEIGHT));
                boss->unk8D = 2;
            }
        } break;
    }

    if ((gCamera.minX == (boss->worldX - DISPLAY_CENTER_X)) && (gCamera.maxY == (boss->worldY + DISPLAY_HEIGHT))) {
        boss->unk8D = 0;
        boss->unk78 = 0x100;
        gCurTask->main = Task_8034718;
        gMusicManagerState.unk1 = 0x14;
    }
}

void Task_8034718(void)
{
    CamCoord worldX;
    CamCoord worldY;

    EggWrecker *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    boss->unk6C += boss->unk74;
    boss->unk70 += boss->unk78;
    worldX = boss->worldX + I(boss->unk6C);
    worldY = boss->worldY + I(boss->unk70);
    boss->unk80 = worldX;
    boss->unk82 = worldY;

    setPlayerPos_inline(worldX, worldY);
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    sub_8035904_inline();

    sub_80343E0();

    switch (boss->unk8D) {
        case 0: {
            if (boss->unk70 >= Q(32)) {
                boss->unk70 = Q(32);
                boss->unk74 = -Q(1);
                boss->unk78 = -Q(16. / 256.);
                boss->unk8D++;
            }
        } break;

        case 1: {
            if (boss->unk6C <= 0) {
                boss->unk6C = Q(0);
                boss->unk74 = Q(0);
                boss->unk78 = Q(0);
                boss->unk84 = 4;
                boss->unk8D++;
            }
        } break;

        case 2: {
            if (--boss->unk84 == 0) {
                s2->variant = 1;
                s2->prevVariant = -1;
                boss->unk88 = 0x100;
                boss->unk8A = 0x100;
                boss->unk84 = 64;
                boss->unk8D++;
                sub_8035010();
            }
        } break;

        case 3: {
            if (boss->unk84 > 0) {
                boss->unk84--;
            }

            if (s2->frameFlags & 0x4000) {
                s2->variant = 0U;
                s2->prevVariant = -1;
            }
            if ((s2->variant == 0) && (boss->unk84 == 0)) {
                boss->unk74 = -48;
                boss->unk8C = 0xFF;
                boss->unk8D = 0;
                gCurTask->main = Task_803491C;

                CreatePreBossCameraPan(gCamera.minY - DISPLAY_CENTER_Y, gCamera.maxY);
            }
        } break;
    }
}

// (97.97%) https://decomp.me/scratch/O3X8P
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x1__Task_803491C.inc", void Task_803491C(void))
{
    EggWrecker *boss = TASK_DATA(gCurTask);
    CamCoord worldX;
    CamCoord worldY;
    Sprite *s;
    Sprite *s2;
    s16 var_r1;

    s = &boss->s;
    s2 = &boss->s2;
    boss->unk6C += boss->unk74;
    boss->unk70 += boss->unk78;
    boss->unk88 = (boss->unk88 - 4) & 0x3FF;
    if ((0x1FF & boss->unk88) == 0x100) {
        s->frameFlags ^= 0x400;
        s2->frameFlags ^= 0x400;
    }

    var_r1 = ((COS(((boss->unk88 + 0x100) * 2) & 0x3FF) >> 13));
    worldX = (boss->worldX + I(boss->unk6C));
    worldY = var_r1 + (boss->worldY + I(boss->unk70));
    boss->unk80 = worldX;
    boss->unk82 = worldY;

    var_r1 = COS_24_8(boss->unk88);
    if (var_r1 > 0xFF) {
        var_r1 = 0xFF;
    }
    var_r1 += Q(3);
    boss->unk8A = var_r1;

    sub_80342A0(worldX, worldY);
    if (boss->unk86 > 3) {
        sub_8034B7C();
        return;
    }

    setPlayerPos_inline(worldX, worldY);

    sub_80358C8_inline();

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    sub_8035904_inline();

    sub_80343E0();

    switch (boss->unk8D) {
        case 0:
            if ((boss->unk88 > 0x100) && boss->unk88 <= 0x300) {
                boss->unk74 = 0;
                boss->unk8D++;
            }
            return;
        case 1:
            if (boss->unk88 <= 0x200) {
                boss->unk74 = 0xC0;
                boss->unk8D++;
            }
            break;
        case 2:
            if (boss->unk88 <= 0x100) {
                boss->unk74 = 0;
                boss->unk8D++;
            }
            break;
        case 3:
            if ((boss->unk88 == 0) || (boss->unk88 > 0x100)) {
                boss->unk74 = -0xC0;
                boss->unk8D = 0;
            }
            break;
    }
}
END_NONMATCH

void sub_8034B7C(void)
{
    Sprite *s;
    Sprite *s2;
    s16 theta;

    EggWrecker *boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s2 = &boss->s2;

    boss->unk8D = 0;
    boss->unk84 = 60;
    boss->unk74 = 0;
    boss->unk78 = 0;
    theta = ((boss->unk88 + 0x100) * 2) & 0x3FF;
    boss->unk70 += Q(COS((theta)) >> 0xD);
    boss->s2.variant = 2;
    boss->s2.prevVariant = -1;
    m4aSongNumStart(0x90U);
    s->frameFlags &= ~0x180;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= ~0x8000;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    INCREMENT_SCORE_A(1000);

    Task_8034CA0();
    gCurTask->main = Task_8034CA0;
}

void Task_8034CA0()
{
    s32 sp0;
    Sprite *s;
    Sprite *s2;
    s32 temp_r0_4;
    s32 temp_r0_5;
    s32 temp_r0_6;
    u16 *temp_r5;
    CamCoord worldY;
    CamCoord worldX;
    u8 *temp_r1_5;
    u8 temp_r0_3;

    EggWrecker *boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s2 = &boss->s2;
    boss->unk6C += boss->unk74;
    boss->unk70 += boss->unk78;
    worldX = (I(boss->unk6C) + boss->worldX);
    worldY = (I(boss->unk70) + boss->worldY);
    boss->unk80 = worldX;
    boss->unk82 = worldY;

    if (!(7 & boss->unk84)) {
        sub_8034EE0(worldX, worldY);
    }
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    setPlayerPos_inline(worldX, worldY);
    sub_8035904_inline();

    DisplaySprite(s);
    DisplaySprite(s2);

    switch (boss->unk8D) {
        case 0:
            if (--boss->unk84 == 0) {
                boss->unk84 = 0x5A;
                boss->unk8D++;
                VramFree(boss->s2.graphics.dest);
                s2->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGMAN);
                s2->graphics.anim = SA1_ANIM_EGGMAN;
                boss->s2.variant = 4;
                boss->s2.prevVariant = -1;
                s2->oamFlags = SPRITE_OAM_ORDER(23);
                return;
            }
            return;
        case 1:
            boss->unk78 += 3;
            if (--boss->unk84 == 0) {
                boss->unk84 = 30;
                boss->unk8D++;
                return;
            }
            break;
        case 2:
            boss->unk78 -= 0x18;
            if (--boss->unk84 == 0) {
                boss->unk74 = 0x200;
                boss->unk78 = -0x40;
                boss->unk84 = 1;
                boss->unk8D++;
                boss->s2.variant = 6;
                boss->s2.prevVariant = -1;
                s->frameFlags |= 0x400;
                s2->frameFlags |= 0x400;
                return;
            }
            break;
        case 3:
            if (boss->unk6C > 0x13000) {
                gRefCollision = gCollisionTable[gCurrentLevel];
                gCamera.minY = 0;
                gCamera.maxY = gRefCollision->pxHeight;
                gCamera.maxX = gRefCollision->pxWidth;
                gMusicManagerState.unk1 = 0x34;
                TaskDestroy(gCurTask);
            }
            break;
    }
}

void sub_8034EE0(CamCoord worldX, CamCoord worldY)
{
    struct Task *t;
    NutsAndBolts *bolts;
    Sprite *sprBolts;
    s32 rndIndex = PseudoRandom32() % ARRAY_COUNT(gUnknown_080BB41C);
    s32 rndTheta;
    s32 a0, a1;
    s32 rnd;
    t = CreateNutsAndBoltsTask(0x2000U, VramMalloc(gUnknown_080BB434[rndIndex]), gUnknown_080BB41C[rndIndex], gUnknown_080BB42C[rndIndex],
                               TaskDestructor_NutsAndBolts);
    bolts = TASK_DATA(t);
    sprBolts = &bolts->s;
    bolts->qUnk30 = Q(worldX);
    bolts->qUnk34 = Q(worldY);
    sprBolts->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    sprBolts->oamFlags = SPRITE_OAM_ORDER(23);
    bolts->qUnk3E = Q(5. / 256.);
    bolts->qUnk40 = Q(32. / 256.);
    rndTheta = PseudoRandom32();
    bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
    bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

    rnd = PseudoRandom32();
    sub_8017540(Q((worldX + (0x3F & rnd)) - 32), Q(worldY - ((rnd & 0x3F0000) >> 0x10)));
}

void sub_8035010(void)
{
    EggWrecker_44 *strc_44;
    struct Task *t;
    Sprite *s;
    u8 i;

    EggWrecker *boss = TASK_DATA(gCurTask);

    t = TaskCreate(Task_80352C0, sizeof(EggWrecker_44), 0x2100U, 0U, TaskDestructor_8035818);
    strc_44 = TASK_DATA(t);
    strc_44->unk3C = boss->worldX + I(boss->unk6C);
    strc_44->unk3E = boss->worldY + I(boss->unk70);
    strc_44->unk30 = 0x40;
    s = &strc_44->s;
    s->graphics.dest = VramMalloc(2U);
    s->oamFlags = 0x600;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_X1_EGGMOBILE_DECO;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    for (i = 0; i < NUM_CHAIN_SEGMENTS; i++) {
        t = TaskCreate(Task_8035354, sizeof(EggWrecker_44), 0x2100 | i, 0U, TaskDestructor_8035818);
        strc_44 = TASK_DATA(t);
        strc_44->unk3C = boss->worldX + I(boss->unk6C);
        strc_44->unk3E = boss->worldY + I(boss->unk70);
        strc_44->unk34 = 0;
        strc_44->unk36 = 0;
        strc_44->unk40 = i;
        strc_44->unk30 = 0x40;
        s = &strc_44->s;
        s->graphics.dest = VramMalloc(4U);
        s->oamFlags = 0x640;
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_BOSS_X1_EGGMOBILE_DECO;
        s->variant = 2;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
    };

    t = TaskCreate(Task_80354F4, sizeof(EggWrecker_44), 0x2104U, 0U, TaskDestructor_8035818);
    strc_44 = TASK_DATA(t);
    strc_44->unk3C = boss->worldX + I(boss->unk6C);
    strc_44->unk3E = boss->worldY + I(boss->unk70);
    strc_44->unk34 = 0;
    strc_44->unk36 = 0;
    strc_44->unk30 = 0x40;
    s = &strc_44->s;
    s->graphics.dest = VramMalloc(0x10U);
    s->oamFlags = 0x5C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_X1_BALL;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    t = TaskCreate(Task_8035768, sizeof(EggWrecker_44), 0x2105U, 0U, TaskDestructor_8035818);
    strc_44 = TASK_DATA(t);
    strc_44->unk3C = boss->worldX + I(boss->unk6C);
    strc_44->unk3E = boss->worldY + I(boss->unk70);
    strc_44->unk30 = 0x40;
    s = &strc_44->s;
    s->graphics.dest = VramMalloc(4);
    s->oamFlags = 0x600;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_X1_EGGMOBILE_DECO;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
}

// (67.94%) https://decomp.me/scratch/mycLx
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x1__Task_80352C0.inc", void Task_80352C0())
{
    s32 temp_r5;
    s16 var_r1;
    s32 temp_r6;
    u16 temp_r0;
    CamCoord worldX, worldY;
    s32 var_r5 = 0;

    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s = &boss_44->s;

    if (boss_44->unk30 != 0) {
        u32 temp_r0;
        boss_44->unk30--;
        temp_r0 = boss_44->unk30;
        temp_r0 <<= 8;
#ifndef NON_MATCHING
        asm("" ::"r"(temp_r0));
#endif
        var_r5 = temp_r0 >> 11;
    }
    var_r1 = -var_r5;

    boss_44->unk3C = boss->unk80;
    boss_44->unk3E = boss->unk82;
    worldX = boss_44->unk3C;
    worldY = var_r1 + boss_44->unk3E;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk86 > 3) {
        sub_8017540(Q(worldX), Q(worldY + 20));
        TaskDestroy(gCurTask);
        return;
    }
}
END_NONMATCH

// (87.09%) https://decomp.me/scratch/gMJT8
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x1__Task_8035354.inc", void Task_8035354())
{
    s16 temp_r0;
    s32 temp_r2_2;
    u16 temp_r0_3;
    u16 temp_r2;
    s16 var_r1;
    s16 var_r2;
    u16 temp_r0_2;

    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s = &boss_44->s;

    if (--boss_44->unk30 != 0) {
        var_r2 = boss_44->unk40 * 14;
        var_r2 = (var_r2 - (((((var_r2 + 21) * ((s32)Q(boss_44->unk30) >> 6)) << 8) >> 16) - 35));
    } else {
        temp_r0_2 = boss_44->unk40;
        var_r2 = ((temp_r0_2 * 14) + 35);
        boss_44->unk30 = (temp_r0_2 * 8) + 8;
        gCurTask->main = Task_803540C;
    }
    boss_44->unk3C = boss->unk80;
    boss_44->unk3E = boss->unk82;
    var_r1 = var_r2 + boss_44->unk3E;
    s->x = boss_44->unk3C - gCamera.x;
    s->y = (var_r1)-gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

// (79.67%) https://decomp.me/scratch/jki22
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x1__Task_803540C.inc", void Task_803540C(void))
{
    s16 worldX;
    s16 worldY;
    s32 temp_r0;
    s16 temp_r1_2;
    s32 temp_r3;
    s32 temp_r6;
    u16 temp_r1;
    u16 temp_r1_3;
    u16 temp_r3_2;
    u16 temp_r4;

    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s = &boss_44->s;

    temp_r1_2 = ((boss_44->unk40 * 14) + 13);
    asm("" ::"r"(temp_r1_2));
    worldX = ((COS(boss->unk8A) * temp_r1_2 * 4) >> 0x10) + boss->unk80;
    boss_44->unk3C = boss->unk80;
    boss_44->unk3E = boss->unk82;
    worldY = boss->unk82 + (((SIN(0x1FF & boss->unk8A) * temp_r1_2 * 4) >> 0x10));
    worldY + 22;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk86 > 3) {
        if (--boss_44->unk30 == 0) {
            sub_8017540(Q(worldX), Q(worldY));
            TaskDestroy(gCurTask);
        }
    }
}
END_NONMATCH

// (88.70%) https://decomp.me/scratch/f1HTz
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x1__Task_80354F4.inc", void Task_80354F4(void))
{
    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
    EggWrecker_44 *boss_44_2 = boss_44;
    Sprite *s = &boss_44->s;
    s16 r1;

    if (--boss_44->unk30 != 0) {
        s16 v = (((((boss_44_2->unk30 << 8) >> 6) * 93) << 8) >> 16);
        r1 = 99 - v;
    } else {
        r1 = 99;
        boss_44_2->unk30 = 60;
        gCurTask->main = Task_8035588;
    }

    boss_44->unk3C = boss->unk80;
    boss_44->unk3E = boss->unk82;

    r1 += boss->unk82;
    s->x = boss_44->unk3C - gCamera.x;
    s->y = r1 - gCamera.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

// (83.00%) https://decomp.me/scratch/vzRf3
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_x1__Task_8035588.inc", void Task_8035588(void))
{
    s16 temp_r4_3;
    s16 temp_r5_2;
    s32 temp_r0_4;
    s32 temp_r1_2;
    s32 temp_r2;
    s32 temp_r3_2;
    s32 temp_r6;
    s32 temp_r7;
    s32 var_r0;
    u16 temp_r0_2;
    u16 temp_r1;
    u16 temp_r4;

    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s = &boss_44->s;
    CamCoord worldX, worldY;

    temp_r2 = boss->unk8A;
    boss_44->unk3C = boss->unk80;
    worldX = boss->unk80 + ((COS(boss->unk8A) * 0x4D) >> 0xE);
    boss_44->unk3E = boss->unk82;
    worldY = boss->unk82 + (((SIN(0x1FF & boss->unk8A) * 0x4D) >> 0xE) + 22);

    if (boss->unk86 < 4) {
        sub_803582C_inline(worldX, worldY);
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    if (boss->unk86 > 3) {
        if (!(7 & boss_44->unk30)) {
            temp_r1_2 = PseudoRandom32();
            sub_8017540(((worldX + (0x1F & temp_r1_2)) - 0xF) << 8, ((worldY + ((temp_r1_2 & 0x1F0000) >> 0x10)) - 0xF) << 8);
        }

        if (--boss_44->unk30 == 0) {
            TaskDestroy(gCurTask);
        }
    }
}
END_NONMATCH

void Task_8035768(void)
{
    s32 temp_r2;
    s32 temp_r3;
    s32 temp_r5;
    u16 temp_r6;
    CamCoord worldX, worldY;

    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s = &boss_44->s;

    if ((boss->unk8C != 0) && (boss->unk74 != 0)) {
        if (boss->unk6C > Q(300)) {
            TaskDestroy(gCurTask);
            return;
        }

        s->frameFlags &= ~0x400;
        s->frameFlags |= boss->s.frameFlags & 0x400;

        worldX = boss->unk80;
        worldY = boss->unk82;

        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void TaskDestructor_EggWrecker(struct Task *t)
{
    EggWrecker *boss = TASK_DATA(t);
    VramFree(boss->s.graphics.dest);
    VramFree(boss->s2.graphics.dest);
}

void TaskDestructor_8035818(struct Task *t)
{
    EggWrecker_44 *boss_44 = TASK_DATA(t);
    VramFree(boss_44->s.graphics.dest);
}

void sub_803582C(CamCoord worldX, CamCoord worldY)
{
    EggWrecker_44 *boss_44 = TASK_DATA(gCurTask);
    Sprite *s = &boss_44->s;
    EHit collPlayer, collPartner;

    collPlayer = sub_800BF10(s, worldX, worldY, &gPlayer);
    if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        collPartner = sub_800BF10(s, worldX, worldY, &gPartner);
    } else {
        collPartner = 0;
    }

    if ((collPlayer == 2) || (collPartner == 2)) {
        EggWrecker *boss = TASK_DATA(TASK_PARENT(gCurTask));
        Sprite *s2 = &boss->s2;

        s2->variant = 1;
        s2->prevVariant = -1;
        s2->frameFlags &= ~0x4000;
    }
}

void sub_80358C8(void) { sub_80358C8_inline(); }

void sub_8035904(void) { sub_8035904_inline(); }

static void setPlayerPos(CamCoord worldX, CamCoord worldY)
{
    EggWrecker *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}
