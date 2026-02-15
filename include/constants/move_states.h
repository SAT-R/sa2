#ifndef GUARD_MOVESTATES_H
#define GUARD_MOVESTATES_H

// NOTE(Jace): Movestates are different across games.

/* Sonic Advance 2 */
#define MOVESTATE_FACING_LEFT        0x00000001
#define MOVESTATE_IN_AIR             0x00000002
#define MOVESTATE_SPIN_ATTACK        0x00000004
#define MOVESTATE_JUMPING            (MOVESTATE_IN_AIR | MOVESTATE_SPIN_ATTACK)
#define MOVESTATE_STOOD_ON_OBJ       0x00000008
#define MOVESTATE_FLIP_WITH_MOVE_DIR 0x00000010
#define MOVESTATE_20                 0x00000020
#define MOVESTATE_IN_WATER           0x00000040
#define MOVESTATE_DEAD               0x00000080
#define MOVESTATE_100                0x00000100
#define MOVESTATE_200                0x00000200
#define MOVESTATE_400                0x00000400
#define MOVESTATE_ICE_SLIDE          0x00000800
#define MOVESTATE_1000               0x00001000
#define MOVESTATE_2000               0x00002000
#define MOVESTATE_4000               0x00004000
#define MOVESTATE_8000               0x00008000
#define MOVESTATE_10000              0x00010000
#define MOVESTATE_20000              0x00020000
#define MOVESTATE_40000              0x00040000
#define MOVESTATE_80000              0x00080000
#define MOVESTATE_100000             0x00100000
#define MOVESTATE_IGNORE_INPUT       0x00200000 // does not ignore Start-Button
#define MOVESTATE_IA_OVERRIDE        0x00400000
#define MOVESTATE_800000             0x00800000
#define MOVESTATE_1000000            0x01000000
#define MOVESTATE_BOOST_EFFECT_ON    0x02000000
#define MOVESTATE_4000000            0x04000000
#define MOVESTATE_GOAL_REACHED       0x08000000
#define MOVESTATE_10000000           0x10000000
#define MOVESTATE_SOME_ATTACK        0x20000000
#define MOVESTATE_IN_SCRIPTED        0x40000000 // Player speed/pos are currently handled by an Interactable
#define MOVESTATE_80000000           0x80000000

#endif // GUARD_MOVESTATES_H