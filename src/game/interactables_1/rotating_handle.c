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
    s16 unk3C;
    s16 unk3E;
    u8 unk40;
} Sprite_RotatingHandle;

static void Task_AfterJump(void);
static void Task_Idle(void);
static void Task_Rotating(void);

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
        rotatingHandle->unk3C = 0;
        rotatingHandle->unk3E = 0;
        rotatingHandle->unk40 = 0;

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

    if (!(gPlayer.moveState & (MOVESTATE_400000 | MOVESTATE_DEAD)) && sub_800C204(s, x, y, 0, &gPlayer, 0) == 1) {
#ifndef NON_MATCHING
        register s32 temp1 asm("r0"), temp2;
#else
        s32 temp1, temp2;
#endif
        Player_TransitionCancelFlyingAndBoost(&gPlayer);
        rotatingHandle->unk3C = 0;

        temp1 = abs(gPlayer.speedAirX);
        temp2 = abs(gPlayer.speedAirY);
        rotatingHandle->unk3E = temp1 + temp2;
        if (rotatingHandle->unk3E < 0xE0) {
            rotatingHandle->unk3E = 0xE0;
        }

        if (rotatingHandle->unk3E > 0x180) {
            rotatingHandle->unk3E = 0x180;
        }

        if (gPlayer.speedAirX > 0) {
            gPlayer.moveState &= ~MOVESTATE_FACING_LEFT;
            if (I(gPlayer.qWorldY) > y) {
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_A;
                rotatingHandle->unk40 = 0;
            } else {
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_B;
                rotatingHandle->unk40 = 1;
            }
        } else {
            gPlayer.moveState |= 1;
            if (I(gPlayer.qWorldY) > y) {
                s->frameFlags &= ~SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_A;
                rotatingHandle->unk40 = 2;
            } else {
                s->frameFlags |= SPRITE_FLAG_MASK_X_FLIP;
                gPlayer.charState = CHARSTATE_GRABBING_HANDLE_B;
                rotatingHandle->unk40 = 3;
            }
        }

        gPlayer.qWorldX = Q(x);
        gPlayer.qWorldY = Q(y);
        gPlayer.variant = 0;
        gPlayer.unk6C = 1;
        m4aSongNumStart(SE_SPEED_BOOSTER);
        gPlayer.unk62 = 0;
        gPlayer.moveState |= MOVESTATE_400000;
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
NONMATCH("asm/non_matching/game/interactables_1/Task_Rotating.inc", static void Task_Rotating())
{
    Sprite_RotatingHandle *rotatingHandle = TASK_DATA(gCurTask);
    Sprite *s = &rotatingHandle->s;
    MapEntity *me = rotatingHandle->base.me;
    u64 temp;
    u32 cycle;
    s32 x, y;

    s32 cos;
    s32 sin;

    x = TO_WORLD_POS(rotatingHandle->base.spriteX, rotatingHandle->base.regionX);
    y = TO_WORLD_POS(me->y, rotatingHandle->base.regionY);

    rotatingHandle->unk3C = (rotatingHandle->unk3C + rotatingHandle->unk3E) & 0x3FF0;
    cycle = ONE_CYCLE;
    temp = rotatingHandle->unk3C >> 4;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (!PLAYER_IS_ALIVE) {
        gCurTask->main = Task_AfterJump;
        DisplaySprite(s);
        return;
    }

    if (gPlayer.frameInput & gPlayerControls.jump) {
#ifndef NON_MATCHING
        register u32 temp2 asm("r4");
#else
        u32 temp2;
#endif
        gPlayer.transition = PLTRANS_PT5;
        me->x = rotatingHandle->base.spriteX;
        Player_TransitionCancelFlyingAndBoost(&gPlayer);
        sub_8023B5C(&gPlayer, 9);
        gPlayer.spriteOffsetX = 6;
        gPlayer.spriteOffsetY = 9;
        gPlayer.moveState &= ~MOVESTATE_400000;
        gCurTask->main = Task_AfterJump;

        switch (rotatingHandle->unk40) {
            case 0:
                temp2 = (0x20 - temp) & cycle;
                sin = SIN(temp);
                gPlayer.qWorldX += sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY += cos >> 1;
                break;
            case 1:
                temp2 = (temp + 0x20) & cycle;
                sin = SIN(temp);
                gPlayer.qWorldX += sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY -= cos >> 1;
                break;
            case 2:
                temp2 = (temp + 0x1E0) & cycle;
                sin = SIN(temp);
                gPlayer.qWorldX -= sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY += cos >> 1;

                break;
            case 3: {
#ifndef NON_MATCHING
                register s32 r1 asm("r1") = 0x220;
#else
                s32 r1 = 0x220;
#endif
                temp2 = (r1 - temp) & cycle;
                sin = SIN(temp);
                gPlayer.qWorldX -= sin >> 1;
                cos = COS(temp);
                gPlayer.qWorldY -= cos >> 1;
                break;
            }
            default:
                temp2 = 0;
                break;
        }
        gPlayer.speedAirX = Div(COS(temp2) << 1, 0x11);
        gPlayer.speedAirY = Div(SIN(temp2) << 1, 0x11);
        gPlayer.charState = CHARSTATE_CURLED_IN_AIR;
        gPlayer.unk6C = 1;
    } else {
        u8 r2;
        if (gPlayer.charState == CHARSTATE_GRABBING_HANDLE_A) {
            s32 new_var;
            r2 = Div(temp, 0x56);
            new_var = 0xB;
            if (r2 > new_var) {
                r2 = 0xB;
            }
        } else {
            r2 = Div(temp, 0x56);
            if (r2 > 0xB) {
                r2 = 0xB;
            }
        }

        s->graphics.anim = SA2_ANIM_ROTATING_HANDLE;
        s->variant = r2;
        s->prevVariant = -1;
        gPlayer.variant = r2;
        gPlayer.unk6C = 1;
        gPlayer.qWorldX = Q(x);
        gPlayer.qWorldY = Q(y);
        gPlayer.speedAirX = 0;
        gPlayer.speedAirY = 0;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        me->x = rotatingHandle->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
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

    rotatingHandle->unk3E--;
    if (rotatingHandle->unk3E < 0xE0) {
        rotatingHandle->unk3E = 0xE0;
    }

    rotatingHandle->unk3C = (rotatingHandle->unk3C + rotatingHandle->unk3E) & 0x3FF0;

    temp3 = Div(rotatingHandle->unk3C >> 4, 85);
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
        rotatingHandle->unk3C = 0;
        rotatingHandle->unk3E = 0;
        gCurTask->main = Task_Idle;
    }
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}
