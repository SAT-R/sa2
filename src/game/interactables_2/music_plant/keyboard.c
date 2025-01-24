#include "global.h"
#include "lib/m4a/m4a.h"
#include "task.h"
#include "trig.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/note_particle.h"
#include "game/interactables_2/music_plant/keyboard.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ u8 kbType;
    /* 0x01 */ u8 unk1;
    /* 0x02 */ u8 unk2;
    /* 0x03 */ u8 unk3;
    /* 0x04 */ s32 posX;
    /* 0x08 */ s32 posY;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s16 unk14;
    /* 0x16 */ s16 unk16;
    /* 0x18 */ s16 unk18;
    /* 0x1A */ s16 unk1A;
    /* 0x1C */ MapEntity *me;
    /* 0x20 */ u8 spriteX;
    /* 0x21 */ u8 spriteY;
} Sprite_Keyboard; /* size: 0x24 */

#define MUSIC_PLANT_KEYBOARD_TYPE_VERTICAL         0
#define MUSIC_PLANT_KEYBOARD_TYPE_HORIZONTAL_LEFT  1
#define MUSIC_PLANT_KEYBOARD_TYPE_HORIZONTAL_RIGHT 2

static void Task_Keyboard(void);
static void TaskDestructor_Keyboard(struct Task *);
static bool32 sub_8076848(Sprite_Keyboard *);

static void DespawnKeyboard(Sprite_Keyboard *);

const s16 sKeyboardAccelMusicPlant[3][2] = {
    { Q_8_8(3.0), Q_8_8(4.0) },
    { Q_8_8(5.0), Q_8_8(8.0) },
    { Q_8_8(5.0), Q_8_8(8.0) },
};

const s16 sKeyboardAccelTechnoBase[3][2] = {
    { Q_8_8(7.5), Q_8_8(7.5) },
    { Q_8_8(5.0), Q_8_8(8.0) },
    { Q_8_8(5.0), Q_8_8(8.0) },
};

void CreateEntity_Keyboard(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY, u32 type)
{
    struct Task *t = TaskCreate(Task_Keyboard, sizeof(Sprite_Keyboard), 0x2010, 0, TaskDestructor_Keyboard);

    Sprite_Keyboard *kb = TASK_DATA(t);
    kb->kbType = type;
    kb->unk1 = 0;
    kb->posX = TO_WORLD_POS(me->x, spriteRegionX);
    kb->posY = TO_WORLD_POS(me->y, spriteRegionY);

    {
        kb->unkC = me->d.sData[0] * TILE_WIDTH;
        kb->unkE = me->d.sData[1] * TILE_WIDTH;
        kb->unk10 = kb->unkC + me->d.uData[2] * TILE_WIDTH;
        kb->unk12 = kb->unkE + me->d.uData[3] * TILE_WIDTH;

        kb->unk14 = (kb->unkC > 0) ? 0 : kb->unkC;
        kb->unk16 = (kb->unkE > 0) ? 0 : kb->unkE;
        kb->unk18 = (kb->unk10 < 0) ? 0 : kb->unk10;
        kb->unk1A = (kb->unk12 < 0) ? 0 : kb->unk12;
    }
    kb->spriteX = me->x;
    kb->spriteY = spriteY;
    kb->me = me;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_8076448(Sprite_Keyboard *kb)
{
    // UB: These could be used without initialization
    s16 r5, r6, r7, r8;

    kb->unk1 = 8;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;
    gPlayer.transition = PLTRANS_UNCURL;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
        m4aSongNumStart(SE_TECHNO_BASE_COMMON);
    } else {
        m4aSongNumStart(SE_MUSIC_PLANT_PIANO);
    }

    switch (kb->kbType) {
        case 0: {
            if (kb->unkC > 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[0][1];
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[0][1];
                }
                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;

            } else if (kb->unkC < 0) {
                // _080764F8
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[0][1];
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[0][1];
                }
                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            } else {
                //_08076548
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[0][1];
                } else {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[0][1];
                }
                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            }
        } break;

        case 1: {
            if (kb->unkE > 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[1][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelTechnoBase[1][1];
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[1][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelMusicPlant[1][1];
                }

                r7 = Q_8_8(7. / 8.);
                r5 = 0;
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            } else if (kb->unkE < 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[1][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[1][1];
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[1][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[1][1];
                }

                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            } else {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[1][0];
                    gPlayer.qSpeedAirY = 0;
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[1][0];
                    gPlayer.qSpeedAirY = 0;
                }

                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            }
        } break;

        case 2: {
            if (kb->unkE > 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[2][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelTechnoBase[2][1];
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[2][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelMusicPlant[2][1];
                }

                r7 = Q_8_8(7. / 8.);
                r5 = 0;
                r8 = -Q_8_8(7. / 8.);
                r6 = 0;
            } else if (kb->unkE < 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[2][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[2][1];
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[2][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[2][1];
                }

                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            } else {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[2][0];
                    gPlayer.qSpeedAirY = 0;
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[2][0];
                    gPlayer.qSpeedAirY = 0;
                }

                r7 = Q_8_8(7. / 8.);
                r5 = -Q_8_8(4.5);
                r8 = -Q_8_8(7. / 8.);
                r6 = r5;
            }
        } break;
    }

    if (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_6) {
        sub_8080C78(I(gPlayer.qWorldX), I(gPlayer.qWorldY), 5, 30, r7, r5, 0);
        sub_8080C78(I(gPlayer.qWorldX), I(gPlayer.qWorldY), 5, 30, r8, r6, 1);
    }
}

static bool32 sub_8076780(Sprite_Keyboard *kb)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        if (kb->unk1 == 0) {
            s16 screenX = kb->posX - gCamera.x;
            s16 screenY = kb->posY - gCamera.y;
            s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
            s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

            if (((screenX + kb->unkC) <= playerX) && (((screenX + kb->unkC) + (kb->unk10 - kb->unkC)) >= playerX)
                && ((screenY + kb->unkE) <= playerY) && (((screenY + kb->unkE) + (kb->unk12 - kb->unkE)) >= playerY)) {
                return TRUE;
            }
        } else {
            kb->unk1--;
        }
    }

    return FALSE;
}

static void Task_Keyboard(void)
{
    Sprite_Keyboard *kb = TASK_DATA(gCurTask);
    if (sub_8076780(kb)) {
        sub_8076448(kb);
    }

    if (sub_8076848(kb)) {
        DespawnKeyboard(kb);
    }
}

static void TaskDestructor_Keyboard(struct Task *UNUSED t) { }

static bool32 sub_8076848(Sprite_Keyboard *kb)
{
    s16 screenX = kb->posX - gCamera.x;
    s16 screenY = kb->posY - gCamera.y;

    if (((screenX + kb->unk18) < -(CAM_REGION_WIDTH / 2)) || ((screenX + kb->unk14) > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || (screenY + kb->unk1A < -(CAM_REGION_WIDTH / 2)) || ((screenY + kb->unk16) > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void DespawnKeyboard(Sprite_Keyboard *kb)
{
    kb->me->x = kb->spriteX;
    TaskDestroy(gCurTask);
}

void CreateEntity_Keyboard_Vertical(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Keyboard(me, spriteRegionX, spriteRegionY, spriteY, MUSIC_PLANT_KEYBOARD_TYPE_VERTICAL);
}

void CreateEntity_Keyboard_Horizontal_PushLeft(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Keyboard(me, spriteRegionX, spriteRegionY, spriteY, MUSIC_PLANT_KEYBOARD_TYPE_HORIZONTAL_LEFT);
}

void CreateEntity_Keyboard_Horizontal_PushRight(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    CreateEntity_Keyboard(me, spriteRegionX, spriteRegionY, spriteY, MUSIC_PLANT_KEYBOARD_TYPE_HORIZONTAL_RIGHT);
}
