#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "game/player_callbacks.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/cheese.h"
#include "task.h"
#include "core.h"

#include "flags.h"
#include "game/entity.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3C */ s32 worldX;
    /* 0x40 */ s32 worldY;
} Sprite_SpecialRing; /* size = 0x44 */

static void Task_SpecialRingVisible(void);
static void TaskDestructor_Interactable_SpecialRing(struct Task *);
static void CollectRing(Sprite_SpecialRing *);
static bool32 ShouldDespawn(Sprite_SpecialRing *);
static void Despawn(Sprite_SpecialRing *, u32);
static void Render(Sprite_SpecialRing *);
static void Task_SpecialRingCollected(void);

void CreateEntity_SpecialRing(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (IS_SINGLE_PLAYER) {
        struct Task *t
            = TaskCreate(Task_SpecialRingVisible, sizeof(Sprite_SpecialRing), 0x4040, 0, TaskDestructor_Interactable_SpecialRing);

        Sprite_SpecialRing *ring = TASK_DATA(t);
        Sprite *s;

        ring->worldX = TO_WORLD_POS(me->x, spriteRegionX);
        ring->worldY = TO_WORLD_POS(me->y, spriteRegionY);
        ring->base.regionX = spriteRegionX;
        ring->base.regionY = spriteRegionY;
        ring->base.me = me;
        ring->base.meX = me->x;
        ring->base.id = spriteY;

        s = &ring->displayed;
        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;

        s->graphics.dest = VramMalloc(9);
        s->graphics.anim = SA2_ANIM_SPECIAL_RING;
        s->variant = SA2_ANIM_VARIANT_SP_RING__IDLE;
        SET_MAP_ENTITY_INITIALIZED(me);
    }
}

static bool32 IsTouchingPlayer(Sprite_SpecialRing *ring)
{
    Cheese *cheese = gCheese;

    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        u32 flags = Coll_Player_Entity_Intersection(&ring->displayed, ring->worldX, ring->worldY, &gPlayer);
        if (flags & 0xF0000) {
            return TRUE;
        } else {
#ifdef BUG_FIX
            if (cheese != NULL)
#endif
            {
                s32 somePosX, somePosY;
                u16 posX, posY;
                somePosX = I(cheese->posX) + 16;
                somePosX -= ring->worldX;

                somePosY = I(cheese->posY) + 32;
                somePosY -= ring->worldY;

                posY = somePosY;
                posX = somePosX;

                if ((posX <= 32) && (posY <= 32)) {
                    gCurTask->unk15 = 0;

                    return TRUE;
                }
            }
        }
    }

    return FALSE;
}

static void Task_SpecialRingVisible(void)
{
    Sprite_SpecialRing *ring = TASK_DATA(gCurTask);

    if (gPlayer.character == CHARACTER_CREAM) {
        Player_UpdateHomingPosition(Q(ring->worldX), Q(ring->worldY));
    }

    if (IsTouchingPlayer(ring)) {
        CollectRing(ring);
    } else {
        if (ShouldDespawn(ring)) {
            Despawn(ring, 1);
        } else {
            Render(ring);
        }
    }
}

static void TaskDestructor_Interactable_SpecialRing(struct Task *t)
{
    Sprite_SpecialRing *ring = TASK_DATA(t);
    void *gfx = ring->displayed.graphics.dest;
    VramFree(gfx);
}

static void CollectRing(Sprite_SpecialRing *ring)
{
    gSpecialRingCount++;

    ring->displayed.graphics.anim = SA2_ANIM_SPECIAL_RING;
    ring->displayed.variant = SA2_ANIM_VARIANT_SP_RING__COLLECT;
    m4aSongNumStart(SE_SPECIAL_RING);
    gCurTask->main = Task_SpecialRingCollected;
}

static void Render(Sprite_SpecialRing *ring)
{
    Sprite *s = &ring->displayed;

    s->x = ring->worldX - gCamera.x;
    s->y = ring->worldY - gCamera.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static bool32 ShouldDespawn(Sprite_SpecialRing *ring)
{
    s32 screenPosX, screenPosY;
    u16 posX, posY;
    screenPosX = (ring->worldX + (CAM_REGION_WIDTH / 2));
    screenPosX -= gCamera.x;

    screenPosY = (ring->worldY + (CAM_REGION_WIDTH / 2));
    screenPosY -= gCamera.y;

    posY = screenPosY;
    posX = screenPosX;

    if ((posX > CAM_BOUND_X) || posY > (DISPLAY_HEIGHT + CAM_REGION_WIDTH))
        return TRUE;
    else
        return FALSE;
}

static void Despawn(Sprite_SpecialRing *ring, u32 param1)
{
    if (param1 != 0) {
        ring->base.me->x = ring->base.meX;
    }
    TaskDestroy(gCurTask);
}

static void Task_SpecialRingCollected(void)
{
    Sprite_SpecialRing *ring = TASK_DATA(gCurTask);
    Sprite *s = &ring->displayed;

    if ((s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) || ShouldDespawn(ring)) {
        Despawn(ring, 0);
    } else {
        Render(ring);
    }
}
