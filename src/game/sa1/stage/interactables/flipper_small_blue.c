#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
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
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ u8 unk3D;
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F;
    /* 0x40 */ s32 qUnk40[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x48 */ s32 qUnk48[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x50 */ s32 qUnk50[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x58 */ u8 unk58[NUM_SINGLEPLAYER_CHARS_MAX];
    /* 0x5A */ u8 unk5A[NUM_SINGLEPLAYER_CHARS_MAX];
} BlueFlipper;

void Task_Flipper_SmallBlue(void);
void TaskDestructor_Flipper_SmallBlue(Task *t);

void CreateEntity_Flipper_SmallBlue(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Flipper_SmallBlue, sizeof(BlueFlipper), 0x2000 + me->d.sData[1], 0, TaskDestructor_Flipper_SmallBlue);
    BlueFlipper *flipper = TASK_DATA(t);
    Sprite *s = &flipper->s;
    s32 i;

    flipper->base.regionX = regionX;
    flipper->base.regionY = regionY;
    flipper->base.me = me;
    flipper->base.meX = me->x;
    flipper->base.id = id;

    flipper->unk3D = me->d.sData[0];
    flipper->unk3C = 0;

    i = 0;
    do {
        flipper->unk58[i] = 0;
        flipper->qUnk40[i] = 0;
        flipper->qUnk50[i] = 0;
        flipper->qUnk48[i] = 0;
        flipper->unk5A[i] = 0;
    } while (++i < gNumSingleplayerCharacters);

    flipper->unk3E = me->d.sData[1];

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_BLUE_FLIPPER);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_BLUE_FLIPPER;
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;

    if (me->d.uData[2]) {
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(X_FLIP, 1);
    } else {
        s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    }
    UpdateSpriteAnimation(s);
}

void Task_Flipper_SmallBlue(void)
{
    CamCoord worldX, worldY;
    BlueFlipper *flipper = TASK_DATA(gCurTask);
    Sprite *s = &flipper->s;
    MapEntity *me = flipper->base.me;
    s32 i;

    worldX = TO_WORLD_POS(flipper->base.meX, flipper->base.regionX);
    worldY = TO_WORLD_POS(me->y, flipper->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    i = 0;
    do {
        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            if (GetBit(flipper->unk3C, i)) {
                if ((flipper->unk5A[i] != 0) && (--flipper->unk5A[i] == 0)) {
                    s->graphics.anim = SA1_ANIM_FLIPPER;
                    s->variant = 0;
                    s->prevVariant = -1;
                }

                flipper->qUnk40[i] += Q(42. / 256.);
                flipper->qUnk48[i] += flipper->qUnk40[i];
                PLAYER(i).qWorldY = flipper->qUnk48[i];
                PLAYER(i).qWorldX = flipper->qUnk50[i];
                PLAYER(i).qSpeedAirY = flipper->qUnk40[i];
                PLAYER(i).qSpeedAirX = 0;
                PLAYER(i).qSpeedGround = 0;

                if (++flipper->unk58[i] >= flipper->unk3D) {
                    if (PLAYER(i).SA2_LABEL(unk99)[0] == flipper->unk3E) {
                        PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
                    }

                    PLAYER(i).qSpeedAirY = flipper->qUnk40[i];
                    ClearBit(flipper->unk3C, i);
                    flipper->unk5A[i] = 0;
                } else {
                    Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                    PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                    PLAYER(i).qSpeedAirX = 0;
                    PLAYER(i).qSpeedGround = 0;
                    PLAYER(i).charState = CHARSTATE_32;
                    PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                    SetBit(flipper->unk3C, i);
                }
            } else {
                // !GetBit(flipper->unk3C, i)

                if (flipper->unk5A[i] != 0) {
                    if (--flipper->unk5A[i] == 0) {
                        s->graphics.anim = SA1_ANIM_BLUE_FLIPPER;
                        s->variant = 0;
                        s->prevVariant = -1;
                    }
                } else if (PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE) {
                    if (PLAYER(i).SA2_LABEL(unk99)[0] < flipper->unk3E) {
                        if (Coll_Player_Entity_Intersection(s, worldX, worldY, &PLAYER(i))) {
                            flipper->unk58[i] = 0;
                            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                            PLAYER(i).moveState |= MOVESTATE_SPIN_ATTACK;
                            PLAYER(i).moveState |= MOVESTATE_IA_OVERRIDE;
                            PLAYER(i).SA2_LABEL(unk99)[0] = flipper->unk3E;
                            flipper->qUnk48[i] = PLAYER(i).qWorldY;
                            flipper->qUnk50[i] = PLAYER(i).qWorldX;
                            flipper->qUnk40[i] = -Q(12.5625);
                            PLAYER(i).qSpeedAirY = 0;
                            PLAYER(i).qSpeedAirX = 0;
                            PLAYER(i).qSpeedGround = 0;
                            PLAYER(i).charState = CHARSTATE_32;
                            PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);

                            m4aSongNumStart(SE_BUMPER_A);

                            SetBit(flipper->unk3C, i);
                            flipper->unk5A[i] = 24;

                            s->graphics.anim = SA1_ANIM_BLUE_FLIPPER;
                            s->variant = 1;
                            s->prevVariant = -1;
                        }
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (((flipper->unk3C & 0x3) == 0) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        s32 i = 0;
        do {
            if (GetBit(flipper->unk3C, i) & 0x1) {
                PLAYER(i).moveState &= ~MOVESTATE_IA_OVERRIDE;
            }
        } while (++i < gNumSingleplayerCharacters);

        SET_MAP_ENTITY_NOT_INITIALIZED(me, flipper->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_Flipper_SmallBlue(Task *t)
{
    BlueFlipper *flipper = TASK_DATA(t);
    VramFree(flipper->s.graphics.dest);
}