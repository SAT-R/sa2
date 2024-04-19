	.section .rodata
 
     .align 2

;@ collect_rings tilemaps
    .global gCollectRingsTilemaps
gCollectRingsTilemaps:
    .incbin "multi_boot/collect_rings_assets/tilemaps.bin"

;@ bg map tileset
    .global gCollectRingsBgStageTileset
gCollectRingsBgStageTileset:
    .incbin "multi_boot/collect_rings_assets/maps/stage_tiles.4bpp" ;@ CollectRingsTilemaps + 0x9E00

;@ these might all include the animation scripts

;@ compressed obj tiles (unused) possibly because they are not needed
;@ when the player with the PAK is always sonic so already has these animations
    .global gCollectRingsAnimations_Unused_Compressed
gCollectRingsAnimations_Unused_Compressed:
    .incbin "multi_boot/collect_rings_assets/animations_sonic.bin.lz"

    .global gCollectRingsAnimations_Cream_Compressed
gCollectRingsAnimations_Cream_Compressed:
    .incbin "multi_boot/collect_rings_assets/animations_cream.bin.lz"

    .global gCollectRingsAnimations_Tails_Compressed
gCollectRingsAnimations_Tails_Compressed:
    .incbin "multi_boot/collect_rings_assets/animations_tails.bin.lz"

    .global gCollectRingsAnimations_Knuckles_Compressed
gCollectRingsAnimations_Knuckles_Compressed:
    .incbin "multi_boot/collect_rings_assets/animations_knuckles.bin.lz"

    .global gCollectRingsRom_Compressed
gCollectRingsRom_Compressed:
    .incbin "multi_boot/collect_rings/mb_signed_collect_rings.gba.lz"
