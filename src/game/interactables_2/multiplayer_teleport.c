#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a/m4a.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/multiboot/collect_rings/time_display.h"
#include "game/interactables_2/multiplayer_teleport.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/songs.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s32 timer;
    /* 0x18 */ s16 unk18;
    /* 0x1A */ s16 unk1A;
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ s32 someX;
} Sprite_MultiplayerTeleport; /* size: 0x24 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u16 framesVisible;
    /* 0x32 */ u8 filler32[2];
} Sprite_Notif_RingBonus; /* size: 0x34 */

static void sub_80803FC(Sprite_MultiplayerTeleport *);
static bool32 sub_808055C(Sprite_MultiplayerTeleport *);
static void sub_80805D0(Sprite_MultiplayerTeleport *);
static void CreateSprite_Notif_RingBonus(void);

static void Task_80806F4(void);
static void sub_808073C(Sprite_MultiplayerTeleport UNUSED *s);
static void Task_8080750(void);
static void TaskDestructor_8080790(struct Task *t);
static void Task_80807A4(void);

void CreateEntity_MultiplayerTeleport(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, UNUSED u8 spriteY)
{
    struct Task *t = TaskCreate(Task_80806F4, sizeof(Sprite_MultiplayerTeleport), 0x2010, 0, NULL);
    Sprite_MultiplayerTeleport *sprite = TASK_DATA(t);

    sprite->timer = 0;
    sprite->unk18 = 0;
    sprite->unk1A = 0;
    sprite->unk1C = 0;

    sprite->posX = TO_WORLD_POS(me->x, spriteRegionX);
    sprite->posY = TO_WORLD_POS(me->y, spriteRegionY);

    sprite->unk8 = me->d.sData[0] * 8;
    sprite->unkA = me->d.sData[1] * 8;
    sprite->unkC = sprite->unk8 + me->d.uData[2] * 8;
    sprite->unkE = sprite->unkA + me->d.uData[3] * 8;

    sprite->unk10 = sprite->unkC - sprite->unk8;
    sprite->unk12 = sprite->unkE - sprite->unkA;

    SET_MAP_ENTITY_INITIALIZED(me);
}

static void sub_80803FC(Sprite_MultiplayerTeleport *sprite)
{
    if ((sprite->someX < Q(sprite->posX + sprite->unk8)) && (gPlayer.qWorldX > Q(sprite->posX + sprite->unkC))) {
        if (sprite->unk1C != 0) {
            u16 timeDiff;
            u16 prevRingCount;
            u16 ringBonus;

            sprite->unk18++;

            if (sprite->unk1A < sprite->unk18) {
                sprite->unk1A = sprite->unk18;

                // __0808043C
                timeDiff = gCheckpointTime - sprite->timer;

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

                sprite->timer = gCheckpointTime;
                gUnknown_03005B6C = timeDiff;
            }
        } else {
            sprite->unk1C = 1;
            sprite->timer = gCheckpointTime;
        }
        sprite->someX = gPlayer.qWorldX;
    } else if ((sprite->someX > Q(sprite->posX + sprite->unkC)) && (gPlayer.qWorldX < Q(sprite->posX + sprite->unk8))) {
        if (sprite->unk1C != 0) {
            sprite->unk18--;
        }

        sprite->someX = gPlayer.qWorldX;
    }

    gCurTask->main = Task_80806F4;
}

static bool32 sub_808055C(Sprite_MultiplayerTeleport *sprite)
{
    s16 spriteX, spriteY;
    s16 playerX, playerY;
    spriteX = sprite->posX - gCamera.x;
    spriteY = sprite->posY - gCamera.y;

    playerX = I(gPlayer.qWorldX) - gCamera.x;
    playerY = I(gPlayer.qWorldY) - gCamera.y;

    if ((spriteX + sprite->unk8 <= playerX) && (playerX <= spriteX + sprite->unkC) && (spriteY + sprite->unkA <= playerY)
        && (playerY <= spriteY + sprite->unkE)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static void sub_80805D0(Sprite_MultiplayerTeleport *sprite)
{
    if (sprite->unk1C != 0) {
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
    struct Task *t = TaskCreate(Task_8080750, sizeof(Sprite_Notif_RingBonus), 0x2010, 0, TaskDestructor_8080790);
    Sprite_Notif_RingBonus *notif = TASK_DATA(t);
    Sprite *s = &notif->s;

    notif->framesVisible = ZONE_TIME_TO_INT(0, 2);

    SPRITE_INIT_WITHOUT_ANIM_OR_VRAM(s, 1, 1, 0);

    s->graphics.dest = VramMalloc(26);
    s->graphics.anim = SA2_ANIM_NOTIFICATION_RING_BONUS;
    s->variant = 0;
    UpdateSpriteAnimation(s);
}

static void Task_80806F4(void)
{
    Sprite_MultiplayerTeleport *sprite = TASK_DATA(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sprite->unk18 = sprite->unk1A;
    }
    if (sub_808055C(sprite)) {
        sub_808073C(sprite);
    } else {
        sprite->someX = gPlayer.qWorldX;
    }
    sub_80805D0(sprite);
}

static void sub_808073C(Sprite_MultiplayerTeleport UNUSED *s) { gCurTask->main = Task_80807A4; }

static void Task_8080750(void)
{
    Sprite_Notif_RingBonus *sprite = TASK_DATA(gCurTask);
    if (--sprite->framesVisible == (u16)-1) {
        TaskDestroy(gCurTask);
    } else {
        sprite->s.x = (DISPLAY_WIDTH * 0.5);
        sprite->s.y = (DISPLAY_HEIGHT * 0.3);
        DisplaySprite(&sprite->s);
    }
}

static void TaskDestructor_8080790(struct Task *t)
{
    Sprite_Notif_RingBonus *sprite = TASK_DATA(t);
    VramFree(sprite->s.graphics.dest);
}

static void Task_80807A4(void)
{
    Sprite_MultiplayerTeleport *sprite = TASK_DATA(gCurTask);
    if (sub_808055C(sprite) == 0)
        sub_80803FC(sprite);
}
