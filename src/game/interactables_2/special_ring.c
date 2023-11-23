#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "game/player_actor.h"
#include "task.h"
#include "core.h"

#include "data.h"
#include "flags.h"
#include "game/entity.h"
#include "sprite.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
} Sprite_SpecialRing; /* size = 0x44 */

static void Task_Interactable_SpecialRing(void);
static void TaskDestructor_Interactable_SpecialRing(struct Task *);
static void sub_80810FC(Sprite_SpecialRing *);
static bool32 sub_8081164(Sprite_SpecialRing *);
static void sub_80811A0(Sprite_SpecialRing *, u32);
static void sub_8081134(Sprite_SpecialRing *);
static void Task_80811BC(void);

void CreateEntity_SpecialRing(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                              u8 spriteY)
{
    if (IS_SINGLE_PLAYER) {
        struct Task *t
            = TaskCreate(Task_Interactable_SpecialRing, sizeof(Sprite_SpecialRing),
                         0x4040, 0, TaskDestructor_Interactable_SpecialRing);

        Sprite_SpecialRing *ring = TASK_DATA(t);
        Sprite *s;

        ring->posX = TO_WORLD_POS(me->x, spriteRegionX);
        ring->posY = TO_WORLD_POS(me->y, spriteRegionY);
        ring->base.regionX = spriteRegionX;
        ring->base.regionY = spriteRegionY;
        ring->base.me = me;
        ring->base.spriteX = me->x;
        ring->base.spriteY = spriteY;

        s = &ring->displayed;
        s->unk1A = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->timeUntilNextFrame = 0;
        s->prevVariant = -1;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->unk10 = 0x2000;

        s->graphics.dest = VramMalloc(9);
        s->graphics.anim = SA2_ANIM_COLLECTIBLE_SPECIAL_RING;
        s->variant = SA2_ANIM_VARIANT_SP_RING__IDLE;
        SET_MAP_ENTITY_INITIALIZED(me);
    }
}

static bool32 sub_8081010(Sprite_SpecialRing *ring)
{
    PlayerActor *ptr = gPlayerActor;

    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        u32 flags = sub_800DF38(&ring->displayed, ring->posX, ring->posY, &gPlayer);
        if (flags & 0xF0000) {
            return TRUE;
        } else {
            s32 somePosX, somePosY;
            u16 posX, posY;
            somePosX = Q_24_8_TO_INT(ptr->posX) + 16;
            somePosX -= ring->posX;

            somePosY = Q_24_8_TO_INT(ptr->posY) + 32;
            somePosY -= ring->posY;

            posY = somePosY;
            posX = somePosX;

            if ((posX <= 32) && (posY <= 32)) {
                gCurTask->unk15 = 0;

                return TRUE;
            }
        }
    }

    return FALSE;
}

static void Task_Interactable_SpecialRing(void)
{
    Sprite_SpecialRing *ring = TASK_DATA(gCurTask);

    if (gPlayer.character == CHARACTER_CREAM) {
        sub_80122DC(Q_24_8(ring->posX), Q_24_8(ring->posY));
    }

    if (sub_8081010(ring)) {
        sub_80810FC(ring);
    } else {
        if (sub_8081164(ring)) {
            sub_80811A0(ring, 1);
        } else {
            sub_8081134(ring);
        }
    }
}

static void TaskDestructor_Interactable_SpecialRing(struct Task *t)
{
    Sprite_SpecialRing *ring = TASK_DATA(t);
    void *gfx = ring->displayed.graphics.dest;
    VramFree(gfx);
}

static void sub_80810FC(Sprite_SpecialRing *ring)
{
    gSpecialRingCount++;

    ring->displayed.graphics.anim = SA2_ANIM_COLLECTIBLE_SPECIAL_RING;
    ring->displayed.variant = SA2_ANIM_VARIANT_SP_RING__COLLECT;
    m4aSongNumStart(SE_SPECIAL_RING);
    gCurTask->main = Task_80811BC;
}

static void sub_8081134(Sprite_SpecialRing *ring)
{
    Sprite *s = &ring->displayed;

    s->x = ring->posX - gCamera.x;
    s->y = ring->posY - gCamera.y;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

static bool32 sub_8081164(Sprite_SpecialRing *ring)
{
    s32 screenPosX, screenPosY;
    u16 posX, posY;
    screenPosX = (ring->posX + 128);
    screenPosX -= gCamera.x;

    screenPosY = (ring->posY + 128);
    screenPosY -= gCamera.y;

    posY = screenPosY;
    posX = screenPosX;

    if ((posX > CAM_BOUND_X) || posY > (DISPLAY_HEIGHT + CAM_REGION_WIDTH))
        return TRUE;
    else
        return FALSE;
}

static void sub_80811A0(Sprite_SpecialRing *ring, u32 param1)
{
    if (param1 != 0) {
        ring->base.me->x = ring->base.spriteX;
    }
    TaskDestroy(gCurTask);
}

static void Task_80811BC(void)
{
    Sprite_SpecialRing *ring = TASK_DATA(gCurTask);
    Sprite *s = &ring->displayed;

    if ((s->unk10 & 0x4000) || sub_8081164(ring)) {
        sub_80811A0(ring, 0);
    } else {
        sub_8081134(ring);
    }
}
