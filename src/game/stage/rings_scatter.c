#include "global.h"
#include "core.h"
#include "trig.h"
#include "lib/m4a/m4a.h"
#include "rect.h"

#include "game/sa1_sa2_shared/globals.h"

#include "game/stage/terrain_collision.h"
#include "game/stage/player.h"
#include "game/stage/camera.h"

#include "game/stage/rings_scatter.h"
#include "game/sa1_sa2_shared/collect_ring_effect.h"
#include "game/sa1_sa2_shared/rings_manager.h"

#include "constants/animations.h"
#include "constants/songs.h"

#if (GAME == GAME_SA1)
#define MAX_SCATTERING_RINGS_COUNT_SP 48
#define MAX_SCATTERING_RINGS_COUNT_MP 32
#elif (GAME == GAME_SA2)
#define MAX_SCATTERING_RINGS_COUNT_SP 32
#define MAX_SCATTERING_RINGS_COUNT_MP 16
#endif

#if (GAME == GAME_SA1)
#define UNK10_CONDITION 1
#elif (GAME == GAME_SA2)
#define UNK10_CONDITION !(ring->unk10 & 0x7)
#endif

#define USE_HITBOX_RECT 1

// TODO: Use improved version of these globaly!
#define HB_ALT_LEFT(p, hb)   (I((p)->qWorldX) + (hb)->left)
#define HB_ALT_WIDTH(hb)     ((hb)->right - (hb)->left)
#define HB_ALT_RIGHT(p, hb)  (I((p)->qWorldX) + HB_ALT_WIDTH(hb))
#define HB_ALT_TOP(p, hb)    (I((p)->qWorldY) + (hb)->top)
#define HB_ALT_HEIGHT(hb)    ((hb)->bottom - (hb)->top)
#define HB_ALT_BOTTOM(p, hb) (I((p)->qWorldY) + HB_ALT_HEIGHT(hb))

typedef struct {
    /* 0x00 */ s32 x;
    /* 0x04 */ s32 y;
    /* 0x08 */ s16 velX;
    /* 0x0A */ s16 velY;
    /* 0x0C */ u16 unkC;
    /* 0x0E */ s16 unkE;
#if (GAME == GAME_SA2)
    /* 0x10 */ u16 unk10;
#endif
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

#if (GAME == GAME_SA1)
    if (IS_MULTI_PLAYER) {
        tgtTask = &gRingsScatterTask;
        taskFn = Task_RingsScatter_MP_Multipak;
    } else {
        tgtTask = &gRingsScatterTask;
        taskFn = Task_RingsScatter_Singleplayer;
    }
#elif (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
    if (gGameMode != GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
        if (IS_SINGLE_PLAYER) {
            tgtTask = &gRingsScatterTask;
            taskFn = Task_RingsScatter_Singleplayer;
        } else {
            tgtTask = &gRingsScatterTask;
            taskFn = Task_RingsScatter_MP_Multipak;
        }
    } else
#endif
    {
        tgtTask = &gRingsScatterTask;
        taskFn = Task_RingsScatter_MP_Singlepak;
    }
#endif

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
    s->oamFlags = SPRITE_OAM_ORDER(20);
    s->graphics.size = 0;
#if (GAME == GAME_SA1)
    s->graphics.anim = SA1_ANIM_RING;
#elif (GAME == GAME_SA2)
    s->graphics.anim = SA2_ANIM_RING;
#endif
    s->variant = 0;
    s->animCursor = 0;
    s->qAnimDelay = 0;
    s->prevVariant = -1;
    s->animSpeed = SPRITE_ANIM_SPEED(2.0);
    s->palId = 0;
    s->frameFlags = SPRITE_FLAG(PRIORITY, 2)
#if (GAME == GAME_SA2)
        | SPRITE_FLAG_MASK_18 | SPRITE_FLAG_MASK_MOSAIC
#endif
        ;
    rs->unk2B6 = 0;

#if (GAME == GAME_SA1)
    if (!IS_EXTRA_STAGE(gCurrentLevel)) {
        rs->unk2B4 = 0xE0;
        rs->unk2B0 = 0x12;
    } else {
        rs->unk2B4 = 0xE0;
        rs->unk2B0 = 7;
    }
#else
    rs->unk2B4 = 0x94;
    rs->unk2B0 = 0x12;
#endif

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

    r3 = Q(4.53125); // 0x488

    for (i = 0, ip = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {

        if (ring->unkC == 0) {
#if (GAME == GAME_SA1)
            ring->unkC = 256;
#elif (GAME == GAME_SA2)
            ring->unkC = 180;
#endif
            ring->unkE = p->layer;
            ring->x = Q(x);
            ring->y = Q(y);

            if (r3 >= 0) {
                s32 r0;

                r2 = I(r3);

                if (r2 > 5) {
                    r0 = -r2;
                    r0 += 9;
                } else {
                    r0 = r2;
                }
                r2 = r0;

#if (GAME == GAME_SA1)
                {
                    s32 index = (r3 & 0xFF) * 4;
                    velX = SIN(index);
                    velX >>= r2;
                    velY = COS(index);
                    velY >>= r2;
                }
#elif (GAME == GAME_SA2)
                velX = SIN((r3 & 0xFF) * 4);
                velX >>= r2;
                velY = COS((r3 & 0xFF) * 4);
                velY >>= r2;
#endif

                velX -= (velX >> 2);
                velY -= (velY >> 2);

                r3 += 0x10;
                r3 |= 0x80;
            }
#ifndef COLLECT_RINGS_ROM
            r2 = 0;
#endif
            ring->velX = velX;
            ring->velY = velY;
#ifndef COLLECT_RINGS_ROM
            if (GRAVITY_IS_INVERTED) {
                ring->velY = -velY;
            }
#endif

            r3 = -r3;
            velX = -velX;

#if (GAME == GAME_SA2)
#ifndef COLLECT_RINGS_ROM
            ring->unk10 = r2;
#else
            ring->unk10 = 0;
#endif

            if (!(PseudoRandom32() & 0x10000)) {
                ring->unk10 = 0x4;
            }

            ring->unk10 |= (ip & 0x3);

#endif
            ip++;

            if (ip >= numRings) {
                return;
            }
        }
    }
}
#ifndef COLLECT_RINGS_ROM

#if (GAME == GAME_SA1)
// TODO: Either not in SA2, or in a different place!
//       Most of the structure is the same as InitScatteringRings,
//       but it uses random values in more places.

void sub_8040C1C(s32 x, s32 y, s32 numRings)
{
    RingsScatter *rs = TASK_DATA(gRingsScatterTask);
    ScatterRing *ring = &rs->rings[0];
    Player *p = &gPlayer;
    s32 i;
    s32 ip;
    s32 r2, r3, r7;
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

    r7 = (((u32)PseudoRandom32() & 0xFF000) >> 12) | 0x10;

    for (i = 0, ip = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            ring->unkC = 256;

            ring->unkE = p->layer;
            ring->x = Q(x);
            ring->y = Q(y);

            r3 = (((u32)PseudoRandom32() & 0x1000) >> 12) + 5;
            {
                s32 r0;

                {
                    s32 index = (r7 & 0xFF) * 4;
                    velX = SIN(index);
                    velX >>= r3;
                    velY = COS(index);
                    velY >>= r3;
                }

                velX -= (velX >> 2);
                velY -= (velY >> 2);
            }

            if (GRAVITY_IS_INVERTED) {
                velY = -velY;
            }
            ring->velX = +velX;
            ring->velY = velY;

            {
                u32 rand = PseudoRandom32();
                r7 += ((rand & 0x3F000) >> 12) + 16;
            }
            velX = -velX;

            ip++;

            if (ip >= numRings) {
                return;
            }
        }
    }
}

#endif

void RingsScatterSingleplayer_FlippedGravity(void)
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i;
    s32 ringIntX, ringIntY;
    s32 screenX, screenY;
    Player *p;
    Hitbox *hb;

    UpdateSpriteAnimation(s);

    for (i = 0; i < (signed)ARRAY_COUNT(rs->rings); ring++, i++) {
        if (ring->unkC == 0) {
            continue;
        }

        ring->x += ring->velX;
        ring->y += ring->velY;

        ringIntX = I(ring->x);
        ringIntY = I(ring->y);
        {
            Camera *cam = &gCamera;

            screenX = ringIntX - cam->x;
#if (GAME == GAME_SA2) && !(defined(NON_MATCHING))
            screenY = ({
                s32 r0 = cam->y;
                register s32 r2 asm("r2") = ringIntY;
                asm("" ::"r"(r2));
                r2 -= r0;
                asm("" ::"r"(r2));
                r2;
            });
#else
            screenY = ringIntY - cam->y;
#endif
        }

        p = &gPlayer;
        hb = &p->spriteInfoBody->s.hitboxes[0];

        if (ring->unkC <= sp0C && (p->charState != SA2_CHAR_ANIM_20 || p->timerInvulnerability == 0) && IS_ALIVE(p)) {
            Rect8 *rect = (Rect8 *)&hb->left;

            if (RECT_TOUCHING_RING(I(p->qWorldX), I(p->qWorldY), ringIntX, ringIntY, rect)) {
                CreateCollectRingEffect(ringIntX, ringIntY);

                INCREMENT_RINGS(1);
                // _0801FFC4

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (gRingCount > 255) {
                        gRingCount = 255;
                    }
                }

                ring->unkC = 0;
                continue;
            }
        }

        if (ring->velY < 0 && UNK10_CONDITION) {
            s32 res = SA2_LABEL(sub_801F100)(ringIntY - (TILE_WIDTH * 2), ringIntX, ring->unkE, -8, SA2_LABEL(sub_801EC3C));
            if (res <= 0) {
                ring->y -= Q_24_8(res);
                ring->velY = (ring->velY >> 2) - ring->velY;
            }
        }

        if (rs->unk2B6 & 0x1 && ring->velY > 0 && UNK10_CONDITION) {
            s32 res = SA2_LABEL(sub_801F100)(ringIntY, ringIntX, ring->unkE, 8, SA2_LABEL(sub_801EC3C));
            if (res <= 0) {
                ring->y += Q_24_8(res);
                ring->velY = (ring->velY >> 2) - ring->velY;
            }
        }

        ring->velY -= sp08;

        if ((screenX + TILE_WIDTH) > 0 && screenX + TILE_WIDTH < (DISPLAY_WIDTH + (TILE_WIDTH * 2)) && screenY > -TILE_WIDTH
            && screenY < (DISPLAY_HEIGHT + TILE_WIDTH)) {
            if (ring->unkC >= 32 || (gStageTime & 0x2) == 0) {
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
                        DmaCopy16(3, oam, oamAlloced, sizeof(OamDataShort));
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
#if (GAME == GAME_SA2)
            u16 sprFlags = ring->unk10;
            ring->unk10 &= ~0x3;
            ring->unk10 |= (sprFlags + 1) & 0x3;
#endif
            ring->unkC--;
        }
    }
}

void RingsScatterSingleplayer_NormalGravity(void)
{
    RingsScatter *rs = TASK_DATA(gCurTask);
    ScatterRing *ring = &rs->rings[0];
    Sprite *s = &rs->sprRing;
    s32 sp08 = rs->unk2B0;
    s32 sp0C = rs->unk2B4;
    bool32 sp10 = FALSE;
    s32 i; // sp14
    s32 ringIntX, ringIntY;
    s32 screenX, screenY;
    s32 bossWorldX; // Used in SA1 in the Extra Boss stage (apparently; non-matching right now)

    Player *p;
    Hitbox *hb;

    UpdateSpriteAnimation(s);

    for (i = ARRAY_COUNT(rs->rings) - 1; i >= 0; ring++, i--) {
        if (ring->unkC == 0) {
            continue;
        }

#if (GAME == GAME_SA1)
        ring->x += ring->velX;
        ring->y += ring->velY;
#elif (GAME == GAME_SA2)
        ring->x += ring->velX + gUnknown_030054FC;
        ring->y += ring->velY + gUnknown_030054E0;
#endif

        ringIntX = I(ring->x);
        bossWorldX = ringIntX;
        ringIntY = I(ring->y);

        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;
        hb = &p->spriteInfoBody->s.hitboxes[0];

        if ((ring->unkC <= sp0C) && ((p->charState != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0)) && IS_ALIVE(p)) {
#if (GAME == GAME_SA1)
            Rect8 *rect = &hb->b;
#else
            Rect8 *rect = (Rect8 *)&hb->left;
#endif
            if (RECT_TOUCHING_RING(I(p->qWorldX), I(p->qWorldY), ringIntX, ringIntY, rect)) {
                CreateCollectRingEffect(bossWorldX, ringIntY);

                INCREMENT_RINGS(1);

                if (gGameMode == GAME_MODE_MULTI_PLAYER_COLLECT_RINGS) {
                    if (gRingCount > 255) {
                        gRingCount = 255;
                    }
                }

                ring->unkC = 0;

                continue;
            }
        }

        if (ring->velY > 0 && UNK10_CONDITION) {
            s32 res = SA2_LABEL(sub_801F100)(ringIntY, ringIntX, ring->unkE, +8, SA2_LABEL(sub_801EC3C));

            if (res <= 0) {
                ring->y += Q_24_8(res);
                ring->velY = (ring->velY >> 2) - ring->velY;
            }
        }

        if (rs->unk2B6 & 0x1 && ring->velY < 0 && UNK10_CONDITION) {
            s32 res = SA2_LABEL(sub_801F100)((ringIntY - 16), ringIntX, ring->unkE, -8, SA2_LABEL(sub_801EC3C));

            if (res <= 0) {
                ring->y -= Q_24_8(res);
                ring->velY = (ring->velY >> 2) - ring->velY;
            }
        }

        ring->velY += sp08;

        if ((screenX + TILE_WIDTH) > 0 && screenX + TILE_WIDTH < (DISPLAY_WIDTH + (TILE_WIDTH * 2)) && (screenY > -TILE_WIDTH)
            && (screenY < (DISPLAY_HEIGHT + TILE_WIDTH))) {
            if (ring->unkC >= 32 || ((gStageTime & 0x2) == 0)) {
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
                        DmaCopy16(3, oam, oamAlloced, sizeof(OamDataShort));
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
#if (GAME == GAME_SA2)
            u16 sprFlags = ring->unk10;
            ring->unk10 &= ~0x3;
            ring->unk10 |= (sprFlags + 1) & 0x3;
#endif
            ring->unkC--;
        }
    }
}

// NOTE: VERY WRONG!!!
//       A ton of code is missing here.
//       (Basically a copy-paste of RingsScatterSingleplayer_FlippedGravity)
// (66.09%) https://decomp.me/scratch/qHlN9
NONMATCH("asm/non_matching/game/stage/rings_scatter/RingsScatterMultipak_FlippedGravity.inc",
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
    Rect8 *hb;
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

        ringIntX = I(ring->x);
        ringIntY = I(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (Rect8 *)&p->spriteInfoBody->s.hitboxes[0].left;
#else
        hb = &p->spriteInfoBody->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C) && ((p->charState != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0)) && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_ALT_LEFT(p, hb)) && (HB_ALT_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_ALT_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_ALT_LEFT(p, hb)) && (HB_ALT_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_ALT_TOP(p, hb)) || (ringIntY < HB_ALT_TOP(p, hb))) && ((ringIntY - 16) >= HB_ALT_TOP(p, hb)))
            && (HB_ALT_BOTTOM(p, hb) >= (ringIntY - 16))) {
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
                s32 res = SA2_LABEL(sub_801F100)((ringIntY - 16), ringIntX, ring->unkE, -8, SA2_LABEL(sub_801EC3C));
                if (res <= 0) {
                    ring->y -= Q(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = SA2_LABEL(sub_801F100)(ringIntY, ringIntX, ring->unkE, 8, SA2_LABEL(sub_801EC3C));
                if (res <= 0) {
                    ring->y += Q(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8) && (screenY < (DISPLAY_HEIGHT + 8))) {
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
                            DmaCopy16(3, oam, oamAlloced, sizeof(OamDataShort));
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
NONMATCH("asm/non_matching/game/stage/rings_scatter/RingsScatterMultipak_NormalGravity.inc", void RingsScatterMultipak_NormalGravity(void))
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
    Rect8 *hb;
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

        ringIntX = I(ring->x);
        ringIntY = I(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (Rect8 *)&p->spriteInfoBody->s.hitboxes[0].left;
#else
        hb = &p->spriteInfoBody->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C) && ((p->charState != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0)) && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_ALT_LEFT(p, hb)) && (HB_ALT_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_ALT_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_ALT_LEFT(p, hb)) && (HB_ALT_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_ALT_TOP(p, hb)) || (ringIntY >= HB_ALT_TOP(p, hb))) && ((ringIntY - 16) >= HB_ALT_TOP(p, hb)))
            && (HB_ALT_BOTTOM(p, hb) >= (ringIntY - 16))) {
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
                s32 res = SA2_LABEL(sub_801F100)(ringIntY, ringIntX, ring->unkE, +8, SA2_LABEL(sub_801EC3C));
                if (res <= 0) {
                    ring->y -= Q(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = SA2_LABEL(sub_801F100)((ringIntY - 16), ringIntX, ring->unkE, -8, SA2_LABEL(sub_801EC3C));
                if (res <= 0) {
                    ring->y += Q(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8) && (screenY < (DISPLAY_HEIGHT + 8))) {
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
                            DmaCopy16(3, oam, oamAlloced, sizeof(OamDataShort));
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
#endif

// NOTE: VERY WRONG!!!
//       A ton of code is missing here.
//       (Basically a copy-paste of RingsScatterSingleplayer_NormalGravity)
// (54.61%) https://decomp.me/scratch/v9rXO
#ifndef COLLECT_RINGS_ROM
NONMATCH("asm/non_matching/game/stage/rings_scatter/RingsScatterSinglepakMain.inc", void RingsScatterSinglepakMain(void))
#else
NONMATCH("asm/non_matching/game/stage/rings_scatter/RingsScatterSinglepakMain_CollectRings.inc", void RingsScatterSinglepakMain(void))
#endif
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
    Rect8 *hb;
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

        ringIntX = I(ring->x);
        ringIntY = I(ring->y);
        screenX = ringIntX - gCamera.x;
        screenY = ringIntY - gCamera.y;

        p = &gPlayer;

#if USE_HITBOX_RECT
        hb = (Rect8 *)&p->spriteInfoBody->s.hitboxes[0].left;
#else
        hb = &p->spriteInfoBody->s.hitboxes[0];
#endif
        if ((ring->unkC <= sp0C) && ((p->charState != SA2_CHAR_ANIM_20) || (p->timerInvulnerability == 0)) && (IS_ALIVE(p))
            && ((((ringIntX - TILE_WIDTH) > HB_ALT_LEFT(p, hb)) && (HB_ALT_RIGHT(p, hb) > (ringIntX - TILE_WIDTH)))
                || ((ringIntX + TILE_WIDTH) >= HB_ALT_LEFT(p, hb))
                || (((ringIntX - TILE_WIDTH) >= HB_ALT_LEFT(p, hb)) && (HB_ALT_RIGHT(p, hb) >= (ringIntX - TILE_WIDTH))))
            && ((((ringIntY - 16) > HB_ALT_TOP(p, hb)) || (ringIntY >= HB_ALT_TOP(p, hb))) && ((ringIntY - 16) >= HB_ALT_TOP(p, hb)))
            && (HB_ALT_BOTTOM(p, hb) >= (ringIntY - 16))) {
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
                s32 res = SA2_LABEL(sub_801F100)(ringIntY, ringIntX, ring->unkE, +8, SA2_LABEL(sub_801EC3C));
                if (res <= 0) {
                    ring->y -= Q(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            if ((rs->unk2B6 & 0x1) && (ring->velY > 0) && ((ring->unk10 & 0x7) == 0)) {
                s32 res = SA2_LABEL(sub_801F100)((ringIntY - 16), ringIntX, ring->unkE, -8, SA2_LABEL(sub_801EC3C));
                if (res <= 0) {
                    ring->y += Q(res);
                    ring->velY = (ring->velY >> 2) - ring->velY;
                }
            }

            ring->velY -= sp08;

            if ((((unsigned)screenX + TILE_WIDTH - 1) < 255) && (screenY > -8) && (screenY < (DISPLAY_HEIGHT + 8))) {
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
                            DmaCopy16(3, oam, oamAlloced, sizeof(OamDataShort));
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

#ifndef COLLECT_RINGS_ROM
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
#endif

void Task_RingsScatter_MP_Singlepak(void) { RingsScatterSinglepakMain(); }

void TaskDestructor_RingsScatter(struct Task UNUSED *t) { gRingsScatterTask = NULL; }
