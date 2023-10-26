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
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 velX;
    /* 0x0A */ s16 velY;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ s16 unkE;
    /* 0x10 */ u16 unk10;
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
void TaskDestructor_RingsScatter(struct Task *);

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

    t = TaskCreate(taskFn, size, 0x2001, 0, TaskDestructor_RingsScatter);

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

void InitScatteringRings(s32 x, s32 y, s32 numRings)
{
    RingsScatter *rs = TASK_DATA(gRingsScatterTask);
    ScatterRing *ring = &rs->rings[0];
    Player *p = &gPlayer;
    s32 i;
    s32 ip;
    s32 r2, r3;
    s32 velX = 0, velY = 0;

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

    r3 = Q_24_8(4.53125); // 0x488

    for (i = 0, ip = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {

        if (ring->unkC == 0) {
            ring->unkC = 180;
            ring->unkE = p->unk38;
            ring->x = Q_24_8(x);
            ring->y = Q_24_8(y);

            if (r3 >= 0) {
                s32 r0;

                r2 = Q_24_8_TO_INT(r3);

                if (r2 > 5) {
                    r0 = -r2;
                    r0 += 9;
                } else {
                    r0 = r2;
                }
                r2 = r0;

                velX = SIN((r3 & 0xFF) * 4);
                velX >>= r2;
                velY = COS((r3 & 0xFF) * 4);
                velY >>= r2;

                velX -= (velX >> 2);
                velY -= (velY >> 2);

                r3 += 0x10;
                r3 |= 0x80;
            }

            r2 = 0;
            ring->velX = velX;
            ring->velY = velY;

            if (GRAVITY_IS_INVERTED) {
                ring->velY = -velY;
            }

            r3 = -r3;
            velX = -velX;
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

// TODO: Use improved version of these globally!
#define HB_LEFT(p, hb) ((p)->x + (hb)->left)
#define HB_WIDTH(hb) ((hb)->right - (hb)->left)
#define HB_RIGHT(p, hb) ((p)->x + HB_WIDTH(hb))

#if 01
void RingsScatterSingleplayer_FlippedGravity(void)
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    s32 sp10 = 0;
    s32 i = 0; // sp14
    s32 ringIntX;
    s32 ringIntY;
    s32 screenX; // sp18;
    s32 screenY; // sl
    UNK_3005A70 *unk90; // r2
    Player *p;

    UpdateSpriteAnimation(s);

    for(i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if(ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX;
        ring->y += ring->velY;

        ringIntX = Q_24_8_TO_INT(ring->x);
        screenX = ringIntX - gCamera.x;
        ringIntY = Q_24_8_TO_INT(ring->y);
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;
        unk90 = p->unk90;
        
        if((ring->unkC <= sp0C)
        && ((p->unk64 != SA2_CHAR_ANIM_20) || (p->unk2C == 0))
        && ( IS_ALIVE(p) )
        && ((( (ringIntX - TILE_WIDTH) > HB_LEFT(p, &unk90->s.hitboxes[0]))
            && (HB_RIGHT(p, &unk90->s.hitboxes[0]) >= (ringIntX - TILE_WIDTH)))
        || ((ringIntX + TILE_WIDTH) >= HB_LEFT(p, &unk90->s.hitboxes[0]))
        || (( (ringIntX - TILE_WIDTH) >= HB_LEFT(p, &unk90->s.hitboxes[0]))
            && (HB_RIGHT(p, &unk90->s.hitboxes[0]) >= (ringIntX - TILE_WIDTH))))) {
            // _0801FF4A

            // NOTE: _0801FF4A is actually the vertical collision check, part of the "big if"
        } else {
            // _08020008
        }
    }
}
#endif
