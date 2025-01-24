#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "sprite.h"

#include "game/entity.h"
#include "task.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/music_plant/guitar_string.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    // elems:
    // [0] = xCoord
    // [1] = yCoord
    // [2] = spike of oscillation
    /* 0x00 */ s16 elements[NUM_GUITAR_STRING_ELEMS][4];
    /* 0x30 */ SpriteBase base;
    /* 0x3C */ Sprite s1;
    /* 0x6C */ s32 posX;
    /* 0x70 */ s32 posY;
    /* 0x74 */ s16 unk74;
    /* 0x76 */ s16 unk76;
} Sprite_GuitarString; /* size 0x78 */

extern void Task_GuitarString(void);
extern void TaskDestructor_GuitarString(struct Task *);
extern void sub_8076114(Sprite_GuitarString *);
extern bool32 sub_807618C(Sprite_GuitarString *);
extern void sub_8076258(Sprite_GuitarString *);
extern void sub_80762A8(Sprite_GuitarString *);
extern void sub_80762BC(Sprite_GuitarString *);
extern void sub_80762E0(Sprite_GuitarString *);
extern bool32 sub_8076320(Sprite_GuitarString *);

void CreateEntity_GuitarString(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GuitarString, sizeof(Sprite_GuitarString), 0x2010, 0, TaskDestructor_GuitarString);
    Sprite_GuitarString *gs = TASK_DATA(t);
    Sprite *s = &gs->s1;
    u16 i;

    gs->base.regionX = spriteRegionX;
    gs->base.regionY = spriteRegionY;
    gs->base.me = me;
    gs->base.spriteX = me->x;
    gs->base.id = spriteY;

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = 0x2000;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x3700);
    s->graphics.anim = SA2_ANIM_NOTE_BLOCK;
    s->variant = SA2_ANIM_VARIANT_NOTE_BLOCK_GUITAR;

    gs->posX = TO_WORLD_POS(me->x, spriteRegionX);
    gs->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    UpdateSpriteAnimation(s);

    for (i = 0; i < NUM_GUITAR_STRING_ELEMS; i++) {
        s16 *elem = gs->elements[i];
        s16 offsetX = Q_8_8(i * TILE_WIDTH);
        s16 offsetY = 0;

        elem[0] = offsetX;
        elem[1] = offsetY;

        switch (i) {
            case 0:
            case 5: {
                elem[2] = Q_8_8(0);
            } break;

            case 1:
            case 4: {
                elem[2] = Q_8_8(0.5);
            } break;

            case 2:
            case 3: {
#ifdef NON_MATCHING
                elem[2] = Q_8_8(1.0);
#else
                elem[2] = 0x80;
                elem[2] <<= 1;
#endif
            } break;
        }
    }
}

void sub_8075F58(void)
{
    u8 r7 = 0;
    Sprite_GuitarString *gs = TASK_DATA(gCurTask);
    u8 i;

    sub_80762E0(gs);

    for (i = 0; i < NUM_GUITAR_STRING_ELEMS; i++) {
        s16 *elem = gs->elements[i];
        s32 r1 = gs->unk74;
        u32 ip;
        r1 = r1 - elem[1];
        r1 = (((elem[2] * r1) << 8) >> 16);

        ip = (u16)elem[1];

        if ((s16)(r1) <= elem[1]) {
            r7++;
        } else {
            r1 = (u16)((r1 - elem[1]) >> 2);

            if ((s16)r1 < Q_8_8(0.5)) {
                r1 = Q_8_8(0.5);
            }
            elem[1] = (s16)ip + ((r1 << 16) >> 16);
        }
    }

    if (PLAYER_IS_ALIVE) {
        gPlayer.qWorldY = ((gs->posY - 16) << 8) + gs->elements[2][1];
        gPlayer.rotation = 0x40;
    }

    if (r7 == NUM_GUITAR_STRING_ELEMS) {
        sub_8076258(gs);
    }

    sub_8076114(gs);
}

void sub_8076000(void)
{
    u8 r5 = 0;
    Sprite_GuitarString *gs = TASK_DATA(gCurTask);
    u8 i;

    for (i = 0; i < NUM_GUITAR_STRING_ELEMS; i++) {
        s16 *elem = gs->elements[i];

        u32 r2 = (u16)elem[1];

        if (elem[1] == 0) {
            r5++;
        } else {
            if (elem[1] > 0) {
                u32 value = r2 - Q_8_8(1);
                r2 = 0;
                elem[1] = value;

                if (elem[1] < 0)
                    elem[1] = r2;

            } else {
                u32 value = r2 + Q_8_8(1);
                r2 = 0;
                elem[1] = value;

                if (elem[1] > 0)
                    elem[1] = r2;
            }

            elem[1] = -elem[1];
        }
    }

    if (r5 == NUM_GUITAR_STRING_ELEMS) {
        sub_80762A8(gs);
    }

    if (sub_807618C(gs)) {
        sub_80762BC(gs);
    }
    sub_8076114(gs);
}

void sub_807608C(Sprite_GuitarString *gs)
{
    if (PLAYER_IS_ALIVE) {
        Player_SetMovestate_IsInScriptedSequence();
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;

        gPlayer.charState = CHARSTATE_SPIN_ATTACK;
        gPlayer.qSpeedAirX = 0;
        gPlayer.qSpeedAirY = (s32)(gPlayer.qSpeedAirY * 3) >> 1;

        CLAMP_INLINE(gPlayer.qSpeedAirY, GUITARSTR_MIN_ACCEL, GUITARSTR_MAX_ACCEL);
    }

    gs->unk74 = (u16)gPlayer.qSpeedAirY * 2;

    if (gs->unk74 < GUITARSTR_MIN_ACCEL) {
        gs->unk74 = GUITARSTR_MIN_ACCEL;
    }

    gCurTask->main = sub_8075F58;
}

void sub_8076114(Sprite_GuitarString *gs)
{
    Sprite *s = &gs->s1;
    u8 i;

    for (i = 0; i < NUM_GUITAR_STRING_ELEMS; i++) {
        s16 *elem = gs->elements[i];

        s32 elY = (u16)(ABS(elem[1]) >> 3);
        s32 r2, r1;
        if (i > 2)
            elY = (u16)((-(elY << 16)) >> 16);

        r2 = gs->posX;
        r2 += 4;
        r2 += (s16)I(elem[0] + (s16)elY);
        r2 -= gCamera.x;
        s->x = r2;

        r1 = gs->posY;
        r1 += (s8)I((u16)elem[1]);
        r1 -= gCamera.y;
        s->y = r1;

        DisplaySprite(s);
    }
}

bool32 sub_807618C(Sprite_GuitarString *gs)
{
    if (PLAYER_IS_ALIVE && gPlayer.qSpeedAirY > 0) {
        s16 screenX = gs->posX - gCamera.x;
        s16 screenY = gs->posY - gCamera.y;
        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
        s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((screenX <= playerX) && ((screenX + GUITARSTR_WIDTH_PX) >= playerX) && ((screenY - 9) <= playerY)
            && ((screenY + 9) >= playerY)) {
            return TRUE;
        }
    }
    return FALSE;
}

void Task_GuitarString(void)
{
    Sprite_GuitarString *gs = TASK_DATA(gCurTask);

    if (sub_807618C(gs)) {
        sub_807608C(gs);
    }

    if (sub_8076320(gs)) {
        gs->base.me->x = gs->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8076114(gs);
    }
}

void TaskDestructor_GuitarString(struct Task UNUSED *t) { }

void sub_8076258(Sprite_GuitarString UNUSED *gs)
{
    if (PLAYER_IS_ALIVE) {
        Player_ClearMovestate_IsInScriptedSequence();
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.transition = PLTRANS_UNCURL;
        gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
        m4aSongNumStart(SE_MUSIC_PLANT_GUITAR_STRING);
    }

    gCurTask->main = sub_8076000;
}

void sub_80762A8(Sprite_GuitarString UNUSED *gs) { gCurTask->main = Task_GuitarString; }

void sub_80762BC(Sprite_GuitarString *gs)
{
    u8 i;
    for (i = 0; i < NUM_GUITAR_STRING_ELEMS; i++) {
        s16 *elem = gs->elements[i];
        elem[1] = 0;
    }

    sub_807608C(gs);
}

// Because assigning it to a variable doesn't match...
#define LOCAL_GUITARSTR_MARGIN (Q(gs->posX + (GUITARSTR_WIDTH_PX / 2)))

void sub_80762E0(Sprite_GuitarString *gs)
{
    if (PLAYER_IS_ALIVE) {
        if (gPlayer.qWorldX != LOCAL_GUITARSTR_MARGIN) {
            if (gPlayer.qWorldX > LOCAL_GUITARSTR_MARGIN) {
                gPlayer.qWorldX -= Q(0.5);

                if (gPlayer.qWorldX < LOCAL_GUITARSTR_MARGIN)
                    gPlayer.qWorldX = LOCAL_GUITARSTR_MARGIN;
            } else {
                gPlayer.qWorldX += Q(0.5);

                if (gPlayer.qWorldX > LOCAL_GUITARSTR_MARGIN)
                    gPlayer.qWorldX = LOCAL_GUITARSTR_MARGIN;
            }
        }
    }
}

#undef LOCAL_GUITARSTR_MARGIN

bool32 sub_8076320(Sprite_GuitarString *gs)
{
    s32 screenX, screenY;
    s16 otherX, otherY;

    screenX = gs->posX;
    screenX -= gCamera.x;

    screenY = gs->posY;
    screenY -= gCamera.y;

    otherY = screenY;
    otherX = screenX;

    if (IS_OUT_OF_RANGE_2(otherX, otherY, (CAM_REGION_WIDTH + (GUITARSTR_WIDTH_PX / 2)) / 2, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}