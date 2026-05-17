#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/player_controls.h" // for gPlayerControls
#include "game/sa1/stage/stage_ui.h" // sub_80549FC

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ MapEntity *me;
    /* 0x04 */ Sprite s;
    /* 0x34 */ u16 regionX;
    /* 0x36 */ u16 regionY;
    /* 0x38 */ u8 unk38[2];
    /* 0x38 */ u8 unk3A[2];
    /* 0x3C */ u8 meX;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E;
} Waterfall;

#if !defined(NON_MATCHING)
#define WATERFALL_SIZE 0x3F
#else
#define WATERFALL_SIZE sizeof(Waterfall)
#endif

void Task_Waterfall(void);
void Task_WaterfallZone5(void);
void TaskDestructor_Waterfall(Task *t);

extern AnimId gUnknown_086CED28[NUM_LEVEL_IDS];

void CreateEntity_Waterfall(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t;
    Sprite *s;
    Waterfall *waterfall;
    s32 zero;

    if (LEVEL_TO_ZONE(gCurrentLevel) == ZONE_5) {
        t = TaskCreate(Task_WaterfallZone5, WATERFALL_SIZE, 0x2000, 0, TaskDestructor_Waterfall);
    } else {
        t = TaskCreate(Task_Waterfall, WATERFALL_SIZE, 0x2000, 0, TaskDestructor_Waterfall);
    }

    TASK_SET_MEMBER(Waterfall, t, u16, regionX, regionX);
    TASK_SET_MEMBER(Waterfall, t, u16, regionY, regionY);
    TASK_SET_MEMBER(Waterfall, t, u16, unk38, 0);
    TASK_SET_MEMBER(Waterfall, t, u16, unk3A, 0);
    TASK_SET_MEMBER(Waterfall, t, u16, unk3A, 0);
    TASK_SET_MEMBER(Waterfall, t, u16, unk3A, 0);
    TASK_SET_MEMBER(Waterfall, t, MapEntity *, me, me);

    s = &TASK_GET_MEMBER(Waterfall, t, Sprite, s);
    TASK_SET_MEMBER(Waterfall, t, u8, unk3D, 0);
    TASK_SET_MEMBER(Waterfall, t, u8, unk3E, 0);
    TASK_SET_MEMBER(Waterfall, t, u8, meX, me->x);

    SET_MAP_ENTITY_INITIALIZED(me);

    // TODO: ALLOC_TILES() max from SA1_ANIM_WATER_SPLASH_1 | 5
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WATER_SPLASH);
#ifndef NON_MATCHING
    asm("mov %0, #0" : "=r"(zero));
#else
    zero = 0;
#endif
    s->oamFlags = SPRITE_OAM_ORDER(5);
    s->graphics.size = zero;
    s->graphics.anim = gUnknown_086CED28[gCurrentLevel];
    s->variant = 0;
    s->animCursor = zero;
    s->qAnimDelay = zero;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_Waterfall(void)
{
    u8 meX;
    u16 regionX;
    u16 regionY;
    CamCoord x, y;
    u8 unk3D;
    u8 unk3E;
    s32 i;
    Sprite *s;
    MapEntity *me;

    me = TASK_GET_MEMBER(Waterfall, gCurTask, MapEntity *, me);
    meX = TASK_GET_MEMBER(Waterfall, gCurTask, u8, meX);
    regionX = TASK_GET_MEMBER(Waterfall, gCurTask, u16, regionX);
    regionY = TASK_GET_MEMBER(Waterfall, gCurTask, u16, regionY);
    s = &TASK_GET_MEMBER(Waterfall, gCurTask, Sprite, s);
    unk3D = TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk3D);
    unk3E = TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk3E);

    // world x|y
    x = TO_WORLD_POS(meX, regionX);
    y = TO_WORLD_POS(me->y, regionY);

    // screen x|y
    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        s32 i = 0;
        do {
            if (TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk3A[i]) == 1) {
#ifndef NON_MATCHING
                PLAYER(i).qSpeedAirY = Div(PLAYER(i).qSpeedAirY, 2);
#else
                PLAYER(i).qSpeedAirY >>= 1;
#endif
            }
        } while (++i < gNumSingleplayerCharacters);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, meX);
        TaskDestroy(gCurTask);
        return;
    }

    // world x|y
    x += gCamera.x;
    y += gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            // NOTE: Changing something unrelated matches this if, so it might not be the nonmatch-cause
            if ((x <= I(PLAYER(i).qWorldX)) && (x + me->d.uData[2] * TILE_WIDTH >= I(PLAYER(i).qWorldX))
                && (y + me->d.sData[1] * TILE_WIDTH <= I(PLAYER(i).qWorldY))
                && (y + me->d.sData[1] * TILE_WIDTH + me->d.uData[3] * TILE_WIDTH) >= I(PLAYER(i).qWorldY)) {
                if (!sub_80549FC()) {
#ifndef NON_MATCHING
                    // NOTE: Redundant check
                    if (!(PLAYER(i).moveState & MOVESTATE_DEAD))
#endif
                    {
                        PLAYER(i).qSpeedAirY += Q(16 / 256.);
                    }
                }

                s->x = I(PLAYER(i).qWorldX) - gCamera.x;
                s->y = I(PLAYER(i).qWorldY) - gCamera.y + 10;

                UpdateSpriteAnimation(s);
                DisplaySprite(s);

                TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3A[i], TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk38[i]));
            } else {
                TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk38[i], 0);
                TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3A[i], TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk38[i]));
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3D, unk3D);
    TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3E, unk3E);
}

void Task_WaterfallZone5(void)
{
    u8 meX;
    u16 regionX;
    u16 regionY;
    CamCoord x, y;
    Sprite *s;
    u8 unk3D;
    u8 unk3E;
    s32 i;
    MapEntity *me;

    me = TASK_GET_MEMBER(Waterfall, gCurTask, MapEntity *, me);
    meX = TASK_GET_MEMBER(Waterfall, gCurTask, u8, meX);
    regionX = TASK_GET_MEMBER(Waterfall, gCurTask, u16, regionX);
    regionY = TASK_GET_MEMBER(Waterfall, gCurTask, u16, regionY);
    s = &TASK_GET_MEMBER(Waterfall, gCurTask, Sprite, s);
    unk3D = TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk3D);
    unk3E = TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk3E);

    // world x|y
    x = TO_WORLD_POS(meX, regionX);
    y = TO_WORLD_POS(me->y, regionY);

    // screen x|y
    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        s32 i = 0;
        do {
            if (TASK_GET_MEMBER(Waterfall, gCurTask, u16, unk3A) == 1) {
#ifndef NON_MATCHING
                PLAYER(i).qSpeedAirY = Div(PLAYER(i).qSpeedAirY, 2);
#else
                PLAYER(i).qSpeedAirY >>= 1;
#endif
            }
        } while (++i < gNumSingleplayerCharacters);

        if (unk3D != 0) {
            m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
        }

        SET_MAP_ENTITY_NOT_INITIALIZED(me, meX);
        TaskDestroy(gCurTask);
        return;
    }

    // world x|y
    x += gCamera.x;
    y += gCamera.y;

    UpdateSpriteAnimation(s);

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            // NOTE: Changing something unrelated matches this if, so it might not be the nonmatch-cause
            if ((x <= I(PLAYER(i).qWorldX)) && (x + me->d.uData[2] * TILE_WIDTH >= I(PLAYER(i).qWorldX))
                && (y + me->d.sData[1] * TILE_WIDTH <= I(PLAYER(i).qWorldY))
                && (y + me->d.sData[1] * TILE_WIDTH + me->d.uData[3] * TILE_WIDTH) >= I(PLAYER(i).qWorldY)) {
                if ((PLAYER(i).qSpeedAirY >= 0) && (!(PLAYER(i).moveState & MOVESTATE_DEAD))) {
                    {
                        if (unk3D == 0) {
                            unk3D = 1;
                            m4aSongNumStart(SE_201);
                        }
                        if (PLAYER(i).frameInput & gPlayerControls.jump) {
                            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                            if (PLAYER(i).character != CHARACTER_AMY) {
                                PLAYER(i).charState = CHARSTATE_SPINATTACK;
                            } else {
                                PLAYER(i).charState = CHARSTATE_85;
                            }

#ifndef NON_MATCHING
                            PLAYER(i).qSpeedAirY = -Div(Q(4.875), 2);
#else
                            PLAYER(i).qSpeedAirY = -(Q(4.875) >> 1);
#endif
                        } else {
                            /* Jump Button NOT held */

                            if (PLAYER(i).character == CHARACTER_KNUCKLES) {
                                if (PLAYER(i).charState == CHARSTATE_KNUCKLES_GLIDE) {
                                    PLAYER(i).charState = CHARSTATE_WALK_A;
                                    PLAYER(i).qSpeedGround = Q(0);
                                    PLAYER(i).qSpeedAirX = Q(0);

                                    if (PLAYER(i).moveState & MOVESTATE_FACING_LEFT) {
                                        // TODO: Uhh, this is kinda stupid?
                                        PLAYER(i).moveState = MOVESTATE_FACING_LEFT;
                                    } else {
                                        PLAYER(i).moveState = 0;
                                    }
                                }

                                if ((PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                                    if ((PLAYER(i).frameInput & gPlayerControls.attack)) {
                                        PLAYER(i).qSpeedGround = Q(0);
                                        PLAYER(i).qSpeedAirX = Q(0);
                                    }
                                } else {
                                    if (PLAYER(i).frameInput & gPlayerControls.jump) {
                                        PLAYER(i).qSpeedGround = Q(0);
                                        PLAYER(i).qSpeedAirX = Q(0);
                                    }
                                }
                            }
                            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));

                            PLAYER(i).moveState &= ~MOVESTATE_IN_AIR;
                            PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).charState = CHARSTATE_WALK_A;
                            PLAYER(i).qWorldY += Q(0.6875);

                            if (PLAYER(i).qSpeedAirY > Q(0)) {
                                PLAYER(i).qSpeedAirY = Q(0);
                            }

                            if (PLAYER(i).heldInput & DPAD_LEFT) {
                                PLAYER(i).qSpeedGround += Q(4. / 256.);
                            } else if (PLAYER(i).heldInput & DPAD_RIGHT) {
                                PLAYER(i).qSpeedGround -= Q(4. / 256.);
                            } else {
                                PLAYER(i).qSpeedGround -= Div(PLAYER(i).qSpeedGround, 20);
                            }
                        }
                    }
                }

                s->x = I(PLAYER(i).qWorldX) - gCamera.x;
                s->y = I(PLAYER(i).qWorldY) - gCamera.y + 10;

                DisplaySprite(s);

                TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3A[i], TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk38[i]));
            } else {
                if (unk3D == 1) {
                    m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
                    unk3D = 0;
                } else if (unk3D != 0) {
                    unk3D--;
                }

                TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk38[i], 0);
                TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3A[i], TASK_GET_MEMBER(Waterfall, gCurTask, u8, unk38[i]));
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3D, unk3D);
    TASK_SET_MEMBER(Waterfall, gCurTask, u8, unk3E, unk3E);
}

void TaskDestructor_Waterfall(Task *t) { VramFree((&TASK_GET_MEMBER(Waterfall, t, Sprite, s))->graphics.dest); }