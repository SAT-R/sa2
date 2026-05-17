#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x3E */ u16 unk3E;
    /* 0x40 */ u16 unk40;
    /* 0x40 */ s16 unk42;
} AirBubbles;

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u8 unk3C;
    /* 0x3D */ s8 unk3D;
    /* 0x3E */ u16 unk3E;
    /* 0x40 */ s16 worldX;
    /* 0x42 */ s16 worldY;
} AirBubbleBig;

const u16 gUnknown_086CEE60[] = {
    0x012D, 0x00F1, 0x0079, 0x0105, 0x012D, 0x0079, 0x00C9, 0x0079,
};

void Task_AirBubbles(void);
void CreateBubbleContainingAir(CamCoord worldX, CamCoord worldY, u8 param2);
void Task_BubbleContainingAir(void);
void sub_80914F8(CamCoord worldX, CamCoord worldY, u8 param2);
void Task_809141C(void);
void Task_80915F0(void);
void TaskDestructor_AirBubbles(Task *t);
void TaskDestructor_AirBubbleBig(Task *t);

void CreateEntity_AirBubbles(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_AirBubbles, sizeof(AirBubbles), 0x2000, 0, TaskDestructor_AirBubbles);
    AirBubbles *bubbles = TASK_DATA(t);
    Sprite *s = &bubbles->s;

    bubbles->base.regionX = regionX;
    bubbles->base.regionY = regionY;
    bubbles->base.me = me;
    bubbles->base.meX = me->x;
    bubbles->base.id = id;

    bubbles->unk3E = 120;
    bubbles->unk40 = 0;
    bubbles->unk3C = 60;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_MINIBUBBLES);
    s->graphics.anim = SA1_ANIM_MINIBUBBLES;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_AirBubbles(void)
{
    AirBubbles *bubbles = TASK_DATA(gCurTask);
    Sprite *s = &bubbles->s;
    MapEntity *me = bubbles->base.me;
    CamCoord worldX, worldY;

    worldX = TO_WORLD_POS(bubbles->base.meX, bubbles->base.regionX);
    worldY = TO_WORLD_POS(me->y, bubbles->base.regionY);

    s->x = worldX - gCamera.x;
    s->y = worldY - gCamera.y;

    if (--bubbles->unk3E == 0) {
        CreateBubbleContainingAir(worldX, worldY - 4, 4);
        bubbles->unk3E = gUnknown_086CEE60[bubbles->unk40];
        bubbles->unk40 = ((bubbles->unk40 + 1) % ARRAY_COUNT(gUnknown_086CEE60));
    }

    if (--bubbles->unk3C == 0) {
        sub_80914F8(worldX, (worldY - 4), (bubbles->unk3E >> 3) + gStageTime);
        bubbles->unk3C = Div(gUnknown_086CEE60[gStageTime % ARRAY_COUNT(gUnknown_086CEE60)], 2);
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, bubbles->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void CreateBubbleContainingAir(CamCoord worldX, CamCoord worldY, u8 param2)
{
    Task *t = TaskCreate(Task_BubbleContainingAir, sizeof(AirBubbleBig), 0x2000, 0, TaskDestructor_AirBubbleBig);
    AirBubbleBig *bubbles = TASK_DATA(t);
    Sprite *s = &bubbles->s;
    MapEntity *me = bubbles->base.me;

    bubbles->unk3C = param2;
    bubbles->unk3E = 0;
    bubbles->worldX = worldX;
    bubbles->worldY = worldY;

    s->x = worldX;
    s->y = worldY;

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_AIR_BUBBLES);
    s->graphics.anim = SA1_ANIM_AIR_BUBBLES;
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(15);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

// (98.78%) https://decomp.me/scratch/enfXg
NONMATCH("asm/non_matching/game/sa1/stage/interactables/air_bubbles__Task_BubbleContainingAir.inc", void Task_BubbleContainingAir(void))
{
    AirBubbleBig *bubbles = TASK_DATA(gCurTask);
    Sprite *s = &bubbles->s;

    s->x = bubbles->worldX - gCamera.x + (SIN((bubbles->unk3E * 3) & (SIN_PERIOD - 1)) >> 11);
    s->y = bubbles->worldY - gCamera.y - (bubbles->unk3E >> 1);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y) || (gWater.currentWaterLevel < 0)
        || (bubbles->worldY - (bubbles->unk3E >> 1) < gWater.currentWaterLevel)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (bubbles->unk3C * 8 > ++bubbles->unk3E) {
        UpdateSpriteAnimation(s);
    } else if (bubbles->unk3C == 4) {
        // _080911FC
        UpdateSpriteAnimation(s);
    }
    // _0809120A

    if ((bubbles->unk3C == 4) && (bubbles->unk3E >= 80)) {
        // _08091220
        s32 i;

        i = 0;
        do {
            if (Coll_Player_Entity_Intersection(s, s->x + gCamera.x, s->y + gCamera.y, &PLAYER(i))) {
                Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                PLAYER(i).charState = CHARSTATE_27;
                // _0809128A

                if (PLAYER(i).moveState & MOVESTATE_SPIN_ATTACK) {
                    // _080912AA
                    PLAYER(i).moveState &= ~MOVESTATE_SPIN_ATTACK;
                    // _080912C4
                    PLAYER(i).moveState &= ~MOVESTATE_FLIP_WITH_MOVE_DIR;

                    if (PLAYER(i).moveState & MOVESTATE_IN_AIR) {
                        // _08091300
                        PLAYERFN_SET_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                    } else {
                        PLAYERFN_CHANGE_SHIFT_OFFSETS(&PLAYER(i), 6, 14);
                    }
                }

                // _0809133A
                PLAYER(i).qSpeedAirX = 0;
                PLAYER(i).qSpeedAirY = 0;
                PLAYER(i).qSpeedGround = 0;
                PLAYER(i).moveState &= ~MOVESTATE_20;
                PLAYER(i).framesUntilDrownCountDecrement = GBA_FRAMES_PER_SECOND;
                PLAYER(i).secondsUntilDrown = 30;

                if (PLAYER(i).playerID == PLAYER_1) {
                    m4aSongNumStop(MUS_DROWNING);
                }
                m4aSongNumStart(SE_AIR_BUBBLE);

                gCurTask->main = Task_809141C;
                bubbles->unk3D = 0x10;
            }
        } while (++i < gNumSingleplayerCharacters);
    }

    DisplaySprite(s);
}
END_NONMATCH

void Task_809141C(void)
{
    AirBubbleBig *bubbles = TASK_DATA(gCurTask);
    Sprite *s = &bubbles->s;

    s->x = bubbles->worldX - gCamera.x + (SIN((bubbles->unk3E * 3) & (SIN_PERIOD - 1)) >> 11);
    s->y = bubbles->worldY - gCamera.y - (bubbles->unk3E >> 1);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y) || (--bubbles->unk3D < 0) || (gWater.currentWaterLevel < 0)
        || (bubbles->worldY - (bubbles->unk3E >> 1) < gWater.currentWaterLevel)) {
        TaskDestroy(gCurTask);
        return;
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void sub_80914F8(CamCoord worldX, CamCoord worldY, u8 param2)
{
    Task *t = TaskCreate(Task_80915F0, sizeof(AirBubbleBig), 0x2000, 0, TaskDestructor_AirBubbleBig);
    AirBubbleBig *bubbles = TASK_DATA(t);
    Sprite *s = &bubbles->s;
    MapEntity *me = bubbles->base.me;

    bubbles->unk3C = param2 & 0xF;
    bubbles->unk3E = 0;
    bubbles->worldX = worldX - 8;
    bubbles->worldY = worldY;

    s->x = worldX;
    s->y = worldY;

    if (param2 & 0x1) {
        s->graphics.dest = VRAM_RESERVED_BUBBLES_GROUP;
        s->graphics.anim = SA1_ANIM_BUBBLES_GROUP;
        s->variant = 0;
    } else {
        s->graphics.dest = VRAM_RESERVED_BUBBLES_SMALL;
        s->graphics.anim = SA1_ANIM_BUBBLES_SMALL;
        s->variant = 0;
    }

    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
}

void Task_80915F0(void)
{
    AirBubbleBig *bubbles = TASK_DATA(gCurTask);
    Sprite *s = &bubbles->s;

    s->x = bubbles->worldX - gCamera.x + (SIN((bubbles->unk3E * 3) & (SIN_PERIOD - 1)) >> 11) + bubbles->unk3C;
    s->y = bubbles->worldY - gCamera.y - (bubbles->unk3E >> 1);

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y) || (gWater.currentWaterLevel < 0)
        || (bubbles->worldY - (bubbles->unk3E >> 1) < gWater.currentWaterLevel)) {
        TaskDestroy(gCurTask);
        return;
    }

    bubbles->unk3E++;

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}

void TaskDestructor_AirBubbles(Task *t)
{
    AirBubbles *bubbles = TASK_DATA(t);
    VramFree(bubbles->s.graphics.dest);
}

void TaskDestructor_AirBubbleBig(Task *t)
{
    AirBubbleBig *bubbles = TASK_DATA(t);

    if (bubbles->unk3C == 4) {
        VramFree(bubbles->s.graphics.dest);
    }
}
