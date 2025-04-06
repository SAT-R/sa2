#include <stdlib.h> // abs

#include "global.h"
#include "gba/types.h"
#include "lib/m4a/m4a.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/stage/player_controls.h"
#include "game/interactables_1/rotating_handle.h"
#include "game/sa1_sa2_shared/collision.h"
#include "game/sa1_sa2_shared/entities_manager.h"

#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    Sprite s;
    s16 rot;
    s16 rotSpeed;
    u8 quartile;
} Sprite_RotatingHandle;

static void Task_AfterJump(void);
static void Task_Idle(void);
void Task_Rotating(void);

void CreateEntity_RotatingHandle(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    if (me->d.sData[0] >= 0) {
        struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_RotatingHandle), 0x2010, 0, TaskDestructor_80095E8);
        Sprite_RotatingHandle *rotatingHandle = TASK_DATA(t);
        Sprite *s = &rotatingHandle->s;
        rotatingHandle->base.regionX = spriteRegionX;
        rotatingHandle->base.regionY = spriteRegionY;
        rotatingHandle->base.me = me;
        rotatingHandle->base.spriteX = me->x;
        rotatingHandle->base.id = spriteY;
        rotatingHandle->rot = 0;
        rotatingHandle->rotSpeed = 0;
        rotatingHandle->quartile = 0;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(9);
        s->graphics.anim = SA2_ANIM_ROTATING_HANDLE;
        s->variant = 0;

        s->oamFlags = SPRITE_OAM_ORDER(18);
        s->graphics.size = 0;
        s->animCursor = 0;
        s->qAnimDelay = 0;
        s->prevVariant = -1;
        s->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s->palId = 0;
        s->hitboxes[0].index = -1;
        s->frameFlags = 0x2000;
    }
}

static void Task_Idle(void)
{
    Sprite_RotatingHandle *rotatingHandle = TASK_DATA(gCurTask);
    Sprite *s = &rotatingHandle->s;
    MapEntity *me = rotatingHandle->base.me;
    s32 x = TO_WORLD_POS(rotatingHandle->base.spriteX, rotatingHandle->base.regionX);
    s32 y = TO_WORLD_POS(me->y, rotatingHandle->base.regionY);

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (!(gPlayer.moveState & (MOVESTATE_IA_OVERRIDE | MOVESTATE_DEAD)) && Player_HitboxCollision(s, x, y, 0, &gPlayer, 0) == 1) {
#ifndef NON_MATCHING
        register s32 temp1 asm("r0"), temp2;
#else
        s32 temp1, temp2;
#endif
        Player_TransitionCancelFlyingAndBoost(&gPlayer);
        rotatingHandle->rot = 0;

        temp1 = abs(gPlayer.qSpeedAirX);
        temp2 = abs(gPlayer.qSpeedAirY);
        rotatingHandle->rotSpeed = temp1 + temp2;
        if (rotatingHandle->rotSpeed < 0xE0) {
            rotatingHandle->rotSpeed = 0xE0;
        }

        if (rotatingHandle->rotSpeed > 0x180) {
            rotatingHandle->rotSpeed = 0x180;
        }

        if (gPlayer.qSpeedAirX > 0) {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            if (I(gPlayer.qWorldY) > y) {
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_A;
                rotatingHandle->quartile = 0;
            } else {
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_B;
                rotatingHandle->quartile = 1;
            }
        } else {
            gPlayer.moveState |= 1;
            if (I(gPlayer.qWorldY) > y) {
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_A;
                rotatingHandle->quartile = 2;
            } else {
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_B;
                rotatingHandle->quartile = 3;
            }
        }

        gPlayer.qWorldX = Q(x);
        gPlayer.qWorldY = Q(y);
        gPlayer.variant = 0;
        gPlayer.unk6C = 1;
        m4aSongNumStart(SE_SPEED_BOOSTER);
        gPlayer.unk62 = 0;
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
        gCurTask->main = Task_Rotating;
    } else {
        if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
            me->x = rotatingHandle->base.spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

// (95.52%) https://decomp.me/scratch/RaPDV
// (99.80%) https://decomp.me/scratch/zEnJP
NONMATCH("asm/non_matching/game/interactables_1/Task_Rotating.inc", void Task_Rotating())
{
    MapEntity *me;
    Sprite *sprite;
    Sprite_RotatingHandle *rotatingHandle;
    u16 temp;
    u16 temp2;
    u16 temp3;

    s32 posX, posY;

    s32 cos;
    s32 sin;

    rotatingHandle = TASK_DATA(gCurTask);
    // asm("":::"r8", "r9");
    sprite = &rotatingHandle->s;
    me = rotatingHandle->base.me;

    posX = TO_WORLD_POS(rotatingHandle->base.spriteX, rotatingHandle->base.regionX);
    posY = TO_WORLD_POS(me->y, rotatingHandle->base.regionY);

    rotatingHandle->rot = (rotatingHandle->rot + rotatingHandle->rotSpeed) & 0x3FF0;
    // unused but required for match
    temp3 = CLAMP_SIN_PERIOD(rotatingHandle->rot) + 0;
    // asm("":::"r8", "r9");
    temp2 = rotatingHandle->rot >> 4;
    temp = temp2;

    sprite->x = posX - gCamera.x;
    sprite->y = posY - gCamera.y;

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_AfterJump;
        DisplaySprite(sprite);
        return;
    }

    if (gPlayer.frameInput & gPlayerControls.jump) {
        s16 r4;
        gPlayer.transition = PLTRANS_UNCURL;
        me->x = rotatingHandle->base.spriteX;
        Player_TransitionCancelFlyingAndBoost(&gPlayer);
        PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 9);
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gCurTask->main = Task_AfterJump;

        switch (rotatingHandle->quartile) {
            case 0:
                r4 = CLAMP_SIN_PERIOD(0x20 - temp) + 0;
                sin = SIN(temp);
                gPlayer.qWorldX += sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY += cos >> 1;
                break;
            case 1:
#ifndef NON_MATCHING
                do {
#endif
                    r4 = CLAMP_SIN_PERIOD(temp + 0x20) + 0;
                    sin = SIN(temp);
#ifndef NON_MATCHING
                } while (0);
#endif
                gPlayer.qWorldX += sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY -= cos >> 1;
                break;
            case 2:
                r4 = CLAMP_SIN_PERIOD(temp + 0x1E0) + 0;
                sin = SIN(temp);
                gPlayer.qWorldX -= sin >> 1;
                cos = COS(temp);
#ifndef NON_MATCHING
                asm("" ::: "r0");
#endif
                gPlayer.qWorldY += cos >> 1;
                break;
            case 3: {
                r4 = CLAMP_SIN_PERIOD(0x220 - temp) + 0;
                sin = SIN(temp);
                gPlayer.qWorldX -= sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY -= cos >> 1;
                break;
            }
            default:
                r4 = 0;
                break;
        }
        gPlayer.qSpeedAirX = Div(COS(r4) << 1, 0x11);
        gPlayer.qSpeedAirY = Div(SIN(r4) << 1, 0x11);
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.unk6C = 1;
    } else {
        u8 r2;
        if (gPlayer.charState == CHARSTATE_GRABBING_HANDLE_A) {
            r2 = Div(temp, 0x56);
            if (r2 > 0xB) {
                r2 = 0xB;
            }
            sprite->graphics.anim = SA2_ANIM_ROTATING_HANDLE;
            sprite->variant = r2;
            sprite->prevVariant = 0xFF;
            gPlayer.variant = r2;
            gPlayer.unk6C = 1;
            gPlayer.qWorldX = Q_24_8(posX);
            gPlayer.qWorldY = Q_24_8(posY);
            gPlayer.qSpeedAirX = 0;
            gPlayer.qSpeedAirY = 0;
        } else {
            r2 = Div(temp, 0x56);
            if (r2 > 0xB) {
                r2 = 0xB;
            }
            sprite->graphics.anim = SA2_ANIM_ROTATING_HANDLE;
            sprite->variant = r2;
            sprite->prevVariant = 0xFF;
            gPlayer.variant = r2;
            gPlayer.unk6C = 1;
            gPlayer.qWorldX = Q_24_8(posX);
            gPlayer.qWorldY = Q_24_8(posY);
            gPlayer.qSpeedAirX = 0;
            gPlayer.qSpeedAirY = 0;
        }
    }

    if (IS_OUT_OF_CAM_RANGE(sprite->x, sprite->y)) {
#ifndef NON_MATCHING
        do {
#endif
            me->x = rotatingHandle->base.spriteX;
            TaskDestroy(gCurTask);
#ifndef NON_MATCHING
        } while (0);
#endif
        return;
    }

    UpdateSpriteAnimation(sprite);
    DisplaySprite(sprite);
}
END_NONMATCH

static void Task_AfterJump(void)
{
    Sprite_RotatingHandle *rotatingHandle = TASK_DATA(gCurTask);
    Sprite *s = &rotatingHandle->s;
    MapEntity *me = rotatingHandle->base.me;
    s32 x = TO_WORLD_POS(rotatingHandle->base.spriteX, rotatingHandle->base.regionX);
    s32 y = TO_WORLD_POS(me->y, rotatingHandle->base.regionY);

    u8 temp3;

    rotatingHandle->rotSpeed--;
    if (rotatingHandle->rotSpeed < 0xE0) {
        rotatingHandle->rotSpeed = 0xE0;
    }

    rotatingHandle->rot = (rotatingHandle->rot + rotatingHandle->rotSpeed) & 0x3FF0;

    temp3 = Div(rotatingHandle->rot >> 4, 85);
    if (temp3 > 0xB) {
        temp3 = 0xB;
    }

    s->graphics.anim = SA2_ANIM_ROTATING_HANDLE;
    s->variant = temp3;
    s->prevVariant = -1;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = rotatingHandle->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    if (temp3 == 0) {
        rotatingHandle->rot = 0;
        rotatingHandle->rotSpeed = 0;
        gCurTask->main = Task_Idle;
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
