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
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u16 kind;
    /* 0x0E */ u16 unkE;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
} Sprite_GermanFlute; /* size: 0x18 */

#define NUM_GERMAN_FLUTE_KINDS 4

extern void sub_80769E0(void);
extern void sub_8076A6C(void);
extern void sub_8076B84(Sprite_GermanFlute *);
extern bool32 sub_8076BE4(Sprite_GermanFlute *);
extern void sub_8076C70(Sprite_GermanFlute *);
extern void sub_8076C88(Sprite_GermanFlute UNUSED *);
extern void sub_8076CC0(Sprite_GermanFlute UNUSED *);
extern void sub_8076CF4(Sprite_GermanFlute UNUSED *);
extern void sub_8076D08(Sprite_GermanFlute UNUSED *);
static void Task_Interactable_MusicPlant_GermanFlute(void);
extern void Task_8076DE8(void);
static void TaskDestructor_Interactable_MusicPlant_GermanFlute(struct Task *);
static void sub_8076E3C(Sprite_GermanFlute *);
static bool32 sub_8076EAC(Sprite_GermanFlute *);
static void sub_8076EF4(Sprite_GermanFlute *);

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

void sub_8076C58(Sprite_GermanFlute *flute)
{
    flute->unkE = 0;

    gCurTask->main = Task_8076DE8;
}

void sub_8076C70(Sprite_GermanFlute *flute)
{
    flute->unkA = 0;
    flute->unkE = 0;

    gCurTask->main = sub_8076A6C;
}

void sub_8076C88(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk64 = 14;
    gPlayer.unk6D = 5;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

void sub_8076CC0(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_400000;
    gPlayer.unk6D = 5;
    gPlayer.speedAirX = 0;
    gPlayer.speedAirY = 0;

    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

void sub_8076CF4(Sprite_GermanFlute UNUSED *flute)
{
    gCurTask->main = Task_Interactable_MusicPlant_GermanFlute;
}

void sub_8076D08(Sprite_GermanFlute UNUSED *flute)
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

void Task_8076DE8(void)
{
    Sprite_GermanFlute *flute = TaskGetStructPtr(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.unk2C == 0x78) {
        sub_8076D08(flute);
    }

    if (++flute->unkE == 31) {
        sub_8076E3C(flute);
    }
}

static void TaskDestructor_Interactable_MusicPlant_GermanFlute(struct Task *t) {};

static void sub_8076E3C(Sprite_GermanFlute *flute)
{
    gPlayer.unk64 = 0x3A;
    gPlayer.speedAirX = 0;

    gPlayer.speedAirY = -sFluteUpdraft[flute->kind];
    flute->unkE = 0;
    sub_8080AFC(flute->posX, (flute->posY + 24), 0, 30, 0, DEG_TO_SIN(270) / 4, 3);
    m4aSongNumStart(sFluteSfx[flute->kind]);
    gCurTask->main = sub_80769E0;
}

bool32 sub_8076EAC(Sprite_GermanFlute *flute)
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

void sub_8076EF4(Sprite_GermanFlute *flute)
{
    flute->ia->x = flute->spriteX;
    TaskDestroy(gCurTask);
}