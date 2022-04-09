	.section .rodata
    
    .align 2, 0
    .global gSetup512KInfos
gSetup512KInfos:
    .incbin "baserom.gba", 0x00C86E38, 0x160
