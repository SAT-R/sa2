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
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Hitbox reserved[2];
    /* 0x4C */ Sprite s2;
    /* 0x3C */ Hitbox reserved2[3];
    /* 0x94 */ s32 qUnk94;
    /* 0x98 */ s32 qUnk98;
    /* 0x9C */ s32 qUnk9C;
    /* 0xA0 */ s32 qUnkA0;
    /* 0xA4 */ s32 unkA4;
    /* 0xA8 */ u16 unkA8;
    /* 0xAA */ s16 unkAA;
    /* 0xAC */ u16 unkAC;
    /* 0xAE */ s8 unkAE;
    /* 0xAF */ s8 unkAF;
    /* 0xB0 */ s8 unkB0;
    /* 0xB1 */ u8 unkB1;
    /* 0xB2 */ s16 qUnkB2;
} EggPress;

extern s16 gUnknown_084ACDA0[];
extern s16 gUnknown_084ACDAC[];

void Task_EggPressMain(void);
void sub_802D748(s16 arg0, s16 arg1);
void sub_802D870(void);
void sub_802D908(void);
void Task_802DC3C(void);
void Task_802DDCC(void);
void Task_802DEFC(void);
void Task_802E130(void);
void Task_802E290(void);
void Task_802E3DC(void);
void Task_802E500(void);
void Task_802E714(void);
void Task_802EA8C(void);
void sub_802E868(void);
void sub_802ECFC(void);
void TaskDestructor_EggPress(struct Task *t);

static inline void sub_802EF24_inline(void)
{
    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s2 = &boss->s2;

    if ((s2->variant != 0) && (s2->frameFlags & SPRITE_FLAG(ANIM_OVER, 1))) {
        s2->variant = 0U;
        s2->prevVariant = 0xFF;
    }
}

static inline void sub_802EF60_inline(CamCoord worldX, CamCoord worldY)
{
    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
}

void sub_802D748(s16 arg0, s16 arg1)
{
    Sprite *s, *s2;
    EHit collPlayer;
    EHit collPartner;
    u8 *regionX;

    EggPress *boss = TASK_DATA(gCurTask);

    s = &boss->s;
    s->frameFlags &= ~SPRITE_FLAG_MASK_OBJ_MODE;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= ~DISPCNT_OBJWIN_ON;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    if (boss->unkAF == 0) {
        collPlayer = Coll_Player_Bosses_2_6(&boss->s, arg0, arg1, &gPlayer);
        if (gNumSingleplayerCharacters == NUM_SINGLEPLAYER_CHARS_MAX) {
            collPartner = Coll_Player_Bosses_2_6(&boss->s, arg0, arg1, &gPartner);
        } else {
            collPartner = HIT_NONE;
        }

        s2 = &boss->s2;
        if ((collPlayer == HIT_ENEMY) || (collPartner == HIT_ENEMY)) {
            boss->unkAE++;
            boss->unkAF = 0x20;

            if (boss->unkAE == 4) {
                boss->unkB0 = 1;
            }

            s2->variant = 2;
            s2->frameFlags &= ~SPRITE_FLAG(ANIM_OVER, 1);
            m4aSongNumStart(SE_BOSS_HIT);
        } else if ((collPlayer == HIT_PLAYER) || (collPartner == HIT_PLAYER)) {
            s2->variant = 1;
            s2->frameFlags &= ~SPRITE_FLAG(ANIM_OVER, 1);
        }
    }
}

// TODO: Work out matching without TASK_GET_MEMBER!
void sub_802D870(void)
{
    struct Task *t = gCurTask;
    Sprite *s = &TASK_GET_MEMBER(EggPress, t, Sprite, s);
    Sprite *s2 = &TASK_GET_MEMBER(EggPress, t, Sprite, s2);
    s8 *unkAF = &TASK_GET_MEMBER(EggPress, t, s8, unkAF);

    if (*unkAF != 0) {
        if ((--(*unkAF) > 0x10) && !((*unkAF) & 2) && PLAYER_IS_ALIVE) {
            s->frameFlags |= SPRITE_FLAG(OBJ_MODE, 2);
            gDispCnt |= DISPCNT_OBJWIN_ON;
            gWinRegs[WINREG_WINOUT] = WINOUT_WINOBJ_ALL | (WINOUT_WIN01_ALL & ~WINOUT_WIN01_CLR);
            gBldRegs.bldCnt = 0xBF;
            gBldRegs.bldY = 0x10;
        }
    }
    DisplaySprite(s);
    DisplaySprite(s2);
}

void sub_802D908(void)
{
    struct Task *t = gCurTask;
    Sprite *s = &TASK_GET_MEMBER(EggPress, t, Sprite, s);
    Sprite *s2 = &TASK_GET_MEMBER(EggPress, t, Sprite, s2);
    s16 var_r0;

    s2->x = s->x;
    s2->y = s->y;
    if (s->graphics.anim == SA1_ANIM_BOSS_2) {
        s8 index = s->dimensions->oamIndex;
        index /= 5;
        s2->y -= gUnknown_084ACDA0[index];
    } else {
        s2->y += 46;
    }
}

void CreateEntity_EggPress(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Sprite *s;
    Sprite *s2;
    u16 temp_r4_2;
    struct Task *t;
    EggPress *boss;

    if (IS_MULTI_PLAYER) {
        SET_MAP_ENTITY_INITIALIZED(me);
        return;
    }

    t = TaskCreate(Task_EggPressMain, sizeof(EggPress), 0x2000U, 0U, TaskDestructor_EggPress);
    boss = TASK_DATA(t);

    s = &boss->s;
    boss->base.regionX = regionX;
    boss->base.regionY = regionY;
    boss->base.me = me;
    boss->base.meX = me->x;
    boss->base.id = id;

    boss->unkA8 = 0;
    boss->unkAC = 0;
    boss->unkAA = -8;
    boss->unkAF = 0;
    boss->unkB0 = 0;
    boss->qUnk94 = 0;
    boss->unkB1 = 0;

    if (LOADED_SAVE->difficultyLevel != 0) {
        boss->unkAE = 2;
    } else {
        boss->unkAE = 0;
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_2);
    s->oamFlags = SPRITE_OAM_ORDER(21);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BOSS_2;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = 0xFF;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    s2 = &boss->s2;
    s2->x = TO_WORLD_POS(me->x, regionX);
    s2->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s2->graphics.dest = ALLOC_TILES(SA1_ANIM_BOSS_2_EGGMAN);
    s2->oamFlags = SPRITE_OAM_ORDER(22);
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_BOSS_2_EGGMAN;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);

#if PORTABLE && ((240 + 60) < DISPLAY_WIDTH)
    // TODO: We need to spawn *something* at the left bound, to prevent both Player and Boss
    //       from leaving the designated Boss Area if the DISPLAY_WIDTH is too large.
    // The Boss is programmed to land on a fixed Y-value, so it "clips through" slopes.
    Bosses_SetCamBounds(s->y - (DISPLAY_HEIGHT - 16), s->y + 16, (int)((float)s->x - DISPLAY_WIDTH), s->x);
#else
    Bosses_SetCamBounds(s->y - (DISPLAY_HEIGHT - 16), s->y + 16, (int)((float)s->x - (DISPLAY_WIDTH * 1.25f)), s->x);
#endif // PORTABLE

    gMusicManagerState.unk1 = 0x10;
}

void Task_EggPressMain(void)
{
    CamCoord worldX, worldY;
    MapEntity *me;
    Sprite *s;
    Sprite *s2;

    EggPress *boss = TASK_DATA(gCurTask);

    if (boss->unkAC++ > 120) {
        s = &boss->s;
        s2 = &boss->s2;
        me = boss->base.me;

        boss->qUnk94 = -Q(60);
        boss->qUnk98 = -Q(144);
        boss->qUnkA0 = 0;

        worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
        worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);
        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y;
        s2->x = s->x;
        s2->y = s->y;
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        DisplaySprite(s);
        DisplaySprite(s2);
        gCurTask->main = Task_802DC3C;
        gCurTask->main();
    }
}

void Task_802DC3C(void)
{
    MapEntity *me;
    Sprite *s;
    Sprite *s2;
    CamCoord worldX, worldY;

    EggPress *boss = TASK_DATA(gCurTask);

    s = &boss->s;
    s2 = &boss->s2;
    me = boss->base.me;

    if (boss->qUnk98 != 0) {
        boss->qUnkA0 += Q(32. / 256.);
        boss->qUnk98 += boss->qUnkA0;

        if (boss->qUnk98 >= 0) {
            boss->qUnk98 = 0;
            s->graphics.anim = SA1_ANIM_BOSS_2;
            s->variant = 1;
            s->prevVariant = -1;
            UpdateSpriteAnimation(s);
            UpdateSpriteAnimation(s2);
            m4aSongNumStart(SE_IMPACT);
        }

        worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
        worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);
        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y;

        sub_802D908();
        DisplaySprite(s);
        DisplaySprite(s2);
    } else {
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);

        worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
        worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);
        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y;

        sub_802D908();
        DisplaySprite(s);
        DisplaySprite(s2);

        if (s->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) {
            gCurTask->main = Task_802DDCC;
            s->graphics.anim = SA1_ANIM_BOSS_2;
            boss->s.variant = 0;
            boss->s.prevVariant = 0xFF;
            boss->unkAC = 120;
        }
    }
}

void Task_802DDCC(void)
{
    MapEntity *me;
    Sprite *s;
    Sprite *s2;
    CamCoord worldX, worldY;

    EggPress *boss = TASK_DATA(gCurTask);

    s = &boss->s;
    s2 = &boss->s2;
    me = boss->base.me;

    if (boss->s2.variant == 0) {
        if (--boss->unkAC == 60) {
            boss->s2.variant = 1;
            boss->s2.prevVariant = 0xFF;
        }

        if (boss->unkAC == 0) {
            gCurTask->main = Task_802DEFC;
            boss->qUnkA0 = 0;
            s->graphics.anim = SA1_ANIM_BOSS_2;
            boss->s.variant = 1;
            boss->s.prevVariant = 0xFF;
            s2->graphics.anim = SA1_ANIM_BOSS_2_EGGMAN;
            boss->s2.variant = 0;
            boss->s2.prevVariant = -1;
        }
    } else if (s2->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) {
        boss->s2.variant = 0;
        boss->s2.prevVariant = -1;
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    sub_802D908();
    DisplaySprite(s);
    DisplaySprite(s2);
}

void Task_802DEFC(void)
{
    Sprite *sprOuter;
    Sprite *spr2Outer;
    s16 unkAE;
    EggPress *boss;
    MapEntity *me;
    CamCoord worldX, worldY;

    struct Task *t = gCurTask;
    boss = TASK_DATA(gCurTask);
    sprOuter = &boss->s;
    spr2Outer = &boss->s2;
    me = boss->base.me;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);
    sub_802D748(worldX, worldY);
    if (boss->unkAE > 7) {
        sub_802E868();
    } else {
        sub_802EF60_inline(worldX, worldY);
        sub_802EF24_inline();
        UpdateSpriteAnimation(sprOuter);
        UpdateSpriteAnimation(spr2Outer);
        sub_802D908();
        sub_802D870();

        if (sprOuter->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) {
            if ((boss->unkB0 & 0x3) == 1) {
                boss->qUnk9C = 0;
                boss->qUnkA0 = -Q(10);
                gCurTask->main = Task_802E500;
            } else {
                boss->qUnk9C = (gPlayer.qWorldX - Q(worldX)) / 72;
                boss->qUnkA0 = -Q(4.5);
                boss->unkA4 = 0x20;
                boss->qUnk9C = (((gUnknown_084ACDAC[boss->unkAE]) * boss->qUnk9C) / 10);
                boss->qUnkA0 = (((gUnknown_084ACDAC[boss->unkAE]) * boss->qUnkA0) / 10);
                unkAE = gUnknown_084ACDAC[boss->unkAE];
                boss->unkA4 = ((unkAE * (unkAE * boss->unkA4)) / 100);

                if (boss->qUnk9C < 0) {
                    sprOuter->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
                    spr2Outer->frameFlags &= ~SPRITE_FLAG(X_FLIP, 1);
                } else {
                    sprOuter->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
                    spr2Outer->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
                }

                gCurTask->main = Task_802E130;
            }

            if (boss->unkB0 != 0) {
                boss->unkB0++;
            }
        }
    }
}

void Task_802E130(void)
{
    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    boss->qUnkA0 += boss->unkA4;
    boss->qUnk94 += boss->qUnk9C;
    boss->qUnk98 += boss->qUnkA0;
    if (boss->qUnk98 >= 0) {
        boss->qUnk98 = 0;
        boss->qUnk9C = 0;
        boss->qUnkA0 = 0;
        boss->s.variant = 1;
        boss->s.prevVariant = 0xFF;
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        gCurTask->main = Task_802E290;
        m4aSongNumStart(0x91U);
    }

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    sub_802D748(worldX, worldY);
    if (boss->unkAE > 7) {
        sub_802E868();
    } else {
        sub_802EF60_inline(worldX, worldY);
        sub_802EF24_inline();
        sub_802D908();
        sub_802D870();
    }
}

void Task_802E290(void)
{
    CamCoord worldX, worldY;

    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    sub_802D748(worldX, worldY);
    if (boss->unkAE > 7) {
        sub_802E868();
    } else {
        sub_802EF60_inline(worldX, worldY);
        sub_802EF24_inline();
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        sub_802D908();
        sub_802D870();

        if (s->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) {
            s32 val;
            s8 index;
            s->variant = 0;
            s->prevVariant = -1;
#ifndef NON_MATCHING
            boss->unkAC = 30;
#endif
            val = 300;
            boss->unkAC = (val / gUnknown_084ACDAC[boss->unkAE]);
            gCurTask->main = Task_802E3DC;
        }
    }
}

void Task_802E3DC(void)
{
    CamCoord worldX, worldY;

    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    sub_802D748(worldX, worldY);
    if (boss->unkAE > 7) {
        sub_802E868();
    } else {
        sub_802EF60_inline(worldX, worldY);
        sub_802EF24_inline();
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        sub_802D908();
        sub_802D870();

        if (--boss->unkAC == 0) {
            s32 val;
            s8 index;
            s->variant = 1;
            s->prevVariant = -1;
            gCurTask->main = Task_802DEFC;
        }
    }
}

void Task_802E500(void)
{
    MapEntity *me;
    Sprite *s2;
    CamCoord worldX, worldY;

    EggPress *boss = TASK_DATA(gCurTask);
    s2 = &boss->s2;
    me = boss->base.me;
    boss->qUnkA0 += Q(32. / 256.);
    boss->qUnk98 += boss->qUnkA0;

    if (boss->qUnk98 < -Q(200)) {
        boss->qUnk94 = gPlayer.qWorldX - Q(TO_WORLD_POS(boss->base.meX, boss->base.regionX));
    }

    if (boss->qUnk98 >= 0) {
        boss->qUnk98 = 0;
        boss->qUnkA0 = 0;
        boss->unkAC = 60;
        boss->s.variant = 2;
        boss->s.prevVariant = 0xFF;
        gCurTask->main = Task_802E714;
        m4aSongNumStart(SE_IMPACT);
        CreateScreenShake(0x800U, 0x40U, 0x100U, -1U, 0x80);

        if (!(gPlayer.moveState & MOVESTATE_IN_AIR) || (gPlayer.charState == CHARSTATE_65)
            || ((gPlayer.moveState & MOVESTATE_4000000) && ((gPlayer.anim != SA1_CHAR_ANIM_AMY_LEAP) || (gPlayer.variant != 0)))) {
            Coll_DamagePlayer(&gPlayer);
            s2->variant = 1;
            s2->frameFlags = s2->frameFlags & ~SPRITE_FLAG(ANIM_OVER, 1);
        }
        if ((gNumSingleplayerCharacters == 2) && !(gPartner.moveState & MOVESTATE_IN_AIR)) {
            Coll_DamagePlayer(&gPlayer);
            s2->variant = 1;
            s2->frameFlags &= ~SPRITE_FLAG(ANIM_OVER, 1);
        }
    }

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    sub_802D748(worldX, worldY);
    if (boss->unkAE > 7) {
        sub_802E868();
    } else {
        sub_802EF60_inline(worldX, worldY);
        sub_802EF24_inline();
        sub_802D908();
        sub_802D870();
    }
}

void Task_802E714(void)
{
    CamCoord worldX, worldY;

    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    sub_802D748(worldX, worldY);
    if (boss->unkAE > 7) {
        sub_802E868();
    } else {
        sub_802EF60_inline(worldX, worldY);
        sub_802EF24_inline();
        UpdateSpriteAnimation(s);
        UpdateSpriteAnimation(s2);
        sub_802D908();
        sub_802D870();

        if (s->variant == 2) {
            if (s->frameFlags & SPRITE_FLAG(ANIM_OVER, 1)) {
                s->variant = 0;
                s->prevVariant = -1;
            }
        } else if (--boss->unkAC == 0) {
            s32 val;
            s8 index;
            s->graphics.anim = SA1_ANIM_BOSS_2;
            s->variant = 1;
            s->prevVariant = -1;
            gCurTask->main = Task_802DEFC;
        }
    }
}

void sub_802E868(void)
{
    Strc_sub_80168F0 *tSub0;

    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    s = &boss->s;
    boss->qUnk98 -= Q(48);

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    s2->variant = 2;
    boss->qUnkB2 = -Q(2);
    m4aSongNumStart(SE_EXPLOSION);
    boss->unkAC = 0;
    s->graphics.anim = SA1_ANIM_BOSS_2_NO_SPRING;
    s->variant = 0;
    s->prevVariant = 0xFF;

    {
        tSub0 = TASK_DATA(sub_80168F0(worldX, worldY, 8, SA1_ANIM_BOSS_2_SPRING, 0));
        tSub0->qUnk46 = -Q(2);
        tSub0->unk48 = 0;
        tSub0->unk42 = 0x80;

        if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
            tSub0->transform.qScaleX = -Q(1);
            tSub0->qUnk44 = +Q(4);
        } else {
            tSub0->qUnk44 = -Q(4);
        }
        tSub0->unk40 = 60;
    }

    {
        tSub0 = TASK_DATA(sub_80168F0(worldX, worldY + 32, 8, SA1_ANIM_BOSS_2_BASE, 0));
        tSub0->qUnk46 = -Q(2);
        tSub0->unk48 = 0;
        tSub0->unk42 = 0x180;

        if (s->frameFlags & SPRITE_FLAG(X_FLIP, 1)) {
            tSub0->transform.qScaleX = -Q(1);
            tSub0->qUnk44 = +Q(4);
        } else {
            tSub0->qUnk44 = -Q(4);
        }
        tSub0->unk40 = 60;
    }

    gCamera.minX = gCamera.x;
    gCamera.maxX = gCamera.x + DISPLAY_WIDTH;

    INCREMENT_SCORE_A(1000);

    Task_802EA8C();
    gCurTask->main = Task_802EA8C;
}

void Task_802EA8C(void)
{
    EggPress *boss = TASK_DATA(gCurTask);
    SpriteBase *base = &boss->base;
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;
    s32 res;

    boss->qUnkB2 += 0x28;
    boss->qUnk98 += boss->qUnkB2;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    res = SA2_LABEL(sub_801F100)(worldY + 0x10, worldX, 1, 8, &SA2_LABEL(sub_801EC3C));
    if (res < 0) {
        boss->qUnk98 += Q(res);
        boss->qUnkB2 = (boss->qUnkB2 >> 2) - boss->qUnkB2;
        if (boss->qUnkB2 > -Q(1)) {
            boss->qUnkB2 = 0U;
            gCurTask->main = sub_802ECFC;
        }
    }

    s->frameFlags &= ~0x180;

    if (PLAYER_IS_ALIVE) {
        gDispCnt &= 0x7FFF;
        gWinRegs[WINREG_WINOUT] = 0;
        gBldRegs.bldCnt = 0;
        gBldRegs.bldY = 0;
    }

    ++boss->unkAC;
    if ((boss->unkAC & 7) == 0) {
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
        bolts->qUnk34 = Q(worldY);
        sprBolts->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        sprBolts->oamFlags = SPRITE_OAM_ORDER(17);
        bolts->qUnk3E = Q(40. / 256.);
        bolts->qUnk40 = Q(32. / 256.);
        rndTheta = PseudoRandom32();
        bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
        bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

        rnd = PseudoRandom32();
        sub_8017540(Q((worldX + (0x3F & rnd)) - 32), Q(worldY - ((rnd & 0x3F0000) >> 0x10)));
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    sub_802D908();
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

void sub_802ECFC(void)
{
    EggPress *boss = TASK_DATA(gCurTask);
    Sprite *s = &boss->s;
    Sprite *s2 = &boss->s2;
    MapEntity *me = boss->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(boss->base.meX, boss->base.regionX) + I(boss->qUnk94);
    worldY = TO_WORLD_POS(me->y, boss->base.regionY) + I(boss->qUnk98);

    if (boss->unkAC++ > 240) {
        CreatePostBossEggMobile(worldX, worldY - 4);
        CreateBossCapsule(worldX, worldY);
        gMusicManagerState.unk1 = 0x30;
        TaskDestroy(gCurTask);
        return;
    }

    if ((boss->unkAC & 7) == 0) {
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
        bolts->qUnk34 = Q(worldY);
        sprBolts->frameFlags = SPRITE_FLAG(PRIORITY, 2);
        sprBolts->oamFlags = SPRITE_OAM_ORDER(17);
        bolts->qUnk3E = Q(40. / 256.);
        bolts->qUnk40 = Q(32. / 256.);
        rndTheta = PseudoRandom32();
        bolts->qUnk3A = (-(SIN(rndTheta & 0x1FF) * 0x600)) >> 0xE;
        bolts->qUnk38 = (-(COS(rndTheta & 0x1FF) * 0x600)) >> 0xE;

        rnd = PseudoRandom32();
        sub_8017540(Q((worldX + (0x3F & rnd)) - 32), Q(worldY - ((rnd & 0x3F0000) >> 0x10)));
    }

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    sub_802D908();
    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    DisplaySprite(s2);
}

void TaskDestructor_EggPress(struct Task *t)
{
    EggPress *boss = TASK_DATA(t);
    VramFree(boss->s.graphics.dest);
    VramFree(boss->s2.graphics.dest);
}

void sub_802EF24(void) { sub_802EF24_inline(); }

void sub_802EF60(CamCoord worldX, CamCoord worldY) { sub_802EF60_inline(worldX, worldY); }
