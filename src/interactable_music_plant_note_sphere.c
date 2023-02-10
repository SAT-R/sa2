#include "global.h"
#include "sprite.h"
#include "task.h"

#include "interactable.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite disp;
    /* 0x3C */ s32 posX;
    /* 0x40 */ s32 posY;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ u8 unk48;
    /* 0x49 */ u8 unk49;
    /* 0x4A */ u8 unk4A;
    /* 0x4B */ u8 unk4B;
} Sprite_NoteSphere; /* size: 0x4C */

extern void Task_Interactable_MusicPlant_Note_Sphere(void);
extern void TaskDestructor_Interactable_MusicPlant_Note_Sphere(struct Task *);

/* animId, variant, tileId (OBJ VRAM) */
const u16 gUnknown_080DFBF0[8][3] = {
    {SA2_ANIM_NOTE_BLOCK, 7, 0x188},
    {SA2_ANIM_NOTE_BLOCK, 8, 0x18E},
    {SA2_ANIM_NOTE_BLOCK, 9, 0x194},
    {SA2_ANIM_NOTE_BLOCK, 10, 0x19A},
    {SA2_ANIM_NOTE_BLOCK, 11, 0x1A0},
    {SA2_ANIM_NOTE_BLOCK, 12, 0x1A6},
    {SA2_ANIM_NOTE_BLOCK, 13, 0x1AC},
    {SA2_ANIM_NOTE_BLOCK, 14, 0x1B2},
};

void initSprite_Interactable_MusicPlant_Note_Sphere(Interactable *ia, u16 spriteRegionX,
                                                    u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_Interactable_MusicPlant_Note_Sphere, sizeof(Sprite_NoteSphere),
                     0x2010, 0, TaskDestructor_Interactable_MusicPlant_Note_Sphere);
    Sprite_NoteSphere *note = TaskGetStructPtr(t);
    Sprite* s = &note->disp;
    note->unk44 = 0;
    note->unk46 = 0;
    note->unk48 = ia->d.uData[0];

    note->base.regionX = spriteRegionX;
    note->base.regionY = spriteRegionY;
    note->base.ia = ia;
    note->base.spriteX = ia->x;
    note->base.spriteY = spriteY;
    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2000;

    s->graphics.dest = &((u8*)OBJ_VRAM0)[gUnknown_080DFBF0[note->unk48][2] * TILE_SIZE_4BPP];
    s->graphics.anim = gUnknown_080DFBF0[note->unk48][0];
    s->variant = gUnknown_080DFBF0[note->unk48][1];

    note->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    note->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    sub_8004558(s);
}