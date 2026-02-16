.macro mSectionRodata
#if (!CPU_ARCH_X86 && defined(__APPLE__)) // On macos, native compilation uses this name for the rodata section
  .section __DATA,__data
#else
  .section .rodata
#endif
.endm

// Used so that we can have cross platform (32bit or 64bit) pointers
.macro mPtr value
#if defined(__aarch64__) || defined(__x86_64__)
    .quad \value
#elif defined(__mips__)
    .4byte \value
#else
    .int \value
#endif
.endm

// Used for cross platform aligning of labels
.macro mAlignWord
#if defined(__APPLE__) && (defined(__aarch64__) || defined(__x86_64__))
    .align 3       // Align to 8 bytes on macOS (2^3 = 8)
#elif defined(__aarch64__) || defined(__x86_64__)
    .align 8       // Align to 8 bytes on other platforms
#elif defined(PLATFORM_GBA)
    .align 2       // Align to 4 bytes on GBA
#else
    .align 4       // Default alignment to 4 bytes
#endif
.endm
