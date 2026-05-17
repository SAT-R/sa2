#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "malloc_vram.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 unk3C;
    /* 0x40 */ u8 unk40;
    /* 0x41 */ u8 unk41;
} Flipper;

void Task_Flipper_Horizontal(void);
void Task_Flipper_Horizontal_2(void);
void Task_Flipper_Vertical(void);
void Task_Flipper_Vertical_2(void);
void TaskDestructor_Flipper(Task *t);

void CreateEntity_Flipper(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Flipper_Horizontal, sizeof(Flipper), 0x2000, 0, TaskDestructor_Flipper);
    Flipper *flipper = TASK_DATA(t);
    Sprite *s = &flipper->s;

    flipper->base.regionX = regionX;
    flipper->base.regionY = regionY;
    flipper->base.me = me;
    flipper->base.meX = me->x;
    flipper->base.id = id;

    flipper->unk3C = 0;
    flipper->unk40 = 0;
    flipper->unk41 = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_FLIPPER, 1);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_FLIPPER;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;

    if (me->d.sData[0] == 0) {
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1);
    } else {
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 0);
    }

    UpdateSpriteAnimation(s);
}

void Task_Flipper_Horizontal()
{
    Sprite *s;
    CamCoord worldX;
    CamCoord worldY;
    s32 pxHalf;
    MapEntity *me;
    Flipper *flipper;
    s16 px;
    s32 i;

    flipper = TASK_DATA(gCurTask);

    s = &flipper->s;
    me = flipper->base.me;
    worldX = TO_WORLD_POS(flipper->base.meX, flipper->base.regionX);
    worldY = TO_WORLD_POS(me->y, flipper->base.regionY);
    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
            px = worldX - I(PLAYER(i).qWorldX);
        } else {
            px = I(PLAYER(i).qWorldX) - worldX;
        }
        pxHalf = (s32)(u16)(px >> 1);
        if (Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i))) {
            if ((PLAYER(i).character == CHARACTER_KNUCKLES)
                && ((PLAYER(i).charState == CHARSTATE_70) || (PLAYER(i).charState == CHARSTATE_71) || (PLAYER(i).charState == CHARSTATE_72)
                    || (PLAYER(i).charState == CHARSTATE_73) || (PLAYER(i).charState == CHARSTATE_74)
                    || (PLAYER(i).charState == CHARSTATE_75))) {
                if (PLAYER(i).charState != CHARSTATE_73) {
                    Coll_Player_Platform(s, worldX, worldY, &PLAYER(i));

                    if ((PLAYER(i).moveState & 8) && (PLAYER(i).stoodObj == s)) {
                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                        PLAYER(i).charState = CHARSTATE_SPINATTACK;
                        PLAYER(i).moveState &= ~8;
                        PLAYER(i).moveState |= 4;
                        PLAYER(i).moveState |= 2;

                        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                            PLAYER(i).moveState |= 1;
                        } else {
                            PLAYER(i).moveState &= ~1;
                        }
                    }
                }
            } else {
                if (((PLAYER(i).qSpeedAirY >= 0) || ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && (PLAYER(i).stoodObj == s)))
                    && (PLAYER(i).qWorldY < Q(worldY) + Q(19)) && (PLAYER(i).moveState & 2)) {
                    if ((gPressedKeys & gPlayerControls.jump) && GetBit(flipper->unk41, i)) {
                        ClearBit(flipper->unk41, i);
                        PLAYER(i).moveState &= ~0x8;
                        PLAYER(i).moveState |= 2;
                        PLAYER(i).moveState &= ~0x100;
                        PLAYER(i).moveState |= 4;
                        PLAYER(i).moveState &= ~0x10;
                        if (DPAD_LEFT & gInput) {
                            PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                        } else if (DPAD_RIGHT & gInput) {
                            PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                        }
                        PLAYER(i).qSpeedAirY = 0xFFFFF840 - (px * 16);
                        if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                            PLAYER(i).qSpeedAirX = -(px * 32);
                            PLAYER(i).qSpeedGround = -(px * 32);
                        } else {
                            PLAYER(i).qSpeedAirX = +(px * 32);
                            PLAYER(i).qSpeedGround = +(px * 32);
                        }

                        Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                        PLAYER(i).charState = 5;
                        flipper->unk40 = 8;
                        flipper->unk3C = 0;
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                        PLAYER(i).moveState &= 0xFFDFFFFF;
                        PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                        s->graphics.anim = SA1_ANIM_FLIPPER;
                        s->variant = 1;
                        s->prevVariant = -1;

                        m4aSongNumStart(0xB7U);
                        gCurTask->main = Task_Flipper_Horizontal_2;
                    } else {

                        if ((s->frameFlags & SPRITE_FLAG_MASK_X_FLIP)) {
                            if (PLAYER(i).qWorldY > Q(worldY + (s16)pxHalf - 17)) {
                                PLAYER(i).qWorldY = Q(worldY + (s16)pxHalf - 17) + 1;
                                PLAYER(i).qSpeedAirY = 0;
                                PLAYER(i).qSpeedAirX = -Q(0.3125);
                                SetBit(flipper->unk41, i);
                                PLAYER(i).heldInput = 0;
                                PLAYER(i).frameInput = 0;
                                PLAYER(i).rotation = 0;
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                PLAYER(i).moveState |= 0x200000;
                                PLAYER(i).moveState |= 4;
                                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            } else {
                                if (GetBit(flipper->unk41, i)) {
                                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                    PLAYER(i).moveState |= 2;
                                    PLAYER(i).moveState &= ~0x100;
                                    PLAYER(i).moveState |= 4;
                                    PLAYER(i).moveState &= ~0x10;
                                    PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                                    PLAYER(i).qWorldY = Q(worldY + (s16)pxHalf - 17) + 1;
                                    PLAYER(i).qSpeedAirY = 0;
                                    PLAYER(i).qSpeedAirX = -Q(0.3125);
                                    PLAYER(i).heldInput = 0;
                                    PLAYER(i).frameInput = 0;
                                    PLAYER(i).moveState |= 0x200000;
                                } else {
                                    PLAYER(i).moveState &= 0xFFDFFFFF;
                                    PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                                }
                            }
                        } else {
                            if (PLAYER(i).qWorldY > Q(worldY + (s16)pxHalf - 17)) {
                                PLAYER(i).qWorldY = Q(worldY + (s16)pxHalf - 17) + 1;
                                PLAYER(i).qSpeedAirY = 0;
                                PLAYER(i).qSpeedAirX = +Q(0.3125);
                                SetBit(flipper->unk41, i);
                                PLAYER(i).heldInput = 0;
                                PLAYER(i).frameInput = 0;
                                PLAYER(i).rotation = 0;
                                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                PLAYER(i).moveState |= 0x200000;
                                PLAYER(i).moveState |= 4;
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);
                            } else {
                                if (GetBit(flipper->unk41, i)) {
                                    PLAYER(i).moveState |= 2;
                                    PLAYER(i).moveState &= ~0x100;
                                    PLAYER(i).moveState |= 4;
                                    PLAYER(i).moveState &= ~0x10;
                                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                                    PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 9);

                                    PLAYER(i).qWorldY = Q((worldY + (s16)pxHalf) - 17) + 1;
                                    PLAYER(i).qSpeedAirY = 0;
                                    PLAYER(i).qSpeedAirX = +Q(0.3125);
                                    PLAYER(i).heldInput = 0;
                                    PLAYER(i).frameInput = 0;
                                    PLAYER(i).moveState |= 0x200000;
                                } else {
                                    PLAYER(i).moveState &= 0xFFDFFFFF;
                                    PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                                }
                            }
                        }
                    }
                } else {
                    if (PLAYER(i).qWorldY <= Q(worldY)) {
                        PLAYER(i).moveState |= 2;
                    } else if (PLAYER(i).qWorldY < Q(worldY) + Q(24)) {
                        PLAYER(i).qWorldY = Q(worldY) + Q(24);
                        PLAYER(i).qSpeedAirY = 10;
                        PLAYER(i).qSpeedAirX = 0;
                        PLAYER(i).qSpeedGround = 0;
                    }
                }
            }
        } else {
            if (GetBit(flipper->unk41, i)) {
                PLAYER(i).moveState &= 0xFFDFFFFF;
                PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                if (s->frameFlags & SPRITE_FLAG_MASK_X_FLIP) {
                    PLAYER(i).qSpeedAirX = -Q(1);
                } else {
                    PLAYER(i).qSpeedAirX = +Q(1);
                }
            }
            ClearBit(flipper->unk41, i);
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        s32 i = 0;
        do {
            if (GetBit(flipper->unk41, i)) {
                PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
            }
        } while (++i < gNumSingleplayerCharacters);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, flipper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

void Task_Flipper_Horizontal_2(void)
{
    Flipper *flipper = TASK_DATA(gCurTask);
    Sprite *s = &flipper->s;
    MapEntity *me = flipper->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(flipper->base.meX, flipper->base.regionX);
    worldY = TO_WORLD_POS(me->y, flipper->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, flipper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    flipper->unk40--;

    if (flipper->unk40 == 0) {
        s->graphics.anim = SA1_ANIM_FLIPPER;
        s->variant = 0;
        s->prevVariant = -1;

        gCurTask->main = Task_Flipper_Horizontal;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateEntity_Flipper_Vertical(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Flipper_Vertical, sizeof(Flipper), 0x2000, 0, TaskDestructor_Flipper);
    Flipper *flipper = TASK_DATA(t);
    Sprite *s = &flipper->s;

    flipper->base.regionX = regionX;
    flipper->base.regionY = regionY;
    flipper->base.me = me;
    flipper->base.meX = me->x;
    flipper->base.id = id;

    flipper->unk3C = 0;
    flipper->unk40 = 0;
    flipper->unk41 = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES_VARIANT(SA1_ANIM_FLIPPER, 3);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_FLIPPER;
    s->variant = 2;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_Flipper_Vertical(void)
{
    Sprite *s;
    CamCoord worldX, worldY;
    MapEntity *me;
    Flipper *flipper;
    s32 i;

    flipper = TASK_DATA(gCurTask);
    s = &flipper->s;
    me = flipper->base.me;

    worldX = TO_WORLD_POS(flipper->base.meX, flipper->base.regionX);
    worldY = TO_WORLD_POS(me->y, flipper->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if ((PLAYER(i).moveState & MOVESTATE_IN_AIR) || GetBit(flipper->unk41, i)) {
                if (Coll_Player_Platform(s, worldX, worldY, &PLAYER(i)) & COLL_FLAG_8) {
                    SetBit(flipper->unk41, i);

                    if (!Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i))) {
                        if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && PLAYER(i).stoodObj == s) {
                            PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                            continue;
                        }
                    }
                } else {
                    if (GetBit(flipper->unk41, i)) {
                        ClearBit(flipper->unk41, i);
                        PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    }
                }
            } else {
                if (Q(worldY) < PLAYER(i).qWorldY) {
                    if (Q(worldX) > PLAYER(i).qWorldX) {
                        if (Coll_Player_Entity_Intersection(s, worldX - 6, worldY, &PLAYER(i))) {
                            PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                            PLAYER(i).qSpeedAirX = -Q(10);
                            PLAYER(i).qSpeedGround = -Q(10);

                            SPRITE_FLAG_SET(s, X_FLIP);

                            flipper->unk40 = 8;

                            s->graphics.anim = SA1_ANIM_FLIPPER;
                            s->variant = 3;
                            s->prevVariant = -1;
                            m4aSongNumStart(SE_BUMPER_A);

                            gCurTask->main = Task_Flipper_Vertical_2;
                        }
                    } else {
                        if (Coll_Player_Entity_Intersection(s, worldX + 7, worldY, &PLAYER(i))) {
                            PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                            PLAYER(i).qSpeedAirX = +Q(10);
                            PLAYER(i).qSpeedGround = +Q(10);

                            SPRITE_FLAG_CLEAR(s, X_FLIP);

                            flipper->unk40 = 8;

                            s->graphics.anim = SA1_ANIM_FLIPPER;
                            s->variant = 3;
                            s->prevVariant = -1;
                            m4aSongNumStart(SE_BUMPER_A);

                            gCurTask->main = Task_Flipper_Vertical_2;
                        }
                    }
                }
            }
        } else {
            if (GetBit(flipper->unk41, i)) {
                ClearBit(flipper->unk41, i);
                PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, flipper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void Task_Flipper_Vertical_2(void)
{
    Flipper *flipper = TASK_DATA(gCurTask);
    Sprite *s = &flipper->s;
    MapEntity *me = flipper->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(flipper->base.meX, flipper->base.regionX);
    worldY = TO_WORLD_POS(me->y, flipper->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, flipper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    flipper->unk40--;

    if (flipper->unk40 == 0) {
        s->graphics.anim = SA1_ANIM_FLIPPER;
        s->variant = 2;
        s->prevVariant = -1;

        gCurTask->main = Task_Flipper_Vertical;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_Flipper(Task *t)
{
    Flipper *flipper = TASK_DATA(t);
    VramFree(flipper->s.graphics.dest);
}