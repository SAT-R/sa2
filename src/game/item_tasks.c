#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "lib/m4a.h"
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

// https://decomp.me/scratch/m6YN7
// What is going on here?
struct Task *CreateItemTask_Shield_Magnetic(u8 p0)
{
    struct Task *t = TaskCreate(Task_Item_Shield_Magnetic, sizeof(ItemTask), 0x4001, 0,
                                TaskDestructor_ItemTasks);
    ItemTask *item = TaskGetStructPtr(t), *item2;
    Sprite *s = &item->s;

    item->unk30 = p0;

    item2 = TaskGetStructPtr(t);
    item2->s.graphics.dest = VramMalloc(36);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SHIELD_MAGNETIC;
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
