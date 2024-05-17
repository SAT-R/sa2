.include "asm/macros/c_decl.inc"

.section .rodata

@; Not really sure why this is here
    .global C_DECL(gUnknown_08CD0728)
C_DECL(gUnknown_08CD0728):
    .incbin "multi_boot/programs/subgame_loader/subgame_loader.bin.lz"

    .global C_DECL(gMultiBootProgram_SubgameLoader)
C_DECL(gMultiBootProgram_SubgameLoader):
    .incbin "multi_boot/subgame_bootstrap/subgame_bootstrap.gba"

    .global C_DECL(gMultiBootProgram_SubgameLoaderEnd)
C_DECL(gMultiBootProgram_SubgameLoaderEnd):
