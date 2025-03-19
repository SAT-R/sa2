#include "global.h"
#include "gba/types.h"
#include "malloc_vram.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
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
    /* 0x44 */ u16 framesUntilVisible;
    /* 0x46 */ u16 framesUntilDestroyed;
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

void CreateAngledNoteParticle(s32 posX, s32 posY, u16 framesUntilVisible, u16 framesUntilDestroyed, s16 velocity, u8 quarterAngle, u8 kind)
{
    struct Task *t = TaskCreate(Task_8080DB8, sizeof(Sprite_NoteParticle), 0x2010, 0, TaskDestructor_8080EF8);
    Sprite_NoteParticle *np = TASK_DATA(t);
    Sprite *s = &np->s;

    np->posX = posX;
    np->posY = posY;
    np->offsetX = 0;
    np->offsetY = 0;

    np->accelX = I(velocity * Q_2_14_TO_Q_24_8(COS(quarterAngle * 4)));
    np->accelY = I(velocity * Q_2_14_TO_Q_24_8(SIN(quarterAngle * 4)));
    np->framesUntilVisible = framesUntilVisible;
    np->framesUntilDestroyed = framesUntilDestroyed;
    np->kind = kind;

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 6, gUnknown_080E0140[kind][4], 0);

    if (gUnknown_080E0140[kind][3] != 0) {
        s->graphics.dest = VramMalloc(gUnknown_080E0140[kind][2]);
    } else {
        s->graphics.dest = (void *)(OBJ_VRAM0 + gUnknown_080E0140[kind][2] * TILE_SIZE_4BPP);
    }

    s->graphics.anim = gUnknown_080E0140[kind][0];
    s->variant = gUnknown_080E0140[kind][1];
    UpdateSpriteAnimation(s);
}

void CreateNoteParticle(s32 posX, s32 posY, u16 framesUntilVisible, u16 framesUntilDestroyed, s16 accelX, s16 accelY, u8 kind)
{
    struct Task *t = TaskCreate(Task_8080E54, sizeof(Sprite_NoteParticle), 0x2010, 0, TaskDestructor_8080EF8);
    Sprite_NoteParticle *np = TASK_DATA(t);
    Sprite *s = &np->s;

    np->posX = posX;
    np->posY = posY;
    np->offsetX = 0;
    np->offsetY = 0;

    np->accelX = accelX;
    np->accelY = accelY;
    np->framesUntilVisible = framesUntilVisible;
    np->framesUntilDestroyed = framesUntilDestroyed;
    np->kind = kind;

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 6, gUnknown_080E0140[kind][4], 0);

    if (gUnknown_080E0140[kind][3] != 0) {
        s->graphics.dest = VramMalloc(gUnknown_080E0140[kind][2]);
    } else {
        s->graphics.dest = (void *)(OBJ_VRAM0 + gUnknown_080E0140[kind][2] * TILE_SIZE_4BPP);
    }

    s->graphics.anim = gUnknown_080E0140[kind][0];
    s->variant = gUnknown_080E0140[kind][1];
}

static void Task_8080DB8(void)
{
    struct Task *t = gCurTask;
    Sprite_NoteParticle *np = TASK_DATA(t);
    if (--np->framesUntilDestroyed == (u16)-1) {
        TaskDestroy(t);
    } else {
        np->offsetX += np->accelX;
        np->offsetY += np->accelY;
        np->s.x = (np->posX - gCamera.x) + I(np->offsetX);
        np->s.y = (np->posY - gCamera.y) + I(np->offsetY);
        UpdateSpriteAnimation(&np->s);

        if (np->framesUntilVisible == 0) {
            DisplaySprite(&np->s);
        } else {
            np->framesUntilVisible--;
        }
    }
}

static void Task_8080E54(void)
{
    struct Task *t = gCurTask;
    Sprite_NoteParticle *np = TASK_DATA(t);
    if (--np->framesUntilDestroyed == (u16)-1) {
        TaskDestroy(t);
    } else {
        np->offsetX += np->accelX;
        np->offsetY += np->accelY;

        // TODO: Remove magic number
        np->accelY += Q_8_8(1. / 6.);

        np->s.x = (np->posX - gCamera.x) + I(np->offsetX);
        np->s.y = (np->posY - gCamera.y) + I(np->offsetY);
        UpdateSpriteAnimation(&np->s);

        if (np->framesUntilVisible == 0) {
            DisplaySprite(&np->s);
        } else {
            np->framesUntilVisible--;
        }
    }
}

static void TaskDestructor_8080EF8(struct Task *t)
{
    Sprite_NoteParticle *np = TASK_DATA(t);
    if (gUnknown_080E0140[np->kind][3] != 0) {
        VramFree(np->s.graphics.dest);
    }
}