.include "../../asm/macros/function.inc"
.include "../../constants/gba_constants.inc"

.section .rodata

    .global gSubgameLoaderRom
gSubgameLoaderRom: @ 0x20001B0
	.incbin "../roms/subgame_loader/subgame_loader.gba"
