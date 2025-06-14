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
    .align 4
    .quad \value
#else
    .int \value
#endif
.endm

// Used for cross platform aligning of labels
.macro mAlignWord
#if defined(__aarch64__) || defined(__x86_64__)
    .align 4
#else
    .align 2
#endif
.endm
