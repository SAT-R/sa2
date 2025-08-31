#ifndef GUARD_PLATFORM_SHARED_INPUT_H
#define GUARD_PLATFORM_SHARED_INPUT_H

typedef u32 SharedKeys;

#define KEY_SPEEDUP   (1 << 16)
#define SPEEDUP_SCALE 5.0f

#ifdef _WIN32
SharedKeys GetXInputKeys();
#endif // _WIN32

#endif // GUARD_PLATFORM_SHARED_INPUT_H
