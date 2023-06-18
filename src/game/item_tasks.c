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

struct Task *CreateItemTask_Shield_Normal(u8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Normal, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = TaskGetStructPtr(t);
    Sprite *s = &item->s;

    item->unk30 = p0;

    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SHIELD_NORMAL;
    s->variant = 0;
    s->unk21 = 0xFF;
    s->unk1A = 0x200;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    m4aSongNumStart(SE_ACTIVATE_SHIELD);

    return t;
}

struct Task *CreateItemTask_Invincibility(u8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Invincibility, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = TaskGetStructPtr(t);
    Sprite *s = &item->s;

    item->unk30 = p0;

    s->graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_INVINCIBILITY;
    s->variant = 0;
    s->unk21 = 0xFF;
    s->unk1A = 0x200;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

struct Task *CreateItemTask_Shield_Magnetic(u8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Magnetic, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = (ItemTask *)TaskGetStructPtr(t);

    item->unk30 = p0;

    {
        ItemTask *item2 = (ItemTask *)TaskGetStructPtr(t);
        item2->s.graphics.dest = VramMalloc(36);
        item2->s.graphics.size = 0;
        item2->s.graphics.anim = SA2_ANIM_SHIELD_MAGNETIC;
        item2->s.variant = 0;
        item2->s.unk21 = 0xFF;
        item2->s.unk1A = 0x200;
        item2->s.unk1C = 0;
        item2->s.unk22 = 0x10;
        item2->s.palId = 0;
        item2->s.unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    m4aSongNumStart(SE_ACTIVATE_SHIELD);

    return t;
}

struct Task *CreateItemTask_Confusion(u8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Confusion, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = TaskGetStructPtr(t);

    item->unk30 = p0;

    {
        ItemTask *item2 = (ItemTask *)TaskGetStructPtr(t);
        item2->s.graphics.dest = VramMalloc(8);
        item2->s.graphics.size = 0;
        item2->s.graphics.anim = SA2_ANIM_CONFUSION;
        item2->s.variant = 0;
        item2->s.unk21 = 0xFF;
        item2->s.unk1A = 0x200;
        item2->s.unk1C = 0;
        item2->s.unk22 = 0x10;
        item2->s.palId = 0;
        item2->s.unk10 = SPRITE_FLAG(PRIORITY, 2);
    }

    return t;
}

// https://decomp.me/scratch/DuFBd
void Task_Item_Shield_Normal(void)
{
    ItemTask *item0 = TaskGetStructPtr(gCurTask);
    u8 param = item0->unk30;

    ItemTask *item = TaskGetStructPtr(gCurTask);
    struct Camera *cam = &gCamera;

    u32 unk37 = (gPlayer.unk37 & 0x3);
    if (unk37 != 1) {
        TaskDestroy(gCurTask);
        return;
    }

    if (!(gPlayer.unk37 & 0x2)) {
        bool32 b;
        s32 screenX, screenY;

        screenX = Q_24_8_TO_INT(gPlayer.x) - cam->x;
        item->s.x = screenX + gPlayer.unk7C;

        screenY = Q_24_8_TO_INT(gPlayer.y) - cam->y;
        item->s.y = screenY;

        item->s.unk10 &= ~SPRITE_FLAG_MASK_PRIORITY;
        item->s.unk10 |= gPlayer.unk90->s.unk10 & SPRITE_FLAG_MASK_PRIORITY;

        sub_8004558(&item->s);

#ifndef NON_MATCHING
        asm("mov %0, %2\n"
            "and %0, %1\n"
            : "=r"(b)
            : "r"(param), "r"(unk37));

        // Make the compiler "forget" that unk37 is 0x1
        asm("" : "=r"(unk37));
#else
        b = (param & 0x1);
#endif
        if (((gUnknown_03005590 & 0x2) && (b != unk37))
            || (!(gUnknown_03005590 & 0x2) && (b != 0))) {
            sub_80051E8(&item->s);
        }
    }
}