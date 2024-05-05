#ifndef GUARD_SA2_PACKED_MACRO_H
#define GUARD_SA2_PACKED_MACRO_H

#if defined(_MSC_VER)
#define PACKED(name, struct_body)                                                       \
    __pragma(pack(push, 1)) typedef struct name struct_body __pragma(pack(pop))
#else
// NOTE: Please make sure NOT to add a ; to the end
//       of the structs you enclose with this macro.
//       PACKED(struct test { char a; int b; }); - good
//       PACKED(struct test { char a; int b; };); - bad
#define PACKED(name, struct_body)                                                       \
    typedef struct __attribute__((packed)) struct_body name;
#endif

#endif // GUARD_SA2_PACKED_MACRO_H