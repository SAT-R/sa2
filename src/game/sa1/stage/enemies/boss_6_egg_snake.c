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
#include "game/sa1/ui/stage_results.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/songs.h"

#define NUM_SEGMENTS 9

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u16 unk32;
    /* 0x34 */ u8 filler34[0x4];
    /* 0x38 */ s32 unk38;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s16 unk48;
    /* 0x4A */ u8 filler4A[0x8];
    /* 0x52 */ u8 unk52;
} EggSnakeSegment;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ struct Task *tasks[NUM_SEGMENTS];
    /* 0x54 */ u8 unk54;
    /* 0x55 */ u8 unk55;
    /* 0x56 */ u8 unk56;
    /* 0x57 */ u8 unk57;
    /* 0x58 */ u8 unk58;
    /* 0x58 */ u8 unk59;
    /* 0x58 */ s16 unk5A;
    s16 unk5C;
    s16 unk5E;
} EggSnakeSegmentManager; /* 0x60 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ u16 unk60;
    /* 0x62 */ u16 unk62;
    /* 0x64 */ s32 unk64;
    /* 0x68 */ s32 unk68;
    /* 0x6C */ s16 unk6C;
    /* 0x6E */ s16 unk6E;
    /* 0x70 */ CamCoord originX;
    /* 0x72 */ CamCoord originY;
} EggSnakeProjectile; /* 0x74 */

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved;
    /* 0x44 */ Sprite s2;
    /* 0x74 */ struct Task *t; // EggSnakeSegmentManager *
    /* 0x78 */ s32 qUnk78;
    /* 0x7C */ s32 qUnk7C;
    /* 0x80 */ s32 unk80;
    /* 0x84 */ s32 unk84;
    /* 0x88 */ u8 filler88[0x8];
    /* 0x90 */ s16 unk90;
    /* 0x92 */ s16 unk92;
    /* 0x92 */ s16 unk94;
    /* 0x92 */ s16 unk96;
    /* 0x98 */ u16 unk98;
    /* 0x9A */ s8 unk9A;
    /* 0x9B */ s8 unk9B;
    /* 0x9C */ s8 unk9C;
    /* 0x9E */ s16 qUnk9E;
    /* 0xA0 */ s16 unkA0;
    /* 0xA2 */ s16 unkA2;
    /* 0xA4 */ s16 unkA4;
    /* 0xA6 */ s16 unkA6;
    /* 0xA8 */ u8 unkA8;
    /* 0xA9 */ u8 unkA9;
    /* 0xAA */ u8 unkAA;
} EggSnake; /* 0xAC */

// static memory at 0x03005860
typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 qSpeedAirX;
    /* 0x0A */ s16 qSpeedAirY;
    /* 0x0C */ u32 moveState;
} PlayerSpeedState;

PlayerSpeedState sPlayerSpeedState; // TODO: static

void Task_EggSnakeInit(void);
void sub_803170C(void);
void sub_8031D88(s16 worldX, s16 worldY);
void sub_8031ED0(void);
void sub_8031F74(void);
void Task_8032370(void);
void sub_80327C4(void);
void Task_8032AF8(void);
void sub_8032D44(void);
void sub_8032F58(void);
void sub_803330C(void);
void CreateProjectile(void); // TODO: static
void sub_8033878(void);
void Task_8033480(void);
void Task_8033730(void);
void Task_8033924(void);
void Task_8034098(void); // : EggSnakeSegment
void sub_80339BC(EggSnakeSegmentManager *mgr);
void Task_8033AA0(void);
void TaskDestructor_8034208(struct Task *t);
void TaskDestructor_8034224(struct Task *t);
void TaskDestructor_8034238(struct Task *t);

s16 gUnknown_03005870[NUM_SEGMENTS];
s16 gUnknown_03005890[NUM_SEGMENTS];
extern const s16 gUnknown_084ACEE4[NUM_SEGMENTS];
extern const s16 gUnknown_084ACEF6[NUM_SEGMENTS];
extern const u16 gUnknown_084ACF08[10];

static inline void sub_803424C_inline()
{
    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    s2->x = s->x;
    s2->y = s->y;
}

static inline void sub_803426C__inline(CamCoord worldX, CamCoord worldY)
{
    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    MapEntity *me = boss->base.me;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}

void sub_8031D88(s16 worldX, s16 worldY)
{
    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2;
    enum EHit collPlayer;
    enum EHit collPartner;

    s->frameFlags &= 0xFFFFFE7F;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    if (boss->unk9C == 0) {
        collPlayer = Coll_Player_Bosses_2_6(s, worldX, worldY, &gPlayer);
        if (gNumSingleplayerCharacters == 2) {
            collPartner = Coll_Player_Bosses_2_6(s, worldX, worldY, &gPartner);
        } else {
            collPartner = HIT_NONE;
        }
        s2 = &boss->s2;

        if ((collPlayer == HIT_ENEMY) || (collPartner == HIT_ENEMY)) {
            boss->unk9A++;
            boss->unk9C = 0x20;

            if (s->variant == 2) {
                s2->variant = 2;
            }

            if (s->variant == 3) {
                s2->variant = 5;
            }

            s2->frameFlags &= 0xFFFFBFFF;
            m4aSongNumStart(0x8FU);
        } else if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
            if (s->variant == 2) {
                s2->variant = 1;
            }
            if (s->variant == 3) {
                s2->variant = 4;
            }
            s2->frameFlags &= 0xFFFFBFFF;
        }
    }
}

void sub_8031ED0(void)
{
    s8 temp_r1;
    u8 *temp_r2;

    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    if (boss->unk9C != 0) {
        if ((--boss->unk9C > 0x10) && !(boss->unk9C & 2) && PLAYER_IS_ALIVE) {
            s->frameFlags |= 0x100;
            gDispCnt |= 0x8000;
            gWinRegs[5] = 0x3F1F;
            gBldRegs.bldCnt = 0xBF;
            gBldRegs.bldY = 0x10;
        }
    }
    DisplaySprite(s);
    if ((u8)boss->unkAA != 0xFF) {
        DisplaySprite(s2);
    }
}

void sub_8031F74()
{
    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    if ((s2->variant != 0) && (s2->variant != 3) && (s2->frameFlags & 0x4000)) {
        if (s->variant == 2) {
            s2->variant = 0;
        }

        if (s->variant == 3) {
            s2->variant = 3;
        }
        s2->prevVariant = 0xFF;
    }
}

// (96.34%) https://decomp.me/scratch/ULduN
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_6__CreateEntity_EggSnake.inc",
         void CreateEntity_EggSnake(MapEntity *me, u16 regionX, u16 regionY, u8 id))
{
    EggSnake *boss;
    Sprite *s;
    Sprite *s2;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }
    boss = TASK_DATA(TaskCreate(Task_EggSnakeInit, sizeof(EggSnake), 0x2100U, 0U, TaskDestructor_8034208));
    s = &boss->s;
    boss->base.regionX = regionX;
    boss->base.regionY = regionY;
    boss->base.me = me;
    boss->base.meX = me->x;
    boss->base.id = id;
    boss->unk98 = 0x78;
    boss->unk9C = 0;
    boss->unkA9 = 0;
    boss->unkA8 = 0;
    boss->qUnk78 = 0x1000;
    boss->qUnk7C = 0;
    boss->unk80 = 0;
    boss->unk84 = 0;
    boss->unkA0 = 0;
    boss->unkA2 = 0x200;
    boss->unkA4 = 0;
    boss->unkAA = 0;
    if (LOADED_SAVE->difficultyLevel != 0) {
        boss->unk9A = 2;
    } else {
        boss->unk9A = 0;
    }
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    s->graphics.dest = VramMalloc(0x30U);
    s->oamFlags = SPRITE_OAM_ORDER(22);
    s->graphics.size = 0;
    s->graphics.anim = 0x296;
    s->variant = 3;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    s2 = &boss->s2;
    s2->x = TO_WORLD_POS(me->x, regionX);
    s2->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);
    s2->graphics.dest = VramMalloc(8);
    s2->oamFlags = SPRITE_OAM_ORDER(21);
    s2->graphics.size = 0;
    s2->graphics.anim = 0x294;
    s2->variant = 3;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = 0x10;
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = 0x2000;
#if PORTABLE && (DISPLAY_WIDTH > 320)
    Bosses_SetCamBounds(s->y - (DISPLAY_HEIGHT - 32), s->y + 32, s->x - DISPLAY_CENTER_X, s->x + DISPLAY_CENTER_X);
#else
    Bosses_SetCamBounds(s->y - (DISPLAY_HEIGHT - 32), s->y + 32, s->x - 144, s->x + 176);
#endif
}
END_NONMATCH

// (98.79%) https://decomp.me/scratch/34ZiA
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_6__Task_EggSnakeInit.inc", void Task_EggSnakeInit())
{
    MapEntity *me;
    Sprite *s2;
    s32 var_r2;
    s16 temp_r2;
    s32 temp_r0_2;
    s32 temp_r0_4;
    s32 temp_r0_5;
    s32 temp_r0_6;
    Sprite *s;
    s32 temp_r2_2;
    u16 *temp_r1_2;
    u16 *temp_r1_3;
    u16 *temp_r2_3;
    u16 temp_r0;
    u8 *temp_r3;
    u8 temp_r0_3;
    CamCoord worldX, worldY;

    EggSnake *boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s2 = &boss->s2;
    me = boss->base.me;

    if ((boss->unk98 == 0x78) && (boss->unkA9 == 0)) {
        sub_8033878();
        sub_803330C();
    }
    var_r2 = gSineTable[boss->unkA0];
    var_r2 = (var_r2 * 15) >> 0xB;
    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk78) + var_r2;
    temp_r2 = (var_r2 + 0x90);
    if (temp_r2 >= 0) {
        var_r2 = temp_r2 + 0x1F;
    } else {
        var_r2 = (s16)temp_r2;
    }

    worldY = gUnknown_03005870[var_r2 >>= 5];
    worldY += TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk7C);

    sub_803426C__inline(worldX, worldY);
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    // inline
    sub_803424C_inline();

    sub_8031ED0();

    switch (boss->unkA9) {
        case 0:
            if (--boss->unk98 == 0) {
                gMusicManagerState.unk1 = 0x13;
                boss->unk98 = 0x3C;
                boss->unkA9++;
                return;
            }
            return;
        case 1:
            if (--boss->unk98 == 0) {
                s2->variant = 4;
                boss->unkA9++;
            }
            break;
        case 2:
            if (s2->frameFlags & 0x4000) {
                s2->variant = 3;
                boss->unk98 = 0x3C;
                boss->unkA9++;
            }
            break;
        case 3:
            if (--boss->unk98 == 0) {
                boss->unkA8 = 0xFF;
                boss->unkA9 = 0;
                gCurTask->main = Task_8032370;
            }
            break;
    }
}
END_NONMATCH

// (99.05%) https://decomp.me/scratch/wPkmW
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_6__Task_8032370.inc", void Task_8032370())
{
    EggSnakeSegmentManager *strc60;
    s16 temp_r2_3;
    s16 temp_r3_2;
    CamCoord worldX, worldY;
    s32 var_r0;
#ifndef NON_MATCHING
    register s32 var_r1 asm("r1");
    register s32 var_r3 asm("r3");
    register s32 var_r4 asm("r4");
#else
    s32 var_r1;
    s32 var_r3;
    s32 var_r4;
#endif
    s32 var_r4_3;
    s32 temp_r7;
    s16 *ptrA;

    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;

    strc60 = TASK_DATA(boss->t);
    boss->unkA2 += boss->unkA4;
    boss->unkA0 = (boss->unkA0 - I(boss->unkA2));
    boss->unkA0 &= 0x3FF;
    temp_r7 = gSineTable[boss->unkA0];
    temp_r7 = (s32)(temp_r7 * 15) >> 11;
    worldX = (TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk78) + temp_r7);
    temp_r3_2 = temp_r7 + 0x80;
    var_r1 = temp_r3_2;
    if (temp_r3_2 < 0) {
        var_r1 += 0x1F;
    }
    var_r1 = var_r1 >> 5;
    var_r4 = (u8)var_r1;
    var_r1 = temp_r3_2 - (var_r1 << 5);
    ptrA = &gUnknown_03005870[var_r4];
    var_r0 = gUnknown_03005870[var_r4 + 1];
    var_r0 -= (var_r3 = *ptrA);
    var_r1 = (s16)var_r1;
    var_r0 *= var_r1;
    if (var_r0 < 0) {
        var_r0 += 0x1F;
    }
    temp_r2_3 = var_r3 + (var_r0 >> 5);
    worldY = temp_r2_3 + (TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk7C));
    boss->unk90 = temp_r7;
    boss->unk92 = temp_r2_3;
    sub_8031D88(worldX, worldY);
    if (boss->unk9A > 7) {
        sub_80327C4();
    } else {

        sub_803426C__inline(worldX, worldY);

        sub_8031F74();
        UpdateSpriteAnimation(s);
        if (boss->unkAA == 0) {
            UpdateSpriteAnimation(s2);
        }

        sub_803424C_inline();

        sub_8031ED0();

        switch (boss->unkA9) {
            case 0:
                if (boss->unkA2 < 0x200) {
                    boss->unkA2 = 0x200;
                    boss->unkA4 = 0;
                }
                var_r0 = temp_r7 + 0x90;
                if (var_r0 < 0) {
                    var_r0 += 0x1F;
                }
                var_r4_3 = (u8)(var_r0 >> 5);
                if ((var_r4_3 != 0) && (var_r4_3 != 8) && (strc60->unk55 != 0) && (strc60->unk55 != 8)
                    && ((s8)var_r4_3 >= ((s8)(strc60->unk55 - 2))) && ((s8)var_r4_3 <= (s8)(strc60->unk55 + 2)) && (strc60->unk57 != 0)) {
                    boss->unkA2 = 0x200;
                    boss->unkA4 = 0;
                    boss->unkA9++;
                }
                break;
            case 1:
                if (s->variant != 1) {
                    if (strc60->unk5C >= 0) {
                        return;
                    }
                    s->variant = 1;
                    s->prevVariant = -1;
                    boss->unkAA = -1;
                    return;
                }
                if (!(s->frameFlags & 0x4000)) {
                    return;
                }
                s->variant = 2;
                s2->variant = 0;
                s->prevVariant = -1;
                boss->unkAA = 0;
                boss->unk98 = gUnknown_084ACF08[(PseudoRandom32() + gStageTime) & 3];
                boss->unk9B = boss->unk9A;
                boss->unkA9++;
                break;
            case 2:
                if (boss->unk9C != 0) {
                    if (boss->unk9C > 16) {
                        return;
                    }
                    s->variant = 0;
                    s->prevVariant = -1;
                    boss->unkAA = -1;
                    boss->unkA9++;
                    break;
                }

                if (--boss->unk98 == 0) {
                    s->variant = 0;
                    s->prevVariant = -1;
                    boss->unkAA = -1;
                    boss->unkA9++;
                }
                break;
            case 3:
                if (s->frameFlags & 0x4000) {
                    s->variant = 3;
                    s2->variant = 3;
                    s->prevVariant = -1;
                    boss->unkAA = 0;
                    boss->unkA4 = 0x40;
                    boss->unkA6 = gUnknown_084ACEE4[boss->unk9A];
                    boss->unk98 = 0x78;
                    if (boss->unk9A == boss->unk9B) {
                        boss->unkA9 += 2;
                    } else {
                        boss->unkA9++;
                    }
                }
                break;
            case 4:
                if (boss->unkA2 >= boss->unkA6) {
                    boss->unkA2 = boss->unkA6;
                    boss->unkA4 = 0;
                }

                if (--boss->unk98 == 0) {
                    boss->unkA4 = 0xFFC0;
                    boss->unkA9 = 0;
                }
                break;
            case 5:
                if (boss->unkA2 >= 0x200) {
                    boss->unkA2 = 0x200;
                    boss->unkA4 = 0;
                    boss->unkA9 = 0;
                }
                break;
        }
    }
}
END_NONMATCH

void sub_80327C4()
{
    s16 var_r0;
    s32 temp_r0;
    s32 temp_r3;
    s32 temp_r4;
    s32 temp_r5;
    s32 temp_r5_2;
    s32 temp_r6;
    s32 temp_r6_2;

    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Strc_sub_80168F0 *proj;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    boss->qUnk78 += Q(boss->unk90);
    boss->qUnk7C += Q(boss->unk92);
    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk78);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk7C);
    boss->s2.variant = 2;
    boss->qUnk9E = -0x80;
    m4aSongNumStart(0x90U);

    {
        proj = TASK_DATA(sub_80168F0(worldX, worldY, 4U, SA1_ANIM_BOSS_6_SPIKE, 0U));
        proj->qUnk46 = -Q(2);
        proj->unk48 = 0;
        proj->unk42 = 0x100;
        if (s->frameFlags & 0x400) {
            proj->transform.qScaleX = -0x100;
            proj->qUnk44 = 0x100;
        } else {
            proj->qUnk44 = -0x100;
        }
        proj->unk40 = 0x3C;
    }

    {
        proj = TASK_DATA(sub_80168F0(worldX + 16, worldY + 16, 4U, SA1_ANIM_BOSS_6_SPIKE, 0U));
        proj->qUnk46 = -Q(2);
        proj->unk48 = 0;
        proj->unk42 = 0x200;
        if (s->frameFlags & 0x400) {
            proj->transform.qScaleX = -0x100;
            proj->qUnk44 = 0x400;
        } else {
            proj->qUnk44 = -0x400;
        }

        proj->unk40 = 0x3C;
    }

    {
        proj = TASK_DATA(sub_80168F0(worldX - 16, worldY + 16, 4U, SA1_ANIM_BOSS_6_SPIKE, 0U));
        proj->qUnk46 = -Q(2);
        proj->unk48 = 0;
        proj->unk42 = 0x300;
        proj->s.frameFlags |= 0x400;
        if (s->frameFlags & 0x400) {
            proj->transform.qScaleX = -0x100;
            proj->qUnk44 = -0x200;
        } else {
            proj->qUnk44 = 0x200;
        }
        proj->unk40 = 0x3C;
    }

    {
        proj = TASK_DATA(sub_80168F0(worldX - 16, worldY + 16, 4U, SA1_ANIM_BOSS_6_SPIKE, 0U));
        proj->qUnk46 = -Q(2);
        proj->unk48 = 0;
        proj->unk42 = 0x380;
        proj->s.frameFlags |= 0x400;
        if (s->frameFlags & 0x400) {
            proj->transform.qScaleX = -0x100;
            proj->qUnk44 = -0x80;
        } else {
            proj->qUnk44 = +0x80;
        }

        proj->unk40 = 0x3C;
    }

    gCamera.minX = gCamera.x;
    gCamera.maxX = gCamera.x + DISPLAY_WIDTH;
    CreatePreBossCameraPan(gCamera.maxY - DISPLAY_HEIGHT, gCamera.maxY + DISPLAY_HEIGHT);
    gStageFlags |= 3;

    INCREMENT_SCORE_A(1000);

    Task_8032AF8();
    gCurTask->main = Task_8032AF8;
}

void Task_8032AF8(void)
{
    s32 res;

    EggSnake *boss = TASK_DATA(gCurTask);
    SpriteBase *base = &boss->base;
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    boss->qUnk9E += 0x5;
    boss->qUnk7C += boss->qUnk9E;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk78);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk7C);

    res = SA2_LABEL(sub_801F100)(worldY, worldX, 1, 8, &SA2_LABEL(sub_801EC3C));

    if (res < 0) {
        boss->unk98 = 60;
        gCurTask->main = sub_8032D44;
        return;
    }

    s->frameFlags &= ~0x180;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    boss->unk98++;
    if ((boss->unk98 & 0x7) == 0) {
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
        bolts->qUnk34 = Q(worldY + 32);
        sprBolts->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        sprBolts->oamFlags = SPRITE_OAM_ORDER(17);
        bolts->qUnk3E = Q(5. / 256.);
        bolts->qUnk40 = Q(32. / 256.);
        rndTheta = PseudoRandom32();
        bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
        bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

        rnd = PseudoRandom32();
        sub_8017540(Q((worldX + (0x3F & rnd)) - 32), Q(worldY + 32 - ((rnd & 0x3F0000) >> 0x10)));
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    sub_803424C_inline();
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

void sub_8032D44(void)
{
    MapEntity *me;
    Sprite *s;
    Sprite *s2;
    s32 temp_r0;
    s32 temp_r0_3;
    s32 s2_2;
    u16 *temp_r1;
    u16 temp_r0_2;

    EggSnake *boss = TASK_DATA(gCurTask);

    s = &boss->s;
    s2 = &boss->s2;
    me = boss->base.me;
    if (--boss->unk98 == 0) {
        EggSnakeSegmentManager *strc60 = TASK_DATA(boss->t);
        strc60->unk58 = -1;
        gPlayer.moveState &= ~8;
        gCamera.maxY = 2208 + DISPLAY_HEIGHT;
        gMusicManagerState.unk1 = 0x33;
        boss->unk94 = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk78);
        boss->unk96 = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk7C);
        boss->qUnk78 = 0;
        boss->qUnk7C = 0;
        boss->unk80 = 0;
        boss->unk84 = -0x80;
        boss->unkA9 = 0;
        VramFree(boss->s.graphics.dest);
        VramFree(boss->s2.graphics.dest);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGMOBILE);
        s->oamFlags = 0x4C0;
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_EGGMOBILE;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = (s16)0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;

        s2->graphics.dest = ALLOC_TILES(SA1_ANIM_EGGMAN);
        s2->oamFlags = 0x480;
        s2->graphics.size = 0;
        s2->graphics.anim = SA1_ANIM_EGGMAN;
        s2->variant = 4;
        s2->animCursor = 0;
        s2->qAnimDelay = (s16)0;
        s2->prevVariant = -1;
        s2->animSpeed = 0x10;
        s2->palId = 0;
        s2->hitboxes[0].index = -1;
        s2->frameFlags = 0x2000;

        gCurTask->main = sub_8032F58;
    } else {
        CamCoord worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk78);
        CamCoord worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk7C);
        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y;

        sub_803424C_inline();

        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        DisplaySprite(s);
        DisplaySprite(s2);
    }
}

void sub_8032F58(void)
{
    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    CamCoord worldX, worldY;

    boss->qUnk78 += boss->unk80;
    boss->qUnk7C += boss->unk84;
    worldX = I(boss->qUnk78) + boss->unk94;
    worldY = I(boss->qUnk7C) + boss->unk96;

    if (boss->unkA9 <= 4U) {
        sub_803426C__inline(worldX, worldY);

        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);

        sub_803424C_inline();
        DisplaySprite(s);
        DisplaySprite(s2);
    }

    switch (boss->unkA9) {
        case 0:
            if (!(0xA & gPlayer.moveState)) {
                if (!(gPlayer.moveState & 0x200000)) {
                    gPlayer.qSpeedAirX = Q(0);
                    gPlayer.qSpeedAirY = Q(0);
                    gPlayer.qSpeedGround = Q(0);
                    gPlayer.moveState |= 0x200000;
                    gPlayer.heldInput = 0;

                    if (worldX > I(gPlayer.qWorldX)) {
                        gPlayer.heldInput = DPAD_RIGHT;
                    } else {
                        gPlayer.heldInput = DPAD_LEFT;
                    }

                    gCamera.SA2_LABEL(unk8) = 0;
                    gCamera.maxX = gCamera.x + 480;
                } else {
                    gPlayer.heldInput = 0;
                }
            }

            if (boss->qUnk7C < -Q(90)) {
                boss->qUnk7C = -Q(90);
                boss->unk84 = 0;
            }

            if ((boss->unk84 == 0) && (gPlayer.moveState & 0x200000)) {
                if (worldX > I(gPlayer.qWorldX)) {
                    boss->unkA9 += 2;
                    s2->variant = 7;
                    s2->prevVariant = 0xFF;
                } else {
                    boss->unkA9++;
                    s->variant = 1;
                    s2->variant = 9;
                    s->prevVariant = -1;
                    s2->prevVariant = -1;
                }
            }
            break;

        case 1:
            if (s2->frameFlags & 0x4000) {
                boss->unkA9++;
                s->variant = 0;
                s2->variant = 7;
                s->frameFlags |= 0x400;
                s2->frameFlags |= 0x400;
                s->prevVariant = -1;
                s2->prevVariant = -1;
            }
            break;

        case 2:
            if (0x4000 & s2->frameFlags) {
                if (s2->frameFlags & 0x400) {
                    boss->unkA9 += 2;
                    s2->variant = 6;
                    s2->prevVariant = -1;
                    boss->unk80 = 0x280;
                } else {
                    boss->unkA9++;
                    s->variant = 1;
                    s2->variant = 9;
                    s->prevVariant = -1;
                    s2->prevVariant = -1;
                }
            }
            break;

        case 3:
            if (s2->frameFlags & 0x4000) {
                boss->unkA9++;
                s->variant = 0;
                s2->variant = 6;
                s->frameFlags |= 0x400;
                s2->frameFlags |= 0x400;
                s->prevVariant = -1;
                s2->prevVariant = -1;
                s2->prevVariant = -1;
                boss->unk80 = 0x280;
            }
            break;

        case 4:
            if (I(gPlayer.qWorldX) < (worldX - 0x60)) {
                gPlayer.heldInput = DPAD_RIGHT;
            }

            if ((float)I(gPlayer.qWorldX) > ((float)gCamera.x + (float)(DISPLAY_WIDTH + 120))) {
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedAirY = 0;
                gPlayer.qSpeedGround = 0;
                gPlayer.heldInput = 0;
            }

            if ((float)(worldX - gCamera.x) > (float)(DISPLAY_WIDTH + 120)) {
                boss->unkA9++;
                boss->unk98 = 0xB4;
                CreateStageResults(gRingCount, gCourseTime);
            }
            break;

        case 5:
            if (I(gPlayer.qWorldX) < (worldX - 96)) {
                gPlayer.heldInput = DPAD_RIGHT;
            }

            if ((float)I(gPlayer.qWorldX) > ((float)gCamera.x + (float)(DISPLAY_WIDTH + 120))) {
                gPlayer.qSpeedAirX = 0;
                gPlayer.qSpeedAirY = 0;
                gPlayer.qSpeedGround = 0;
                gPlayer.heldInput = 0;
            }

            if (--boss->unk98 == 0) {
                TaskDestroy(gCurTask);
            }
            break;
    }
}

void sub_803330C()
{
    EggSnake *boss = TASK_DATA(gCurTask); // NOTE: Unused, but needed for matching!
    struct Task *t = TaskCreate(Task_8033480, sizeof(EggSnakeProjectile), 0x2200U, 0U, TaskDestructor_8034224);
    EggSnakeProjectile *proj = TASK_DATA(t);
    Sprite *s;
    Sprite *s2;
    void *vram;

    proj->unk60 = 0x258;
    proj->unk62 = 0;
    s = &proj->s;

    s->x = 0;
    s->y = 0;
    s->graphics.dest = VramMalloc(6U);
    s->oamFlags = SPRITE_OAM_ORDER(21);
    s->graphics.size = 0;
    s->graphics.anim = 0x297;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    vram = s->graphics.dest;
    s2 = &proj->s2;
    s2->x = 0;
    s2->y = 0;
    s2->graphics.dest = vram;
    s2->oamFlags = SPRITE_OAM_ORDER(21);
    s2->graphics.size = 0;
    s2->graphics.anim = 0x297;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = 0x10;
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = 0xC2000;
}

void sub_803341C(void)
{
    EggSnakeProjectile *proj = TASK_DATA(gCurTask);
    Sprite *sprStrc = &proj->s;
    EggSnake *boss = TASK_DATA(TASK_PARENT(gCurTask));
    Sprite *s2 = &boss->s;
    s16 x, y;

    x = s2->x;
    y = s2->y;
    sprStrc->x = x;
    sprStrc->y = y;
    UpdateSpriteAnimation(sprStrc);
    DisplaySprite(sprStrc);

    s2 = &proj->s2;
    s2->x = x;
    s2->y = y;
    SPRITE_FLAG_SET(s2, X_FLIP);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s2);
}

// TODO: Match without goto
void Task_8033480()
{
    Sprite *s;
    Sprite *s2;
    s16 *temp_r1_2;
    s16 *temp_r2;
    s16 *temp_r7;
    s16 temp_r0_2;
    s8 *temp_r1;
    u16 temp_r0;
    u8 temp_r0_3;

    EggSnakeProjectile *proj = TASK_DATA(gCurTask);
    EggSnake *boss = TASK_DATA(TASK_PARENT(gCurTask));

    s = &proj->s;
    s2 = &proj->s2;
    temp_r1 = &boss->unk9A;
    if (boss->unk9A > 7) {
        TaskDestroy(gCurTask);
        return;
    }
    if (boss->unkA8 != 0) {
        if (proj->unk60 != 0) {
            if (--proj->unk60 == 0) {
                s->frameFlags &= 0xFFFFF7FF;
                s2->frameFlags &= 0xFFFFF7FF;
                temp_r0_3 = boss->s.variant;
                if (temp_r0_3 != 2) {
                    if (temp_r0_3 == 3) {
                        s->frameFlags |= 0x800;
                        s2->frameFlags |= 0x800;
                    lbl:
                        s->prevVariant = 0xFF;
                        proj->s2.prevVariant = -1;
                        s->frameFlags &= 0xFFFFBFFF;
                        s2->frameFlags &= 0xFFFFBFFF;
                        proj->unk62++;
                        CreateProjectile();
                    } else {
                        proj->unk60 = 1;
                    }
                } else {
                    goto lbl;
                }
            }
        } else {
            if ((s->frameFlags & 0x4000) || (boss->s.variant != 2 && boss->s.variant != 3)) {
                if (proj->unk62 != 3) {
                    proj->unk60 = 0x3C;
                } else {
                    proj->unk60 = gUnknown_084ACEF6[boss->unk9A];
                    proj->unk62 = 0;
                }
            } else {
                sub_803341C();
            }
        }
    }
}

void CreateProjectile()
{
    s16 angle;
    s16 temp_r1;
    s16 temp_r3;

    EggSnake *boss;
    EggSnakeProjectile *newProj = TASK_DATA(gCurTask);
    MapEntity *me;

    newProj = TASK_DATA(TaskCreate(Task_8033730, sizeof(EggSnakeProjectile), 0x2300U, 0U, TaskDestructor_8034224));
    boss = TASK_DATA(TASK_PARENT(gCurTask));
    me = boss->base.me;
    newProj->originX = TO_WORLD_POS(boss->base.meX, boss->base.regionX);
    newProj->originY = TO_WORLD_POS(me->y, boss->base.regionY);
    newProj->unk64 = Q(boss->unk90 + 16);
    newProj->unk68 = Q(boss->unk92);
    temp_r3 = I(gPlayer.qWorldX) - (newProj->originX + I(newProj->unk64));
    temp_r1 = I(gPlayer.qWorldY) - (newProj->originY + I(newProj->unk68));
    angle = SA2_LABEL(sub_8004418)(temp_r1 / 2, temp_r3 / 2);
    newProj->unk6C = COS_24_8(angle);
    newProj->unk6E = SIN_24_8(angle);
    newProj->s.x = 0;
    newProj->s.y = 0;
    newProj->s.graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_6_PROJ);
    newProj->s.oamFlags = 0x3C0;
    newProj->s.graphics.size = 0;
    newProj->s.graphics.anim = SA1_ANIM_BOSS_6_PROJ;
    newProj->s.variant = 0;
    newProj->s.animCursor = 0;
    newProj->s.qAnimDelay = 0;
    newProj->s.prevVariant = 0xFF;
    newProj->s.animSpeed = 0x10;
    newProj->s.palId = 0;
    newProj->s.hitboxes[0].index = -1;
    newProj->s.frameFlags = 0x2000;
}

void Task_8033730()
{
    EggSnakeProjectile *proj = TASK_DATA(gCurTask);
    EggSnakeProjectile *prevProj = TASK_DATA(TASK_PARENT(gCurTask));
    EggSnake *boss = TASK_DATA(TASK_PARENT(TASK_PARENT(gCurTask)));
    Sprite *s = &proj->s;
    CamCoord worldX, worldY;
    s32 bossAnim;

    proj->unk64 += proj->unk6C;
    proj->unk68 += proj->unk6E;
    worldX = proj->originX + I(proj->unk64);
    worldY = proj->originY + I(proj->unk68);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((s->y < -32) || (s->y > (DISPLAY_HEIGHT + 16))) {
        if (proj->unk6C >= 0) {
            if (s->x > (DISPLAY_WIDTH + 16)) {
                TaskDestroy(gCurTask);
                return;
            }
        } else if (s->x < -32) {
            TaskDestroy(gCurTask);
            return;
        }
    }

    if (boss->unk9A <= 7) {
        if (Coll_Player_Projectile(s, worldX, worldY) != 0) {
            bossAnim = boss->s.graphics.anim;
            if (bossAnim == SA1_ANIM_BOSS_6_BODY) {
                if (boss->s.variant == 2) {
                    boss->s2.variant = 1;
                }
                if ((boss->s.graphics.anim == bossAnim) && (boss->s.variant == 3)) {
                    boss->s2.variant = 4;
                }
            }
        }
    } else {
        sub_8017540(Q(worldX), Q(worldY));
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_8033878()
{
    EggSnake *boss = TASK_DATA(gCurTask);
    struct Task *t = TaskCreate(Task_8033924, sizeof(EggSnakeSegmentManager), 0x2000U, 0U, TaskDestructor_8034238);
    EggSnakeSegmentManager *mgr;
    Sprite *s;
    Sprite *s2;

    boss->t = t;

    mgr = TASK_DATA(t);
    s = &mgr->s;

    s->x = 0;
    s->y = 0;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_6_SEGMENT);
    s->oamFlags = 0x5C0;
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_6_SEGMENT;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = 0xFF;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
}

void Task_8033924()
{
    EggSnakeSegmentManager *mgr = TASK_DATA(gCurTask);
    Sprite *s = &mgr->s;
    mgr->unk54 = 0;
    mgr->unk57 = 0;
    mgr->unk55 = 0;
    mgr->unk56 = 0;
    mgr->unk58 = 0;

    sPlayerSpeedState.qWorldX = gPlayer.qWorldX;
    sPlayerSpeedState.qWorldY = gPlayer.qWorldY;
    sPlayerSpeedState.qSpeedAirX = gPlayer.qSpeedAirX;
    sPlayerSpeedState.qSpeedAirY = gPlayer.qSpeedAirY;
    sPlayerSpeedState.moveState = gPlayer.moveState;

    DmaFill16(3, 0, gUnknown_03005870, sizeof(gUnknown_03005870));
    UpdateSpriteAnimation(s);
    gCurTask->main = Task_8033AA0;
    sub_80339BC(mgr);
}

void sub_80339BC(EggSnakeSegmentManager *mgr)
{
    EggSnakeSegment *segment;
    u8 i;

    EggSnake *boss = TASK_DATA(TASK_PARENT(gCurTask));
    MapEntity *me = boss->base.me;
    Sprite *s = &mgr->s;

    for (i = 0; i < NUM_SEGMENTS; i++) {
        mgr->tasks[i] = TaskCreate(Task_8034098, sizeof(EggSnakeSegment), (i + 0x2001), 0U, NULL);
        segment = TASK_DATA(mgr->tasks[i]);
        segment->unk30 = TO_WORLD_POS(boss->base.meX, boss->base.regionX);
        segment->unk32 = TO_WORLD_POS(me->y, boss->base.regionY);
        segment->unk38 = (i << 0xD) + 0xFFFF9000;
        segment->unk3C = 0;
        segment->unk40 = 0;
        segment->unk44 = 0;
        segment->unk48 = 0;
        segment->unk52 = i;
        segment->s.hitboxes[0].index = s->hitboxes[0].index;
        segment->s.hitboxes[0].b.left = s->hitboxes[0].b.left;
        segment->s.hitboxes[0].b.top = s->hitboxes[0].b.top;
        segment->s.hitboxes[0].b.right = s->hitboxes[0].b.right;
        segment->s.hitboxes[0].b.bottom = s->hitboxes[0].b.bottom;
    }
}

// NOTE: Logic not accurate. When jumping onto segments, all speed gets lost -> softlock
// (88.12%) https://decomp.me/scratch/qFcCe
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_6__Task_8033AA0.inc", void Task_8033AA0(void))
{
    u8 sp0;
    s32 sp4;
    EggSnakeSegmentManager *mgr;
    EggSnakeSegment *segment;
    s16 *temp_r2_7;
    s16 *temp_r4;
    s16 temp_r0;
    s16 temp_r1_13;
    s16 temp_r1_7;
    s16 temp_r2_2;
    s16 var_r6;
    Sprite *sprSegment;
    s8 temp_r0_12;
    s8 temp_r0_13;
    s8 temp_r0_4;
    s8 temp_r0_7;
    s8 temp_r1_4;
    s8 temp_r1_11;
    u8 temp_r0_3;
    u8 temp_r4_4;
    u8 var_r1_2;
    u8 var_r1_3;
    s8 var_r3_2;
    u8 i;
    u8 standOnIndex;
    CamCoord worldX, worldY;

    standOnIndex = 0;
    mgr = TASK_DATA(gCurTask);
    sp0 = 0;

    DmaCopy16(3, gUnknown_03005870, gUnknown_03005890, sizeof(gUnknown_03005890));
    mgr->unk5E++;
    if (mgr->unk58 == 0) {
        for (i = 0; i < NUM_SEGMENTS; i++) {
            segment = TASK_DATA(mgr->tasks[i]);
            sprSegment = &segment->s;
            worldX = (segment->unk30 + I(segment->unk38));
            worldY = (segment->unk32 + I(segment->unk3C)) + gUnknown_03005870[i];
            sprSegment->x = (worldX - gCamera.x);
            sprSegment->y = (worldY - gCamera.y);
            if (Coll_Player_PlatformCrumbling(sprSegment, worldX, worldY, &gPlayer)) {
                sp0 = -1;
                standOnIndex = i;
                break;
            }
        }
    } else if (!(gPlayer.moveState & (MOVESTATE_STOOD_ON_OBJ | MOVESTATE_IN_AIR))) {
        TaskDestroy(gCurTask);
#ifdef BUG_FIX
        // TODO: Destruction may need to happen at the end of the function, depending on its behavior...
        return;
#endif
    }

    if (sp0 != 0) {
        mgr->unk56 = standOnIndex;
        if ((standOnIndex == 0) || (standOnIndex == 8)) {
            var_r6 = 8;
        } else {
            var_r6 = 16;
        }

        if ((sPlayerSpeedState.moveState & 2) && (sPlayerSpeedState.qSpeedAirY > Q(4))) {
            mgr->unk54 = 2;
            mgr->unk55 = standOnIndex;
            mgr->unk57 = 0xFF;

            if (var_r6 != 8) {
                var_r6 *= 2;
            }

            mgr->unk5A = var_r6;
            for (i = 0; i < NUM_SEGMENTS; i++) {
                if (i == standOnIndex) {
                    mgr->unk5C = I(sPlayerSpeedState.qSpeedAirY);
                    gUnknown_03005870[i] += mgr->unk5C;
                    if (gUnknown_03005870[i] > var_r6) {
                        gUnknown_03005870[i] = var_r6;
                    }
                } else {
                    gUnknown_03005870[i] = 0;
                }
            }
        } else if (mgr->unk54 == 2) {
            s16 value;
            gUnknown_03005870[standOnIndex] += mgr->unk5C;

            if (gUnknown_03005870[standOnIndex] >= mgr->unk5A) {
                gUnknown_03005870[standOnIndex] = mgr->unk5A;
                mgr->unk5C = 1 - mgr->unk5C;
                mgr->unk57 = 0;
            }

            if (gUnknown_03005870[standOnIndex] <= (mgr->unk5A / 2)) {
                gUnknown_03005870[standOnIndex] = -(mgr->unk5A / 2);
                mgr->unk54 = 1;
            }

            for (i = 0; i < NUM_SEGMENTS; i++) {
                if (i != standOnIndex) {
                    temp_r0_12 = standOnIndex - i;
                    if (temp_r0_12 < 0) {
                        temp_r0_12 = -temp_r0_12;
                    }

                    if (temp_r0_12 < 3) {
                        s16 v = gUnknown_03005870[standOnIndex] - ((temp_r0_12 * gUnknown_03005870[standOnIndex]) / 3);
                        gUnknown_03005870[i] = v;
                    }
                }
            }

            if (gUnknown_03005870[0] > 8) {
                gUnknown_03005870[0] = 8;
            }
            if (gUnknown_03005870[8] > 8) {
                gUnknown_03005870[8] = 8;
            }
        } else {
            mgr->unk54 = 1;
            if (gUnknown_03005870[standOnIndex] < 0) {
                gUnknown_03005870[standOnIndex] += 2;
            } else {
                gUnknown_03005870[standOnIndex] += 1;
            }
            if (gUnknown_03005870[standOnIndex] > var_r6) {
                gUnknown_03005870[standOnIndex] = var_r6;
            }

            for (i = 0; i < NUM_SEGMENTS; i++) {
                if (i != standOnIndex) {
                    var_r3_2 = (standOnIndex - i);
                    if (var_r3_2 < 0) {
                        var_r3_2 = -var_r3_2;
                        standOnIndex = (8 - standOnIndex);
                    }
                    temp_r1_13 = gUnknown_03005870[standOnIndex] - ((gUnknown_03005870[standOnIndex] * var_r3_2) / (standOnIndex + 1));
                    if (temp_r1_13 > gUnknown_03005870[i]) {
                        gUnknown_03005870[i]++;
                    }
                    if (temp_r1_13 < gUnknown_03005870[i]) {
                        gUnknown_03005870[i]--;
                    }
                }
            }
            if (gUnknown_03005870[0] > 8) {
                gUnknown_03005870[0] = 8;
            }
            if (gUnknown_03005870[8] > 8) {
                gUnknown_03005870[8] = 8;
            }
        }
        gPlayer.qWorldY += Q(1) + Q(gUnknown_03005870[standOnIndex] - gUnknown_03005890[standOnIndex]);
    } else {
        if (mgr->unk54 == 2) {
            gUnknown_03005870[mgr->unk55] += mgr->unk5C;
            if (gUnknown_03005870[mgr->unk55] >= mgr->unk5A) {
                gUnknown_03005870[mgr->unk55] = mgr->unk5A;
                mgr->unk5C = 1 - mgr->unk5C;
                mgr->unk57 = 0;
            }

            if (gUnknown_03005870[standOnIndex] <= (mgr->unk5A / 2)) {
                gUnknown_03005870[standOnIndex] = -(mgr->unk5A / 2);
                mgr->unk5C = 0;
                mgr->unk54 = 0;
            }

            for (i = 0; i < NUM_SEGMENTS; i++) {
                if (i != mgr->unk55) {
                    temp_r0_4 = mgr->unk55 - i;
                    if (temp_r0_4 < 0) {
                        temp_r0_4 = -temp_r0_4;
                    }

                    if (temp_r0_4 < 3) {
                        s16 v = gUnknown_03005870[mgr->unk55] - ((temp_r0_4 * gUnknown_03005870[mgr->unk55]) / 3);
                        gUnknown_03005870[i] = v;
                    }
                }
            }
            if (gUnknown_03005870[0] > 8) {
                gUnknown_03005870[0] = 8;
            }
            if (gUnknown_03005870[8] > 8) {
                gUnknown_03005870[8] = 8;
            }
        } else {
            mgr->unk54 = 0;

            if (gUnknown_03005870[mgr->unk56] > 0) {
                gUnknown_03005870[mgr->unk56]--;
            }

            if (gUnknown_03005870[mgr->unk56] < 0) {
                gUnknown_03005870[mgr->unk56] += 2;
                if (gUnknown_03005870[mgr->unk56] > 0) {
                    gUnknown_03005870[mgr->unk56] = 0;
                }
            }

            for (i = 0; i < NUM_SEGMENTS; i++) {
                if (i != mgr->unk56) {
                    temp_r0_7 = (mgr->unk56 - i);
                    var_r1_2 = mgr->unk56;
                    temp_r4_4 = var_r1_2;
                    if (temp_r0_7 < 0) {
                        temp_r0_7 = -temp_r0_7;
                        var_r1_2 = (8 - var_r1_2);
                    }
                    temp_r1_7 = gUnknown_03005870[temp_r4_4]
                        - ((gUnknown_03005870[temp_r4_4] * temp_r0_7) / (((var_r1_2 << 24) + (1 << 24)) >> 24));
                    if (temp_r1_7 > gUnknown_03005870[i]) {
                        gUnknown_03005870[i]++;
                    }
                    if (temp_r1_7 < gUnknown_03005870[i]) {
                        gUnknown_03005870[i]--;
                    }
                    if (gUnknown_03005870[0] > 8) {
                        gUnknown_03005870[0] = 8;
                    }
                    if (gUnknown_03005870[8] > 8) {
                        gUnknown_03005870[8] = 8;
                    }
                }
            }
        }
    }

    sPlayerSpeedState.qWorldX = gPlayer.qWorldX;
    sPlayerSpeedState.qWorldY = gPlayer.qWorldY;
    sPlayerSpeedState.qSpeedAirX = gPlayer.qSpeedAirX;
    sPlayerSpeedState.qSpeedAirY = gPlayer.qSpeedAirY;
    sPlayerSpeedState.moveState = gPlayer.moveState;

    if ((gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) && (mgr->unk58 == 0)) {
        for (i = 0; i < NUM_SEGMENTS; i++) {
            segment = TASK_DATA(mgr->tasks[i]);
            sprSegment = &segment->s;
            worldX = (I(segment->unk38) + segment->unk30);
            worldY = I(segment->unk3C) + segment->unk32 + gUnknown_03005870[i];

            if (Coll_Player_PlatformCrumbling(sprSegment, worldX, worldY, &gPartner)) {
                break;
            }
        }
    }
}
END_NONMATCH

void Task_8034098(void)
{
    s16 *sp0;
    EggSnakeSegmentManager *mgr;
    EggSnakeSegment *segment;
    const SpriteOffset *dimensions;
    Sprite *s;
    OamData *oamData;
    OamData *oamAllocated;
    s32 temp_r2;
    u16 temp_r2_2;
    u16 temp_r3_2;
    s16 worldX, worldY;
    u8 temp_r3;

    segment = TASK_DATA(gCurTask);
    mgr = TASK_DATA(TASK_PARENT(gCurTask));
    s = &mgr->s;
    dimensions = s->dimensions;
    worldX = (I(segment->unk38) + segment->unk30);
    worldY = (I(segment->unk3C) + segment->unk32) + gUnknown_03005870[segment->unk52];

    if (((float)(worldY - gCamera.y) < (float)-240)) {
        TaskDestroy(gCurTask);
        return;
    }

    if ((mgr->unk58 == 0) || !(1 & mgr->unk5E)) {
        if ((segment->unk52 == 0) || (s->oamBaseIndex == 0xFF)) {
            s->oamBaseIndex = -1;
            s->x = worldX - gCamera.x;
            s->y = worldY - gCamera.y;
            DisplaySprite(s);
        } else {
            oamData = &gOamMallocBuffer[s->oamBaseIndex];
            oamAllocated = OamMalloc((0x7C0 & s->oamFlags) >> 6);

            if (iwram_end != oamAllocated) {
                DmaCopy16(3, oamData, oamAllocated, sizeof(OamDataShort));
#ifndef EXTENDED_OAM
                oamAllocated->all.attr1 &= ~0x1FF; // x = 0
                oamAllocated->all.attr0 &= ~0xFF; // y = 0
                oamAllocated->all.attr0 += (((worldY - gCamera.y) - dimensions->offsetY) & 0xFF);
                oamAllocated->all.attr1 += (((worldX - gCamera.x) - dimensions->offsetX) & 0x1FF);
#else
                oamAllocated->split.y = (worldY - gCamera.y) - dimensions->offsetY;
                oamAllocated->split.x = (worldX - gCamera.x) - dimensions->offsetX;
#endif
            }
        }
    }
}

void TaskDestructor_8034208(struct Task *t)
{
    EggSnake *boss = TASK_DATA(t);
    VramFree(boss->s.graphics.dest);
    VramFree(boss->s2.graphics.dest);
}

void TaskDestructor_8034224(struct Task *t)
{
    EggSnakeProjectile *proj = TASK_DATA(t);
    VramFree(proj->s.graphics.dest);
}

void TaskDestructor_8034238(struct Task *t)
{
    EggSnakeSegmentManager *mgr = TASK_DATA(t);
    VramFree(mgr->s.graphics.dest);
}

void sub_803424C() { sub_803424C_inline(); }

void sub_803426C(CamCoord worldX, CamCoord worldY)
{
    EggSnake *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    MapEntity *me = boss->base.me;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}
