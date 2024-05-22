.macro SECTION_RODATA
#if (!CPU_ARCH_X86 && defined(__APPLE__))
  .section __DATA,__data
#else
  .section .rodata
#endif
.endm
