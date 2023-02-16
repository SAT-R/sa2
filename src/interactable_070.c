#include "global.h"
#include "interactable_070.h"
#include "trig.h"
#include "game.h"
#include "m4a.h"

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
} Sprite_IA70;

static void Task_Interactable070(void);
static void TaskDestructor_Interactable070(struct Task *);
static void sub_8079CCC(Sprite_IA70 *);
static bool32 sub_8079D60(Sprite_IA70 *);
static void sub_8079D9C(Sprite_IA70 *);
static void sub_8079D00(Sprite_IA70 *);
static void sub_8079D30(Sprite_IA70 *);

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

static const u16 sNoteBlockSfx[] = {
    SE_TECHNO_BASE_NOTE_BLOCK,
    SE_TECHNO_BASE_NOTE_BLOCK,
    SE_TECHNO_BASE_NOTE_BLOCK,
};

void initSprite_Interactable070(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable070, sizeof(Sprite_IA70), 0x2010, 0,
                                TaskDestructor_Interactable070);
    Sprite_IA70 *ia70 = TaskGetStructPtr(t);
    Sprite *sprite = &ia70->sprite;
    ia70->unk44 = 0;
    ia70->unk48 = 0;
    ia70->unk4C = ia->d.uData[0];

    ia70->base.regionX = spriteRegionX;
    ia70->base.regionY = spriteRegionY;
    ia70->base.ia = ia;
    ia70->base.spriteX = ia->x;
    ia70->base.spriteY = spriteY;

    sprite = &ia70->sprite;
    sprite->unk1A = 0x480;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 0;
    sprite->unk28[0].unk0 = -1;
    sprite->unk10 = 0x2000;
    sprite->graphics.dest = (void *)OBJ_VRAM0 + sNoteBlockAssets[ia70->unk4C][2] * 0x20;
    sprite->graphics.anim = sNoteBlockAssets[ia70->unk4C][0];
    sprite->variant = sNoteBlockAssets[ia70->unk4C][1];

    ia70->unk3C = ia->x * 8 + Q_24_8(spriteRegionX);
    ia70->unk40 = ia->y * 8 + Q_24_8(spriteRegionY);

    SET_SPRITE_INITIALIZED(ia);
    sub_8004558(sprite);
}

static void sub_80799FC(void)
{
    Sprite_IA70 *ia70 = TaskGetStructPtr(gCurTask);

    switch (ia70->unk4E++) {
        case 0:
            ia70->unk44 = Q_2_14_TO_Q_24_8(COS(ia70->unk4D * 4)) * 8;
            ia70->unk48 = Q_2_14_TO_Q_24_8(SIN(ia70->unk4D * 4)) * 8;
            break;
        case 4:
            ia70->unk44 = Q_2_14_TO_Q_24_8(COS(ia70->unk4D * 4)) * -2;
            ia70->unk48 = Q_2_14_TO_Q_24_8(SIN(ia70->unk4D * 4)) * -2;
            break;
        case 6:
            ia70->unk44 = 0;
            ia70->unk48 = 0;
            sub_8079D9C(ia70);
            return;
    }
    sub_8079D00(ia70);
    sub_8079D30(ia70);
}

static bool32 sub_8079AC4(Sprite_IA70 *ia70)
{
    u32 temp;
    s32 temp1, temp2;
    u16 temp3, temp4;

    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        temp1 = Q_24_8_TO_INT(gPlayer.x);
        temp1 += 24;
        temp1 -= ia70->unk3C;

        temp2 = Q_24_8_TO_INT(gPlayer.y);
        temp2 += 16;
        temp2 -= ia70->unk40;

        temp4 = temp2;
        temp3 = temp1;

        if (temp3 < 49 && temp4 < 33) {
            s16 speedGround = gPlayer.speedGroundX;

            temp = sub_800CDBC(&ia70->sprite, ia70->unk3C, ia70->unk40, &gPlayer);
            if (temp == 0) {
                return 0;
            }

            if (temp & 0x10000) {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = gUnknown_080E001A[ia70->unk4C][1];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                ia70->unk4D = 0xC0;
            } else if (temp & 0x40000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = gUnknown_080E001A[ia70->unk4C][0];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                ia70->unk4D = 0x80;
            } else if (temp & 0x80000) {
                gPlayer.x += (s16)(temp & 0xFF00);
                gPlayer.speedAirX = gUnknown_080E001A[ia70->unk4C][2];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                ia70->unk4D = 0;
            } else {
                gPlayer.y += Q_8_8(temp);
                gPlayer.speedAirY = gUnknown_080E001A[ia70->unk4C][3];
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
                ia70->unk4D = 0x40;
            }

            if (gPlayer.moveState & MOVESTATE_IN_AIR) {
                gPlayer.moveState &= ~MOVESTATE_100;
            } else {
                gPlayer.speedGroundX = speedGround;
                gPlayer.unk64 = 4;
                gPlayer.unk6D = 5;
            }

            if (gPlayer.unk3C == &ia70->sprite) {
                gPlayer.unk3C = NULL;
                gPlayer.moveState &= ~MOVESTATE_8;
            }

            return TRUE;
        }
    }
    return FALSE;
}

static void Task_Interactable070(void)
{
    Sprite_IA70 *ia70 = TaskGetStructPtr(gCurTask);

    if (sub_8079AC4(ia70)) {
        sub_8079CCC(ia70);
    }

    if (sub_8079D60(ia70)) {
        sub_8079D9C(ia70);
    } else {
        sub_8079D00(ia70);
        sub_8079D30(ia70);
    }
}

static void TaskDestructor_Interactable070(struct Task *t)
{
    // unused
}

static void sub_8079CCC(Sprite_IA70 *ia70)
{
    ia70->unk4E = 0;
    m4aSongNumStart(sNoteBlockSfx[ia70->unk4C]);
    gCurTask->main = sub_80799FC;
}

static void sub_8079D00(Sprite_IA70 *ia70)
{
    Sprite *sprite = &ia70->sprite;

    sprite->x = ia70->unk3C - gCamera.x + Q_24_8_TO_INT(ia70->unk44);
    sprite->y = ia70->unk40 - gCamera.y + Q_24_8_TO_INT(ia70->unk48);
}

static void sub_8079D30(Sprite_IA70 *ia70)
{
    Sprite *sprite = &ia70->sprite;

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    sprite->unk10 &= ~0x400;
    sub_80051E8(sprite);
}

static bool32 sub_8079D60(Sprite_IA70 *ia70)
{
    s32 temp, temp2;
    u16 temp3, temp4;

    temp = ia70->unk3C;
    temp += 128;
    temp -= gCamera.x;

    temp2 = ia70->unk40;
    temp2 += 128;
    temp2 -= gCamera.y;

    temp4 = temp2;
    temp3 = temp;

    if (temp3 > 496 || temp4 > 416) {
        return TRUE;
    }
    return FALSE;
}

static void sub_8079D9C(Sprite_IA70 *ia70)
{
    ia70->base.ia->x = ia70->base.spriteX;
    TaskDestroy(gCurTask);
}
