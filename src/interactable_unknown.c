#include "global.h"
#include "game.h"

#include "malloc_vram.h"
#include "sprite.h"
#include "task.h"

#include "constants/animations.h"
#include "constants/move_states.h"

typedef struct {
    /* 0x00 */ s32 posX;
    /* 0x04 */ s32 posY;
    /* 0x08 */ s16 unk8;
    /* 0x0A */ s16 unkA;
    /* 0x0C */ s16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ s16 unk12;
    /* 0x14 */ s32 unk14;
    /* 0x18 */ s16 unk18;
    /* 0x1A */ s16 unk1A;
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ s32 someX;
    /* 0x24 */ s32 someY;
} Sprite_IaUnknown; /* size: 0x24 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 filler32[2];
} Sprite_Notif_RingBonus; /* size: 0x34 */

extern void sub_80803FC(Sprite_IaUnknown *);
extern bool32 sub_808055C(Sprite_IaUnknown *);
extern void sub_80805D0(Sprite_IaUnknown *);

void Task_80806F4(void);
void sub_808073C(Sprite_IaUnknown UNUSED *s);
static void Task_8080750(void);
static void TaskDestructor_8080790(struct Task *t);
static void Task_80807A4(void);

#if 0
void sub_80803FC(Sprite_IaUnknown *sprite) {
    if ((sprite->someX < Q_24_8(sprite->posX)) && (gPlayer.x > Q_24_8(sprite->posY))) {
        // _08080412
        if (sprite->unk1C != 0) {

        }
        // _808004F8
        sprite->unk1C = 1;
        sprite->unk14 = gUnknown_030053E4;
    }
    // _08080510
    else if((sprite->someX > Q_24_8(sprite->posX + sprite->unkC))
    && (gPlayer.x < Q_24_8(sprite->posX + sprite->unk8))){
        if (sprite->unk1C != 0) {
            sprite->unk18--;
        }

        sprite->someX = gPlayer.x;
    }

    gCurTask->main = Task_80806F4;
}
#endif

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

void InitSprite_Notif_RingBonus(void)
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