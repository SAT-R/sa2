#ifndef GUARD_GAME_BOSS_3_H
#define GUARD_GAME_BOSS_3_H

extern void CreateEggTotem(void);
extern void EggTotemMove(s32, s32);

// TEMP - Move everything below here into boss_3.c, once it is completely decompiled.

// TODO: Should this stay here for better readability or go in
//       game/parameters/bosses.h ?
#define EGGTOTEM_NUM_PLATFORMS 3

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 qUnk8;
    /* 0x0A */ s16 qUnkA;
    /* 0x0C */ u16 qUnkC; // rotation
    /* 0x0E */ s16 unkE; // dy ?
    /* 0x10 */ s16 unk10;
    /* 0x12 */ u8 unk12;
    /* 0x13 */ u8 unk13;
    /* 0x14 */ u8 unk14; // weapon lives?
    /* 0x15 */ u8 unk15;
    /* 0x16 */ u8 unk16;
    /* 0x17 */ s8 unk17;
    /* 0x18 */ u8 unk18;
    /* 0x19 */ u8 filler19[0x3];
} Totem3C; /* size: 0x1C */

typedef struct {
    /* 0x00 */ s32 qWorldX;
    /* 0x04 */ s32 qWorldY;
    /* 0x08 */ s16 unk8;
    /* 0x08 */ s16 unkA;
    /* 0x0C */ Vec2_32 qDiscPos[EGGTOTEM_NUM_PLATFORMS];
    /* 0x24 */ s16 unk24[EGGTOTEM_NUM_PLATFORMS][2];
    /* 0x30 */ u16 unk30;
    /* 0x32 */ u8 unk32;
    /* 0x33 */ u8 unk33;
    /* 0x34 */ u8 unk34;
    /* 0x35 */ u8 unk35;
    /* 0x36 */ u8 unk36;
    /* 0x37 */ u8 unk37;
    /* 0x38 */ u8 unk38;
    /* 0x39 */ u8 unk39; // numExplosions?
    /* 0x3A */ u8 unk3A;
    /* 0x3B */ u8 unk3B;
    /* 0x3C */ Totem3C unk3C[EGGTOTEM_NUM_PLATFORMS];
    /* 0x90 */ s32 qUnk90; // some x
    /* 0x94 */ s32 qUnk94; // some y
    /* 0x98 */ s16 qUnk98; // dx
    /* 0x9A */ s16 qUnk9A; // dy
    /* 0x9C */ s32 qUnk9C; // some x
    /* 0xA0 */ s32 qUnkA0; // some y
    /* 0xA4 */ s16 qUnkA4; // dx
    /* 0xA6 */ s16 qUnkA6; // dy
    /* 0xA8 */ s32 qUnkA8; // some x
    /* 0xAC */ s32 qUnkAC; // some y
    /* 0xB0 */ s16 qUnkB0; // dx
    /* 0xB2 */ s16 qUnkB2; // dy
    /* 0xB4 */ s32 unkB4;
    /* 0xB8 */ s32 qUnkB8; // some x
    /* 0xBC */ s32 qUnkBC; // some y
    /* 0xC0 */ Sprite2 sprC0; // Main body
    /* 0xF8 */ Sprite sprF8[EGGTOTEM_NUM_PLATFORMS];
    /* 0x188 */ Sprite3 spr188[EGGTOTEM_NUM_PLATFORMS];
    /* 0x248 */ Sprite spr248[2];
    /* 0x2A8 */ Sprite spr2A8;
    /* 0x2D8 */ Sprite spr2D8;
    /* 0x308 */ Sprite spr308;
    /* 0x338 */ Sprite spr338;
    /* 0x368 */ Sprite spr368;
    /* 0x398 */ void *tilesEggman;
} EggTotem; /* size: 0x39C */

extern s16 sTotemDiscYs[3];
extern TileInfo gUnknown_080D7BB0[3];
extern TileInfo gUnknown_080D7BC8[2];
extern s16 gUnknown_080D7BDC[3];
extern u8 *gUnknown_080D7ED4[13];
extern s16 gUnknown_080D7F14[2][16];
extern u8 sOamOrderIds[3];

void Task_803F3E8(void);
void sub_803F4B8(EggTotem *);
void sub_803F5E0(EggTotem *);
void sub_803F698(EggTotem *);
void sub_803FB88(EggTotem *);
void sub_804063C(EggTotem *);
void sub_80407A4(EggTotem *);
void sub_80408C4(EggTotem *);
void sub_8040A00(EggTotem *);
void sub_8040D74(EggTotem *);
void sub_8040E78(EggTotem *);
void sub_8040F14(EggTotem *);
void sub_804124C(EggTotem *);
void sub_8041264(EggTotem *);
void sub_80412B4(EggTotem *);
void Task_EggTotemMain(void);
void Task_8041138(void);
void TaskDestructor_EggTotemMain(struct Task *t);

#endif // GUARD_GAME_BOSS_3_H