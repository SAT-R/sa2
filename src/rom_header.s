.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

_entry: @ 0x08000000
	b start_vector

	@ These will be set by gbafix
	
	.global RomHeaderNintendoLogo
RomHeaderNintendoLogo:
	.space 0x9c

RomHeaderGameTitle:
	.space 12

RomHeaderGameCode:
	.4byte 0

RomHeaderMakerCode:
	.2byte 0

RomHeaderMagic:
	.byte 0x96

RomHeaderMainUnitCode:
	.byte 0

RomHeaderDeviceType:
	.byte 0

RomHeaderReserved1:
	.space 7

RomHeaderSoftwareVersion:
	.byte 0

RomHeaderChecksum:
	.byte 0

RomHeaderReserved2:
	.space 2
