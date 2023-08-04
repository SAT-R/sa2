#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"
#include "game/game.h"

#include "game/multiboot/collect_rings/time_display.h"
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
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 filler32[2];
} Sprite_Notif_RingBonus; /* size: 0x34 */

extern void sub_80803FC(Sprite_MultiplayerTeleport *);
extern bool32 sub_808055C(Sprite_MultiplayerTeleport *);
extern void sub_80805D0(Sprite_MultiplayerTeleport *);
extern void CreateSprite_Notif_RingBonus(void);

void Task_80806F4(void);
void sub_808073C(Sprite_MultiplayerTeleport UNUSED *s);
static void Task_8080750(void);
static void TaskDestructor_8080790(struct Task *t);
static void Task_80807A4(void);

void CreateEntity_MultiplayerTeleport(MapEntity *me, u16 spriteRegionX,
                                      u16 spriteRegionY, UNUSED u8 spriteY)
{
    s32 screenX, screenY;

    struct Task *t
        = TaskCreate(Task_80806F4, sizeof(Sprite_MultiplayerTeleport), 0x2010, 0, NULL);
    Sprite_MultiplayerTeleport *sprite = TaskGetStructPtr(t);

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

void sub_80803FC(Sprite_MultiplayerTeleport *sprite)
{
    if ((sprite->someX < Q_24_8(sprite->posX + sprite->unk8))
        && (gPlayer.x > Q_24_8(sprite->posX + sprite->unkC))) {
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

                if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))
                    && (Div(gRingCount, 100) != Div(prevRingCount, 100))
                    && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                    u32 lives = gNumLives + 1;
                    if (lives > 255)
                        gNumLives = 255;
                    else
                        gNumLives = lives;

                    gUnknown_030054A8.unk3 = 0x10;
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
        sprite->someX = gPlayer.x;
    } else if ((sprite->someX > Q_24_8(sprite->posX + sprite->unkC))
               && (gPlayer.x < Q_24_8(sprite->posX + sprite->unk8))) {
        if (sprite->unk1C != 0) {
            sprite->unk18--;
        }

        sprite->someX = gPlayer.x;
    }

    gCurTask->main = Task_80806F4;
}

bool32 sub_808055C(Sprite_MultiplayerTeleport *sprite)
{
    s16 spriteX, spriteY;
    s16 playerX, playerY;
    spriteX = sprite->posX - gCamera.x;
    spriteY = sprite->posY - gCamera.y;

    playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
    playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

    if ((spriteX + sprite->unk8 <= playerX) && (playerX <= spriteX + sprite->unkC)
        && (spriteY + sprite->unkA <= playerY) && (playerY <= spriteY + sprite->unkE)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void sub_80805D0(Sprite_MultiplayerTeleport *sprite)
{
    if (sprite->unk1C != 0) {
        s32 xValue, yValue;

        if ((gPlayer.x < Q_24_8(240)) && (gPlayer.y < Q_24_8(288))) {
            xValue = Q_24_8(1440);
            yValue = Q_24_8(864);
        } else if ((gPlayer.x > Q_24_8(1680)) && (gPlayer.y > Q_24_8(864))) {
            xValue = Q_24_8(-1440);
            yValue = Q_24_8(-864);
        } else {
            return;
        }
        gPlayer.x += xValue;
        gPlayer.y += yValue;

        xValue = Q_24_8_TO_INT(xValue);
        yValue = Q_24_8_TO_INT(yValue);

        gCamera.x += xValue;
        gCamera.unk20 += xValue;
        gCamera.unk10 += xValue;

        gCamera.y += yValue;
        gCamera.unk24 += yValue;
        gCamera.unk14 += yValue;
    }
}

void CreateSprite_Notif_RingBonus(void)
{
    struct Task *t = TaskCreate(Task_8080750, sizeof(Sprite_Notif_RingBonus), 0x2010, 0,
                                TaskDestructor_8080790);
    Sprite_Notif_RingBonus *notif = TaskGetStructPtr(t);

    notif->unk30 = 120;
    notif->s.unk1A = 0x40;
    notif->s.graphics.size = 0;
    notif->s.unk14 = 0;
    notif->s.unk1C = 0;
    notif->s.unk21 = 0xFF;
    notif->s.unk22 = 0x10;
    notif->s.palId = 0;
    notif->s.unk28->unk0 = -1;
    notif->s.unk10 = 0x1000;
    notif->s.graphics.dest = VramMalloc(26);
    notif->s.graphics.anim = SA2_ANIM_NOTIFICATION_RING_BONUS;
    notif->s.variant = 0;
    sub_8004558(&notif->s);
}

void Task_80806F4(void)
{
    Sprite_MultiplayerTeleport *sprite = TaskGetStructPtr(gCurTask);
    if (gPlayer.moveState & MOVESTATE_DEAD) {
        sprite->unk18 = sprite->unk1A;
    }
    if (sub_808055C(sprite)) {
        sub_808073C(sprite);
    } else {
        sprite->someX = gPlayer.x;
    }
    sub_80805D0(sprite);
}

void sub_808073C(Sprite_MultiplayerTeleport UNUSED *s) { gCurTask->main = Task_80807A4; }

void Task_8080750(void)
{
    Sprite_Notif_RingBonus *sprite = TaskGetStructPtr(gCurTask);
    if (--sprite->unk30 == (u16)-1) {
        TaskDestroy(gCurTask);
    } else {
        sprite->s.x = (DISPLAY_WIDTH * 0.5);
        sprite->s.y = (DISPLAY_HEIGHT * 0.3);
        sub_80051E8(&sprite->s);
    }
}

static void TaskDestructor_8080790(struct Task *t)
{
    Sprite_Notif_RingBonus *sprite = TaskGetStructPtr(t);
    VramFree(sprite->s.graphics.dest);
}

static void Task_80807A4(void)
{
    Sprite_MultiplayerTeleport *sprite = TaskGetStructPtr(gCurTask);
    if (sub_808055C(sprite) == 0)
        sub_80803FC(sprite);
}