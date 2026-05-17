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
    /* 0x32 */ u16 unk32;
    /* 0x34 */ s32 qUnk34[6];
    /* 0x4C */ s16 qUnk4C[6];
    /* 0x58 */ s16 unk58[6];
    /* 0x64 */ s16 unk64[6];
    /* 0x70 */ s32 unk70[6];
    /* 0x88 */ u8 unk88[6];
} SlotProjectile;

typedef struct {
    // NOTE: EntityShared HAS to be the first element,
    //       as long as TaskDestructor_EntityShared is used.
    /* 0x00 */ EntityShared shared;
    /* 0x3C */ s16 qUnk3C;
    /* 0x3E */ s16 qUnk3E;
    /* 0x40 */ s16 unk40;
    /* 0x42 */ s16 unk42;
    /* 0x44 */ u16 unk44;
    /* 0x46 */ s16 unk46;
} Slot;

void Task_SlotInit(void);
void sub_806E374(void);
void CreateSlotProjectile(s16 worldX, s16 worldY);
void Task_SlotProjectileMain(void);
void sub_806E7E0(void);

void CreateEntity_Slot(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) || (LOADED_SAVE->difficultyLevel == DIFFICULTY_NORMAL)) {
        Task *t = TaskCreate(Task_SlotInit, sizeof(Slot), 0x2000, 0, TaskDestructor_EntityShared);
        Slot *slot = TASK_DATA(t);
        Sprite *s = &slot->shared.s;

        slot->shared.base.regionX = regionX;
        slot->shared.base.regionY = regionY;
        slot->shared.base.me = me;
        slot->shared.base.meX = me->x;
        slot->shared.base.id = id;

        slot->qUnk3E = -Q(0.625);
        slot->qUnk3C = Q(0);
        slot->unk44 = 0;
        slot->unk40 = 0;
        slot->unk42 = 0;
        slot->unk46 = 0;

        // NOTE: x|y set to world- not screen-pos!
        s->x = TO_WORLD_POS(me->x, regionX);
        s->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SLOT);
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_SLOT;
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

void Task_SlotInit(void)
{
    Slot *slot = TASK_DATA(gCurTask);
    Sprite *s = &slot->shared.s;
    MapEntity *me = slot->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(slot->shared.base.meX, slot->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, slot->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    slot->unk46 = ((slot->unk46 + 1) & 0x1F);
    slot->unk44 = Div(SIN(slot->unk46 * 16), 800);
    slot->qUnk3C += slot->qUnk3E;

    worldX = worldX2 + I(slot->qUnk3C);
    worldY = worldY2 - slot->unk44;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, slot->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (I(slot->qUnk3C) <= (me->d.sData[0]) * TILE_WIDTH) {
        slot->qUnk3E = +Q(0.625);
    } else if (I(slot->qUnk3C) >= (me->d.sData[0] + me->d.uData[2]) * TILE_WIDTH) {
        slot->qUnk3E = -Q(0.625);
    } else if (slot->unk42 != 0) {
        slot->unk42--;
    } else {
        if ((I(gPlayer.qWorldX) <= worldX + 16) && (I(gPlayer.qWorldX) >= worldX - 16)) {
            slot->unk42 = 100;
            s->variant = 1;

            CreateSlotProjectile(worldX, worldY - 6);
            gCurTask->main = sub_806E374;
        }
    }

    UpdateSpriteAnimation(s);

    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

void sub_806E374(void)
{
    Slot *slot = TASK_DATA(gCurTask);
    Sprite *s = &slot->shared.s;
    MapEntity *me = slot->shared.base.me;
    CamCoord worldX, worldY;
    s32 worldX2, worldY2;
    s16 offsetWorldX;

    worldX = TO_WORLD_POS(slot->shared.base.meX, slot->shared.base.regionX);
    worldY = TO_WORLD_POS(me->y, slot->shared.base.regionY);

    worldX2 = worldX;
    worldY2 = worldY;

    worldX = worldX2 + I(slot->qUnk3C);
    worldY = worldY2 - slot->unk44;

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX2, worldY2) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, slot->shared.base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Coll_Player_Enemy_Attack(s, worldX, worldY)) {
        // Enemy defeated
        TaskDestroy(gCurTask);
        return;
    }

    if (++slot->unk40 > 19) {
        slot->unk40 = 0;
        s->variant = 0;
        gCurTask->main = Task_SlotInit;
    }

    UpdateSpriteAnimation(s);

    DisplaySprite(s);
    SPRITE_FLAG_SET(s, X_FLIP);
    DisplaySprite(s);
    SPRITE_FLAG_CLEAR(s, X_FLIP);
}

void CreateSlotProjectile(s16 worldX, s16 worldY)
{
    Task *t = TaskCreate(Task_SlotProjectileMain, sizeof(SlotProjectile), 0x3000, 0, NULL);
    SlotProjectile *proj = TASK_DATA(t);
    Sprite *s = &proj->s;

    proj->qUnk34[0] = Q(worldX);
    proj->qUnk4C[0] = 0;

    // NOTE: x|y set to world- not screen-pos!
    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = VRAM_RESERVED_EN_SLOT_PROJ;
    s->oamFlags = SPRITE_OAM_ORDER(9);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SLOT_PROJ;
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

// Stack allocs
// (99.88%) https://decomp.me/scratch/GHyrC
NONMATCH("asm/non_matching/game/sa1/stage/enemies/Slot__Task_SlotProjectileMain.inc", void Task_SlotProjectileMain(void))
{
    SlotProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    CamCoord oldWorldX, oldWorldY;
    u8 sp08;
    s32 sb;
    u32 v;
    bool32 playerWasHit;
    u8 i; // r7

    s->x = Div(proj->qUnk34[0], 0x100);
    proj->qUnk4C[0] += Q(40. / 256.);
    s->y += I(proj->qUnk4C[0]);
    oldWorldX = proj->s.x;
    oldWorldY = proj->s.y;

    v = Coll_Player_Projectile(s, oldWorldX, oldWorldY);
    playerWasHit = (-v | v) >> 31; // TODO: work this out!

    // WorldPos -> ScreenPos
    s->x -= gCamera.x;
    s->y -= gCamera.y;

    if ((((u16)(s->x + (40 / 2)) > DISPLAY_WIDTH + 36) || (s->y + (40 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 80))) {
        TaskDestroy(gCurTask);
        return;
    }

    sb = SA2_LABEL(sub_801F07C)(oldWorldY, oldWorldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

    if (sb <= 0 || playerWasHit) {
        s32 unk34;
        s16 qUnk4C;
        if (playerWasHit) {
            sp08 = 0;
        }

        qUnk4C = proj->qUnk4C[0];

        unk34 = proj->qUnk34[0];
        proj->unk30 = 45;

        for (i = 0; i < 6; i++) {
            s32 r4 = qUnk4C * 10; // ???
            s32 modRes = Mod(PseudoRandom32(), 4) + 0x10;
            s32 r0 = Div(-r4, modRes);

            proj->qUnk4C[i] = (r0 * SIN(((sp08 * 4) & 0x7F) + 0x100)) / 20000;
            proj->unk58[i] = oldWorldX;
            proj->unk64[i] = oldWorldY + sb;
            proj->qUnk34[i] = unk34;
            proj->unk70[i] = Div(SIN(((sp08 - 24 + i * 8) * 4) & ONE_CYCLE), 30);
            proj->unk88[i] = 1;
        }

        s->prevVariant = -1;
        s->graphics.dest = VRAM_RESERVED_EN_SLOT_PROJ2;
        s->graphics.anim = SA1_ANIM_YUKIMARU_PROJ;
        s->variant = 0;
        gCurTask->main = sub_806E7E0;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);

    s->x = oldWorldX;
    s->y = oldWorldY;
}
END_NONMATCH

void sub_806E7E0()
{
    SlotProjectile *proj = TASK_DATA(gCurTask);
    Sprite *s = &proj->s;
    s32 res;
    u8 sp08;
    u8 i;

    UpdateSpriteAnimation(s);

    if (--proj->unk30 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    for (i = 0; i < 6; i++) {
        if (proj->unk88[i] != 0) {
            CamCoord worldX, worldY;

            proj->qUnk4C[i] = Div(proj->qUnk4C[i] * 1000, 1045 - proj->unk30);
            proj->qUnk34[i] += proj->unk70[i];
            proj->unk58[i] = I(proj->qUnk34[i]);
            proj->qUnk4C[i] += Q(40. / 256.);
            proj->unk64[i] += I(proj->qUnk4C[i]);

            // World pos
            s->x = proj->unk58[i]; // r8
            s->y = proj->unk64[i]; // sp0C

            worldX = s->x;
            worldY = s->y;

            // Screen pos
            s->x -= gCamera.x;
            s->y -= gCamera.y;

            // TODO:
            //   if(IS_OUT_OF_RANGE_OLD(u16, s->x, s->y, 40))
            if ((((u16)(s->x + (40 / 2)) > DISPLAY_WIDTH + 36) || (s->y + (40 / 2) < 0) || (s->y > DISPLAY_HEIGHT + 80))) {
                proj->unk88[i] = 0;
                continue;
            }

            res = SA2_LABEL(sub_801F07C)(worldY, worldX, 1, +8, &sp08, SA2_LABEL(sub_801EE64));

            if (res <= 0) {
                proj->unk64[i] += res;
                proj->qUnk4C[i] = Div(-(proj->qUnk4C[i] * 10), 21);
                proj->unk70[i] += Div(SIN(sp08 * 4), 30);
            }

            if (proj->unk30 < 30) {
                if (proj->unk30 & 0x2) {
                    DisplaySprite(s);
                }
            } else {
                DisplaySprite(s);
            }

            s->x = worldX;
            s->y = worldY;
        }
    }
}