#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/item_tasks.h"

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

#define ITEMTASK_GET_PLAYER_NUM()                                                       \
    ({                                                                                  \
        ItemTask *it = TASK_DATA(gCurTask);                                             \
        it->unk30;                                                                      \
    })

struct Task *CreateItemTask_Shield_Normal(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Normal, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);
    Sprite *s = &item->s;

    item->unk30 = p0;

    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SHIELD_NORMAL;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(8);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    m4aSongNumStart(SE_ACTIVATE_SHIELD);

    return t;
}

struct Task *CreateItemTask_Invincibility(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Invincibility, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);
    Sprite *s = &item->s;

    item->unk30 = p0;

    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_INVINCIBILITY;
    s->variant = 0;
    s->prevVariant = -1;
    s->unk1A = SPRITE_OAM_ORDER(8);
    s->timeUntilNextFrame = 0;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

struct Task *CreateItemTask_Shield_Magnetic(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Magnetic, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
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
        s->unk1A = 0x200;
        s->timeUntilNextFrame = 0;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    m4aSongNumStart(SE_ACTIVATE_SHIELD);

    return t;
}

struct Task *CreateItemTask_Confusion(s8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Confusion, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
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
        s->unk1A = 0x200;
        s->timeUntilNextFrame = 0;
        s->animSpeed = 0x10;
        s->palId = 0;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    return t;
}

// (fake-matched) https://decomp.me/scratch/DuFBd
void Task_Item_Shield_Normal(void)
{
    s8 param = ITEMTASK_GET_PLAYER_NUM();

    ItemTask *item = TASK_DATA(gCurTask);
    struct Camera *cam = &gCamera;

    u32 itemEffect
        = (gPlayer.itemEffect
           & (PLAYER_ITEM_EFFECT__INVINCIBILITY | PLAYER_ITEM_EFFECT__SHIELD_NORMAL));
    if (itemEffect != PLAYER_ITEM_EFFECT__SHIELD_NORMAL) {
        TaskDestroy(gCurTask);
        return;
    }

    if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
        bool32 b;
        s32 screenX, screenY;

        screenX = Q_24_8_TO_INT(gPlayer.x) - cam->x;
        item->s.x = screenX + gPlayer.unk7C;

        screenY = Q_24_8_TO_INT(gPlayer.y) - cam->y;
        item->s.y = screenY;

        item->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.unk10 |= gPlayer.unk90->s.unk10 & SPRITE_FLAG_MASK_PRIORITY;

        UpdateSpriteAnimation(&item->s);

#ifndef NON_MATCHING
        asm("mov %0, %2\n"
            "and %0, %1\n"
            : "=r"(b)
            : "r"(param), "r"(itemEffect));

        // Make the compiler "forget" that itemEffect is 0x1
        asm("" : "=r"(itemEffect));
#else
        b = (param & 0x1);
#endif
        if (((gStageTime & 0x2) && (b != itemEffect))
            || (!(gStageTime & 0x2) && (b != 0))) {
            DisplaySprite(&item->s);
        }
    }
}

void Task_Item_Shield_Magnetic(void)
{
    s8 param = ITEMTASK_GET_PLAYER_NUM();

    ItemTask *item = TASK_DATA(gCurTask);
    struct Camera *cam = &gCamera;

    bool32 b;

    if (IS_SINGLE_PLAYER) {
        u32 itemEffect = (gPlayer.itemEffect
                          & (PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC
                             | PLAYER_ITEM_EFFECT__INVINCIBILITY));

        if (itemEffect != PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC) {
            TaskDestroy(gCurTask);
            return;
        }

        if (!(gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
            s32 screenX, screenY;

            screenX = Q_24_8_TO_INT(gPlayer.x) - cam->x;
            item->s.x = screenX + gPlayer.unk7C;

            screenY = Q_24_8_TO_INT(gPlayer.y) - cam->y;
            item->s.y = screenY;

            item->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
            item->s.unk10 |= gPlayer.unk90->s.unk10 & SPRITE_FLAG_MASK_PRIORITY;
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

    if (s->unk10 & SPRITE_FLAG_MASK_ANIM_OVER) {
        TaskDestroy(gCurTask);
    } else {
        s16 screenX = 0, screenY = 0;
        u32 r2 = 0;

        if (IS_SINGLE_PLAYER) {
            screenX = Q_24_8_TO_INT(gPlayer.x) + gPlayer.unk7C;

            screenY = Q_24_8_TO_INT(gPlayer.y);

            r2 = gPlayer.unk90->s.unk10 & SPRITE_FLAG_MASK_PRIORITY;
        }

        s->x = screenX - cam->x;
        s->y = screenY - cam->y;

        item->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.unk10 |= r2;

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
        struct MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[(s8)param]);

        if (mpp->unk57 & 0x2) {
            x = mpp->unk50;
            y = mpp->unk52;
            priority = mpp->s.unk10;
        } else {
            TaskDestroy(gCurTask);
            return;
        }
    } else if ((gPlayer.itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY) == 0) {
        TaskDestroy(gCurTask);
        return;
    } else {
        // _0802ACE4
        x = Q_24_8_TO_INT(gPlayer.x) + gPlayer.unk7C;
        y = Q_24_8_TO_INT(gPlayer.y);
        priority = gPlayer.unk90->s.unk10;
    }
    // _0802AD02
    priority &= SPRITE_FLAG_MASK_PRIORITY;

    item->s.x = x - cam->x;
    item->s.y = y - cam->y;
    item->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
    item->s.unk10 |= priority;
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

    s16 x, y;
    u32 priority;
    u32 b;

    struct Camera *cam = &gCamera;

    if (IS_MULTI_PLAYER) {
        struct MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[(s8)param]);

        if (!(mpp->unk57 & (0x40 | 0x10))) {
            TaskDestroy(gCurTask);
            return;
        }

        s->x = mpp->unk50 - cam->x;
        s->y = mpp->unk52 - cam->y;
        s->unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        s->unk10 |= mpp->s.unk10 & SPRITE_FLAG_MASK_PRIORITY;

        if (GRAVITY_IS_INVERTED) {
            s->unk10 |= MOVESTATE_800;
        } else {
            s->unk10 &= ~MOVESTATE_800;
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
            if (((gStageTime & 0x2) && (b != one))
                || (!(gStageTime & 0x2) && (b != 0))) {
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
