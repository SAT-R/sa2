	.section .rodata

.align 2, 0

    .global gPlayerCharacterIdleAnims
gPlayerCharacterIdleAnims:
    .incbin "data/rom_data.bin", 0x00015B90, 0x2

    .global sCharStateAnimInfo
sCharStateAnimInfo:
    .incbin "data/rom_data.bin", 0x00015B92, 0x1CC

    .global playerBoostPhysicsTable
playerBoostPhysicsTable:
    .incbin "data/rom_data.bin", 0x00015D5E, 0x14

    .global playerBoostThresholdTable
playerBoostThresholdTable:
    .incbin "data/rom_data.bin", 0x00015D72, 0xA

    .global sSpinDashSpeeds
sSpinDashSpeeds:
    .incbin "data/rom_data.bin", 0x00015D7C, 0x1A

    .global sSpringAccelY
sSpringAccelY:
    .incbin "data/rom_data.bin", 0x00015D96, 0x8

    .global sSpringAccelX
sSpringAccelX:
    .incbin "data/rom_data.bin", 0x00015D9E, 0xE
