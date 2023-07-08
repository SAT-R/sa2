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


@.incbin "baserom.gba", 0x0073C120, (0x00958E00-0x0073C120)


@ >> 0x08958E00
