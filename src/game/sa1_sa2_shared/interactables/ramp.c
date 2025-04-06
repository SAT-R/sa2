#include "global.h"
#include "core.h"
#include "sprite.h"

#include "task.h"
#include "malloc_vram.h"

#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "game/sa1_sa2_shared/interactables/ramp.h"

#include "constants/animations.h"
#include "constants/player_transitions.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
} Sprite_Ramp /* size 0x40 */;

static void Task_Ramp(void);
static void TaskDestructor_Ramp(struct Task *);

void CreateEntity_Ramp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    u8 temp;
    s32 temp2;
    struct Task *t = TaskCreate(Task_Ramp, sizeof(Sprite_Ramp), 0x2010, 0, TaskDestructor_Ramp);
    Sprite_Ramp *ramp = TASK_DATA(t);
    Sprite *s = &ramp->s;

    ramp->base.regionX = spriteRegionX;
    ramp->base.regionY = spriteRegionY;
    ramp->base.me = me;
    ramp->base.spriteX = me->x;
    ramp->base.id = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    temp = me->d.sData[0] & 3;
    ramp->unk3C = temp;

    s->graphics.dest = VramMalloc(20);
    s->graphics.anim = SA2_ANIM_RAMP;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_6) {
        s->graphics.anim = SA2_ANIM_RAMP_TECHNO_BASE;
    }

    // required for match
    temp2 = temp;

    s->variant = temp2 & 1;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->frameFlags = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(MOSAIC, 1));

    if (temp & 0x2) {
        SPRITE_FLAG_SET(s, X_FLIP);
    }
    UpdateSpriteAnimation(s);
}

static void Task_Ramp(void)
{
    Player *player = &gPlayer;
    Sprite_Ramp *ramp = TASK_DATA(gCurTask);
    Sprite *s = &ramp->s;
    MapEntity *me = ramp->base.me;

    s16 screenX, screenY;

#ifndef NON_MATCHING
    do {
#endif

        screenX = TO_WORLD_POS(ramp->base.spriteX, ramp->base.regionX);
        screenY = TO_WORLD_POS(me->y, ramp->base.regionY);
        s->x = screenX - gCamera.x;
        s->y = screenY - gCamera.y;

#ifndef NON_MATCHING
    } while (0);
#endif

    if (!(player->moveState & MOVESTATE_IA_OVERRIDE)) {
        u32 r1;
        u32 var = FALSE;
        if (player->moveState & MOVESTATE_STOOD_ON_OBJ && player->stoodObj == s) {
            var = TRUE;
        }

        r1 = Player_InteractableCollision(s, screenX, screenY, player);
        if (r1 != 0) {
            if (((r1 & 0x80000) && (ramp->unk3C & 2) && (player->qSpeedAirX > -1))
                || ((r1 & 0x40000) && (!(ramp->unk3C & 2)) && (player->qSpeedAirX < 1))) {

                player->qWorldX += (s16)(r1 & 0xFF00);

                player->qSpeedAirX = 0;
                player->qSpeedGround = 0;
            } else if (!(ramp->unk3C & 2)) {
                s32 hbLeft = screenX + s->hitboxes[0].left;
                s32 hbWidth = s->hitboxes[0].right - s->hitboxes[0].left;
                s32 halfWidth = I(player->qWorldX) - hbLeft;
                if (halfWidth > 0) {
                    if (halfWidth > hbWidth) {
                        if (!(player->moveState & MOVESTATE_IN_AIR) && (player->qSpeedGround > Q(4))) {
                            player->transition = PLTRANS_RAMP_AND_DASHRING;
                            player->unk6E = (ramp->unk3C & 1) * 3;
                        }

                        player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        player->moveState |= MOVESTATE_IN_AIR;
                    } else {
                        s32 playerMiddleY = I(player->qWorldY) + player->spriteOffsetY - screenY;
                        s32 temp6 = I(s->hitboxes[0].top * (Q(halfWidth) / hbWidth));

                        if (playerMiddleY >= temp6) {
                            if (!(player->moveState & MOVESTATE_IN_AIR) && (player->qSpeedGround > Q(4))
                                && (player->frameInput & gPlayerControls.jump)) {
                                if (halfWidth < (hbWidth / 2)) {
                                    player->transition = PLTRANS_RAMP_AND_DASHRING;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 1;
                                } else {
                                    player->transition = PLTRANS_RAMP_AND_DASHRING;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 2;
                                }
                            } else {
                                player->qWorldY += Q(temp6 - playerMiddleY);
                                player->rotation = 0;

                                player->moveState |= MOVESTATE_STOOD_ON_OBJ;
                                player->moveState &= ~MOVESTATE_IN_AIR;
                                player->stoodObj = s;
                            }
                        } else {
                            player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            player->moveState |= MOVESTATE_IN_AIR;
                        }
                    }
                } else {
                    player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                }
            }
        } else {
            if (var) {
                if (((ramp->unk3C & 2) != 0 && I(player->qWorldX) < s->x) || ((ramp->unk3C & 2) == 0 && I(player->qWorldX) > s->x)) {
                    if (!(player->moveState & MOVESTATE_IN_AIR) && player->qSpeedGround > Q(4)) {
                        player->transition = PLTRANS_RAMP_AND_DASHRING;
                        player->unk6E = (ramp->unk3C & 1) * 3;
                    }
                } else if (((ramp->unk3C & 2) != 0 && I(player->qWorldX) > s->x) || ((ramp->unk3C & 2) == 0 && I(player->qWorldX) < s->x)) {
                    player->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    player->stoodObj = NULL;
                }
            }
        }
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, screenX - gCamera.x, screenY - gCamera.y)) {
        me->x = ramp->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

static void TaskDestructor_Ramp(struct Task *t)
{
    Sprite_Ramp *ramp = TASK_DATA(t);
    VramFree(ramp->s.graphics.dest);
}
