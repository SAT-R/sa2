#include "global.h"
#include "interactable_tec_base_note_block.h"
#include "trig.h"
#include "game.h"
#include "lib/m4a.h"

#include "constants/move_states.h"
#include "constants/songs.h"
#include "constants/animations.h"

typedef struct {
    SpriteBase base;
    Sprite sprite;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    u8 unk4C;
    u8 unk4D;
    u8 unk4E;
} Sprite_TecBaseNoteBlock;

static void Task_InteractableTecBaseNoteBlock(void);
static void TaskDestructor_InteractableTecBaseNoteBlock(struct Task *);
static void sub_8079CCC(Sprite_TecBaseNoteBlock *);
static bool32 sub_8079D60(Sprite_TecBaseNoteBlock *);
static void sub_8079D9C(Sprite_TecBaseNoteBlock *);
static void sub_8079D00(Sprite_TecBaseNoteBlock *);
static void sub_8079D30(Sprite_TecBaseNoteBlock *);

static const u16 sNoteBlockAssets[][3] = {
    { SA2_ANIM_NOTE_BLOCK_TEC_BASE, 0, 0x14C },
    { SA2_ANIM_NOTE_BLOCK_TEC_BASE, 1, 0x154 },
    { SA2_ANIM_NOTE_BLOCK_TEC_BASE, 2, 0x15C },
};
static const u16 gUnknown_080E001A[][4] = {
    { Q_8_8(6), Q_8_8(250), Q_8_8(250), Q_8_8(6) },
    { Q_8_8(7), Q_8_8(249), Q_8_8(249), Q_8_8(7) },
    { Q_8_8(8), Q_8_8(248), Q_8_8(248), Q_8_8(8) },
};

static const u16 sTecBasBlockSfx[] = {
    SE_TECHNO_BASE_COMMON,
    SE_TECHNO_BASE_COMMON,
    SE_TECHNO_BASE_COMMON,
};

void initSprite_InteractableTecBaseNoteBlock(Interactable *ia, u16 spriteRegionX,
                                             u16 spriteRegionY, u8 spriteY)
{
    struct Task *t
        = TaskCreate(Task_InteractableTecBaseNoteBlock, sizeof(Sprite_TecBaseNoteBlock),
                     0x2010, 0, TaskDestructor_InteractableTecBaseNoteBlock);
    Sprite_TecBaseNoteBlock *noteBlock = TaskGetStructPtr(t);
    Sprite *sprite = &noteBlock->sprite;
    noteBlock->unk44 = 0;
    noteBlock->unk48 = 0;
    noteBlock->unk4C = ia->d.uData[0];

    noteBlock->base.regionX = spriteRegionX;
    noteBlock->base.regionY = spriteRegionY;
    noteBlock->base.ia = ia;
    noteBlock->base.spriteX = ia->x;
    noteBlock->base.spriteY = spriteY;

    sprite = &noteBlock->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest
        = (void *)OBJ_VRAM0 + sNoteBlockAssets[noteBlock->unk4C][2] * 0x20;
    sprite->graphics.anim = sNoteBlockAssets[noteBlock->unk4C][0];
    sprite->variant = sNoteBlockAssets[noteBlock->unk4C][1];

    noteBlock->unk3C = SpriteGetScreenPos(ia->x, spriteRegionX);
    noteBlock->unk40 = SpriteGetScreenPos(ia->y, spriteRegionY);

    SET_SPRITE_INITIALIZED(ia);
    sub_8004558(sprite);
}

static void sub_80799FC(void)
{
    Sprite_TecBaseNoteBlock *noteBlock = TaskGetStructPtr(gCurTask);

    switch (noteBlock->unk4E++) {
        case 0:
            noteBlock->unk44 = Q_2_14_TO_Q_24_8(COS(noteBlock->unk4D * 4)) * 8;
            noteBlock->unk48 = Q_2_14_TO_Q_24_8(SIN(noteBlock->unk4D * 4)) * 8;
            break;
        case 4:
            noteBlock->unk44 = Q_2_14_TO_Q_24_8(COS(noteBlock->unk4D * 4)) * -2;
            noteBlock->unk48 = Q_2_14_TO_Q_24_8(SIN(noteBlock->unk4D * 4)) * -2;
            break;
        case 6:
            noteBlock->unk44 = 0;
            noteBlock->unk48 = 0;
            sub_8079D9C(noteBlock);
            return;
    }
    sub_8079D00(noteBlock);
    sub_8079D30(noteBlock);
}

static bool32 sub_8079AC4(Sprite_TecBaseNoteBlock *noteBlock)
{
    u32 temp;
    s32 temp1, temp2;
    u16 temp3, temp4;

    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        temp1 = Q_24_8_TO_INT(gPlayer.x);
        temp1 += 24;
        temp1 -= noteBlock->unk3C;

        temp2 = Q_24_8_TO_INT(gPlayer.y);
        temp2 += 16;
        temp2 -= noteBlock->unk40;

        temp4 = temp2;
        temp3 = temp1;

        if (temp3 < 49 && temp4 < 33) {
            s16 speedGround = gPlayer.speedGroundX;

            temp = sub_800CDBC(&noteBlock->sprite, noteBlock->unk3C, noteBlock->unk40,
                               &gPlayer);
            if (temp == 0) {
                return 0;
            }

            if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = gUnknown_080E001A[noteBlock->unk4C][1];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                noteBlock->unk4D = 0xC0;
            } else if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = gUnknown_080E001A[noteBlock->unk4C][0];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                noteBlock->unk4D = 0x80;
            } else if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = gUnknown_080E001A[noteBlock->unk4C][2];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                noteBlock->unk4D = 0;
            } else {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = gUnknown_080E001A[noteBlock->unk4C][3];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                noteBlock->unk4D = 0x40;
            }

            if (gPlayer.moveState & MOVESTATE_IN_AIR) {
                gPlayer.moveState &= ~MOVESTATE_100;
            } else {
                gPlayer.speedGroundX = speedGround;
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
            }

            if (gPlayer.unk3C == &noteBlock->sprite) {
                gPlayer.unk3C = NULL;
                gPlayer.moveState &= ~MOVESTATE_8;
            }

            return TRUE;
        }
    }
    return FALSE;
}

static void Task_InteractableTecBaseNoteBlock(void)
{
    Sprite_TecBaseNoteBlock *noteBlock = TaskGetStructPtr(gCurTask);

    if (sub_8079AC4(noteBlock)) {
        sub_8079CCC(noteBlock);
    }

    if (sub_8079D60(noteBlock)) {
        sub_8079D9C(noteBlock);
    } else {
        sub_8079D00(noteBlock);
        sub_8079D30(noteBlock);
    }
}

static void TaskDestructor_InteractableTecBaseNoteBlock(struct Task *t)
{
    // unused
}

static void sub_8079CCC(Sprite_TecBaseNoteBlock *noteBlock)
{
    noteBlock->unk4E = 0;
    m4aSongNumStart(sTecBasBlockSfx[noteBlock->unk4C]);
    gCurTask->main = sub_80799FC;
}

static void sub_8079D00(Sprite_TecBaseNoteBlock *noteBlock)
{
    Sprite *sprite = &noteBlock->sprite;

    sprite->x = noteBlock->unk3C - gCamera.x + Q_24_8_TO_INT(noteBlock->unk44);
    sprite->y = noteBlock->unk40 - gCamera.y + Q_24_8_TO_INT(noteBlock->unk48);
}

static void sub_8079D30(Sprite_TecBaseNoteBlock *noteBlock)
{
    Sprite *sprite = &noteBlock->sprite;

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    sprite->unk10 &= ~0x400;
    sub_80051E8(sprite);
}

static bool32 sub_8079D60(Sprite_TecBaseNoteBlock *noteBlock)
{
    s32 temp, temp2;
    u16 temp3, temp4;

    temp = noteBlock->unk3C;
    temp += 128;
    temp -= gCamera.x;

    temp2 = noteBlock->unk40;
    temp2 += 128;
    temp2 -= gCamera.y;

    temp4 = temp2;
    temp3 = temp;

    if (temp3 > 496 || temp4 > 416) {
        return TRUE;
    }
    return FALSE;
}

static void sub_8079D9C(Sprite_TecBaseNoteBlock *noteBlock)
{
    noteBlock->base.ia->x = noteBlock->base.spriteX;
    TaskDestroy(gCurTask);
}
