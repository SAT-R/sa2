#include "global.h"
#include "core.h"
#include "sprite.h"

#include "task.h"
#include "malloc_vram.h"

#include "game/stage/player_controls.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/entity.h"
#include "sakit/interactables/ramp.h"

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
    struct Task *t
        = TaskCreate(Task_Ramp, sizeof(Sprite_Ramp), 0x2010, 0, TaskDestructor_Ramp);
    Sprite_Ramp *ramp = TASK_DATA(t);
    Sprite *s = &ramp->s;

    ramp->base.regionX = spriteRegionX;
    ramp->base.regionY = spriteRegionY;
    ramp->base.me = me;
    ramp->base.spriteX = me->x;
    ramp->base.spriteY = spriteY;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    temp = me->d.sData[0] & 3;
    ramp->unk3C = temp;

    s->graphics.dest = VramMalloc(20);
    s->graphics.anim = SA2_ANIM_RAMP;

    if (LEVEL_TO_ZONE(gCurrentLevel) == 5) {
        s->graphics.anim = SA2_ANIM_RAMP_TECHNO_BASE;
    }

    // required for match
    temp2 = temp;

    s->variant = temp2 & 1;
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = 0x10;
    s->palId = 0;
    s->hitboxes[0].index = -1;
    s->unk10 = 0x2200;

    if (temp & 2) {
        s->unk10 |= 0x400;
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

    if (!(player->moveState & MOVESTATE_400000)) {
        u32 r1;
        u32 var = FALSE;
        if (player->moveState & MOVESTATE_8 && player->unk3C == s) {
            var = TRUE;
        }

        r1 = sub_800CDBC(s, screenX, screenY, player);
        if (r1 != 0) {
            if (((r1 & 0x80000) && (ramp->unk3C & 2) && (player->speedAirX > -1))
                || ((r1 & 0x40000) && (!(ramp->unk3C & 2)) && (player->speedAirX < 1))) {

                player->x += (s16)(r1 & 0xFF00);

                player->speedAirX = 0;
                player->speedGroundX = 0;
            } else if (!(ramp->unk3C & 2)) {
                s32 temp8 = screenX + s->hitboxes[0].left;
                s32 temp2 = s->hitboxes[0].right - s->hitboxes[0].left;
                s32 temp9 = I(player->x) - temp8;
                if (temp9 > 0) {
                    if (temp9 > temp2) {
                        if (!(player->moveState & MOVESTATE_IN_AIR)
                            && (player->speedGroundX > Q(4))) {
                            player->transition = PLTRANS_PT22;
                            player->unk6E = (ramp->unk3C & 1) * 3;
                        }

                        player->moveState &= ~MOVESTATE_8;
                        player->moveState |= MOVESTATE_IN_AIR;
                    } else {
                        s32 temp4 = I(player->y) + player->unk17 - screenY;
                        s32 temp6 = I(s->hitboxes[0].top * (Q(temp9) / temp2));

                        if (temp4 >= temp6) {
                            if (!(player->moveState & MOVESTATE_IN_AIR)
                                && (player->speedGroundX > Q(4))
                                && (player->unk5E & gPlayerControls.jump)) {
                                if (temp9 < (temp2 / 2)) {
                                    player->transition = PLTRANS_PT22;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 1;
                                } else {
                                    player->transition = PLTRANS_PT22;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 2;
                                }
                            } else {
                                player->y += Q(temp6 - temp4);
                                player->rotation = 0;

                                player->moveState |= MOVESTATE_8;
                                player->moveState &= ~MOVESTATE_IN_AIR;
                                player->unk3C = s;
                            }
                        } else {
                            player->moveState &= ~MOVESTATE_8;
                            player->moveState |= MOVESTATE_IN_AIR;
                        }
                    }
                } else {
                    player->moveState &= ~MOVESTATE_8;
                }
            }
        } else {
            if (var) {
                if (((ramp->unk3C & 2) != 0 && I(player->x) < s->x)
                    || ((ramp->unk3C & 2) == 0 && I(player->x) > s->x)) {
                    if (!(player->moveState & MOVESTATE_IN_AIR)
                        && player->speedGroundX > Q(4)) {
                        player->transition = PLTRANS_PT22;
                        player->unk6E = (ramp->unk3C & 1) * 3;
                    }
                } else if (((ramp->unk3C & 2) != 0 && I(player->x) > s->x)
                           || ((ramp->unk3C & 2) == 0 && I(player->x) < s->x)) {
                    player->moveState &= ~MOVESTATE_8;
                    player->unk3C = NULL;
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
