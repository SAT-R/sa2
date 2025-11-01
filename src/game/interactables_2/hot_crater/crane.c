#include <stdlib.h> // abs

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

#include "lib/m4a/m4a.h"

#include "game/entity.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/hot_crater/crane.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"

#define CRANE_MAX_ACCELERATION (Q_8_8(12))
#define CHAIN_LENGTH           6
#define CRANE_PART_BODY        parts[0]
#define CRANE_PART_HOOK        parts[1 + CHAIN_LENGTH]
#define CRANE_PART_PLAYER      parts[1 + CHAIN_LENGTH + 1]

typedef struct {
    /* 0x00 */ Sprite *s;
    /* 0x04 */ u16 unk4;
    /* 0x06 */ u16 unk6; // unused
    /* 0x08 */ u16 rotation;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s32 unkC;
    /* 0x10 */ s32 unk10;
    /* 0x14 */ u16 spriteRotation;

    /* 0x18 */ s32 screenX;
    /* 0x1C */ s32 screenY;
} CranePart;

typedef struct {
    /* 0x000 */ s32 posX;
    /* 0x004 */ s32 posY;
    /* 0x008 */ CranePart parts[CHAIN_LENGTH + 3];
    /* 0x128 */ Sprite spriteBody;
    /* 0x158 */ Sprite spriteHook;
    /* 0x188 */ Sprite spriteChainLink;

    /* 0x1B8: ignore the offsets here, they all start from 0x1B8 */
    /* 0x00 */ u32 unk0;
    /* 0x04 */ s16 accelY;
    /* 0x06 */ s16 unk6;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;

    /* 0x1C4 */ MapEntity *me;
    /* 0x1C8 */ u8 spriteX;
    /* 0x1C9 */ u8 spriteY;
} Sprite_HCCrane; /* size: 0x1CC */

static void Task_Inactive(void);
static void Task_CraneExtend(void);
static void TaskDestructor_80743B8(struct Task *);
static void HandlePlayerTouchingHook(Sprite_HCCrane *);
static void HandleLaunchPlayer(Sprite_HCCrane *);
static void UpdatePartScreenPositions(Sprite_HCCrane *);
static bool32 sub_8074260(Sprite_HCCrane *);
static void Render(Sprite_HCCrane *);
static bool32 PlayerIsTouchingHook(Sprite_HCCrane *);
static void sub_80743BC(Sprite_HCCrane *);
static void sub_80743E4(Sprite_HCCrane *);
static void sub_8074400(Sprite_HCCrane *);
static u16 sub_8074448(Sprite_HCCrane *, u16);
static void UpdateChainOriginRotation(Sprite_HCCrane *);
static void sub_8074490(Sprite_HCCrane *, s16);
static bool32 sub_80744D0(Sprite_HCCrane *, s16);
static bool32 sub_80744E0(Sprite_HCCrane *, u16, s16);
static void UpdatePlayerPosition(Sprite_HCCrane *);
static bool32 ShouldDespawn(Sprite_HCCrane *);
static void Despawn(Sprite_HCCrane *);

void CreateEntity_Crane(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Inactive, sizeof(Sprite_HCCrane), 0x2010, 0, TaskDestructor_80743B8);
    Sprite_HCCrane *crane = TASK_DATA(t);
    CranePart *part;
    u16 i;

    crane->unk0 = 0;
    crane->posX = TO_WORLD_POS(me->x, spriteRegionX);
    crane->posY = TO_WORLD_POS(me->y, spriteRegionY);
    crane->me = me;
    crane->spriteX = crane->me->x;
    crane->spriteY = spriteY;
    SET_MAP_ENTITY_INITIALIZED(me);

    part = &crane->CRANE_PART_BODY;
    part->s = &crane->spriteBody;
    part->unk4 = 5;
    part->rotation = 512;
    part->unkC = 0;
    part->unk10 = 0;
    part->s->oamFlags = SPRITE_OAM_ORDER(18);

    part->s->graphics.size = 0;
    part->s->animCursor = 0;
    part->s->qAnimDelay = 0;
    part->s->prevVariant = -1;
    part->s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    part->s->palId = 0;
    part->s->hitboxes[0].index = -1;
    part->s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    part->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2BC0);
    part->s->graphics.anim = SA2_ANIM_CRANE;
    part->s->variant = 0;
    UpdateSpriteAnimation(part->s);

    for (i = 0; i < CHAIN_LENGTH; i++) {
        part = &crane->parts[1 + i];
        part->unk4 = 0;

        if (i == 0) {
            part->unk4 = 2;
            part->s = NULL;
            part->rotation = 0;
            part->unkC = 0x2C00;
            part->unk10 = 0;
        } else {
            part->s = &crane->spriteChainLink;
            part->rotation = 0;
            part->unkC = 0;
            part->unk10 = 0xC00;

            if (i == 1) {
                part->unk4 = 4;
                part->s->oamFlags = SPRITE_OAM_ORDER(18);

                part->s->graphics.size = 0;
                part->s->animCursor = 0;
                part->s->qAnimDelay = 0;
                part->s->prevVariant = -1;
                part->s->animSpeed = SPRITE_ANIM_SPEED(1.0);
                part->s->palId = 0;
                part->s->hitboxes[0].index = -1;
                part->s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
                part->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2B80);
                part->s->graphics.anim = SA2_ANIM_CRANE_PARTS;
                part->s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_ROPE_GREY;
                UpdateSpriteAnimation(part->s);
            }
        }
    }

    // Hook
    part = &crane->CRANE_PART_HOOK;
    part->s = &crane->spriteHook;

    part->unk4 = 5;
    part->rotation = 256;
    part->unkC = 0;

    part->unk10 = 0xC00;
    part->s->oamFlags = SPRITE_OAM_ORDER(18);
    part->s->graphics.size = 0;
    part->s->animCursor = 0;
    part->s->qAnimDelay = 0;
    part->s->prevVariant = -1;
    part->s->animSpeed = SPRITE_ANIM_SPEED(1.0);
    part->s->palId = 0;
    part->s->hitboxes[0].index = -1;
    part->s->frameFlags = SPRITE_FLAG(PRIORITY, 2);
    part->s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2980);
    part->s->graphics.anim = SA2_ANIM_CRANE_PARTS;
    part->s->variant = SA2_ANIM_VARIANT_CRANE_PARTS_HOOK;
    UpdateSpriteAnimation(part->s);

    part = &crane->CRANE_PART_PLAYER;
    part->s = NULL;
    part->unk4 = 2;
    part->rotation = 0;
    part->unkC = 0x1000;
    part->unk10 = 0;

    UpdateChainOriginRotation(crane);
}

static void Task_Inactive(void)
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    sub_8074260(crane);

    if (crane->CRANE_PART_HOOK.rotation != 256) {
        if (crane->CRANE_PART_HOOK.rotation > 256) {
            crane->CRANE_PART_HOOK.rotation--;
        } else {
            crane->CRANE_PART_HOOK.rotation++;
        }
    }

    UpdateChainOriginRotation(crane);
    UpdatePartScreenPositions(crane);

    if (PlayerIsTouchingHook(crane)) {
        HandlePlayerTouchingHook(crane);
    }

    if (ShouldDespawn(crane)) {
        Despawn(crane);
        return;
    }

    Render(crane);
}

static void Task_CraneExtend(void)
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);
    u16 r0;

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.timerInvulnerability == 120)) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        crane->unk0 = 0;
    }

    r0 = (((u16)crane->unk6 - (u16)crane->unk8) >> 4);

    if (r0 > 384) {
        r0 = 384;
    } else if (r0 < 64) {
        r0 = 64;
    }

    crane->unk8 += r0;
    crane->CRANE_PART_BODY.rotation = 512 - ((u16)crane->unk8 >> 6);

    if ((u16)crane->unk6 <= (u16)crane->unk8) {
        sub_80743BC(crane);
    }

    UpdateChainOriginRotation(crane);
    UpdatePartScreenPositions(crane);
    UpdatePlayerPosition(crane);
    Render(crane);
}

static void Task_CraneRetract(void)
{
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);
    u16 r3;

    if ((gPlayer.moveState & MOVESTATE_DEAD) || (gPlayer.timerInvulnerability == 120)) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        crane->unk0 = 0;
    }

    if (crane->unk6 > (64 - 1)) {
        r3 = 64;
        crane->unk6 -= 64;
    } else {
        r3 = crane->unk6;
        crane->unk6 = 0;
    }

    crane->CRANE_PART_BODY.rotation += r3;

    if (crane->unk6 == 0) {
        HandleLaunchPlayer(crane);
    }

    UpdateChainOriginRotation(crane);
    UpdatePartScreenPositions(crane);
    UpdatePlayerPosition(crane);
    Render(crane);
}

static void Task_8073C6C(void)
{
    bool32 result_744D0;
    u16 r1;
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    result_744D0 = sub_80744D0(crane, crane->unk6);

    sub_8074490(crane, crane->unk6 >> 4);
    UpdateChainOriginRotation(crane);
    r1 = sub_8074448(crane, 7) - 256;

    if (r1 != 0) {
        u16 r2;
        s32 r0 = (crane->unk6 >> 8);
        r2 = (r0 < 0) ? -r0 : r0;

        if (r2 == 0)
            r2 = 1;

        if (r1 < (SIN_PERIOD / 2)) {
            if (r2 > r1) {
                r1 = 0;
            } else {
                r1 = r1 - r2;
            }
        } else if (r2 <= SIN_PERIOD - r1) {
            r1 = r1 + r2;
        } else {
            r1 = 0;
        }

        {
            u32 newR0 = r1 + 256;
            crane->CRANE_PART_HOOK.rotation = newR0 & (SIN_PERIOD - 1);
        }
    }

    UpdatePartScreenPositions(crane);
    crane->unk6 += 42;

    if ((crane->unk6 > 0) || (result_744D0 == FALSE)) {
        sub_80743E4(crane);
    }

    Render(crane);

    crane->unk8++;
}

static void Task_8073D48(void)
{
    bool32 result_744D0;
    u16 r1;
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);

    sub_8074260(crane);

    result_744D0 = sub_80744D0(crane, crane->unk6);

    sub_8074490(crane, crane->unk6 >> 4);
    UpdateChainOriginRotation(crane);
    r1 = sub_8074448(crane, 7) - 256;

    if (r1 != 512) {
        u16 r4;
        s32 r0 = (crane->unk6 >> 8);
        r4 = (r0 < 0) ? -r0 : r0;

        if (r4 == 0)
            r4 = 1;

        if (r1 < 512) {
            if (r4 > 512 - r1) {
                r1 = 512;
            } else {
                r1 = r1 + r4;
            }
        } else if (r4 <= r1 - 512) {
            r1 = r1 - r4;
        } else {
            r1 = 512;
        }

        {
            u32 newR0 = r1 + 256;
            crane->CRANE_PART_HOOK.rotation = newR0 & (SIN_PERIOD - 1);
        }
    }

    UpdatePartScreenPositions(crane);
    crane->unk6 += 42;

    if (result_744D0 == FALSE) {
        sub_8074400(crane);
    }

    Render(crane);
}

static void Task_8073E20(void)
{
    s32 temp;
    Sprite_HCCrane *crane = TASK_DATA(gCurTask);
    sub_8074260(crane);
    UpdateChainOriginRotation(crane);

    // TODO: Fix cast... maybe unk8 is a Q_16_16?
    if (crane->unk8 != 0 || crane->unkA != 0) {
        s16 r2;

        if (crane->unk6 == 0) {
            s32 temp = -crane->unkA;
            s32 temp2 = -crane->unk8;
            r2 = (temp - temp2) >> 4;

            if (r2 > -32) {
                r2 = -32;
            }

            crane->CRANE_PART_HOOK.rotation = ((temp2 - temp) >> 4) + 256;
        } else if (crane->unk8 == 0) {
            if (crane->unkA > 0) {
                if (crane->unkA > 32) {
                    r2 = -32;
                } else {
                    r2 = -crane->unkA;
                }
            } else {
                if (crane->unkA < -32) {
                    r2 = 32;
                } else {
                    r2 = -crane->unkA;
                }
            }
        } else if (crane->unk8 > 0) {
            if (crane->unkA > 0) {
                r2 = (crane->unk8 - crane->unkA) >> 4;
                if (r2 < 32)
                    r2 = 32;
            } else {
                s32 tempa = crane->accelY;
                s32 tempb = crane->unkA;
                r2 = ((tempb - tempa)) >> 4;
                if (r2 < 32)
                    r2 = 32;
            }
        } else if (crane->unkA > 0) {
            r2 = (crane->unkA - crane->accelY) >> 4;

            if (r2 > -32) {
                r2 = -32;
            }
        } else {
            s32 tempa = crane->unkA;
            s32 tempb = crane->unk8;
            r2 = (tempb - tempa) >> 4;

            if (r2 > -32)
                r2 = -32;
        }

        crane->unkA += r2;

        if (((crane->unk8 > 0) && (crane->unk8 <= crane->unkA)) || ((crane->unk8 < 0) && (crane->unk8 >= crane->unkA))) {
            u16 unk8 = crane->unk8;
            crane->unkA = unk8;
            crane->accelY = unk8;

            // crane->unk8 *= -0.75;
            crane->unk8 = -((crane->unk8 * 3) >> 2);

            if (crane->unk8 != 0) {
                if (abs(crane->unk8) <= 128)
                    crane->unk8 = 0;
            } else {
                crane->unkA = 0;
            }
            crane->unk6++;
        }

        crane->parts[1].rotation += ((crane->unkA >> 5));
        crane->parts[1].rotation = CLAMP_SIN_PERIOD(crane->parts[1].rotation);
    }

    if (crane->unk8 == 0 && crane->unkA == 0) {
        gCurTask->main = Task_Inactive;
    }

    temp = crane->unk8;
    if (temp < 0)
        temp = -temp;

    if (temp <= SIN_PERIOD) {
        if (PlayerIsTouchingHook(crane)) {
            UpdateChainOriginRotation(crane);
            HandlePlayerTouchingHook(crane);
        }

        if (ShouldDespawn(crane)) {
            crane->me->x = crane->spriteX;
            TaskDestroy(gCurTask);
            return;
        }
    }

    UpdatePartScreenPositions(crane);

    if (ShouldDespawn(crane)) {
        Despawn(crane);
        return;
    }

    Render(crane);
}

static void HandlePlayerTouchingHook(Sprite_HCCrane *crane)
{
    s16 v;

    Player_TransitionCancelFlyingAndBoost(&gPlayer);
    PLAYERFN_CHANGE_SHIFT_OFFSETS(&gPlayer, 6, 9);
    gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;
    gPlayer.charState = CHARSTATE_HANGING;

    UpdatePlayerPosition(crane);
    crane->unk0 = 1;
    crane->accelY = gPlayer.qSpeedAirY << 1;

    CLAMP_INLINE(crane->accelY, Q_8_8(7.5), Q_8_8(12));

    v = (crane->accelY >> 2) * 15;
    crane->unk6 = v;
    crane->unk8 = 0;

    gPlayer.qSpeedGround = 0;
    gPlayer.qSpeedAirX = 0;
    gPlayer.qSpeedAirY = 0;

    gCurTask->main = Task_CraneExtend;
}

static void HandleLaunchPlayer(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && crane->unk0 != 0) {
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.charState = CHARSTATE_SPRING_B;
        gPlayer.transition = PLTRANS_PT7;
        gPlayer.qSpeedAirX = 0;
        gPlayer.qSpeedAirY = -crane->accelY;
        crane->unk0 = 0;
    }

    crane->unk6 = -crane->accelY;
    crane->unk8 = 0;

    gCurTask->main = Task_8073C6C;
}

static void UpdatePartScreenPositions(Sprite_HCCrane *crane)
{
    s32 screenX, screenY;
    u8 i;
    u32 sinIndex = 0;

    screenX = Q(crane->posX - gCamera.x);
    screenY = Q(crane->posY - gCamera.y);

    for (i = 0; i < ARRAY_COUNT(crane->parts); i++) {
        CranePart *part = &crane->parts[i];
        s16 cos = COS_24_8(sinIndex);
        s32 cosV2 = I(part->unkC * cos);
        s16 sin = SIN_24_8(sinIndex);
        s32 sinV2 = I(part->unk10 * sin);
        s32 diff, temp;
#ifndef NON_MATCHING
        register u32 mask asm("r1");
#else
        u32 mask;
#endif

        diff = cosV2 - sinV2;
        screenX += diff;

        temp = I(part->unkC * sin);

        screenY += temp + I(part->unk10 * cos);
        sinIndex += part->rotation;
#ifndef NON_MATCHING
        mask = (SIN_PERIOD - 1);
#endif
        sinIndex &= (SIN_PERIOD - 1);
#ifndef NON_MATCHING
        asm("" ::"r"(mask));
#endif
        part->spriteRotation = sinIndex;
        part->screenX = screenX;
        part->screenY = screenY;
    }
}

static bool32 sub_8074260(Sprite_HCCrane *crane)
{
    CranePart *part = &crane->CRANE_PART_BODY;

    if (part->rotation == 512) {
        return TRUE;
    } else if (part->rotation > 512) {
        if (--part->rotation <= 512) {
            part->rotation = 512;
            return TRUE;
        }
    } else {
        if (++part->rotation >= 512) {
            part->rotation = 512;
            return TRUE;
        }
    }

    return FALSE;
}

static void Render(Sprite_HCCrane *crane)
{
    SpriteTransform transform;
    u8 i;
    for (i = 0; i < ARRAY_COUNT(crane->parts); i++) {
        CranePart *part = &crane->parts[i];

        if (!(part->unk4 & 0x2)) {
            part->s->x = I(part->screenX);
            part->s->y = I(part->screenY);

            if (part->unk4 & 0x1) {
                transform.rotation = part->spriteRotation;
                transform.qScaleX = +Q(1);
                transform.qScaleY = +Q(1);

                transform.x = part->s->x;
                transform.y = part->s->y;

                part->s->frameFlags = gUnknown_030054B8++ | SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG(ROT_SCALE_ENABLE, 1)
                    | SPRITE_FLAG(ROT_SCALE_DOUBLE_SIZE, 1);

                TransformSprite(part->s, &transform);
            }
            DisplaySprite(part->s);
        }
    }
}

static bool32 PlayerIsTouchingHook(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD)) {
        if ((gPlayer.moveState & MOVESTATE_IN_AIR) && (gPlayer.qSpeedAirY > 0)) {
            s16 screenX = I(crane->CRANE_PART_HOOK.screenX);
            s16 screenY = I(crane->CRANE_PART_HOOK.screenY);
            s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
            s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

            if (((screenX - 24) <= playerX) && ((screenX + 24) >= playerX) && ((screenY - 24) <= playerY) && ((screenY + 24) >= playerY)) {
                return TRUE;
            }
        }
    }
    return FALSE;
}

static void TaskDestructor_80743B8(struct Task *t) { }

static void sub_80743BC(Sprite_HCCrane *crane)
{
    crane->unk6 = (512 - crane->CRANE_PART_BODY.rotation) << 1;
    gCurTask->main = Task_CraneRetract;
}

static void sub_80743E4(Sprite_HCCrane *crane)
{
    crane->unk6 = 0;
    gCurTask->main = Task_8073D48;
}

static void sub_8074400(Sprite_HCCrane *crane)
{
    crane->unk6 = 0;

    crane->unk8 = (256 - crane->CRANE_PART_HOOK.rotation) << 4;

    crane->unkA = 0;
    crane->accelY = 0;
    gCurTask->main = Task_8073E20;
}

static u16 sub_8074448(Sprite_HCCrane *crane, u16 max)
{
    u16 result = 0;
    u8 i;

    for (i = 0; i <= max; i++) {
        result = (result + crane->parts[i].rotation) & (SIN_PERIOD - 1);
    }

    return result;
}

static void UpdateChainOriginRotation(Sprite_HCCrane *crane)
{
    u32 r2 = crane->CRANE_PART_BODY.rotation;

    crane->parts[1].rotation = (SIN_PERIOD - r2) & (SIN_PERIOD - 1);
}

static void sub_8074490(Sprite_HCCrane *crane, s16 p1)
{
    u8 i;

    for (i = 2; i < (ARRAY_COUNT(crane->parts) - 1); i++) {
        CranePart *part = &crane->parts[i];

        part->unk10 += p1;
        if (part->unk10 > CRANE_MAX_ACCELERATION) {
            part->unk10 = CRANE_MAX_ACCELERATION;
        } else if (part->unk10 < -CRANE_MAX_ACCELERATION) {
            part->unk10 = -CRANE_MAX_ACCELERATION;
        }
    }
}

static bool32 sub_80744D0(Sprite_HCCrane *crane, s16 p1) { return sub_80744E0(crane, 7, p1); }

static bool32 sub_80744E0(Sprite_HCCrane *crane, u16 index, s16 p2)
{
    s32 v, w;

    CranePart *part = &crane->parts[index];

    w = part->unk10 + p2;
    v = (w < 0) ? -w : w;

    if (v <= CRANE_MAX_ACCELERATION) {
        part->unk10 = w;
        return TRUE;
    } else {
        s16 r3;
        if (p2 > 0) {
            r3 = w - CRANE_MAX_ACCELERATION;
            part->unk10 = CRANE_MAX_ACCELERATION;
        } else {
            r3 = w + CRANE_MAX_ACCELERATION;
            part->unk10 = -CRANE_MAX_ACCELERATION;
        }

        if (--index != 1)
            return sub_80744E0(crane, index, r3);
        else
            return FALSE;
    }
}

static void UpdatePlayerPosition(Sprite_HCCrane *crane)
{
    if (!(gPlayer.moveState & MOVESTATE_DEAD) && (crane->unk0 != 0)) {
        gPlayer.qWorldY = crane->CRANE_PART_PLAYER.screenY + Q(gCamera.y + 24);

        if (gPlayer.moveState & MOVESTATE_FACING_LEFT) {
            gPlayer.qWorldX = crane->CRANE_PART_PLAYER.screenX + Q(gCamera.x + 6);
        } else {
            gPlayer.qWorldX = crane->CRANE_PART_PLAYER.screenX + Q(gCamera.x - 6);
        }
    }
}

static bool32 ShouldDespawn(Sprite_HCCrane *crane)
{
    s16 screenX, screenY;
    screenX = crane->posX - gCamera.x;
    screenY = crane->posY - gCamera.y;

    // TODO: Replace constants!
    if (((screenX + 64) < -(CAM_REGION_WIDTH / 2)) || ((screenX - 64) > (DISPLAY_WIDTH + (CAM_REGION_WIDTH / 2)))
        || ((screenY + 64) < -(CAM_REGION_WIDTH / 2)) || ((screenY - 64) > (DISPLAY_HEIGHT + (CAM_REGION_WIDTH / 2)))) {
        return TRUE;
    }

    return FALSE;
}

static void Despawn(Sprite_HCCrane *crane)
{
    crane->me->x = crane->spriteX;
    TaskDestroy(gCurTask);
}
