#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "sprite.h"

#include "game/entity.h"
#include "task.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/music_plant/chord.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

#define NUM_CHORD_ELEMENTS 6
#define CHORD_WIDTH_PX     (NUM_CHORD_ELEMENTS * TILE_WIDTH)
#define BOUNCE_MIN_ACCEL   Q_8_8(4.0)
#define BOUNCE_MAX_ACCEL   Q_8_8(12.0)

typedef struct {
    s16 x;
    s16 y;
    // spike of oscillation
    s16 peak;
} ChordElement;

typedef struct {
    /* 0x00 */ ChordElement elements[NUM_CHORD_ELEMENTS];
    /* 0x30 */ SpriteBase base;
    /* 0x3C */ Sprite s;
    /* 0x6C */ s32 posX;
    /* 0x70 */ s32 posY;
    /* 0x74 */ s16 bounceAccel;
} Sprite_Chord; /* size 0x78 */

static void Task_Idle(void);
static void TaskDestructor_Chord(struct Task *);
static void Render(Sprite_Chord *);
static bool32 PlayerIsHittingChord(Sprite_Chord *);
static void LaunchPlayer(Sprite_Chord *);
static void HandleVibrateFinished(Sprite_Chord *);
static void ResetChordAndHandleBounce(Sprite_Chord *);
static void SetPlayerBouncePosition(Sprite_Chord *);
static bool32 ShouldDespawn(Sprite_Chord *);

void CreateEntity_Chord(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_Chord), 0x2010, 0, TaskDestructor_Chord);
    Sprite_Chord *chord = TASK_DATA(t);
    Sprite *s = &chord->s;
    u16 i;

    chord->base.regionX = spriteRegionX;
    chord->base.regionY = spriteRegionY;
    chord->base.me = me;
    chord->base.meX = me->x;
    chord->base.id = spriteY;

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 18, 2, 0);
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x3700);
    s->graphics.anim = SA2_ANIM_NOTE_BLOCK;
    s->variant = SA2_ANIM_VARIANT_NOTE_BLOCK_CHORD_ELEM;

    chord->posX = TO_WORLD_POS(me->x, spriteRegionX);
    chord->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    UpdateSpriteAnimation(s);

    for (i = 0; i < NUM_CHORD_ELEMENTS; i++) {
        ChordElement *element = &chord->elements[i];
        s16 offsetX = Q_8_8(i * TILE_WIDTH);
        s16 offsetY = 0;

        element->x = offsetX;
        element->y = offsetY;

        switch (i) {
            case 0:
            case 5: {
                element->peak = Q_8_8(0);
            } break;

            case 1:
            case 4: {
                element->peak = Q_8_8(0.5);
            } break;

            case 2:
            case 3: {
                element->peak = Q_8_8(0.5);
                // Required for match
                element->peak *= 2;
            } break;
        }
    }
}

static void Task_Bounce(void)
{
    u8 r7 = 0;
    Sprite_Chord *chord = TASK_DATA(gCurTask);
    u8 i;

    SetPlayerBouncePosition(chord);

    for (i = 0; i < NUM_CHORD_ELEMENTS; i++) {
        ChordElement *element = &chord->elements[i];
        s16 r1 = I((chord->bounceAccel - element->y) * element->peak);

        if (r1 <= element->y) {
            r7++;
        } else {
            r1 = (r1 - element->y) >> 2;
            if (r1 < Q_8_8(0.5)) {
                r1 = Q_8_8(0.5);
            }
            element->y += r1;
        }
    }

    if (PLAYER_IS_ALIVE) {
        gPlayer.qWorldY = Q(chord->posY - 16) + chord->elements[2].y;
        gPlayer.rotation = 64;
    }

    if (r7 == NUM_CHORD_ELEMENTS) {
        LaunchPlayer(chord);
    }

    Render(chord);
}

static void Task_Vibrate(void)
{
    u8 r5 = 0;
    Sprite_Chord *chord = TASK_DATA(gCurTask);
    u8 i;

    for (i = 0; i < NUM_CHORD_ELEMENTS; i++) {
        ChordElement *element = &chord->elements[i];

        u16 r2 = element->y;

        if (element->y == 0) {
            r5++;
        } else {
            if (element->y > 0) {
                u32 value = r2 - Q_8_8(1);
                r2 = 0;
                element->y = value;

                if (element->y < 0)
                    element->y = 0;

            } else {
                u32 value = r2 + Q_8_8(1);
                r2 = 0;
                element->y = value;

                if (element->y > 0)
                    element->y = r2;
            }

            element->y = -element->y;
        }
    }

    if (r5 == NUM_CHORD_ELEMENTS) {
        HandleVibrateFinished(chord);
    }

    if (PlayerIsHittingChord(chord)) {
        ResetChordAndHandleBounce(chord);
    }
    Render(chord);
}

static void HandleBounce(Sprite_Chord *chord)
{
    if (PLAYER_IS_ALIVE) {
        Player_SetMovestate_IsInScriptedSequence();
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;

        gPlayer.charState = CHARSTATE_SPIN_ATTACK;
        gPlayer.qSpeedAirX = 0;
        gPlayer.qSpeedAirY = (s32)(gPlayer.qSpeedAirY * 3) >> 1;

        CLAMP_INLINE(gPlayer.qSpeedAirY, BOUNCE_MIN_ACCEL, BOUNCE_MAX_ACCEL);
    }

    chord->bounceAccel = (u16)gPlayer.qSpeedAirY * 2;

    if (chord->bounceAccel < BOUNCE_MIN_ACCEL) {
        chord->bounceAccel = BOUNCE_MIN_ACCEL;
    }

    gCurTask->main = Task_Bounce;
}

static void Render(Sprite_Chord *chord)
{
    Sprite *s = &chord->s;
    u8 i;

    for (i = 0; i < NUM_CHORD_ELEMENTS; i++) {
        ChordElement *element = &chord->elements[i];
        s16 elY = ABS(element->y) >> 3;
        s32 r2, r1;
        if (i > 2)
            elY = -elY;

        r2 = chord->posX + 4;
        r2 += I(element->x + elY);
        r2 -= gCamera.x;
        s->x = r2;

        r1 = chord->posY;
        r1 += I(element->y);
        r1 -= gCamera.y;
        s->y = r1;

        DisplaySprite(s);
    }
}

static bool32 PlayerIsHittingChord(Sprite_Chord *chord)
{
    if (PLAYER_IS_ALIVE && gPlayer.qSpeedAirY > 0) {
        s16 screenX = chord->posX - gCamera.x;
        s16 screenY = chord->posY - gCamera.y;
        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
        s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((screenX <= playerX) && ((screenX + CHORD_WIDTH_PX) >= playerX) && ((screenY - 9) <= playerY) && ((screenY + 9) >= playerY)) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Task_Idle(void)
{
    Sprite_Chord *chord = TASK_DATA(gCurTask);

    if (PlayerIsHittingChord(chord)) {
        HandleBounce(chord);
    }

    if (ShouldDespawn(chord)) {
        chord->base.me->x = chord->base.meX;
        TaskDestroy(gCurTask);
        return;
    }

    Render(chord);
}

static void TaskDestructor_Chord(struct Task UNUSED *t) { }

static void LaunchPlayer(Sprite_Chord UNUSED *chord)
{
    if (PLAYER_IS_ALIVE) {
        Player_ClearMovestate_IsInScriptedSequence();
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.transition = PLTRANS_UNCURL;
        gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
        m4aSongNumStart(SE_MUSIC_PLANT_CHORD);
    }

    gCurTask->main = Task_Vibrate;
}

static void HandleVibrateFinished(Sprite_Chord UNUSED *chord) { gCurTask->main = Task_Idle; }

static void ResetChordAndHandleBounce(Sprite_Chord *chord)
{
    u8 i;
    for (i = 0; i < NUM_CHORD_ELEMENTS; i++) {
        ChordElement *element = &chord->elements[i];
        element->y = 0;
    }

    HandleBounce(chord);
}

// Because assigning it to a variable doesn't match...
#define LOCAL_CHORD_ELEMENT_MARGIN (Q(chord->posX + (CHORD_WIDTH_PX / 2)))

static void SetPlayerBouncePosition(Sprite_Chord *chord)
{
    if (PLAYER_IS_ALIVE) {
        if (gPlayer.qWorldX != LOCAL_CHORD_ELEMENT_MARGIN) {
            if (gPlayer.qWorldX > LOCAL_CHORD_ELEMENT_MARGIN) {
                gPlayer.qWorldX -= Q(0.5);

                if (gPlayer.qWorldX < LOCAL_CHORD_ELEMENT_MARGIN)
                    gPlayer.qWorldX = LOCAL_CHORD_ELEMENT_MARGIN;
            } else {
                gPlayer.qWorldX += Q(0.5);

                if (gPlayer.qWorldX > LOCAL_CHORD_ELEMENT_MARGIN)
                    gPlayer.qWorldX = LOCAL_CHORD_ELEMENT_MARGIN;
            }
        }
    }
}

#undef LOCAL_CHORD_ELEMENT_MARGIN

static bool32 ShouldDespawn(Sprite_Chord *chord)
{
    s32 screenX, screenY;
    s16 otherX, otherY;

    screenX = chord->posX;
    screenX -= gCamera.x;

    screenY = chord->posY;
    screenY -= gCamera.y;

    otherY = screenY;
    otherX = screenX;

    if (IS_OUT_OF_RANGE_2(otherX, otherY, (CAM_REGION_WIDTH + (CHORD_WIDTH_PX / 2)) / 2, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}
