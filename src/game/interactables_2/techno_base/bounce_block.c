#include "global.h"
#include "game/interactables_2/music_plant/note_block.h"
#include "trig.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/game.h"
#include "lib/m4a.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    Sprite s;
    s32 unk3C;
    s32 unk40;
    s32 unk44;
    s32 unk48;
    u8 unk4C;
    u8 unk4D;
    u8 unk4E;
} Sprite_TecBaseNoteBlock;

static void Task_NoteBlock(void);
static void TaskDestructor_NoteBlock(struct Task *);
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

void CreateEntity_NoteBlock(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                            u8 spriteY)
{
    struct Task *t = TaskCreate(Task_NoteBlock, sizeof(Sprite_TecBaseNoteBlock), 0x2010,
                                0, TaskDestructor_NoteBlock);
    Sprite_TecBaseNoteBlock *noteBlock = TASK_DATA(t);
    Sprite *s = &noteBlock->s;
    noteBlock->unk44 = 0;
    noteBlock->unk48 = 0;
    noteBlock->unk4C = me->d.uData[0];

    noteBlock->base.regionX = spriteRegionX;
    noteBlock->base.regionY = spriteRegionY;
    noteBlock->base.me = me;
    noteBlock->base.spriteX = me->x;
    noteBlock->base.spriteY = spriteY;

    s = &noteBlock->s;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2000;
    s->graphics.dest = (void *)OBJ_VRAM0 + sNoteBlockAssets[noteBlock->unk4C][2] * 0x20;
    s->graphics.anim = sNoteBlockAssets[noteBlock->unk4C][0];
    s->variant = sNoteBlockAssets[noteBlock->unk4C][1];

    noteBlock->unk3C = TO_WORLD_POS(me->x, spriteRegionX);
    noteBlock->unk40 = TO_WORLD_POS(me->y, spriteRegionY);

    SET_MAP_ENTITY_INITIALIZED(me);
    UpdateSpriteAnimation(s);
}

static void sub_80799FC(void)
{
    Sprite_TecBaseNoteBlock *noteBlock = TASK_DATA(gCurTask);

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

            temp = sub_800CDBC(&noteBlock->s, noteBlock->unk3C, noteBlock->unk40,
                               &gPlayer);
            if (temp == 0) {
                return 0;
            }

            if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = gUnknown_080E001A[noteBlock->unk4C][1];
                gPlayer.unk64 = 4;
                gPlayer.transition = PLTRANS_PT5;
                noteBlock->unk4D = 0xC0;
            } else if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = gUnknown_080E001A[noteBlock->unk4C][0];
                gPlayer.unk64 = 4;
                gPlayer.transition = PLTRANS_PT5;
                noteBlock->unk4D = 0x80;
            } else if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = gUnknown_080E001A[noteBlock->unk4C][2];
                gPlayer.unk64 = 4;
                gPlayer.transition = PLTRANS_PT5;
                noteBlock->unk4D = 0;
            } else {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = gUnknown_080E001A[noteBlock->unk4C][3];
                gPlayer.unk64 = 4;
                gPlayer.transition = PLTRANS_PT5;
                noteBlock->unk4D = 0x40;
            }

            if (gPlayer.moveState & MOVESTATE_IN_AIR) {
                gPlayer.moveState &= ~MOVESTATE_100;
            } else {
                gPlayer.speedGroundX = speedGround;
                gPlayer.unk64 = 4;
                gPlayer.transition = PLTRANS_PT5;
            }

            if (gPlayer.unk3C == &noteBlock->s) {
                gPlayer.unk3C = NULL;
                gPlayer.moveState &= ~MOVESTATE_8;
            }

            return TRUE;
        }
    }
    return FALSE;
}

static void Task_NoteBlock(void)
{
    Sprite_TecBaseNoteBlock *noteBlock = TASK_DATA(gCurTask);

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

static void TaskDestructor_NoteBlock(struct Task *t)
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
    Sprite *s = &noteBlock->s;

    s->x = noteBlock->unk3C - gCamera.x + Q_24_8_TO_INT(noteBlock->unk44);
    s->y = noteBlock->unk40 - gCamera.y + Q_24_8_TO_INT(noteBlock->unk48);
}

static void sub_8079D30(Sprite_TecBaseNoteBlock *noteBlock)
{
    Sprite *s = &noteBlock->s;

    s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);

    s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
    DisplaySprite(s);
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
    noteBlock->base.me->x = noteBlock->base.spriteX;
    TaskDestroy(gCurTask);
}
