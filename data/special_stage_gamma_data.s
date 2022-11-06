    .section .rodata

    .global gUnknown_080DF914
gUnknown_080DF914:
    .incbin "baserom.gba", 0x000DF914, 0x48

    .global gUnknown_080DF95C
gUnknown_080DF95C:
    .incbin "baserom.gba", 0x000DF95C, 0xC

@; levels
    .global gUnknown_080DF968
gUnknown_080DF968:
    .incbin "baserom.gba", 0x000DF968, 0x38

    .global gUnknown_080DF9A0
gUnknown_080DF9A0:
    .incbin "baserom.gba", 0x000DF9A0, 0x38

    .global gUnknown_080DF9D8
gUnknown_080DF9D8:
    .incbin "baserom.gba", 0x000DF9D8, 0x2A

    .global gSpecialStageLevelTimes
gSpecialStageLevelTimes:
    .incbin "baserom.gba", 0x000DFA02, 0xE
