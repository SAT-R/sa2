#include "global.h"
#include "core.h"
#include "sprite.h"
#include "game/entity.h"
#include "task.h"
#include "malloc_vram.h"
#include "constants/zones.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3C */ u16 unk3C;
} Sprite_Ramp /* size 0x40 */;

static void Task_Interactable_Ramp(void);
static void TaskDestructor_Interactable_Ramp(struct Task *);

void initSprite_Interactable_Ramp(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    u8 temp;
    s32 temp2;
    struct Task *t = TaskCreate(Task_Interactable_Ramp, sizeof(Sprite_Ramp), 0x2010, 0,
                                TaskDestructor_Interactable_Ramp);
    Sprite_Ramp *ramp = TaskGetStructPtr(t);
    Sprite *displayed = &ramp->displayed;

    ramp->base.regionX = spriteRegionX;
    ramp->base.regionY = spriteRegionY;
    ramp->base.me = me;
    ramp->base.spriteX = me->x;
    ramp->base.spriteY = spriteY;

    displayed->x = TO_WORLD_POS(me->x, spriteRegionX);
    displayed->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    temp = me->d.sData[0] & 3;
    ramp->unk3C = temp;

    displayed->graphics.dest = VramMalloc(20);
    displayed->graphics.anim = SA2_ANIM_RAMP;

    if (LEVEL_TO_ZONE(gCurrentLevel) == 5) {
        displayed->graphics.anim = 608;
    }

    // required for match
    temp2 = temp;

    displayed->variant = temp2 & 1;
    displayed->unk1A = 0x480;
    displayed->graphics.size = 0;
    displayed->unk14 = 0;
    displayed->unk1C = 0;
    displayed->unk21 = -1;
    displayed->unk22 = 0x10;
    displayed->focused = 0;
    displayed->unk28[0].unk0 = -1;
    displayed->unk10 = 0x2200;

    if (temp & 2) {
        displayed->unk10 |= 0x400;
    }
    sub_8004558(displayed);
}

static void Task_Interactable_Ramp(void)
{
    Player *player = &gPlayer;
    Sprite_Ramp *ramp = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &ramp->displayed;
    MapEntity *me = ramp->base.me;

    s16 screenX, screenY;

#ifndef NON_MATCHING
    do {
#endif

        screenX = TO_WORLD_POS(ramp->base.spriteX, ramp->base.regionX);
        screenY = TO_WORLD_POS(me->y, ramp->base.regionY);
        displayed->x = screenX - gCamera.x;
        displayed->y = screenY - gCamera.y;

#ifndef NON_MATCHING
    } while (0);
#endif

    if (!(player->moveState & MOVESTATE_400000)) {
        u32 r1;
        u32 var = FALSE;
        if (player->moveState & MOVESTATE_8 && player->unk3C == displayed) {
            var = TRUE;
        }

        r1 = sub_800CDBC(displayed, screenX, screenY, player);
        if (r1 != 0) {
            if (((r1 & 0x80000) && (ramp->unk3C & 2) && (player->speedAirX > -1))
                || ((r1 & 0x40000) && (!(ramp->unk3C & 2)) && (player->speedAirX < 1))) {

                player->x += (s16)(r1 & 0xFF00);

                player->speedAirX = 0;
                player->speedGroundX = 0;
            } else if (!(ramp->unk3C & 2)) {
                s32 temp8 = screenX + displayed->unk28[0].unk4;
                s32 temp2 = displayed->unk28[0].unk6 - displayed->unk28[0].unk4;
                s32 temp9 = Q_24_8_TO_INT(player->x) - temp8;
                if (temp9 > 0) {
                    if (temp9 > temp2) {
                        if (!(player->moveState & MOVESTATE_IN_AIR)
                            && (player->speedGroundX > Q_8_8(4))) {
                            player->unk6D = 0x16;
                            player->unk6E = (ramp->unk3C & 1) * 3;
                        }

                        player->moveState &= ~MOVESTATE_8;
                        player->moveState |= MOVESTATE_IN_AIR;
                    } else {
                        s32 temp4 = Q_24_8_TO_INT(player->y) + player->unk17 - screenY;
                        s32 temp6 = Q_24_8_TO_INT(displayed->unk28[0].unk5
                                                  * (Q_24_8(temp9) / temp2));

                        if (temp4 >= temp6) {
                            if (!(player->moveState & MOVESTATE_IN_AIR)
                                && (player->speedGroundX > Q_8_8(4))
                                && (player->unk5E & gPlayerControls.jump)) {
                                if (temp9 < (temp2 / 2)) {
                                    player->unk6D = 0x16;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 1;
                                } else {
                                    player->unk6D = 0x16;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 2;
                                }
                            } else {
                                player->y += Q_24_8(temp6 - temp4);
                                player->rotation = 0;

                                player->moveState |= MOVESTATE_8;
                                player->moveState &= ~MOVESTATE_IN_AIR;
                                player->unk3C = displayed;
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
                if (((ramp->unk3C & 2) != 0 && Q_24_8_TO_INT(player->x) < displayed->x)
                    || ((ramp->unk3C & 2) == 0
                        && Q_24_8_TO_INT(player->x) > displayed->x)) {
                    if (!(player->moveState & MOVESTATE_IN_AIR)
                        && player->speedGroundX > Q_8_8(4)) {
                        player->unk6D = 0x16;
                        player->unk6E = (ramp->unk3C & 1) * 3;
                    }
                } else if (((ramp->unk3C & 2) != 0
                            && Q_24_8_TO_INT(player->x) > displayed->x)
                           || ((ramp->unk3C & 2) == 0
                               && Q_24_8_TO_INT(player->x) < displayed->x)) {
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

    sub_80051E8(displayed);
}

static void TaskDestructor_Interactable_Ramp(struct Task *t)
{
    Sprite_Ramp *ramp = TaskGetStructPtr(t);
    VramFree(ramp->displayed.graphics.dest);
}
