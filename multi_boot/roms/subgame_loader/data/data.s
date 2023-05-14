.include "../../../asm/macros/function.inc"
.include "../../../constants/gba_constants.inc"

.section .rodata

    .global gSubgameLoader
gSubgameLoader: @ 0x2000370
	.incbin "../../programs/subgame_loader/subgame_loader.bin.lz"
