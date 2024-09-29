#ifndef GUARD_PLAYER_SUPER_SONIC_H
#define GUARD_PLAYER_SUPER_SONIC_H

#include "constants/zones.h"

struct SuperSonic;

// TODO: Check whether return type is correct!
typedef void (*SuperSonicFn)(struct SuperSonic *sonic);

struct SuperSonic {
    /*  0x00 */ u32 flags;
    /*  0x04 */ s32 worldX;
    /*  0x08 */ s32 worldY;
    /*  0x0C */ s32 unkC;
    /*  0x10 */ s32 unk10;
    /*  0x14 */ s32 unk14;
    /*  0x18 */ u16 rotation;
    /*  0x1a */ s16 unk1A;
    /*  0x1C */ u16 rawKeys; // raw keys (gInput)
    /*  0x1E */ u16 pressedKeys; // pressed this frame (gPressedKeys)
    /*  0x20 */ s16 unk20;
    /*  0x22 */ s8 unk22;
    /*  0x23 */ u8 tileInfoId;
    /*  0x24 */ SuperSonicFn func24;
    /*  0x28 */ Vec2_32 unk28[32];
    /* 0x128 */ u8 unk128;
    /* 0x129 */ bool8 shouldDestroy;
    /* 0x12A */ u8 filler12A[0xA];
    /* 0x134 */ Sprite spr;
    /* 0x164 */ Hitbox reserved;
    /* 0x16C */ SpriteTransform transform;
    /* 0x178 */ u8 filler16C[8];
}; /* size: 0x180 */

#define SUPER_FLAG__1   0x1
#define SUPER_FLAG__2   0x2
#define SUPER_FLAG__4   0x4
#define SUPER_FLAG__8   0x8
#define SUPER_FLAG__10  0x10
#define SUPER_FLAG__20  0x20
#define SUPER_FLAG__40  0x40
#define SUPER_FLAG__80  0x80
#define SUPER_FLAG__100 0x100
#define SUPER_FLAG__200 0x200

#define SUPER_SONIC_AFTERIMAGE_COUNT 3

#define SUPER_SWITCH_ANIM(_sonic, _tileInfoIndex)                                                                                          \
    {                                                                                                                                      \
        _sonic->tileInfoId = _tileInfoIndex;                                                                                               \
        _sonic->spr.graphics.anim = gAnims_SuperSonic_080D69C8[_tileInfoIndex].anim;                                                       \
        _sonic->spr.variant = gAnims_SuperSonic_080D69C8[_tileInfoIndex].variant;                                                          \
        _sonic->spr.prevVariant = -1;                                                                                                      \
        _sonic->spr.graphics.size = 0;                                                                                                     \
        _sonic->spr.animCursor = 0;                                                                                                        \
        _sonic->spr.qAnimDelay = 0;                                                                                                        \
        _sonic->unk10 = 0;                                                                                                                 \
        _sonic->unk14 = 0;                                                                                                                 \
        _sonic->unk22 = 0;                                                                                                                 \
    }

extern void SuperSonicInit(void);
extern u32 SuperSonicGetFlags(void);
extern void SuperSonicGetPos(s32 *outX, s32 *outY);
extern void SuperSonicSetPos(s32 x, s32 y);
extern Sprite *SuperSonicGetSprite(void);
extern u16 SuperSonicGetRotation(void);
extern void sub_802B81C(void);
extern bool32 sub_802BA8C(void);
extern void sub_802BB54(void);
extern void sub_802C704(u8 index, s32 *outX, s32 *outY);
extern void sub_802C798(void);

#endif // GUARD_PLAYER_SUPER_SONIC_H
