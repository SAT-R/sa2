#include "global.h"
#include "core.h"
#include "lib/m4a/m4a.h"
#include "sprite.h"

#include "game/entity.h"
#include "task.h"

#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/interactables_2/music_plant/bouncy_chain.h"

#include "constants/animations.h"
#include "constants/char_states.h"
#include "constants/player_transitions.h"
#include "constants/songs.h"

#define NUM_BOUNCY_CHAIN_LINKS 6
#define CHAIN_WIDTH_PX         (NUM_BOUNCY_CHAIN_LINKS * TILE_WIDTH)
#define BOUNCE_MIN_ACCEL       Q_8_8(4.0)
#define BOUNCE_MAX_ACCEL       Q_8_8(12.0)

typedef struct {
    s16 x;
    s16 y;
    // spike of oscillation
    s16 peak;
} ChainLink;

typedef struct {
    /* 0x00 */ ChainLink links[NUM_BOUNCY_CHAIN_LINKS];
    /* 0x30 */ SpriteBase base;
    /* 0x3C */ Sprite s;
    /* 0x6C */ s32 posX;
    /* 0x70 */ s32 posY;
    /* 0x74 */ s16 bounceAccel;
} Sprite_BouncyChain; /* size 0x78 */

static void Task_Idle(void);
static void TaskDestructor_BouncyChain(struct Task *);
static void Render(Sprite_BouncyChain *);
static bool32 PlayerIsHittingChain(Sprite_BouncyChain *);
static void LaunchPlayer(Sprite_BouncyChain *);
static void HandleVibrateFinished(Sprite_BouncyChain *);
static void ResetChainAndHandleBounce(Sprite_BouncyChain *);
static void SetPlayerBouncePosition(Sprite_BouncyChain *);
static bool32 ShouldDespawn(Sprite_BouncyChain *);

void CreateEntity_BouncyChain(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_Idle, sizeof(Sprite_BouncyChain), 0x2010, 0, TaskDestructor_BouncyChain);
    Sprite_BouncyChain *chain = TASK_DATA(t);
    Sprite *s = &chain->s;
    u16 i;

    chain->base.regionX = spriteRegionX;
    chain->base.regionY = spriteRegionY;
    chain->base.me = me;
    chain->base.spriteX = me->x;
    chain->base.id = spriteY;

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 18, 2, 0);
    s->graphics.dest = (void *)(OBJ_VRAM0 + 0x3700);
    s->graphics.anim = SA2_ANIM_NOTE_BLOCK;
    s->variant = SA2_ANIM_VARIANT_NOTE_BLOCK_CHAIN_LINK;

    chain->posX = TO_WORLD_POS(me->x, spriteRegionX);
    chain->posY = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    UpdateSpriteAnimation(s);

    for (i = 0; i < NUM_BOUNCY_CHAIN_LINKS; i++) {
        ChainLink *link = &chain->links[i];
        s16 offsetX = Q_8_8(i * TILE_WIDTH);
        s16 offsetY = 0;

        link->x = offsetX;
        link->y = offsetY;

        switch (i) {
            case 0:
            case 5: {
                link->peak = Q_8_8(0);
            } break;

            case 1:
            case 4: {
                link->peak = Q_8_8(0.5);
            } break;

            case 2:
            case 3: {
                link->peak = Q_8_8(0.5);
                // Required for match
                link->peak *= 2;
            } break;
        }
    }
}

static void Task_Bounce(void)
{
    u8 r7 = 0;
    Sprite_BouncyChain *chain = TASK_DATA(gCurTask);
    u8 i;

    SetPlayerBouncePosition(chain);

    for (i = 0; i < NUM_BOUNCY_CHAIN_LINKS; i++) {
        ChainLink *link = &chain->links[i];
        s16 r1 = I((chain->bounceAccel - link->y) * link->peak);

        if (r1 <= link->y) {
            r7++;
        } else {
            r1 = (r1 - link->y) >> 2;
            if (r1 < Q_8_8(0.5)) {
                r1 = Q_8_8(0.5);
            }
            link->y += r1;
        }
    }

    if (PLAYER_IS_ALIVE) {
        gPlayer.qWorldY = Q(chain->posY - 16) + chain->links[2].y;
        gPlayer.rotation = 64;
    }

    if (r7 == NUM_BOUNCY_CHAIN_LINKS) {
        LaunchPlayer(chain);
    }

    Render(chain);
}

static void Task_Vibrate(void)
{
    u8 r5 = 0;
    Sprite_BouncyChain *chain = TASK_DATA(gCurTask);
    u8 i;

    for (i = 0; i < NUM_BOUNCY_CHAIN_LINKS; i++) {
        ChainLink *link = &chain->links[i];

        u16 r2 = link->y;

        if (link->y == 0) {
            r5++;
        } else {
            if (link->y > 0) {
                u32 value = r2 - Q_8_8(1);
                r2 = 0;
                link->y = value;

                if (link->y < 0)
                    link->y = 0;

            } else {
                u32 value = r2 + Q_8_8(1);
                r2 = 0;
                link->y = value;

                if (link->y > 0)
                    link->y = r2;
            }

            link->y = -link->y;
        }
    }

    if (r5 == NUM_BOUNCY_CHAIN_LINKS) {
        HandleVibrateFinished(chain);
    }

    if (PlayerIsHittingChain(chain)) {
        ResetChainAndHandleBounce(chain);
    }
    Render(chain);
}

static void HandleBounce(Sprite_BouncyChain *chain)
{
    if (PLAYER_IS_ALIVE) {
        Player_SetMovestate_IsInScriptedSequence();
        gPlayer.moveState |= MOVESTATE_IA_OVERRIDE;

        gPlayer.charState = CHARSTATE_SPIN_ATTACK;
        gPlayer.qSpeedAirX = 0;
        gPlayer.qSpeedAirY = (s32)(gPlayer.qSpeedAirY * 3) >> 1;

        CLAMP_INLINE(gPlayer.qSpeedAirY, BOUNCE_MIN_ACCEL, BOUNCE_MAX_ACCEL);
    }

    chain->bounceAccel = (u16)gPlayer.qSpeedAirY * 2;

    if (chain->bounceAccel < BOUNCE_MIN_ACCEL) {
        chain->bounceAccel = BOUNCE_MIN_ACCEL;
    }

    gCurTask->main = Task_Bounce;
}

static void Render(Sprite_BouncyChain *chain)
{
    Sprite *s = &chain->s;
    u8 i;

    for (i = 0; i < NUM_BOUNCY_CHAIN_LINKS; i++) {
        ChainLink *link = &chain->links[i];
        s16 elY = ABS(link->y) >> 3;
        s32 r2, r1;
        if (i > 2)
            elY = -elY;

        r2 = chain->posX + 4;
        r2 += I(link->x + elY);
        r2 -= gCamera.x;
        s->x = r2;

        r1 = chain->posY;
        r1 += I(link->y);
        r1 -= gCamera.y;
        s->y = r1;

        DisplaySprite(s);
    }
}

static bool32 PlayerIsHittingChain(Sprite_BouncyChain *chain)
{
    if (PLAYER_IS_ALIVE && gPlayer.qSpeedAirY > 0) {
        s16 screenX = chain->posX - gCamera.x;
        s16 screenY = chain->posY - gCamera.y;
        s16 playerX = I(gPlayer.qWorldX) - gCamera.x;
        s16 playerY = I(gPlayer.qWorldY) - gCamera.y;

        if ((screenX <= playerX) && ((screenX + CHAIN_WIDTH_PX) >= playerX) && ((screenY - 9) <= playerY) && ((screenY + 9) >= playerY)) {
            return TRUE;
        }
    }
    return FALSE;
}

static void Task_Idle(void)
{
    Sprite_BouncyChain *chain = TASK_DATA(gCurTask);

    if (PlayerIsHittingChain(chain)) {
        HandleBounce(chain);
    }

    if (ShouldDespawn(chain)) {
        chain->base.me->x = chain->base.spriteX;
        TaskDestroy(gCurTask);
        return;
    }

    Render(chain);
}

static void TaskDestructor_BouncyChain(struct Task UNUSED *t) { }

static void LaunchPlayer(Sprite_BouncyChain UNUSED *chain)
{
    if (PLAYER_IS_ALIVE) {
        Player_ClearMovestate_IsInScriptedSequence();
        gPlayer.moveState &= ~MOVESTATE_IA_OVERRIDE;
        gPlayer.transition = PLTRANS_UNCURL;
        gPlayer.qSpeedAirY = -gPlayer.qSpeedAirY;
        m4aSongNumStart(SE_MUSIC_PLANT_BOUNCY_CHAIN);
    }

    gCurTask->main = Task_Vibrate;
}

static void HandleVibrateFinished(Sprite_BouncyChain UNUSED *chain) { gCurTask->main = Task_Idle; }

static void ResetChainAndHandleBounce(Sprite_BouncyChain *chain)
{
    u8 i;
    for (i = 0; i < NUM_BOUNCY_CHAIN_LINKS; i++) {
        ChainLink *link = &chain->links[i];
        link->y = 0;
    }

    HandleBounce(chain);
}

// Because assigning it to a variable doesn't match...
#define LOCAL_CHAIN_MARGIN (Q(chain->posX + (CHAIN_WIDTH_PX / 2)))

static void SetPlayerBouncePosition(Sprite_BouncyChain *chain)
{
    if (PLAYER_IS_ALIVE) {
        if (gPlayer.qWorldX != LOCAL_CHAIN_MARGIN) {
            if (gPlayer.qWorldX > LOCAL_CHAIN_MARGIN) {
                gPlayer.qWorldX -= Q(0.5);

                if (gPlayer.qWorldX < LOCAL_CHAIN_MARGIN)
                    gPlayer.qWorldX = LOCAL_CHAIN_MARGIN;
            } else {
                gPlayer.qWorldX += Q(0.5);

                if (gPlayer.qWorldX > LOCAL_CHAIN_MARGIN)
                    gPlayer.qWorldX = LOCAL_CHAIN_MARGIN;
            }
        }
    }
}

#undef LOCAL_CHAIN_MARGIN

static bool32 ShouldDespawn(Sprite_BouncyChain *chain)
{
    s32 screenX, screenY;
    s16 otherX, otherY;

    screenX = chain->posX;
    screenX -= gCamera.x;

    screenY = chain->posY;
    screenY -= gCamera.y;

    otherY = screenY;
    otherX = screenX;

    if (IS_OUT_OF_RANGE_2(otherX, otherY, (CAM_REGION_WIDTH + (CHAIN_WIDTH_PX / 2)) / 2, CAM_REGION_WIDTH / 2)) {
        return TRUE;
    }

    return FALSE;
}
