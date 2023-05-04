#include "global.h"
#include "gba/types.h"
#include "malloc_vram.h"

#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "game/interactables_2/note_particle.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 posX;
    /* 0x34 */ s32 posY;
    /* 0x38 */ s32 offsetX;
    /* 0x3C */ s32 offsetY;
    /* 0x40 */ s16 accelX;
    /* 0x42 */ s16 accelY;
    /* 0x44 */ u16 unk44;
    /* 0x46 */ u16 unk46;
    /* 0x48 */ u8 kind;
} Sprite_NoteParticle; /* size: 0x4C */

/* {anim, variant, tileCount, shouldAllocTileMem(?), (unk | priority)} */
static const ALIGNED(4) u16 gUnknown_080E0140[4][5] = {
    [0] = { SA2_ANIM_NOTE_PARTICLES, SA2_ANIM_VARIANT_NOTE_H, 0x1B9, 0, (4 | 2) },
    [1] = { SA2_ANIM_NOTE_PARTICLES, SA2_ANIM_VARIANT_NOTE_V, 0x1BB, 0, (4 | 2) },
    [2] = { SA2_ANIM_YELLOW_STAR, 0, 0x004, 1, (4 | 2) },
    [3] = { SA2_ANIM_SMOKE, 0, 0x006, 1, (0 | 2) },
};

static void Task_8080DB8(void);
static void Task_8080E54(void);
static void TaskDestructor_8080EF8(struct Task *);

void sub_8080AFC(s32 posX, s32 posY, u16 p2, u16 p3, s16 velocity, u8 quarterAngle,
                 u8 kind)
{
    struct Task *t = TaskCreate(Task_8080DB8, sizeof(Sprite_NoteParticle), 0x2010, 0,
                                TaskDestructor_8080EF8);
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    sprite->posX = posX;
    sprite->posY = posY;
    sprite->offsetX = 0;
    sprite->offsetY = 0;

    sprite->accelX = Q_24_8_TO_INT(velocity * Q_2_14_TO_Q_24_8(COS(quarterAngle * 4)));
    sprite->accelY = Q_24_8_TO_INT(velocity * Q_2_14_TO_Q_24_8(SIN(quarterAngle * 4)));
    sprite->unk44 = p2;
    sprite->unk46 = p3;
    sprite->kind = kind;

    sprite->s.unk1A = 0x180;
    sprite->s.graphics.size = 0;
    sprite->s.unk14 = 0;
    sprite->s.unk1C = 0;
    sprite->s.unk21 = 0xFF;
    sprite->s.unk22 = 0x10;
    sprite->s.focused = 0;
    sprite->s.unk28->unk0 = -1;

    sprite->s.unk10 = gUnknown_080E0140[kind][4] << 12;

    if (gUnknown_080E0140[kind][3] != 0) {
        sprite->s.graphics.dest = VramMalloc(gUnknown_080E0140[kind][2]);
    } else {
        sprite->s.graphics.dest
            = (void *)(OBJ_VRAM0 + gUnknown_080E0140[kind][2] * TILE_SIZE_4BPP);
    }

    sprite->s.graphics.anim = gUnknown_080E0140[kind][0];
    sprite->s.variant = gUnknown_080E0140[kind][1];
    sub_8004558(&sprite->s);
}

void sub_8080C78(s32 p0, s32 p1, u16 p2, u16 p3, s16 accelX, s16 accelY, u8 kind)
{
    struct Task *t = TaskCreate(Task_8080E54, sizeof(Sprite_NoteParticle), 0x2010, 0,
                                TaskDestructor_8080EF8);
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    sprite->posX = p0;
    sprite->posY = p1;
    sprite->offsetX = 0;
    sprite->offsetY = 0;

    sprite->accelX = accelX;
    sprite->accelY = accelY;
    sprite->unk44 = p2;
    sprite->unk46 = p3;
    sprite->kind = kind;

    sprite->s.unk1A = 0x180;
    sprite->s.graphics.size = 0;
    sprite->s.unk14 = 0;
    sprite->s.unk1C = 0;
    sprite->s.unk21 = 0xFF;
    sprite->s.unk22 = 0x10;
    sprite->s.focused = 0;
    sprite->s.unk28->unk0 = -1;

    sprite->s.unk10 = gUnknown_080E0140[kind][4] << 12;

    if (gUnknown_080E0140[kind][3] != 0) {
        sprite->s.graphics.dest = VramMalloc(gUnknown_080E0140[kind][2]);
    } else {
        sprite->s.graphics.dest
            = (void *)(OBJ_VRAM0 + gUnknown_080E0140[kind][2] * TILE_SIZE_4BPP);
    }

    sprite->s.graphics.anim = gUnknown_080E0140[kind][0];
    sprite->s.variant = gUnknown_080E0140[kind][1];
}

static void Task_8080DB8(void)
{
    struct Task *t = gCurTask;
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    if (--sprite->unk46 == (u16)-1) {
        TaskDestroy(t);
    } else {
        sprite->offsetX += sprite->accelX;
        sprite->offsetY += sprite->accelY;
        sprite->s.x = (sprite->posX - gCamera.x) + Q_24_8_TO_INT(sprite->offsetX);
        sprite->s.y = (sprite->posY - gCamera.y) + Q_24_8_TO_INT(sprite->offsetY);
        sub_8004558(&sprite->s);

        if (sprite->unk44 == 0) {
            sub_80051E8(&sprite->s);
        } else {
            sprite->unk44--;
        }
    }
}

static void Task_8080E54(void)
{
    struct Task *t = gCurTask;
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    if (--sprite->unk46 == (u16)-1) {
        TaskDestroy(t);
    } else {
        sprite->offsetX += sprite->accelX;
        sprite->offsetY += sprite->accelY;

        // TODO: Remove magic number
        sprite->accelY += Q_8_8(1. / 6.);

        sprite->s.x = (sprite->posX - gCamera.x) + Q_24_8_TO_INT(sprite->offsetX);
        sprite->s.y = (sprite->posY - gCamera.y) + Q_24_8_TO_INT(sprite->offsetY);
        sub_8004558(&sprite->s);

        if (sprite->unk44 == 0) {
            sub_80051E8(&sprite->s);
        } else {
            sprite->unk44--;
        }
    }
}

static void TaskDestructor_8080EF8(struct Task *t)
{
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    if (gUnknown_080E0140[sprite->kind][3] != 0) {
        VramFree(sprite->s.graphics.dest);
    }
}