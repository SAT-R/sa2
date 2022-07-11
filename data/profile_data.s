.section .rodata

    .global sMenuCursorMoveAnims
sMenuCursorMoveAnims:
    .incbin "baserom.gba", 0x000D9540, 0x10

    .global sSubMenuOpenAnimFrames
sSubMenuOpenAnimFrames:
    .incbin "baserom.gba", 0x000D9550, 0x20

    .global sSubMenuCloseAnimFrames
sSubMenuCloseAnimFrames:
    .incbin "baserom.gba", 0x000D9570, 0x20

    .global sTimeRecordsCharacterBackgrounds
sTimeRecordsCharacterBackgrounds:
    .incbin "baserom.gba", 0x000D9590, 0x14

    .global gUnknown_080D95A4
gUnknown_080D95A4:
    .incbin "baserom.gba", 0x000D95A4, 0x20

    .global gUnknown_080D95C4
gUnknown_080D95C4:
    .incbin "baserom.gba", 0x000D95C4, 0x4

    .global gUnknown_080D95C8
gUnknown_080D95C8:
    .incbin "baserom.gba", 0x000D95C8, 0xA

    .global gUnknown_080D95D2
gUnknown_080D95D2:
    .incbin "baserom.gba", 0x000D95D2, 0x4

    .global gUnknown_080D95D6
gUnknown_080D95D6:
    .incbin "baserom.gba", 0x000D95D6, 0x12

    .global sOptionsScreenTitleText
sOptionsScreenTitleText:
    .incbin "baserom.gba", 0x000D95E8, 0x30

    .global sOptionsScreenMenuItemsText
sOptionsScreenMenuItemsText:
    .incbin "baserom.gba", 0x000D9618, 0x180

    .global sDifficultyLevelSwitchValues
sDifficultyLevelSwitchValues:
    .incbin "baserom.gba", 0x000D9798, 0x60

    .global sTimeLimitMenuSwitchValues
sTimeLimitMenuSwitchValues:
    .incbin "baserom.gba", 0x000D97F8, 0x60

    .global sOptionsScreenSelectedLanguageText
sOptionsScreenSelectedLanguageText:
    .incbin "baserom.gba", 0x000D9858, 0x30

    .global sDifficultyMenuTitleText
sDifficultyMenuTitleText:
    .incbin "baserom.gba", 0x000D9888, 0x30

    .global sDifficultyMenuControlsText
sDifficultyMenuControlsText:
    .incbin "baserom.gba", 0x000D98B8, 0x30

    .global sTimeLimitMenuTitleText
sTimeLimitMenuTitleText:
    .incbin "baserom.gba", 0x000D98E8, 0x30

    .global sTimeLimitMenuControlsText
sTimeLimitMenuControlsText:
    .incbin "baserom.gba", 0x000D9918, 0x30

    .global sButtonConfigTitleAndControlsText
sButtonConfigTitleAndControlsText:
    .incbin "baserom.gba", 0x000D9948, 0x90

    .global sButtonConfigButtonIcons
sButtonConfigButtonIcons:
    .incbin "baserom.gba", 0x000D99D8, 0x18

    .global sButtonConfigActionsText
sButtonConfigActionsText:
    .incbin "baserom.gba", 0x000D99F0, 0x90

    .global sLanguageScreenTitles
sLanguageScreenTitles:
    .incbin "baserom.gba", 0x000D9A80, 0x30

    .global sLanguageScreenEditControlsText
sLanguageScreenEditControlsText:
    .incbin "baserom.gba", 0x000D9AB0, 0x30

    .global sLanguageScreenNewControlsText
sLanguageScreenNewControlsText:
    .incbin "baserom.gba", 0x000D9AE0, 0x30

    .global sLanguageScreenOptionsText
sLanguageScreenOptionsText:
    .incbin "baserom.gba", 0x000D9B10, 0x30

    .global sDeleteScreenConfirmTitleText
sDeleteScreenConfirmTitleText:
    .incbin "baserom.gba", 0x000D9B40, 0x30

    .global sDeleteScreenAbsoluteConfirmTitleText
sDeleteScreenAbsoluteConfirmTitleText:
    .incbin "baserom.gba", 0x000D9B70, 0x30

    .global sDeleteScreenControlsText
sDeleteScreenControlsText:
    .incbin "baserom.gba", 0x000D9BA0, 0x30

    .global sDeleteScreenOptionsText
sDeleteScreenOptionsText:
    .incbin "baserom.gba", 0x000D9BD0, 0x60

    .global sPlayerDataMenuTitleText
sPlayerDataMenuTitleText:
    .incbin "baserom.gba", 0x000D9C30, 0x30

    .global sPlayerDataMenuControlsText
sPlayerDataMenuControlsText:
    .incbin "baserom.gba", 0x000D9C60, 0x30

    .global sPlayerDataMenuItemsText
sPlayerDataMenuItemsText:
    .incbin "baserom.gba", 0x000D9C90, 0xC0

    .global sProfileNameScreenNewTitleText
sProfileNameScreenNewTitleText:
    .incbin "baserom.gba", 0x000D9D50, 0x30

    .global sProfileNameScreenEditTitleText
sProfileNameScreenEditTitleText:
    .incbin "baserom.gba", 0x000D9D80, 0x30

    .global sProfileNameScreenArrowTiles
sProfileNameScreenArrowTiles:
    .incbin "baserom.gba", 0x000D9DB0, 0x10

    .global sProfileNameScreenEndButtonText
sProfileNameScreenEndButtonText:
    .incbin "baserom.gba", 0x000D9DC0, 0x30

    .global sProfileNameScreenScrollArrowTiles
sProfileNameScreenScrollArrowTiles:
    .incbin "baserom.gba", 0x000D9DF0, 0x10

    .global sMultiplayerRecordsTitleAndColumnHeadersText
sMultiplayerRecordsTitleAndColumnHeadersText:
    .incbin "baserom.gba", 0x000D9E00, 0x60

    .global sMultiplayerScoreDigitTiles
sMultiplayerScoreDigitTiles:
    .incbin "baserom.gba", 0x000D9E60, 0x50

    .global sTimeRecordsChoiceViewTitles
sTimeRecordsChoiceViewTitles:
    .incbin "baserom.gba", 0x000D9EB0, 0x30

    .global sTimeRecordsScreenChoices
sTimeRecordsScreenChoices:
    .incbin "baserom.gba", 0x000D9EE0, 0x60

    .global sTimeRecordsZoneActTitleDigits
sTimeRecordsZoneActTitleDigits:
    .incbin "baserom.gba", 0x000D9F40, 0x38

    .global sTimeRecordDigitTiles
sTimeRecordDigitTiles:
    .incbin "baserom.gba", 0x000D9F78, 0x58

    .global sZoneNameTitles
sZoneNameTitles:
    .incbin "baserom.gba", 0x000D9FD0, 0x150

    .global sZoneBossTitles
sZoneBossTitles:
    .incbin "baserom.gba", 0x000DA120, 0x5548
