#ifndef GUARD_ANIM_SIZES_H
#define GUARD_ANIM_SIZES_H

// TODO: Auto-generate this file
#define MAX_TILES(_animName)                   ((_animName##_WIDTH / 8) * (_animName##_HEIGHT / 8))
#define MAX_TILES_VARIANT(_animName, _variant) ((_animName##_VAR##_variant##_WIDTH / 8) * (_animName##_VAR##_variant##_HEIGHT / 8))
#define ALLOC_TILES(_animName)                 VramMalloc(((_animName##_WIDTH / 8) * (_animName##_HEIGHT / 8)))
#define ALLOC_TILES_VARIANT(_animName, _variant)                                                                                           \
    VramMalloc(((_animName##_VAR##_variant##_WIDTH / 8) * (_animName##_VAR##_variant##_HEIGHT / 8)))

// 849
#define SA2_ANIM_GRIND_EFFECT_WIDTH  32
#define SA2_ANIM_GRIND_EFFECT_HEIGHT 40

// 1044
#define ANIM_DEMO_PLAY_WIDTH  112
#define ANIM_DEMO_PLAY_HEIGHT 16

#endif // GUARD_ANIM_SIZES_H
