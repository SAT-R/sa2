#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/sa1/save.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

// NOTE: Not the same jet-powered Pen enemy as in SA2.
//       This one shoots ice balls that slide on the ground.

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s16 qUnk30;
    /* 0x32 */ s16 qUnk32;
    /* 0x34 */ s32 qUnk34;
    /* 0x38 */ s32 qUnk38;
    /* 0x3C */ s32 qWorldX;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s32 qWorldY;
    /* 0x48 */ u16 unk48;
    /* 0x4A */ u8 unk4A;
    /* 0x4B */ bool8 unk4B;
} PenMk1Debris;

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s16 qUnk30;
    /* 0x32 */ s16 qUnk32;
    /* 0x34 */ s32 qUnk34;
    /* 0x38 */ s32 qUnk38;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unused40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ u16 unk48;
    /* 0x4A */ u8 unk4A;
    /* 0x4B */ bool8 unk4B;
} PenMk1Snowball;

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s16 qUnk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s16 unk48;
} PenMk1;

void Task_PenMk1Main(void);
void Task_8073CC4(void);
void CreatePenMk1Snowball(CamCoord worldX, CamCoord worldY, u8 dir);
void Task_PenMk1Snowball(void);
void CreatePenMk1SnowballDebris(CamCoord worldX, CamCoord worldY);
void Task_SnowballDebris(void);

void CreateEntity_PenMk1(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_4 || (LOADED_SAVE->difficultyLevel == DIFFICULTY_NORMAL)) {
        Task *t = TaskCreate(Task_PenMk1Main, sizeof(PenMk1), 0x2000, 0, TaskDestructor_EntityShared);
        PenMk1 *pen = TASK_DATA(t);
        Sprite *s = &pen->shared.s;

        pen->shared.base.regionX = regionX;
        pen->shared.base.regionY = regionY;
        pen->shared.base.me = me;
        pen->shared.base.meX = me->x;
        pen->shared.base.id = id;

        pen->qUnk44 = -Q(0.625);
        pen->qUnk3C = 0;
        pen->unk40 = 0;
        pen->unk46 = 0;
        pen->unk48 = 0;

        // NOTE: x|y set to world- not screen-pos!
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_PEN);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_PEN;
        s->variant = 0;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        UpdateSpriteAnimation(s);
    }
}

void Task_PenMk1Main(void)
{
    PenMk1 *pen = TASK_DATA(gCurTask);
    Sprite *s = &pen->shared.s;
    MapEntity *me = pen->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    s32 xSquared, ySquared;

    worldX = TO_WORLD_POS(pen->shared.base.meX, pen->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, pen->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    pen->qUnk3C += pen->qUnk44;

    worldX += I(pen->qUnk3C);
    worldY += pen->unk40;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pen->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    pen->unk40 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, NULL, SA2_LABEL(sub_801EE64));

    xSquared = I(gPlayer.qWorldX) - worldX;
    xSquared = xSquared * xSquared;
    ySquared = I(gPlayer.qWorldY) - worldY;
    ySquared = ySquared * ySquared;

    if (I(pen->qUnk3C) <= (me->d.sData[0] + 1) * TILE_WIDTH) {
        if (~s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            SPRITE_FLAG_SET(s, X_FLIP);
            pen->qUnk44 = +Q(0.625);
        }
    } else if (I(pen->qUnk3C) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            SPRITE_FLAG_CLEAR(s, X_FLIP);
            pen->qUnk44 = -Q(0.625);
        }
    } else if (pen->unk48 != 0) {
        pen->unk48--;
    } else {
        if (xSquared + ySquared < SQUARE(80)) {
            pen->unk46 = 0;
            pen->unk48 = 60;
            s->variant = 1;
            s->prevVariant = -1;
            gCurTask->main = Task_8073CC4;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_8073CC4(void)
{
    PenMk1 *pen = TASK_DATA(gCurTask);
    Sprite *s = &pen->shared.s;
    MapEntity *me = pen->shared.base.me;
    CamCoord worldY, worldX;
    s32 worldX2, worldY2;
    u8 sp08;

    worldX = TO_WORLD_POS(pen->shared.base.meX, pen->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, pen->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX += I(pen->qUnk3C);
    worldY += pen->unk40;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    pen->unk40 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));
    pen->unk46++;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, pen->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (pen->unk46 == 13) {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            CreatePenMk1Snowball(worldX + 4, worldY, 1);
        } else {
            CreatePenMk1Snowball(worldX - 6, worldY, 0);
        }
    }

    pen->unk40 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

    if (pen->unk46 > 16) {
        pen->unk46 = 0;
        s->prevVariant = -1;
        s->variant = 0;
        gCurTask->main = Task_PenMk1Main;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreatePenMk1Snowball(CamCoord worldX, CamCoord worldY, u8 dir)
{
    Task *t = TaskCreate(Task_PenMk1Snowball, sizeof(PenMk1Snowball), 0x3000, 0, NULL);
    PenMk1Snowball *proj = TASK_DATA(t);
    Sprite *s = &proj->s;
    u8 sp08;

    proj->unk4A = 0;

    if (dir != 0) {
        proj->qUnk30 = +Q(2);
    } else {
        proj->qUnk30 = -Q(2);
    }

    proj->qUnk32 = 0;
    proj->qUnk34 = 0;
    proj->qUnk38 = 0;
    proj->unk3C = worldX;
    proj->unk44 = worldY;

    proj->unk4B = 0;
    proj->unk48 = 800;

    // TODO: It doesn't make sense for proj->qUnk38 to be a Q() value, as result of sub_801F07C!
    proj->qUnk38 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

    // NOTE: x|y set to world- not screen-pos!
    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_PEN_MK1_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_PEN_PROJ_2; // main image
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

NONMATCH("asm/non_matching/game/sa1/stage/enemies/Pen__Task_PenMk1Snowball.inc", void Task_PenMk1Snowball(void))
{
    PenMk1Snowball *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    CamCoord oldWorldX, oldWorldY;
    s16 divRes;
    s32 res;
    u8 sp08;
    s32 divisor;

    if (proj->unk4B) {
        proj->qUnk32 += Q(60. / 256.);
    }

    proj->qUnk34 += proj->qUnk30;
    proj->qUnk38 += proj->qUnk32;

    // World pos
    s->x = proj->unk3C + I(proj->qUnk34);
    s->y = proj->unk44 + I(proj->qUnk38);

    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    divRes = Div(SIN(proj->unk4A * 4), 1000);

    // Check for slopes (pn the right?).
    if ((divRes < 0) && ((s32)(divRes + proj->qUnk30) > (u16)-2)) {
        proj->qUnk30 = -1; // TODO: Q = -1?
    } else {
        proj->qUnk30 += Div(SIN((proj->unk4A * 4) & ONE_CYCLE), 1000);
    }
    // _08074048

    proj->qUnk38 += Div(COS(proj->unk4A * 4), 1000);

    if (proj->unk48 != 0) {
        proj->unk48--;
    }
    // _0807407E

    if (Coll_Player_Projectile(s, oldWorldX, oldWorldY) || (proj->unk48 == 0)) {
        CreatePenMk1SnowballDebris(oldWorldX, oldWorldY);

        TaskDestroy(gCurTask);
        return;
    }
    // _080740B0

    // Screen pos
    s->x -= gCamera.x;
    s->y -= gCamera.y;

    res = SA2_LABEL(sub_801F07C)(oldWorldY, oldWorldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

    if (res > 0) {
        if (proj->unk4B == 0) {
            proj->qUnk32 = 0;
        }

        proj->unk4B = 1;
    } else {
        // _080740F8
        if (proj->unk4B != 0) {
            proj->unk4A = 0;

            if (proj->qUnk32 > Q(4)) {
                CreatePenMk1SnowballDebris(oldWorldX, oldWorldY);

                TaskDestroy(gCurTask);
                return;
            }
        }

        if (res < 0) {
            proj->unk4B = 0;
        }
    }
    // _08074120

    if (!proj->unk4B) {
        s8 rot;
        u8 urot;

        if (res < 0) {
            proj->qUnk38 += Q(res);
            proj->qUnk32 = 0;
        } else {
            // _08074138
            proj->qUnk32 += (res << 6);
        }
        // _08074144

        rot = urot = proj->unk4A - sp08;
        if (rot < 0)
            urot = ABS(rot);

        if ((s8)urot >= Q(0.25)) {
            CreatePenMk1SnowballDebris(oldWorldX, oldWorldY);

            TaskDestroy(gCurTask);
            return;
        }

        proj->unk4A = sp08;
    }
    // _08074174

    if (res >= -5 && res <= 0) {
        // TODO: Improve condition
        if ((u8)(sp08 + 63) <= 28) {
            CreatePenMk1SnowballDebris(oldWorldX, oldWorldY);

            TaskDestroy(gCurTask);
            return;
        }

        if ((u8)(sp08 + 93) <= 28) {
            CreatePenMk1SnowballDebris(oldWorldX, oldWorldY);

            TaskDestroy(gCurTask);
            return;
        }
    } else {
        // TODO:
        //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
        if ((((u16)(s->x + (120 / 2)) > DISPLAY_WIDTH + 120) || (s->y + (120 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 140))) {
            TaskDestroy(gCurTask);
            return;
        }
    }
    // _08074198

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void CreatePenMk1SnowballDebris(CamCoord worldX, CamCoord worldY)
{
    Task *t = TaskCreate(Task_SnowballDebris, sizeof(PenMk1Debris), 0x3000, 0, NULL);
    PenMk1Debris *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    proj->qUnk30 = -Q(1);
    proj->qUnk32 = -Q(3.75);
    proj->qUnk34 = 0;
    proj->qUnk38 = 0;
    proj->qWorldX = Q(worldX);
    proj->qUnk40 = proj->qWorldX;
    proj->qWorldY = Q(worldY);
    proj->unk4B = 0;

    proj->qUnk38 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, NULL, SA2_LABEL(sub_801EE64));

    // World pos
    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_PEN_MK1_PROJ3;
    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_PEN_PROJ_3; // debris
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_SnowballDebris(void)
{
    PenMk1Debris *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;

    // World pos
    proj->qWorldX += proj->qUnk30;
    proj->qUnk40 -= proj->qUnk30;
    s->x = I(proj->qWorldX);

    proj->qUnk32 += Q(60. / 256.);
    proj->qWorldY += proj->qUnk32;
    s->y = I(proj->qWorldY);

    // Screen pos
#ifndef NON_MATCHING
    {
        // This is so stupid... but it matches!
        u16 screenX = s->x;
        s->x = screenX - gCamera.x;
        s->y -= gCamera.y;
    }
#else
    s->x -= gCamera.x;
    s->y -= gCamera.y;
#endif

    if (s->y > DISPLAY_HEIGHT + 80) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->x = I(proj->qUnk40) - gCamera.x;
    DisplaySprite(s);
}