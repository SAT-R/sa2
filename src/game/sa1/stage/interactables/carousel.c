#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h" // gPlayerControls
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s1;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ u16 unk6C;
    /* 0x6E */ u16 unk6E;
    /* 0x70 */ u32 unk70;
    /* 0x74 */ u16 unk74;
    /* 0x74 */ u16 unk76;
    /* 0x78 */ u8 unk78;
    /* 0x79 */ u8 unk79;
} Carousel;

void Task_CarouselIdle(void);
void Task_RidingCarousel(void);
void Task_ExitCarousel(void);
void TaskDestructor_Carousel(Task *t);

void CreateEntity_Carousel(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_CarouselIdle, sizeof(Carousel), 0x2000, 0, TaskDestructor_Carousel);
    Carousel *carousel = TASK_DATA(t);
    Sprite *s1 = &carousel->s1;
    Sprite *s2 = &carousel->s2;
    CamCoord worldX, worldY;

    carousel->base.regionX = regionX;
    carousel->base.regionY = regionY;
    carousel->base.me = me;
    carousel->base.meX = me->x;
    carousel->base.id = id;

    carousel->unk70 = 0;
    carousel->unk76 = 0;
    carousel->unk74 = 0;
    carousel->unk6E = 0;
    carousel->unk6C = 0;
    carousel->unk78 = 0;
    carousel->unk79 = 0;

    {
        // // NOTE: Initializing sprite pos to world pos
        s1->x = TO_WORLD_POS(me->x, regionX);
        s1->y = TO_WORLD_POS(me->y, regionY);

        SET_MAP_ENTITY_INITIALIZED(me);

        s1->graphics.dest = ALLOC_TILES(SA1_ANIM_CAROUSEL);
        s1->oamFlags = SPRITE_OAM_ORDER(18);
        s1->graphics.size = 0;
        s1->graphics.anim = SA1_ANIM_CAROUSEL;
        s1->variant = 0;
        s1->animCursor = 0;
        s1->qAnimDelay = Q(0);
        s1->prevVariant = -1;
        s1->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s1->palId = 0;
        s1->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s1->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }

    {
        s2->graphics.dest = ALLOC_TILES(SA1_ANIM_CAROUSEL_POLE);
        s2->graphics.anim = SA1_ANIM_CAROUSEL_POLE;
        s2->variant = 0;
        s2->oamFlags = SPRITE_OAM_ORDER(18);
        s2->graphics.size = 0;
        s2->animCursor = 0;
        s2->qAnimDelay = Q(0);
        s2->prevVariant = -1;
        s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
        s2->palId = 0;
        s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
        s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }

    UpdateSpriteAnimation(s1);
    UpdateSpriteAnimation(s2);
}

// (97.13%)
NONMATCH("asm/non_matching/game/sa1/stage/interactables/carousel__Task_CarouselIdle.inc", void Task_CarouselIdle(void))
{
    Carousel *carousel = TASK_DATA(gCurTask);
    Sprite *s1 = &carousel->s1;
    Sprite *s2 = &carousel->s2;
    CamCoord worldX, worldY;
    MapEntity *me = carousel->base.me;
    s32 i;

    worldX = TO_WORLD_POS(carousel->base.meX, carousel->base.regionX);
    worldY = TO_WORLD_POS(me->y, carousel->base.regionY);

    s1->x = worldX - gCamera.x;
    s1->y = worldY - gCamera.y;
    s2->x = s1->x;
    s2->y = s1->y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s1->x, s1->y)) {
        // _080857BC
        SET_MAP_ENTITY_NOT_INITIALIZED(me, carousel->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    // _080857DC
    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (PLAYER(i).character == CHARACTER_KNUCKLES) {
                // _08085832
                if ((PLAYER(i).charState == CHARSTATE_70) || (PLAYER(i).charState == CHARSTATE_71) || (PLAYER(i).charState == CHARSTATE_72)
                    || (PLAYER(i).charState == CHARSTATE_73) || (PLAYER(i).charState == CHARSTATE_74)
                    || (PLAYER(i).charState == CHARSTATE_75)) {
                    continue;
                }
            }
            // _08085906

            Coll_Player_PlatformCrumbling(s1, worldX, worldY, &PLAYER(i));

            if ((worldX - 8 <= I(PLAYER(i).qWorldX)) && (worldX + 8 >= I(PLAYER(i).qWorldX)) && (worldY - 48 <= I(PLAYER(i).qWorldY))
                && (worldY + 12 >= I(PLAYER(i).qWorldY))) {
                // _080859AA
                s32 tempX;
                SetBit(carousel->unk79, i);

                carousel->unk6E = ABS2(PLAYER(i).qSpeedAirX) << 2;

                carousel->unk6C = (Div(Q(I(PLAYER(i).qWorldX) - worldX + 48) << 1, 0x60) < 0)
                    ? (0x300 - Div(Q(I(PLAYER(i).qWorldX) - worldX + 48) << 1, 0x60)) & 0x3FF
                    : (0x300 + Div(Q(I(PLAYER(i).qWorldX) - worldX + 48) << 1, 0x60)) & 0x3FF;
                // _08085A66

                carousel->unk70 = 0;
                carousel->unk76 = 0;
                carousel->unk74 = 0;
                PLAYER(i).qSpeedAirX = Q(0);
                // _08085A8A

                if (PLAYER(i).qSpeedGround > Q(0)) {
                    carousel->unk78 = 1;
                    PLAYER(i).qSpeedGround = +Q(7.5);
                } else {
                    // _08085AC2
                    carousel->unk78 = 0;
                    PLAYER(i).qSpeedGround = -Q(7.5);
                }
                // _08085ADC
                PLAYER(i).heldInput = 0;
                PLAYER(i).frameInput = 0;
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).charState = CHARSTATE_33;
                PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                m4aSongNumStart(SE_CAROUSEL_A);
                gCurTask->main = Task_RidingCarousel;
                PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    DisplaySprite(s1);
    DisplaySprite(s2);
}
END_NONMATCH

// (94.31%) https://decomp.me/scratch/YMgk7
NONMATCH("asm/non_matching/game/sa1/stage/interactables/carousel__Task_RidingCarousel.inc", void Task_RidingCarousel(void))
{
    Carousel *carousel = TASK_DATA(gCurTask);
    Sprite *s1 = &carousel->s1;
    Sprite *s2 = &carousel->s2;
    CamCoord worldX, worldY;
    MapEntity *me = carousel->base.me;
    s32 i;

    worldX = TO_WORLD_POS(carousel->base.meX, carousel->base.regionX);
    worldY = TO_WORLD_POS(me->y, carousel->base.regionY);

    s1->x = worldX - gCamera.x;
    s1->y = worldY - gCamera.y + (carousel->unk70 >> 13) + 2;
    s2->x = s1->x;
    s2->y = s1->y + 2;

    i = 0;
    do {
        // _08085C2C_loop
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && GetBit(carousel->unk79, i)) {
            // _08085C6E + 0x4
            PLAYER(i).qWorldX = Q(worldX);
            PLAYER(i).qWorldY = Q(worldY + (carousel->unk70 >> 13));
        }
        // TODO: Redundant?
        if (!GetBit(carousel->unk79, i)) {
            // _08085CBC
            s32 yVal = worldY + ((carousel->unk70 << 3) >> 16);
            u32 res = Coll_Player_PlatformCrumbling(s1, worldX, yVal, &PLAYER(i));
            if ((res & COLL_FLAG_8) && !GetBit(carousel->unk79, i)) {
                PLAYER(i).qWorldY = Q(yVal);
            } else {
                // _08085D14

                if (!Coll_Player_Entity_Intersection(s1, worldX, yVal, &PLAYER(i))) {
                    if (!GetBit(carousel->unk79, i)) {
                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    }
                }
            }
            // _08085D6A

            if ((worldX - 8 <= I(PLAYER(i).qWorldX)) && (worldX + 8 >= I(PLAYER(i).qWorldX)) && (worldY - 48 <= I(PLAYER(i).qWorldY))
                && (worldY + 12 >= I(PLAYER(i).qWorldY))) {
                // _08085DF6
                if (carousel->unk70 < 0x3C2A58) {
                    SetBit(carousel->unk79, i);
                    PLAYER(i).qSpeedAirX = Q(0);

                    if (PLAYER(i).qSpeedGround > Q(0)) {
                        // _08085E3C
                        PLAYER(i).qSpeedGround = +Q(7.5);
                    } else {
                        // _08085E4E
                        PLAYER(i).qSpeedGround = -Q(7.5);
                    }
                    // _08085E60
                    PLAYER(i).heldInput = 0;
                    PLAYER(i).frameInput = 0;

                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).charState = CHARSTATE_33;
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                    PLAYER(i).itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);
    // _08085EF8

    if (carousel->unk70 >= 0x3C2A58) {
        s32 i = 0;
        do {
            // _08085F12_loop
            if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if (GetBit(carousel->unk79, i)) {
                    PLAYER(i).qSpeedAirX = Div((((carousel->unk6E >> 2) - 0x7D0) << 1), 3);
                    PLAYER(i).qSpeedGround = Div((((carousel->unk6E >> 2) - 0x7D0) << 1), 3);
                }
            }
        } while (++i < gNumSingleplayerCharacters);
    } else {
        // _08085F9C
        carousel->unk6E += 0x40;
    }

    if (carousel->unk6E > 0x8000) {
        carousel->unk6E = 0x8000;
    }

    s1->animSpeed = Div(carousel->unk6E * 35, 0xA000);

    if (s1->animSpeed > SPRITE_ANIM_SPEED(1.0)) {
        s1->animSpeed = SPRITE_ANIM_SPEED(1.0);
    }

    // _08085FDC + ???
    carousel->unk70 += carousel->unk6E;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s1->x, s1->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, carousel->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    // _08086064
    i = 0;
    do {
        // _08086074_loop
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD) && GetBit(carousel->unk79, i)) {
            if (carousel->unk70 >= 0x3C2A58) {
                carousel->unk70 = 0x3C2A58;

                if (i == 0) {
                    carousel->unk76++;
                }
                // _080860BC

                if (carousel->unk76 >= 300 || PLAYER(i).heldInput & DPAD_SIDEWAYS) {
                    // _080860E8
                    s32 qSpeed;
                    carousel->unk76 = 300;

                    if (PLAYER(i).heldInput & DPAD_LEFT) {
                        if (PLAYER(i).qSpeedGround > 0) {
                            PLAYER(i).qSpeedGround *= -1;
                            PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                        } else {
                            PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                        }
                    }
                    // _0808615C
                    else if (PLAYER(i).heldInput & DPAD_RIGHT) {
                        if (PLAYER(i).qSpeedGround < 0) {
                            PLAYER(i).qSpeedGround *= -1;
                            PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                        } else {
                            PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                        }
                    } else if (carousel->unk78 == 0) {
                        PLAYER(i).qSpeedGround *= -1;
                        PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                    } else {
                        PLAYER(i).qSpeedAirX = PLAYER(i).qSpeedGround;
                    }
                    {
                        // _080861C8

                        ClearBit(carousel->unk79, i);

                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                        PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                        PLAYER(i).moveState |= MOVESTATE_FLIP_WITH_MOVE_DIR;
                        PLAYER(i).moveState |= MOVESTATE_IN_AIR;
                        PLAYER(i).charState = CHARSTATE_WALK_A;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                        PLAYER(i).qSpeedAirY = Q(0);
                        // _080862C2

                        PLAYER(i).qWorldX = Q(worldX);
                        gCurTask->main = Task_ExitCarousel;
                        PLAYER(i).itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                        {
                            PlayerSpriteInfo **psi = &PLAYER(i).spriteInfoBody;
                            (*psi)->s.oamFlags = SPRITE_OAM_ORDER(16);
                        }
                    }
                }
            }
        } else if (PLAYER(i).moveState & MOVESTATE_DEAD) {
            // _08086314
            if (carousel->unk70 > 0x3C2A58) {
                carousel->unk70 = 0x3C2A58;
            }
            // _0808633A
            PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;

            if (i == 0) {
                carousel->unk76++;
            }

            if (carousel->unk76 > 300) {
                gCurTask->main = Task_ExitCarousel;
            }
        }
    } while (++i < gNumSingleplayerCharacters);
    // _0808638A

    carousel->unk74++;

    if (carousel->unk6E < Q(50)) {
        if (carousel->unk6E != Q(0)) {
            if (Mod(carousel->unk74, 25) == 0) {
                m4aSongNumStart(SE_CAROUSEL_A);
            }
        }
    } else if (carousel->unk6E < Q(75)) {
        if (Mod(carousel->unk74, 16) == 0) {
            m4aSongNumStart(SE_CAROUSEL_B);
        }
    } else {
        if (Mod(carousel->unk74, 8) == 0) {
            m4aSongNumStart(SE_CAROUSEL_C);
        }
    }

    UpdateSpriteAnimation(s1);
    DisplaySprite(s1);
    DisplaySprite(s2);
}
END_NONMATCH

void Task_ExitCarousel(void)
{
    Carousel *carousel = TASK_DATA(gCurTask);
    Sprite *s1 = &carousel->s1;
    Sprite *s2 = &carousel->s2;
    CamCoord worldX, worldY;
    MapEntity *me = carousel->base.me;
    s32 i;

    worldX = TO_WORLD_POS(carousel->base.meX, carousel->base.regionX);
    worldY = TO_WORLD_POS(me->y, carousel->base.regionY);

    s1->x = worldX - gCamera.x;
    s1->y = worldY - gCamera.y + (carousel->unk70 >> 13);
    s2->x = s1->x;
    s2->y = s1->y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            Coll_Player_PlatformCrumbling(s1, worldX, worldY + (carousel->unk70 >> 13), &PLAYER(i));
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s1->x, s1->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, carousel->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s1);
    DisplaySprite(s2);
}

void TaskDestructor_Carousel(Task *t)
{
    Carousel *carousel = TASK_DATA(t);
    VramFree(carousel->s1.graphics.dest);
    VramFree(carousel->s2.graphics.dest);
}