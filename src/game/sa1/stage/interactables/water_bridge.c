#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

// Visual diameter of the bridge's water arc, in pixels
#define WATER_BRIDGE_DIAMETER 32

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ s32 worldX;
    /* 0x08 */ s32 worldY;
    /* 0x0C */ s32 left;
    /* 0x10 */ s32 right;
    /* 0x14 */ s32 top;
    /* 0x18 */ s32 bottom;
    /* 0x1C */ s32 width;
    /* 0x20 */ s32 height;
    /* 0x24 */ Sprite s;
    /* 0x54 */ u8 unk54;
    /* 0x55 */ u8 meX;
} WaterBridge;

void Task_WaterBridge(void);
void TaskDestructor_WaterBridge(Task *t);

void CreateEntity_WaterBridge(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_WaterBridge, sizeof(WaterBridge), 0x2000, 0, TaskDestructor_WaterBridge);
    WaterBridge *bridge = TASK_DATA(t);
    Sprite *s;
    s32 worldX, worldY;
    s32 width, height;

    bridge->me = me;
    bridge->meX = me->x;
    bridge->unk54 = 0;

    worldX = TO_WORLD_POS_INV(me->x, regionX);
    worldY = TO_WORLD_POS_INV(me->y, regionY);

    width = me->d.uData[2] * TILE_WIDTH;
    height = me->d.uData[3] * TILE_WIDTH;

    bridge->worldX = worldX;
    bridge->worldY = worldY;
    bridge->left = worldX + me->d.sData[0] * TILE_WIDTH;
    bridge->top = worldY + me->d.sData[1] * TILE_WIDTH;
    bridge->right = bridge->left + width;
    bridge->bottom = bridge->top + height;
    bridge->width = width;
    bridge->height = height;

    s = &bridge->s;
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WATER_SLIDE_SPLASH);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_WATER_SLIDE_SPLASH;
    s->variant = 0;
    s->prevVariant = -1;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->qAnimDelay = Q(0);
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 1);

    SET_MAP_ENTITY_INITIALIZED_SIMPLE(me);
}

// (77.37%) https://decomp.me/scratch/5TZch
NONMATCH("asm/non_matching/game/sa1/stage/interactables/water_bridge__Task_WaterBridge.inc", void Task_WaterBridge(void))
{
    WaterBridge *bridge = TASK_DATA(gCurTask);
    Sprite *s;
    Player *p;
    s32 playerWorldX, playerWorldY;
    s32 i;

    i = 0;
    do {
        p = &PLAYER(i);

        playerWorldX = I(p->qWorldX);
        playerWorldY = I(p->qWorldY) + p->spriteOffsetY;

        if (IS_OUT_OF_DISPLAY_RANGE(bridge->worldX, bridge->worldY)) {
            bridge->me->x = bridge->meX;
            p->moveState &= ~MOVESTATE_8000;
            TaskDestroy(gCurTask);
            break; // TODO: Is the break needed here for matching?
        }
        // _0804DC10

        if ((bridge->left <= playerWorldX) && (playerWorldX < bridge->right) && (bridge->top <= playerWorldY)
            && (playerWorldY <= bridge->bottom)) {
            s32 theta;
            s32 x, y;

            if (!IS_ALIVE(p)) {
                break;
            }

            theta = (QS((playerWorldX - bridge->left) * 2) / bridge->width);

            if (theta >= 0) {
                if (theta > (SIN_PERIOD / 2) - 1) {
                    theta = (SIN_PERIOD / 2) - 1;
                }
            } else {
                theta = 0;
            }

            y = (SIN_24_8(theta) * bridge->height);
            y = (QS(bridge->bottom) - ((y))) >> 8;

            if ((playerWorldY >= y) && (playerWorldY <= y + WATER_BRIDGE_DIAMETER)) {
                s32 qCos = COS_24_8(theta);
                s32 qSpeedX, qSpeedY;

                if (!(p->moveState & MOVESTATE_8000)) {
                    m4aSongNumStart(SE_WATER_BRIDGE_SPLASH);
                    p->moveState |= MOVESTATE_8000;
                }
                // _0804DCAA

                if (p->moveState & MOVESTATE_IN_AIR) {
                    qSpeedX = p->qSpeedAirX + Q(0.25);
                } else {
                    qSpeedX = p->qSpeedGround + Q(0.25);
                }

                if (qSpeedX < -Q(8)) {
                    qSpeedX = -Q(8);
                } else if (qSpeedX > Q(8)) {
                    qSpeedX = Q(8);
                }

                p->qSpeedGround = qSpeedX;
                p->qSpeedAirX = qSpeedX;

                qSpeedY = (((-bridge->height * qCos) * qSpeedX) >> 16) - Q(42. / 256.);
                if (qSpeedY < -Q(8)) {
                    qSpeedY = -Q(8);
                } else if (qSpeedY > Q(8)) {
                    qSpeedY = Q(8);
                }

                p->qSpeedAirY = qSpeedY;

                Player_TransitionCancelFlyingAndBoost(p);

                p->charState = CHARSTATE_HIT_AIR;
                p->moveState &= ~MOVESTATE_SPIN_ATTACK;

                PLAYERFN_CHANGE_SHIFT_OFFSETS(p, 6, 9);
                p->moveState |= MOVESTATE_IGNORE_INPUT;

                p->frameInput = 0;
                p->heldInput = 0;

                s = &bridge->s;
#ifndef BUG_FIX
                s->x = playerWorldX - gCamera.x;
                // This should reverse the offset added to playerWorldY at the top of the loop
                s->y = (playerWorldY - p->spriteOffsetX) - gCamera.y;
#else
                // But also it looks more "as expected" with the x-offset added here.
                s->x = (playerWorldX + p->spriteOffsetX) - gCamera.x;
                s->y = (playerWorldY - p->spriteOffsetY) - gCamera.y;
#endif
                UpdateSpriteAnimation(s);
                DisplaySprite(s);
                continue;
            }
            // _0804DD6C
        }

        if (p->moveState & MOVESTATE_IGNORE_INPUT) {
            p->moveState &= ~MOVESTATE_IGNORE_INPUT;
            p->heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
        }
        p->moveState &= ~MOVESTATE_8000;
    } while (++i < gNumSingleplayerCharacters);
}
END_NONMATCH

void TaskDestructor_WaterBridge(Task *t)
{
    WaterBridge *bridge = TASK_DATA(t);
    Sprite *s = &bridge->s;
    VramFree(s->graphics.dest);
}
