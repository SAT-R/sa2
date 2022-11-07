#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_unk_806F910.h"
#include "special_stage_guard_robo.h"
#include "special_stage_data.h"
#include "task.h"
#include "trig.h"
#include "game.h"
#include "m4a.h"
#include "constants/songs.h"

void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806EFB4(void);
void sub_806F034(void);
void sub_806F3C4(void);
void sub_806F36C(void);
void sub_806F9E4(void);
void sub_806F0C4(void);
void sub_806F154(void);
void sub_806F1E8(void);
void sub_806F268(void);
void sub_806FB00(void);
void sub_806F300(void);
void sub_806F300(void);

s16 sub_806F69C(struct SpecialStage*);
void sub_806FAA0(void);
void sub_806F56C(void);
void sub_806F604(void);
void sub_806FA34(void);

static const struct UNK_8C87920 gUnknown_080DF794[3] = {
    { 2, 890, },
    { 1, 890, },
    { 0, 890, },
};

typedef void (*TaskFunc_80DF7A0)(void);

static TaskFunc_80DF7A0 const gUnknown_080DF7A0[18] = {
    NULL,
    sub_806F9CC,
    sub_806F9CC,
    sub_806F9CC,
    sub_806F9CC,
    sub_806EFB4,
    sub_806F034,
    sub_806F3C4,
    sub_806F36C,
    sub_806F9E4,
    sub_806F0C4,
    sub_806F154,
    sub_806F1E8,
    sub_806F268,
    sub_806FB00,
    sub_806F300,
    sub_806F300,
    NULL,
};

void sub_806EC24(void) {
    s32 temp5;
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkF910->stage;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    
    TaskFunc_80DF7A0 funcs[18];
    memcpy(funcs, gUnknown_080DF7A0, sizeof(gUnknown_080DF7A0));

    switch (stage->unk5B4) {
        case 4:
        case 5:
        case 6:
            if (stage->unk5BA == 0) {
                funcs[player->unkB4 + 1]();
            }
            break;
        case 7:
            if (player->unkB4 < 0xB) {
                player->unkB4 = 0xB;
            }
            if (stage->unk5BA == 0) {
                funcs[player->unkB4 + 1]();
            }
            break;
    }

    if (player->unkB4 < 0xB) {
        s32 temp, temp2;
        struct UNK_0808B3FC_UNK240* element;
        s16 result = sub_806F69C(stage);
        s32 sin2 = gSineTable[result] * 4;
        s32 sin = gSineTable[result + 0x100] * 4;

        temp = sin2 * 0x14;
        temp2 = sin * 0x14;
    
        temp = Q_16_16_TO_INT(temp) + 0x70;
        temp2 = -(Q_16_16_TO_INT(temp2) >> 1) + 0x78;
        
        player->unk68.unk16 = temp;
        player->unk68.unk18 = temp2;

        if (result > 0x100 && result < 0x300) {
            player->unk68.unk1A = 0;
        } else {
            player->unk68.unk1A = 0x280;
        }

        sub_80047A0(result, 0x100, 0x100, 0x1E);

        if (stage->unk5BA == 0) {
            sub_8004558(&player->unk68);
        }
        sub_80051E8(&player->unk68);
    }

    sub_806FAA0();
    stage->unk594 = player->x;
    stage->unk598 = player->y;
    stage->unk5A0 = player->unkB2;

    gBgScrollRegs[2][1] = temp5 = -Q_16_16_TO_INT(player->y);
    gBgScrollRegs[2][0] = temp5 = -Q_16_16_TO_INT(player->x);
}

void sub_806EDB4(UNUSED u32 unused) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    s32 c8 = player->unkC8;
    s32 e4 = player->unkE4;

    u16 b2 = player->unkB2;
    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if (gInput & DPAD_UP) {
        s32 d8 = player->unkD8;
        if (c8 < e4) {
            if ((c8 + d8) < e4) {
                player->unkC8 = c8 + d8;
                c8 = player->unkC8;
                
                if (player->unkC8 > 0x2300) {
                    player->unkB4 = 2;
                } else {
                    player->unkB4 = 1;
                }
            } else {
                player->unkC8 = e4;
                c8 = player->unkC8;
                player->unkB4 = 2;
            }
        } else {
            player->unkC8 = c8 + player->unkDC;
            c8 = player->unkC8;
            player->unkB4 = 2;
        }
        player->unkA4 = c8 >> 9;
    } else if (gInput & DPAD_DOWN) {
        s32 e0 = player->unkE0;
        if (player->unkB4 == 0) {
            player->unkB4 = 7;
            return;
        }

        if ((c8 + e0) > 0) {
            player->unkC8 = c8 + e0; 
            c8 = player->unkC8;
        } else {
            player->unkC8 = 0;
            c8 = 0;
        }

        if (c8 == 0) {
            player->unkA4 = 0;
            player->unkB4 = 8;
        } else {
            player->unkB4 = 3;
        }
    } else {
        if (c8 + player->unkDC > 0) {
            player->unkC8 = c8 + player->unkDC;
            c8 = player->unkC8;
        } else {
            player->unkC8 = 0;
            c8 = 0;
            
        }
    
        if (c8 == 0) {
            player->unkA4 = 0;
            player->unkB4 = 0;
        } else {
            if (c8 > 0x2300) {
                player->unkB4 = 2;
                player->unkA4 = c8 >> 9;
            } else {
                player->unkB4 = 1;
                player->unkA4 = c8 >> 9;
            }
        }
    }
    {
        s32 temp = (sin1 * c8) >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->x -= temp;
        player->y -= temp2;
    }
}

void sub_806EF44(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    u16 b2 = player->unkB2;
    
    if (gInput & (DPAD_LEFT | DPAD_RIGHT)) {
        if (gInput & DPAD_LEFT) {
            b2 += player->unkCC;
        }
        if (gInput & DPAD_RIGHT) {
            b2 -= player->unkCC;
        }
        
        player->unkB2 = b2;
        player->unkB2 &= 0x3FF;
    }
}

void sub_806EFB4(void) { 
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);
    sub_806EF44();
    sub_806F56C();

    player->unkBA++;

    player->unkB8 += player->unkF2;

    if (player->unkBA >= player->unkF0 || !(gInput & gUnknown_03005B38.unk0)) {
        player->unkB4 = 5;
    }
}

void sub_806F034(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);
    sub_806EF44();
    sub_806F56C();
    
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        s32 c8 = player->unkC8;
        player->unkB0 = 0;
        if (c8 < 1) {
            player->unkB4 = 8;
        } else if (c8 < 0x2301) {
            player->unkB4 = 1;
        } else {
            player->unkB4 = 2;
        }
    }
}

void sub_806F0C4(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);
    sub_806EF44();
    sub_806F604();
    
    player->unkB8 += player->unkF6;

    if (player->unkB0 < 1) {
        s32 c8 = player->unkC8;
        player->unkB0 = 0;
        if (c8 < 1) {
            player->unkB4 = 8;
        } else if (c8 < 0x2301) {
            player->unkB4 = 1;
        } else {
            player->unkB4 = 2;
        }
    }
}

void sub_806F154(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    sub_806EF44();
    sub_806F604();

    player->x += player->unkD0;
    player->y += player->unkD4;
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        player->unkC8 = 0x2000;
        player->unkB0 = 0;
        player->unkB4 = 1;
    }
}

void sub_806F1E8(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);
    unkF910->unk4++;
    player->unkB8 += player->unkFA;
    sub_806F56C();

    if (player->unkB0 < 1) {
        unkF910->unk4 = 0;
        player->unkB8 = 0;
        player->unkB0 = 0;
        
        if (player->unkC8 == 0) {
            player->unkB4 = 0xD;
        } else {
            player->unkB4 = 0xC;
        }
    }
}

void sub_806F268(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    s32 e0 = player->unkE0;
    s32 c8 = player->unkC8;
    u16 b2 = player->unkB2;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];
    if ((c8 + e0) > 0) {
        player->unkC8 = c8 + e0;
        c8 += e0;
    } else {
        player->unkC8 = 0;
        c8 = 0;
    }

    {
        s32 temp2 = (sin1 * c8) >> 10;
        s32 temp3 = (sin2 * c8) >> 10;
        player->x -= temp2;
        player->y -= temp3;
    }

    if (c8 == 0) {
        player->unkB4 = 0xD;
    }
}

void sub_806F300(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    unkF910->unk4++;
    player->unkB8 += player->unkFE;

    if (player->unkB0 < -0x4000) {
        unkF910->unk4 = 0;
        player->unkB8 = 0;
        player->unkB0 = -0x4000;
        player->unkB4 = 0xF;
    }
}

void sub_806F36C(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    u16 temp = (player->unkB2 + 0x10);
    player->unkB2 = temp & 0x3FF;
    unkF910->unk4++;

    if (unkF910->unk4 > 0x1F) {
        unkF910->unk4 = 0;
        player->unkC8 = 0;
        player->unkB4 = 8;
    }
}

void sub_806F3C4(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    if (player->x <= Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X);
    } 

    if (player->x >= Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->y <= Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y);
    }

    if (player->y >= Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y);
    }

    unkF910->unk4++;

    player->unkB8 += player->unkFA;

    if (player->unkB0 < 0) {
        player->unkB0 = 0;
        player->unkB8 = 0;
        unkF910->unk4 = 0;

        // TODO: must be a macro
        player->unkB8 = 0;
        player->unkB0 = 0;
        player->unkB4 = 0;
    }
}

void sub_806F468(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = unkF910->stage;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    const struct UNK_8C87904* unk7904 = gUnknown_08C87904[stage->zone];

    s16 playerX = Q_16_16_TO_INT(player->x);
    s16 playerY = Q_16_16_TO_INT(player->y);

    while (unk7904->unk0 != -1) {
        if (playerX >= unk7904->unk2 && playerX < (unk7904->unk2 + unk7904->unk6)) {
            if (playerY >= unk7904->unk4 && playerY < (unk7904->unk4 + unk7904->unk8)) {
                switch(unk7904->unk0) {
                    case 0:
                        player->unkC8 = player->unkE8;
                        player->unkB4 = 2;
                        m4aSongNumStart(SE_277);
                        return;
                    case 1:
                        player->unkC8 = player->unkC8 < 0x600 ? 
                            0x600 : 
                            player->unkC8;
            
                        player->unkB4 = 9;
                        player->unkB0 = 0;
                        player->unkB8 = player->unkEE;
                        player->unkBA = 0;
                        m4aSongNumStart(SE_276);
                        return;
                }
            }
        }
        unk7904++;
    }
}

void sub_806F56C(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    s32 c8 = player->unkC8;
    u16 b2 = player->unkB2;
    s32 unk100 = player->unk100;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if ((c8 + unk100) > 0) {
        player->unkC8 = (c8 + unk100);
        c8 = (c8 + unk100);
    } else {
        player->unkC8 = 0;
        c8 = 0;
    }
    {
        s32 temp1 = (sin1 * c8) >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->x -= temp1;
        player->y -= temp2;
    }
}

void sub_806F604(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    s32 c8 = player->unkC8;
    u16 b2 = player->unkB2;
    s32 unk104 = player->unk104;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if ((c8 + unk104) > 0) {
        player->unkC8 = c8 + unk104;
        c8 += unk104;
    } else {
        player->unkC8 = 0;
        c8 = 0;
    }

    {
        s32 temp1 = (sin1 * c8)  >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->x -= temp1;
        player->y -= temp2;
    }
}

// handle collision
s16 sub_806F69C(struct SpecialStage* stage) {
    u32 i;
    s32 sin14, sin16;
    struct UNK_0808B3FC_UNK240* element;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(stage->guardRoboTask);

    u32 temp1;
    u32 temp2;
    u16 temp3;
    s32 f_dX;
    s32 f_dY;
    s16 dX;
    s16 dY;

    u16 b2 = -player->unkB2 & 0x3FF;

    f_dX = guardRobo->x - player->x;
    f_dY = guardRobo->y - player->y;
    dX = f_dX >> 0x10;
    dY = f_dY  >> 0x10;

    if (dX > -16 && dX < 16 && dY > -16 && dY < 16) {
        temp1 = 0xC;
    } else {
        if (dX > -256 && dX < 256 && dY > -256 && dY < 256) {
            temp1 = 0x10;
        } else {
            temp1 = 0x14;
        }
    }
    

    if (dX > -48 && dX < 48 && dY > -48 && dY < 48) {
        temp2 = 0;
    } else {
        if (dX > -96 && dX < 96 && dY > -96 && dY < 96) {
            temp2 = 1;
        } else {
            temp2 = 2;
        }
    }

    player->unk68.unk20 = gUnknown_080DF794[temp2].unk0;
    player->unk68.unkA = gUnknown_080DF794[temp2].unk2;

    temp3 = temp1;
    f_dX = f_dX >> temp3;
    f_dY = f_dY >> temp3;

    sin16 = gSineTable[b2];
    sin14 = gSineTable[b2 + 0x100];

    {
        s32 sin5 = sin16 * f_dY;
        s32 sin6 = sin14 * f_dX;
        s32 sin3 = -sin16 * f_dX;
        s32 sin4 = sin14 * f_dY;
    
        f_dX = sin5 + sin6;
        f_dY = sin3 + sin4;
    }
    
    for (i = 256; i > 0; i >>= 1) {
        sin16 = gSineTable[b2] >> 6;
        sin14 = gSineTable[b2 + 0x100] >> 6;

        if ((sin16 * f_dY + sin14 * f_dX) > 0) {
            b2 = (b2 + i) & 0x3FF;
        } else {
            if ((sin16 * f_dY + sin14 * f_dX) >= 0) {
                s32 a = -sin16 * f_dX;
                s32 b = sin14 * f_dY;
                b = a + sin14 * f_dY;
                if (b >= 0) {
                    return (b2 + 0x200) & 0x3FF;
                }
                break;
            }
            b2 = (b2 - i) & 0x3FF;
        }
    }

    return b2;
}

s16 sub_806F84C(s32 a, s32 b) {
    u32 r2, r3;
    u16 r1, r3_2;
    s32 r4;

    s32 x = (a >> 8);
    s32 y = (b >> 8);
    s16 i = 0;

    x *= x;
    y *= y;
    r4 = (x + y);

    if (r4 == 0 || r4 == 1) {
        return r4;
    }

    while (r4 > 0) {
        r4 *= 2;
        i++;
    };

    r2 = (u16)(~Q_16_16_TO_INT((u32)r4));

#ifndef NON_MATCHING
    r2++; r2--;
#endif

    r3 = (r2 >> 1);
    r1 = r3;
    r3 = (r3 * r2) >> 0x12;
    r1 += r3;
    r3 = (r3 * r2) >> 0x11;
    r1 += r3;
    r3 = (r3 * r2) >> 0x10;
    r3_2 = (r3 * 0xA000) >> 0x10;

    r1 = r1 + r3_2;
    r3_2 = (r3_2 * r2) >> 0x10;
    r3_2 = (r3_2 * 0xB333) >> 0x10;
    r1 += r3_2;
    r3_2 = r1 ^ 0xFFFF;
    r3_2 = r3_2 + ((r4 - (r3_2 * r3_2)) >> 0x11);

    if (i & 1) {
        r3_2 = (((r3_2 >> (i >> 1)) * 0xB505) + 0x8000) >> 0x10;
    } else {
        r3_2 = r3_2 >> (i >> 1);
    }

    return r3_2;
}

struct Task* sub_806F910(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_806EC24, 8, 0x4000, 0, 0);
    struct UNK_806F910* unkF910 = TaskGetStructPtr(t);

    unkF910->stage = stage;
    unkF910->unk4 = 0;
    unkF910->unk6 = 0x3C;

    return t;
}

void sub_806F944(struct SpecialStage* stage) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(stage->guardRoboTask);

    s32 a8 = player->x;
    s32 ac = player->y;
    s32 unk40 = guardRobo->x;
    s32 unk44 = guardRobo->y;

    s16 result = sub_806F84C((a8 - unk40) >> 4, (ac - unk44) >> 4);
    player->unkD0 = ((a8 - unk40) * 0x20) / result;
    player->unkD4 = ((ac - unk44) * 0x20) / result;

    player->unkB8 = 0x300;
}

void sub_806F9CC(void) {
    sub_806EDB4(0);
    sub_806EF44();
    sub_806FA34();
    sub_806F468();
}

void sub_806F9E4(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    sub_806EDB4(1);
    sub_806EF44();
    sub_806FA34();
    if (!(gInput & DPAD_DOWN)) {
        player->unkB4 = 0;
    }
    sub_806F468();
}

void sub_806FA34(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    if (gPressedKeys & gUnknown_03005B38.unk0) {
        player->unkB4 = 4;
        player->unkB0 = 0;
        player->unkB8 = player->unkEC;
        player->unkBA = 0;
        m4aSongNumStart(SE_JUMP);
    }
}

void sub_806FAA0(void) {
    struct UNK_806F910* unkF910 = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(unkF910->stage->playerTask);

    if (player->x < Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->x > Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->y < Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y);
    }

    if (player->y > Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y);
    }
}

void sub_806FB00(void) {

}
