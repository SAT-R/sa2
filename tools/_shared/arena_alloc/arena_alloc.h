#ifndef GUARD_ARENA_ALLOC_H
#define GUARD_ARENA_ALLOC_H

#include "types.h"

typedef struct {
    void *memory;
    long long size;
    long long offset;
} MemArena;

void memArenaInit(MemArena*);
void memArenaFree(MemArena *arena);
void* memArenaReserve(MemArena* arena, s64 srcLength, bool alignTo4);
void *memArenaAddMemory(MemArena *arena, void *source, s64 srcLength);
char *memArenaAddString(MemArena *arena, char *source);
char *memArenaAddStringN(MemArena *arena, char *source, size_t length);
u64 *memArenaAddU64(MemArena *arena, u64 number);
u32 *memArenaAddU32(MemArena *arena, u32 number);
u16 *memArenaAddU16(MemArena *arena, u16 number);
u8  *memArenaAddU8 (MemArena *arena,  u8 number);

#endif //GUARD_ARENA_ALLOC_H
