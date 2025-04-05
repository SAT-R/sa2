#include "global.h"
#include "lib/m4a/m4a.h"
#include "task.h"
#include "trig.h"

#include "game/entity.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/interactables_2/note_particle.h"
#include "game/interactables_2/music_plant/german_flute.h"

#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ u16 kind;
    /* 0x0E */ u16 timer;
    /* 0x10 */ MapEntity *me;
    /* 0x14 */ u8 spriteX;
    /* 0x15 */ u8 spriteY;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ u8 unk17;
} Sprite_GermanFlute; /* size: 0x18 */

#define NUM_GERMAN_FLUTE_KINDS 4

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
static void Task_GermanFlute(void);
static void Task_8076DE8(void);
static void TaskDestructor_GermanFlute(struct Task *);
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
    Sprite_GermanFlute *flute = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    } else if (gPlayer.timerInvulnerability == 0x78) {
        sub_8076D08(flute);
    } else {
        s32 posX, posY;
        posX = Q(flute->posX);
        posY = Q(flute->posY) + Q(24);

        if (gPlayer.qWorldX != posX) {
            if (gPlayer.qWorldX > posX) {
                gPlayer.qWorldX -= Q(0.5);

                if (gPlayer.qWorldX < posX) {
                    gPlayer.qWorldX = posX;
                }

            } else {
                gPlayer.qWorldX += Q(0.5);

                if (gPlayer.qWorldX > posX) {
                    gPlayer.qWorldX = posX;
                }
            }
        }

        if (ABS(gPlayer.qWorldX - posX) <= Q(8)) {
            if (gPlayer.qWorldY != posY) {
                gPlayer.qSpeedAirY += Q(1. / 6.);
                gPlayer.qWorldY += gPlayer.qSpeedAirY;

                if (gPlayer.qWorldY > posY) {
                    gPlayer.qWorldY = posY;
                }
            }
        }

        if ((gPlayer.qWorldX == posX) && (gPlayer.qWorldY == posY)) {
            sub_8076C58(flute);
        }
    }
}

static void sub_80769E0(void)
{
    s32 res;
    s32 r1;
    Sprite_GermanFlute *flute = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.timerInvulnerability == 0x78) {
        sub_8076D08(flute);
    }

    gPlayer.qWorldY += gPlayer.qSpeedAirY;
    gPlayer.qSpeedAirY += Q(1. / 6.);

    // NOTE/BUG(?): Are the first 2 parameters swapped?
    res = sub_801F100(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(gPlayer.qWorldX), gPlayer.layer, -8, sub_801EC3C);

    if (res < 0) {
        gPlayer.qWorldY -= Q(res);
    }

    if (gPlayer.qSpeedAirY >= 0) {
        sub_8076C70(flute);
    }
}

static void Task_8076A6C(void)
{
    s32 res;
    s32 r1;
    Sprite_GermanFlute *flute = TASK_DATA(gCurTask);

    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.timerInvulnerability == 0x78) {
        sub_8076D08(flute);
    }

    gPlayer.qWorldX -= flute->unk8;
    gPlayer.qWorldY -= flute->unkA;
    flute->unk8 = 0;

    flute->unkA = Q_2_14_TO_Q_24_8(SIN((u8)flute->timer * 4)) * 8;
    r1 = gPlayer.qWorldX;
    gPlayer.qWorldY += flute->unkA;

    // NOTE/BUG(?): Are the first 2 parameters swapped?
    res = sub_801F100(I(gPlayer.qWorldY) - gPlayer.spriteOffsetY, I(r1), gPlayer.layer, -8, sub_801EC3C);
    if (res < 0) {
        gPlayer.qWorldY -= Q(res);
    }

    flute->timer++;

    if (gPlayer.heldInput & 0x10) {
        gPlayer.qWorldX += Q(0.5);
        gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
    }

    if (gPlayer.heldInput & 0x20) {
        gPlayer.qWorldX -= Q(0.5);
        gPlayer.moveState |= MOVESTATE_FACING_LEFT;
    }

    if ((Q(flute->posX) - Q(16) > gPlayer.qWorldX) || (Q(flute->posX) + Q(16) < gPlayer.qWorldX)) {
        sub_8076C88(flute);
    }

    if (flute->timer++ > 179) {
        sub_8076CC0(flute);
    }
}

static void sub_8076B84(Sprite_GermanFlute *flute)
{
    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 14);
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_SPIN_ATTACK;
    m4aSongNumStart(SE_SPIN_ATTACK);

    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    gPlayer.qWorldY = Q(flute->posY - 8);
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

        playerX = I(gPlayer.qWorldX) - gCamera.x;
        playerY = I(gPlayer.qWorldY) - gCamera.y;
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
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_FALLING_VULNERABLE_B;
    gPlayer.transition = PLTRANS_UNCURL;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    gCurTask->main = Task_GermanFlute;
}

static void sub_8076CC0(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gPlayer.transition = PLTRANS_UNCURL;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    gCurTask->main = Task_GermanFlute;
}

static void sub_8076CF4(Sprite_GermanFlute UNUSED *flute) { gCurTask->main = Task_GermanFlute; }

static void sub_8076D08(Sprite_GermanFlute UNUSED *flute)
{
    gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
    gCurTask->main = Task_GermanFlute;
}

void CreateEntity_GermanFlute(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_GermanFlute, sizeof(Sprite_GermanFlute), 0x2010, 0, TaskDestructor_GermanFlute);
    Sprite_GermanFlute *flute = TASK_DATA(t);
    s32 posX, posY;

    posX = TO_WORLD_POS(me->x, spriteRegionX);
    flute->posX = posX + (TILE_WIDTH / 2);

    posY = TO_WORLD_POS(me->y, spriteRegionY);
    flute->posY = posY;

    flute->unk8 = 0;
    flute->unkA = 0;
    flute->kind = me->d.sData[0];
    flute->me = me;
    flute->spriteX = me->x;
    flute->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);
}

static void Task_GermanFlute(void)
{
    Sprite_GermanFlute *flute = TASK_DATA(gCurTask);
    if (sub_8076BE4(flute)) {
        sub_8076B84(flute);
    }

    if (sub_8076EAC(flute)) {
        sub_8076EF4(flute);
    }
}

static void Task_8076DE8(void)
{
    Sprite_GermanFlute *flute = TASK_DATA(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sub_8076CF4(flute);
    }

    if (gPlayer.timerInvulnerability == 0x78) {
        sub_8076D08(flute);
    }

    if (++flute->timer == 31) {
        sub_8076E3C(flute);
    }
}

static void TaskDestructor_GermanFlute(struct Task *t) {};

static void sub_8076E3C(Sprite_GermanFlute *flute)
{
    gPlayer.charState = CHARSTATE_FLUTE_EXHAUST;
    gPlayer.qSpeedAirX = 0;

    gPlayer.qSpeedAirY = -sFluteUpdraft[flute->kind];
    flute->timer = 0;
    CreateAngledNoteParticle(flute->posX, (flute->posY + 24), 0, 30, 0, DEG_TO_SIN(270) / 4, 3);
    m4aSongNumStart(sFluteSfx[flute->kind]);
    gCurTask->main = sub_80769E0;
}

static bool32 sub_8076EAC(Sprite_GermanFlute *flute)
{
    s16 screenX, screenY;
    screenX = flute->posX - gCamera.x;
    screenY = flute->posY - gCamera.y;

    if ((screenX < -((CAM_REGION_WIDTH + 8) / 2)) || (screenX > DISPLAY_WIDTH + ((CAM_REGION_WIDTH + 8) / 2))
        || (screenY < -(CAM_REGION_WIDTH / 2)) || (screenY > DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2))) {
        return TRUE;
    }

    return FALSE;
}

static void sub_8076EF4(Sprite_GermanFlute *flute)
{
    flute->me->x = flute->spriteX;
    TaskDestroy(gCurTask);
}