#include "global.h"
#include "core.h"
#include "trig.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/shared/stage/mp_event_mgr.h"
#include "game/shared/stage/terrain_collision.h"
#include "game/shared/stage/player.h"
#include "game/shared/stage/water_effects.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/char_states.h"
#include "constants/sa1/move_states.h"
#include "constants/sa1/songs.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s32 qUnk48;
    /* 0x4C */ u16 unk4C;
    /* 0x4E */ u8 unk4E;
    /* 0x4F */ u8 unk4F;
    /* 0x50 */ u8 facingUp;
} PlatformSpiked;

void Task_Platform_Spiked(void);
void TaskDestructor_Platform_Spiked(Task *t);
bool32 sub_80805C8(Sprite *s, s32 worldX, s32 worldY, Rect8 *rect, Player *p);

void CreateEntity_Platform_Spiked(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_Platform_Spiked, sizeof(PlatformSpiked), 0x2000, 0, TaskDestructor_Platform_Spiked);
    PlatformSpiked *platform = TASK_DATA(t);
    Sprite *s = &platform->s;

    platform->base.regionX = regionX;
    platform->base.regionY = regionY;
    platform->base.me = me;
    platform->base.meX = me->x;
    platform->base.id = id;

    platform->qUnk3C = 0;
    platform->qUnk40 = 0;
    platform->unk4F = 0;
    platform->unk4E = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->qUnk44 = 4;
            platform->unk4C = 0;
            platform->qUnk48 = 0;
        } else {
            platform->qUnk44 = 4;
            platform->unk4C = 0x80;
            platform->qUnk48 = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->qUnk44 = 0;
            platform->qUnk48 = 4;
            platform->unk4C = 0;
        } else {
            platform->qUnk44 = 0;
            platform->qUnk48 = 4;
            platform->unk4C = 0x80;
        }
    }

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    if ((LEVEL_TO_ZONE(gCurrentLevel) == ZONE_3) || (gCurrentLevel == ACT_CHAO_HUNT_C)) {
        s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_SPIKED_3);
        s->graphics.anim = SA1_ANIM_PLATFORM_SPIKED_3;
        s->variant = 0;
        platform->facingUp = 1;
    } else {
        if (me->d.sData[0] == 0) {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_SPIKED_5_UP);
            s->graphics.anim = SA1_ANIM_PLATFORM_SPIKED_5_UP;
            s->variant = 0;
            platform->facingUp = 1;
        } else {
            s->graphics.dest = ALLOC_TILES(SA1_ANIM_PLATFORM_SPIKED_5_DOWN);
            s->graphics.anim = SA1_ANIM_PLATFORM_SPIKED_5_DOWN;
            s->variant = 0;
            platform->facingUp = 0;
        }
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

    UpdateSpriteAnimation(s);
}

void Task_Platform_Spiked(void)
{
    Sprite *s;
    PlatformSpiked *platform;
    CamCoord worldX, worldY;
    MapEntity *me;
    s32 diff;
    s32 qUnk4A;
    s32 qPrevWorldX, qPrevWorldY;
    u32 flags;
    s32 res;
    s32 i;

    s32 sp20 = 0;
    s32 sp24 = 0;

    platform = TASK_DATA(gCurTask);
    s = &platform->s;
    me = platform->base.me;

    // NOTE: Non-match Ripped from Task_PlatformThin() in platform_thin.c
    if (platform->qUnk44 != 0) {
#ifndef NON_MATCHING
        register s32 diff asm("r5") = platform->qUnk3C;
#else
        s32 diff = platform->qUnk3C;
#endif
        platform->qUnk3C = (((me->d.uData[2] << 11) * SIN(platform->qUnk44 * (((gStageTime + platform->unk4C) & 0xFF)) & 0x3FF)) >> 14);
        diff = platform->qUnk3C - diff;
        asm("" ::"r"(diff));
        sp20 = diff;
    }

    if (platform->qUnk48 != 0) {
#ifndef NON_MATCHING
        register s32 diff asm("r5") = platform->qUnk40;
#else
        s32 diff = platform->qUnk40;
#endif
        platform->qUnk40 = (((me->d.uData[3] << 11) * SIN(platform->qUnk48 * (((gStageTime + platform->unk4C) & 0xFF)) & 0x3FF)) >> 14);
        diff = platform->qUnk40 - diff;
        asm("" ::"r"(diff));
        sp24 = diff;
    }

    worldX = TO_WORLD_POS(platform->base.meX, platform->base.regionX);
    worldY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = worldX - gCamera.x + I(platform->qUnk3C);
    s->y = worldY - gCamera.y + I(platform->qUnk40);

    i = 0;
    do {
        if ((!(PLAYER(i).moveState & MOVESTATE_DEAD)) && !(PLAYER(i).moveState & MOVESTATE_IA_OVERRIDE)) {
            qPrevWorldX = PLAYER(i).qWorldX;

            if (GetBit(platform->unk4E, i)) {
                PLAYER(i).qWorldX += sp20;
                PLAYER(i).qWorldY += sp24 + Q(1);

                if (sp20 > Q(0)) {
                    res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) + 4, I(PLAYER(i).qWorldY) + 0, PLAYER(i).layer, +8,
                                                 SA2_LABEL(sub_801EB44));

                    if (res < 0) {
                        PLAYER(i).qWorldX += Q(res);
                    }
                } else {
                    res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) + 0, I(PLAYER(i).qWorldY) + 0, PLAYER(i).layer, -8,
                                                 SA2_LABEL(sub_801EB44));

                    if (res < 0) {
                        PLAYER(i).qWorldX -= Q(res);
                    }
                }

                res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldY) - 5, I(PLAYER(i).qWorldX) + 0, PLAYER(i).layer, -8,
                                             SA2_LABEL(sub_801EC3C));

                if (res < 0) {
                    if (platform->qUnk48 != Q(0)) {
                        PLAYER(i).qWorldX = qPrevWorldX;
                        PLAYER(i).moveState &= ~MOVESTATE_20;
                        PLAYER(i).moveState |= MOVESTATE_DEAD;
                    }
                } else {
                    if (!Coll_Player_Entity_Intersection(s, worldX + I(platform->qUnk3C), worldY + I(platform->qUnk40), &PLAYER(i))) {
                        ClearBit(platform->unk4E, i);
                    }
                }
            } else {
                // // !GetBit(platform->unk4E, i)
                s8 arr[4] = { -(PLAYER(i).spriteOffsetX + 5), (1 - PLAYER(i).spriteOffsetY), +(PLAYER(i).spriteOffsetX + 5),
                              (PLAYER(i).spriteOffsetY - 1) };

                sub_80805C8(s, worldX + I(platform->qUnk3C), worldY + I(platform->qUnk40), (Rect8 *)&arr[0], &PLAYER(i));

                qPrevWorldX = PLAYER(i).qWorldX;
                qPrevWorldY = PLAYER(i).qWorldY;

                flags = Coll_Player_Platform(s, worldX + I(platform->qUnk3C), worldY + I(platform->qUnk40), &PLAYER(i));

                if (flags & 0x70000) {
                    SetBit(platform->unk4F, i);

                    if (flags & 0x40000) {
                        if (platform->qUnk44 != Q(0)) {
                            if (gInput & DPAD_LEFT) {
                                if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                                    PLAYER(i).qWorldX -= Q(2);
                                    PLAYER(i).moveState |= MOVESTATE_20;
                                }
                            }

                            res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) + 0, I(PLAYER(i).qWorldY) + 0, PLAYER(i).layer, -8,
                                                         SA2_LABEL(sub_801EB44));

                            if (res < 0) {
                                PLAYER(i).moveState &= ~MOVESTATE_20;
                                PLAYER(i).moveState |= MOVESTATE_DEAD;
                            }
                        }
                    } else if (flags & 0x20000) {
                        if (platform->qUnk44 != Q(0)) {
                            if (gInput & DPAD_RIGHT) {
                                if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                                    PLAYER(i).qWorldX += Q(2);
                                    PLAYER(i).moveState |= MOVESTATE_20;
                                }
                            }

                            res = SA2_LABEL(sub_801F100)(I(PLAYER(i).qWorldX) + 0, I(PLAYER(i).qWorldY) + 0, PLAYER(i).layer, +8,
                                                         SA2_LABEL(sub_801EB44));

                            if (res < 0) {
                                PLAYER(i).moveState &= ~MOVESTATE_20;
                                PLAYER(i).moveState |= MOVESTATE_DEAD;
                            }
                        }
                    } else {
                        if (platform->qUnk48 != Q(0)) {
                            PLAYER(i).qWorldX = qPrevWorldX;

                            if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                                PLAYER(i).qWorldX = qPrevWorldX;
                                PLAYER(i).qWorldY = qPrevWorldY;

                                PLAYER(i).moveState &= ~MOVESTATE_20;
                                PLAYER(i).moveState |= MOVESTATE_DEAD;
                            } else {
                                if (!platform->facingUp) {
                                    Coll_DamagePlayer(&PLAYER(i));
                                }
                            }
                        } else {
                            if (!platform->facingUp) {
                                Coll_DamagePlayer(&PLAYER(i));
                            }
                        }
                    }
                } else {
                    if (GetBit(platform->unk4F, i)) {
                        if (PLAYER(i).charState == CHARSTATE_14) {
                            ClearBit(platform->unk4F, i);
                            PLAYER(i).qSpeedGround = 0;
                            Player_TransitionCancelFlyingAndBoost(&PLAYER(i));
                            PLAYER(i).moveState &= ~MOVESTATE_20;

                            if (PLAYER(i).charState == CHARSTATE_14) {
                                if (PLAYER(i).character != CHARACTER_AMY) {
                                    if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                                        PLAYER(i).charState = CHARSTATE_WALK_A;
                                    } else {
                                        if (PLAYER(i).character != CHARACTER_AMY) {
                                            PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                        } else {
                                            PLAYER(i).charState = CHARSTATE_85;
                                        }
                                    }
                                } else {
                                    if (!(PLAYER(i).moveState & MOVESTATE_IN_AIR)) {
                                        PLAYER(i).charState = CHARSTATE_WALK_A;
                                    } else {
                                        if (PLAYER(i).character != CHARACTER_AMY) {
                                            PLAYER(i).charState = CHARSTATE_SPINATTACK;
                                        } else {
                                            PLAYER(i).charState = CHARSTATE_85;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if (!(PLAYER(i).moveState & MOVESTATE_DEAD)) {
                if (PLAYER(i).qSpeedAirY >= Q(0)) {
                    if (worldY + I(platform->qUnk40) > I(PLAYER(i).qWorldY)) {
                        s8 arr[4] = { -(PLAYER(i).spriteOffsetX + 5), (1 - PLAYER(i).spriteOffsetY), +(PLAYER(i).spriteOffsetX + 5),
                                      (PLAYER(i).spriteOffsetY - 1) };
                        u32 flags;

                        sub_80805C8(s, worldX + I(platform->qUnk3C), worldY + I(platform->qUnk40), (Rect8 *)&arr[0], &PLAYER(i));

                        flags = Coll_Player_Platform(s, worldX + I(platform->qUnk3C), worldY + I(platform->qUnk40) - 8, &PLAYER(i));

                        if (flags & 0x8) {
                            if (platform->facingUp) {
                                Coll_DamagePlayer(&PLAYER(i));
                            } else {
                                SetBit(platform->unk4E, i);
                                PLAYER(i).qWorldY += Q(8);
                            }
                        }
                    }
                }
            }
        }
    } while (++i < gNumSingleplayerCharacters);

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    DisplaySprite(s);
}

// (99.64%) https://decomp.me/scratch/E9idQ
NONMATCH("asm/non_matching/game/sa1/stage/interactables/platform_spiked__sub_80805C8.inc",
         bool32 sub_80805C8(Sprite *s, s32 worldX, s32 worldY, Rect8 *rect, Player *p))
{
    if (HB_COLLISION(worldX, worldY, s->hitboxes[0].b, I(p->qWorldX), I(p->qWorldY), (*rect))) {
        s32 res;
        s32 valX = (worldX + s->hitboxes[0].b.left - rect->right + 8);

        if (I(p->qWorldX) <= valX) {
            p->qWorldX = Q(worldX + s->hitboxes[0].b.left - rect->right);
            if (p->qSpeedAirX > Q(0)) {
                p->qSpeedGround = 0;
                p->qSpeedAirX = 0;
            }
        } else {
            s32 valX = (worldX + s->hitboxes[0].b.right - rect->left);

            if (I(p->qWorldX) >= valX - 8) {
                p->qWorldX = Q(valX);

                if (p->qSpeedAirX < 0) {
                    p->qSpeedGround = 0;
                    p->qSpeedAirX = 0;
                }
            } else {
                return FALSE;
            }
        }
        res = SA2_LABEL(sub_801E4E4)(I(p->qWorldY) + 9, I(p->qWorldX), p->layer, +8, NULL, SA2_LABEL(sub_801EE64));

        if (res < 0) {
            p->qWorldY += Q(res);
        }

        res = SA2_LABEL(sub_801E4E4)(I(p->qWorldY), I(p->qWorldX), p->layer, -8, NULL, SA2_LABEL(sub_801EE64));

        if (res < 0) {
            p->qWorldY += Q(res);
        }

        p->moveState &= ~MOVESTATE_20;
        p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;

        return TRUE;
    }

    return FALSE;
}
END_NONMATCH

void TaskDestructor_Platform_Spiked(Task *t)
{
    PlatformSpiked *platform = TASK_DATA(t);
    VramFree(platform->s.graphics.dest);
}
