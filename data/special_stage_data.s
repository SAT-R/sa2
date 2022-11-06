    .section .rodata

@;special_stage_data.c ?
@; too long to include in `special_stage.c`
   .global gUnknown_080DA270
gUnknown_080DA270:
    .incbin "baserom.gba", 0x000DA270, 0x53F8
