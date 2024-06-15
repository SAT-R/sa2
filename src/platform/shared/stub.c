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

// collision
u32 sub_800D0A0(Sprite *s, s16 x, s16 y, s16 param3, s16 param4, u8 param5, u32 param6)
{
    return 0;
}

// boss_5
void sub_802E784(u16 p0, u16 p1, u16 p2, s16 x, s16 y, s16 p5) { }

extern void sub_8048C7C(void *boss);

// boss run
const u16 gUnknown_080D87E6[][2] = { { 0, 0 } };
const u16 gUnknown_080D87D8[] = { 0 };
const u32 gUnknown_080D8808[][2] = { { 0, 0 } };

void sub_8049D20(void *vramTiles, void *boss) { }

// math
void sub_80835E0(struct UNK_8085F1C *p0, s32 *p1) { }
void sub_8083B88(struct UNK_8085F1C_1 *p0, struct UNK_8085F1C_1 *p1,
                 struct UNK_8085F1C_1 *p2)
{
}
void sub_8084B54(struct UNK_8085F1C_1 *p0, u16 p1, u16 p2, u16 p3) { }

// TEMP
void RealClearChain(void) { }
void SoundMainBTM(void) { }
double sqrt(double v) { return 0; }
float atan2f(float a, float b) { return 0; }
