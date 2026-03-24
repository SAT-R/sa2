#ifndef GUARD_SA2_PLATFORM_H
#define GUARD_SA2_PLATFORM_H

#include "gba/types.h"

extern void Platform_QueueAudio(const s16 *data, u32 numBytes);
extern void Platform_ProcessBackgroundsCopyQueue(void);
// TODO: Re-enable once #include-ing global.h/core.h/sprite.h does not result in compilation errors.
// void Platform_TransformSprite(Sprite *s, SpriteTransform *transform);

#endif // GUARD_SA2_PLATFORM_H
