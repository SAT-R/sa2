#include "global.h"
#include "main.h"
#include "m4a.h"
#include "sprite.h"

#include "interactable.h"
#include "task.h"

#include "game.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

#define NUM_GUITAR_STRING_ELEMS 6
#define GUITARSTR_WIDTH_PX      (NUM_GUITAR_STRING_ELEMS * TILE_WIDTH)
#define GUITARSTR_MIN_ACCEL     Q_8_8(4.0)
#define GUITARSTR_MAX_ACCEL     Q_8_8(12.0)

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

extern void Task_Interactable_MusicPlant_GuitarString(void);
extern void TaskDestructor_Interactable_MusicPlant_GuitarString(struct Task *);
extern void sub_8076114(Sprite_GuitarString *);
extern bool32 sub_807618C(Sprite_GuitarString *);
extern void sub_8076258(Sprite_GuitarString *);
extern void sub_80762A8(Sprite_GuitarString *);
extern void sub_80762BC(Sprite_GuitarString *);
extern void sub_80762E0(Sprite_GuitarString *);
extern bool32 sub_8076320(Sprite_GuitarString *);

void initSprite_Interactable_MusicPlant_GuitarString(Interactable *ia, u16 spriteRegionX,
                                                     u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Interactable_MusicPlant_GuitarString,
                                sizeof(Sprite_GuitarString), 0x2010, 0,
                                TaskDestructor_Interactable_MusicPlant_GuitarString);
    Sprite_GuitarString *gs = TaskGetStructPtr(t);
    Sprite *s = &gs->s1;
    u16 i;

    gs->base.regionX = spriteRegionX;
    gs->base.regionY = spriteRegionY;
    gs->base.ia = ia;
    gs->base.spriteX = ia->x;
    gs->base.spriteY = spriteY;

    s->unk1A = 0x480;
    s->graphics.size = 0;
    s->unk14 = 0;
    s->unk1C = 0;
    s->unk21 = 0xFF;
    s->unk22 = 0x10;
    s->focused = 0;
    s->unk28->unk0 = -1;
    s->unk10 = 0x2000;
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x3700);
    s->graphics.anim = SA2_ANIM_NOTE_BLOCK;
    s->variant = SA2_ANIM_VARIANT_NOTE_BLOCK_GUITAR;

    gs->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    gs->posY = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    sub_8004558(s);

    for (i = 0; i < NUM_GUITAR_STRING_ELEMS; i++) {
        s16 *elem = gs->elements[i];
        s16 offsetX = Q_8_8(i << 3);
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
    Sprite_GuitarString *gs = TaskGetStructPtr(gCurTask);
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

    if (PlayerIsAlive) {
        gPlayer.y = ((gs->posY - 16) << 8) + gs->elements[2][1];
        gPlayer.unk24 = 0x40;
    }

    if (r7 == NUM_GUITAR_STRING_ELEMS) {
        sub_8076258(gs);
    }

    sub_8076114(gs);
}

void sub_8076000(void)
{
    u8 r5 = 0;
    Sprite_GuitarString *gs = TaskGetStructPtr(gCurTask);
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
    if (PlayerIsAlive) {
        Player_SetMovestate_IsInScriptedSequence();
        gPlayer.moveState |= MOVESTATE_400000;

        gPlayer.unk64 = 4;
        gPlayer.speedAirX = 0;
        gPlayer.speedAirY = (s32)(gPlayer.speedAirY * 3) >> 1;

        CLAMP_INLINE(gPlayer.speedAirY, GUITARSTR_MIN_ACCEL, GUITARSTR_MAX_ACCEL);
    }

    gs->unk74 = (u16)gPlayer.speedAirY * 2;

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
        r2 += (s16)Q_24_8_TO_INT(elem[0] + (s16)elY);
        r2 -= gCamera.x;
        s->x = r2;

        r1 = gs->posY;
        r1 += (s8)Q_24_8_TO_INT((u16)elem[1]);
        r1 -= gCamera.y;
        s->y = r1;

        sub_80051E8(s);
    }
}

bool32 sub_807618C(Sprite_GuitarString *gs)
{
    if (PlayerIsAlive && gPlayer.speedAirY > 0) {
        s16 screenX = gs->posX - gCamera.x;
        s16 screenY = gs->posY - gCamera.y;
        s16 playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        s16 playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        if ((screenX <= playerX) && ((screenX + GUITARSTR_WIDTH_PX) >= playerX)
            && ((screenY - 9) <= playerY) && ((screenY + 9) >= playerY)) {
            return TRUE;
        }
    }
    return FALSE;
}

void Task_Interactable_MusicPlant_GuitarString(void)
{
    Sprite_GuitarString *gs = TaskGetStructPtr(gCurTask);

    if (sub_807618C(gs)) {
        sub_807608C(gs);
    }

    if (sub_8076320(gs)) {
        gs->base.ia->x = gs->base.spriteX;
        TaskDestroy(gCurTask);
    } else {
        sub_8076114(gs);
    }
}

void TaskDestructor_Interactable_MusicPlant_GuitarString(struct Task UNUSED *t) { }

void sub_8076258(Sprite_GuitarString UNUSED *gs)
{
    if (PlayerIsAlive) {
        Player_ClearMovestate_IsInScriptedSequence();
        gPlayer.moveState &= ~MOVESTATE_400000;
        gPlayer.unk6D = 5;
        gPlayer.speedAirY = -gPlayer.speedAirY;
        m4aSongNumStart(SE_MUSIC_PLANT_GUITAR_STRING);
    }

    gCurTask->main = sub_8076000;
}

void sub_80762A8(Sprite_GuitarString UNUSED *gs)
{
    gCurTask->main = Task_Interactable_MusicPlant_GuitarString;
}

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
#define LOCAL_GUITARSTR_MARGIN (Q_24_8(gs->posX + (GUITARSTR_WIDTH_PX / 2)))

void sub_80762E0(Sprite_GuitarString *gs)
{
    if (PlayerIsAlive) {
        if (gPlayer.x != LOCAL_GUITARSTR_MARGIN) {
            if (gPlayer.x > LOCAL_GUITARSTR_MARGIN) {
                gPlayer.x -= Q_24_8(0.5);

                if (gPlayer.x < LOCAL_GUITARSTR_MARGIN)
                    gPlayer.x = LOCAL_GUITARSTR_MARGIN;
            } else {
                gPlayer.x += Q_24_8(0.5);

                if (gPlayer.x > LOCAL_GUITARSTR_MARGIN)
                    gPlayer.x = LOCAL_GUITARSTR_MARGIN;
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

    if (IS_OUT_OF_RANGE_2(otherX, otherY,
                          (CAM_REGION_WIDTH + (GUITARSTR_WIDTH_PX / 2)) / 2,
                          CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}