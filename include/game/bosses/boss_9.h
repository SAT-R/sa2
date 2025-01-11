#ifndef GUARD_GAME_BOSS_9_H
#define GUARD_GAME_BOSS_9_H

#include "global.h" // for Vec2_16/32
#include "sprite.h" // Sprite
#include "game/stage/screen_fade.h"

// NOTE:
// struct TA53Boss and all the structs referenced in it have to be declared in the .h
// file because the stage background function of the TA53 references it, mainly becaue
// the boss's cockpit is rendered in a background layer.

#define TA53_BOSS_BACKGROUND_ID 1
#define TA53_BOSS_SCREENBASE    28

extern void CreateTrueArea53Boss(void);
extern bool32 ExtraBossIsDead(void);
extern void TrueArea53BossMove(s32, s32);

// TODO: Parameter types
//       On the initial run sub_804F6AC only matched usign u32 as last param,
//       but for other functions it seems like it should be u16.
//       sub_804FD58 might have the solution? (index % 1024)
typedef void (*TA53SubFunc)(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804F6AC(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804F768(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804F850(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804F9BC(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804FAA4(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804FC10(u32 qX, u32 qY, s16 param2, u32 sinIndex_);
void sub_804FD58(u32 qX, u32 qY, s16 param2, u32 sinIndex_);

typedef struct TA53_unk1C {
    /* 0x00 */ void (*callback)(struct TA53_unk1C *);
    /* 0x04 */ s16 unk4[4];
    /* 0x0C */ s16 unkC[4];
    /* 0x14 */ u16 unk14;
    /* 0x16 */ u16 unk16;
    /* 0x18 */ u32 unk18;
    /* 0x1C */ s16 **unk1C;

    // Maybe a direction vector?
    /* 0x20 */ s16 unk20;
    /* 0x22 */ s16 unk22;

    /* 0x24 */ Vec2_32 qPos;
} TA53_unk1C; /* size: 0x2C */

typedef struct TA53_unk48 {
    void (*callback)(struct TA53_unk48 *);
    s16 unk4[4];
    s16 unkC[4];
    u16 unk14[4];
    u16 unk1C[4];
    u16 unk24[4];
    u16 unk2C;
    u16 unk2E;
    u32 unk30;
    s16 **unk34;
    u16 unk38;
    u16 unk3A[4];
    u16 unk42; // related to unk3A[]? Maybe 5th element?
    Vec2_32 qPos44; // maybe this is not a Vec2_32 ?
    u8 unk4C;
} TA53_unk48; /* size: 0x4D ? */

typedef struct {
    void (*callback)(struct TA53_unk48 *);
    void *data;
    u16 unk8;
} TA53_Data0;

typedef struct {
    void (*callback)(struct TA53_unk1C *);
    void *data;
    u16 unk8;
} TA53_Data1;

struct TA53_unkA8;
typedef void (*TA53_Rocket_Callback)(struct TA53_unkA8 *);

typedef struct TA53_RocketExhaust {
    /* 0x58 */ void (*callback)(struct TA53_RocketExhaust *);
    /* 0x5C */ u8 unk4[5];
    /* 0x62 */ s16 unkA[5][2]; // NOTE: Would be Vec2_16, but alignment doesn't work
    /* 0x78 */ Vec2_32 pos[5];
    /* 0xA0 */ Sprite s[5];
} TA53_RocketExhaust;

// TODO: Name ("TA53_Rocket"?)
typedef struct TA53_unkA8 {
    /* 0x00 */ TA53_Rocket_Callback callback;
    /* 0x04 */ u8 unk4;
    /* 0x05 */ u8 unk5;
    /* 0x06 */ u8 unk6;
    /* 0x07 */ u8 unk7;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ s16 unk10;
    /* 0x12 */ u8 filler12[0x2];
    /* 0x14 */ Vec2_32 pos14;
    /* 0x1C */ s32 unk1C;
    /* 0x20 */ Sprite spr20;
    /* 0x50 */ Hitbox reserved;
    /* 0x58 */ TA53_RocketExhaust exhaust;
} TA53_unkA8; /* size: 0x190 */

typedef struct TA53_unk98 {
    /* 0x00 */ void (*callback)(struct TA53_unk98 *);
    /* 0x04 */ u16 unk4; // some counter
    /* 0x06 */ u16 unk6;
    /* 0x08 */ s32 qUnk8;
    /* 0x0C */ s32 qUnkC;
    /* 0x10 */ TA53_unkA8 unk10[3];
} TA53_unk98; /* size: 0x4C0 */

// TA53_Mouth ?
typedef struct TA53_unk558 {
    /* 0x00 */ void (*callback)(struct TA53_unk558 *); // void func (TA53_unk558 *)
    /* 0x04 */ u8 unk4;
    /* 0x05 */ u8 unk5;
    /* 0x06 */ u16 unk6;
    /* 0x08 */ s32 unk8;
    /* 0x0C */ Sprite s;
} TA53_unk558; /* size: 0x3C */

typedef struct TA53_unk594 {
    void (*callback)(struct TA53_unk594 *);
    u8 unk4[10];
    u8 unkE[10];
    s16 unk18[10][2];
    Vec2_32 unk40[10];
    Sprite spr90;
} TA53_unk594; /* size: 0xC0 */

typedef struct TA53_unk654 {
    /* 0x00 */ void (*callback)(struct TA53_unk654 *);
    /* 0x04 */ TA53SubFunc func4;
    /* 0x08 */ u16 unk8;
    /* 0x0A */ u16 unkA;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ u8 unkE[16];
    /* 0x1E */ u8 unk1E[16];
    /* 0x2E */ s16 unk2E[16][2];

    /* 0x70 */ Vec2_32 qPos70[16];

    /* 0xF0 */ Sprite sprF0;
    /* 0x120 */ Hitbox hbSprF0;

    /* 0x128 */ Sprite spr128;
    /* 0x158 */ Hitbox hbSpr128;
} TA53_unk654; /* size: 0x160 */

typedef struct {
    /* 0x00 */ Sprite s;
    /* 0x30 */ Hitbox reserved;
    /* 0x38 */ SpriteTransform transform;
} CapsuleParts; /* size: 0x44 */

typedef struct TA53Boss {
    /* 0x000 */ ScreenFade fade;
    /* 0x00C */ u8 lives;
    /* 0x00D */ u8 unkD;
    /* 0x00E */ u8 unkE;
    /* 0x00F */ u8 unkF;
    /* 0x010 */ u16 unk10;
    /* 0x012 */ u16 unk12;
    /* 0x014 */ Vec2_32 qPos;
    /* 0x01C */ TA53_unk1C unk1C;
    /* 0x048 */ TA53_unk48 unk48;
    /* 0x098 */ TA53_unk98 unk98;
    /* 0x558 */ TA53_unk558 unk558;
    /* 0x594 */ TA53_unk594 unk594;
    /* 0x654 */ TA53_unk654 unk654;
    // Sprite used for the capsule Sonic rescues in the Extra cutscene
    /* 0x7B4 */ Sprite spr7B4;
    /* 0x7E4 */ u8 filler7E4[0xC];
    /* 0x7F0 */ CapsuleParts capsule[4];
    /* 0x900 */ Background bg900;
} TA53Boss; /* size: 0x940 */

#endif // GUARD_GAME_BOSS_9_H