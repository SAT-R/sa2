#include "global.h"
#include "lib/m4a.h"
#include "task.h"
#include "trig.h"

#include "game/entity.h"
#include "game/interactables_2/note_particle.h"

#include "constants/animations.h"
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

static void Task_8075C6C(void);
static void TaskDestructor_8075CC0(struct Task *);
static void sub_8075CC4(Sprite_NoteBlock *);
static void NoteBlock_UpdatePosition(Sprite_NoteBlock *);
static bool32 sub_8075D58(Sprite_NoteBlock *);
static bool32 sub_8075D98(Sprite_NoteBlock *);
static void sub_8075D28(Sprite_NoteBlock *);
static void sub_8075DE8(Sprite_NoteBlock *);

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

void CreateEntity_Note_Block(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                             u8 spriteY)
{
    struct Task *t = TaskCreate(Task_8075C6C, sizeof(Sprite_NoteBlock), 0x2010, 0,
                                TaskDestructor_8075CC0);
    Sprite_NoteBlock *block = TaskGetStructPtr(t);
    Sprite *s = &block->disp;

    block->unk4B = 3;
    block->unk44 = 0;
    block->unk46 = 0;
    block->unk48 = me->d.uData[0];

    block->base.regionX = spriteRegionX;
    block->base.regionY = spriteRegionY;
    block->base.me = me;

    block->base.spriteX = me->x;
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

    block->posX = TO_WORLD_POS(me->x, spriteRegionX);
    block->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

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

    NoteBlock_UpdatePosition(block);

    if (block->unk4B != 0) {
        sub_8075D28(block);
    }
}

void sub_8075B50(Sprite_NoteBlock *block)
{
    s32 ah;
    block->unk49 = 192;
    gPlayer.speedAirY = -(gUnknown_080DFC6A[block->unk48]);
    gPlayer.unk64 = 0x39;
    gPlayer.unk6D = 5;
    gPlayer.unk66 = -1;

    block->unk4A = 0;
    sub_8080C78(block->posX, block->posY, 5, 30, (gUnknown_080DFC6A[block->unk48]) >> 3,
                (-((gUnknown_080DFC6A[block->unk48] * 3) << 14)) >> 16, 0);
    sub_8080C78(block->posX, block->posY, 5, 30, (-gUnknown_080DFC6A[block->unk48]) >> 3,
                (-((gUnknown_080DFC6A[block->unk48] * 3) << 14)) >> 16, 1);

    if (--block->unk4B == 1) {
        block->disp.graphics.dest
            = &((u8 *)OBJ_VRAM0)[gUnknown_080DFC40[ARRAY_COUNT(gUnknown_080DFC40) - 1][2]
                                 * TILE_SIZE_4BPP];
        block->disp.graphics.anim
            = gUnknown_080DFC40[ARRAY_COUNT(gUnknown_080DFC40) - 1][0];
        block->disp.variant = gUnknown_080DFC40[ARRAY_COUNT(gUnknown_080DFC40) - 1][1];
        sub_8004558(&block->disp);
    }

    m4aSongNumStart(gUnknown_080DFC78[block->unk48]);
    gCurTask->main = Task_8075A90;
}

void Task_8075C6C(void)
{
    Sprite_NoteBlock *block = TaskGetStructPtr(gCurTask);
    if (sub_8075D98(block)) {
        sub_8075B50(block);
    }

    if (sub_8075D58(block)) {
        sub_8075DE8(block);
    } else {
        NoteBlock_UpdatePosition(block);

        if (block->unk4B != 0) {
            sub_8075D28(block);
        }
    }
}

void TaskDestructor_8075CC0(struct Task *UNUSED t) { }

void sub_8075CC4(Sprite_NoteBlock *block)
{
    if (block->unk4B != 0) {
        gCurTask->main = Task_8075C6C;
    } else {
        sub_8075DE8(block);
    }
}

void NoteBlock_UpdatePosition(Sprite_NoteBlock *block)
{
    Sprite *s = &block->disp;

    s->x = block->posX - gCamera.x + Q_24_8_TO_INT(block->unk44);
    s->y = block->posY - gCamera.y + Q_24_8_TO_INT(block->unk46);
}

void sub_8075D28(Sprite_NoteBlock *block)
{
    Sprite *s = &block->disp;

    s->unk10 |= 0x400;
    sub_80051E8(s);

    s->unk10 &= ~0x400;
    sub_80051E8(s);
}

bool32 sub_8075D58(Sprite_NoteBlock *block)
{
    s32 screenX, screenY;
    u16 otherX, otherY;

#ifndef NON_MATCHING
    s32 r1;
    register s32 r4 asm("r4");
    screenX = block->posX;
    r1 = 256;
    r4 = r1;
    asm("" ::"r"(r1));
    screenX += r4;
    screenX -= gCamera.x;

    screenY = block->posY + r4;
    screenY -= gCamera.y;
#else
    screenX = block->posX + 256;
    screenX -= gCamera.x;
    screenX = block->posY + 256;
    screenY -= gCamera.y;
#endif

#ifndef NON_MATCHING
    otherY = screenY;
    otherX = screenX;
    if ((otherX) > 752 || (otherY) > 672) {
#else
    if ((screenX < -256 || screenX > (256 + DISPLAY_WIDTH))
        || (screenY < -256 || screenY > (256 + DISPLAY_HEIGHT))) {
#endif
        return TRUE;
    }

    return FALSE;
}

bool32 sub_8075D98(Sprite_NoteBlock *block)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (block->unk4B != 0)) {
        s32 posX, posY;
        u16 otherX, otherY;
        posX = Q_24_8_TO_INT(gPlayer.x) + 16;
        posX -= block->posX;
        posY = Q_24_8_TO_INT(gPlayer.y) + 24;
        posY -= block->posY;

        otherY = posY;
        otherX = posX;
        if (otherX <= 32 && otherY <= 24)
            return TRUE;
    }

    return FALSE;
}

void sub_8075DE8(Sprite_NoteBlock *block)
{
    block->base.me->x = block->base.spriteX;
    TaskDestroy(gCurTask);
}
