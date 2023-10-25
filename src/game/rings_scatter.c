#include "global.h"
#include "core.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/rings_scatter.h"
#include "game/stage/rings_manager.h" // for RESERVED_RING_TILES_VRAM

#include "constants/animations.h"
#include "constants/songs.h"

#define MAX_SCATTERING_RINGS_COUNT_SP 32
#define MAX_SCATTERING_RINGS_COUNT_MP 16

typedef struct {
    s32 x;
    s32 y;
    s16 unk8;
    s16 unkA;
    s16 unkC;
    s16 unkE;
    u16 unk10;
} ScatterRing; /* size: 0x14 */

typedef struct {
    /* 0x000 */ Sprite sprRing;
    /* 0x030 */ ScatterRing rings[MAX_SCATTERING_RINGS_COUNT_SP];
    /* 0x2B0 */ u32 unk2B0;
    /* 0x2B4 */ u16 unk2B4;
    /* 0x2B6 */ u16 unk2B6;
} RingsScatter; /* size: 0x2B8 */

void Task_RingsScatter_Singleplayer(void);
void Task_RingsScatter_MP_Singlepak(void);
void Task_RingsScatter_MP_Multipak(void);
void TaskDestructor_80213B4(struct Task *);

// Called on Stage Initialization
void InitPlayerHitRingsScatter(void)
{
#ifndef NON_MATCHING
    register TaskMain taskFn asm("r0");
#else
    TaskMain taskFn;
#endif
    RingsScatter *rs;
    Sprite *s;
    struct Task **tgtTask;
    struct Task *t;
    void *dmaDest;
    u32 size;

    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (IS_SINGLE_PLAYER) {
            tgtTask = &gRingsScatterTask;
            taskFn = Task_RingsScatter_Singleplayer;
        } else {
            tgtTask = &gRingsScatterTask;
            taskFn = Task_RingsScatter_MP_Multipak;
        }
    } else {
        tgtTask = &gRingsScatterTask;
        taskFn = Task_RingsScatter_MP_Singlepak;
    }

    size = sizeof(RingsScatter);

#ifndef NON_MATCHING
    asm("" :);
#endif

    t = TaskCreate(taskFn, size, 0x2001, 0, TaskDestructor_80213B4);

    *tgtTask = t;

    rs = TASK_DATA(t);

    s = &rs->sprRing;
    s->x = 0;
    s->y = 0;
    s->graphics.dest = RESERVED_RING_TILES_VRAM;
    s->unk1A = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_RING;
    s->variant = 0;
    s->animCursor = 0;
    s->timeUntilNextFrame = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(2.0);
    s->palId = 0;
    s->unk10
        = (SPRITE_FLAG(PRIORITY, 2) | SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_MOSAIC);
    rs->unk2B6 = 0;
    rs->unk2B4 = 0x94;
    rs->unk2B0 = 0x12;

    dmaDest = rs->rings;
    DmaFill16(3, 0, dmaDest, sizeof(rs->rings));
}

void sub_801FD34(s32 x, s32 y, s32 numRings)
{
    RingsScatter *rs = TASK_DATA(gRingsScatterTask);
    ScatterRing *rings = rs->rings; // r4
    Player *p = &gPlayer;
    s32 i;
    s32 r2, r3, r5, r6;
    s32 ip;

    if (numRings == 0) {
        return;
    }

    // Limit the displayed rings to 32
    if (numRings > MAX_SCATTERING_RINGS_COUNT_SP) {
        numRings = MAX_SCATTERING_RINGS_COUNT_SP;
    }

    // In Multiplayer, limit displayed rings to 16
    if (IS_MULTI_PLAYER && (numRings > MAX_SCATTERING_RINGS_COUNT_MP)) {
        numRings = MAX_SCATTERING_RINGS_COUNT_MP;
    }

    m4aSongNumStart(SE_RINGS_LOST);
    r3 = 0x498;

    // _0801FD72+8

    i = 0;
    ip = 0;
    for (; i < 32; i++) {
        ScatterRing *ring = &rings[i];

        if (ring->unkC == 0) {
            ring->unkC = 180;
            ring->unkE = p->unk38;
            ring->x = Q_24_8(x);
            ring->y = Q_24_8(y);

            if (r3 >= 0) {
                s32 r0;

                r2 = (r3 >> 8);

                if (r2 > 5) {
                    r0 = -r2;
                    r0 += 9;
                } else {
                    r0 = r2;
                }
                r2 = r0;

                r5 = SIN((r3 & 0xFF) * 4);
                r5 >>= r2;
                r6 = COS((r3 & 0xFF) * 4);
                r6 >>= r2;

                r5 -= (r5 >> 2);
                r6 -= (r6 >> 2);

                r3 += 0x10;
                r3 |= 0x80;
            }
            // _0801FE00

            r2 = 0;
            ring->unk8 = r5;
            ring->unkA = r6;

            if (GRAVITY_IS_INVERTED) {
                ring->unkA = -r6;
            }

            r3 = -r3;
            r5 = -r5;
            ring->unk10 = r2;

            if (!(PseudoRandom32() & 0x10000)) {
                ring->unk10 = 0x4;
            }

            ring->unk10 |= (ip & 0x3);
            ip++;

            if (ip >= numRings) {
                return;
            }
        }
    }
}