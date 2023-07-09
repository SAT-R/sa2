#ifndef GUARD_SCREEN_SHAKE_H
#define GUARD_SCREEN_SHAKE_H

struct Task *CreateScreenShake(u32 p0, u32 p1, u32 p2, u32 p3, u32 flags);

#define SCREENSHAKE_HORIZONTAL 0x40
#define SCREENSHAKE_VERTICAL   0x80

#endif // GUARD_SCREEN_SHAKE_H