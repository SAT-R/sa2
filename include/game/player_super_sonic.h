#ifndef GUARD_PLAYER_SUPER_SONIC_H
#define GUARD_PLAYER_SUPER_SONIC_H

struct SuperSonic;

// TODO: Check whether return type is correct!
typedef void (*SuperSonicFn)(struct SuperSonic *sonic);

struct SuperSonic {
    /*  0x00 */ u32 flags;
    /*  0x04 */ s32 unk4;
    /*  0x08 */ s32 unk8;
    /*  0x0C */ s32 unkC;
    /*  0x10 */ s32 unk10;
    /*  0x14 */ s32 unk14;
    /*  0x18 */ u16 rotation;
    /*  0x1a */ s16 unk1A;
    /*  0x1C */ u16 rawKeys; // raw keys (gInput)
    /*  0x1E */ u16 pressedKeys; // pressed this frame (gPressedKeys)
    /*  0x20 */ s16 unk20;
    /*  0x22 */ u8 unk22;
    /*  0x23 */ u8 tileInfoId;
    /*  0x24 */ SuperSonicFn func24;
    /*  0x28 */ Vec2_32 unk28[32];
    /* 0x128 */ u8 unk128;
    /* 0x129 */ u8 unk129;
    /* 0x12A */ u8 filler12A[0xA];
    /* 0x134 */ Sprite spr134;
    /* 0x164 */ u8 filler164[0x1C];
}; /* size: 0x180 */

#define SUPER_FLAG__1   0x1
#define SUPER_FLAG__4   0x4
#define SUPER_FLAG__20  0x20
#define SUPER_FLAG__40  0x40
#define SUPER_FLAG__200 0x200

extern u32 sub_802C6E4(void);
extern bool32 sub_802BA8C(void);

#endif // GUARD_PLAYER_SUPER_SONIC_H
