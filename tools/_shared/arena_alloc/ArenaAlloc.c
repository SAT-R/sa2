#include <string.h>
#include <stdio.h>
#include <stdlib.h>


#if defined(__unix__) || defined(__APPLE__)
#include <errno.h>

#define _GNU_SOURCE 1
#include <unistd.h>
#include <sys/mman.h>

// This should be defined in sys/mman.h - why isn't it?
#define MREMAP_MAYMOVE   1
#define MREMAP_FIXED     2
#define MREMAP_DONTUNMAP 4
void *mremap(void *old_address, size_t old_size, size_t new_size, int flags, void*);
#else
#ifdef _MSC_VER
#include <Windows.h>
#endif
#endif

#include "types.h"
#include "ArenaAlloc.h"

#define ARENA_SIZE (1*1024*1024*1024)

static void memArenaExpand(MemArena *arena, s32 numNewArenas);

// I have no idea why this is necessary.
// VirtualAlloc's 2nd parameter accepts a SIZE_T, but
// if you directly pass a value that is 2GB or more (0x80000000),
// you'll be left with a downcast signed 32 bit value, even in 64bit mode
//   Behaviour in:  VS Compiler v14.34.31937.0
u64 GetMegabytes(u64 num) {
    return num*1024*1024;
}

static void *memArenaVirtualAlloc(void* baseAddress, size_t size) {
    assert(size > 0);

    void* memory = NULL;

    // Call OS-specific memory alloc function
#if defined(__unix__) || defined(__APPLE__)
    memory = mmap(baseAddress, size, (PROT_READ | PROT_WRITE), (MAP_PRIVATE | MAP_ANONYMOUS), -1, 0);
    if(memory == MAP_FAILED) {
        printf("ERROR: Call to mmap failed! (Errno: %d)\n", errno);
        return NULL;
    }
#elif (defined _MSC_VER)
    // TODO/TEMP: Just reserve 2GB for each arena
    u64 memoryAmount = GetMegabytes(1);
    memory = VirtualAlloc(baseAddress, memoryAmount, (MEM_COMMIT | MEM_RESERVE), PAGE_READWRITE);
#else
    // TODO/TEMP: Just reserve 2GB for each arena
    u64 memoryAmount = GetMegabytes(1);
    printf("WARNING: OS-specific SDK not found. Using malloc.\n");
    memory = malloc(memoryAmount);

    if(!memory) {
        printf("ERROR: Call to malloc failed! (Errno: %d)\n", errno);
        return NULL;
    }
#endif

    return memory;
}

static void *memArenaVirtualRealloc(void* memory, size_t oldSize, size_t newSize) {
    assert(newSize > 0);

    void *oldAddress = memory;

#if 1
    // TODO: If there's a way to allocate more memory while keeping the base address,
    //       do it on all platforms instead of just allocating 4GB in the beginning.
    void *newAddress = oldAddress;
#else
    printf("OldMem: %p - PageSize: 0x%X\n", oldAddress, (u32)oldSize);
#if defined(__unix__) || defined(__APPLE__)
    newAddress = mremap(oldAddress, oldSize, oldSize/2, 0, NULL);
    if((newAddress == MAP_FAILED)) {
        printf("ERROR: Call to mremap failed! (Errno: %d)\n", errno);
        return NULL;
    }
#else
#ifdef _MSC_VER

#endif
#endif
#endif

    // If the addresses are different, pointers would be wrong
    assert(oldAddress == newAddress);

    return newAddress;
}

static void memArenaVirtualFree(MemArena* arena) {
    if(arena->memory) {
#if defined(__unix__) || defined(__APPLE__)
    munmap(arena->memory, arena->size);
#else
#ifdef _MSC_VER
    VirtualFree(arena->memory, arena->size, MEM_RELEASE);
#endif
#endif
    }

    arena->size = 0;
    arena->offset = 0;
}

void
memArenaInit(MemArena *arena) {
    void* newMem = memArenaVirtualAlloc(NULL, ARENA_SIZE); 
    arena->memory = newMem;
    arena->size = ARENA_SIZE;
    arena->offset = 0;

    assert(arena->memory);
}

void
memArenaFree(MemArena *arena) {
    memArenaVirtualFree(arena);
}

// Reserve 'byteCount' amount of memory and set it to zero.
void*
memArenaReserve(MemArena *arena, s64 byteCount, bool alignTo4) {
    if (byteCount <= 0)
        return NULL;

    if(alignTo4)
        ALIGN(arena->offset, 4);
    
    if(arena->size < (arena->offset + byteCount)) {
        // TODO: There's a bug that stems from realloc returning a different address after calling it.
        //       Use VirtualAlloc and the Unix-equivalent to fix that.
        //       That's why we're asserting here.
        // Allocate more memory upfront for now, if you reach this assert!
        assert(FALSE);

        int newArenaCount = ((arena->offset + byteCount) - arena->size);
        newArenaCount /= ARENA_SIZE;
        newArenaCount += 1;
        
        memArenaExpand(arena, newArenaCount);
    }

    u8* memory = ((u8*)arena->memory + arena->offset);
    memset(memory, 0, byteCount);

    arena->offset += byteCount;

    return memory;
}

void*
memArenaAddMemory(MemArena *arena, void *source, s64 srcLength) {
    u8* dest = memArenaReserve(arena, srcLength, FALSE);

    memcpy(dest, source, srcLength);

    return dest;
}

char*
memArenaAddString(MemArena *arena, char *source) {
    int length = strlen(source);
    
    char *str = (char*)memArenaAddMemory(arena, source, length+1);
    str[length] = '\0';
    
    return str;
}

char*
memArenaAddStringN(MemArena *arena, char *source, size_t length) {
    assert(length > 0);

    char *str = (char*)memArenaAddMemory(arena, source, length+1);
    str[length] = '\0';
    
    return str;
}

u64*
memArenaAddU64(MemArena *arena, u64 number) {
    ALIGN(arena->offset, 8);
    u64* targetMem;
    
    if(arena->size < (signed)(arena->offset + sizeof(number))) {
        memArenaExpand(arena, 1);
    }
    
    targetMem = (u64*)((u8*)arena->memory + arena->offset);
    *targetMem = number;
    arena->offset += sizeof(number);
    
    return targetMem;
}

u32*
memArenaAddU32(MemArena *arena, u32 number) {
    ALIGN(arena->offset, 4);
    u32* targetMem;
    
    if(arena->size < (signed)(arena->offset + sizeof(number))) {
        memArenaExpand(arena, 1);
    }
    
    targetMem = (u32*)((u8*)arena->memory + arena->offset);
    *targetMem = number;
    arena->offset += sizeof(number);
    
    return targetMem;
}

u16*
memArenaAddU16(MemArena *arena, u16 number) {
    ALIGN(arena->offset, 2);
    u16* targetMem;
    
    if(arena->size < (signed)(arena->offset + sizeof(number))) {
        memArenaExpand(arena, 1);
    }
    
    targetMem = (u16*)((u8*)arena->memory + arena->offset);
    *targetMem = number;
    arena->offset += sizeof(number);
    
    return targetMem;
}

u8*
memArenaAddU8(MemArena *arena, u8 number) {
    u8* targetMem;
    
    if(arena->size < (signed)(arena->offset + sizeof(number))) {
        memArenaExpand(arena, 1);
    }
    
    targetMem = ((u8*)arena->memory + arena->offset);
    *targetMem = number;
    arena->offset += sizeof(number);
    
    return targetMem;
}

static void
memArenaExpand(MemArena *arena, s32 numNewArenas) {
    long long newSize;
    
    if(numNewArenas <= 0) {
        numNewArenas = 1;
    }
    
    newSize = arena->size + ARENA_SIZE*numNewArenas;
    
    // Check for overflow
    assert(newSize > 0);
    
    // @BUG @SPEED
    // malloc only takes an int, use VirtualAlloc() instead...
    arena->memory = memArenaVirtualRealloc(arena->memory, arena->size, newSize);
    assert(arena->memory);
    arena->size = newSize;
}

#ifdef NEEDS_MAIN_DUMMY
int main(void) {}
#endif

