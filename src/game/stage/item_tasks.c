#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a/m4a.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/item_tasks.h"
#include "game/multiplayer/mp_player.h"

#include "constants/animations.h"
#include "constants/songs.h"

typedef struct {
    Sprite s;
    u8 unk30;
    u8 filler31[7];
} ItemTask; /* size: 0x38 */

void Task_Item_Shield_Normal(void);
void Task_Item_Invincibility(void);
void Task_Item_Shield_Magnetic(void);
void Task_Item_Confusion(void);
void TaskDestructor_ItemTasks(struct Task *);

#define ITEMTASK_GET_PLAYER_NUM()                                                                                                          \
    ({                                                                                                                                     \
        ItemTask *it = TASK_DATA(gCurTask);                                                                                                \
        it->unk30;                                                                                                                         \
    })

struct Task *CreateItemTask_Shield_Normal(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Normal, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);
    Sprite *s = &item->s;

    item->unk30 = p0;

    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SHIELD_NORMAL;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    m4aSongNumStart(SE_ACTIVATE_SHIELD);

    return t;
}

struct Task *CreateItemTask_Invincibility(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Invincibility, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);
    Sprite *s = &item->s;

    item->unk30 = p0;

    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_INVINCIBILITY;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

struct Task *CreateItemTask_Shield_Magnetic(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Magnetic, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = (ItemTask *)TASK_DATA(t);

    item->unk30 = p0;

    {
        ItemTask *item2 = (ItemTask *)TASK_DATA(t);
        Sprite *s = &item2->s;

        s->graphics.dest = VramMalloc(36);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_SHIELD_MAGNETIC;
        s->variant = 0;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }

    m4aSongNumStart(SE_ACTIVATE_SHIELD);

    return t;
}

struct Task *CreateItemTask_Confusion(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Confusion, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);

    item->unk30 = p0;

    {
        ItemTask *item2 = (ItemTask *)TASK_DATA(t);
        Sprite *s = &item2->s;

        s->graphics.dest = VramMalloc(8);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_CONFUSION;
        s->variant = 0;
        s->prevVariant = -1;
        s->oamFlags = SPRITE_OAM_ORDER(8);
        s->qAnimDelay = 0;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }

    return t;
}

// (fake-matched) https://decomp.me/scratch/DuFBd
void Task_Item_Shield_Normal(void)
{
    s8 param = ITEMTASK_GET_PLAYER_NUM();

    ItemTask *item = TASK_DATA(gCurTask);
    struct Camera *cam = &gCamera;

    u32 itemEffect = (gPlayer.itemEffect & (PLAYER_ITEM_EFFECT__INVINCIBILITY | PLAYER_ITEM_EFFECT__SHIELD_NORMAL));
    if (itemEffect != PLAYER_ITEM_EFFECT__SHIELD_NORMAL) {
        TaskDestroy(gCurTask);
        return;
    }

    if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
        bool32 b;
        s32 screenX, screenY;
#ifdef VIRTUAL_CONSOLE
        u32 r0;
#endif

        screenX = I(gPlayer.qWorldX) - cam->x;
        item->s.x = screenX + gPlayer.unk7C;

        screenY = I(gPlayer.qWorldY) - cam->y;
        item->s.y = screenY;

        item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.frameFlags |= gPlayer.spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;

        UpdateSpriteAnimation(&item->s);

#ifdef VIRTUAL_CONSOLE
        r0 = Mod(gStageTime, 6);
#endif

#ifndef NON_MATCHING
        asm("mov %0, %2\n"
            "and %0, %1\n"
            : "=r"(b)
            : "r"(param), "r"(itemEffect));

        // Make the compiler "forget" that itemEffect is 0x1
        asm("" : "=r"(itemEffect));
#ifdef VIRTUAL_CONSOLE
        {
            register u32 r2 asm("r2") = 6;
            r0 &= r2;
        }
#endif
#else
        b = (param & 0x1);
#ifdef VIRTUAL_CONSOLE
        r0 &= 6;
#endif
#endif

#ifdef VIRTUAL_CONSOLE
        if ((!r0 && (b != itemEffect)) || (r0 && (b != 0))) {
#else
        if (((gStageTime & 0x2) && (b != itemEffect)) || (!(gStageTime & 0x2) && (b != 0))) {
#endif
            DisplaySprite(&item->s);
        }
    }
}

#ifndef NON_MATCHING
// Looks like they may have manually edited the rom for the virtual console
// to keep all the functions in the same alignment as the original rom.
// Maybe they couldn't reexport the anims?
#ifdef VIRTUAL_CONSOLE
asm(".byte 0x00, 0x00, 0x00, 0x00");
#endif
#endif

void Task_Item_Shield_Magnetic(void)
{
    s8 param = ITEMTASK_GET_PLAYER_NUM();

    ItemTask *item = TASK_DATA(gCurTask);
    struct Camera *cam = &gCamera;

    bool32 b;

    if (IS_SINGLE_PLAYER) {
        u32 itemEffect = (gPlayer.itemEffect & (PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC | PLAYER_ITEM_EFFECT__INVINCIBILITY));

        if (itemEffect != PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC) {
            TaskDestroy(gCurTask);
            return;
        }

        if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
            s32 screenX, screenY;

            screenX = I(gPlayer.qWorldX) - cam->x;
            item->s.x = screenX + gPlayer.unk7C;

            screenY = I(gPlayer.qWorldY) - cam->y;
            item->s.y = screenY;

            item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            item->s.frameFlags |= gPlayer.spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
        } else {
            return;
        }
    }

    UpdateSpriteAnimation(&item->s);

    b = (param);
    {
#ifndef NON_MATCHING
        register u32 one asm("r3") = 1;
#else
        u32 one = 1;
#endif
        b &= one;
        if (((gStageTime & 0x2) && (b != one)) || (!(gStageTime & 0x2) && (b != 0))) {
            DisplaySprite(&item->s);
        }
    }
}

// Unused?
void Task_802ABC8(void)
{
    ItemTask *item = TASK_DATA(gCurTask);
    struct Camera *cam = &gCamera;
    Sprite *s = &item->s;

    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        TaskDestroy(gCurTask);
    } else {
        s16 screenX = 0, screenY = 0;
        u32 r2 = 0;

        if (IS_SINGLE_PLAYER) {
            screenX = I(gPlayer.qWorldX) + gPlayer.unk7C;

            screenY = I(gPlayer.qWorldY);

            r2 = gPlayer.spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
        }

        s->x = screenX - cam->x;
        s->y = screenY - cam->y;

        item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.frameFlags |= r2;

        UpdateSpriteAnimation(s);
        DisplaySprite(s);
    }
}

void Task_Item_Invincibility(void)
{
    s32 param = ITEMTASK_GET_PLAYER_NUM();

    ItemTask *item = TASK_DATA(gCurTask);
    s16 x, y;
    u32 priority;
    u32 b;

    struct Camera *cam = &gCamera;

    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[(s8)param]);

        if (mpp->unk57 & 0x2) {
            x = mpp->pos.x;
            y = mpp->pos.y;
            priority = mpp->s.frameFlags;
        } else {
            TaskDestroy(gCurTask);
            return;
        }
    } else if ((gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) == 0) {
        TaskDestroy(gCurTask);
        return;
    } else {
        // _0802ACE4
        x = I(gPlayer.qWorldX) + gPlayer.unk7C;
        y = I(gPlayer.qWorldY);
        priority = gPlayer.spriteInfoBody->s.frameFlags;
    }
    // _0802AD02
    priority &= SPRITE_FLAG_MASK_PRIORITY;

    item->s.x = x - cam->x;
    item->s.y = y - cam->y;
    item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    item->s.frameFlags |= priority;
    UpdateSpriteAnimation(&item->s);

    {
#ifndef NON_MATCHING
        register u32 one asm("r3") = 1;
#else
        u32 one = 1;
#endif
        b = one;
        b &= ~param;
        if (((gStageTime & 0x2) && (b != one)) || (!(gStageTime & 0x2) && (b != 0))) {
            DisplaySprite(&item->s);
        }
    }
}

void Task_Item_Confusion(void)
{
    s8 param = ITEMTASK_GET_PLAYER_NUM();
    ItemTask *item = TASK_DATA(gCurTask);
    Sprite *s = &item->s;
    u32 b;

    struct Camera *cam = &gCamera;

    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[param]);

        if (!(mpp->unk57 & (0x40 | 0x10))) {
            TaskDestroy(gCurTask);
            return;
        }

        s->x = mpp->pos.x - cam->x;
        s->y = mpp->pos.y - cam->y;
        s->frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        s->frameFlags |= mpp->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;

        if (GRAVITY_IS_INVERTED) {
            s->frameFlags |= MOVESTATE_ICE_SLIDE;
        } else {
            s->frameFlags &= ~MOVESTATE_ICE_SLIDE;
        }

        UpdateSpriteAnimation(s);

        b = param;
        {
#ifndef NON_MATCHING
            register u32 one asm("r3") = 1;
#else
            u32 one = 1;
#endif
            b &= one;
            if (((gStageTime & 0x2) && (b != one)) || (!(gStageTime & 0x2) && (b != 0))) {
                DisplaySprite(s);
            }
        }
    } else {
        TaskDestroy(gCurTask);
        return;
    }
}

void TaskDestructor_ItemTasks(struct Task *t)
{
    ItemTask *item = TASK_DATA(t);
    VramFree(item->s.graphics.dest);
}
