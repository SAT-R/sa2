#ifndef GUARD_MY_TYPES_H
#define GUARD_MY_TYPES_H

typedef unsigned char      u8;
typedef unsigned short     u16;
typedef unsigned int       u32;
typedef unsigned long long u64;

typedef signed char      s8;
typedef signed short     s16;
typedef signed int       s32;
typedef signed long long s64;

#define strend(str) (str + strlen(str))

typedef struct {
    u8 b;
    u8 g;
    u8 r;
} ColorBGR;

typedef struct {
    u8 r;
    u8 g;
    u8 b;
    u8 a;
} ColorRGBA;

typedef ColorRGBA JascColor;

#endif // GUARD_MY_TYPES_H