#include "global.h"
#include "main.h"
#include "sprite.h"
#include "interactable.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s16 elements[6][4];
    /* 0x30 */ SpriteBase base;
    /* 0x3C */ Sprite s1;
    /* 0x6C */ s32 posX;
    /* 0x70 */ s32 posY;
    /* 0x74 */ u8 unk74[4];
} Sprite_GuitarString; /* size 0x78 */

extern void Task_Interactable_MusicPlant_GuitarString(void);
extern void TaskDestructor_Interactable_MusicPlant_GuitarString(struct Task*);

void initSprite_Interactable_MusicPlant_GuitarString(Interactable *ia, u16 spriteRegionX,
                                                   u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_MusicPlant_GuitarString, sizeof(Sprite_GuitarString), 0x2010, 0, TaskDestructor_Interactable_MusicPlant_GuitarString);
    Sprite_GuitarString* gs = TaskGetStructPtr(t);
    Sprite *s = &gs->s1;
    u16 i;

    gs->base.regionX = spriteRegionX;
    gs->base.regionY = spriteRegionY;
    gs->base.ia = ia;
    gs->base.spriteX = ia->x;
    gs->base.spriteY = spriteY;

    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2000;
    s->graphics.dest = (void*)(OBJ_VRAM0 + 0x3700);
    s->graphics.anim = SA2_ANIM_NOTE_BLOCK;
    s->variant = SA2_ANIM_VARIANT_NOTE_BLOCK_GUITAR;

    gs->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    gs->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    sub_8004558(s);

    for(i = 0; i < 6; i++) {
        s16 *elem = gs->elements[i];
        s16 offsetX = Q_8_8(i << 3);
        s16 offsetY = 0;

        elem[0] = offsetX;
        elem[1] = offsetY;

        switch(i) {
        case 0:
        case 5: {
            elem[2] = Q_8_8(0);
        } break;

        case 1:
        case 4: {
            elem[2] = Q_8_8(0.5);
        } break;
            
        case 2:
        case 3: {
            elem[2] = 0x80;
            elem[2] *= 2;
        } break;

        }
    }
}