#ifndef GUARD_CONST_ANIM_COMMANDS_H

#define ANIM_CMD__TILES        -1
#define ANIM_CMD__PALETTE      -2
#define ANIM_CMD__JUMP_BACK    -3
#define ANIM_CMD__END          -4
#define ANIM_CMD__PLAY_SOUND   -5
#define ANIM_CMD__HITBOX       -6
#define ANIM_CMD__TRANSLATE    -7
#define ANIM_CMD__8            -8
#define ANIM_CMD__CHANGE_ANIM  -9
#define ANIM_CMD__10           -10
#define ANIM_CMD__SET_PRIORITY -11
#define ANIM_CMD__12           -12
#define ANIM_CMD__SHOW_FRAME   -13

#define NUM_ANIMATION_TABLE_ENTRIES 1133

#define TILES(index, count)         ANIM_CMD__TILES, index, count,
#define PALETTE(num, count, offset) ANIM_CMD__PALETTE, num, (((u16)offset << 16) | (u16)count),
#define JUMP_BACK(offset)           ANIM_CMD__JUMP_BACK, offset,
#define END()                       ANIM_CMD__END,
#define PLAY_SOUND(id)              ANIM_CMD__PLAY_SOUND, id,
#define HITBOX(index, left, top, right, bottom)                                                                                            \
    ANIM_CMD__HITBOX, index, (((left & 0xFF) << 0) | ((top & 0xFF) << 8) | ((right & 0xFF) << 16) | ((bottom & 0xFF) << 24)),
#define TRANSLATE(x, y)               ANIM_CMD__TRANSLATE, (((u16)x << 0) | ((u16)y << 16)),
#define CMD_8(a, b)                   ANIM_CMD__8, a, b,
#define CHANGE_ANIM(anim, variant)    ANIM_CMD__CHANGE_ANIM, ((anim << 0) | (variant << 16)),
#define CMD_10(a, b, c)               ANIM_CMD__10, a, b, c,
#define SET_PRIORITY(prio)            ANIM_CMD__SET_PRIORITY, prio,
#define CMD_12(a)                     ANIM_CMD__12, a,
#define SHOW_FRAME(duration, frameId) duration, frameId,

#define GUARD_CONST_ANIM_COMMANDS_H
#endif