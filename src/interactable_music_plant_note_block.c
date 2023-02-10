#include "global.h"
#include "m4a.h"
#include "task.h"
#include "trig.h"

#include "interactable.h"
#include "interactable_music_plant_note_particle.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

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
} Sprite_NoteBlock; /* size: 0x4C */

extern void sub_8075C6C(void);
extern void sub_8075CC0(struct Task *);
extern void sub_8075CC4(Sprite_NoteBlock *);
extern void sub_8075CF0(Sprite_NoteBlock *);
extern void sub_8075D28(Sprite_NoteBlock *);
extern void sub_8075DE8(Sprite_NoteBlock *);

#define NUM_NOTE_BLOCK_TYPES 7

/* animId, variant, tileId (OBJ VRAM) */
const u16 gUnknown_080DFC40[NUM_NOTE_BLOCK_TYPES][3] = {
    { SA2_ANIM_NOTE_BLOCK, 0, 0x16C }, { SA2_ANIM_NOTE_BLOCK, 1, 0x170 },
    { SA2_ANIM_NOTE_BLOCK, 2, 0x174 }, { SA2_ANIM_NOTE_BLOCK, 3, 0x178 },
    { SA2_ANIM_NOTE_BLOCK, 4, 0x17C }, { SA2_ANIM_NOTE_BLOCK, 5, 0x180 },
    { SA2_ANIM_NOTE_BLOCK, 6, 0x184 },
};

const s16 gUnknown_080DFC6A[NUM_NOTE_BLOCK_TYPES] = {
    Q_8_8(4.5 + 0. / 8.),
    Q_8_8(4.5 + 3. / 8.),
    Q_8_8(4.5 + 6. / 8.),
    Q_8_8(4.5 + 9. / 8.),
    Q_8_8(4.5 + 12. / 8.),
    Q_8_8(4.5 + 15. / 8.),
    Q_8_8(0),
};

const u16 gUnknown_080DFC78[NUM_NOTE_BLOCK_TYPES + 1] = {
    SE_MUSIC_PLANT_GLOCKENSPIEL_1, SE_MUSIC_PLANT_GLOCKENSPIEL_2,
    SE_MUSIC_PLANT_GLOCKENSPIEL_3, SE_MUSIC_PLANT_GLOCKENSPIEL_4,
    SE_MUSIC_PLANT_GLOCKENSPIEL_5, SE_MUSIC_PLANT_GLOCKENSPIEL_6,
    SE_MUSIC_PLANT_GLOCKENSPIEL_6, MUS_DUMMY,
};

void initSprite_Interactable_MusicPlant_Note_Block(Interactable *ia, u16 spriteRegionX,
                                                   u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(sub_8075C6C, sizeof(Sprite_NoteBlock), 0x2010, 0, sub_8075CC0);
    Sprite_NoteBlock *block = TaskGetStructPtr(t);
    Sprite *s = &block->disp;

    block->unk4B = 3;
    block->unk44 = 0;
    block->unk46 = 0;
    block->unk48 = ia->d.uData[0];

    block->base.regionX = spriteRegionX;
    block->base.regionY = spriteRegionY;
    block->base.ia = ia;

    block->base.spriteX = ia->x;
    block->base.spriteY = spriteY;

    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;

    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2000;

    {
        u16 tileId = gUnknown_080DFC40[block->unk48][2];
        s->graphics.dest = &((u8 *)OBJ_VRAM0)[tileId * TILE_SIZE_4BPP];
    }
    {
        u16 animId = gUnknown_080DFC40[block->unk48][0];
        s->graphics.anim = animId;
    }
    {
        u16 variant = gUnknown_080DFC40[block->unk48][1];
        s->variant = variant;
    }

    block->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    block->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    sub_8004558(s);
}

void Task_8075A90(void)
{
    Sprite_NoteBlock *block = TaskGetStructPtr(gCurTask);

    u32 index = block->unk4A++;

    switch (index) {
        case 0: {
            block->unk44 = Q_2_14_TO_Q_24_8(COS(block->unk49 * 4)) * 4;
            block->unk46 = Q_2_14_TO_Q_24_8(SIN(block->unk49 * 4)) * 4;
        } break;

        case 4: {
            block->unk44 = 0;
            block->unk46 = 0;

            if (block->unk4B == 0) {
                sub_8075DE8(block);
                return;
            } else {
                sub_8075CC4(block);
            }
        } break;
    }

    sub_8075CF0(block);

    if (block->unk4B != 0) {
        sub_8075D28(block);
    }
}

void sub_8075B50(Sprite_NoteBlock *block)
{
    block->unk49 = 192;
    gPlayer.speedAirY = -(gUnknown_080DFC6A[block->unk48]);
    gPlayer.unk64 = 0x39;
    gPlayer.unk6D = 5;
    gPlayer.unk66 = -1;

    block->unk4A = 0;
    sub_8080C78(block->posX, block->posY, 5, 30, (gUnknown_080DFC6A[block->unk48]) >> 3,
                -((gUnknown_080DFC6A[block->unk48] * 3)) >> 2, 0);
    sub_8080C78(block->posX, block->posY, 5, 30, (-gUnknown_080DFC6A[block->unk48]) >> 3,
                -((gUnknown_080DFC6A[block->unk48] * 3) >> 3), 1);

    if (--block->unk4B == 1) {
        block->disp.graphics.dest = &(
            (u8 *)OBJ_VRAM0)[gUnknown_080DFC40[ARRAY_COUNT(gUnknown_080DFC40) - 1][2]];
        block->disp.graphics.anim
            = gUnknown_080DFC40[ARRAY_COUNT(gUnknown_080DFC40) - 1][0];
        block->disp.variant = gUnknown_080DFC40[ARRAY_COUNT(gUnknown_080DFC40) - 1][1];
        sub_8004558(&block->disp);
    }

    m4aSongNumStart(gUnknown_080DFC78[block->unk48]);
    gCurTask->main = Task_8075A90;
}