#include "global.h"
#include "malloc_vram.h"
#include "m4a.h"
#include "game.h"

#include "interactable.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

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
} Sprite_IaUnknown; /* size: 0x24 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 filler32[2];
} Sprite_Notif_RingBonus; /* size: 0x34 */

// Some timer difference
s32 gUnknown_03005B6C ALIGNED(4) = 0;

extern void sub_80803FC(Sprite_IaUnknown *);
extern bool32 sub_808055C(Sprite_IaUnknown *);
extern void sub_80805D0(Sprite_IaUnknown *);
extern void CreateSprite_Notif_RingBonus(void);

void Task_80806F4(void);
void sub_808073C(Sprite_IaUnknown UNUSED *s);
static void Task_8080750(void);
static void TaskDestructor_8080790(struct Task *t);
static void Task_80807A4(void);

void initSprite_8080368(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                        UNUSED u8 spriteY)
{
    s32 screenX, screenY;

    struct Task *t = TaskCreate(Task_80806F4, sizeof(Sprite_IaUnknown), 0x2010, 0, NULL);
    Sprite_IaUnknown *sprite = TaskGetStructPtr(t);

    sprite->timer = 0;
    sprite->unk18 = 0;
    sprite->unk1A = 0;
    sprite->unk1C = 0;

    sprite->posX = SpriteGetScreenPos(ia->x, spriteRegionX);
    sprite->posY = SpriteGetScreenPos(ia->y, spriteRegionY);

    sprite->unk8 = ia->d.sData[0] * 8;
    sprite->unkA = ia->d.sData[1] * 8;
    sprite->unkC = sprite->unk8 + ia->d.uData[2] * 8;
    sprite->unkE = sprite->unkA + ia->d.uData[3] * 8;

    sprite->unk10 = sprite->unkC - sprite->unk8;
    sprite->unk12 = sprite->unkE - sprite->unkA;

    SET_SPRITE_INITIALIZED(ia);
}

void sub_80803FC(Sprite_IaUnknown *sprite)
{
    if ((sprite->someX < Q_24_8(sprite->posX + sprite->unk8))
        && (gPlayer.x > Q_24_8(sprite->posX + sprite->unkC))) {
        if (sprite->unk1C != 0) {
            u16 r7;
#ifdef NON_MATCHING
            u32 prevCourseTime;
#else
            register u32 prevCourseTime asm("r6");
#endif
            u32 timeInc;

            sprite->unk18++;

            if (sprite->unk1A < sprite->unk18) {
                sprite->unk1A = sprite->unk18;

                // __0808043C
                r7 = gUnknown_030053E4 - sprite->timer;

                if (r7 > 1800) {
                    timeInc = 5;
                } else if (r7 > 1200) {
                    timeInc = 10;
                } else {
                    timeInc = 15;
                }

// NOTE(Jace): Non-match flips the addends in add instruction
#ifdef NON_MATCHING
                prevCourseTime = (u16)gCourseTime;
                gCourseTime += timeInc;
#else
                asm("ldrh %1, [%0]\n"
                    "\tadd r0, %2, %1 \n"
                    "\tstrh r0, [%0]\n"
                    :
                    : "r"(&gCourseTime), "r"(prevCourseTime), "r"(timeInc)
                    : "r0");
#endif

                if ((gCurrentLevel != LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53))
                    && (Div((u16)gCourseTime, 100) != Div(prevCourseTime, 100))
                    && (gGameMode == GAME_MODE_SINGLE_PLAYER)) {
                    u32 lives = gNumLives + 1;
                    if (lives > 255)
                        gNumLives = 255;
                    else
                        gNumLives = lives;

                    gUnknown_030054A8[3] = 0x10;
                }

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if ((u16)gCourseTime > 255) {
                        gCourseTime = 255;
                    }
                }

                m4aSongNumStart(MUS_FANFARE);
                CreateSprite_Notif_RingBonus();

                sprite->timer = gUnknown_030053E4;
                gUnknown_03005B6C = r7;
            }
        } else {
            sprite->unk1C = 1;
            sprite->timer = gUnknown_030053E4;
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

bool32 sub_808055C(Sprite_IaUnknown *sprite)
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

void sub_80805D0(Sprite_IaUnknown *sprite)
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
    notif->s.focused = 0;
    notif->s.unk28->unk0 = -1;
    notif->s.unk10 = 0x1000;
    notif->s.graphics.dest = VramMalloc(26);
    notif->s.graphics.anim = SA2_ANIM_NOTIFICATION_RING_BONUS;
    notif->s.variant = 0;
    sub_8004558(&notif->s);
}

void Task_80806F4(void)
{
    Sprite_IaUnknown *sprite = TaskGetStructPtr(gCurTask);
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

void sub_808073C(Sprite_IaUnknown UNUSED *s) { gCurTask->main = Task_80807A4; }

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
    Sprite_IaUnknown *sprite = TaskGetStructPtr(gCurTask);
    if (sub_808055C(sprite) == 0)
        sub_80803FC(sprite);
}