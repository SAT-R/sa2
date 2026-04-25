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
#include "game/shared/stage/rings_scatter.h"
#include "game/shared/stage/screen_shake.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/water_effects.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/anim_sizes.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "game/shared/stage/underwater_effects.h"

typedef struct EggSpider {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ s32 qUnk6C;
    /* 0x70 */ s32 qUnk70;
    /* 0x74 */ s32 unk74;
    /* 0x78 */ s32 unk78;
    /* 0x78 */ s32 unk7C;
    /* 0x80 */ s32 unk80;
    /* 0x84 */ u16 unk84;
    /* 0x86 */ s8 unk86;
    /* 0x86 */ s8 unk87;
    /* 0x88 */ s16 qUnk88;
    /* 0x8A */ u16 unk8A;
    /* 0x8A */ u8 unk8C;
} EggSpider; /* 0x90 */

typedef struct IciclePlatform {
    /* 0x0C */ Sprite s;
    /* 0x30 */ u8 filler30[0x14];
    /* 0x44 */ CamCoord worldX;
    /* 0x46 */ CamCoord worldY;
    /* 0x48 */ u8 filler48[4];
    /* 0x4C */ s32 unk4C;
    /* 0x50 */ s32 unk50;
    /* 0x54 */ s32 unk54;
    /* 0x58 */ s32 unk58;
    /* 0x30 */ u8 filler5C[0xC];
} IciclePlatform; /* 0x68 */

void Task_EggSpiderInit(void);
void sub_80308A4(CamCoord worldX, CamCoord worldY);
void sub_80309CC(void);
void sub_8030EE4(void);
void sub_80311D4(void);
void Task_8031480(void);
void sub_803170C(void);
void CreateIciclePlatform(EggSpider *boss);
void sub_8031AB4(void);
void TaskDestructor_8031CB4(struct Task *t);

extern s16 gUnknown_084ACEB4[];
extern s16 gUnknown_084ACED8[];
extern s16 gUnknown_084ACEC6[];

static inline void sub_8031CD0_inline(void)
{
    EggSpider *boss = TASK_DATA(gCurTask);
    Sprite *s2 = &boss->s2;

    if ((s2->variant != 0) && (s2->frameFlags & SPRITE_FLAG(ANIM_OVER, 1))) {
        s2->variant = 0U;
        s2->prevVariant = 0xFF;
    }
}

static inline void sub_8031D0C_inline()
{
    EggSpider *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    s2->x = s->x;
    s2->y = s->y;

    if (s->graphics.anim == SA1_ANIM_BOSS_4) {
        const SpriteOffset *dimensions = s->dimensions;

        s2->y -= gUnknown_084ACED8[(s8)dimensions->oamIndex];
    }
}

static inline void sub_8031D54_inline(CamCoord worldX, CamCoord worldY)
{
    EggSpider *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}

void sub_80308A4(CamCoord worldX, CamCoord worldY)
{
    Sprite *s;
    Sprite *s2;
    EHit collPlayer;
    EHit collPartner;
    EggSpider *boss;

    boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s->frameFlags &= ~0x180;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[5] = 0;
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
        if ((collPlayer == 1) || (collPartner == 1)) {
            boss->unk86++;
            boss->unk87 = 120;
            s2->variant = 2;
            s2->frameFlags &= ~0x4000;
            m4aSongNumStart(SE_BOSS_HIT);
        } else if ((collPlayer == 2) || (collPartner == 2)) {
            s2->variant = 1;
            s2->frameFlags &= ~0x4000;
        }
    }
}

void sub_80309CC(void)
{
    EggSpider *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;

    if (boss->unk87 != 0 && --boss->unk87 > 0) {
        if (!(boss->unk87 & 2)) {
            if (PLAYER_IS_ALIVE) {
                s->frameFlags |= 0x100;
                gDispCnt |= DISPCNT_OBJWIN_ON;
                gWinRegs[WINREG_WINOUT] = WINOUT_WINOBJ_ALL | (WINOUT_WIN01_ALL & ~WINOUT_WIN01_CLR);
                gBldRegs.bldCnt = 0xBF;
                gBldRegs.bldY = 0x10;
            }
        }
    }

    DisplaySprite(s);
    DisplaySprite(s2);
}

void CreateEntity_EggSpider(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    EggSpider *boss;
    Sprite *s2;
    Sprite *s;
    s32 temp_r0_3;
    s32 temp_r1_2;
    s32 temp_r4;
    u16 temp_r1_4;
    u8 *temp_r0;
    u8 *temp_r0_2;
    u8 *temp_r1_3;
    struct Task *t;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_EggSpiderInit, sizeof(EggSpider), 0x2000U, 0U, TaskDestructor_8031CB4);
    TaskCreate(InitWaterPalettes, 0U, 0xFFFDU, 0U, NULL);

    boss = TASK_DATA(t);
    s = &boss->s;
    boss->base.regionX = regionX;
    boss->base.regionY = regionY;
    boss->base.me = me;
    boss->base.meX = me->x;
    boss->base.id = id;
    boss->unk84 = 120;
    boss->unk87 = 0;
    boss->unk8A = 0;
    boss->unk8C = 0;
    boss->qUnk6C = Q(48);
    boss->qUnk70 = Q(16);
    boss->unk74 = 0;
    boss->unk78 = 0;

    if (LOADED_SAVE->difficultyLevel != DIFFICULTY_NORMAL) {
        boss->unk86 = 2;
    } else {
        boss->unk86 = 0;
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    s->graphics.dest = VramMalloc(64);
    s->oamFlags = SPRITE_OAM_ORDER(22);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_4;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;

    s2 = &boss->s2;
    s2->x = TO_WORLD_POS(me->x, regionX);
    s2->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s2->graphics.dest = VramMalloc(8U);
    s2->oamFlags = SPRITE_OAM_ORDER(21);
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_BOSS_4_EGGMAN;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = 0;
    s2->prevVariant = -1;
    s2->animSpeed = 0x10;
    s2->palId = 0;
    s2->hitboxes[0].index = -1;
    s2->frameFlags = 0x2000;
#if PORTABLE && WIDESCREEN_HACK
    Bosses_SetCamBounds(s->y, s->y + DISPLAY_HEIGHT, s->x - DISPLAY_WIDTH, s->x);
#else
    Bosses_SetCamBounds(s->y, s->y + (DISPLAY_HEIGHT + 32), s->x - (DISPLAY_WIDTH + 80), s->x);
#endif

    gPlayer.qSpeedGround = 0;
    gPlayer.moveState |= 0x200000;

    if ((gPlayer.character == CHARACTER_KNUCKLES) && ((gPlayer.anim == 269) || (gPlayer.anim == 207))) {
        gPlayer.heldInput = DPAD_DOWN;
    } else {
        gPlayer.heldInput = 0;
    }

    if (gRingsScatterTask != NULL) {
        RingsScatter *scatter = TASK_DATA(gRingsScatterTask);
        scatter->SA2_LABEL(unk2B6) |= 1;
    }
}

void Task_EggSpiderInit(void)
{
    Sprite *s;
    Sprite *s2;

    EggSpider *boss = TASK_DATA(gCurTask);
    MapEntity *me;
    CamCoord worldX, worldY;

    s = &boss->s;
    s2 = &boss->s2;
    me = boss->base.me;
    boss->qUnk6C += boss->unk74;
    boss->qUnk70 += boss->unk78;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk6C);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk70);

    sub_8031D54_inline(worldX, worldY);

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    sub_8031D0C_inline();
    sub_80309CC();

    switch (boss->unk8C) {
        case 0: {
            if (--boss->unk84 == 0) {
                gMusicManagerState.unk1 = 0x10;
                s->variant = 0;
                boss->unk74 = -0x100;
                boss->unk8C++;
            }
            if ((gPlayer.anim == 0xD1) && (gPlayer.variant == 2)) {
                gPlayer.heldInput = 0;
                return;
            }
        } break;

        case 1: {
            if (boss->qUnk6C <= -Q(120)) {
                s->variant = 2;
                boss->qUnk6C = -0x7800;
                boss->unk74 = 0;
                boss->unk84 = 60;
                boss->unk8C++;
            }

            if (gCamera.shiftY != -0x60) {
                gCamera.shiftY--;
                return;
            }
        } break;

        case 2: {
            if (--boss->unk84 == 0) {
                s2->variant = 1;
                boss->unk8C++;
                return;
            }
        } break;

        case 3: {
            if (s2->frameFlags & 0x4000) {
                s2->variant = 0;
                boss->unk84 = 60;
                boss->unk8C++;
            }
        } break;

        case 4: {
            if (--boss->unk84 == 0) {
                gCamera.shiftY = 0;
                gPlayer.moveState &= 0xFFDFFFFF;
                gPlayer.heldInput |= gPlayerControls.jump | gPlayerControls.attack;
                boss->unk8C = 0;
                boss->unk84 = 30;
                gCurTask->main = sub_8030EE4;
            }
        } break;
    }
}

void sub_8030EE4()
{
    s32 sp4;
    Sprite *s;
    Sprite *s2;
    s32 temp_r0_7;

    EggSpider *boss;
    MapEntity *me;
    CamCoord worldX, worldY;

    sp4 = 0;
    boss = TASK_DATA(gCurTask);
    s = &boss->s;
    s2 = &boss->s2;
    me = boss->base.me;
    boss->qUnk6C += boss->unk74;
    boss->qUnk70 += boss->unk78;
    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk6C);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk70);

    sub_80308A4(worldX, worldY);
    if (boss->unk86 > 7) {
        sub_80311D4();
        return;
    }

    sub_8031D54_inline(worldX, worldY);

    sub_8031CD0_inline();

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    sub_8031D0C_inline();

    sub_80309CC();

    if (boss->unk8A != 0) {
        boss->unk8A--;
    }

    switch (boss->unk8C) {
        case 0: {
            if (--boss->unk84 != 0) {
                return;
            }
            s->variant = 0;
            temp_r0_7 = (u32)PseudoRandom32() % 9U;
            boss->unk80 = Q(gUnknown_084ACEC6[temp_r0_7]);
            if (boss->qUnk6C == boss->unk80) {
                boss->unk80 = Q(gUnknown_084ACEC6[((temp_r0_7 + 5) % 9)]);
            }
            if (boss->qUnk6C <= boss->unk80) {
                boss->unk74 = +0x100;
                boss->unk8C = 1;
            } else {
                boss->unk74 = -0x100;
                boss->unk8C = 1;
            }
        } break;

        case 1: {
            if (boss->unk74 > 0) {
                if (boss->qUnk6C > boss->unk80) {
                    sp4 = 1;
                }
            } else {
                if (boss->qUnk6C < boss->unk80) {
                    sp4 = (u8)-1;
                }
            }

            if (sp4 != 0) {
                boss->qUnk6C = boss->unk80;
                boss->unk74 = 0;
                boss->unk84 = 30;
                boss->unk8C = 2;
                s->variant = 2;
            }
        } break;

        case 2: {
            if (--boss->unk84 == 0) {
                if (boss->unk8A != 0) {
                    boss->unk84 = 30;
                    boss->unk8C = 0;
                } else {
                    boss->unk84 = 120;
                    boss->unk8C = 3;
                    s->variant = 1;

                    if (PLAYER_IS_ALIVE) {
                        CreateScreenShake(0x400U, 0U, 0x100U, 120, 0x80U);
                    }
                }
            }
        } break;

        case 3: {
            if (--boss->unk84 == 0) {
                boss->unk84 = 30;
                boss->unk8C = 0;
                boss->unk8A = 120;
                s->variant = 2;
            } else if (((boss->unk84 % gUnknown_084ACEB4[boss->unk86]) == 0) && PLAYER_IS_ALIVE) {
                CreateIciclePlatform(boss);
                m4aSongNumStart(0x91U);
            }
        } break;
    }
}

void sub_80311D4(void)
{
    u16 prevMinY;
    u16 prevMaxY;
    CamCoord worldX, worldY;

    Strc_sub_80168F0 *strc;
    EggSpider *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    struct Task *t;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk6C);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk70);
    s2->variant = 2;
    boss->qUnk88 = 0;
    m4aSongNumStart(SE_EXPLOSION);
    boss->unk84 = 0;
    s->graphics.anim = SA1_ANIM_BOSS_4_BODY;
    s->variant = 0;
    s->prevVariant = 0xFF;

    {
        strc = TASK_DATA(sub_80168F0(worldX, worldY, 0x10, 0x273, 0U));
        strc->qUnk46 = 0;
        strc->unk48 = 0;
        strc->unk42 = 0x80;

        if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
            strc->transform.qScaleX = -Q(1);
            strc->qUnk44 = +Q(1);
        } else {
            strc->qUnk44 = -Q(1);
        }

        strc->unk40 = 60;
    }

    {
        strc = TASK_DATA(sub_80168F0(worldX + 16, worldY + 16, 0xC, 0x273, 1U));
        strc->qUnk46 = 0;
        strc->unk48 = 0;
        strc->unk42 = 0x80;

        if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
            strc->transform.qScaleX = -Q(1);
            strc->qUnk44 = +Q(4);
        } else {
            strc->qUnk44 = -Q(4);
        }

        strc->unk40 = 60;
    }

    {
        strc = TASK_DATA(sub_80168F0(worldX - 16, worldY + 16, 0xC, 0x273, 1U));

        strc->qUnk46 = 0;
        strc->unk48 = 0;
        strc->unk42 = 0x380;

        strc->s.frameFlags |= SPRITE_FLAG(X_FLIP, 1);
        if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
            strc->transform.qScaleX = -Q(1);
            strc->qUnk44 = -Q(4);
        } else {
            strc->qUnk44 = +Q(4);
        }
        strc->unk40 = 60;
    }

    gCamera.minX = gCamera.x;
    gCamera.maxX = gCamera.x + DISPLAY_WIDTH;

    // NOTE: We have to use worldX/worldY to match this function,
    //       even if it doesn't make sense.
    worldX = gCamera.minY;
    worldY = gCamera.maxY;
    CreatePreBossCameraPan(gCamera.maxY - DISPLAY_HEIGHT, (u16)gCamera.maxY);
    gCamera.minY = worldX;
    gCamera.maxY = worldY;

    gWater.targetWaterLevel += DISPLAY_HEIGHT;

    INCREMENT_SCORE_A(1000);

    Task_8031480();
    gCurTask->main = Task_8031480;
}

void Task_8031480(void)
{
    s32 res;

    EggSpider *boss = TASK_DATA(gCurTask);
    SpriteBase *base = &boss->base;
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    boss->qUnk88 += 0x2;
    boss->qUnk70 += boss->qUnk88;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk6C);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk70);

    res = sa2__sub_801F100(worldY + 0x38, worldX, 1, 8, &sa2__sub_801EC3C);

    if (boss->unk84 > 120)
        if (res < 0) {
            boss->qUnk88 = 0U;
            gCurTask->main = sub_803170C;
        }

    s->frameFlags &= ~0x180;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    boss->unk84++;
    if ((boss->unk84 & 0x7) == 0) {
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

    sub_8031D0C_inline();
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

void sub_803170C(void)
{
    EggSpider *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk6C);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk70);

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= ~0x8000;
        s->frameFlags &= ~0x180;
    }

    if (boss->unk84++ > 300) {
        Strc_sub_80168F0 *strc;
        CreatePostBossEggMobile(worldX, worldY + 40);
        CreateBossCapsule(worldX, worldY);
        gMusicManagerState.unk1 = 0x30;

        TaskDestroy(gCurTask);
        return;
    }

    if ((boss->unk84 & 7) == 0) {
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

    gWinRegs[5] = 0;
    gBldRegs.bldCnt = 0;
    gBldRegs.bldY = 0;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    sub_8031D0C_inline();
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

// (96.94%) https://decomp.me/scratch/TvEoX
NONMATCH("asm/non_matching/game/sa1/stage/enemies/boss_4__CreateIciclePlatform.inc", void CreateIciclePlatform(EggSpider *boss))
{
    s32 rnd1;
    s32 rnd;
    IciclePlatform *icicle;
    struct Task *t;
    MapEntity *me;
    Sprite *s;
    s32 v0;
#if 0
    register u32 r7 asm("r7");
#else
    u32 r7;
#endif
    u8 *ptr;

    me = boss->base.me;
    t = TaskCreate(sub_8031AB4, sizeof(IciclePlatform), 0x2200U, 0U, NULL);
    icicle = TASK_DATA(t);
    s = &icicle->s;
    icicle->worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX);
    icicle->worldY = TO_WORLD_POS(me->y, boss->base.regionY);

    r7 = ((u32)PseudoRandom32() >> 1);
    r7 &= 0xF;
    icicle->unk4C = Q(-(((r7 << 2) + r7) << 2) - 10);
    icicle->unk50 = -Q(32);
    icicle->unk54 = 0;
    icicle->unk58 = 0xA;
    PseudoRandom32();
    icicle->unk58 = ((PseudoRandom32()) & 0xF) + 10;

    s->x = 0;
    s->y = 0;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2720);
    s->oamFlags = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_4_ICICLE;

    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
}
END_NONMATCH

void sub_8031AB4(void)
{
    s16 temp_r6;
    s32 temp_r0;
    s32 temp_r1;
    s32 temp_r2;
    s32 temp_r2_3;
#ifndef NON_MATCHING
    register s32 var_r0 asm("r0");
    register s32 var_r1 asm("r1");
    register s32 temp_r2_2 asm("r2");
#else
    s32 var_r0;
    s32 var_r1;
    s32 temp_r2_2;
#endif
    s32 var_r1_2;
    s32 var_sl;
    EggSpider *boss;
    Sprite *s;
    CamCoord worldX, worldY;
    IciclePlatform *icicle;
    s32 sp4;

    sp4 = 0;
    icicle = TASK_DATA(gCurTask);
    boss = TASK_DATA(TASK_PARENT(gCurTask));
    s = &icicle->s;
    temp_r2 = icicle->unk50;
    if (((icicle->worldY + I(icicle->unk50)) - 17) < gWater.currentWaterLevel) {
        icicle->unk54 += icicle->unk58;
        icicle->unk50 += icicle->unk54;
        var_sl = icicle->unk54;
    } else {
        sp4 = 1;
        if (boss->unk86 > 7) {
            icicle->unk54 += icicle->unk58;
        } else {
            var_r1_2 = icicle->unk58;
            if (var_r1_2 < 0) {
                var_r1_2 += 7;
            }
            icicle->unk54 += var_r1_2 >> 3;
        }

        var_r1 = icicle->unk54;
        var_r0 = var_r1;
        if (var_r1 < 0) {
            var_r0 = var_r1 + 7;
        }
        temp_r2_2 = var_r0 >> 3;
        icicle->unk50 += temp_r2_2;
        var_sl = temp_r2_2;
    }

    if (icicle->unk50 > Q(208)) {
        TaskDestroy(gCurTask);
        return;
    }

    worldX = icicle->worldX + I(icicle->unk4C);
    worldY = icicle->worldY + I(icicle->unk50);
    UpdateSpriteAnimation(s);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if ((boss != TASK_PTR(NULL)) && (boss->unk86 <= 7)) {
        sub_800BFEC(s, worldX, worldY, &gPlayer);
        if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
            sub_800BFEC(s, worldX, worldY, &gPartner);
        }
    }
    if (sp4 != 0) {
        Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPlayer);
    }

    if ((8 & gPlayer.moveState) && (gPlayer.stoodObj == s)) {
        if (icicle->unk50 > Q(196)) {
            gPlayer.moveState &= ~8;
        } else {
            gPlayer.qWorldY += Q(1) + var_sl;
        }
    }
    if ((s8)(u8)gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
        Coll_Player_PlatformCrumbling(s, worldX, worldY, &gPartner);

        if ((8 & gPartner.moveState) && (gPartner.stoodObj == s)) {
            if (icicle->unk50 > Q(196)) {
                gPartner.moveState &= ~8;
            } else {
                gPartner.qWorldY += Q(1) + var_sl;
            }
        }
    }
    DisplaySprite(s);
}

void TaskDestructor_8031CB4(struct Task *t)
{
    EggSpider *boss = TASK_DATA(t);

    VramFree(boss->s.graphics.dest);
    VramFree(boss->s2.graphics.dest);
}

void sub_8031CD0(void) { sub_8031CD0_inline(); }

void sub_8031D0C(void) { sub_8031D0C_inline(); }

// TODO: Check inline match
void sub_8031D54(CamCoord worldX, CamCoord worldY) { sub_8031D54_inline(worldX, worldY); }
