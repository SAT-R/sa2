#include "global.h"
#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "game/game.h"
#include "game/entity.h"

#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    Sprite s2;
    s32 x;
    s32 y;
    u16 unk74;
    u8 kind;
    u8 unk77;
    u8 unk78;
} Entity_ItemBox; /* size: 0x7C */

void sub_800B1AC(Entity_ItemBox *);
void sub_800B580(Entity_ItemBox *, s32);
void Task_800B704(void);
void TaskDestructor_800B80C(struct Task *);

void CreateEntity_ItemBox(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                          u8 spriteY)
{
    struct Task *t;
    Entity_ItemBox *itembox;
    Sprite *s;
    if (gGameMode == GAME_MODE_TIME_ATTACK || gGameMode == GAME_MODE_BOSS_TIME_ATTACK) {
        if (me->index == 0) {
            goto CreateEntity_Bell_defer;
        }

        if (me->index == 5) {
            me->index = 7;
        }
    }

    t = TaskCreate(Task_800B704, sizeof(Entity_ItemBox), 0x2000, 0,
                   TaskDestructor_800B80C);
    itembox = TaskGetStructPtr(t);
    itembox->kind = me->index;
    itembox->unk74 = 0;
    itembox->x = TO_WORLD_POS(me->x, spriteRegionX);
    itembox->y = TO_WORLD_POS(me->y, spriteRegionY);
    itembox->base.regionX = spriteRegionX;
    itembox->base.regionY = spriteRegionY;
    itembox->base.me = me;
    itembox->base.spriteX = me->x;
    itembox->base.spriteY = spriteY;

    s = &itembox->s;
    s->unk1A = 0x4C0;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.anim = SA2_ANIM_ITEMBOX;
    s->variant = 0;
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX);
    sub_8004558(s);

    s = &itembox->s2;
    s->unk1A = 0x500;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = -1;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk28[0].unk0 = -1;
    s->unk10 = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_MOSAIC);
    s->graphics.dest = VramMalloc(TILE_COUNT__ANIM_ITEMBOX_TYPE);
    sub_800B580(itembox, 1);

CreateEntity_Bell_defer:
    SET_MAP_ENTITY_INITIALIZED(me);
}