	.section .rodata

    .global gUnknown_080984A4
gUnknown_080984A4:
    .byte 1, 0, 2, 3, 6, 7, 5, 4

    .global animCmdTable
animCmdTable: @ 0x080984AC
    .4byte animCmd_GetTileIndex
    .4byte animCmd_GetPalette
    .4byte animCmd_JumpBack
    .4byte animCmd_4
    .4byte animCmd_PlaySoundEffect
    .4byte animCmd_6
    .4byte animCmd_7
    .4byte animCmd_8
    .4byte animCmd_9
    .4byte animCmd_10
    .4byte animCmd_11
    .4byte animCmd_12

    .global gUnknown_080984DC
gUnknown_080984DC:
    .incbin "baserom.gba", 0x000984DC, 0x1

    .global gUnknown_080984DD
gUnknown_080984DD:
    .incbin "baserom.gba", 0x000984DD, 0x17

    .global gUnknown_080984F4
gUnknown_080984F4:
    .incbin "baserom.gba", 0x000984F4, 0x1687C
