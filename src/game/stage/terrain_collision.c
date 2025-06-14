#include "global.h"
#include "tilemap.h"
#include "game/stage/terrain_collision.h"
#include "game/stage/camera.h"
#include "game/stage/player.h"

#include "constants/zones.h"

static ALIGNED(8) u32 gUnknown_3000410[3];
static ALIGNED(8) u32 gUnknown_3000420[3];

s32 SA2_LABEL(sub_801EF94)(s32 p0, s32 p1, s32 layer);

#define POS__NOT_MOD(i)                                                                                                                    \
    if (p3 > 0) {                                                                                                                          \
        return ~(p0 % 8u) + ((i)*TILE_WIDTH);                                                                                              \
    } else {                                                                                                                               \
        return (p0 % 8u) + ((i - 1) * TILE_WIDTH);                                                                                         \
    }

#define NEG__NOT_MOD(i) POS__NOT_MOD(-i)

#define NEG__INV_NOT_MOD(i)                                                                                                                \
    if (p3 > 0) {                                                                                                                          \
        return ~(p0 % 8u) - ((i)*TILE_WIDTH);                                                                                              \
    } else {                                                                                                                               \
        return (p0 % 8u) - ((i + 1) * TILE_WIDTH);                                                                                         \
    }

#define POS__RES_IF(i)                                                                                                                     \
    if (res > 0) {                                                                                                                         \
        res--;                                                                                                                             \
        res -= (p0 % 8u);                                                                                                                  \
        return res + ((i)*TILE_WIDTH);                                                                                                     \
    } else {                                                                                                                               \
        return res + (p0 % 8u) + ((i)*TILE_WIDTH);                                                                                         \
    }

#define NEG__RES_IF(i) POS__RES_IF(-i)

#define POS__P3_IF(i)                                                                                                                      \
    if (p3 > 0) {                                                                                                                          \
        s32 v = (p0 % 8u);                                                                                                                 \
        res = (((i) + 1) * TILE_WIDTH);                                                                                                    \
        return res - v;                                                                                                                    \
    } else {                                                                                                                               \
        return (p0 % 8u) + ((i)*TILE_WIDTH + 1);                                                                                           \
    }

#define NEG__P3_IF(i)                                                                                                                      \
    if (p3 > 0) {                                                                                                                          \
        s32 v = (p0 % 8u);                                                                                                                 \
        res = -(((i)-1) * TILE_WIDTH + 1);                                                                                                 \
        return res - v;                                                                                                                    \
    } else {                                                                                                                               \
        return (p0 % 8u) - ((i)*TILE_WIDTH);                                                                                               \
    }

#if (GAME == GAME_SA1)
extern const Collision CollHeader_zone_1_act_1_fg;
extern const Collision CollHeader_zone_1_act_2_fg;
extern const Collision CollHeader_zone_2_act_1_fg;
extern const Collision CollHeader_zone_2_act_2_fg;
extern const Collision CollHeader_zone_3_act_1_fg;
extern const Collision CollHeader_zone_3_act_2_fg;
extern const Collision CollHeader_zone_4_act_1_fg;
extern const Collision CollHeader_zone_4_act_2_fg;
extern const Collision CollHeader_zone_5_act_1_fg;
extern const Collision CollHeader_zone_5_act_2_fg;
extern const Collision CollHeader_zone_6_act_1_fg;
extern const Collision CollHeader_zone_6_act_2_fg;
extern const Collision CollHeader_zone_7_act_1_fg;
extern const Collision CollHeader_zone_7_act_2_fg;
extern const Collision CollHeader_zone_chao_hunt_act_vs_zone_a_fg;
extern const Collision CollHeader_zone_chao_hunt_act_vs_zone_b_fg;
extern const Collision CollHeader_zone_chao_hunt_act_vs_zone_c_fg;
extern const Collision CollHeader_zone_chao_hunt_act_vs_zone_d_fg;

const Collision *const gCollisionTable[NUM_LEVEL_IDS] = {
    &CollHeader_zone_1_act_1_fg,
    &CollHeader_zone_1_act_2_fg,
    &CollHeader_zone_2_act_1_fg,
    &CollHeader_zone_2_act_2_fg,
    &CollHeader_zone_3_act_1_fg,
    &CollHeader_zone_3_act_2_fg,
    &CollHeader_zone_4_act_1_fg,
    &CollHeader_zone_4_act_2_fg,
    &CollHeader_zone_5_act_1_fg,
    &CollHeader_zone_5_act_2_fg,
    &CollHeader_zone_6_act_1_fg,
    &CollHeader_zone_6_act_2_fg,
    &CollHeader_zone_7_act_1_fg,
    &CollHeader_zone_7_act_2_fg,
    &CollHeader_zone_chao_hunt_act_vs_zone_a_fg,
    &CollHeader_zone_chao_hunt_act_vs_zone_b_fg,
    &CollHeader_zone_chao_hunt_act_vs_zone_c_fg,
    &CollHeader_zone_chao_hunt_act_vs_zone_d_fg,
};
#elif (GAME == GAME_SA2)
extern const Collision CollHeader_zone_1_act_1_fg;
extern const Collision CollHeader_zone_1_act_2_fg;
extern const Collision CollHeader_zone_1_act_boss_fg;
extern const Collision CollHeader_zone_1_act_dummy_fg;
extern const Collision CollHeader_zone_2_act_1_fg;
extern const Collision CollHeader_zone_2_act_2_fg;
extern const Collision CollHeader_zone_2_act_boss_fg;
extern const Collision CollHeader_zone_3_act_1_fg;
extern const Collision CollHeader_zone_3_act_2_fg;
extern const Collision CollHeader_zone_3_act_boss_fg;
extern const Collision CollHeader_zone_4_act_1_fg;
extern const Collision CollHeader_zone_4_act_2_fg;
extern const Collision CollHeader_zone_4_act_boss_fg;
extern const Collision CollHeader_zone_5_act_1_fg;
extern const Collision CollHeader_zone_5_act_2_fg;
extern const Collision CollHeader_zone_5_act_boss_fg;
extern const Collision CollHeader_zone_6_act_1_fg;
extern const Collision CollHeader_zone_6_act_2_fg;
extern const Collision CollHeader_zone_6_act_boss_fg;
extern const Collision CollHeader_zone_7_act_1_fg;
extern const Collision CollHeader_zone_7_act_2_fg;
extern const Collision CollHeader_zone_7_act_boss_fg;
extern const Collision CollHeader_zone_final_act_xx_fg;
extern const Collision CollHeader_zone_final_act_ta53_fg;
extern const Collision CollHeader_zone_final_act_unused_fg;

#ifndef COLLECT_RINGS_ROM
const Collision *const gCollisionTable[] = {
    &CollHeader_zone_1_act_1_fg,          &CollHeader_zone_1_act_2_fg,      &CollHeader_zone_1_act_boss_fg,
    &CollHeader_zone_1_act_dummy_fg,      &CollHeader_zone_2_act_1_fg,      &CollHeader_zone_2_act_2_fg,
    &CollHeader_zone_2_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,  &CollHeader_zone_3_act_1_fg,
    &CollHeader_zone_3_act_2_fg,          &CollHeader_zone_3_act_boss_fg,   &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_4_act_1_fg,          &CollHeader_zone_4_act_2_fg,      &CollHeader_zone_4_act_boss_fg,
    &CollHeader_zone_1_act_dummy_fg,      &CollHeader_zone_5_act_1_fg,      &CollHeader_zone_5_act_2_fg,
    &CollHeader_zone_5_act_boss_fg,       &CollHeader_zone_1_act_dummy_fg,  &CollHeader_zone_6_act_1_fg,
    &CollHeader_zone_6_act_2_fg,          &CollHeader_zone_6_act_boss_fg,   &CollHeader_zone_1_act_dummy_fg,
    &CollHeader_zone_7_act_1_fg,          &CollHeader_zone_7_act_2_fg,      &CollHeader_zone_7_act_boss_fg,
    &CollHeader_zone_1_act_dummy_fg,      &CollHeader_zone_final_act_xx_fg, &CollHeader_zone_final_act_ta53_fg,
    &CollHeader_zone_final_act_unused_fg,
};
#endif
#endif

s32 SA2_LABEL(sub_801E4E4)(s32 p0, s32 p1, s32 p2, s32 p3, u8 *data, Func801F07C func)
{
    u8 dummy[4];
    u8 *dummy_p;
    u8 *data1;
    s32 res;
    s32 it;

    if (data == NULL)
        data = dummy;

    dummy_p = &dummy[0];
    dummy_p++;
    data1 = dummy_p;

    res = func(p0 + p3 * 0, p1, p2, data1);

    if (res == 0) {
        res = func(p0 + p3 * 1, p1, p2, data1);

        if (res == 0) {
            it = p3 * 2;
            res = func(p0 + it, p1, p2, data1);

            if (res == 0) {
                POS__P3_IF(2);
            } else if (res == 8) {
                *data = *data1;

                POS__NOT_MOD(2);
            } else {
                *data = *data1;

                POS__RES_IF(2);
            }

        } else if (res == 8) {
            *data = *data1;

            POS__NOT_MOD(1);
        } else {
            *data = *data1;

            POS__RES_IF(1);
        }
    } else if (res == 8) {
        *data = *data1;

        it = -p3;

        res = func(p0 + it, p1, p2, data1);

        if (res == 8) {
            *data = *data1;

            it -= p3;

            res = func(p0 + it, p1, p2, data1);

            if (res == 8) {
                *data = *data1;

                NEG__INV_NOT_MOD(2);
            } else if (res == 0) {
                NEG__P3_IF(2);
            } else {
                *data = *data1;

                NEG__RES_IF(2);
            }
        } else if (res == 0) {
            NEG__NOT_MOD(0);
        } else {
            *data = *data1;

            NEG__RES_IF(1);
        }
    } else {
        *data = *data1;

        if (res <= 0) {
            return res + (p0 % 8u) - 0 * TILE_WIDTH;
        } else {
            return ((--res) - (p0 % 8u)) - 0 * TILE_WIDTH;
        }
    }
}

// TODO: Check whether this is in SA3! It's not in SA1!
#if (GAME >= GAME_SA2)
// TODO:
// - Wrap this in macros where possible
// - Remove gotos
// (100.00%) https://decomp.me/scratch/s8C30
s32 sub_801E6D4(s32 p0, s32 p1, s32 p2, s32 p3, u8 *data, Func801F07C func)
{
    u8 dummy[4];
    u8 *dummy_p;
    u8 *data1;
    s32 res;
    s32 r4;

    if (data == NULL)
        data = dummy;

    dummy_p = &dummy[0];
    dummy_p++;
    data1 = dummy_p;

    res = func(p0 + p3 * 0, p1, p2, data1);

    if (res == 0) {
        // 0 - _0801E70C
        res = func(p0 + p3 * 1, p1, p2, data1);

        if (res == 0) {
            // 1 - _0801E722
            r4 = p3 * 2;
            res = func(p0 + r4, p1, p2, data1);

            if (res == 0) {
                // 2 - _0801E73A
                r4 += p3;
                res = func(p0 + r4, p1, p2, data1);

                if (res == 0) {
                    // 3 -
                    r4 += p3;
                    res = func(p0 + r4, p1, p2, data1);

                    if (res == 0) {
                        // 4 -
                        r4 += p3;
                        res = func(p0 + r4, p1, p2, data1);

                        if (res == 0) {
                            // 5 -
                            POS__P3_IF(5);
                        } else if (res == 8) {
                            // 5 - _0801E78E + 0x4
                            *data = *data1;

                            POS__NOT_MOD(5);
                        } else {
                            // 5 - _0801E7B0
                            *data = *data1;

                            POS__RES_IF(5);
                        }
                    } else if (res == 8) {
                        // 4 - _0801E7D2
                        *data = *data1;

                        POS__NOT_MOD(4);
                    } else {
                        // _0801E7F4
                        *data = *data1;

                        POS__RES_IF(4);
                    }
                } else if (res == 8) {
                    // 3 - _0801E816
                    *data = *data1;

                    POS__NOT_MOD(3);
                } else {
                    // 3 - _0801E838
                    *data = *data1;

                    POS__RES_IF(3);
                }
            } else if (res == 8) {
                // 2 - _0801E85A
                *data = *data1;

                POS__NOT_MOD(2);
            } else {
                // 2 - _0801E87C
                *data = *data1;

                POS__RES_IF(2);
            }
        } else if (res == 8) {
            // 1 - _0801E89E
            *data = *data1;

            POS__NOT_MOD(1);
        } else {
            // 1 - _0801E8BE
            *data = *data1;

            POS__RES_IF(1);
        }
    } else if (res == 8) {
        // _0801E8E6
        *data = *data1;

        r4 = -p3;

        res = func(p0 + r4, p1, p2, data1);
        if (res == 8) {
            // _0801E906
            *data = *data1;
            r4 -= p3;

            res = func(p0 + r4, p1, p2, data1);
            if (res == 8) {
                // _0801E924
                *data = *data1;
                r4 -= p3;

                res = func(p0 + r4, p1, p2, data1);
                if (res == 8) {
                    // _0801E944
                    *data = *data1;
                    r4 -= p3;

                    res = func(p0 + r4, p1, p2, data1);
                    if (res == 8) {
                        *data = *data1;
                        r4 -= p3;

                        res = func(p0 + r4, p1, p2, data1);
                        if (res == 8) {
                            *data = *data1;
                            r4 -= p3;

                            res = func(p0 + r4, p1, p2, data1);
                            if (res == 8) {
                                *data = *data1;

                                POS__NOT_MOD(-5);
                            } else if (res == 0) {
                                // _0801E9B8

                                NEG__P3_IF(5);
                            } else {
                                // _0801E9D6
                                *data = *data1;

                                NEG__RES_IF(5);
                            }
                        } else if (res == 0) {
                            // _0801E9F8
                            NEG__P3_IF(4);
                        } else {
                            // _0801EA16
                            *data = *data1;

                            NEG__RES_IF(4);
                        }
                    } else if (res == 0) {
                        // _0801EA38
                        NEG__P3_IF(3);
                    } else {
                        // _0801EA56
                        *data = *data1;

                        NEG__RES_IF(3);
                    }
                } else {
                    // _0801EA78
                    if (res == 0) {
                    _0801EA82:
                        NEG__P3_IF(2);
                    } else {
                        // _0801EA96
                        *data = *data1;

                    _0801EAA0:
                        NEG__RES_IF(2);
                    }
                }
            } else if (res == 0) {
                // _0801EAB8

                if (p3 > 0) {
#if 1
                    goto _0801EA82;
#else
                    return -9 - (p0 % 8u);
#endif
                } else {
                    return (p0 % 8u) - 2 * TILE_WIDTH;
                }
            } else {
                *data = *data1;

                if (res > 0) {
#if 1
                    goto _0801EAA0;
#else
                    res = (--res) - (p0 % 8u);
                    return res - 2 * TILE_WIDTH;
#endif
                } else {
                    return (res + (p0 % 8u)) - 2 * TILE_WIDTH;
                }
            }
        } else if (res == 0) {
            // _0801EADE

            if (p3 > 0) {
                return ~(p0 % 8u);
            } else {
                return (-8 | p0);
            }
        } else {
            // _0801EAF8
            *data = *data1;

            NEG__RES_IF(1);
        }
    } else {
        // _0801EB1A
        *data = *data1;

        if (res <= 0) {
            return res + (p0 % (unsigned)TILE_WIDTH);
        } else {
            // _0801EB2E
            return (--res) - (p0 % 8u);
        }
    }
}
#endif

s32 SA2_LABEL(sub_801EB44)(s32 p0, s32 p1, s32 layer)
{
    u32 r0;
    s32 yPixel;
    s32 mtTileIndex;
    u32 tile;
    s32 hv;
    const Collision *coll;
    s32 hIndex;

    p0 = CLAMP_32(p0, 0, gRefCollision->pxWidth - 1);
    p1 = CLAMP_32(p1, 0, gRefCollision->pxHeight - 1);

    tile = SA2_LABEL(sub_801EF94)(p0, p1, layer & PLAYER_LAYER__MASK);
    mtTileIndex = tile & TILE_MASK_INDEX;

    yPixel = p1 % (unsigned)TILE_WIDTH;

    if (tile & TILE_MASK_Y_FLIP) {
        yPixel = (TILE_WIDTH - 1) - yPixel;
    }

    coll = gRefCollision;
    hIndex = (mtTileIndex * TILE_WIDTH);
    hv = coll->height_map[hIndex + yPixel];
    hv &= 0xF;

    if ((hv & 0x8) == +8) {
        hv |= ~0xF;
    }

    if (hv == -8) {
        hv = 8;
    }

    if (layer & 0x80) {
        s32 flags = gRefCollision->flags[mtTileIndex / (unsigned)TILE_WIDTH];

        // 2: one tile's flags' bit-width
        flags >>= ((mtTileIndex % (unsigned)TILE_WIDTH) * 2);

        if (flags & 0x1) {
            hv = 0;
        }
    }

    if (tile & TILE_MASK_X_FLIP) {
        if ((hv != TILE_WIDTH) && (hv != 0)) {
            r0 = hv + TILE_WIDTH;
            r0 = (hv > 0) ? hv - TILE_WIDTH : r0;

        } else {
            r0 = hv;
        }
        hv = r0;
    }

    return hv;
}

s32 SA2_LABEL(sub_801EC3C)(s32 p0, s32 p1, s32 layer)
{
    u32 r0;
    s32 xPixel;
    s32 mtTileIndex;
    u32 tile;
    s32 hv;
    const Collision *coll;
    s32 hIndex;

    p1 = CLAMP_32(p1, 0, gRefCollision->pxWidth - 1);
    p0 = CLAMP_32(p0, 0, gRefCollision->pxHeight - 1);

    tile = SA2_LABEL(sub_801EF94)(p1, p0, layer & PLAYER_LAYER__MASK);
    mtTileIndex = tile & TILE_MASK_INDEX;

    xPixel = p1 % (unsigned)TILE_WIDTH;

    if (tile & TILE_MASK_X_FLIP) {
        xPixel = (TILE_WIDTH - 1) - xPixel;
    }

    coll = gRefCollision;
    hIndex = (mtTileIndex * TILE_WIDTH);
    hv = coll->height_map[hIndex + xPixel];
    hv >>= 4;

    if (hv == -TILE_WIDTH) {
        hv = TILE_WIDTH;
    }

    if (layer & PLAYER_LAYER__80) {
        s32 flags = gRefCollision->flags[mtTileIndex / (unsigned)TILE_WIDTH];

        // 2: one tile's flags' bit-width
        flags >>= ((mtTileIndex % (unsigned)TILE_WIDTH) * 2);

        if (flags & 0x1) {
            hv = 0;
        }
    }

    if (tile & TILE_MASK_Y_FLIP) {
        if ((hv != TILE_WIDTH) && (hv != 0)) {
            r0 = hv + TILE_WIDTH;
            r0 = (hv > 0) ? hv - TILE_WIDTH : r0;

        } else {
            r0 = hv;
        }
        hv = r0;
    }

    return hv;
}

s32 SA2_LABEL(sub_801ED24)(s32 p0, s32 p1, s32 p2, u8 *p3)
{
    u32 r0;
    s32 r3;
    s32 mtTileIndex;
    u32 res;
    const Collision *coll;
    s32 hIndex;
    u8 rotation;

    p0 = CLAMP_32(p0, 0, gRefCollision->pxWidth - 1);
    p1 = CLAMP_32(p1, 0, gRefCollision->pxHeight - 1);

    res = SA2_LABEL(sub_801EF94)(p0, p1, p2 & 0x1);
    mtTileIndex = res & 0x3FF;

    r3 = p1 % 8u;

    if (res & 0x800) {
        r3 = (8 - 1) - r3;
    }

    coll = gRefCollision;
    hIndex = mtTileIndex * 8;
    r3 = coll->height_map[hIndex + r3] % 16u;

    if ((r3 & 0x8) == +8) {
        r3 |= ~0xF;
    }

    if (r3 == -8) {
        r3 = 8;
    }

    if (p2 & 0x80) {
        s32 flags = gRefCollision->flags[mtTileIndex / 8u];

        // 2: one tile's flags' bit-width
        flags >>= ((mtTileIndex % 8u) * 2);

        if (flags & 0x1) {
            r3 = 0;
        }
    }

    if (res & 0x400) {
        if ((r3 != 8) && (r3 != 0)) {
            r0 = r3 + 8;
            r0 = (r3 > 0) ? r3 - 8 : r0;

        } else {
            r0 = r3;
        }
        r3 = r0;
    }

    rotation = gRefCollision->tile_rotation[mtTileIndex];

    if (res & 0x800) {
        u32 v2 = -0x80 - rotation;
        rotation = v2;
    }

    if (res & 0x400) {
        u8 v;
        if (r3 != 0) {
            u32 v2 = -rotation;
            v = v2;
        } else {
            v = rotation;
        }
        rotation = v;
    }

    *p3 = rotation;

    return r3;
}

// TODO: Fix this register mess!
// (100.00%) https://decomp.me/scratch/sJY4g
s32 SA2_LABEL(sub_801EE64)(s32 p0in, s32 p1in, s32 p2in, u8 *p3in)
{
    // NOTE: I'm surprised it is using UNsigned ints in SA2.
    // TODO: Should we consider the SA2 type a bugfix in SA1?
#if (GAME == GAME_SA1)
    typedef s32 r0r1_t;
#elif (GAME == GAME_SA2)
    typedef u32 r0r1_t;
#endif

#ifndef NON_MATCHING
    register r0r1_t r0 asm("r0");
    register r0r1_t r1 asm("r1");
    register s32 r3 asm("r3");
    register s32 p0 asm("r4") = p0in;
    register s32 p1 asm("r5") = p1in;
    register s32 r6 asm("r6");
    register s32 p2 asm("r8") = p2in;
    u32 r7;
    register s32 sb asm("sb");
    register u8 *p3 asm("sl") = p3in;
    register s32 res asm("r4");
#else
    r0r1_t r0;
    r0r1_t r1;
    s32 r3;
    s32 p0 = p0in;
    s32 p1 = p1in;
    s32 r6;
    s32 p2 = p2in;
    u32 r7;
    s32 sb;
    u8 *p3 = p3in;
    s32 res;
#endif
    u8 rotation;

    if (p1 >= 0) {
        r0 = gRefCollision->pxWidth;
        r1 = r0 - 1;
        r0 = p1;
        if (r0 > r1) {
            r0 = r1;
        }
    } else {
        r0 = 0;
    }
    p1 = r0;
    // _0801EE92 + 2

    if (p0 >= 0) {
        r0 = gRefCollision->pxHeight;
        r1 = r0 - 1;
        r0 = p0;
        if (r0 > r1) {
            r0 = r1;
        }
    } else {
        r0 = 0;
    }
    p0 = r0;
    // _0801EEB2 + 2

    sb = 1;

    p0 = SA2_LABEL(sub_801EF94)(p1, p0, p2 & sb);
    r7 = 0x3FF;
    r7 &= p0;

    r6 = 0x7;
    r3 = r6;
    r3 &= p1;

    r0 = 0x400;
    r0 &= p0;
    if (r0) {
        r3 = r6 - r3;
    }
    // _0801EEDC

    // r3 = tileHeight
    r3 = gRefCollision->height_map[(r7 << 3) + r3];

    if ((r3 >>= 4) == -8) {
        r3 = 8;
    }
    // _0801EEF8

    if (p2 & 0x80) {
        s32 flags = gRefCollision->flags[r7 / 8u];

        // 2: one tile's flags' bit-width
        flags >>= ((r7 & r6) * 2);

        if (flags & sb) {
            r3 = 0;
        }
    }
    // _0801EF1E

    if (p0 & 0x800) {
        if ((r3 != 8) && (r3 != 0)) {
            r0 = r3 + 8;
            r0 = (r3 > 0) ? r3 - 8 : r0;

        } else {
            r0 = r3;
        }
        r3 = r0;
    }
    // _0801EF48

    rotation = gRefCollision->tile_rotation[r7];

    if (p0 & 0x400) {
        rotation = -rotation;
    }

    if (p0 & 0x800) {
        u8 v;
        if (r3 != 0) {
            u32 v2 = (-0x80) - rotation;
            v = v2;
        } else {
            v = rotation;
        }
        rotation = v;
    }
    // _0801EF7E

    {
#ifndef NON_MATCHING
        register u8 *r1p asm("r1") = p3;
        *r1p = rotation;
#else
        *p3 = rotation;
#endif
    }

    return r3;
}

// Parameter 'layer' should ONLY be 0 or 1.
// TODO: This should return a u16, representing a tile inside a metatile
// TODO: Fix this register mess!
// (100.00%) https://decomp.me/scratch/nh7WN
s32 SA2_LABEL(sub_801EF94)(s32 p0, s32 p1, s32 layer)
{
    s32 r0;
#ifndef NON_MATCHING
    register s32 r1 asm("r1");
    register s32 r3 asm("r3");
    register s32 r4 asm("r4");
    register s32 r5 asm("r5");
    s32 r7;
    register s32 r8 asm("r8");
#else
    s32 r1;
    s32 r3;
    s32 r4;
    s32 r5;
    s32 r7;
    s32 r8;
#endif
    const Collision *coll;
    u32 mtIndex;
    s32 i;
    void *pMeta;
    u16 result;

    r4 = p0 >> 3;

    if (gUnknown_3000410[0] == r4) {
        r7 = gUnknown_3000410[2];
        r0 = gUnknown_3000410[1];
    } else {
        s32 divRes = Div(r4, TILES_PER_METATILE_AXIS);
        r1 = r4 - (divRes * TILES_PER_METATILE_AXIS);

        gUnknown_3000410[0] = r4;
        gUnknown_3000410[1] = divRes;
        gUnknown_3000410[2] = r1;

        r7 = gUnknown_3000410[2];
        r0 = gUnknown_3000410[1];
    }
    r8 = r0;
    // _0801EFCC

    r4 = p1 >> 3;
    if (gUnknown_3000420[0] == r4) {
        r5 = gUnknown_3000420[2];
        r3 = gUnknown_3000420[1];
    } else {
        s32 divRes = Div(r4, TILES_PER_METATILE_AXIS);
        r1 = r4 - (divRes * TILES_PER_METATILE_AXIS);

        r3 = divRes;
        gUnknown_3000420[0] = r4;
        gUnknown_3000420[1] = r3;
        gUnknown_3000420[2] = r1;

        r5 = r1;
    }

    coll = gRefCollision;
    mtIndex = (coll->map[layer])[(r3 * coll->levelX) + r8];

    // ((r5 << 3) + (r5 << 2)) == r5 * TILES_PER_METATILE_AXIS
    r1 = ((r5 << 3) + (r5 << 2) + r7);

#ifndef NON_MATCHING
    asm("" ::"r"(r5));
#endif

    r3 = mtIndex * 256;
    mtIndex *= 32;
    i = r1 * 2;
    pMeta = (void *)coll->metatiles;
    pMeta += r3;
    pMeta += mtIndex;
    pMeta += i;
    result = *(u16 *)pMeta;

    return result;
}

void SA2_LABEL(sub_801F044)(void)
{
    DmaFill32(3, 0, &gUnknown_3000410, sizeof(gUnknown_3000410));
    DmaFill32(3, 0, &gUnknown_3000420, sizeof(gUnknown_3000420));
}

s32 SA2_LABEL(sub_801F07C)(s32 p0, s32 p1, s32 p2, s32 p3, u8 *data, Func801F07C func)
{
    u8 dummy[4];
    u8 *dummy_p;

    s32 result;
    s32 funcRes;
    u8 *data1;

    if (data == NULL)
        data = dummy;

    dummy_p = &dummy[0];
    dummy_p++;
    data1 = dummy_p;

    funcRes = func(p0, p1, p2, data1);

    if (funcRes == 0) {
        if (p3 > 0) {
            result = 8 - (p0 % 8u);
        } else {
            result = (p0 % 8u) + 1;
        }
    } else if (funcRes == 8) {
        *data = *data1;

        if (p3 > 0) {
            result = ~(p0 % 8u);
        } else {
            result = (-8) | p0;
        }
    } else {
        *data = *data1;

        if (funcRes > 0) {
            funcRes--;
            result = funcRes - (p0 % 8u);
        } else {
            result = funcRes + (p0 % 8u);
        }
    }

    return result;
}

s32 SA2_LABEL(sub_801F100)(s32 p0, s32 p1, s32 p2, s32 p3, Func801F100 func)
{
    s32 result;
    s32 funcRes = func(p0, p1, p2);

    if (funcRes == 0) {
        if (p3 > 0) {
            result = 8 - (p0 % 8u);
        } else {
            result = (p0 % 8u) + 1;
        }
    } else if (funcRes == 8) {
        if (p3 > 0) {
            result = ~(p0 % 8u);
        } else {
            result = (-8) | p0;
        }
    } else if (funcRes > 0) {
        funcRes--;
        result = funcRes - (p0 % 8u);
    } else {
        result = funcRes + (p0 % 8u);
    }

    return result;
}
