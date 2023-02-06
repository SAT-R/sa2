#include "global.h"
#include "m4a.h"
#include "task.h"
#include "trig.h"

#include "interactable.h"
#include "interactable_music_plant_note_particle.h"

#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ u8 filler8[0x4];
    /* 0x0C */ u16 kind;
    /* 0x0E */ u16 unkE;
    /* 0x10 */ Interactable *ia;
    /* 0x14 */ u8 unk14;
} Sprite_GermanFlute; /* size: 0x18 */

#define NUM_GERMAN_FLUTE_KINDS 4

extern void sub_80769E0(void);

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

void sub_8076E3C(Sprite_GermanFlute *flute)
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
    flute->ia->x = flute->unk14;
    TaskDestroy(gCurTask);
}