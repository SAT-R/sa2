	.section .rodata

@; Not really sure why this is here
    .global gUnknown_08CD0728
gUnknown_08CD0728:
    .incbin "multi_boot/programs/subgame_loader/subgame_loader.bin.lz"

    .global gMultiBootProgram_SubgameLoader
gMultiBootProgram_SubgameLoader:
    .incbin "multi_boot/subgame_bootstrap/subgame_bootstrap.gba"
