.include "constants/constants.inc"
.include "asm/macros.inc"

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

@
@ --- Leaf Forest - Act 1 ---
@

    .global Palette_Stage_LeafForest_Act1
Palette_Stage_LeafForest_Act1: @ 0x086E9E08
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset.gbapal"
    mDataSize Palette_Stage_LeafForest_Act1

    .global Tileset_Stage_LeafForest_Act1
Tileset_Stage_LeafForest_Act1: @ 0x086EA008
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset_act1.4bpp"
    mDataSize Tileset_Stage_LeafForest_Act1

    .align 2 , 0
    .global gUnknown_086F12A8
gUnknown_086F12A8: @ 0x086F12A8
    .incbin "data/maps/zone1/act1/gUnknown_086F12A8.bin"
    mDataSize gUnknown_086F12A8

    .align 2 , 0
    .global gUnknown_086F2F50
gUnknown_086F2F50:
    .incbin "data/maps/zone1/act1/gUnknown_086F2F50.bin"
    mDataSize gUnknown_086F2F50
    
    .align 2 , 0
    .global gUnknown_086F32E8
gUnknown_086F32E8:
    .incbin "data/maps/zone1/act1/gUnknown_086F32E8.bin"
    mDataSize gUnknown_086F32E8
     
    .global Metatiles_Stage_LeafForest_Act1
Metatiles_Stage_LeafForest_Act1: @ 0x086F33D0
    .incbin "data/maps/zone1/act1/metatiles.bin"
    mDataSize Metatiles_Stage_LeafForest_Act1

    .global Map_Stage_LeafForest_Act1_FrontLayer
Map_Stage_LeafForest_Act1_FrontLayer: @ 0x0870DE30
    .incbin "data/maps/zone1/act1/map_front.bin"
    mDataSize Map_Stage_LeafForest_Act1_FrontLayer
          
    .global Map_Stage_LeafForest_Act1_BackLayer
Map_Stage_LeafForest_Act1_BackLayer: @ 0x087111B0
    .incbin "data/maps/zone1/act1/map_back.bin"
    mDataSize Map_Stage_LeafForest_Act1_BackLayer

    .global MapHeader_LeafForest_Act1_FrontLayer
MapHeader_LeafForest_Act1_FrontLayer: @ 0x08714530
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Act1, 0x72A0, Palette_Stage_LeafForest_Act1, 0, 0x100, Metatiles_Stage_LeafForest_Act1, Map_Stage_LeafForest_Act1_FrontLayer, 206, 32
    mDataSize MapHeader_LeafForest_Act1_FrontLayer

    .global MapHeader_LeafForest_Act1_BackLayer
MapHeader_LeafForest_Act1_BackLayer: @ 0x08714554
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Act1, 0x72A0, Palette_Stage_LeafForest_Act1, 0, 0x100, Metatiles_Stage_LeafForest_Act1, Map_Stage_LeafForest_Act1_BackLayer, 206, 32
    mDataSize MapHeader_LeafForest_Act1_BackLayer

    .global gUnknown_08714578
gUnknown_08714578:
    .4byte gUnknown_086F12A8, gUnknown_086F2F50
    .4byte Metatiles_Stage_LeafForest_Act1, Map_Stage_LeafForest_Act1_FrontLayer
    .4byte Map_Stage_LeafForest_Act1_BackLayer, gUnknown_086F32E8
    .2byte 206, 32 @ Level Dimensions
    .byte   64, 77, 0, 0 @ TODO: not sure about this being .byte
    .2byte 0x0C00, 0x0000
    mDataSize gUnknown_08714578

@
@ --- Leaf Forest - Act 2 ---
@

    .global Palette_Stage_LeafForest_Act2
Palette_Stage_LeafForest_Act2: @ 0x0871459C
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset.gbapal"
    mDataSize Palette_Stage_LeafForest_Act2

    .global Tileset_Stage_LeafForest_Act2
Tileset_Stage_LeafForest_Act2: @ 0x0871479C
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset_act2.4bpp"
    mDataSize Tileset_Stage_LeafForest_Act2

    .global gUnknown_0871B4DC
gUnknown_0871B4DC: @ 0x0871B4DC
    .incbin "data/maps/zone1/act2/gUnknown_0871B4DC.bin"
    mDataSize gUnknown_0871B4DC
    
    .global gUnknown_0871D02C
gUnknown_0871D02C: @ 0x0871D02C
    .incbin "data/maps/zone1/act2/gUnknown_0871D02C.bin"
    mDataSize gUnknown_0871D02C
        
    .global gUnknown_0871D398
gUnknown_0871D398: @ 0x0871D398
    .incbin "data/maps/zone1/act2/gUnknown_0871D398.bin"
    mDataSize gUnknown_0871D398
    
    .global Metatiles_Stage_LeafForest_Act2
Metatiles_Stage_LeafForest_Act2: @ 0x0871D474
    .incbin "data/maps/zone1/act2/metatiles.bin"
    mDataSize Metatiles_Stage_LeafForest_Act2

    .global Map_Stage_LeafForest_Act2_FrontLayer
Map_Stage_LeafForest_Act2_FrontLayer: @ 0x087352F4
    .incbin "data/maps/zone1/act2/map_front.bin"
    
    .global Map_Stage_LeafForest_Act2_BackLayer
Map_Stage_LeafForest_Act2_BackLayer: @ 0x08737B60
    .incbin "data/maps/zone1/act2/map_back.bin"

    .global MapHeader_LeafForest_Act2_FrontLayer
MapHeader_LeafForest_Act2_FrontLayer: @ 0x0873A3CC
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Act2, 0x6D40, Palette_Stage_LeafForest_Act2, 0, 0x100, Metatiles_Stage_LeafForest_Act2, Map_Stage_LeafForest_Act2_FrontLayer, 199, 26
    mDataSize MapHeader_LeafForest_Act2_FrontLayer

    .global MapHeader_LeafForest_Act2_BackLayer
MapHeader_LeafForest_Act2_BackLayer: @ 0x0873A3F0
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Act2, 0x6D40, Palette_Stage_LeafForest_Act2, 0, 0x100, Metatiles_Stage_LeafForest_Act2, Map_Stage_LeafForest_Act2_BackLayer, 199, 26
    mDataSize MapHeader_LeafForest_Act2_BackLayer

    .global gUnknown_0873A414
gUnknown_0873A414: @ 0x0873A414
    .4byte gUnknown_0871B4DC, gUnknown_0871D02C
    .4byte Metatiles_Stage_LeafForest_Act2, Map_Stage_LeafForest_Act2_FrontLayer
    .4byte Map_Stage_LeafForest_Act2_BackLayer, gUnknown_0871D398
    .2byte 199, 26 @ Level Dimensions
    .byte  160, 74, 0, 0 @ TODO: not sure about this being .byte
    .2byte 0x09C0, 0x0000
    mDataSize gUnknown_0873A414


@
@ --- Leaf Forest - Boss ---
@

    .global Palette_Stage_LeafForest_Boss
Palette_Stage_LeafForest_Boss: @ 0x0873A438
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset.gbapal"
    mDataSize Palette_Stage_LeafForest_Boss

    .global Tileset_Stage_LeafForest_Boss
Tileset_Stage_LeafForest_Boss: @ 0x0873A638
    .incbin "graphics/tilesets/zones/1_leaf_forest/tileset_boss.4bpp"
    mDataSize Tileset_Stage_LeafForest_Boss

    .global gUnknown_0873B438
gUnknown_0873B438: @ 0x0873B438
    .incbin "data/maps/zone1/boss/gUnknown_0873B438.bin"
    mDataSize gUnknown_0873B438
    
    .global gUnknown_0873B7B8
gUnknown_0873B7B8: @ 0x0873B7B8
    .incbin "data/maps/zone1/boss/gUnknown_0873B7B8.bin"
    mDataSize gUnknown_0873B7B8
        
    .global gUnknown_0873B828
gUnknown_0873B828: @ 0x0873B828
    .incbin "data/maps/zone1/boss/gUnknown_0873B828.bin"
    mDataSize gUnknown_0873B828
    
    .global Metatiles_Stage_LeafForest_Boss
Metatiles_Stage_LeafForest_Boss: @ 0x0873B844
    .incbin "data/maps/zone1/boss/metatiles.bin"
    mDataSize Metatiles_Stage_LeafForest_Boss

    .global Map_Stage_LeafForest_Boss_FrontLayer
Map_Stage_LeafForest_Boss_FrontLayer: @ 0x0873BDE4
    .incbin "data/maps/zone1/boss/map_front.bin"
    mDataSize Map_Stage_LeafForest_Boss_FrontLayer
    
    .global Map_Stage_LeafForest_Boss_BackLayer
Map_Stage_LeafForest_Boss_BackLayer: @ 0x0873BF4C
    .incbin "data/maps/zone1/boss/map_back.bin"
    mDataSize Map_Stage_LeafForest_Boss_BackLayer

    .global MapHeader_LeafForest_Boss_FrontLayer
MapHeader_LeafForest_Boss_FrontLayer: @ 0x0873C0B4
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Boss, 0x0E00, Palette_Stage_LeafForest_Boss, 0, 0x100, Metatiles_Stage_LeafForest_Boss, Map_Stage_LeafForest_Boss_FrontLayer, 60, 3
    mDataSize MapHeader_LeafForest_Boss_FrontLayer

    .global MapHeader_LeafForest_Boss_BackLayer
MapHeader_LeafForest_Boss_BackLayer: @ 0x0873C0D8
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Boss, 0x0E00, Palette_Stage_LeafForest_Boss, 0, 0x100, Metatiles_Stage_LeafForest_Boss, Map_Stage_LeafForest_Boss_BackLayer, 60, 3
    mDataSize MapHeader_LeafForest_Boss_BackLayer

    .global gUnknown_0873C0FC
gUnknown_0873C0FC: @ 0x0873C0FC
    .4byte gUnknown_0873B438, gUnknown_0873B7B8
    .4byte Metatiles_Stage_LeafForest_Boss, Map_Stage_LeafForest_Boss_FrontLayer
    .4byte Map_Stage_LeafForest_Boss_BackLayer, gUnknown_0873B828
    .2byte 60, 3 @ Level Dimensions
    .byte  128, 22, 0, 0 @ TODO: not sure about this being .byte
    .2byte 0x0120, 0x0000
    mDataSize gUnknown_0873C0FC

@
@ --- Dummy Map ---
@

@ MapHeaders, not part of the file itself (starting @ 0x080D5CE4)
@   0x08714530 0x08714554 0x08935224  @ Leaf Forest Act 1
@   0x0873A3CC 0x0873A3F0 0x08935224  @ Leaf Forest Act 2
@   0x0873C0B4 0x0873C0D8 0x08935224  @ Leaf Forest Boss
@   0x0873CC44 0x0873CC68 0x0894E04C  @ Dummy

@   0x08763A34 0x08763A58 0x0894158C  @ Hot Crater Act 1
@   0x0878FE50 0x0878FE74 0x0894158C  @ Hot Crater Act 2
@   0x08792730 0x08792754 0x0894158C  @ Hot Crater Boss
@   0x0873CC44 0x0873CC68 0x08935224  @ Dummy
@   0x087B8E14 0x087B8E38 0x0893805C  @ Music Plant Act 1
@   0x087DB730 0x087DB754 0x0893805C  @ Music Plant Act 2
@   0x087DCB1C 0x087DCB40 0x0893805C  @ Music Plant Boss
@   0x0873CC44 0x0873CC68 0x0893805C  @ Dummy 
@   0x0880C528 0x0880C54C 0x0893BBF4  @ Ice Paradise Act 1
@   0x088343E4 0x08834408 0x0893BBF4  @ Ice Paradise Act 2
@   0x08835D70 0x08835D94 0x0893BBF4  @ Ice Paradise Boss
@   0x0873CC44 0x0873CC68 0x0893BBF4  @ Dummy 
@   0x0885DB08 0x0885DB2C 0x08944B84  @ Sky Canyon Act 1
@   0x08885A48 0x08885A6C 0x08944B84  @ Sky Canyon Act 2
@   0x0888768C 0x088876B0 0x08944B84  @ Sky Canyon Boss
@   0x0873CC44 0x0873CC68 0x08944B84  @ Dummy 
@   0x088A9128 0x088A914C 0x08949418  @ Techno Base Act 1
@   0x088C2630 0x088C2654 0x08949418  @ Techno Base Act 2
@   0x088C56B8 0x088C56DC 0x08949418  @ Techno Base Boss
@   0x0873CC44 0x0873CC68 0x08949418  @ Dummy 
@   0x088F7D64 0x088F7D88 0x08947EFC  @ Egg Utopia Act 1
@   0x08924E14 0x08924E38 0x08947EFC  @ Egg Utopia Act 2
@   0x08925C84 0x08925CA8 0x08947EFC  @ Egg Utopia Boss
@   0x0873CC44 0x0873CC68 0x08947EFC  @ Dummy 
@   0x0892ECE0 0x0892ED04 0x0894E04C  @ Final Zone - XX
@   0x0892F4D4 0x0892F4F8 0x08950508  @ True Area 53
@   0x08933538 0x0893355C 0x089520C4  @ Leftover - w/out tileset


.incbin "baserom.gba", 0x0073C120, (0x00958E00-0x0073C120)


@ >> 0x08958E00
