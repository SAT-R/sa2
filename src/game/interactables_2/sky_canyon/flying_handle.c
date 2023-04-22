#include "global.h"
#include "core.h"
#include "task.h"
#include "game/interactables_2/sky_canyon/flying_handle.h"
#include "malloc_vram.h"
#include "trig.h"

#include "constants/move_states.h"
#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    s32 unk4C;
    s32 unk50;
    s16 unk54;
    s16 unk56;
    s16 unk58;
    s16 unk5A;
    s16 unk5C;
    s16 unk5E;
    s32 unk60;
    s32 filler64;
    s8 unk68;
    s32 unk6C[3][2];
} Sprite_FlyingHandle; /* 0x84 */

void Task_Interactable_SkyCanyon_FlyingHandle(void);
void TaskDestructor_Interactable_SkyCanyon_FlyingHandle(struct Task *);

void initSprite_Interactable_SkyCanyon_FlyingHandle(MapEntity *me, u16 spriteRegionX,
                                                    u16 spriteRegionY, u8 spriteY)
{
    u32 i;
    Sprite *sprite;
    struct Task *t = TaskCreate(Task_Interactable_SkyCanyon_FlyingHandle,
                                sizeof(Sprite_FlyingHandle), 0x2010, 0,
                                TaskDestructor_Interactable_SkyCanyon_FlyingHandle);
    Sprite_FlyingHandle *flyingHandle = TaskGetStructPtr(t);
    flyingHandle->unk68 = 0;
    flyingHandle->unk5C = 0;
    flyingHandle->unk5E = 0;
    flyingHandle->unk60 = 0;
    flyingHandle->unk3C = SpriteGetScreenPos(me->x, spriteRegionX);
    flyingHandle->unk40 = SpriteGetScreenPos(me->y, spriteRegionY);
    flyingHandle->unk54 = me->d.sData[0] * 8;
    flyingHandle->unk56 = me->d.sData[1] * 8;
    flyingHandle->unk58 = flyingHandle->unk54 + me->d.uData[2] * 8;
    flyingHandle->unk5A = flyingHandle->unk56 + me->d.uData[3] * 8;

    flyingHandle->unk44 = Q_24_8(((flyingHandle->unk54 + flyingHandle->unk58) >> 1)
                                 + flyingHandle->unk3C);
    flyingHandle->unk48 = Q_24_8(flyingHandle->unk40 + flyingHandle->unk5A);
    flyingHandle->unk4C = 0;
    flyingHandle->unk50 = 0;

    flyingHandle->base.regionX = spriteRegionX;
    flyingHandle->base.regionY = spriteRegionY;
    flyingHandle->base.me = me;
    flyingHandle->base.spriteX = me->x;
    flyingHandle->base.spriteY = spriteY;

    for (i = 0; i < 3; i++) {
        flyingHandle->unk6C[i][0] = flyingHandle->unk44;
        flyingHandle->unk6C[i][1] = flyingHandle->unk48;
    }

    sprite = &flyingHandle->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = VramMalloc(0x19);
    sprite->graphics.anim = SA2_ANIM_FLYING_HANDLE;
    sprite->variant = 0;
    sub_8004558(sprite);
    SET_MAP_ENTITY_INITIALIZED(me);
}
