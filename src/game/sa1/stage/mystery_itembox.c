#include "core.h"
#include "malloc_vram.h"
#include "game/shared/stage/collision.h"

#include "game/shared/stage/entity.h"
#include "game/sa1/stage/mystery_itembox.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/mp_player.h"
#include "game/shared/stage/dust_cloud.h"
#include "game/sa1/stage/itembox.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/player_transitions.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

/* While you can tell the SA2 version stems from SA1's,
 *  it's clear they heavily modified it during SA2's development.
 *
 * TODO: Maybe we should split them into their own files when merging SA1 and SA2's codebases together.
 */

#define ITEM_ICON_DISPLAY_TIME  (1 * GBA_FRAMES_PER_SECOND)
#define ITEM_ICON_DISPLAY_DELAY (int)(0.5 * GBA_FRAMES_PER_SECOND)

#define DATABYTE_A 0
#define DATABYTE_B 1

#if (GAME == GAME_SA1)
#define ITEMBOX_ANIM SA1_ANIM_ITEMBOX
#elif (GAME == GAME_SA2)
#define ITEMBOX_ANIM SA2_ANIM_ITEMBOX
#endif
typedef struct {
    SpriteBase base;
    Sprite box;
    Sprite identifier;
    SpriteTransform transform;
    u32 unk78;
    s16 unk7C;
    s16 unk7E;
    u8 unk80;
    u8 rndItemIndex;
    s16 unk82;
} MysteryItemBox;

void Task_MysteryItemBox_Main0(void);
void Task_MysteryItemBox_Main1(void);
void TaskDestructor_MysteryItemBox(Task *);
void sub_801C69C(void);
void Task_801C2FC(void);
void Task_801C420(void);
void sub_801C130(void);
void Task_801C3A0(void);
void Task_801C4EC(void);
extern void Task_MysteryItemBox_Main1(void);

const u8 gUnknown_080BB4D0[] = { 13, 16, 14, 13 };
const u8 gUnknown_080BB4D4[] = { 8, 11, 8, 11 };
const u8 gUnknown_080BB4D8[] = { 0, 4, 5, 6, 7, 8, 9, 10, 12, 13, 15, 9, 10, 8, 7, 6 };
const u8 gUnknown_080BB4E8[] = { 6, 7, 5, 4, 3, 6, 7, 5 };
const u8 gUnknown_080BB4F0[] = { 8, 9, 10, 9 };

void CreateEntity_MysteryItemBox(MapEntity *me, u16 regionX, u16 regionY, u8 spriteY)
{
    Sprite *s;
    MysteryItemBox *itemBox;
    Task *t;
    if ((gRandomItemBox & 7) == me->d.sData[DATABYTE_A] && me->d.sData[DATABYTE_B] <= (gRandomItemBox >> 4)) {
        t = TaskCreate(Task_MysteryItemBox_Main0, sizeof(MysteryItemBox), 0x2000, 0, TaskDestructor_MysteryItemBox);
    } else {
        t = TaskCreate(Task_MysteryItemBox_Main1, sizeof(MysteryItemBox), 0x2000, 0, TaskDestructor_MysteryItemBox);
    }

    if (me->d.sData[DATABYTE_B] <= (gRandomItemBox >> 4)) {
        me->d.sData[DATABYTE_B] = (gRandomItemBox >> 4);
    }

    itemBox = TASK_DATA(t);

#if (GAME == GAME_SA1)
    s = &itemBox->box;
    itemBox->base.regionX = regionX;
    itemBox->base.regionY = regionY;
    itemBox->base.me = me;
    itemBox->base.meX = me->x;
    itemBox->base.id = spriteY;
    itemBox->unk7E = 0;
    itemBox->unk7C = 0;
    itemBox->unk80 = 0;
    itemBox->rndItemIndex = gMultiplayerPseudoRandom % 4u;
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);
#elif (GAME == GAME_SA2)
    itemBox->SA2_LABEL(unk82) = gUnknown_080E029A[gMultiplayerPseudoRandom % ARRAY_COUNT(gUnknown_080E029A)];
    itemBox->iconOffsetY = Q(0.0);
    itemBox->x = TO_WORLD_POS(me->x, regionX);
    itemBox->y = TO_WORLD_POS(me->y, regionY);
    itemBox->base.regionX = regionX;
    itemBox->base.regionY = regionY;
    itemBox->base.me = me;
    itemBox->base.meX = me->x;
    itemBox->base.id = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
#endif

#if (GAME == GAME_SA1)
    s = &itemBox->box;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ITEMBOX);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_ITEMBOX;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
#elif (GAME == GAME_SA2)
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
    s->graphics.anim = ITEMBOX_ANIM;
    s->variant = 0;
    UpdateSpriteAnimation(s);
#endif

#if (GAME == GAME_SA1)
    s = &itemBox->identifier;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_ITEMBOX_TYPE);
    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->palId = 0;
    s->oamFlags = SPRITE_OAM_ORDER(19);
    s->hitboxes[0].index = -1;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    s->graphics.anim = SA1_ANIM_ITEMBOX_TYPE;
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        s->variant = gUnknown_080BB4D0[itemBox->rndItemIndex];
    } else {
        s->variant = gUnknown_080BB4D4[itemBox->rndItemIndex];
    }
    UpdateSpriteAnimation(s);
#elif (GAME == GAME_SA2)
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
#endif
}

void Task_MysteryItemBox_Main1()
{
    MapEntity *temp_r5;
    s32 temp_r1_2;
    u32 temp_r1;
    CamCoord worldX, worldY;
    MysteryItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;

    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY);

    if (me->d.sData[DATABYTE_A] == (7 & gRandomItemBox)) {
        if (me->d.sData[DATABYTE_B] <= gRandomItemBox >> 4) {
            me->d.sData[DATABYTE_B] = gRandomItemBox >> 4;
            gCurTask->main = Task_801C420;
            return;
        }
    }

    // TODO: Use a macro
    if ((((worldX - gCamera.x) + 0x80) > (DISPLAY_WIDTH + 256u)) || ((((worldY - gCamera.y) + 0x80) < 0))
        || ((worldY - gCamera.y) > (DISPLAY_HEIGHT + 208))) {
        me->x = itembox->base.meX;
        TaskDestroy(gCurTask);
    }
}

void Task_MysteryItemBox_Main0()
{
    u8 sp8 = 0;
    MapEntity *me;
    Sprite *s;
    s16 *temp_r1;
    s16 *temp_r1_2;
    s16 temp_r1_3;
    s16 temp_r2_2;
    s32 temp_r0;
    CamCoord worldX;
    CamCoord worldY;
    u32 res;
    u8 *temp_r3_2;
    u8 var_r2;
    RoomEvent_MysteryItemBoxBreak *roomEvent;

    MysteryItemBox *itembox = TASK_DATA(gCurTask);

    s = &itembox->box;
    me = itembox->base.me;
    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY);
    if (me->d.sData[0] != (7 & gRandomItemBox)) {
        if ((8 & gPlayer.moveState) && (gPlayer.stoodObj == s)) {
            gPlayer.moveState = (gPlayer.moveState & ~8) | 2;
        }
        if (itembox->unk78 & 0x20) {
            gPlayer.moveState &= ~0x20;
            itembox->unk78 = 0U;
        }
        gCurTask->main = sub_801C69C;
        sub_801C69C();
        return;
    }
    if (me->d.sData[1] > (gRandomItemBox >> 4)) {
        m4aSongNumStart(0xA7U);
        CreateDustCloud(worldX, worldY + itembox->unk7C);
        gCurTask->main = Task_801C2FC;
        itembox->unk80 = sp8;
        if ((8 & gPlayer.moveState) && (gPlayer.stoodObj == s)) {
            gPlayer.moveState = (gPlayer.moveState & ~8) | 2;
        }
        if (!(itembox->unk78 & 0x20)) {
            return;
        }
        gPlayer.moveState &= ~0x20;
        itembox->unk78 = 0U;
        return;
    }

    if (itembox->unk80 != 0) {
        itembox->unk7C += I(itembox->unk7E);
        itembox->unk7E += 0x28;
        temp_r0 = SA2_LABEL(sub_801F07C)(worldY + itembox->unk7C, worldX, 1, 8, NULL, SA2_LABEL(sub_801EE64));
        if (temp_r0 < 0) {
            itembox->unk7C += temp_r0;
            itembox->unk80 = 0;
        }
    }
    s->x = worldX - gCamera.x;
    s->y = (worldY - gCamera.y) + itembox->unk7C;
    if ((gGameMode == 3) || (gGameMode == 5)) {
        for (var_r2 = 0; var_r2 < 4; var_r2++) {
            Task **mpTasks = gMultiplayerPlayerTasks;
            if (mpTasks[var_r2] == NULL)
                break;

            if (var_r2 != SIO_MULTI_CNT->id) {
                MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[var_r2]);
                if (mpp->unk5C & 4) {
                    sp8 = 1;
                }
            }
        }
    }

    if (!((0x400000 & gPlayer.moveState) && (sp8 == 0))) {
        if (((gPlayer.moveState & 8) && (gPlayer.stoodObj == s)) || (gPlayer.spriteInfoBody->reserved.index == -1)) {
            res = Coll_Player_Platform(s, (s16)worldX, (worldY + itembox->unk7C), &gPlayer);
            if (0x10000 & res) {
                itembox->unk7E = -Q(1);
                itembox->unk80 = 0xFF;
            }
        } else {
            res = Coll_Player_Itembox(s, worldX, worldY + itembox->unk7C, &gPlayer);
            if (0x10000 & res) {
                itembox->unk7E = -Q(1);
                itembox->unk80 = 0xFF;
            } else if (0x28 & res) {
                if ((gPlayer.moveState & 8) && (gPlayer.stoodObj == s)) {
                    gPlayer.moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    gPlayer.moveState &= ~MOVESTATE_20;
                    gPlayer.moveState |= MOVESTATE_IN_AIR;
                }
                m4aSongNumStart(0xA7U);
                CreateDustCloud(worldX, worldY + itembox->unk7C);
                gCurTask->main = sub_801C130;
                itembox->unk80 = 0;
                me->d.sData[1]++;
                roomEvent = CreateRoomEvent();
                roomEvent->type = ROOMEVENT_TYPE_MYSTERY_ITEMBOX_BREAK;
                roomEvent->x = (s8)itembox->base.regionX;
                roomEvent->y = (s8)itembox->base.regionY;
                roomEvent->id = (u8)itembox->base.id;
                roomEvent->unk4 = (u8)me->d.sData[1];
                return;
            }
        }
        itembox->unk78 = res;
    }

    // TODO: Macro
    if (((u16)(s->x + 128) > (DISPLAY_WIDTH + 256u)) || ((s->y + 0x80 + itembox->unk7C) < 0)
        || ((s->y + itembox->unk7C) > (DISPLAY_HEIGHT + 128))) {
        me->x = itembox->base.meX;
        TaskDestroy(gCurTask);
        return;
    }
    DisplaySprite(s);
    s = &itembox->identifier;
    s->x = worldX - gCamera.x;
    s->y = (worldY - gCamera.y) + itembox->unk7C;
    DisplaySprite(s);
}

void sub_801C130()
{
    Sprite *s;
    s16 *temp_r3;
    s32 rnd;
    s32 temp_r4_2;
    RoomEvent_ItemEffect *roomEventA;
    s8 var_r0;
    u16 oldRingCount;
    CamCoord worldX, worldY;
    u8 temp_r4;

    MysteryItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;

    itembox->unk7C--;
    itembox->unk80++;
    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY) + itembox->unk7C;
    if (itembox->unk80 > 0x3BU) {
        if (gGameMode != 6) {
            temp_r4 = itembox->rndItemIndex;
            switch (temp_r4) {
                default:
                case 0:
                    roomEventA = CreateRoomEvent();
                    roomEventA->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
                    roomEventA->effect = 0;
                    break;
                case 1:
                    roomEventA = CreateRoomEvent();
                    roomEventA->type = ROOMEVENT_TYPE_ITEMEFFECT_APPLIED;
                    roomEventA->effect = 1;
                    break;
                case 2:
                    gPlayer.itemEffect |= 0x20;
                    gPlayer.itemEffect20Timer = 0x258;
                    break;
            }
        } else {
            u16 ringsInBox;

            switch (itembox->rndItemIndex) {
                case 2:
                case 0:
                    ringsInBox = ItemBox_RingAmountTable[PseudoRandom32() % 6u];
                    INCREMENT_RINGS(ringsInBox);
                    if ((gGameMode == 6) && ((u32)gRingCount > 0xFFU)) {
                        gRingCount = 0xFF;
                    }
                    m4aSongNumStart(0x75U);
                    break;
                case 1:
                case 3:
                    roomEventA = CreateRoomEvent();
                    roomEventA->type = 6;
                    roomEventA->effect = 3;
                    break;
            }
        }
        gCurTask->main = Task_801C3A0;
        itembox->unk80 = 0;
    }

    s = &itembox->identifier;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    DisplaySprite(s);
}

void Task_801C2FC()
{
    Sprite *s;
    u16 *temp_r4;
    u16 temp_r7;
    u8 *temp_r6;
    u8 temp_r2;

    MysteryItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;
    CamCoord worldX, worldY;

    itembox->unk7C--;
    itembox->unk80++;

    worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    worldY = TO_WORLD_POS(me->y, itembox->base.regionY) + itembox->unk7C;

    if (itembox->unk80 >= 60) {
        gCurTask->main = Task_801C3A0;
        itembox->unk80 = 0;
    }

    s = &itembox->identifier;
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;
    DisplaySprite(s);
}

void Task_801C3A0(void)
{
    Sprite *s;

    MysteryItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;

    if (++itembox->unk80 > 30) {
        gCurTask->main = Task_MysteryItemBox_Main1;
    } else {
        CamCoord worldX, worldY;

        worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
        worldY = TO_WORLD_POS(me->y, itembox->base.regionY) + itembox->unk7C;

        s = &itembox->identifier;
        s->x = worldX - gCamera.x;
        s->y = worldY - gCamera.y;
        DisplaySprite(s);
    }
}

void Task_801C420(void)
{
    Sprite *s;
    SpriteTransform *tf;

    MysteryItemBox *itembox = TASK_DATA(gCurTask);

    tf = &itembox->transform;
    itembox->rndItemIndex = gMultiplayerPseudoRandom % 4u;
    itembox->unk7E = 0;
    itembox->unk7C = 0;
    itembox->unk80 = 0;

    s = &itembox->identifier;
    s->graphics.anim = SA1_ANIM_ITEMBOX_TYPE;
    if (gGameMode != 6) {
        s->variant = gUnknown_080BB4D0[itembox->rndItemIndex];
    } else {
        s->variant = gUnknown_080BB4D4[itembox->rndItemIndex];
    }
    UpdateSpriteAnimation(s);
    itembox->box.frameFlags |= 0x20;
    itembox->identifier.frameFlags |= 0x20;
    tf->rotation = 0;
    tf->qScaleX = Q(1.0);
    tf->qScaleY = 0;
    tf->x = 0;
    tf->y = 0;

    gCurTask->main = Task_801C4EC;
    Task_801C4EC();
}

void Task_801C4EC()
{
    MysteryItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;
    SpriteTransform *tf = &itembox->transform;
    CamCoord worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    CamCoord worldY = TO_WORLD_POS(me->y, itembox->base.regionY);
    Sprite *sprItem;
    Sprite *sprBox;

    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;

    tf->qScaleY += Q(8. / 256.);
    if (tf->qScaleY >= Q(1.0)) {
        itembox->box.frameFlags &= ~0x20;
        itembox->identifier.frameFlags &= ~0x20;
        tf->qScaleY = Q(1.0);
        gCurTask->main = Task_MysteryItemBox_Main0;
        Task_MysteryItemBox_Main0();
    } else {
        itembox->box.frameFlags &= ~0x1F;
        itembox->box.frameFlags |= gOamMatrixIndex;
        itembox->identifier.frameFlags &= ~0x1F;
        itembox->identifier.frameFlags |= gOamMatrixIndex++;

        sprBox = &itembox->box;
        TransformSprite(sprBox, tf);
        sprItem = &itembox->identifier;
        TransformSprite(sprItem, tf);

        DisplaySprite(sprBox);
        DisplaySprite(sprItem);
    }
}

void sub_801C5C4()
{
    MysteryItemBox *itembox = TASK_DATA(gCurTask);
    MapEntity *me = itembox->base.me;
    SpriteTransform *tf = &itembox->transform;
    CamCoord worldX = TO_WORLD_POS(itembox->base.meX, itembox->base.regionX);
    CamCoord worldY = TO_WORLD_POS(me->y, itembox->base.regionY);
    Sprite *sprItem;
    Sprite *sprBox;

    tf->x = worldX - gCamera.x;
    tf->y = worldY - gCamera.y;

    tf->qScaleY -= Q(8. / 256.);
    if (tf->qScaleY <= Q(0.0)) {
        itembox->box.frameFlags &= ~0x20;
        itembox->identifier.frameFlags &= ~0x20;
        tf->qScaleY = Q(1.0);
        gCurTask->main = Task_MysteryItemBox_Main1;
        Task_MysteryItemBox_Main1();
    } else {
        itembox->box.frameFlags &= ~0x1F;
        itembox->box.frameFlags |= gOamMatrixIndex;
        itembox->identifier.frameFlags &= ~0x1F;
        itembox->identifier.frameFlags |= gOamMatrixIndex++;

        sprBox = &itembox->box;
        TransformSprite(sprBox, tf);
        sprItem = &itembox->identifier;
        TransformSprite(sprItem, tf);

        DisplaySprite(sprBox);
        DisplaySprite(sprItem);
    }
}

void sub_801C69C()
{
    SpriteTransform *tf;

    MysteryItemBox *itembox = TASK_DATA(gCurTask);

    tf = &itembox->transform;
    itembox->box.frameFlags |= 0x20;
    itembox->identifier.frameFlags |= 0x20;
    tf->rotation = 0;
    tf->qScaleX = Q(1.0);
    tf->qScaleY = Q(1.0);
    tf->x = 0;
    tf->y = 0;
    gCurTask->main = sub_801C5C4;
    sub_801C5C4();
}

void TaskDestructor_MysteryItemBox(Task *t)
{
    MysteryItemBox *itembox = TASK_DATA(t);

    VramFree(itembox->box.graphics.dest);
    VramFree(itembox->identifier.graphics.dest);
}
