#include "global.h"
#include "global.h"
#include "flags.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "sakit/collision.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/bosses/common.h"
#include "game/bosses/boss_3.h"
#include "game/bosses/eggmobile_escape_sequence.h"
#include "game/stage/boss_results_transition.h"
#include "game/parameters/bosses.h"
#include "game/player_callbacks_1.h"
#include "game/save.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

/* TODO: Merge this file with boss_3.c */

void sub_8040D74(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    if (totem->unk35 == 0) {
        // NOTE: This matches, but it'd be better if this worked without 'a'
        u32 a = totem->unk32;

        if (a > 0) {
            totem->unk32 = a - 1;

            if (((a - 1) % 2u) != 0) {
                m4aSongNumStart(SE_143);
            } else {
                m4aSongNumStart(SE_235);
            }

            totem->unk35 = 30;

            if (totem->unk32 == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
                INCREMENT_SCORE(1000);
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 2;
            }

            s->prevVariant = -1;
        }

        if (!IS_FINAL_STAGE(gCurrentLevel) && (totem->unk32 == 4)) {
            gUnknown_030054A8.unk1 = 17;
        }
    }
}

void sub_8040E78(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    if (totem->unk35 > 0) {
        totem->unk34 = 0;

        if (--totem->unk35 == 0) {
            if (totem->unk32 == 0) {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 3;
            } else {
                s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
                s->variant = 0;
            }

            s->prevVariant = -1;
        }
    } else if (totem->unk34 > 0) {
        if (--totem->unk34 == 0) {
            s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s->variant = 0;
            s->prevVariant = -1;
        }
    }
}

void sub_8040F14(EggTotem *totem)
{
    u8 i;

    if (totem->unk35 != 0) {
        for (i = 0; i < 16; i++) {
            gObjPalette[128 + i] = gUnknown_080D7F14[((gStageTime & 0x2) / 2u)][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[128 + i] = gUnknown_080D7F14[1][i];
        }
    }

    if (totem->unk36 > 0) {
        totem->unk36--;

        for (i = 0; i < 16; i++) {
            gObjPalette[176 + i] = gUnknown_080D7F14[((gStageTime & 0x2) / 2u)][i];
        }
    } else {
        for (i = 0; i < 16; i++) {
            gObjPalette[176 + i] = gUnknown_080D7F14[1][i];
        }
    }

    gFlags |= FLAGS_UPDATE_SPRITE_PALETTES;
}

void TaskDestructor_EggTotemMain(struct Task *t)
{
    u8 i;
    EggTotem *totem = TASK_DATA(t);

    VramFree(totem->sprC0.s.graphics.dest);

    for (i = 0; i < ARRAY_COUNT(totem->sprF8); i++) {
        VramFree(totem->sprF8[i].graphics.dest);
    }

    for (i = 0; i < ARRAY_COUNT(totem->spr188); i++) {
        VramFree(totem->spr188[i].s.graphics.dest);
    }

    VramFree(totem->spr248[0].graphics.dest);
    VramFree(totem->spr248[1].graphics.dest);

    VramFree(totem->tilesEggman);

    VramFree(totem->spr2A8.graphics.dest);

    if (totem->spr308.graphics.dest != NULL) {
        VramFree(totem->spr308.graphics.dest);
    }

    if (totem->spr2D8.graphics.dest != NULL) {
        VramFree(totem->spr2D8.graphics.dest);
    }

    gActiveBossTask = NULL;
}

void Task_EggTotemMain(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    totem->qWorldX += Q(3.8125);

    sub_803FB88(totem);
    sub_8041264(totem);
    sub_8040E78(totem);
    sub_803F698(totem);

    if (--totem->unkB4 == 0) {
        gCurTask->main = Task_803F3E8;
    }
}

void Task_8041138(void)
{
    bool8 res;
    EggTotem *totem = TASK_DATA(gCurTask);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    if (totem->spr2D8.graphics.dest != NULL) {
        totem->qUnkB8 += Q(5);

        if (totem->qUnkBC > -Q(48)) {
            totem->qUnkBC -= Q(3);
        }
    }

    sub_803FC14(totem);
    sub_8040E78(totem);

    res = sub_803F878(totem);
    if (res != FALSE) {
        gCurTask->main = Task_80411CC;
    }
}

void Task_80411CC(void)
{
    EggTotem *totem = TASK_DATA(gCurTask);

    if (Mod(gStageTime, 13) == 0) {
        m4aSongNumStart(SE_144);
    }

    sub_803FF44(totem);
    sub_8040E78(totem);
    sub_803F878(totem);

    if (totem->sprC0.s.x < -200) {
        sub_802EF68(-40, 150, 2);

        gCurTask->main = Task_CallTaskDestroyTotem;
    }
}

void Task_CallTaskDestroyTotem(void) { TaskDestroy(gCurTask); }

void Totem_UpdateWorldPos(EggTotem *totem)
{
    totem->qWorldX += totem->unk8;
    totem->qWorldY += totem->unkA;
}

void sub_8041264(EggTotem *totem)
{
    u8 i;

    for (i = 0; i < ARRAY_COUNT(totem->unk3C); i++) {
        if (totem->unk3C[i].unk13 == 0) {
            totem->unk3C[i].qWorldX = totem->qWorldX;
            totem->unk3C[i].qWorldY = totem->qWorldY + sTotemDiscYs[i];
        }
    }
}

void sub_80412B4(EggTotem *totem)
{
    Sprite *s = &totem->spr2A8;

    totem->unk34 = 30;

    if (totem->unk35 == 0) {
        s->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
        s->variant = 1;
        s->prevVariant = -1;
    }
}

void CreateEggTotemBullet(EggTotem *totem, s32 qX, s32 qY, u16 qSpeed)
{
    Sprite *s;
    u16 sinIndex;

    struct Task *t
        = TaskCreate(Task_EggTotemBullet, sizeof(EggTotemBullet), 0x6100, 0, NULL);

    EggTotemBullet *bullet = TASK_DATA(t);

    bullet->qScreenX = qX - Q(gCamera.x);
    bullet->qScreenY = qY - Q(gCamera.y);

    sinIndex = sub_8004418(I(gPlayer.y) - I(qY), I(gPlayer.x) - I(qX));
    bullet->qDX = ((COS(sinIndex) * qSpeed) >> 14);
    bullet->qDX += BOSS_VELOCITY_X;
    bullet->qDY = ((SIN(sinIndex) * qSpeed) >> 14);
    bullet->totem = totem;

    s = &bullet->s;

    s->x = I(qX);
    s->y = I(qY);
    s->graphics.dest = totem->tilesEggman;
    s->graphics.anim = SA2_ANIM_EGG_TOTEM_BULLET;
    s->variant = 0;
    s->unk1A = SPRITE_OAM_ORDER(16);
    s->graphics.size = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
}

void Task_EggTotemBullet(void)
{
    EggTotem *totem;
    EggTotemBullet *bullet = TASK_DATA(gCurTask);
    Sprite *s = &bullet->s;

    if (!PLAYER_IS_ALIVE) {
        bullet->qScreenX += bullet->qDX;
        bullet->qScreenX -= BOSS_VELOCITY_X;
        bullet->qScreenY += bullet->qDY;
    } else {
        bullet->qScreenX += (bullet->qDX + Q(gCamera.unk38));
        bullet->qScreenY += (bullet->qDY + Q(gCamera.unk3C));
    }

    s->x = I(bullet->qScreenX);
    s->y = I(bullet->qScreenY);

    // TODO: What is 752 in the last condition?
    if ((s->x < -32 && bullet->qDX < 0)
        || ((s->x > (DISPLAY_WIDTH + 32)) && bullet->qDX > 0)
        || (s->y < -32 && bullet->qDY < 0)
        || ((s->y > (DISPLAY_HEIGHT + 32)) && bullet->qDY > 0) || (s->x < -Q(2))
        || s->x > 752) {
        TaskDestroy(gCurTask);
        return;
    }

    if (bullet->totem->unk32 != 0) {
        bool32 res;

        res = sub_800CA20(s, I(bullet->qScreenX) + gCamera.x,
                          I(bullet->qScreenY) + gCamera.y, 0, &gPlayer);

        if (res == TRUE && bullet->totem->unk35 == 0) {
            Sprite *s2;
            totem = bullet->totem;
            s2 = &totem->spr2A8;
            totem->unk34 = 30;
            s2->graphics.anim = SA2_ANIM_HAMMERTANK_PILOT;
            s2->variant = res;
            s2->prevVariant = -1;
        }
    }

    UpdateSpriteAnimation(s);
    DisplaySprite(s);
}