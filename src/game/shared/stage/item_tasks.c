#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#if (GAME == GAME_SA1)
#include "trig.h"
#endif
#include "lib/m4a/m4a.h"

#include "game/globals.h"

#include "game/shared/stage/player.h"
#include "game/shared/stage/camera.h"
#include "game/shared/stage/item_tasks.h"
#include "game/shared/stage/mp_player.h"

#if (GAME == GAME_SA1)
#include "trig.h"

// TODO: is this needed?
#include "game/shared/stage/mp_sprite_task.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#elif (GAME == GAME_SA2)
#include "constants/sa2/animations.h"
#include "constants/sa2/songs.h"
#endif

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

struct Task *CreateItemTask_Shield_Normal(s8 playerID)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Normal, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);
    Sprite *s = &item->s;

    item->unk30 = playerID;

#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_SHIELD_NORMAL);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_SHIELD_NORMAL;
#elif (GAME == GAME_SA2)
    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SHIELD_NORMAL;
#endif
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

struct Task *CreateItemTask_Invincibility(s8 playerID)
{
    struct Task *t = TaskCreate(Task_Item_Invincibility, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);
    Sprite *s = &item->s;

    item->unk30 = playerID;

#if (GAME == GAME_SA1)
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_INVINCIBILITY);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_INVINCIBILITY;
#elif (GAME == GAME_SA2)
    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_INVINCIBILITY;
#endif
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(8);
    s->qAnimDelay = 0;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

struct Task *CreateItemTask_Shield_Magnetic(s8 playerID)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Magnetic, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = (ItemTask *)TASK_DATA(t);

    item->unk30 = playerID;

    {
        ItemTask *item2 = (ItemTask *)TASK_DATA(t);
        Sprite *s = &item2->s;

#if (GAME == GAME_SA1)
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_SHIELD_MAGNETIC);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_SHIELD_MAGNETIC;
#elif (GAME == GAME_SA2)
        s->graphics.dest = VramMalloc(36);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_SHIELD_MAGNETIC;
#endif
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

struct Task *CreateItemTask_Confusion(s8 playerID)
{
    struct Task *t = TaskCreate(Task_Item_Confusion, sizeof(ItemTask), 0x4001, 0, TaskDestructor_ItemTasks);
    ItemTask *item = TASK_DATA(t);

    item->unk30 = playerID;

    {
        ItemTask *item2 = (ItemTask *)TASK_DATA(t);
        Sprite *s = &item2->s;

#if (GAME == GAME_SA1)
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_CONFUSION);
        s->graphics.size = 0;
        s->graphics.anim = SA1_ANIM_CONFUSION;
#elif (GAME == GAME_SA2)
        s->graphics.dest = VramMalloc(8);
        s->graphics.size = 0;
        s->graphics.anim = SA2_ANIM_CONFUSION;
#endif
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

// TODO: Fake-match
// (100.00% SA1) https://decomp.me/scratch/RHonJ
// (fake-matched SA2) https://decomp.me/scratch/DuFBd
void Task_Item_Shield_Normal(void)
{
    s8 pid = ITEMTASK_GET_PLAYER_NUM();
    s32 pid2;

    ItemTask *item = TASK_DATA(gCurTask);
    Camera *cam = &gCamera;
    Player *p;
    u32 itemEffect;
#if (GAME == GAME_SA1) && !defined(NON_MATCHING)
    register bool32 b asm("r3");
#else
    bool32 b;
#endif

#if (GAME == GAME_SA1)
    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[pid]);

        if (!(mpp->unk57 & PLAYER_ITEM_EFFECT__SHIELD_NORMAL)) {
            TaskDestroy(gCurTask);
            return;
        }

        item->s.x = mpp->pos.x - cam->x;
        item->s.y = mpp->pos.y - cam->y;

        item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.frameFlags |= mpp->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
    } else
#endif
    {
#if (GAME == GAME_SA1)
        p = &PLAYER(pid);
        itemEffect = (p->itemEffect & (PLAYER_ITEM_EFFECT__SHIELD_NORMAL));
        if (!itemEffect)
#else
        p = &gPlayer;
        itemEffect = (p->itemEffect & (PLAYER_ITEM_EFFECT__INVINCIBILITY | PLAYER_ITEM_EFFECT__SHIELD_NORMAL));
        if (itemEffect != PLAYER_ITEM_EFFECT__SHIELD_NORMAL)
#endif
        {
            TaskDestroy(gCurTask);
            return;
        }

        if (!(p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
            bool32 b;
#ifdef VIRTUAL_CONSOLE
            u32 r0;
#endif

            item->s.x = (I(p->qWorldX) - cam->x) + p->SA2_LABEL(unk7C);
            item->s.y = (I(p->qWorldY) - cam->y);

            item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            item->s.frameFlags |= p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;

#if (GAME == GAME_SA2)
            UpdateSpriteAnimation(&item->s);

#ifdef VIRTUAL_CONSOLE
            r0 = Mod(gStageTime, 6);
#endif

#ifndef NON_MATCHING
            asm("mov %0, %2\n"
                "and %0, %1\n"
                : "=r"(b)
                : "r"(pid), "r"(itemEffect));

            // Make the compiler "forget" that itemEffect is 0x1
            asm("" : "=r"(itemEffect));
#ifdef VIRTUAL_CONSOLE
            {
                register u32 r2 asm("r2") = 6;
                r0 &= r2;
            }
#endif
#else
            b = (pid & 0x1);
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
            return;
#endif
        }
#if (GAME == GAME_SA1)
        else {
            return;
        }
#endif
    }
#if (GAME == GAME_SA1)
    UpdateSpriteAnimation(&item->s);

    pid2 = pid;
    b = 1;
    pid2 &= b;

    if (((gStageTime & 0x2) && (pid2 != b)) || (!(gStageTime & 0x2) && (pid2 != 0))) {
        DisplaySprite(&item->s);
    }
#endif
}

#ifndef NON_MATCHING
// Looks like they may have manually edited the rom for the virtual console
// so they needed to keep all functions aligned
#ifdef VIRTUAL_CONSOLE
asm(".byte 0x00, 0x00, 0x00, 0x00");
#endif
#endif

// The virtual console version of this is probably manually edited
// so much that it is not matchable with C, however the logic was
// easy to replicate in C so it's documented below
// https://decomp.me/scratch/LzKYd
#if !defined(NON_MATCHING) && defined(VIRTUAL_CONSOLE) && defined(JAPAN)
ASM_FUNC("asm/Task_Item_Shield_Magnetic__virtual_console.s", void Task_Item_Shield_Magnetic(void))
#else
// TODO: Fake-match
// (100.00% SA1) https://decomp.me/scratch/zjlaf
void Task_Item_Shield_Magnetic(void)
{
    s8 pid = ITEMTASK_GET_PLAYER_NUM();
    s32 pid2;

    ItemTask *item = TASK_DATA(gCurTask);
    Camera *cam = &gCamera;
    Player *p;
    u32 itemEffect;
#ifndef NON_MATCHING
    register bool32 b asm("r3");
#else
    bool32 b;
#endif

#if (GAME == GAME_SA1)
    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[pid]);

        if (!(mpp->unk57 & PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC)) {
            TaskDestroy(gCurTask);
            return;
        }

        item->s.x = mpp->pos.x - cam->x;
        item->s.y = mpp->pos.y - cam->y;

        item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.frameFlags |= mpp->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
    } else
#endif
        if (IS_SINGLE_PLAYER) {
#if (GAME == GAME_SA1)
        p = &PLAYER(pid);
        itemEffect = (p->itemEffect & (PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC));
        if (!itemEffect)
#else
        p = &gPlayer;
        itemEffect = (p->itemEffect & (PLAYER_ITEM_EFFECT__INVINCIBILITY | PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC));
        if (itemEffect != PLAYER_ITEM_EFFECT__SHIELD_MAGNETIC)
#endif
        {
            TaskDestroy(gCurTask);
            return;
        }

        if (!(p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
            item->s.x = (I(p->qWorldX) - cam->x) + p->SA2_LABEL(unk7C);
            item->s.y = (I(p->qWorldY) - cam->y);

            item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
            item->s.frameFlags |= p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
        } else {
            return;
        }
    }
#ifdef VIRTUAL_CONSOLE
    m = Mod(gStageTime, 6);
#endif

    UpdateSpriteAnimation(&item->s);

    pid2 = pid;
    b = 1;
    pid2 &= b;

    if (((gStageTime & 0x2) && (pid2 != b)) || (!(gStageTime & 0x2) && (pid2 != 0))) {
        DisplaySprite(&item->s);
    }
}
#endif

UNUSED void Task_802ABC8(void)
{
    ItemTask *item = TASK_DATA(gCurTask);
    s8 pid = ITEMTASK_GET_PLAYER_NUM();
    // I'm not sure why tese were swapped :(
#if (GAME == GAME_SA1)
    Sprite *s = &item->s;
    Camera *cam = &gCamera;
#else
    Camera *cam = &gCamera;
    Sprite *s = &item->s;
#endif
    s16 screenX, screenY;
    u32 r2;

    if (s->frameFlags & SPRITE_FLAG_MASK_ANIM_OVER) {
        TaskDestroy(gCurTask);
        return;
    }

#if (GAME == GAME_SA2)
    screenX = 0;
    screenY = 0;
#endif
    r2 = 0;

#if (GAME == GAME_SA1)
    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[pid]);
        screenX = mpp->pos.x;
        screenY = mpp->pos.y;

        r2 |= mpp->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
    }
#endif

    if (IS_SINGLE_PLAYER) {
        // TODO: update `PLAYER` macro to ignore pid for SA2
#if (GAME == GAME_SA1)
        Player *p = &PLAYER(pid);
#else
        Player *p = &gPlayer;
#endif
        screenX = I(p->qWorldX) + p->SA2_LABEL(unk7C);
        screenY = I(p->qWorldY);

        r2 |= p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
    }

    s->x = screenX - cam->x;
    s->y = screenY - cam->y;

    s->frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    s->frameFlags |= r2;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// (fake-matched SA1) https://decomp.me/scratch/9RnyT
void Task_Item_Invincibility(void)
{
    s32 pid = ITEMTASK_GET_PLAYER_NUM();

    ItemTask *item = TASK_DATA(gCurTask);
    Camera *cam = &gCamera;
    s16 screenX, screenY;
    u32 priority;
    bool32 b;

    if (IS_MULTI_PLAYER) {
        MultiplayerPlayer *mpp = TASK_DATA(gMultiplayerPlayerTasks[(s8)pid]);

        if (mpp->unk57 & PLAYER_ITEM_EFFECT__INVINCIBILITY) {
            screenX = mpp->pos.x;
            screenY = mpp->pos.y;
            priority = mpp->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
        } else {
            TaskDestroy(gCurTask);
            return;
        }
    } else {
#if (GAME == GAME_SA1)
        Player *p = &PLAYER(pid);
#else
        Player *p = &gPlayer;
#endif

        if (!(p->itemEffect & PLAYER_ITEM_EFFECT__INVINCIBILITY)) {
            TaskDestroy(gCurTask);
            return;
        }

        screenX = I(p->qWorldX) + p->SA2_LABEL(unk7C);
        screenY = I(p->qWorldY);
        priority = p->spriteInfoBody->s.frameFlags & SPRITE_FLAG_MASK_PRIORITY;
    }

    item->s.x = screenX - cam->x;
    item->s.y = screenY - cam->y;
    item->s.frameFlags &= ~SPRITE_FLAG_MASK_PRIORITY;
    item->s.frameFlags |= priority;

#if (GAME == GAME_SA1)
    if ((gStageTime & 0x7) == 0) {
        // Create random small "sparkle" effects during invincibility
        struct Task *t;
        MultiplayerSpriteTask *mpSprite;
        Sprite *sprInvin;
#ifndef NON_MATCHING
        register s16 randA asm("r4"), randB;
        register u32 rand asm("r1");

        rand = (gPseudoRandom * 0x196225) + 0x3C6EF35F;

        randA = (rand >> 8) % 16u;
        rand = (rand * 0x196225) + 0x3C6EF35F;
#ifndef NON_MATCHING
        asm("" ::"r"(randA));
#endif
        gPseudoRandom = rand;
        randB = (rand >> 8) % 256u;
#else
        s16 randA, randB;
        randA = ((u32)PseudoRandom32() >> 8) % 16u;
        randB = ((u32)PseudoRandom32() >> 8) % 256u;
#endif

        t = CreateMultiplayerSpriteTask(screenX + I(COS_24_8(randB * 4) * randA), screenY + I(SIN_24_8(randB * 4) * randA), 0, 0,
                                        Task_UpdateMpSpriteTaskSprite, TaskDestructor_MultiplayerSpriteTask);
        mpSprite = TASK_DATA(t);
        sprInvin = &mpSprite->s;
        sprInvin->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_INVINCIBILITY, 1);
        sprInvin->graphics.anim = SA1_ANIM_INVINCIBILITY;
        sprInvin->variant = 1;
        sprInvin->oamFlags = SPRITE_OAM_ORDER(8);
        sprInvin->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }
#endif

    UpdateSpriteAnimation(&item->s);

    {
#ifndef NON_MATCHING
        register u32 bOrig asm("r3") = 1;
#else
        u32 bOrig = 1;
#endif
        b = bOrig;
        b &= ~pid;

        if (((gStageTime & 0x2) && (b != bOrig)) || (!(gStageTime & 0x2) && (b != 0))) {
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

    Camera *cam = &gCamera;

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
