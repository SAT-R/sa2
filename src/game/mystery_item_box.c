#include "core.h"
#include "malloc_vram.h"
#include "game/sa1_sa2_shared/collision.h"

#include "game/entity.h"
#include "game/mystery_item_box.h"
#include "game/multiplayer/multiplayer_event_mgr.h"
#include "game/sa1_sa2_shared/dust_cloud.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "lib/m4a/m4a.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    SpriteBase base; /* 0x00 */
    Sprite box; /* 0x0C*/
    Sprite identifier; /* 0x3C */
    SpriteTransform transform;
    s32 x; // x
    s32 y; // y
    s16 iconOffsetY;
    u8 unk82;
    u8 framesSinceOpened;
    u8 unk84;
} Sprite_MysteryItemBox;

static inline void sub_80865E4_inline(void);
static void sub_80865E4(void);
static void sub_808673C(void);
static void sub_80867E8(struct Task *);
static void sub_808623C(void);
static void sub_8086858(Sprite_MysteryItemBox *);
static bool32 sub_808693C(Sprite_MysteryItemBox *);
static bool32 sub_80868F4(Sprite_MysteryItemBox *);
static void sub_8086474(Sprite_MysteryItemBox *);
static void sub_80868A8(Sprite_MysteryItemBox *, u32);
static void sub_8086804(Sprite_MysteryItemBox *);
static void sub_8086890(Sprite_MysteryItemBox *);
static void sub_80866FC(void);
static void sub_808665C(void);
static void sub_808673C(void);

static const u8 sRingBonuses[] = { 1, 5, 10, 30, 50 };

static const u16 gUnknown_080E029A[] = { 0, 1, 1, 0, 1, 1, 0, 1 };

static const u16 gUnknown_080E02AA[][3] = { { SA2_ANIM_ITEMBOX_TYPE, 9, 4 }, { SA2_ANIM_ITEMBOX_TYPE, 12, 4 } };

static const u16 unused = 0;

#define ITEM_ICON_DISPLAY_TIME  (1 * GBA_FRAMES_PER_SECOND)
#define ITEM_ICON_DISPLAY_DELAY (int)(0.5 * GBA_FRAMES_PER_SECOND)

void CreateEntity_MysteryItemBox(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    Sprite *s;
    Sprite_MysteryItemBox *itemBox;
    struct Task *t;
    if ((gRandomItemBox & 7) == me->d.sData[0] && me->d.sData[1] <= (gRandomItemBox >> 4)) {
        t = TaskCreate(sub_80865E4, sizeof(Sprite_MysteryItemBox), 0x2000, 0, sub_80867E8);
    } else {
        t = TaskCreate(sub_808673C, sizeof(Sprite_MysteryItemBox), 0x2000, 0, sub_80867E8);
    }

    if (me->d.sData[1] <= (gRandomItemBox >> 4)) {
        me->d.sData[1] = (gRandomItemBox >> 4);
    }

    itemBox = TASK_DATA(t);
    itemBox->unk82 = gUnknown_080E029A[gMultiplayerPseudoRandom % ARRAY_COUNT(gUnknown_080E029A)];
    itemBox->iconOffsetY = Q(0.0);
    itemBox->x = TO_WORLD_POS(me->x, spriteRegionX);
    itemBox->y = TO_WORLD_POS(me->y, spriteRegionY);
    itemBox->base.regionX = spriteRegionX;
    itemBox->base.regionY = spriteRegionY;
    itemBox->base.me = me;
    itemBox->base.spriteX = me->x;
    itemBox->base.id = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);

    s = &itemBox->box;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->graphics.dest = VramMalloc(16);
    s->graphics.anim = SA2_ANIM_ITEMBOX;
    s->variant = 0;
    UpdateSpriteAnimation(s);

    s = &itemBox->identifier;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->graphics.dest = VramMalloc(4);
    s->graphics.anim = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][0];
    s->variant = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][1];
    UpdateSpriteAnimation(s);
}

static void sub_808616C(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    SpriteTransform *transform;
    Sprite *identifier;

    itemBox->unk82 = gUnknown_080E029A[gMultiplayerPseudoRandom % ARRAY_COUNT(gUnknown_080E029A)];

    identifier = &itemBox->identifier;
    identifier->graphics.anim = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][0];
    identifier->variant = gUnknown_080E02AA[gUnknown_080E029A[itemBox->unk82]][1];
    UpdateSpriteAnimation(identifier);

    itemBox->box.frameFlags |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
    itemBox->identifier.frameFlags |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    transform = &itemBox->transform;
    transform->rotation = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = 0;
    transform->x = 0;
    transform->y = 0;
    gCurTask->main = sub_808623C;
    sub_808623C();
}

// TODO: figure out how to move this down
static inline void sub_80865E4_inline(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    MapEntity *me = itemBox->base.me;

    if (me->d.sData[0] != (gRandomItemBox & 7)) {
        sub_8086804(itemBox);
    } else {
        if (me->d.sData[1] > (gRandomItemBox >> 4)) {
            sub_8086858(itemBox);
            return;
        }

        if (sub_808693C(itemBox)) {
            sub_8086474(itemBox);
        }

        if (sub_80868F4(itemBox)) {
            SET_MAP_ENTITY_NOT_INITIALIZED(me, itemBox->base.spriteX);
            TaskDestroy(gCurTask);
            return;
        }

        sub_80868A8(itemBox, 0);
    }
}

static void sub_808623C(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);

    SpriteTransform *transform = &itemBox->transform;
    transform->x = itemBox->x - gCamera.x;
    transform->y = itemBox->y - gCamera.y;

    transform->qScaleY += 8;

    if (transform->qScaleY >= 0x100) {
        MapEntity *me;
        Sprite_MysteryItemBox *itemBox2;
        itemBox->box.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
        itemBox->identifier.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
        transform->qScaleY = Q(1);
        itemBox->iconOffsetY = Q(0.0);
        gCurTask->main = sub_80865E4;

        sub_80865E4_inline();
        return;
    }

    itemBox->box.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;

    itemBox->box.frameFlags |= gUnknown_030054B8;
    itemBox->identifier.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
    itemBox->identifier.frameFlags |= gUnknown_030054B8++;

    TransformSprite(&itemBox->box, transform);
    TransformSprite(&itemBox->identifier, transform);
    DisplaySprite(&itemBox->box);
    DisplaySprite(&itemBox->identifier);
}

static inline void sub_808673C_inline(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    MapEntity *me = itemBox->base.me;

    if (me->d.sData[0] == (gRandomItemBox & 7) && me->d.sData[1] <= (gRandomItemBox >> 4)) {
        me->d.sData[1] = gRandomItemBox >> 4;
        gCurTask->main = sub_808616C;
        return;
    }

    if (sub_80868F4(itemBox) != 0) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, itemBox->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }
}

static void sub_808636C(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);

    SpriteTransform *transform = &itemBox->transform;
    transform->x = itemBox->x - gCamera.x;
    transform->y = itemBox->y - gCamera.y;

    transform->qScaleY -= 8;

    if (transform->qScaleY < 1) {
        MapEntity *me;
        Sprite_MysteryItemBox *itemBox2;
        itemBox->box.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
        itemBox->identifier.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
        transform->qScaleY = Q(1);
        gCurTask->main = sub_808673C;

        sub_808673C_inline();
        return;
    }

    itemBox->box.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;

    itemBox->box.frameFlags |= gUnknown_030054B8;
    itemBox->identifier.frameFlags &= ~SPRITE_FLAG_MASK_ROT_SCALE;
    itemBox->identifier.frameFlags |= gUnknown_030054B8++;

    TransformSprite(&itemBox->box, transform);
    TransformSprite(&itemBox->identifier, transform);
    DisplaySprite(&itemBox->box);
    DisplaySprite(&itemBox->identifier);
}

static void sub_8086474(Sprite_MysteryItemBox *itemBox)
{
    RoomEvent_MysteryItemBoxBreak *roomEvent;
    MapEntity *me;
    if (itemBox->unk84 != 1 || gPlayer.moveState & 2) {
        gPlayer.qSpeedAirY = -Q(3); // default itembox-hit y-accel
        gPlayer.charState = CHARSTATE_SPRING_B;
        gPlayer.prevCharState = CHARSTATE_INVALID;
        gPlayer.transition = PLTRANS_UNCURL;
    }

    itemBox->base.me->d.sData[1] += 1;

    m4aSongNumStart(SE_ITEM_BOX_2);
    CreateDustCloud(itemBox->x, itemBox->y);
    itemBox->framesSinceOpened = 0;

    roomEvent = CreateRoomEvent();
    roomEvent->type = ROOMEVENT_TYPE_MYSTERY_ITEMBOX_BREAK;
    roomEvent->x = itemBox->base.regionX;
    roomEvent->y = itemBox->base.regionY;
    roomEvent->id = itemBox->base.id;
    roomEvent->unk4 = itemBox->base.me->d.sData[1];

    gCurTask->main = sub_808665C;
}

static void sub_8086504(Sprite_MysteryItemBox *itemBox)
{
    switch (itemBox->unk82) {
        case 0: {
            u8 boxVal = sRingBonuses[(u32)PseudoRandom32() % ARRAY_COUNT(sRingBonuses)];
            u16 prevRingCount = gRingCount;
            gRingCount = prevRingCount + boxVal;

            if (!IS_EXTRA_STAGE(gCurrentLevel)) {
                if (Div(gRingCount, 100) != Div(prevRingCount, 100) && gGameMode == GAME_MODE_SINGLE_PLAYER) {
                    gNumLives = MIN(gNumLives + 1, 255u);
                    gMusicManagerState.unk3 = 0x10;
                }
            }

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS && gRingCount > 255) {
                gRingCount = 255;
            }

            m4aSongNumStart(SE_RING_COPY);
            break;
        }
        case 1: {
            RoomEvent_ItemEffect *roomEvent = CreateRoomEvent();

            roomEvent->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
            roomEvent->effect = 4;
            break;
        }
    }

    itemBox->framesSinceOpened = 0;
    gCurTask->main = sub_80866FC;
}

static void sub_80865E4(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    MapEntity *me = itemBox->base.me;

    if (me->d.sData[0] != (gRandomItemBox & 7)) {
        sub_8086804(itemBox);
    } else {
        if (me->d.sData[1] > (gRandomItemBox >> 4)) {
            sub_8086858(itemBox);
        } else {
            if (sub_808693C(itemBox) != 0) {
                sub_8086474(itemBox);
            }

            if (sub_80868F4(itemBox) != 0) {
                SET_MAP_ENTITY_NOT_INITIALIZED(me, itemBox->base.spriteX);
                TaskDestroy(gCurTask);
                return;
            } else {
                sub_80868A8(itemBox, 0);
            }
        }
    }
}

static void sub_808665C(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);

    if (itemBox->framesSinceOpened++ >= ITEM_ICON_DISPLAY_TIME) {
        sub_8086504(itemBox);
    } else {
        itemBox->iconOffsetY -= Q(1.0);
    }

    sub_80868A8(itemBox, 1);
}

static void sub_80866AC(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);

    if (itemBox->framesSinceOpened++ >= ITEM_ICON_DISPLAY_TIME) {
        sub_8086890(itemBox);
    } else {
        itemBox->iconOffsetY -= Q(1.0);
    }

    sub_80868A8(itemBox, 1);
}

static void sub_80866FC(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);

    if (itemBox->framesSinceOpened++ >= ITEM_ICON_DISPLAY_DELAY) {
        gCurTask->main = sub_808673C;
        return;
    }

    sub_80868A8(itemBox, 1);
}

static void sub_808673C(void)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    MapEntity *me = itemBox->base.me;

    if (me->d.sData[0] == (gRandomItemBox & 7) && me->d.sData[1] <= (gRandomItemBox >> 4)) {
        me->d.sData[1] = gRandomItemBox >> 4;
        gCurTask->main = sub_808616C;
        return;
    }

    if (sub_80868F4(itemBox) != 0) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, itemBox->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }
}

static inline void sub_808679C_inline(void)
{
    SpriteTransform *transform;
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    itemBox->box.frameFlags |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
    itemBox->identifier.frameFlags |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    transform = &itemBox->transform;
    transform->rotation = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = 0;
    transform->y = 0;
    gCurTask->main = sub_808636C;
    sub_808636C();
}

static void sub_808679C(void)
{
    SpriteTransform *transform;
    Sprite_MysteryItemBox *itemBox = TASK_DATA(gCurTask);
    itemBox->box.frameFlags |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;
    itemBox->identifier.frameFlags |= SPRITE_FLAG_MASK_ROT_SCALE_ENABLE;

    transform = &itemBox->transform;
    transform->rotation = 0;
    transform->qScaleX = Q(1);
    transform->qScaleY = Q(1);
    transform->x = 0;
    transform->y = 0;
    gCurTask->main = sub_808636C;
    sub_808636C();
}

static void sub_80867E8(struct Task *t)
{
    Sprite_MysteryItemBox *itemBox = TASK_DATA(t);
    VramFree(itemBox->box.graphics.dest);
    VramFree(itemBox->identifier.graphics.dest);
}

static void sub_8086804(Sprite_MysteryItemBox *unused)
{
    gCurTask->main = sub_808679C;
    // Has to be inline :/
    sub_808679C_inline();
}

static void sub_8086858(Sprite_MysteryItemBox *itemBox)
{
    m4aSongNumStart(SE_ITEM_BOX_2);
    CreateDustCloud(itemBox->x, itemBox->y);
    itemBox->framesSinceOpened = 0;
    gCurTask->main = sub_80866AC;
}

static void sub_8086890(Sprite_MysteryItemBox *itemBox)
{
    itemBox->framesSinceOpened = 0;
    gCurTask->main = sub_80866FC;
}

static void sub_80868A8(Sprite_MysteryItemBox *itemBox, u32 p2)
{
    itemBox->box.x = itemBox->x - gCamera.x;
    itemBox->box.y = itemBox->y - gCamera.y;
    itemBox->identifier.x = itemBox->box.x;
    itemBox->identifier.y = itemBox->box.y + I(itemBox->iconOffsetY);

    if (p2 == 0) {
        DisplaySprite(&itemBox->box);
    }

    DisplaySprite(&itemBox->identifier);
}

static bool32 sub_80868F4(Sprite_MysteryItemBox *itemBox)
{
    s16 x = itemBox->x - gCamera.x;
    s16 y = itemBox->y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_2(x, y)) {
        return TRUE;
    }

    return FALSE;
}

static bool32 sub_808693C(Sprite_MysteryItemBox *itemBox)
{
    if (PLAYER_IS_ALIVE) {
        if (Coll_Player_ItemBox(&itemBox->box, itemBox->x, itemBox->y) != 0) {
            itemBox->unk84 = 1;
            return TRUE;
        } else if (Coll_Player_Entity_HitboxN(&itemBox->box, itemBox->x, itemBox->y, 0, &gPlayer, 0) == 0) {
#ifndef NON_MATCHING
        ret0:
#endif
            return FALSE;
        } else {
            itemBox->unk84 = 0;
            return TRUE;
        }
    } else {
#ifndef NON_MATCHING
        goto ret0;
#else
        return FALSE;
#endif
    }
}
