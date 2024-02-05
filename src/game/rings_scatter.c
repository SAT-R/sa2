#include "global.h"
#include "core.h"
#include "trig.h"
#include "lib/m4a.h"
#include "game/game.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"
#include "game/rings_scatter.h"
#include "sakit/collect_ring_effect.h"
#include "sakit/rings_manager.h" // for RESERVED_RING_TILES_VRAM

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

struct Task *gRingsScatterTask = NULL;

void Task_RingsScatter_Singleplayer(void);
void Task_RingsScatter_MP_Singlepak(void);
void Task_RingsScatter_MP_Multipak(void);
void TaskDestructor_RingsScatter(struct Task *);

const AnimId gPlayerCharacterIdleAnims[NUM_CHARACTERS] = {
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_SONIC),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_CREAM),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_TAILS),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_KNUCKLES),
    SA2_ANIM_CHAR(SA2_CHAR_ANIM_IDLE, CHARACTER_AMY),
};

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

#define USE_HITBOX_RECT 1
typedef struct {
    /* 0x00 */ s8 left;
    /* 0x01 */ s8 top;
    /* 0x02 */ s8 right;
    /* 0x03 */ s8 bottom;
} HitboxRect;

// TODO: Use improved version of these globally!
#define HB_LEFT(p, hb)   (Q_24_8_TO_INT((p)->x) + (hb)->left)
#define HB_WIDTH(hb)     ((hb)->right - (hb)->left)
#define HB_RIGHT(p, hb)  (Q_24_8_TO_INT((p)->x) + HB_WIDTH(hb))
#define HB_TOP(p, hb)    (Q_24_8_TO_INT((p)->y) + (hb)->top)
#define HB_HEIGHT(hb)    ((hb)->bottom - (hb)->top)
#define HB_BOTTOM(p, hb) (Q_24_8_TO_INT((p)->y) + HB_HEIGHT(hb))

// (90.40%) https://decomp.me/scratch/jdAe4
// (92.98%) https://decomp.me/scratch/TxbaC
NONMATCH(
    "asm/non_matching/game/rings_scatter/RingsScatterSingleplayer_FlippedGravity.inc",
    void RingsScatterSingleplayer_FlippedGravity(void))
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i = 0; // sp14
    s32 ringIntX;
    s32 ringIntY;
    s32 screenX; // sp18;
    s32 screenY; // sl
    Player *p;
#if USE_HITBOX_RECT
    HitboxRect *hb;
#else
    Hitbox *hb;
#endif

    UpdateSpriteAnimation(s);

    for (i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX;
        ring->y += ring->velY;

        ringIntX = Q_24_8_TO_INT(ring->x);
        ringIntY = Q_24_8_TO_INT(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (HitboxRect *)&p->unk90->s.hitboxes[0].left;
#else
        hb = &p->unk90->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C)
            && ((p->unk64 != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0))
            && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_LEFT(p, hb))
                 && (HB_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_LEFT(p, hb))
                    && (HB_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_TOP(p, hb)) || (ringIntY < HB_TOP(p, hb)))
                && ((ringIntY - 16) >= HB_TOP(p, hb)))
            && (HB_BOTTOM(p, hb) >= (ringIntY - 16))) {
            s32 oldRingCount;
            // _0801FF70

            CreateCollectRingEffect(ringIntX, ringIntY);

            INCREMENT_RINGS(1);
            // _0801FFC4

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255) {
                    gRingCount = 255;
                }
            }

            ring->unkC = 0;
        } else {
            // _08020008

            if ((ring->velY < 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100((ringIntY - 16), ringIntX, ring->unkE, -8,
                                      sub_801EC3C);
                if (res <= 0) {
                    ring->y -= Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100(ringIntY, ringIntX, ring->unkE, 8, sub_801EC3C);
                if (res <= 0) {
                    ring->y += Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8)
                && (screenY < (DISPLAY_HEIGHT + 8))) {
                if ((ring->unkC >= 32) || ((gStageTime & 0x2) == 0)) {
                    // _080200C0
                    if ((!sp10) || (s->oamBaseIndex == 0xFF)) {
                        // _080200D2
                        s->oamBaseIndex = 0xFF;
                        s->x = screenX;
                        s->y = screenY;
                        DisplaySprite(s);

                        sp10 = TRUE;
                    } else {
                        // _080200F8
                        OamData *oam = &gOamBuffer2[s->oamBaseIndex];

                        OamData *oamAlloced = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                        if (iwram_end != oamAlloced) {
                            // NOTE: This will not work out for widescreen resolutions
                            u32 dimOffX, dimOffY;
                            DmaCopy16(3, oam, oamAlloced, 6 /*sizeof(OamDataShort)*/);
                            oamAlloced->all.attr0 &= 0xFF00;

                            dimOffY = screenY - (u16)s->dimensions->offsetY;
                            oamAlloced->all.attr0 += dimOffY & 0xFF;

                            oamAlloced->all.attr1 &= 0xFE00;

                            dimOffX = screenX - (u16)s->dimensions->offsetX;
                            oamAlloced->all.attr1 += dimOffX & 0x1FF;
                        }
                    }
                }
            }
            // _08020166
            {
                u16 sprFlags = ring->unk10;
                ring->unk10 &= ~0x3;
                ring->unk10 |= (sprFlags + 1) & 0x3;
                ring->unkC--;
            }
        }
    }
}
END_NONMATCH

// (93.27%) https://decomp.me/scratch/VhHrU
NONMATCH(
    "asm/non_matching/game/rings_scatter/RingsScatterSingleplayer_NormalGravity.inc",
    void RingsScatterSingleplayer_NormalGravity(void))
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i = 0; // sp14
    s32 ringIntX;
    s32 ringIntY;
    s32 screenX; // sp18;
    s32 screenY; // sl
    Player *p;
#if USE_HITBOX_RECT
    HitboxRect *hb;
#else
    Hitbox *hb;
#endif

    UpdateSpriteAnimation(s);

    for (i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX + gUnknown_030054FC;
        ring->y += ring->velY + gUnknown_030054E0;

        ringIntX = Q_24_8_TO_INT(ring->x);
        ringIntY = Q_24_8_TO_INT(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (HitboxRect *)&p->unk90->s.hitboxes[0].left;
#else
        hb = &p->unk90->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C)
            && ((p->unk64 != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0))
            && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_LEFT(p, hb))
                 && (HB_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_LEFT(p, hb))
                    && (HB_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_TOP(p, hb)) || (ringIntY >= HB_TOP(p, hb)))
                && ((ringIntY - 16) >= HB_TOP(p, hb)))
            && (HB_BOTTOM(p, hb) >= (ringIntY - 16))) {
            s32 oldRingCount;

            CreateCollectRingEffect(ringIntX, ringIntY);

            INCREMENT_RINGS2(1);

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255) {
                    gRingCount = 255;
                }
            }

            ring->unkC = 0;
        } else {

            if ((ring->velY < 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100(ringIntY, ringIntX, ring->unkE, +8, sub_801EC3C);
                if (res <= 0) {
                    ring->y -= Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100((ringIntY - 16), ringIntX, ring->unkE, -8,
                                      sub_801EC3C);
                if (res <= 0) {
                    ring->y += Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8)
                && (screenY < (DISPLAY_HEIGHT + 8))) {
                if ((ring->unkC >= 32) || ((gStageTime & 0x2) == 0)) {
                    if ((!sp10) || (s->oamBaseIndex == 0xFF)) {
                        s->oamBaseIndex = 0xFF;
                        s->x = screenX;
                        s->y = screenY;
                        DisplaySprite(s);

                        sp10 = TRUE;
                    } else {
                        OamData *oam = &gOamBuffer2[s->oamBaseIndex];

                        OamData *oamAlloced = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                        if (iwram_end != oamAlloced) {
                            // NOTE: This will not work out for widescreen resolutions
                            u32 dimOffX, dimOffY;
                            DmaCopy16(3, oam, oamAlloced, 6 /*sizeof(OamDataShort)*/);
                            oamAlloced->all.attr0 &= 0xFF00;

                            dimOffY = screenY - (u16)s->dimensions->offsetY;
                            oamAlloced->all.attr0 += dimOffY & 0xFF;

                            oamAlloced->all.attr1 &= 0xFE00;

                            dimOffX = screenX - (u16)s->dimensions->offsetX;
                            oamAlloced->all.attr1 += dimOffX & 0x1FF;
                        }
                    }
                }
            }

            {
                u16 sprFlags = ring->unk10;
                ring->unk10 &= ~0x3;
                ring->unk10 |= (sprFlags + 1) & 0x3;
                ring->unkC--;
            }
        }
    }
}
END_NONMATCH

// NOTE: VERY WRONG!!!
//       A ton of code is missing here.
//       (Basically a copy-paste of RingsScatterSingleplayer_FlippedGravity)
// (66.09%) https://decomp.me/scratch/qHlN9
NONMATCH("asm/non_matching/game/rings_scatter/RingsScatterMultipak_FlippedGravity.inc",
         void RingsScatterMultipak_FlippedGravity(void))
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i = 0; // sp14
    s32 ringIntX;
    s32 ringIntY;
    s32 screenX; // sp18;
    s32 screenY; // sl
    Player *p;
#if USE_HITBOX_RECT
    HitboxRect *hb;
#else
    Hitbox *hb;
#endif

    UpdateSpriteAnimation(s);

    for (i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX;
        ring->y += ring->velY;

        ringIntX = Q_24_8_TO_INT(ring->x);
        ringIntY = Q_24_8_TO_INT(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (HitboxRect *)&p->unk90->s.hitboxes[0].left;
#else
        hb = &p->unk90->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C)
            && ((p->unk64 != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0))
            && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_LEFT(p, hb))
                 && (HB_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_LEFT(p, hb))
                    && (HB_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_TOP(p, hb)) || (ringIntY < HB_TOP(p, hb)))
                && ((ringIntY - 16) >= HB_TOP(p, hb)))
            && (HB_BOTTOM(p, hb) >= (ringIntY - 16))) {
            s32 oldRingCount;

            CreateCollectRingEffect(ringIntX, ringIntY);

            INCREMENT_RINGS(1);

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255) {
                    gRingCount = 255;
                }
            }

            ring->unkC = 0;
        } else {
            if ((ring->velY < 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100((ringIntY - 16), ringIntX, ring->unkE, -8,
                                      sub_801EC3C);
                if (res <= 0) {
                    ring->y -= Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100(ringIntY, ringIntX, ring->unkE, 8, sub_801EC3C);
                if (res <= 0) {
                    ring->y += Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8)
                && (screenY < (DISPLAY_HEIGHT + 8))) {
                if ((ring->unkC >= 32) || ((gStageTime & 0x2) == 0)) {
                    if ((!sp10) || (s->oamBaseIndex == 0xFF)) {
                        s->oamBaseIndex = 0xFF;
                        s->x = screenX;
                        s->y = screenY;
                        DisplaySprite(s);

                        sp10 = TRUE;
                    } else {
                        OamData *oam = &gOamBuffer2[s->oamBaseIndex];

                        OamData *oamAlloced = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                        if (iwram_end != oamAlloced) {
                            // NOTE: This will not work out for widescreen resolutions
                            u32 dimOffX, dimOffY;
                            DmaCopy16(3, oam, oamAlloced, 6 /*sizeof(OamDataShort)*/);
                            oamAlloced->all.attr0 &= 0xFF00;

                            dimOffY = screenY - (u16)s->dimensions->offsetY;
                            oamAlloced->all.attr0 += dimOffY & 0xFF;

                            oamAlloced->all.attr1 &= 0xFE00;

                            dimOffX = screenX - (u16)s->dimensions->offsetX;
                            oamAlloced->all.attr1 += dimOffX & 0x1FF;
                        }
                    }
                }
            }
            {
                u16 sprFlags = ring->unk10;
                ring->unk10 &= ~0x3;
                ring->unk10 |= (sprFlags + 1) & 0x3;
                ring->unkC--;
            }
        }
    }
}
END_NONMATCH

// NOTE: VERY WRONG!!!
//       A ton of code is missing here.
//       (Basically a copy-paste of RingsScatterSingleplayer_NormalGravity)
// (64.03%) https://decomp.me/scratch/KBtBo
NONMATCH("asm/non_matching/game/rings_scatter/RingsScatterMultipak_NormalGravity.inc",
         void RingsScatterMultipak_NormalGravity(void))
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i = 0; // sp14
    s32 ringIntX;
    s32 ringIntY;
    s32 screenX; // sp18;
    s32 screenY; // sl
    Player *p;
#if USE_HITBOX_RECT
    HitboxRect *hb;
#else
    Hitbox *hb;
#endif

    UpdateSpriteAnimation(s);

    for (i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX + gUnknown_030054FC;
        ring->y += ring->velY + gUnknown_030054E0;

        ringIntX = Q_24_8_TO_INT(ring->x);
        ringIntY = Q_24_8_TO_INT(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (HitboxRect *)&p->unk90->s.hitboxes[0].left;
#else
        hb = &p->unk90->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C)
            && ((p->unk64 != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0))
            && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_LEFT(p, hb))
                 && (HB_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_LEFT(p, hb))
                    && (HB_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_TOP(p, hb)) || (ringIntY >= HB_TOP(p, hb)))
                && ((ringIntY - 16) >= HB_TOP(p, hb)))
            && (HB_BOTTOM(p, hb) >= (ringIntY - 16))) {
            s32 oldRingCount;

            CreateCollectRingEffect(ringIntX, ringIntY);

            INCREMENT_RINGS2(1);

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255) {
                    gRingCount = 255;
                }
            }

            ring->unkC = 0;
        } else {

            if ((ring->velY < 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100(ringIntY, ringIntX, ring->unkE, +8, sub_801EC3C);
                if (res <= 0) {
                    ring->y -= Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100((ringIntY - 16), ringIntX, ring->unkE, -8,
                                      sub_801EC3C);
                if (res <= 0) {
                    ring->y += Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8)
                && (screenY < (DISPLAY_HEIGHT + 8))) {
                if ((ring->unkC >= 32) || ((gStageTime & 0x2) == 0)) {
                    if ((!sp10) || (s->oamBaseIndex == 0xFF)) {
                        s->oamBaseIndex = 0xFF;
                        s->x = screenX;
                        s->y = screenY;
                        DisplaySprite(s);

                        sp10 = TRUE;
                    } else {
                        OamData *oam = &gOamBuffer2[s->oamBaseIndex];

                        OamData *oamAlloced = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                        if (iwram_end != oamAlloced) {
                            // NOTE: This will not work out for widescreen resolutions
                            u32 dimOffX, dimOffY;
                            DmaCopy16(3, oam, oamAlloced, 6 /*sizeof(OamDataShort)*/);
                            oamAlloced->all.attr0 &= 0xFF00;

                            dimOffY = screenY - (u16)s->dimensions->offsetY;
                            oamAlloced->all.attr0 += dimOffY & 0xFF;

                            oamAlloced->all.attr1 &= 0xFE00;

                            dimOffX = screenX - (u16)s->dimensions->offsetX;
                            oamAlloced->all.attr1 += dimOffX & 0x1FF;
                        }
                    }
                }
            }

            {
                u16 sprFlags = ring->unk10;
                ring->unk10 &= ~0x3;
                ring->unk10 |= (sprFlags + 1) & 0x3;
                ring->unkC--;
            }
        }
    }
}

END_NONMATCH

// NOTE: VERY WRONG!!!
//       A ton of code is missing here.
//       (Basically a copy-paste of RingsScatterSingleplayer_NormalGravity)
// (54.61%) https://decomp.me/scratch/v9rXO
NONMATCH("asm/non_matching/game/rings_scatter/RingsScatterSinglepakMain.inc",
         void RingsScatterSinglepakMain(void))
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i = 0; // sp14
    s32 ringIntX;
    s32 ringIntY;
    s32 screenX; // sp18;
    s32 screenY; // sl
    Player *p;
#if USE_HITBOX_RECT
    HitboxRect *hb;
#else
    Hitbox *hb;
#endif

    UpdateSpriteAnimation(s);

    for (i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX + gUnknown_030054FC;
        ring->y += ring->velY + gUnknown_030054E0;

        ringIntX = Q_24_8_TO_INT(ring->x);
        ringIntY = Q_24_8_TO_INT(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (HitboxRect *)&p->unk90->s.hitboxes[0].left;
#else
        hb = &p->unk90->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C)
            && ((p->unk64 != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0))
            && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_LEFT(p, hb))
                 && (HB_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_LEFT(p, hb))
                    && (HB_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_TOP(p, hb)) || (ringIntY >= HB_TOP(p, hb)))
                && ((ringIntY - 16) >= HB_TOP(p, hb)))
            && (HB_BOTTOM(p, hb) >= (ringIntY - 16))) {
            s32 oldRingCount;

            CreateCollectRingEffect(ringIntX, ringIntY);

            INCREMENT_RINGS2(1);

            if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                if (gRingCount > 255) {
                    gRingCount = 255;
                }
            }

            ring->unkC = 0;
        } else {

            if ((ring->velY < 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100(ringIntY, ringIntX, ring->unkE, +8, sub_801EC3C);
                if (res <= 0) {
                    ring->y -= Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = sub_801F100((ringIntY - 16), ringIntX, ring->unkE, -8,
                                      sub_801EC3C);
                if (res <= 0) {
                    ring->y += Q_24_8(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8)
                && (screenY < (DISPLAY_HEIGHT + 8))) {
                if ((ring->unkC >= 32) || ((gStageTime & 0x2) == 0)) {
                    if ((!sp10) || (s->oamBaseIndex == 0xFF)) {
                        s->oamBaseIndex = 0xFF;
                        s->x = screenX;
                        s->y = screenY;
                        DisplaySprite(s);

                        sp10 = TRUE;
                    } else {
                        OamData *oam = &gOamBuffer2[s->oamBaseIndex];

                        OamData *oamAlloced = OamMalloc(GET_SPRITE_OAM_ORDER(s));

                        if (iwram_end != oamAlloced) {
                            // NOTE: This will not work out for widescreen resolutions
                            u32 dimOffX, dimOffY;
                            DmaCopy16(3, oam, oamAlloced, 6 /*sizeof(OamDataShort)*/);
                            oamAlloced->all.attr0 &= 0xFF00;

                            dimOffY = screenY - (u16)s->dimensions->offsetY;
                            oamAlloced->all.attr0 += dimOffY & 0xFF;

                            oamAlloced->all.attr1 &= 0xFE00;

                            dimOffX = screenX - (u16)s->dimensions->offsetX;
                            oamAlloced->all.attr1 += dimOffX & 0x1FF;
                        }
                    }
                }
            }

            {
                u16 sprFlags = ring->unk10;
                ring->unk10 &= ~0x3;
                ring->unk10 |= (sprFlags + 1) & 0x3;
                ring->unkC--;
            }
        }
    }
}
END_NONMATCH

void DestroyRingsScatterTask(void)
{
    TaskDestroy(gRingsScatterTask);
    gRingsScatterTask = NULL;
}

void Task_RingsScatter_Singleplayer(void)
{
    if (GRAVITY_IS_INVERTED) {
        RingsScatterSingleplayer_FlippedGravity();
    } else {
        RingsScatterSingleplayer_NormalGravity();
    }
}

void Task_RingsScatter_MP_Multipak(void)
{
    if (GRAVITY_IS_INVERTED) {
        RingsScatterMultipak_FlippedGravity();
    } else {
        RingsScatterMultipak_NormalGravity();
    }
}

void Task_RingsScatter_MP_Singlepak(void) { RingsScatterSinglepakMain(); }

void TaskDestructor_RingsScatter(struct Task UNUSED *t) { gRingsScatterTask = NULL; }