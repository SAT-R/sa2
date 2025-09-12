.include "asm/macros/portable.inc"

mSectionRodata

RomBuildInfo:
#ifdef JAPAN
    .ascii "0.93 Thu Oct 25 00:00:00  2002\r\n"
#else
    .ascii "0.94 Thu Oct 25 00:00:00  2002\r\n"
#endif
