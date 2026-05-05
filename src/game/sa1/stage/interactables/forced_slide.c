#include "global.h"
#include "core.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "game/globals.h"
#include "game/shared/stage/entity.h"
#include "game/sa1/stage/player_controls.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/terrain_collision.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D[NUM_SINGLEPLAYER_CHARS_MAX];
} ForcedSlide;

const AnimId ALIGNED(4) gAnimSlideSplashes[NUM_LEVEL_IDS] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_2, ACT_1)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_3, ACT_1)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_4, ACT_1)] = SA1_ANIM_ICE_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = SA1_ANIM_ICE_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_5, ACT_1)] = SA1_ANIM_MUD_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = SA1_ANIM_MUD_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_6, ACT_1)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_7, ACT_1)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [ACT_CHAO_HUNT_A] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [ACT_CHAO_HUNT_B] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [ACT_CHAO_HUNT_C] = SA1_ANIM_WATER_SLIDE_SPLASH,
    [ACT_CHAO_HUNT_D] = SA1_ANIM_WATER_SLIDE_SPLASH,
};

void Task_ForcedSlide(void);
void TaskDestructor_ForcedSlide(struct Task *t);

void CreateEntity_ForcedSlide(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    struct Task *t = TaskCreate(Task_ForcedSlide, sizeof(ForcedSlide), me->d.sData[1] + 0x1000, 0, TaskDestructor_ForcedSlide);
    ForcedSlide *slide = TASK_DATA(t);
    Sprite *s = &slide->s;

    slide->base.regionX = regionX;
    slide->base.regionY = regionY;
    slide->base.me = me;
    slide->base.meX = me->x;

    slide->unk3C = me->d.sData[0];
    slide->unk3D[PLAYER_1] = 0;
    slide->unk3D[PLAYER_2] = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    // TODO: Automatically allocate enough for any water splash in gAnimSlideSplashes
    s->graphics.dest = ALLOC_TILES(SA1_ANIM_WATER_SLIDE_SPLASH);
    s->graphics.anim = gAnimSlideSplashes[gCurrentLevel];
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(3);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;

    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    if (slide->unk3C != 0) {
        s->frameFlags |= SPRITE_FLAG(X_FLIP, 1);
    }
}

void Task_ForcedSlide(void)
{
    ForcedSlide *slide;
    Sprite *s;
    CamCoord x;
    CamCoord y;
    MapEntity *me;
    u32 sp14;
    s32 i;

    sp14 = ((1 << 1) | (1 << 0));
    slide = TASK_DATA(gCurTask);
    s = &slide->s;
    me = slide->base.me;

    // x|y = world-coords
    x = TO_WORLD_POS(slide->base.meX, slide->base.regionX);
    y = TO_WORLD_POS(me->y, slide->base.regionY);

    i = 0;
    do {
        if (i != 0) {
            if (gPartner.moveState & MOVESTATE_DEAD)
                continue;
        } else {
            if (gPlayer.moveState & MOVESTATE_DEAD)
                continue;
        }

        if ((x <= I(PLAYER(i).qWorldX)) && (x + me->d.uData[2] * TILE_WIDTH >= I(PLAYER(i).qWorldX)) && (y <= I(PLAYER(i).qWorldY))
            && (y + me->d.uData[3] * TILE_WIDTH >= I(PLAYER(i).qWorldY))) {
            if (slide->unk3D[i] == 0) {
                s32 res;

                res = SA2_LABEL(sub_801F07C)(I(PLAYER(i).qWorldY), I(PLAYER(i).qWorldX), PLAYER(i).layer, +8, 0, SA2_LABEL(sub_801EE64));

                if (res > 3) {
                    goto set_sp14;
                }
            }

            if (!(PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ)) {
                if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                    if (slide->unk3D[i] == 0 && LEVEL_TO_ZONE(gCurrentLevel) == ZONE_5) {
                        m4aSongNumStart(SE_201);
                    }

                    slide->unk3D[i] = 1;
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).moveState &= ~MOVESTATE_STOOD_ON_OBJ;
                    PLAYER(i).moveState &= ~MOVESTATE_100;
                    PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;
                    PLAYER(i).moveState |= MOVESTATE_IGNORE_INPUT;
                    PLAYER(i).heldInput = 0;
                    PLAYER(i).frameInput = 0;

                    if (slide->unk3C != 0) {
                        PLAYER(i).moveState |= MOVESTATE_FACING_LEFT;
                        PLAYER(i).qSpeedGround = -Q(4);
                        PLAYER(i).qSpeedAirX = -Q(4);
                    } else {
                        PLAYER(i).moveState &= ~MOVESTATE_FACING_LEFT;
                        PLAYER(i).qSpeedGround = +Q(4);
                        PLAYER(i).qSpeedAirX = +Q(4);
                    }

                    PLAYER(i).qSpeedAirY = +Q(0);
                    PLAYER(i).charState = CHARSTATE_HIT_AIR;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                    s->x = I(PLAYER(i).qWorldX) - gCamera.x;
                    s->y = I(PLAYER(i).qWorldY) - gCamera.y;

                    UpdateSpriteAnimation(s);
                    DisplaySprite(s);
                } else {
                    if ((slide->unk3D[i] != 0) && (--slide->unk3D[i] == 0)) {
                        PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                        PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
                    }
                }
            }
        set_sp14:

            sp14 &= ~(1 << i);
        } else {
            if (slide->unk3D[i] == 1) {
                m4aMPlayFadeOut(&gMPlayInfo_SE2, 4);
                slide->unk3D[i] = 0;

                PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
            } else if (slide->unk3D[i] > 0) {
                slide->unk3D[i]--;
            }
        }

    } while (++i < gNumSingleplayerCharacters);

    if (sp14 & ((1 << NUM_SINGLEPLAYER_CHARS_MAX) - 1)) {
        return;
    }

    x = x - gCamera.x;
    y = y - gCamera.y;

    // x|y = screen-coords

    if (IS_OUT_OF_CAM_RANGE(x, y)) {
        s32 i = 0;
        do {
#ifdef BUG_FIX
            // This isn't really needed but it makes the compiler happy on some platforms
            if (i > NUM_SINGLEPLAYER_CHARS_MAX - 1) {
                break;
            }
#endif
            if (slide->unk3D[i] != 0) {
                m4aSongNumStop(SE_201);

                slide->unk3D[i] = 0;

                PLAYER(i).moveState &= ~MOVESTATE_IGNORE_INPUT;
                PLAYER(i).heldInput |= (gPlayerControls.jump | gPlayerControls.attack);
            }
        } while (++i < gNumSingleplayerCharacters);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, slide->base.meX);
        TaskDestroy(gCurTask);
        return;
    }
}

void TaskDestructor_ForcedSlide(struct Task *t)
{
    ForcedSlide *slide = TASK_DATA(t);
    VramFree(slide->s.graphics.dest);
}