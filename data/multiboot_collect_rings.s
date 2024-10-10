.include "asm/macros/c_decl.inc"
.include "asm/macros/portable.inc"

mSectionRodata
 
.align 2

;@ collect_rings tilemaps
    .global C_DECL(gCollectRingsTilemaps)
C_DECL(gCollectRingsTilemaps:)
    .incbin "multi_boot/collect_rings_assets/tilemaps.bin"

;@ bg map tileset
    .global C_DECL(gCollectRingsBgStageTileset)
C_DECL(gCollectRingsBgStageTileset):
    .incbin "multi_boot/collect_rings_assets/maps/stage_tiles.4bpp" ;@ CollectRingsTilemaps + 0x9E00

;@ these might all include the animation scripts

;@ compressed obj tiles (unused) possibly because they are not needed
;@ when the player with the PAK is always sonic so already has these animations
    .global C_DECL(gCollectRingsAnimations_Unused_Compressed)
C_DECL(gCollectRingsAnimations_Unused_Compressed):
    .incbin "multi_boot/collect_rings_assets/animations_sonic.bin.lz"

    .global C_DECL(gCollectRingsAnimations_Cream_Compressed)
C_DECL(gCollectRingsAnimations_Cream_Compressed):
    .incbin "multi_boot/collect_rings_assets/animations_cream.bin.lz"

    .global C_DECL(gCollectRingsAnimations_Tails_Compressed)
C_DECL(gCollectRingsAnimations_Tails_Compressed):
    .incbin "multi_boot/collect_rings_assets/animations_tails.bin.lz"

    .global C_DECL(gCollectRingsAnimations_Knuckles_Compressed)
C_DECL(gCollectRingsAnimations_Knuckles_Compressed):
    .incbin "multi_boot/collect_rings_assets/animations_knuckles.bin.lz"

    .global C_DECL(gCollectRingsRom_Compressed)
C_DECL(gCollectRingsRom_Compressed):
    .incbin "multi_boot/collect_rings/mb_signed_collect_rings.gba.lz"
