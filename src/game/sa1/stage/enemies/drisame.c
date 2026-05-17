#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Sprite s2;
    /* 0x60 */ Sprite s3;
    /* 0x90 */ s16 unk90;
    /* 0x92 */ s16 unk92;
    /* 0x94 */ s16 unk94[4];
    /* 0x9C */ s16 unk9C[4];
    /* 0xA4 */ s16 unkA4[4];
    /* 0xAC */ s16 unkAC[4];
    /* 0xB4 */ s16 qUnkB4[4];
    /* 0xBC */ s8 unkBC;
    /* 0xBD */ bool8 shattered;
} IceBlock;

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3c */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ s32 worldX;
    /* 0x50 */ s32 worldY;
    /* 0x54 */ Task *iceBlock; // -> IceBlock *
} Drisame; /* 0x58 */

void Task_DrisameInit(void);
void sub_8072E68(void);
Task *CreateIceBlock(s16 worldX, s16 worldY);
void Task_IceBlockInit(void);
void Task_IceBlock_8073364(void);
void TaskDestructor_IceBlock(Task *t);

void CreateEntity_Drisame(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_DrisameInit, sizeof(Drisame), 0x2000, 0, TaskDestructor_EntityShared);
    Drisame *drisame = TASK_DATA(t);
    Sprite *s = &drisame->shared.s;

    drisame->shared.base.regionX = regionX;
    drisame->shared.base.regionY = regionY;
    drisame->shared.base.me = me;
    drisame->shared.base.meX = me->x;
    drisame->shared.base.id = id;

    drisame->unk44 = 0;
    drisame->unk48 = 0;
    drisame->unk3C = 0;
    drisame->unk40 = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_DRISAME);
    s->oamFlags = SPRITE_OAM_ORDER(11);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_DRISAME;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    UpdateSpriteAnimation(s);

    drisame->iceBlock = CreateIceBlock(s->x, s->y);
}

// (91.58%) https://decomp.me/scratch/5vT74
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Drisame__Task_DrisameInit.inc", void Task_DrisameInit(void))
{
    Drisame *drisame = TASK_DATA(gCurTask);
    Sprite *s = &drisame->shared.s;
    MapEntity *me = drisame->shared.base.me;
    IceBlock *iceBlock;
    s16 worldX, worldY;
    s32 worldX2, worldY2;
    s16 res;
    s32 some, someX, someY;

    worldX = TO_WORLD_POS(drisame->shared.base.meX, drisame->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, drisame->shared.base.regionY);

    drisame->worldX = worldX2 = worldX;
    drisame->worldY = worldY2 = worldY;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, drisame->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    res = CLAMP_SIN_PERIOD(SA2_LABEL(sub_8004418)(I(gPlayer.qWorldY) - worldY, I(gPlayer.qWorldX) - worldX));

    if (res >= 385 && res < 640) {
        some = I(gPlayer.qWorldY) - worldY;
        someY = some * some;
        some = I(gPlayer.qWorldX) - worldX;
        someX = some * some;
        someY += someX;

        if (someY < SQUARE(80)) {
            IceBlock *iceBlock = TASK_DATA(drisame->iceBlock);
            iceBlock->shattered = TRUE;

            SPRITE_FLAG_CLEAR(s, X_FLIP);

            if (Div(COS(res), 35) < 0) {
                drisame->unk3C = +Div(COS(res), 35);
            } else {
                drisame->unk3C = -Div(COS(res), 35);
            }
            drisame->unk40 = +Div(SIN(res), 35);
            drisame->unk44 = 0;
            drisame->unk48 = 0;
            gCurTask->main = sub_8072E68;
        }
    }
    // 1aa

    if (res < 128 || res > 896) {
        some = I(gPlayer.qWorldY) - worldY;
        someY = some * some;
        some = I(gPlayer.qWorldX) - worldX;
        someX = some * some;
        someY += someX;

        if (someY < SQUARE(80)) {
            IceBlock *iceBlock = TASK_DATA(drisame->iceBlock);
            iceBlock->shattered = TRUE;

            SPRITE_FLAG_SET(s, X_FLIP);

            drisame->unk3C = +Div(COS(res), 35);
            drisame->unk40 = +Div(SIN(res), 35);
            drisame->unk44 = 0;
            drisame->unk48 = 0;
            gCurTask->main = sub_8072E68;
        }
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
END_NONMATCH

void sub_8072E68(void)
{
    Drisame *drisame = TASK_DATA(gCurTask);
    Sprite *s = &drisame->shared.s;
    MapEntity *me = drisame->shared.base.me;
    IceBlock *iceBlock;
    s16 worldX, worldY;
    s32 worldX2, worldY2;
    s16 res;
    s32 some, someX, someY;

    drisame->unk44 += drisame->unk3C;
    drisame->unk48 += drisame->unk40;

    worldX = TO_WORLD_POS(drisame->shared.base.meX, drisame->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, drisame->shared.base.regionY);

    worldX += I(drisame->unk44);
    worldY += I(drisame->unk48);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

#ifndef BUG_FIX
    // The buggy version uses drisame->worldX for both macro params, not X and Y!
    if (IS_OUT_OF_DISPLAY_RANGE(drisame->worldX, drisame->worldX) && IS_OUT_OF_CAM_RANGE(s->x, s->y))
#else
    if (IS_OUT_OF_DISPLAY_RANGE(drisame->worldX, drisame->worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y))
#endif
    {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, drisame->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

Task *CreateIceBlock(s16 worldX, s16 worldY)
{
    s8 arr[4][2] = { { 16, 0 }, { 0, 8 }, { -16, 0 }, { 0, -8 } }; // maybe u8[4][2]?
    Task *t;
    Sprite *s;
    Sprite *s2;
    Sprite *s3;
    IceBlock *iceBlock;
    u8 i;
    t = TaskCreate(Task_IceBlockInit, sizeof(IceBlock), 0x3000, 0, TaskDestructor_IceBlock);
    iceBlock = TASK_DATA(t);
    s = &iceBlock->s;
    s2 = &iceBlock->s2;
    s3 = &iceBlock->s3;

    iceBlock->unk90 = worldX;
    iceBlock->unk92 = worldY;

    iceBlock->unkBC = 0;
    iceBlock->shattered = FALSE;

    // TODO: This array limit is weird.
    for (i = 0; i < (s32)(ARRAY_COUNT(iceBlock->unkAC) / 2); i++) {
        iceBlock->qUnkB4[i] = -Q(1);

        if ((i % 2u) != 0) {
            iceBlock->unkAC[i] = -2;
        } else {
            iceBlock->unkAC[i] = +3;
        }

        iceBlock->unkA4[i] = (worldX + arr[i][0]) * 4;
        iceBlock->unk94[i] = worldX + arr[i][0];
        iceBlock->unk9C[i] = worldY + arr[i][1];
    }

    for (; i < ARRAY_COUNT(arr); i++) {
        iceBlock->qUnkB4[i] = -Q(1.3125);

        if ((i % 2u) != 0) {
            iceBlock->unkAC[i] = +2;
        } else {
            iceBlock->unkAC[i] = -3;
        }

        iceBlock->unkA4[i] = (worldX + arr[i][0]) * 4;
        iceBlock->unk94[i] = worldX + arr[i][0];
        iceBlock->unk9C[i] = worldY + arr[i][1];
    }

    s->y = worldY;
    s->x = worldX;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_DRISAME_ICEBLOCK_DEBRIS_LARGE);
    s->oamFlags = SPRITE_OAM_ORDER(10);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_DRISAME_ICEBLOCK_DEBRIS_LARGE;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    s2->y = worldY;
    s2->x = worldX;
    s2->graphics.dest = ALLOC_TILES(SA1_ANIM_DRISAME_ICEBLOCK_DEBRIS_SMALL);
    s2->oamFlags = SPRITE_OAM_ORDER(10);
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_DRISAME_ICEBLOCK_DEBRIS_SMALL;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    s3->y = worldY;
    s3->x = worldX;
    s3->graphics.dest = ALLOC_TILES(SA1_ANIM_DRISAME_ICEBLOCK);
    s3->oamFlags = SPRITE_OAM_ORDER(10);
    s3->graphics.size = 0;
    s3->graphics.anim = SA1_ANIM_DRISAME_ICEBLOCK;
    s3->variant = 0;
    s3->animCursor = 0;
    s3->qAnimDelay = Q(0);
    s3->prevVariant = -1;
    s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s3->palId = 0;
    s3->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s3->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    return t;
}

void Task_IceBlockInit(void)
{
    Task *t;
    Sprite *s3;
    IceBlock *iceBlock;
    CamCoord screenX, screenY;
    u8 i;
    iceBlock = TASK_DATA(gCurTask);
    s3 = &iceBlock->s3;

    screenX = iceBlock->unk90;
    screenY = iceBlock->unk92;

    s3->x = iceBlock->unk90 - gCamera.x;
    s3->y = iceBlock->unk92 - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(screenX, screenY) && IS_OUT_OF_CAM_RANGE(s3->x, s3->y)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (iceBlock->shattered) {
        gCurTask->main = Task_IceBlock_8073364;
    }

    UpdateSpriteAnimation(s3);

    s3->x = screenX - gCamera.x;
    s3->y = screenY - gCamera.y;

    DisplaySprite(s3);
}

void Task_IceBlock_8073364(void)
{
    IceBlock *iceBlock;
    Task *t;
    Sprite *s;
    Sprite *s2;
    CamCoord worldX, worldY;
    s32 r0;
    u8 i;

    iceBlock = TASK_DATA(gCurTask);
    s = &iceBlock->s;
    s2 = &iceBlock->s2;

    if (++iceBlock->unkBC >= 30) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    UpdateSpriteAnimation(s2);

    if (iceBlock->unkBC & 0x2) {
        for (i = 0; i < 4; i++) {
            if (i & 0x1) {
                iceBlock->unkA4[i] += iceBlock->unkAC[i];
                iceBlock->unk94[i] = iceBlock->unkA4[i] / 4;
                iceBlock->qUnkB4[i] += Q(20. / 256.);
                iceBlock->unk9C[i] += I(iceBlock->qUnkB4[i]);
                s->x = iceBlock->unk94[i] - gCamera.x;
                s->y = iceBlock->unk9C[i] - gCamera.y;

                DisplaySprite(s);
            } else {
                iceBlock->unkA4[i] += iceBlock->unkAC[i];
                iceBlock->unk94[i] = iceBlock->unkA4[i] / 4;
                iceBlock->qUnkB4[i] += Q(20. / 256.);
                iceBlock->unk9C[i] += I(iceBlock->qUnkB4[i]);
                s2->x = iceBlock->unk94[i] - gCamera.x;
                s2->y = iceBlock->unk9C[i] - gCamera.y;

                DisplaySprite(s2);
            }
        }
    }
}

void TaskDestructor_IceBlock(Task *t)
{
    IceBlock *iceBlock = TASK_DATA(t);
    VramFree(iceBlock->s.graphics.dest);
    VramFree(iceBlock->s2.graphics.dest);
    VramFree(iceBlock->s3.graphics.dest);
}
