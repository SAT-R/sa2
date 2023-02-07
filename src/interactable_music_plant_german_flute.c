#include "global.h"
#include "m4a.h"
#include "task.h"
#include "trig.h"

#include "interactable.h"
#include "interactable_music_plant_note_particle.h"

#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ u16 kind;
    /* 0x0E */ u16 timer;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ u8 unk17;
} Sprite_GermanFlute; /* size: 0x18 */

#define NUM_GERMAN_FLUTE_KINDS 4

typedef void (*SomeFunc)(s32, s32, s32);

extern void sub_801EC3C(s32, s32, s32);
extern s32 sub_801F100(s32, s32, s32, s32, SomeFunc);

extern void sub_80218E4(Player *);
extern void sub_8023B5C(Player *, u32);

static void sub_8076928(void);
static void sub_80769E0(void);
static void Task_8076A6C(void);
static void sub_8076B84(Sprite_GermanFlute *);
static bool32 sub_8076BE4(Sprite_GermanFlute *);
static void sub_8076C70(Sprite_GermanFlute *);
static void sub_8076C88(Sprite_GermanFlute UNUSED *);
static void sub_8076CC0(Sprite_GermanFlute UNUSED *);
static void sub_8076CF4(Sprite_GermanFlute UNUSED *);
static void sub_8076D08(Sprite_GermanFlute UNUSED *);
static void Task_Interactable_MusicPlant_GermanFlute(void);
static void Task_8076DE8(void);
static void TaskDestructor_Interactable_MusicPlant_GermanFlute(struct Task *);
static void sub_8076E3C(Sprite_GermanFlute *);
static bool32 sub_8076EAC(Sprite_GermanFlute *);
static void sub_8076EF4(Sprite_GermanFlute *);
static void sub_8076C58(Sprite_GermanFlute *);

static const s16 sFluteUpdraft[NUM_GERMAN_FLUTE_KINDS] = {
    Q_8_8(7),
    Q_8_8(8),
    Q_8_8(9),
    Q_8_8(10),
};

static const u16 sFluteSfx[NUM_GERMAN_FLUTE_KINDS] = {
    SE_MUSIC_PLANT_FLUTE_1,
    SE_MUSIC_PLANT_FLUTE_2,
    SE_MUSIC_PLANT_FLUTE_3,
    SE_MUSIC_PLANT_FLUTE_4,
};

static void sub_8076928(void)
{
    Sprite_GermanFlute *flute = TaskGetStructPtr(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    } else if (gPlayer.unk2C == 0x78) {
        sub_8076D08(flute);
    } else {
        s32 posX, posY;
        posX = Q_24_8(flute->posX);
        posY = Q_24_8(flute->posY) + Q_24_8(24);

        if (gPlayer.x != posX) {
            if (gPlayer.x > posX) {
                gPlayer.x -= Q_24_8(0.5);

                if (gPlayer.x < posX) {
                    gPlayer.x = posX;
                }

            } else {
                gPlayer.x += Q_24_8(0.5);

                if (gPlayer.x > posX) {
                    gPlayer.x = posX;
                }
            }
        }

        if ((gPlayer.x - posX) >= 0) {
            if ((gPlayer.x - posX) <= Q_24_8(8)) {
                goto lab;
            }
        } else {
            if (((posX - gPlayer.x) <= Q_24_8(8))) {
            lab:
                if (gPlayer.y != posY) {
                    gPlayer.speedAirY += Q_24_8(1. / 6.);
                    gPlayer.y += gPlayer.speedAirY;

                    if (gPlayer.y > posY) {
                        gPlayer.y = posY;
                    }
                }
            }
        }

        if ((gPlayer.x == posX) && (gPlayer.y == posY)) {
            sub_8076C58(flute);
        }
    }
}

static void sub_80769E0(void)
{
    s32 res;
    s32 r1;
    Sprite_GermanFlute *flute = TaskGetStructPtr(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.unk2C == 0x78) {
        sub_8076D08(flute);
    }

    gPlayer.y += gPlayer.speedAirY;
    gPlayer.speedAirY += Q_24_8(1. / 6.);

    // NOTE/BUG(?): Are the first 2 parameters swapped?
    res = sub_801F100(Q_24_8_TO_INT(gPlayer.y) - gPlayer.unk17, Q_24_8_TO_INT(gPlayer.x),
                      gPlayer.unk38, -8, sub_801EC3C);

    if (res < 0) {
        gPlayer.y -= Q_24_8(res);
    }

    if (gPlayer.speedAirY >= 0) {
        sub_8076C70(flute);
    }
}

static void Task_8076A6C(void)
{
    s32 res;
    s32 r1;
    Sprite_GermanFlute *flute = TaskGetStructPtr(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.unk2C == 0x78) {
        sub_8076D08(flute);
    }

    gPlayer.x -= flute->unk8;
    gPlayer.y -= flute->unkA;
    flute->unk8 = 0;

    flute->unkA = Q_2_14_TO_Q_24_8(SIN((u8)flute->timer * 4)) * 8;
    r1 = gPlayer.x;
    gPlayer.y += flute->unkA;

    // NOTE/BUG(?): Are the first 2 parameters swapped?
    res = sub_801F100(Q_24_8_TO_INT(gPlayer.y) - gPlayer.unk17, Q_24_8_TO_INT(r1),
                      gPlayer.unk38, -8, sub_801EC3C);
    if (res < 0) {
        gPlayer.y -= Q_24_8(res);
    }

    flute->timer++;

    if (gPlayer.unk5C & 0x10) {
        gPlayer.x += Q_24_8(0.5);
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    if (gPlayer.unk5C & 0x20) {
        gPlayer.x -= Q_24_8(0.5);
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    }

    if ((Q_24_8(flute->posX) - Q_24_8(16) > gPlayer.x)
        || (Q_24_8(flute->posX) + Q_24_8(16) < gPlayer.x)) {
        sub_8076C88(flute);
    }

    if (flute->timer++ > 179) {
        sub_8076CC0(flute);
    }
}

static void sub_8076B84(Sprite_GermanFlute *flute)
{
    sub_80218E4(&gPlayer);
    sub_8023B5C(&gPlayer, 14);

    gPlayer.unk16 = 6;
    gPlayer.unk17 = 14;
    gPlayer.moveState |= MOVESTATE_400000;
    gPlayer.unk64 = 4;
    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.speedGroundX = 0;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    gPlayer.y = Q_24_8(flute->posY - 8);
    gCurTask->main = sub_8076928;
}

static bool32 sub_8076BE4(Sprite_GermanFlute *flute)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        s32 posX, posY;
        s32 pos2X, pos2Y;
        s16 playerX, playerY;
        s16 screenX, screenY;

        posX = flute->posX;
        pos2X = (gCamera.x + 20);
        screenX = posX - pos2X;

        posY = flute->posY;
        pos2Y = (gCamera.y + 16);
        screenY = posY - pos2Y;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;
        if ((screenX <= playerX) && (playerX < (screenX + 40))) {

            if ((screenY <= playerY) && (playerY < screenY + 32)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}

static void sub_8076C58(Sprite_GermanFlute *flute)
{
    flute->timer = 0;

    gCurTask->main = Task_8076DE8;
}

static void sub_8076C70(Sprite_GermanFlute *flute)
{
    flute->unkA = 0;
    flute->timer = 0;

    gCurTask->main = Task_8076A6C;
}

static void sub_8076C88(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk64 = 14;
    gPlayer.unk6D = 5;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

static void sub_8076CC0(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk6D = 5;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

static void sub_8076CF4(Sprite_GermanFlute UNUSED *flute)
{
    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

static void sub_8076D08(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

void initSprite_Interactable_MusicPlant_GermanFlute(Interactable *ia, u16 spriteRegionX,
                                                    u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_MusicPlant_GermanFlute,
                                sizeof(Sprite_GermanFlute), 0x2010, 0,
                                TaskDestructor_Interactable_MusicPlant_GermanFlute);
    Sprite_GermanFlute *flute = TaskGetStructPtr(t);
    s32 posX, posY;

    posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    flute->posX = posX + (TILE_WIDTH / 2);

    posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    flute->posY = posY;

    flute->unk8 = 0;
    flute->unkA = 0;
    flute->kind = ia->d.sData[0];
    flute->ia = ia;
    flute->spriteX = ia->x;
    flute->spriteY = spriteY;
    SET_SPRITE_INITIALIZED(ia);
}

static void Task_Interactable_MusicPlant_GermanFlute(void)
{
    Sprite_GermanFlute *flute = TaskGetStructPtr(gCurTask);
    if (sub_8076BE4(flute)) {
        sub_8076B84(flute);
    }

    if (sub_8076EAC(flute)) {
        sub_8076EF4(flute);
    }
}

static void Task_8076DE8(void)
{
    Sprite_GermanFlute *flute = TaskGetStructPtr(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.unk2C == 0x78) {
        sub_8076D08(flute);
    }

    if (++flute->timer == 31) {
        sub_8076E3C(flute);
    }
}

static void TaskDestructor_Interactable_MusicPlant_GermanFlute(struct Task *t) {};

static void sub_8076E3C(Sprite_GermanFlute *flute)
{
    gPlayer.unk64 = 0x3A;
    gPlayer.speedAirX = 0;

    gPlayer.speedAirY = -sFluteUpdraft[flute->kind];
    flute->timer = 0;
    sub_8080AFC(flute->posX, (flute->posY + 24), 0, 30, 0, DEG_TO_SIN(270) / 4, 3);
    m4aSongNumStart(sFluteSfx[flute->kind]);
    gCurTask->main = sub_80769E0;
}

static bool32 sub_8076EAC(Sprite_GermanFlute *flute)
{
    s16 screenX, screenY;
    screenX = flute->posX - gCamera.x;
    screenY = flute->posY - gCamera.y;

    if ((screenX < -((CAM_REGION_WIDTH + 8) / 2))
        || (screenX > DISPLAY_WIDTH + ((CAM_REGION_WIDTH + 8) / 2))
        || (screenY < -(CAM_REGION_WIDTH / 2))
        || (screenY > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8076EF4(Sprite_GermanFlute *flute)
{
    flute->ia->x = flute->spriteX;
    TaskDestroy(gCurTask);
}