#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/entities_manager.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ u8 meData3;
} GamiGami;

typedef struct {
    Sprite s;
    s32 unk30;
    s32 unk34;
    s16 qUnk38;
} GamiGamiProjectile;

void Task_GamiGamiInit(void);
void Task_806C2A4(void);
void CreateGamiGamiProjectiles(CamCoord worldX, CamCoord worldY);
void Task_GamiGamiProjectile(void);

void CreateEntity_GamiGami(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_GamiGamiInit, sizeof(GamiGami), 0x2000, 0, TaskDestructor_EntityShared);
    GamiGami *gamigami = TASK_DATA(t);
    Sprite *s = &gamigami->shared.s;

    gamigami->shared.base.regionX = regionX;
    gamigami->shared.base.regionY = regionY;
    gamigami->shared.base.me = me;
    gamigami->shared.base.meX = me->x;
    gamigami->shared.base.id = id;

    gamigami->unk3C = -160;
    gamigami->unk40 = 0;
    gamigami->unk44 = 0;
    gamigami->unk46 = 0;
    gamigami->unk48 = 0;
    gamigami->meData3 = me->d.uData[3];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_GAMIGAMI);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_GAMIGAMI;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);

    if (I(gPlayer.qWorldX) >= TO_WORLD_POS(gamigami->shared.base.meX, gamigami->shared.base.regionX)) {
        gamigami->unk3C = 160;
        gamigami->unk48 |= 0x400;
    }
}

void Task_GamiGamiInit(void)
{
    GamiGami *gamigami = TASK_DATA(gCurTask);
    Sprite *s = &gamigami->shared.s;
    MapEntity *me = gamigami->shared.base.me;
    u8 sp08;
    s32 prevWorldX, prevWorldY, worldX, worldY;

    worldX = TO_WORLD_POS(gamigami->shared.base.meX, gamigami->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, gamigami->shared.base.regionY);

    prevWorldX = worldX;
    prevWorldY = worldY;
    gamigami->unk40 += gamigami->unk3C;
    worldX += Div(gamigami->unk40, 0x100);

    worldY -= 6;
    worldY += gamigami->unk44;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(prevWorldX, prevWorldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, gamigami->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (gamigami->meData3 != 0) {
        gamigami->unk44 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, 8, &sp08, SA2_LABEL(sub_801EE64));
    } else {
        gamigami->unk44 += SA2_LABEL(sub_801F07C)(worldY, worldX, 0, 8, &sp08, SA2_LABEL(sub_801EE64));
    }

    if (Div(gamigami->unk40, 0x100) <= me->d.sData[0] * TILE_WIDTH) {
        if (~gamigami->unk48 & 0x400) {
            gamigami->unk3C = 160;
            gamigami->unk46 = 0;
            gamigami->unk48 |= 0x400;
            s->variant = 1;
            gCurTask->main = Task_806C2A4;
        }
    } else if (Div(gamigami->unk40, 0x100) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        if (gamigami->unk48 & 0x400) {
            gamigami->unk3C = -160;
            gamigami->unk46 = 0;
            gamigami->unk48 &= ~0x400;
            s->variant = 1;
            gCurTask->main = Task_806C2A4;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_806C2A4(void)
{
    GamiGami *gamigami = TASK_DATA(gCurTask);
    Sprite *s = &gamigami->shared.s;
    MapEntity *me = gamigami->shared.base.me;
    u8 sp08;
    s32 prevWorldX, prevWorldY, worldX, worldY;

    worldX = TO_WORLD_POS(gamigami->shared.base.meX, gamigami->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, gamigami->shared.base.regionY);

    prevWorldX = worldX;
    prevWorldY = worldY;
    worldX += Div(gamigami->unk40, 0x100);

    worldY -= 6;
    worldY += gamigami->unk44;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (++gamigami->unk46 == 15) {
        CreateGamiGamiProjectiles(worldX, worldY - 20);
    }

    if (IS_OUT_OF_DISPLAY_RANGE(prevWorldX, prevWorldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, gamigami->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (gamigami->meData3 != 0) {
        gamigami->unk44 += SA2_LABEL(sub_801F07C)(worldY, worldX, 1, 8, &sp08, SA2_LABEL(sub_801EE64));
    } else {
        gamigami->unk44 += SA2_LABEL(sub_801F07C)(worldY, worldX, 0, 8, &sp08, SA2_LABEL(sub_801EE64));
    }

    if (gamigami->unk46 > 18) {
        s->variant = 0;
        gCurTask->main = Task_GamiGamiInit;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateGamiGamiProjectiles(CamCoord worldX, CamCoord worldY)
{
    s32 i;

    for (i = 0; i < 2; i++) {
        {
            Task *t = TaskCreate(Task_GamiGamiProjectile, sizeof(GamiGamiProjectile), 0x3000, 0, NULL);
            GamiGamiProjectile *proj = TASK_DATA(t);
            Sprite *s = &proj->s;
#ifndef NON_MATCHING
            s32 matchWorldX = worldX + 8;
#endif
            s32 maxX = +6;
            s32 minX = -6;

            proj->unk30 = worldX * 4;
            proj->qUnk38 = -Q(2);
            proj->unk34 = maxX;

            if (i != 0) {
                proj->unk34 = minX;
                proj->unk30 = (worldX - 14) * 4;

                s->x = worldX - 8;
            } else {
                // proj->unk34 = +6;
                proj->unk30 = (worldX + 14) * 4;

                s->x = worldX + 8;
            }

            s->y = worldY;

            s->graphics.dest = VRAM_RESERVED_EN_GAMIGAMI_PROJ;
            s->oamFlags = SPRITE_OAM_ORDER(9);
            s->graphics.size = 0;
            s->graphics.anim = SA1_ANIM_GAMIGAMI_PROJ;
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
}

// Almost copy-paste of Task_FireballSpark()
void Task_GamiGamiProjectile(void)
{
    GamiGamiProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s32 oldWorldX, oldWorldY;
    s16 screenX, screenY;
    s32 worldX;

    proj->unk30 += proj->unk34;

    s->x = proj->unk30 >> 2;

    proj->qUnk38 += Q(40. / 256.);
    s->y += I(proj->qUnk38);
    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

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
