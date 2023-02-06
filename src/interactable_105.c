#include "global.h"
#include "gba/types.h"
#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "interactable_105.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u16 offsetX;
    /* 0x0A */ u16 offsetY;
    /* 0x0C */ u16 width;
    /* 0x0E */ u16 height;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_IA105;

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
static const u16 gUnknown_080E0140[4][5] = {
    [0] = { SA2_ANIM_NOTE_PARTICLES, 0, 0x1B9, 0, (4 | 2) },
    [1] = { SA2_ANIM_NOTE_PARTICLES, 1, 0x1BB, 0, (4 | 2) },
    [2] = { SA2_ANIM_YELLOW_STAR, 0, 0x004, 1, (4 | 2) },
    [3] = { SA2_ANIM_SMOKE, 0, 0x006, 1, (0 | 2) },
};

extern bool32 sub_800CBA4(Player *);

static void Task_Interactable105(void);
static void TaskDestructor_Interactable105(struct Task *t);
static bool32 sub_80809B8(Sprite_IA105 *);
static bool32 sub_8080A9C(Sprite_IA105 *);
static void sub_8080AE4(Sprite_IA105 *);
static void Task_8080DB8(void);
static void Task_8080E54(void);
static void TaskDestructor_8080EF8(struct Task *);

void initSprite_Interactable105(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable105, sizeof(Sprite_IA105), 0x1FF0, 0,
                                TaskDestructor_Interactable105);
    Sprite_IA105 *sprite = TaskGetStructPtr(t);

    sprite->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    sprite->offsetX = ia->d.sData[0] * TILE_WIDTH;
    sprite->offsetY = ia->d.sData[1] * TILE_WIDTH;
    sprite->width = ia->d.uData[2] * TILE_WIDTH + sprite->offsetX;
    sprite->height = ia->d.uData[3] * TILE_WIDTH + sprite->offsetY;
    sprite->ia = ia;
    sprite->spriteX = ia->x;
    sprite->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

static bool32 sub_80809B8(Sprite_IA105 *sprite)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s16 someX, someY;
        screenX = (sprite->posX + sprite->offsetX) - gCamera.x;
        screenY = (sprite->posY + sprite->offsetY) - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        someX = sprite->width - sprite->offsetX;
        someY = sprite->height - sprite->offsetY;

        if ((screenX <= playerX) && (screenX + someX >= playerX) && (screenY <= playerY)
            && (screenY + someY >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

static void Task_Interactable105(void)
{
    Sprite_IA105 *sprite = TaskGetStructPtr(gCurTask);

    if (sub_80809B8(sprite)) {
        sub_800CBA4(&gPlayer);
    }

    if (sub_8080A9C(sprite)) {
        sub_8080AE4(sprite);
    }
}

static void TaskDestructor_Interactable105(struct Task UNUSED *t) { }

bool32 sub_8080A9C(Sprite_IA105 *sprite)
{
    s16 screenX, screenY;
    screenX = sprite->posX - gCamera.x;
    screenY = sprite->posY - gCamera.y;

    // TODO: Use 'IS_OUT_OF_RANGE' instead of 'IS_OUT_OF_RANGE_'
    //       (Fix that in game.h)
    if (IS_OUT_OF_RANGE_(0, screenX, screenY, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8080AE4(Sprite_IA105 *sprite)
{
    sprite->ia->x = sprite->spriteX;
    TaskDestroy(gCurTask);
}

// Public, called in interactable_music_plant_german_flute.o
void sub_8080AFC(s32 p0, s32 p1, u16 p2, u16 p3, s16 p4, u8 p5, u8 p6)
{
    struct Task *t = TaskCreate(Task_8080DB8, sizeof(Sprite_NoteParticle), 0x2010, 0,
                                TaskDestructor_8080EF8);
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    sprite->posX = p0;
    sprite->posY = p1;
    sprite->offsetX = 0;
    sprite->offsetY = 0;

    sprite->accelX = Q_24_8_TO_INT(p4 * Q_2_14_TO_Q_24_8(COS(p5 * 4)));
    sprite->accelY = Q_24_8_TO_INT(p4 * Q_2_14_TO_Q_24_8(SIN(p5 * 4)));
    sprite->unk44 = p2;
    sprite->unk46 = p3;
    sprite->kind = p6;

    sprite->s.unk1A = 0x180;
    sprite->s.graphics.size = 0;
    sprite->s.unk14 = 0;
    sprite->s.unk1C = 0;
    sprite->s.unk21 = 0xFF;
    sprite->s.unk22 = 0x10;
    sprite->s.focused = 0;
    sprite->s.unk28->unk0 = -1;

    sprite->s.unk10 = gUnknown_080E0140[p6][4] << 12;

    if (gUnknown_080E0140[p6][3] != 0) {
        sprite->s.graphics.dest = VramMalloc(gUnknown_080E0140[p6][2]);
    } else {
        sprite->s.graphics.dest
            = (void *)(OBJ_VRAM0 + gUnknown_080E0140[p6][2] * TILE_SIZE_4BPP);
    }

    sprite->s.graphics.anim = gUnknown_080E0140[p6][0];
    sprite->s.variant = gUnknown_080E0140[p6][1];
    sub_8004558(&sprite->s);
}

void sub_8080C78(s32 p0, s32 p1, u16 p2, u16 p3, u16 p4, u16 p5, u8 p6)
{
    struct Task *t = TaskCreate(Task_8080E54, sizeof(Sprite_NoteParticle), 0x2010, 0,
                                TaskDestructor_8080EF8);
    Sprite_NoteParticle *sprite = TaskGetStructPtr(t);
    sprite->posX = p0;
    sprite->posY = p1;
    sprite->offsetX = 0;
    sprite->offsetY = 0;

    sprite->accelX = p4;
    sprite->accelY = p5;
    sprite->unk44 = p2;
    sprite->unk46 = p3;
    sprite->kind = p6;

    sprite->s.unk1A = 0x180;
    sprite->s.graphics.size = 0;
    sprite->s.unk14 = 0;
    sprite->s.unk1C = 0;
    sprite->s.unk21 = 0xFF;
    sprite->s.unk22 = 0x10;
    sprite->s.focused = 0;
    sprite->s.unk28->unk0 = -1;

    sprite->s.unk10 = gUnknown_080E0140[p6][4] << 12;

    if (gUnknown_080E0140[p6][3] != 0) {
        sprite->s.graphics.dest = VramMalloc(gUnknown_080E0140[p6][2]);
    } else {
        sprite->s.graphics.dest
            = (void *)(OBJ_VRAM0 + gUnknown_080E0140[p6][2] * TILE_SIZE_4BPP);
    }

    sprite->s.graphics.anim = gUnknown_080E0140[p6][0];
    sprite->s.variant = gUnknown_080E0140[p6][1];
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