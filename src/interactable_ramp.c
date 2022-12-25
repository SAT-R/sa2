#include "global.h"
#include "main.h"
#include "sprite.h"
#include "interactable.h"
#include "task.h"
#include "malloc_vram.h"
#include "zones.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite displayed;
    /* 0x3C */ u16 unk3C;
} Ramp /* size 0x40 */;

void sub_800FAF4(void);

void TaskDestructor_800FE24(struct Task *);

void initSprite_Interactable_Ramp(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                  u8 spriteY)
{
    u8 temp;
    s32 temp2;
    struct Task *t = TaskCreate(sub_800FAF4, 0x40, 0x2010, 0, TaskDestructor_800FE24);
    Ramp *ramp = TaskGetStructPtr(t);
    Sprite *displayed = &ramp->displayed;

    ramp->base.regionX = spriteRegionX;
    ramp->base.regionY = spriteRegionY;
    ramp->base.ia = ia;
    ramp->base.spriteX = ia->x;
    ramp->base.spriteY = spriteY;

    displayed->x = SpriteGetScreenPos(ia->x, spriteRegionX);
    displayed->y = SpriteGetScreenPos(ia->y, spriteRegionY);
    SET_SPRITE_INITIALIZED(ia);

    temp = ia->d.sData[0] & 3;
    ramp->unk3C = temp;

    displayed->graphics.dest = VramMalloc(0x14);
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

void sub_800FAF4(void)
{
    Player *player = &gPlayer;
    Ramp *ramp = TaskGetStructPtr(gCurTask);
    Sprite *displayed = &ramp->displayed;
    Interactable *ia = ramp->base.ia;

    s16 screenX, screenY;

#ifndef NON_MATCHING
    do {
#endif

        screenX = SpriteGetScreenPos(ramp->base.spriteX, ramp->base.regionX);
        screenY = SpriteGetScreenPos(ia->y, ramp->base.regionY);
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
                s32 temp9 = ((player->x >> 8) - temp8);
                if (temp9 > 0) {
                    if (temp9 > temp2) {
                        if (!(player->moveState & 2) && (player->speedGroundX > 0x400)) {
                            player->unk6D = 0x16;
                            player->unk6E = (ramp->unk3C & 1) * 3;
                        }

                        player->moveState &= ~MOVESTATE_8;
                        player->moveState |= MOVESTATE_IN_AIR;
                    } else {
                        s32 temp4 = (player->y >> 8) + player->unk17 - screenY;
                        s32 temp6
                            = ((displayed->unk28[0].unk5) * ((temp9 * 256) / temp2))
                            >> 8;

                        if (temp4 >= temp6) {
                            if (!(player->moveState & 2)
                                && (player->speedGroundX > 0x400)
                                && (player->unk5E & gPlayerControls.unk0)) {
                                if (temp9 < (temp2 / 2)) {
                                    player->unk6D = 0x16;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 1;
                                } else {
                                    player->unk6D = 0x16;
                                    player->unk6E = ((ramp->unk3C & 1) * 3) + 2;
                                }
                            } else {
                                player->y += (temp6 - temp4) * 256;
                                player->unk24 = 0;

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
                if (((ramp->unk3C & 2) != 0 && (player->x >> 8) < (s16)displayed->x)
                    || ((ramp->unk3C & 2) == 0
                        && (player->x >> 8) > (s16)displayed->x)) {
                    if ((player->moveState & 2) == 0 && player->speedGroundX > 0x400) {
                        player->unk6D = 0x16;
                        player->unk6E = (ramp->unk3C & 1) * 3;
                    }
                } else if (((ramp->unk3C & 2) != 0
                            && (player->x >> 8) > (s16)displayed->x)
                           || ((ramp->unk3C & 2) == 0
                               && (player->x >> 8) < (s16)displayed->x)) {
                    player->moveState &= ~MOVESTATE_8;
                    player->unk3C = NULL;
                }
            }
        }
    }

    if (((u32)(screenX - gCamera.x) + 0x80) > 0x1F0 || ((screenY - gCamera.y) + 0x80) < 0
        || (screenY - gCamera.y) > 0x120) {
        ia->x = ramp->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    sub_80051E8(displayed);
}

void TaskDestructor_800FE24(struct Task *t)
{
    Ramp *ramp = TaskGetStructPtr(t);
    VramFree(ramp->displayed.graphics.dest);
}
