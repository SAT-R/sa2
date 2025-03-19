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
    /* 0x01 */ u8 cooldown;
    /* 0x04 */ s32 posX;
    /* 0x08 */ s32 posY;
    /* 0x0C */ s16 left;
    /* 0x0E */ s16 top;
    /* 0x10 */ s16 right;
    /* 0x12 */ s16 bottom;
    /* 0x14 */ s16 radiusLeft;
    /* 0x16 */ s16 radiusTop;
    /* 0x18 */ s16 radiusRight;
    /* 0x1A */ s16 radiusBottom;
    /* 0x1C */ MapEntity *me;
    /* 0x20 */ u8 spriteX;
    /* 0x21 */ u8 spriteY;
} Sprite_Keyboard; /* size: 0x24 */

#define MUSIC_PLANT_KEYBOARD_TYPE_VERTICAL         0
#define MUSIC_PLANT_KEYBOARD_TYPE_HORIZONTAL_LEFT  1
#define MUSIC_PLANT_KEYBOARD_TYPE_HORIZONTAL_RIGHT 2

static void Task_Keyboard(void);
static void TaskDestructor_Keyboard(struct Task *);
static bool32 ShouldDespawn(Sprite_Keyboard *);

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
    kb->cooldown = 0;
    kb->posX = TO_WORLD_POS(me->x, spriteRegionX);
    kb->posY = TO_WORLD_POS(me->y, spriteRegionY);

    kb->left = me->d.sData[0] * TILE_WIDTH;
    kb->top = me->d.sData[1] * TILE_WIDTH;
    kb->right = kb->left + me->d.uData[2] * TILE_WIDTH;
    kb->bottom = kb->top + me->d.uData[3] * TILE_WIDTH;

    kb->radiusLeft = (kb->left > 0) ? 0 : kb->left;
    kb->radiusTop = (kb->top > 0) ? 0 : kb->top;
    kb->radiusRight = (kb->right < 0) ? 0 : kb->right;
    kb->radiusBottom = (kb->bottom < 0) ? 0 : kb->bottom;

    kb->spriteX = me->x;
    kb->spriteY = spriteY;
    kb->me = me;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void BouncePlayer(Sprite_Keyboard *kb)
{
    // UB: These could be used without initialization
    s16 noteAccelY1, noteAccelY2, noteAccelX1, noteAccelX2;

    kb->cooldown = 8;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;
    gPlayer.transition = PLTRANS_UNCURL;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
        m4aSongNumStart(SE_TECHNO_BASE_COMMON);
    } else {
        m4aSongNumStart(SE_MUSIC_PLANT_PIANO);
    }

    switch (kb->kbType) {
        case 0: {
            if (kb->left > 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[0][1];
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[0][1];
                }
                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;

            } else if (kb->left < 0) {
                // _080764F8
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[0][1];
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[0][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[0][1];
                }
                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            } else {
                //_08076548
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[0][1];
                } else {
                    gPlayer.qSpeedAirX = 0;
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[0][1];
                }
                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            }
        } break;

        case 1: {
            if (kb->top > 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[1][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelTechnoBase[1][1];
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[1][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelMusicPlant[1][1];
                }

                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = 0;
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            } else if (kb->top < 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[1][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[1][1];
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[1][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[1][1];
                }

                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            } else {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = -sKeyboardAccelTechnoBase[1][0];
                    gPlayer.qSpeedAirY = 0;
                } else {
                    gPlayer.qSpeedAirX = -sKeyboardAccelMusicPlant[1][0];
                    gPlayer.qSpeedAirY = 0;
                }

                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            }
        } break;

        case 2: {
            if (kb->top > 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[2][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelTechnoBase[2][1];
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[2][0];
                    gPlayer.qSpeedAirY = +sKeyboardAccelMusicPlant[2][1];
                }

                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = 0;
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = 0;
            } else if (kb->top < 0) {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[2][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelTechnoBase[2][1];
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[2][0];
                    gPlayer.qSpeedAirY = -sKeyboardAccelMusicPlant[2][1];
                }

                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            } else {
                if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
                    gPlayer.qSpeedAirX = +sKeyboardAccelTechnoBase[2][0];
                    gPlayer.qSpeedAirY = 0;
                } else {
                    gPlayer.qSpeedAirX = +sKeyboardAccelMusicPlant[2][0];
                    gPlayer.qSpeedAirY = 0;
                }

                noteAccelX1 = Q_8_8(7. / 8.);
                noteAccelY1 = -Q_8_8(4.5);
                noteAccelX2 = -Q_8_8(7. / 8.);
                noteAccelY2 = noteAccelY1;
            }
        } break;
    }

    if (LEVEL_TO_ZONE(gCurrentLevel) != ZONE_6) {
        CreateNoteParticle(I(gPlayer.qWorldX), I(gPlayer.qWorldY), 5, 30, noteAccelX1, noteAccelY1, 0);
        CreateNoteParticle(I(gPlayer.qWorldX), I(gPlayer.qWorldY), 5, 30, noteAccelX2, noteAccelY2, 1);
    }
}

static bool32 IsPlayerTouchingKeyboard(Sprite_Keyboard *kb)
{
    if (PLAYER_IS_ALIVE) {
        if (kb->cooldown == 0) {
            s16 screenX = kb->posX - gCamera.x;
            s16 screenY = kb->posY - gCamera.y;
            s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
            s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

            if (((screenX + kb->left) <= playerX) && (((screenX + kb->left) + (kb->right - kb->left)) >= playerX)
                && ((screenY + kb->top) <= playerY) && (((screenY + kb->top) + (kb->bottom - kb->top)) >= playerY)) {
                return TRUE;
            }
        } else {
            kb->cooldown--;
        }
    }

    return FALSE;
}

static void Task_Keyboard(void)
{
    Sprite_Keyboard *kb = TASK_DATA(gCurTask);
    if (IsPlayerTouchingKeyboard(kb)) {
        BouncePlayer(kb);
    }

    if (ShouldDespawn(kb)) {
        DespawnKeyboard(kb);
    }
}

static void TaskDestructor_Keyboard(struct Task *UNUSED t) { }

static bool32 ShouldDespawn(Sprite_Keyboard *kb)
{
    s16 screenX = kb->posX - gCamera.x;
    s16 screenY = kb->posY - gCamera.y;

    if (((screenX + kb->radiusRight) < -(CAM_REGION_WIDTH / 2)) || ((screenX + kb->radiusLeft) > DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2))
        || (screenY + kb->radiusBottom < -(CAM_REGION_WIDTH / 2))
        || ((screenY + kb->radiusTop) > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
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
