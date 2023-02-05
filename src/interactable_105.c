#include "global.h"
#include "gba/types.h"
#include "malloc_vram.h"

#include "game.h"
#include "interactable.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "interactable_105.h"

#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ u16 unkE;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_IA105;

extern void Task_Interactable105(void);
extern void TaskDestructor_Interactable105(struct Task *t);

extern bool32 sub_80809B8(Sprite_IA105 *);
extern bool32 sub_8080A9C(Sprite_IA105 *);
extern void sub_8080AE4(Sprite_IA105 *);
extern void Task_8080DB8(void);
extern void TaskDestructor_8080EF8(struct Task *);

extern bool32 sub_800CBA4(Player *);

void initSprite_Interactable105(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable105, sizeof(Sprite_IA105), 0x1FF0, 0,
                                TaskDestructor_Interactable105);
    Sprite_IA105 *sprite = TaskGetStructPtr(t);

    sprite->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    sprite->unk8 = ia->d.sData[0] * TILE_WIDTH;
    sprite->unkA = ia->d.sData[1] * TILE_WIDTH;
    sprite->unkC = ia->d.uData[2] * TILE_WIDTH + sprite->unk8;
    sprite->unkE = ia->d.uData[3] * TILE_WIDTH + sprite->unkA;
    sprite->ia = ia;
    sprite->spriteX = ia->x;
    sprite->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

bool32 sub_80809B8(Sprite_IA105 *sprite)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s16 screenX, screenY;
        s16 playerX, playerY;
        s16 someX, someY;
        screenX = sprite->posX + sprite->unk8 - gCamera.x;
        screenY = sprite->posY + sprite->unkA - gCamera.y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        someX = sprite->unkC - sprite->unk8;
        someY = sprite->unkE - sprite->unkA;

        if ((screenX <= playerX) && (screenX + someX >= playerX) && (screenY <= playerY)
            && (screenY + someY >= playerY)) {
            return TRUE;
        }
    }

    return FALSE;
}

void Task_Interactable105(void)
{
    Sprite_IA105 *sprite = TaskGetStructPtr(gCurTask);

    if (sub_80809B8(sprite)) {
        sub_800CBA4(&gPlayer);
    }

    if (sub_8080A9C(sprite)) {
        sub_8080AE4(sprite);
    }
}

void TaskDestructor_Interactable105(struct Task UNUSED *t) { }

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

void sub_8080AE4(Sprite_IA105 *sprite)
{
    sprite->ia->x = sprite->spriteX;
    TaskDestroy(gCurTask);
}

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ s32 unk30;
    /* 0x34 */ s32 unk34;
    /* 0x38 */ s32 unk38;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ s16 unk40;
    /* 0x42 */ s16 unk42;
    /* 0x44 */ s16 unk44;
    /* 0x46 */ s16 unk46;
    /* 0x48 */ u8 unk48;
} Sprite_Unknown_IA105; /* size: 0x4C */

// TODO: Make static
const u16 gUnknown_080E0140[4][5] = {
    [0] = { 0x240, 0, 0x1B9, 0, (4 | 2) },
    [1] = { 0x240, 1, 0x1BB, 0, (4 | 2) },
    [2] = { 0x241, 0, 0x004, 1, (4 | 2) },
    [3] = { 0x242, 0, 0x006, 1, (0 | 2) },
};

#if 1
// Public, called in interactable_music_plant_german_flute.o
void sub_8080AFC(s32 p0, s32 p1, u16 p2, u16 p3, s16 p4, u8 p5, u8 p6)
{
    struct Task *t = TaskCreate(Task_8080DB8, sizeof(Sprite_Unknown_IA105), 0x2010, 0,
                                TaskDestructor_8080EF8);
    Sprite_Unknown_IA105 *sprite = TaskGetStructPtr(t);
    sprite->unk30 = p0;
    sprite->unk34 = p1;
    sprite->unk38 = 0;
    sprite->unk3C = 0;

    {
        sprite->unk40 = Q_24_8_TO_INT(p4 * Q_2_14_TO_Q_24_8(COS(p5 * 4)));
        sprite->unk42 = Q_24_8_TO_INT(p4 * Q_2_14_TO_Q_24_8(SIN(p5 * 4)));
        sprite->unk44 = p2;
        sprite->unk46 = p3;
        sprite->unk48 = p6;

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
}
#endif