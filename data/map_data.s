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

    .global gUnknown_086F12A8
gUnknown_086F12A8: @ 0x086F12A8
    .incbin "data/maps/zone1/act1/gUnknown_086F12A8.raw"
    mDataSize gUnknown_086F12A8

    .global gUnknown_086F2F50
gUnknown_086F2F50:
    .incbin "data/maps/zone1/act1/gUnknown_086F2F50.raw"
    mDataSize gUnknown_086F2F50

    .global gUnknown_086F32E8
gUnknown_086F32E8:
    .incbin "data/maps/zone1/act1/gUnknown_086F32E8.raw"
    mDataSize gUnknown_086F32E8
     
    .global Metatiles_Stage_LeafForest_Act1
Metatiles_Stage_LeafForest_Act1: @ 0x086F33D0
    .incbin "data/maps/zone1/act1/metatiles.raw"
    mDataSize Metatiles_Stage_LeafForest_Act1

    .global Map_Stage_LeafForest_Act1_FrontLayer
Map_Stage_LeafForest_Act1_FrontLayer: @ 0x0870DE30
    .incbin "data/maps/zone1/act1/map_front.raw"
    mDataSize Map_Stage_LeafForest_Act1_FrontLayer
          
    .global Map_Stage_LeafForest_Act1_BackLayer
Map_Stage_LeafForest_Act1_BackLayer:
    .incbin "data/maps/zone1/act1/map_back.raw"
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
    .incbin "data/maps/zone1/act2/gUnknown_0871B4DC.raw"
    mDataSize gUnknown_0871B4DC
    
    .global gUnknown_0871D02C
gUnknown_0871D02C: @ 0x0871D02C
    .incbin "data/maps/zone1/act2/gUnknown_0871D02C.raw"
    mDataSize gUnknown_0871D02C
        
    .global gUnknown_0871D398
gUnknown_0871D398: @ 0x0871D398
    .incbin "data/maps/zone1/act2/gUnknown_0871D398.raw"
    mDataSize gUnknown_0871D398
    
    .global Metatiles_Stage_LeafForest_Act2
Metatiles_Stage_LeafForest_Act2: @ 0x0871D474
    .incbin "data/maps/zone1/act2/metatiles.raw"
    mDataSize Metatiles_Stage_LeafForest_Act2

    .global Map_Stage_LeafForest_Act2_FrontLayer
Map_Stage_LeafForest_Act2_FrontLayer: @ 0x087352F4
    .incbin "data/maps/zone1/act2/map_front.raw"
    
    .global Map_Stage_LeafForest_Act2_BackLayer
Map_Stage_LeafForest_Act2_BackLayer: @ 0x08737B60
    .incbin "data/maps/zone1/act2/map_back.raw"

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
    .incbin "data/maps/zone1/boss/gUnknown_0873B438.raw"
    mDataSize gUnknown_0873B438
    
    .global gUnknown_0873B7B8
gUnknown_0873B7B8: @ 0x0873B7B8
    .incbin "data/maps/zone1/boss/gUnknown_0873B7B8.raw"
    mDataSize gUnknown_0873B7B8
        
    .global gUnknown_0873B828
gUnknown_0873B828: @ 0x0873B828
    .incbin "data/maps/zone1/boss/gUnknown_0873B828.raw"
    mDataSize gUnknown_0873B828
    
    .global Metatiles_Stage_LeafForest_Boss
Metatiles_Stage_LeafForest_Boss: @ 0x0873B844
    .incbin "data/maps/zone1/boss/metatiles.raw"
    mDataSize Metatiles_Stage_LeafForest_Boss

    .global Map_Stage_LeafForest_Boss_FrontLayer
Map_Stage_LeafForest_Boss_FrontLayer: @ 0x0873BDE4
    .incbin "data/maps/zone1/boss/map_front.raw"
    mDataSize Map_Stage_LeafForest_Boss_FrontLayer
    
    .global Map_Stage_LeafForest_Boss_BackLayer
Map_Stage_LeafForest_Boss_BackLayer: @ 0x0873BF4C
    .incbin "data/maps/zone1/boss/map_back.raw"
    mDataSize Map_Stage_LeafForest_Boss_BackLayer

    .global MapHeader_LeafForest_Boss_FrontLayer
MapHeader_LeafForest_Boss_FrontLayer: @ 0x0873C0B4
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Boss, 0x0E00, Palette_Stage_LeafForest_Boss, 0, 0x100, Metatiles_Stage_LeafForest_Boss, Map_Stage_LeafForest_Boss_FrontLayer, 60, 3
    mDataSize MapHeader_LeafForest_Boss_FrontLayer

    .global MapHeader_LeafForest_Boss_BackLayer
MapHeader_LeafForest_Boss_BackLayer: @ 0x0873C0D8
    MapHeader METATILE_WIDTH, METATILE_HEIGHT, 0, 0, 0, Tileset_Stage_LeafForest_Boss, 0x0E00, Palette_Stage_LeafForest_Boss, 0, 0x100, Metatiles_Stage_LeafForest_Boss, Map_Stage_LeafForest_Boss_BackLayer, 60, 3
    mDataSize MapHeader_LeafForest_Boss_BackLayer

    .global gUnknown_087C0FC
gUnknown_087C0FC: @ 0x087C0FC
    .4byte gUnknown_0873B438, gUnknown_0873B7B8
    .4byte Metatiles_Stage_LeafForest_Boss, Map_Stage_LeafForest_Boss_FrontLayer
    .4byte Map_Stage_LeafForest_Boss_BackLayer, gUnknown_0873B828
    .2byte 60, 3 @ Level Dimensions
    .byte  128, 22, 0, 0 @ TODO: not sure about this being .byte
    .2byte 0x0120, 0x0000
    mDataSize gUnknown_087C0FC

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

@ Unknown Graphics Data Pointers
@  >> Start: @ 0x80D5E58
@   00000000 080E8DF4 080F1800 
@   080F2EAC 080F40B8 08954330 
@   0895501C 08957440 08957CCC 
@   08958558 08958DE4 08959670 
@   0895E4AC 08982628 0895EF08 
@   0895F5F4 08962A54 08963490 
@   08963ECC 089DCCBC 089362C0 
@   0897DBE0 0897E5AC 08967DA8 
@   0896BD04 0896FBC0 08973B9C 
@   08977B58 0897B9D4 0897F1A8 
@   0897F894 0897FE48 08980348 
@   089810E4 089D47E4 089D5F70 
@   089D779C 089D9168 089DAA34 
@   089DC280 08995ADC 08997FAC 
@   08995250 08994724 0898F338 
@   08996E54 0899E530 089983B8 
@   08999324 08999730 0899A53C 
@   0899A948 0899B934 0899BD40 
@   0899CC0C 0899D018 0899DE44 
@   089DD218 089DD924 089977A0 
@   089A434C 089A5868 089AAE44 
@   089AD6E0 089B2D3C 089B4DF8 
@   089BA514 089BBA30 089C124C 
@   089C3AC8 089C9D24 089CBDE0 
@   089D107C 089D30D8 0894A274 
@   0894AE50 089DE480 08ACDC5C 
@   08A41A3C 08A48D44 08A4C6AC 
@   08A528C0 08A59804 08A5D8B0 
@   08A6107C 08A64768 08A685D4 
@   08A6A144 08A7ECBC 08A6BFB0 
@   08A70CE8 08A75CC0 08A7A298 
@   08A83674 08A9A5CC 08A8816C 
@   08A8AEC4 08A906DC 08A95994 
@   08A9F124 08AB75FC 08AA455C 
@   08AA8F34 08AAE04C 08AB2D64 
@   08ABBC38 08A427DC 08AC1090 
@   08AC5EE8 08AC93B4 08A3D474 
@   08A49D84 08A63018 08A66C24 
@   08A5BFA0 08A5F3CC 089454E0 
@   08A6E57C 08A73434 08A7834C 
@   08A7C984 08A81408 08A85D80 
@   08A8D990 08A93188 08A9D078 
@   08AA1BB0 08AA6CA8 08AAB6C0 
@   08AB0878 08AB5750 08ABA0E8 
@   08ABE724 08A98480 08AC343C 
@   08AC8074 08ACB660 08A3F460 
@   08A449C8 08A4FBF8 08A55E4C 
@   08A4AC10 08A50564 08A56AD8 
@   08A5CE0C 08A602F8 08A63D64 
@   08A67930 08A69480 08A6AE30 
@   08A6FB08 08A748E0 08A792F8 
@   08A7D990 08A82414 08A8704C 
@   08A89E64 08A8F3BC 08A948F4 
@   08A9948C 08A9DCC4 08AA355C 
@   08AA7BF4 08AACE0C 08AB1884 
@   08AB627C 08ABAAD8 08AC03D0 
@   089E3B9C 089E4978 089E5214 
@   089E80F4 089EB454 089ED8E0 
@   089F2EFC 089F9AB8 08A00D74 
@   089F0468 089F6D04 089FD9A0 
@   08A03ABC 08A0732C 089EE328 
@   089F3D24 089FA7C0 08A0195C 
@   08A04B8C 089EED70 089F478C 
@   089FB148 08A021A4 08A052B4 
@   089EF558 089F5994 089FBFD0 
@   08A02AEC 08A059DC 089EFBE0 
@   089F623C 089FCEF8 08A032D4 
@   08A06484 089F0B30 089F764C 
@   089FE9A8 08A04464 08A07C74 
@   08A0A140 08A0F8FC 08A162D8 
@   08A1BAF4 08A0CF48 08A136C4 
@   08A18D00 08A1EE3C 08A2284C 
@   08A0AD88 08A10604 08A16DA0 
@   08A1C6DC 08A1FEAC 08A0B6B0 
@   08A10F4C 08A175A8 08A1D024 
@   08A20614 08A0BFD8 08A11EB4 
@   08A17C90 08A1DCCC 08A20D3C 
@   08A0C820 08A12D3C 08A183F8 
@   08A1E594 08A218A4 08A0D810 
@   08A13FCC 08A19808 08A1F744 
@   08A23274 08A25760 08A29BBC 
@   08A30D38 08A36754 08A27368 
@   08A2DD84 08A337C0 08A3863C 
@   08A3BA0C 08A25E08 08A2AC44 
@   08A317A0 08A36EBC 08A3934C 
@   08A26330 08A2B64C 08A31FE8 
@   08A37464 08A39A74 08A26818 
@   08A2C0B4 08A32790 08A37A4C 
@   08A3A15C 08A26D40 08A2D17C 
@   08A32F38 08A37FB4 08A3AB04 
@   08A278F0 08A2ED6C 08A34368 
@   08A38C64 08A3C334 08983E94 
@   089393F8 08942648 0893C890 
@   08950508 08955AB8 08956BB4 
@   089851CC 089879C8 0898A244 
@   0898CAC0 0898EC2C 08947EFC
@ >> End: @ 0x080D62D8

    .incbin "baserom.gba", 0x0073C120, (0x00ACDC78-0x0073C120)


@ >> 0x08ACDC78
