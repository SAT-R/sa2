/* General module of stub of functions that have not been decompiled */

#include "global.h"
#include "sprite.h"
#include "task.h"
#include "sakit/collision.h" // sub_800D0A0
#include "game/bosses/boss_5.h" // sub_802E784
#include "game/bosses/boss_7.h" // sub_80498CC
#include "game/bosses/boss_9.h" // sub_804D594
#include "game/math.h" // sub_8084B54
#include "game/stage/game_7.h"

void *ewram_end = 0;
void *iwram_end = 0;
char gNumMusicPlayers = 4;
int gMaxLines = 0;

void sub_8004E14(Sprite *s, SpriteTransform *transform) { }

// collision
u32 sub_800D0A0(Sprite *s, s16 x, s16 y, s16 param3, s16 param4, u8 param5, u32 param6)
{
    return 0;
}

// boss_5
void sub_802E784(u16 p0, u16 p1, u16 p2, s16 x, s16 y, s16 p5) { }

// boss_7
typedef void (*EggFrogCallback)(void *);

typedef struct {
    u8 unk0[6];
    u8 unk6;
    u8 unk7;
    u8 filler8[6];
    u8 unkE;
    u8 unkF;
    u8 filler0[2];
    u8 unk12;
    u8 unk13;
    u8 filler1[6];
    u8 unk1A;
    u8 unk1B;
    u8 filler2[6];
    u8 unk22;
    u8 unk23;
    u8 filler3[10];
    u8 unk2E;
    u8 unk2F;
    u8 unk[6];
    u8 unk36;
    u8 unk37;
    u16 unk38;
    u8 unk3A;
    u8 unk3B;
} UNK_80D8710;
const s8 gUnknown_080D8148[2];
const s8 gUnknown_080D814A[0x452];
const u32 gUnknown_080D86D4[15];
const TileInfo gUnknown_080D8108[8] = { 0 };
const UNK_80D8710 gUnknown_080D8710 = { 0 };
const u16 gUnknown_080D8796[][16]
    = { { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
const u8 gUnknown_080D8788[][7] = { { 0, 0, 0, 0, 0, 0, 0 } };
extern void sub_8048C7C(void *boss);
void sub_80493F8(void *boss, s32 x, s32 y, u8 param3) {
} // actually: (EggFrog *boss, s32 x, s32 y, u8 );
void sub_80498CC(u8 param0) { }
const void *const gUnknown_080D874C[15]
    = { sub_8048C7C, sub_8048C7C, sub_8048C7C, sub_8048C7C, sub_8048C7C,
        sub_8048C7C, sub_8048C7C, sub_8048C7C, sub_8048C7C, sub_8048C7C,
        sub_8048C7C, sub_8048C7C, sub_8048C7C, sub_8048C7C };

// boss_9
const u16 *const gUnknown_080D859C[39] = {};
const s16 gUnknown_080D8A94[4] = { 0 };
const s16 gUnknown_080D8AAC[4] = { 0 };
const s16 gUnknown_080D8AC4[4] = { 0 };
const s16 gUnknown_080D8ADC[4] = { 0 };
const s16 gUnknown_080D8AF4[4] = { 0 };
const s16 gUnknown_080D8C7C[4] = { 0 };
const s16 gUnknown_080D8C94[4] = { 0 };
const TA53_Data0 gUnknown_080D8D6C[8] = { 0 };
const TA53_Data0 gUnknown_080D8DCC[8] = { 0 };
void CreateTrueArea53Boss(void) {};
void Task_EggmanKidnapsVanilla(void) { TaskDestroy(gCurTask); }
void sub_804D594(s32 qx, s32 qy) { }
void TaskDestructor_TrueArea53BossGfx(struct Task *t) { }
void sub_8050B2C(s32 *a, s32 *b) { }
bool32 ExtraBossIsDead(void) { return TRUE; }

// math
void sub_80835E0(struct UNK_8085F1C *p0, s32 *p1) { }
void sub_8083B88(struct UNK_8085F1C_1 *p0, struct UNK_8085F1C_1 *p1,
                 struct UNK_8085F1C_1 *p2)
{
}
void sub_8084B54(struct UNK_8085F1C_1 *p0, u16 p1, u16 p2, u16 p3) { }

// TEMP
void CreateSuperEggRoboZ(void) { }
void RealClearChain(void) { }
void SoundMainBTM(void) { }
double sqrt(double v) { return 0; }
float atan2f(float a, float b) { return 0; }

// #ifdef WIN32
// void *memset(void *_dst, int value, unsigned int size)
// {
//     u8 *dst = (u8 *)_dst;
//     u8 *end = dst + size;

//     while (dst < end) {
//         *dst = value;
//         dst++;
//     }

//     return dst;
// }
// #endif
