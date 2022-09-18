	.section .rodata

    .align 2

    .global gZonePathAssets
gZonePathAssets:
    .incbin "baserom.gba", 0x000D72B8, 0x30

    .global gZonePathAnimatedAssets
gZonePathAnimatedAssets:
    .incbin "baserom.gba", 0x000D72E8, 0x70

    .global gZoneMapCameraTargets
gZoneMapCameraTargets:
    .incbin "baserom.gba", 0x000D7358, 0x40

    .global gUnknown_080D7398
gUnknown_080D7398:
    .incbin "baserom.gba", 0x000D7398, 0x80

    .global gUnknown_080D7418
gUnknown_080D7418:
    .incbin "baserom.gba", 0x000D7418, 0x40

    .global gUnknown_080D7458
gUnknown_080D7458:
    .incbin "baserom.gba", 0x000D7458, 0x20

    .global gCourseIndexToZonePaths
gCourseIndexToZonePaths:
    .incbin "baserom.gba", 0x000D7478, 0x10

    .global gUnknown_080D7488
gUnknown_080D7488:
    .incbin "baserom.gba", 0x000D7488, 0x20

    .global gZoneMapPathPositions
gZoneMapPathPositions:
    .incbin "baserom.gba", 0x000D74A8, 0x20

    .global gZoneMapPathReverseAngles
gZoneMapPathReverseAngles:
    .incbin "baserom.gba", 0x000D74C8, 0x20

    .global gUnknown_080D74E8
gUnknown_080D74E8:
    .incbin "baserom.gba", 0x000D74E8, 0x20

    .global gCourseIndexToLevelIndex
gCourseIndexToLevelIndex:
    .incbin "baserom.gba", 0x000D7508, 0x10
