#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/player.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ Sprite s2;
    /* 0x6C */ Sprite s3;
    /* 0xA4 */ u16 unk9C;
    /* 0xA0 */ s32 unkA0;
    /* 0xA4 */ s32 unkA4;
    /* 0xA8 */ s32 unkA8;
    /* 0xAC */ s16 unkAC;
    /* 0xAE */ s16 unkAE;
    /* 0xB0 */ u16 qUnkB0;
    /* 0xB4 */ u8 unkB2;
    /* 0xB4 */ u8 unkB3;
    /* 0xB4 */ u8 unkB4;
    /* 0xB5 */ u8 unkB5;
    /* 0xB6 */ u8 unkB6;
} FerrisWheel; /* 0xB8 */

void Task_FerrisWheel(void);
void TaskDestructor_FerrisWheel(Task *t);

const u16 gUnknown_086CEE2C[NUM_LEVEL_IDS] = {
    SA1_ANIM_PLATFORM_HORZ_1,   SA1_ANIM_PLATFORM_HORZ_1,   SA1_ANIM_PLATFORM_HORZ_2,   SA1_ANIM_PLATFORM_HORZ_2,
    SA1_ANIM_PLATFORM_HORZ_3,   SA1_ANIM_PLATFORM_HORZ_3,   SA1_ANIM_PLATFORM_HORZ_4,   SA1_ANIM_PLATFORM_HORZ_4,
    SA1_ANIM_PLATFORM_HORZ_5,   SA1_ANIM_PLATFORM_HORZ_5,   SA1_ANIM_PLATFORM_HORZ_6_1, SA1_ANIM_PLATFORM_HORZ_6_2,
    SA1_ANIM_PLATFORM_HORZ_6_1, SA1_ANIM_PLATFORM_HORZ_6_1, SA1_ANIM_PLATFORM_HORZ_1,   SA1_ANIM_PLATFORM_HORZ_2,
    SA1_ANIM_PLATFORM_HORZ_3,   SA1_ANIM_PLATFORM_HORZ_6_2,
};

void CreateEntity_FerrisWheel(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_FerrisWheel, sizeof(FerrisWheel), 0x2000, 0, TaskDestructor_FerrisWheel);
    FerrisWheel *wheel = TASK_DATA(t);
    CamCoord worldX, worldY;
    Sprite *s, *s2, *s3;

    wheel->base.regionX = regionX;
    wheel->base.regionY = regionY;
    wheel->base.me = me;
    wheel->base.meX = me->x;
    wheel->base.id = id;

    wheel->unkA4 = 0;
    wheel->unkA8 = 0;
    wheel->unkAC = 0;
    wheel->unkAE = 0;

    wheel->unk9C = (me->d.sData[0] & 0xF) << 7;
    wheel->unkB4 = me->d.sData[1];
    wheel->unkB5 = 0;
    wheel->qUnkB0 = 0;
    wheel->unkA0 = 0;
    wheel->unkB6 = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        wheel->unkB3 = me->d.uData[2];
        wheel->unkB2 = 1;
    } else {
        wheel->unkB3 = me->d.uData[3];
        wheel->unkB2 = 0;
    }

    s = &wheel->s;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_HORZ_3);
    s->graphics.anim = gUnknown_086CEE2C[gCurrentLevel];
    s->variant = 0;
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);

    s3 = &wheel->s3;
    s3->graphics.dest = VRAM_RESERVED_FERRIS_WHEEL_HOOK;
    s3->oamFlags = SPRITE_OAM_ORDER(18);
    s3->graphics.size = 0;
    s3->graphics.anim = SA1_ANIM_FERRIS_WHEEL_HOOK;
    s3->variant = 0;
    s3->animCursor = 0;
    s3->qAnimDelay = Q(0);
    s3->prevVariant = -1;
    s3->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s3->palId = 0;
    s3->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s3->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s3);

    s2 = &wheel->s2;
    s2->graphics.dest = VRAM_RESERVED_FERRIS_WHEEL_SEGMENT;
    s2->oamFlags = SPRITE_OAM_ORDER(18);
    s2->graphics.size = 0;
    s2->graphics.anim = SA1_ANIM_FERRIS_WHEEL_SEGMENT;
    s2->variant = 0;
    s2->animCursor = 0;
    s2->qAnimDelay = Q(0);
    s2->prevVariant = -1;
    s2->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s2->palId = 0;
    s2->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s2->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s2);
}

void Task_FerrisWheel(void)
{
    Sprite *s;
    Sprite *s3;
    Sprite *s2;
    FerrisWheel *wheel;
    s32 data1;
    CamCoord worldX;
    CamCoord worldY;
    MapEntity *me;
    s32 sp14;
    s32 sp18;
    s32 i;
    u8 j;

    wheel = TASK_DATA(gCurTask);
    s = &wheel->s;
    s3 = &wheel->s3;
    s2 = &wheel->s2;
    me = wheel->base.me;

    if (wheel->unkB2) {
        wheel->unkA4 = SIN(((+me->d.sData[1] * gStageTime + wheel->unk9C) & 0x7FF) >> 1) * wheel->unkB3;
        wheel->unkA8 = COS(((+me->d.sData[1] * gStageTime + wheel->unk9C) & 0x7FF) >> 1) * wheel->unkB3;
    } else {
        wheel->unkA4 = SIN(((-me->d.sData[1] * gStageTime + wheel->unk9C) & 0x7FF) >> 1) * wheel->unkB3;
        wheel->unkA8 = COS(((-me->d.sData[1] * gStageTime + wheel->unk9C) & 0x7FF) >> 1) * wheel->unkB3;
    }

    worldX = TO_WORLD_POS(wheel->base.meX, wheel->base.regionX);
    worldY = TO_WORLD_POS(me->y, wheel->base.regionY);

    sp14 = wheel->unkA4 >> 11;
    sp18 = wheel->unkA8 >> 11;

    s->x = worldX - gCamera.x + sp14;
    s->y = worldY - gCamera.y + sp18;

    if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) && (gCurrentLevel != ACT_CHAO_HUNT_C)) {
        s3->x = worldX - gCamera.x;
        s3->y = worldY - gCamera.y;
    }

    i = 0;
    do {
        if (GetBit(wheel->unkB6, i)) {
            if (gStageTime & 0x1) {
                PLAYER(i).qWorldX += ((wheel->unkA4 - wheel->unkA0) >> 3) + 1;
            } else {
                PLAYER(i).qWorldX += ((wheel->unkA4 - wheel->unkA0) >> 3) + 0;
            }
        }

        if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
            Coll_Player_PlatformCrumbling(s, worldX + sp14, worldY + sp18, &PLAYER(i));

            if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && PLAYER(i).stoodObj == s) {
                SetBit(wheel->unkB6, i);

                wheel->qUnkB0 += Q(0.0625);

                if (wheel->qUnkB0 > Q(1.0)) {
                    wheel->qUnkB0 = Q(1.0);
                }

                if (PLAYER(i).moveState & (MOVESTATE_SPINDASH | MOVESTATE_SPIN_ATTACK)) {
                    PLAYER(i).qWorldY = Q((worldY + sp18) - 15);
                } else {
                    PLAYER(i).qWorldY = Q((worldY + sp18) - 20);
                }

            } else {
                ClearBit(wheel->unkB6, i);

                if (wheel->qUnkB0 > Q(0.0625)) {
                    wheel->qUnkB0 -= Q(0.0625);
                } else {
                    wheel->qUnkB0 = Q(0);
                }
            }
        } else {
            if (GetBit(wheel->unkB6, i)) {
                ClearBit(wheel->unkB6, i);
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, wheel->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    {
        s32 r8 = 0;
        s32 r4 = 0;

        s->y += Div(SIN(wheel->qUnkB0), 2500);

        DisplaySprite(s);

        if ((LEVEL_TO_ZONE(gCurrentLevel) != ZONE_3) && (gCurrentLevel != ACT_CHAO_HUNT_C)) {
            DisplaySprite(s3);

            sp14 = Div(wheel->unkA4, 3);
            sp18 = Div(wheel->unkA8, 3);

            for (j = 0; j < 2; j++) {
                r8 += sp14;
                r4 += sp18;

                s2->x = worldX - gCamera.x + (r8 >> 11);
                s2->y = worldY - gCamera.y + (r4 >> 11);

                DisplaySprite(s2);
            }
        }
    }

    wheel->unkA0 = wheel->unkA4;
}

void TaskDestructor_FerrisWheel(Task *t)
{
    FerrisWheel *wheel = TASK_DATA(t);
    VramFree(wheel->s.graphics.dest);
}