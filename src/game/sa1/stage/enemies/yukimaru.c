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

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s16 unk30;
    /* 0x30 */ s16 qUnk32;
    /* 0x30 */ s16 qUnk34;
} Snowball;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ SpriteBase base2;
    /* 0x48 */ Sprite s2;
    /* 0x78 */ s16 qUnk78;
    /* 0x7A */ s16 qUnk7A;
    /* 0x7C */ s16 qUnk7C;
    /* 0x7E */ s16 qUnk7E;
    /* 0x80 */ s16 unk80;
    /* 0x82 */ u8 data0;
} Yukimaru;

void Task_YukimaruGroundInit(void);
void Task_8071BFC(void);
void TaskDestructor_YukimaruGround(Task *t);
void CreateSnowball(s16, s16);
void CreateSnowball2(s16, s16, u8);
void Task_Snowball(void);
void sub_80723C0(void);
void sub_80727B4(void);
void Task_Snowball2(void);

void Task_YukimaruWallInit(void);
void Task_YukimaruWallInit2(void);
void TaskDestructor_YukimaruWall(Task *t);

void CreateEntity_Yukimaru(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_YukimaruGroundInit, sizeof(Yukimaru), 0x2000, 0, TaskDestructor_YukimaruGround);
    Yukimaru *yukimaru = TASK_DATA(t);
    Sprite *s = &yukimaru->s;

    yukimaru->base.regionX = regionX;
    yukimaru->base.regionY = regionY;
    yukimaru->base.me = me;
    yukimaru->base.meX = me->x;
    yukimaru->base.id = id;

    yukimaru->qUnk78 = -Q(0.625);
    yukimaru->qUnk7A = +Q(0);
    yukimaru->qUnk7C = +Q(0);
    yukimaru->qUnk7E = +Q(0);
    yukimaru->unk80 = +Q(0);

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_YUKIMARU);
    s->oamFlags = SPRITE_OAM_ORDER(0);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_YUKIMARU;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);

    s = &yukimaru->s2;
    yukimaru->base2.regionX = regionX;
    yukimaru->base2.regionY = regionY;
    yukimaru->base2.me = me;
    yukimaru->base2.meX = me->x;
    yukimaru->base2.id = id;

    yukimaru->qUnk78 = -Q(0.625);
    yukimaru->qUnk7A = +Q(0);
    yukimaru->qUnk7C = +Q(0);
    yukimaru->qUnk7E = +Q(0);

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_YUKIMARU);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_YUKIMARU;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

NONMATCH("asm/non_matching/game/sa1/stage/enemies/Yukimaru__YukimaruGroundInit.inc", void Task_YukimaruGroundInit(void))
{
    Yukimaru *yukimaru = TASK_DATA(gCurTask);
    Sprite *s = &yukimaru->s;
    Sprite *s2 = &yukimaru->s2;
    MapEntity *me = yukimaru->base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaX, deltaY;

    worldX = TO_WORLD_POS(yukimaru->base.meX, yukimaru->base.regionX);
    worldY = TO_WORLD_POS(me->y, yukimaru->base.regionY);

    yukimaru->qUnk7A += yukimaru->qUnk78;

    deltaX = worldX + I(yukimaru->qUnk7A);
    deltaY = worldY - 6;
    deltaY += +yukimaru->qUnk7C;

    worldX2 = worldX;
    worldY2 = worldY;

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    s2->x = deltaX - gCamera.x;
    s2->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yukimaru->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    yukimaru->qUnk7C += SA2_LABEL(sub_801F07C)(deltaY, deltaX, 1, +8, NULL, SA2_LABEL(sub_801EE64));

    if (I(yukimaru->qUnk7A) <= (me->d.sData[0]) * TILE_WIDTH) {
        yukimaru->qUnk78 = +Q(0.625);
    } else if (I(yukimaru->qUnk7A) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        yukimaru->qUnk78 = -Q(0.625);
    } else if (yukimaru->unk80 != 0) {
        yukimaru->unk80--;
    } else {
        if ((I(gPlayer.qWorldY) <= deltaY) && (I(gPlayer.qWorldX) <= deltaX + 8) && (deltaX - 8 <= I(gPlayer.qWorldX))) {
            yukimaru->unk80 = 60;
            yukimaru->qUnk7E = Q(0);
            s->variant = 0;
            s2->variant = 0;
            gCurTask->main = Task_8071BFC;
        }
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s2, X_FLIP);
    DisplaySprite(s2);
    SPRITE_FLAG_CLEAR(s2, X_FLIP);
}
END_NONMATCH

void Task_8071BFC(void)
{
    Yukimaru *yukimaru = TASK_DATA(gCurTask);
    Sprite *s = &yukimaru->s;
    Sprite *s2 = &yukimaru->s2;
    MapEntity *me = yukimaru->base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaX, deltaY;
    u8 sp08;

    worldX = TO_WORLD_POS(yukimaru->base.meX, yukimaru->base.regionX);
    worldY = TO_WORLD_POS(me->y, yukimaru->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    deltaX = worldX + I(yukimaru->qUnk7A);
    deltaY = worldY - 6;
    deltaY += +yukimaru->qUnk7C;

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    s2->x = deltaX - gCamera.x;
    s2->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yukimaru->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    yukimaru->qUnk7C += SA2_LABEL(sub_801F07C)(deltaY, deltaX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

    yukimaru->qUnk7E++;

    if (yukimaru->qUnk7E == 4) {
        CreateSnowball(deltaX, deltaY - 18);
    }

    if (yukimaru->qUnk7E == 13) {
        s->variant = 1;
        s2->variant = 1;
        gCurTask->main = Task_YukimaruGroundInit;
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s2, X_FLIP);
    DisplaySprite(s2);
    SPRITE_FLAG_CLEAR(s2, X_FLIP);
}

void CreateSnowball(s16 worldX, s16 worldY)
{
    Task *t = TaskCreate(Task_Snowball, sizeof(Snowball), 0x3000, 0, NULL);
    Snowball *snowball = TASK_DATA(t);
    Sprite *s = &snowball->s;
    s32 speed = worldX * 4;

    snowball->qUnk34 = -Q(5);
    snowball->qUnk32 = +Q(0);
    snowball->unk30 = speed;

    s->x = worldX - 8;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_YUKIMARU_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(1);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_PEN_PROJ_1;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 0);

    UpdateSpriteAnimation(s);
}

void Task_Snowball(void)
{
    Snowball *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 oldWorldX, oldWorldY, oldWorldY32;
    s16 screenX, screenY;
    s32 worldX;

    worldX = proj->unk30;
    if (worldX < 0) {
        worldX += 3;
    }

    s->x = worldX >> 2;

    proj->qUnk34 += Q(40. / 256.);
    s->y += I(proj->qUnk34);
    oldWorldX = s->x;
    oldWorldY32 = s->y;

    Coll_Player_Projectile(s, s->x, oldWorldY32);

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (40 / 2)) > DISPLAY_WIDTH + 36) || (s->y + (40 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 80))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->x = oldWorldX;
    s->y = oldWorldY32;
}

void TaskDestructor_YukimaruGround(Task *t)
{
    Yukimaru *yukimaru = TASK_DATA(t);
    VramFree(yukimaru->s.graphics.dest);
    VramFree(yukimaru->s2.graphics.dest);
}

void CreateEntity_Yukimaru_Wall(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;

    if (me->d.sData[0] != 0) {
        t = TaskCreate(Task_YukimaruWallInit, sizeof(Yukimaru), 0x2000, 0, TaskDestructor_YukimaruWall);
    } else {
        t = TaskCreate(Task_YukimaruWallInit2, sizeof(Yukimaru), 0x2000, 0, TaskDestructor_YukimaruWall);
    }
    {
        Yukimaru *yukimaru = TASK_DATA(t);
        Sprite *s = &yukimaru->s;

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_YUKIMARU);
        yukimaru->base.regionX = regionX;
        yukimaru->base.regionY = regionY;
        yukimaru->base.me = me;
        yukimaru->base.meX = me->x;
        yukimaru->base.id = id;

        yukimaru->qUnk78 = -Q(0.625);
        yukimaru->qUnk7A = +Q(0);
        yukimaru->qUnk7C = +Q(0);
        yukimaru->qUnk7E = +Q(0);
        yukimaru->unk80 = +Q(0);
        yukimaru->data0 = me->d.sData[0];

        // NOTE: x|y set to world- not screen-pos!
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_YUKIMARU_SIDEWAYS;
        s->variant = 1;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        UpdateSpriteAnimation(s);

        if (me->d.sData[0] != 1) {
            SPRITE_FLAG_SET(s, X_FLIP);
        }

        s = &yukimaru->s2;
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_YUKIMARU_SIDEWAYS);
        yukimaru->base2.regionX = regionX;
        yukimaru->base2.regionY = regionY;
        yukimaru->base2.me = me;
        yukimaru->base2.meX = me->x;
        yukimaru->base2.id = id;

        yukimaru->qUnk78 = -Q(0.625);
        yukimaru->qUnk7A = +Q(0);
        yukimaru->qUnk7C = +Q(0);
        yukimaru->qUnk7E = +Q(0);

        // NOTE: x|y set to world- not screen-pos!
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->oamFlags = SPRITE_OAM_ORDER(0);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_YUKIMARU_SIDEWAYS;
        s->variant = 1;
        s->animCursor = 0;
        s->qAnimDelay = Q(0);
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

        if (me->d.sData[0] != 1) {
            SPRITE_FLAG_SET(s, X_FLIP);
        }

        UpdateSpriteAnimation(s);
    }
}

void Task_YukimaruWallInit(void)
{
    Yukimaru *yukimaru = TASK_DATA(gCurTask);
    Sprite *s = &yukimaru->s;
    Sprite *s2 = &yukimaru->s2;
    MapEntity *me = yukimaru->base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaX, deltaY;

    worldX = TO_WORLD_POS(yukimaru->base.meX, yukimaru->base.regionX);
    worldY = TO_WORLD_POS(me->y, yukimaru->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    yukimaru->qUnk7C += yukimaru->qUnk78;

    deltaY = worldY + I(yukimaru->qUnk7C);
    deltaX = worldX + yukimaru->qUnk7A;

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    s2->x = deltaX - gCamera.x;
    s2->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yukimaru->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    yukimaru->qUnk7A += SA2_LABEL(sub_801F07C)(deltaX, deltaY, 1, +8, NULL, SA2_LABEL(sub_801ED24));

    if (I(yukimaru->qUnk7C) <= (me->d.sData[1]) * TILE_WIDTH) {
        yukimaru->qUnk78 = +Q(0.625);
    } else if (I(yukimaru->qUnk7C) >= (me->d.sData[1] + me->d.uData[3]) * TILE_WIDTH) {
        yukimaru->qUnk78 = -Q(0.625);
    } else if (yukimaru->unk80 != 0) {
        yukimaru->unk80--;
    } else {
        if ((I(gPlayer.qWorldX) <= deltaX) && (I(gPlayer.qWorldY) <= deltaY + 8) && (deltaY - 8 <= I(gPlayer.qWorldY))) {
            yukimaru->unk80 = 60;
            yukimaru->qUnk7E = Q(0);
            s->variant = 0;
            s2->variant = 0;
            gCurTask->main = sub_80723C0;
        }
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s2, Y_FLIP);
    DisplaySprite(s2);
    SPRITE_FLAG_CLEAR(s2, Y_FLIP);
}

void sub_80723C0(void)
{
    Yukimaru *yukimaru = TASK_DATA(gCurTask);
    Sprite *s = &yukimaru->s;
    Sprite *s2 = &yukimaru->s2;
    MapEntity *me = yukimaru->base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaX, deltaY;
    u8 sp08;

    worldX = TO_WORLD_POS(yukimaru->base.meX, yukimaru->base.regionX);
    worldY = TO_WORLD_POS(me->y, yukimaru->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    deltaX = worldX + yukimaru->qUnk7A;
    deltaY = worldY + I(yukimaru->qUnk7C);

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    s2->x = deltaX - gCamera.x;
    s2->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yukimaru->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    yukimaru->qUnk7E++;

    if (yukimaru->qUnk7E == 4) {
        CreateSnowball2(deltaX - 10, deltaY, 0);
    }

    if (yukimaru->qUnk7E == 18) {
        s->variant = 1;
        s2->variant = 1;
        gCurTask->main = Task_YukimaruWallInit;
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s2, Y_FLIP);
    DisplaySprite(s2);
    SPRITE_FLAG_CLEAR(s2, Y_FLIP);
}

void Task_YukimaruWallInit2(void)
{
    Yukimaru *yukimaru = TASK_DATA(gCurTask);
    Sprite *s = &yukimaru->s;
    Sprite *s2 = &yukimaru->s2;
    MapEntity *me = yukimaru->base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaX, deltaY;

    worldX = TO_WORLD_POS(yukimaru->base.meX, yukimaru->base.regionX);
    worldY = TO_WORLD_POS(me->y, yukimaru->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    yukimaru->qUnk7C += yukimaru->qUnk78;

    deltaY = worldY + I(yukimaru->qUnk7C);
    deltaX = worldX + yukimaru->qUnk7A;

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    s2->x = deltaX - gCamera.x;
    s2->y = deltaY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yukimaru->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    yukimaru->qUnk7A -= SA2_LABEL(sub_801F07C)(deltaX, deltaY, 1, -8, NULL, SA2_LABEL(sub_801ED24));

    if (I(yukimaru->qUnk7C) <= (me->d.sData[1]) * TILE_WIDTH) {
        yukimaru->qUnk78 = +Q(0.625);
    } else if (I(yukimaru->qUnk7C) >= (me->d.sData[1] + me->d.uData[3]) * TILE_WIDTH) {
        yukimaru->qUnk78 = -Q(0.625);
    } else if (yukimaru->unk80 != 0) {
        yukimaru->unk80--;
    } else {
        if ((I(gPlayer.qWorldX) >= deltaX) && (I(gPlayer.qWorldY) <= deltaY + 8) && (deltaY - 8 <= I(gPlayer.qWorldY))) {
            yukimaru->unk80 = 60;
            yukimaru->qUnk7E = Q(0);
            s->variant = 0;
            s2->variant = 0;
            gCurTask->main = sub_80727B4;
        }
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s2, Y_FLIP);
    DisplaySprite(s2);
    SPRITE_FLAG_CLEAR(s2, Y_FLIP);
}

void sub_80727B4(void)
{
    Yukimaru *yukimaru = TASK_DATA(gCurTask);
    Sprite *s = &yukimaru->s;
    Sprite *s2 = &yukimaru->s2;
    MapEntity *me = yukimaru->base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    CamCoord deltaY, deltaX;
    u8 sp08;

    worldX = TO_WORLD_POS(yukimaru->base.meX, yukimaru->base.regionX);
    worldY = TO_WORLD_POS(me->y, yukimaru->base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    deltaX = worldX + yukimaru->qUnk7A;
    deltaY = worldY + I(yukimaru->qUnk7C);

    s->x = deltaX - gCamera.x;
    s->y = deltaY - gCamera.y;

    s2->x = deltaX - gCamera.x;
    s2->y = deltaY - gCamera.y;

    yukimaru->qUnk7E++;

    if (yukimaru->qUnk7E == 4) {
        CreateSnowball2(deltaX + 10, deltaY, 1);
    }

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, yukimaru->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, deltaX, deltaY)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (yukimaru->qUnk7E == 18) {
        s->variant = 1;
        s2->variant = 1;
        gCurTask->main = Task_YukimaruWallInit2;
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);
    DisplaySprite(s);
    SPRITE_FLAG_SET(s2, Y_FLIP);
    DisplaySprite(s2);
    SPRITE_FLAG_CLEAR(s2, Y_FLIP);
}

void CreateSnowball2(s16 worldX, s16 worldY, u8 param2)
{
    Task *t = TaskCreate(Task_Snowball2, sizeof(Snowball), 0x3000, 0, NULL);
    Snowball *snowball = TASK_DATA(t);
    Sprite *s = &snowball->s;

    snowball->qUnk34 = 0;

    if (param2) {
        snowball->qUnk32 = -3;
    } else {
        snowball->qUnk32 = +3;
    }

    snowball->unk30 = worldX * 4;

    s->x = worldX - 8;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_YUKIMARU_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(1);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_PEN_PROJ_1;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 0);

    UpdateSpriteAnimation(s);
}

void Task_Snowball2(void)
{
    Snowball *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s16 oldWorldX, oldWorldY;
    s16 screenX, screenY;
    s32 worldX;

    s->x -= proj->qUnk32;

    proj->qUnk34 += Q(23. / 256.);
    s->y += I(proj->qUnk34);

    oldWorldX = s->x;
    oldWorldY = s->y;

    Coll_Player_Projectile(s, oldWorldX, oldWorldY);

    // WorldPos -> ScreenPos
    proj->s.x -= gCamera.x;
    proj->s.y -= gCamera.y;

    // TODO:
    //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
    if ((((u16)(s->x + (40 / 2)) > DISPLAY_WIDTH + 36) || (s->y + (40 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 80))) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->x = oldWorldX;
    s->y = oldWorldY;
}

void TaskDestructor_YukimaruWall(Task *t)
{
    Yukimaru *yukimaru = TASK_DATA(t);
    VramFree(yukimaru->s.graphics.dest);
    VramFree(yukimaru->s2.graphics.dest);
}