	.section .rodata
 
@ NOTE: Sometimes in the codebase, there is pointers to inside the tileset data.
@       Set these pointers to:
@           (<Beginning_of_Tileset> + (tile_count * TILE_SIZE_4BPP))

    .global Palette_Tileset_Stage_LeafForest
Palette_Tileset_Stage_LeafForest: @ 0x086E9E08
    .incbin "graphics/tilesets/zones/1_leaf_forest.gbapal"
.size Palette_Tileset_Stage_LeafForest, .-Palette_Tileset_Stage_LeafForest
    
    .global Tileset_Stage_LeafForest
Tileset_Stage_LeafForest: @ 0x086EA008
    .incbin "graphics/tilesets/zones/1_leaf_forest.4bpp"
.size Tileset_Stage_LeafForest, .-Tileset_Stage_LeafForest

    .incbin "baserom.gba", 0x6F12A8, 0x1CA8

    .global gUnknown_086F2F50
gUnknown_086F2F50:
    .incbin "baserom.gba", 0x006F2F50, 0x398

    .global gUnknown_086F32E8
gUnknown_086F32E8:
    .incbin "baserom.gba", 0x006F32E8, 0xE8
     
    .global gUnknown_086F33D0
gUnknown_086F33D0:
    .incbin "baserom.gba", 0x006F33D0, 0x1AA60
     
    .global gUnknown_0870DE30
gUnknown_0870DE30:
    .incbin "baserom.gba", 0x0070DE30, 0x3380
          
    .global gUnknown_087111B0
gUnknown_087111B0:
    .incbin "baserom.gba", 0x007111B0, 0x33C8

    .global gUnknown_08714578
gUnknown_08714578:
    .incbin "baserom.gba", 0x00714578, 0x3B9700
