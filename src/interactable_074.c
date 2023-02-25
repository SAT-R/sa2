#include "global.h"
#include "game.h"
#include "interactable.h"
#include "interactable_074.h"
#include "sprite.h"
#include "task.h"
#include "malloc_vram.h"

#include "constants/interactables.h"
#include "constants/move_states.h"
#include "constants/animations.h"

typedef struct {
    Sprite unk0[2];
    s32 unk60;
    s32 unk64;
    u8 unk68;
    u8 unk69;
    u8 filler6A;
    s8 unk6B;
    s8 unk6C;
    void *vram; /* 0x70*/
    Interactable *ia; /* 0x74*/
    s8 unk78;
    s8 unk79;
} Sprite_IA074; /* 0x7C */

void Task_Interactable074(void);
void TaskDestructor_Interactable074(struct Task *);

extern const u16 gUnknown_080E0038[][3];

void initSprite_Interactable074(Interactable *ia, u16 spriteRegionX, u16 spriteRegionY,
                                u8 spriteY)
{
    void *vram;
    u8 i;
    struct Task *t = TaskCreate(Task_Interactable074, 0x7C, 0x2010, 0,
                                TaskDestructor_Interactable074);
    Sprite_IA074 *ia74 = TaskGetStructPtr(t);
    Sprite *sprite;
    ia74->unk68 = ia->d.sData[0];
    ia74->unk6C = ia->d.sData[1];
    ia74->unk69 = 0;
    ia74->unk6B = 0;
    ia74->unk60 = SpriteGetScreenPos(ia->x, spriteRegionX);
    ia74->unk64 = SpriteGetScreenPos(ia->y, spriteRegionY);
    ia74->unk78 = ia->x;
    ia74->unk79 = spriteY;
    ia74->ia = ia;
    vram = VramMalloc(4);
    ia74->vram = vram;
    for (i = 0; i < 2; i++) {
        sprite = &ia74->unk0[i];
        sprite->unk1A = 0x480;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk28[0].unk0 = -1;
        sprite->unk10 = 0x2000;
        sprite->graphics.anim = gUnknown_080E0038[i][0];
        sprite->variant = gUnknown_080E0038[i][1];
        sprite->graphics.dest = vram;
        sub_8004558(sprite);
        vram += gUnknown_080E0038[i][2] * TILE_SIZE_4BPP;
    }
    SET_SPRITE_INITIALIZED(ia);
}

void sub_807A238(Sprite_IA074 *);
bool32 sub_807A104(Sprite_IA074 *);
void sub_807A25C(Sprite_IA074 *);
void sub_807A2D0(Sprite_IA074 *ia74);
void sub_807A2AC(Sprite_IA074 *ia74);

void sub_8079EF8(void)
{
    Sprite_IA074 *ia74 = TaskGetStructPtr(gCurTask);
    if (!PlayerIsAlive) {
        sub_807A238(ia74);
    }

    if (ia74->unk69) {
        gPlayer.unk38 &= ~0x1;
    } else {

        gPlayer.unk38 |= 0x1;
    }

    if (sub_807A104(ia74) == 0) {
        sub_807A238(ia74);
    }

    sub_807A25C(ia74);
    sub_807A2D0(ia74);
    if (ia74->unk69) {
        sub_807A2AC(ia74);
    }
}

#define MACRO_F7C(a, b, c)                                                              \
    ({                                                                                  \
        s32 temp = ((a) - (b));                                                         \
        temp += (c);                                                                    \
        temp;                                                                           \
    })

void sub_8079F7C(Sprite_IA074 *ia74)
{
    Sprite *sprite = &ia74->unk0[1];
    s32 unk60 = ia74->unk60;
    s32 cameraX = gCamera.x;

    s16 x = MACRO_F7C(unk60, cameraX, -112);
    s16 maxX = MACRO_F7C(unk60, cameraX, 112);
    s16 y = MACRO_F7C(ia74->unk64, gCamera.y, 0);

    u8 i = (gUnknown_03005590 >> 1) & 1;
    while (x <= maxX && x < 247) {
        if ((i & 1) && x > 5) {
            sprite->x = x;
            sprite->y = y;
            sub_80051E8(sprite);
        }
        x += 12;
        i++;
    }
}

extern const s16 gUnknown_080E006C[][3];

#ifndef NON_MATCHING
void sub_807A008(Sprite_IA074 *in)
{
    register Sprite_IA074 *ia74 asm("r5") = in;
#else
void sub_807A008(Sprite_IA074 *ia74)
{
#endif
    u8 i;
    Sprite *sprite;

    s32 unk60 = ia74->unk60;
    s32 cameraX = gCamera.x;

    s16 x = MACRO_F7C(unk60, cameraX, 0);
    s32 unk64 = ia74->unk64;
    s32 cameraY = gCamera.y;
    s16 y;
    s32 temp = cameraY - 4;
    unk64 -= temp;
    y = unk64;

    for (i = (gUnknown_03005590 >> 1) & 1; i < 0xC; i += 2) {
        sprite = &ia74->unk0[gUnknown_080E006C[i][2]];
        sprite->x = x + gUnknown_080E006C[i][0];
        sprite->y = y + gUnknown_080E006C[i][1];
        sub_80051E8(sprite);
    }
}

struct UNK_80E0044 {
    s16 unk0;
    s16 unk2;
    s16 unk4;
    s16 unk6;
};
extern const struct UNK_80E0044 gUnknown_080E0044[];

bool32 sub_807A094(Sprite_IA074 *ia74)
{
    s32 unk60 = ia74->unk60;
    s32 cameraX = gCamera.x;
    s16 x = MACRO_F7C(unk60, cameraX, 0);
    s32 unk64 = ia74->unk64;
    s32 cameraY = gCamera.y;
    s16 y = MACRO_F7C(unk64, cameraY, 0);
    if (x + gUnknown_080E0044[ia74->unk68].unk4 < -128
        || x + gUnknown_080E0044[ia74->unk68].unk0 > 368
        || y + gUnknown_080E0044[ia74->unk68].unk6 < -128
        || y + gUnknown_080E0044[ia74->unk68].unk2 > 288) {
        return TRUE;
    }

    return FALSE;
}

struct UNK_80E0054 {
    u16 unk0;
    u16 unk2;
    u16 unk4;
    u16 unk6;
};

extern const struct UNK_80E0054 gUnknown_080E0054[];

bool32 sub_807A104(Sprite_IA074 *ia74)
{
    if (PlayerIsAlive) {
        s16 playerX, playerY;
        s32 cameraX, cameraY;
        s32 unk60, unk64;
        s16 a, b, c, d;

        unk60 = ia74->unk60;
        cameraX = gCamera.x;
        unk60 -= cameraX;

        unk64 = ia74->unk64;
        cameraY = gCamera.y;
        unk64 -= cameraY;

        playerX = Q_24_8_TO_INT(gPlayer.x) - gCamera.x;
        playerY = Q_24_8_TO_INT(gPlayer.y) - gCamera.y;

        a = ({
            s32 temp1 = gUnknown_080E0054[ia74->unk68].unk0;
            s16 temp2 = unk60;
            temp2 + temp1;
        });
        b = ({
            s32 temp1 = gUnknown_080E0054[ia74->unk68].unk2;
            s16 temp2 = unk64;
            temp2 + temp1;
        });
        c = gUnknown_080E0054[ia74->unk68].unk4 - gUnknown_080E0054[ia74->unk68].unk0;
        d = gUnknown_080E0054[ia74->unk68].unk6 - gUnknown_080E0054[ia74->unk68].unk2;

        if (a <= playerX && (a + c >= playerX)) {
            if (b <= playerY && (b + d >= playerY)) {
                return TRUE;
            }
        }
    }

    return FALSE;
}
