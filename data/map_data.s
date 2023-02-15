	.section .rodata

@ TODO: Include as much data in C files as possible

@ NOTE: Sometimes in the codebase, there is pointers to inside the tileset data.
@       Set these pointers to:
@           (<Beginning_of_Tileset> + (tile_count * TILE_SIZE_4BPP))


@ NOTE: For some reason each level (except for the dummies) has a different tileset, even those that are visually identical.
@       Palettes are also stored as copies of each level.
@       We will just include the same file in those instances, unless there is actually a difference of course.
@       It is something to keep in mind in case one wants to port the game to other platforms down the line.

@
@  --- Leaf Forest ---
@

    .global Palette_Tileset_Stage_LeafForest_Act1
Palette_Tileset_Stage_LeafForest_Act1: @ 0x086E9E08
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset.gbapal"
.size Palette_Tileset_Stage_LeafForest_Act1, .-Palette_Tileset_Stage_LeafForest_Act1

    .global Tileset_Stage_LeafForest_Act1
Tileset_Stage_LeafForest_Act1: @ 0x086EA008
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset_act1.4bpp"
.size Tileset_Stage_LeafForest_Act1, .-Tileset_Stage_LeafForest_Act1

    .global gUnknown_086F12A8
gUnknown_086F12A8: @ 0x086F12A8
    .incbin "baserom.gba", 0x6F12A8, 0x1CA8

    .global gUnknown_086F2F50
gUnknown_086F2F50:
    .incbin "baserom.gba", 0x006F2F50, 0x398

    .global gUnknown_086F32E8
gUnknown_086F32E8:
    .incbin "baserom.gba", 0x006F32E8, 0xE8
     
    .global Metatiles_Stage_LeafForest
Metatiles_Stage_LeafForest: @ 0x086F33D0
    .incbin "graphics/tilesets/zones/1_leaf_forest/metatiles.raw"

@
@ --- Leaf Forest - Act 1 ---
@

    .global Map_Stage_LeafForest_Act1_FrontLayer
Map_Stage_LeafForest_Act1_FrontLayer: @ 0x0870DE30
    .incbin "data/maps/zone1/act1/map_front.raw"
.size Map_Stage_LeafForest_Act1_FrontLayer,.-Map_Stage_LeafForest_Act1_FrontLayer
          
    .global Map_Stage_LeafForest_Act1_BackLayer
Map_Stage_LeafForest_Act1_BackLayer:
    .incbin "data/maps/zone1/act1/map_back.raw"
.size Map_Stage_LeafForest_Act1_BackLayer,.-Map_Stage_LeafForest_Act1_BackLayer

    .global MapHeader_LeafForest_Act1_FrontLayer
MapHeader_LeafForest_Act1_FrontLayer: @ 0x08714530
    .incbin "baserom.gba", 0x00714530, 0x24
    
    .global MapHeader_LeafForest_Act1_BackLayer
MapHeader_LeafForest_Act1_BackLayer: @ 0x08714554
    .incbin "baserom.gba", 0x00714554, 0x24

    .global gUnknown_08714578
gUnknown_08714578:
    .4byte gUnknown_086F12A8, gUnknown_086F2F50
    .4byte Metatiles_Stage_LeafForest, Map_Stage_LeafForest_Act1_FrontLayer
    .4byte Map_Stage_LeafForest_Act1_BackLayer, gUnknown_086F32E8

    .global gUnknown_08714590
gUnknown_08714590: @ 0x08714590
    .incbin "baserom.gba", 0x00714590, 0xC

@
@ --- Leaf Forest - Act 2 ---
@

    .global Palette_Tileset_Stage_LeafForest_Act2
Palette_Tileset_Stage_LeafForest_Act2: @ 0x0871459C
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset.gbapal"
.size Palette_Tileset_Stage_LeafForest_Act2, .-Palette_Tileset_Stage_LeafForest_Act2

    .global Tileset_Stage_LeafForest_Act2
Tileset_Stage_LeafForest_Act2: @ 0x0871479C
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset_act2.4bpp"
.size Tileset_Stage_LeafForest_Act2, .-Tileset_Stage_LeafForest_Act2

    .global gUnknown_0871B4DC
gUnknown_0871B4DC: @ 0x0871B4DC
    .incbin "baserom.gba", 0x0071B4DC, 0x3B279C
