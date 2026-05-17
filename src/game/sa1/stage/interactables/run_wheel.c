#include "global.h"
#include "core.h"
#include "trig.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/shared/stage/entity.h"
#include "game/shared/stage/collision.h"
#include "game/sa1/stage/stage_ui.h"

#include "constants/sa1/animations.h"
#include "constants/sa1/vram_hardcoded.h"
#include "constants/sa1/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s32 qUnk3C;
    /* 0x40 */ s32 qUnk40;
    /* 0x44 */ s32 qUnk44;
    /* 0x48 */ s32 unk48;
    /* 0x4C */ u16 unk4C;
    /* 0x4E */ u8 unk4E;
} RunWheel;

void Task_RunWheel(void);
bool32 sub_808EA80(RunWheel *wheel, Sprite *s, s32 worldX, s32 worldY, Player *p);
bool32 sub_808EC84(RunWheel *wheel, Sprite *s, s32 worldX, s32 worldY, Player *p);
void TaskDestructor_RunWheel(Task *t);

void CreateEntity_RunWheel(MapEntity *me, u16 regionX, u16 regionY, u8 id)
{
    Task *t = TaskCreate(Task_RunWheel, sizeof(RunWheel), 0x2000, 0, TaskDestructor_RunWheel);
    RunWheel *wheel = TASK_DATA(t);
    Sprite *s = &wheel->s;

    wheel->base.regionX = regionX;
    wheel->base.regionY = regionY;
    wheel->base.me = me;
    wheel->base.meX = me->x;
    wheel->base.id = id;

    wheel->qUnk3C = me->d.uData[2] * Q(16.875);
    wheel->qUnk40 = Q(0);
    wheel->unk4E = me->d.sData[0];
    wheel->qUnk44 = Q(0);
    wheel->unk4C = 0;

    s->x = TO_WORLD_POS(me->x, regionX);
    s->y = TO_WORLD_POS(me->y, regionY);

    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = ALLOC_TILES(SA1_ANIM_RUN_WHEEL);
    s->oamFlags = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA1_ANIM_RUN_WHEEL;
    s->variant = 1;
    s->animCursor = 0;
    s->qAnimDelay = Q(0);
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    s->palId = 0;
    s->hitboxes[0].index = HITBOX_STATE_INACTIVE;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void Task_RunWheel(void)
{
    RunWheel *wheel = TASK_DATA(gCurTask);
    Sprite *s = &wheel->s;
    MapEntity *me = wheel->base.me;
    s32 worldX, worldY;
    s32 worldX32, worldY32;
    s32 theta;
    s32 i;

    worldX = TO_WORLD_POS(wheel->base.meX, wheel->base.regionX);
    worldY = TO_WORLD_POS(me->y, wheel->base.regionY);

    theta = (wheel->unk4E << 7) & ONE_CYCLE;
    worldX32 = worldX + Div(COS(theta), 0x1770) * Div(wheel->qUnk40, 0xC80);

    theta = (wheel->unk4E << 7) & ONE_CYCLE;
    worldY32 = worldY + Div(SIN(theta), 0x1770) * Div(wheel->qUnk40, 0xC80);

    s->x = worldX32 - gCamera.x;
    s->y = worldY32 - gCamera.y;

    if (IS_OUT_OF_DISPLAY_RANGE(worldX, worldY) && IS_OUT_OF_CAM_RANGE(s->x, s->y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, wheel->base.meX);
        TaskDestroy(gCurTask);
        return;
    }

    i = 0;
    do {
        if ((PLAYER(i).moveState & MOVESTATE_STOOD_ON_OBJ) && PLAYER(i).stoodObj == s) {
            sub_808EC84(wheel, s, worldX, worldY, &PLAYER(i));
        } else {
            sub_808EA80(wheel, s, worldX, worldY, &PLAYER(i));
        }
    } while (++i < gNumSingleplayerCharacters);

    if (wheel->qUnk44) {
        UpdateSpriteAnimation(s);
    }

    DisplaySprite(s);
}

bool32 sub_808EA80(RunWheel *wheel, Sprite *s, s32 worldX, s32 worldY, Player *p)
{
    MapEntity *me = wheel->base.me;
    s32 worldX32, worldY32;
    u32 theta;
    s32 i;
    u32 newVariant;

    if (IS_ALIVE(p)) {
        if (sub_80549FC()) {
            worldX32 = (CamCoord)(worldX + Div(COS(((wheel->unk4E * 0x80) & ONE_CYCLE)), 0x1770) * Div(wheel->qUnk40, 0xC80));
            worldY32 = (CamCoord)(worldY + Div(SIN(((wheel->unk4E * 0x80) & ONE_CYCLE)), 0x1770) * Div(wheel->qUnk40, 0xC80));

            Coll_Player_Platform(s, worldX32, worldY32, p);
        } else {
            if (Coll_Player_Platform(s, s->x + gCamera.x, s->y + gCamera.y, p) & COLL_FLAG_8) {
                p->moveState |= MOVESTATE_STOOD_ON_OBJ;
                p->stoodObj = s;
                wheel->unk48 = 0;
                wheel->unk4C = 0;

                p->qSpeedGround = wheel->qUnk44;
                p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;

                p->moveState &= ~MOVESTATE_IA_OVERRIDE;
            }
        }
    }

    if (p->playerID == PLAYER_1) {
        s32 v;
        if (Div(wheel->qUnk44, 0x1C) < 0) {
            v = -Div(wheel->qUnk44, 0x1C);
        } else {
            v = +Div(wheel->qUnk44, 0x1C);
        }
        s->animSpeed = v;

        wheel->qUnk44 -= Q(12. / 256.);
        wheel->qUnk40 += wheel->qUnk44;

        if (wheel->qUnk40 > wheel->qUnk3C) {
            wheel->qUnk40 = wheel->qUnk3C;
        }

        if (wheel->qUnk40 < Q(0)) {
            wheel->qUnk40 = 0;
            wheel->qUnk44 = 0;
        }

        newVariant = ((u32)~wheel->qUnk44 >> 31);
        if (s->variant != newVariant) {
            s->variant = newVariant;
            s->prevVariant = -1;
        }

        wheel->unk4C++;

        if ((u32)wheel->qUnk44 + Q(5) - 1 < Q(10) - 1) {
            if (wheel->qUnk44 != Q(0)) {
                if (Mod(wheel->unk4C, 25) == 0) {
                    m4aSongNumStart(SE_RUN_WHEEL_A);
                }
            }
        } else if ((u32)wheel->qUnk44 + 0x81F < 0x103F) {
            if (Mod(wheel->unk4C, 16) == 0) {
                m4aSongNumStart(SE_RUN_WHEEL_B);
            }
        } else {
            if (Mod(wheel->unk4C, 8) == 0) {
                m4aSongNumStart(SE_RUN_WHEEL_C);
            }
        }
    }
    return TRUE;
}

// (97.92%) https://decomp.me/scratch/zk7wj
NONMATCH("asm/non_matching/game/sa1/stage/interactables/run_wheel__sub_808EC84.inc",
         bool32 sub_808EC84(RunWheel *wheel, Sprite *s, s32 worldX, s32 worldY, Player *p))
{
    MapEntity *me = wheel->base.me;
    s32 worldX32, worldY32;
    u32 theta;
    s32 i;
    u32 newVariant;
    s16 qSpeed;

    if (p->charState != 15 && IS_ALIVE(p)) {
        if (sub_80549FC()) {
            worldX32 = (CamCoord)(worldX + Div(COS(((wheel->unk4E * 0x80) & ONE_CYCLE)), 0x1770) * Div(wheel->qUnk40, 0xC80));
            worldY32 = (CamCoord)(worldY + Div(SIN(((wheel->unk4E * 0x80) & ONE_CYCLE)), 0x1770) * Div(wheel->qUnk40, 0xC80));

            // u32 Coll_Player_Platform(Sprite *, CamCoord x, CamCoord y, Player *)
            Coll_Player_Platform(s, worldX32, worldY32, p);
        } else if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && p->stoodObj == s) {
            p->qWorldY = Q(s->y + gCamera.y + s->hitboxes[0].b.top - p->spriteOffsetY);

            if ((p->moveState & MOVESTATE_IN_AIR) || p->SA2_LABEL(unk62)) {
                wheel->unk4C = 0;

                if (p->moveState & MOVESTATE_IN_AIR) {
                    p->stoodObj = NULL;
                    p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;

                    if ((p->character != CHARACTER_AMY) || !(p->moveState & MOVESTATE_4000000)) {
                        const s32 qSpeedConst = Q(1.125);
#if 01
                        s16 qSpeed = CLAMP_16(p->qSpeedAirX, -qSpeedConst, +qSpeedConst);
                        p->qSpeedAirX = qSpeed;
#else
                        if (p->qSpeedAirX < -qSpeedConst) {
                            p->qSpeedAirX = -qSpeedConst;
                        } else if (p->qSpeedAirX > +qSpeedConst) {
                            p->qSpeedAirX = +qSpeedConst;
                        }
#endif
                    } else {
                        wheel->qUnk44 = 0;
                    }
                    p->itemEffect &= ~PLAYER_ITEM_EFFECT__TELEPORT;
                } else {
                    // 17a
                    if (Coll_Player_Platform(s, s->x + gCamera.x, s->y + gCamera.y, p) & COLL_FLAG_8) {
                        p->moveState |= MOVESTATE_STOOD_ON_OBJ;
                        p->stoodObj = s;

                        qSpeed = CLAMP_16(p->qSpeedGround, -0x240, +0x240);
                        p->qSpeedGround = qSpeed;

                        p->itemEffect |= PLAYER_ITEM_EFFECT__TELEPORT;
                    }
                }
            } else {
                // 1d8
                p->qWorldX = Q(worldX + Div(COS(((wheel->unk4E * 0x80) & ONE_CYCLE)), 0x1770) * Div(wheel->qUnk40, 0xC80)) - p->qSpeedAirX;
            }
            if (p->playerID == PLAYER_1) {
                if (Div(wheel->qUnk44, 0x1C) < 0) {
                    s->animSpeed = -Div(wheel->qUnk44, 0x1C);
                } else {
                    s->animSpeed = +Div(wheel->qUnk44, 0x1C);
                }

                if ((p->character != CHARACTER_AMY) || (p->charState != 2)) {
                    wheel->qUnk44 = p->qSpeedGround - Q(16. / 256.);
                } else {
                    wheel->qUnk44 = p->qSpeedGround;
                }

                if (wheel->qUnk44 > 0) {
                    wheel->qUnk44 *= 2;
                }

                if (wheel->qUnk44 > Q(11.125)) {
                    wheel->qUnk44 = Q(11.125);
                }

                wheel->qUnk40 += wheel->qUnk44;

                if (wheel->qUnk40 > wheel->qUnk3C) {
                    wheel->qUnk40 = wheel->qUnk3C;

                    if (wheel->qUnk44 < Q(0)) {
                        wheel->qUnk44 = Q(0);
                    }
                }

                if (wheel->qUnk44 < Q(0)) {
                    if (p->qSpeedGround <= Q(0)) {
                        if ((p->character != CHARACTER_SONIC) || (p->SA2_LABEL(unk62) != 3)) {
                            p->qSpeedGround -= Q(0.25);
                        }
                    }
                }
                // 2f2

                qSpeed = p->qSpeedGround;
                p->qSpeedGround = (p->qSpeedGround < -Q(9)) ? -Q(9) : (qSpeed > +Q(4.5)) ? Q(4.5) : qSpeed;

                if (wheel->qUnk40 < Q(0)) {
                    wheel->qUnk40 = 0;
                    wheel->qUnk44 = 0;

                    if ((p->SA2_LABEL(unk62) == 0) && (qSpeed << 16) < 0) {
                        p->qSpeedGround = 0;
                    }

                    s->prevVariant = -1;
                    s->variant = 1;
                }

                if (wheel->qUnk44 >= Q(0)) {
                    if (wheel->unk48 <= 0) {
                        s->prevVariant = -1;
                        s->variant = 1;
                    }
                } else {
                    if (wheel->unk48 >= 0) {
                        s->prevVariant = -1;
                        s->variant = 0;
                    }
                }

                wheel->unk4C++;

                if ((u32)wheel->qUnk44 + Q(5) - 1 < Q(10) - 1) {
                    if (wheel->qUnk44 != Q(0)) {
                        if (Mod(wheel->unk4C, 25) == 0) {
                            m4aSongNumStart(SE_RUN_WHEEL_A);
                        }
                    }
                } else if ((u32)wheel->qUnk44 + 0x81F < 0x103F) {
                    if (Mod(wheel->unk4C, 16) == 0) {
                        m4aSongNumStart(SE_RUN_WHEEL_B);
                    }
                } else {
                    if (Mod(wheel->unk4C, 8) == 0) {
                        m4aSongNumStart(SE_RUN_WHEEL_C);
                    }
                }

                wheel->unk48 = wheel->qUnk44;
            } else if (wheel->qUnk44 > 0) {
                p->qSpeedGround = (wheel->qUnk44 >> 1);
            } else {
                p->qSpeedGround = (wheel->qUnk44);
            }

        } else {
            if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && p->stoodObj == s) {
                p->stoodObj = NULL;
                p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
            }
        }
    } else {
        if ((p->moveState & MOVESTATE_STOOD_ON_OBJ) && p->stoodObj == s) {
            p->stoodObj = NULL;
            p->moveState &= ~MOVESTATE_STOOD_ON_OBJ;
        }
    }

    return TRUE;
}
END_NONMATCH

void TaskDestructor_RunWheel(Task *t)
{
    RunWheel *wheel = TASK_DATA(t);
    VramFree(wheel->s.graphics.dest);
}