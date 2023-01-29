#include "global.h"
#include "gba/types.h"
#include "m4a.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite *s;
    /* 0x04 */ u16 unk4;
    /* 0x06 */ u8 filler6[2];
    /* 0x08 */ u16 unk8;
    /* 0x0C */ u32 unkC;
    /* 0x10 */ u32 unk10;
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u8 filler16[4];

    /* 0x1A */ u16 unk1A;
    /* 0x1C */ u16 unk1C;
} CraneStruct;

typedef struct {
    /* 0x000 */ s32 posX;
    /* 0x004 */ s32 posY;
    /* 0x008 */ CraneStruct cs;
    /* 0x028 */ CraneStruct unk28[6];
    /* 0x0E8 */ CraneStruct unkE8;
    /* 0x108 */ CraneStruct unk108;
    /* 0x128 */ Sprite unk128;
    /* 0x158 */ Sprite unk158; // Maybe alos Sprite?
    /* 0x188 */ Sprite unk188;
    /* 0x1B8 */ u32 unk1B8;

    /* 0x1BC */ u8 fillter1BC[0x8];

    /* 0x1C4 */ Interactable *ia;
    /* 0x1C8 */ u8 spriteX;
    /* 0x1C9 */ u8 spriteY;
} Sprite_HCCrane; /* size: 0x1CC */

extern void sub_8073AA8(void);
extern void TaskDestructor_80743B8(struct Task *);
extern void sub_807447C(Sprite_HCCrane *);

void initSprite_Interactable_HotCrater_Crane(Interactable *ia, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_8073AA8, 0x1CC, 0x2010, 0, TaskDestructor_80743B8);
    Sprite_HCCrane *crane = TaskGetStructPtr(t);
    CraneStruct *cs;
    u16 i;

    crane->unk1B8 = 0;
    crane->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    crane->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    crane->ia = ia;
    crane->spriteX = ia->x;
    crane->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);

    cs = &crane->cs;
    cs->s = &crane->unk128;
    cs->unk4 = 5;
    cs->unk8 = 0x200;
    cs->unkC = 0;
    cs->unk10 = 0;

    crane->unk128.unk1A = 0x480;

    cs->s->graphics.size = 0;
    cs->s->unk14 = 0;
    cs->s->unk1C = 0;
    cs->s->unk21 = 0xFF;
    cs->s->unk22 = 0x10;
    cs->s->focused = 0;
    cs->s->unk28->unk0 = -1;
    cs->s->unk10 = 0x2000;
    cs->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2BC0);
    cs->s->graphics.anim = SA2_ANIM_THROW_CRANE;
    cs->s->variant = 0;
    sub_8004558(cs->s);

    for (i = 0; i < ARRAY_COUNT(crane->unk28); i++) {
        crane->unk28[i].unk4 = 0;

        if (i == 0) {
            crane->unk28[i].unk4 = 2;
            crane->unk28[i].s = NULL;
            crane->unk28[i].unk8 = 0;
            crane->unk28[i].unkC = 0x2C00;
            crane->unk28[i].unk10 = 0;
        } else {
            // _08073998
            Sprite *spr = &crane->unk188;
            Sprite *hook = crane->unk28[i].s;
            crane->unk28[i].s = spr;
            crane->unk28[i].unk8 = 0;
            crane->unk28[i].unkC = 0;
            crane->unk28[i].unk10 = 0xC00;

            if (i == 1) {
                crane->unk28[i].unk4 = 4;
                spr->unk1A = 0x480;

                crane->unk28[i].s->graphics.size = 0;
                crane->unk28[i].s->unk14 = 0;
                crane->unk28[i].s->unk1C = 0;
                crane->unk28[i].s->unk21 = 0xFF;
                crane->unk28[i].s->unk22 = 0x10;
                crane->unk28[i].s->focused = 0;
                crane->unk28[i].s->unk28->unk0 = -1;
                crane->unk28[i].s->unk10 = 0x2000;
                crane->unk28[i].s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2B80);
                crane->unk28[i].s->graphics.anim = SA2_ANIM_THROW_CRANE_PARTS;
                crane->unk28[i].s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_ROPE_GREY;
                sub_8004558(crane->unk28[i].s);
            }
        }
        // _08073A00
    }

    // Hook
    crane->unkE8.s = &crane->unk158;
    crane->unkE8.unk4 = 5;
    crane->unkE8.unk8 = 0x100;
    crane->unkE8.unkC = 0x158;
    crane->unkE8.unk10 = 0xC00;
    crane->unkE8.s->unk1A = 0x480;
    crane->unkE8.s->graphics.size = 0;
    crane->unkE8.s->unk14 = 0;
    crane->unkE8.s->unk1C = 0;
    crane->unkE8.s->unk21 = 0xFF;
    crane->unkE8.s->unk22 = 0x10;
    crane->unkE8.s->focused = 0;
    crane->unkE8.s->unk28->unk0 = -1;
    crane->unkE8.s->unk10 = 0x2000;
    crane->unkE8.s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
    crane->unkE8.s->graphics.anim = SA2_ANIM_THROW_CRANE_PARTS;
    crane->unkE8.s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_HOOK;
    sub_8004558(crane->unkE8.s);

    crane->unk108.s = NULL;
    crane->unk108.unk4 = 2;
    crane->unk108.unk8 = 0;
    crane->unk108.unkC = 0x1000;
    crane->unk108.unk10 = 0;
    sub_807447C(crane);
}

/* matches
void sub_807447C(Sprite_HCCrane *crane) {
    u32 r2 = crane->cs.unk8;

    crane->unk28->unk8 = (1024 - r2) & (1024-1);
}*/