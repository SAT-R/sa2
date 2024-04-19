	.section .rodata
 
     .align 2
;@ collect_rings tilemaps
    .global gCollectRingsTilemaps
gCollectRingsTilemaps:
    .incbin "baserom.gba", 0x00C88408, 0x8000 

// it also includes some of the end of the tile maps (I think?)
;@ obj_vram
    .global gCollectRingsTextTiles
gCollectRingsTextTiles:
    .incbin "multi_boot/roms/collect_rings/graphics/obj_tiles/4bpp/text.4bpp" ;@ This is potentially 0x1B10 instead of 0x1E00

;@ if the above is 0x1B10 then the below would be:
;@ 0x8C91f18 -> 0x8C92208 = 0x2f0 potentially some pointers/rodata, not sure

;@ bg map tileset
    .global gCollectRingsBgStageTileset
gCollectRingsBgStageTileset:
    .incbin "multi_boot/roms/collect_rings/data/tilemaps/stage_tiles.4bpp"

;@ these might all include the animation scripts

;@ compressed obj tiles
    .global gCollectRingsAnimationTiles_Compressed
gCollectRingsAnimationTiles_Compressed:
    .incbin "multi_boot/roms/collect_rings/graphics/obj_tiles/4bpp/animations.4bpp.lz"

;@ compressed obj tiles
    .global gCollectRings_ObjTiles_1
gCollectRings_ObjTiles_1:
    .incbin "baserom.gba", 0x00CA6760, 0x6A7C

;@ compressed obj tiles
    .global gCollectRings_ObjTiles_2
gCollectRings_ObjTiles_2:
    .incbin "baserom.gba", 0x00CAD1DC, 0x6fe4

;@ compressed obj tiles
    .global gCollectRings_ObjTiles_3
gCollectRings_ObjTiles_3:
    .incbin "baserom.gba", 0x00CB41C0, 0x6a44

    .global gCollectRingsRom_Compressed
gCollectRingsRom_Compressed:
    .incbin "multi_boot/collect_rings/mb_signed_collect_rings.gba.lz"
