#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/multiboot/collect_rings/time_display.h"
#include "game/interactables_2/collect_rings_lap_trigger.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ s16 left;
    /* 0x0A */ s16 top;
    /* 0x0C */ s16 right;
    /* 0x0E */ s16 bottom;
    /* 0x10 */ s16 width;
    /* 0x12 */ s16 height;
    /* 0x14 */ s32 prevTime;
    /* 0x18 */ s16 lap;
    /* 0x1A */ s16 highestLap;
    /* 0x1C */ bool32 passedLap;
    /* 0x20 */ s32 lastPlayerX;
} Sprite_LapTrigger; /* size: 0x24 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u16 framesVisible;
} Sprite_Notif_RingBonus; /* size: 0x34 */

static void HandleLap(Sprite_LapTrigger *);
static bool32 PlayerTouchingTrigger(Sprite_LapTrigger *);
static void UpdatePlayerPosition(Sprite_LapTrigger *);
static void CreateSprite_Notif_RingBonus(void);

static void Task_LapTriggerInactive(void);
static void HandleTrigger(Sprite_LapTrigger UNUSED *s);
static void Task_NotifRingBonus(void);
static void TaskDestructor_NotifRingBonus(struct Task *t);
static void Task_LapTriggerActive(void);

void CreateEntity_CollectRingsLapTrigger(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, UNUSED u8 spriteY)
{
    struct Task *t = TaskCreate(Task_LapTriggerInactive, sizeof(Sprite_LapTrigger), 0x2010, 0, NULL);
    Sprite_LapTrigger *trigger = TASK_DATA(t);

    trigger->prevTime = 0;
    trigger->lap = 0;
    trigger->highestLap = 0;
    trigger->passedLap = 0;

    trigger->posX = TO_WORLD_POS(me->x, spriteRegionX);
    trigger->posY = TO_WORLD_POS(me->y, spriteRegionY);

    trigger->left = me->d.sData[0] * TILE_WIDTH;
    trigger->top = me->d.sData[1] * TILE_WIDTH;
    trigger->right = trigger->left + me->d.uData[2] * TILE_WIDTH;
    trigger->bottom = trigger->top + me->d.uData[3] * TILE_WIDTH;

    trigger->width = trigger->right - trigger->left;
    trigger->height = trigger->bottom - trigger->top;

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void HandleLap(Sprite_LapTrigger *trigger)
{
    if ((trigger->lastPlayerX < Q(trigger->posX + trigger->left)) && (gPlayer.qWorldX > Q(trigger->posX + trigger->right))) {
        if (trigger->passedLap) {
            u16 timeDiff;
            u16 prevRingCount;
            u16 ringBonus;

            trigger->lap++;

            // Only provide a ring bonus the first time we enter this lap
            if (trigger->highestLap < trigger->lap) {
                trigger->highestLap = trigger->lap;

                // __0808043C
                timeDiff = gCheckpointTime - trigger->prevTime;

                if (timeDiff > ZONE_TIME_TO_INT(0, 30)) {
                    ringBonus = 5;
                } else if (timeDiff > ZONE_TIME_TO_INT(0, 20)) {
                    ringBonus = 10;
                } else {
                    ringBonus = 15;
                }

                prevRingCount = gRingCount;
                ringBonus += gRingCount;
                gRingCount = ringBonus;

                if (!IS_EXTRA_STAGE(gCurrentLevel) && (Div(gRingCount, 100) != Div(prevRingCount, 100))
                    && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
#ifndef COLLECT_RINGS_ROM
                    u32 lives = gNumLives + 1;
                    LIVES_BOUND_CHECK_B(lives);

                    gMusicManagerState.unk3 = 0x10;
#else
                    if (gNumLives < 255) {
                        gNumLives++;
                    }
#endif
                }

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (gRingCount > 255) {
                        gRingCount = 255;
                    }
                }

                m4aSongNumStart(MUS_FANFARE);
                CreateSprite_Notif_RingBonus();

                trigger->prevTime = gCheckpointTime;
                gCollectRingsLastLapTime = timeDiff;
            }
        } else {
            trigger->passedLap = TRUE;
            trigger->prevTime = gCheckpointTime;
        }
        trigger->lastPlayerX = gPlayer.qWorldX;
    } else if ((trigger->lastPlayerX > Q(trigger->posX + trigger->right)) && (gPlayer.qWorldX < Q(trigger->posX + trigger->left))) {
        if (trigger->passedLap) {
            trigger->lap--;
        }

        trigger->lastPlayerX = gPlayer.qWorldX;
    }

    gCurTask->main = Task_LapTriggerInactive;
}

static bool32 PlayerTouchingTrigger(Sprite_LapTrigger *trigger)
{
    s16 spriteX, spriteY;
    s16 playerX, playerY;
    spriteX = trigger->posX - gCamera.x;
    spriteY = trigger->posY - gCamera.y;

    playerX = I(gPlayer.qWorldX) - gCamera.x;
    playerY = I(gPlayer.qWorldY) - gCamera.y;

    if ((spriteX + trigger->left <= playerX) && (playerX <= spriteX + trigger->right) && (spriteY + trigger->top <= playerY)
        && (playerY <= spriteY + trigger->bottom)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static void UpdatePlayerPosition(Sprite_LapTrigger *trigger)
{
    if (trigger->passedLap) {
        s32 xValue, yValue;

        if ((gPlayer.qWorldX < Q(240)) && (gPlayer.qWorldY < Q(288))) {
            xValue = Q(1440);
            yValue = Q(864);
        } else if ((gPlayer.qWorldX > Q(1680)) && (gPlayer.qWorldY > Q(864))) {
            xValue = Q(-1440);
            yValue = Q(-864);
        } else {
            return;
        }
        gPlayer.qWorldX += xValue;
        gPlayer.qWorldY += yValue;

        xValue = I(xValue);
        yValue = I(yValue);

        gCamera.x += xValue;
        gCamera.unk20 += xValue;
        gCamera.unk10 += xValue;

        gCamera.y += yValue;
        gCamera.unk24 += yValue;
        gCamera.unk14 += yValue;
    }
}

static void CreateSprite_Notif_RingBonus(void)
{
    struct Task *t = TaskCreate(Task_NotifRingBonus, sizeof(Sprite_Notif_RingBonus), 0x2010, 0, TaskDestructor_NotifRingBonus);
    Sprite_Notif_RingBonus *notif = TASK_DATA(t);
    Sprite *s = &notif->s;

    notif->framesVisible = ZONE_TIME_TO_INT(0, 2);

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 1, 1, 0);

    s->graphics.dest = VramMalloc(26);
    s->graphics.anim = SA2_ANIM_NOTIFICATION_RING_BONUS;
    s->variant = 0;
    UpdateSpriteAnimation(s);
}

static void Task_LapTriggerInactive(void)
{
    Sprite_LapTrigger *trigger = TASK_DATA(gCurTask);
    if (!PLAYER_IS_ALIVE) {
        trigger->lap = trigger->highestLap;
    }
    if (PlayerTouchingTrigger(trigger)) {
        HandleTrigger(trigger);
    } else {
        trigger->lastPlayerX = gPlayer.qWorldX;
    }
    UpdatePlayerPosition(trigger);
}

static void HandleTrigger(Sprite_LapTrigger UNUSED *s) { gCurTask->main = Task_LapTriggerActive; }

static void Task_NotifRingBonus(void)
{
    Sprite_Notif_RingBonus *notif = TASK_DATA(gCurTask);
    if (--notif->framesVisible == (u16)-1) {
        TaskDestroy(gCurTask);
    } else {
        notif->s.x = (DISPLAY_WIDTH * 0.5);
        notif->s.y = (DISPLAY_HEIGHT * 0.3);
        DisplaySprite(&notif->s);
    }
}

static void TaskDestructor_NotifRingBonus(struct Task *t)
{
    Sprite_Notif_RingBonus *trigger = TASK_DATA(t);
    VramFree(trigger->s.graphics.dest);
}

static void Task_LapTriggerActive(void)
{
    Sprite_LapTrigger *trigger = TASK_DATA(gCurTask);
    if (!PlayerTouchingTrigger(trigger))
        HandleLap(trigger);
}
