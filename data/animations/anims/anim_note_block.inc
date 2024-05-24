

anim_note_block_variant_0:
	mGetPalette 0x6C, 16, 0x70
	mGetTiles 0x1AFB9, 4
	.4byte	1, 0

	mAnimCmd4 

anim_note_block_variant_1:
	mGetPalette 0x69, 16, 0x60
	mGetTiles 0x1AFBD, 4
	.4byte	1, 1

	mAnimCmd4 

anim_note_block_variant_2:
	mGetPalette 0x69, 16, 0x60
	mGetTiles 0x1AFC1, 4
	.4byte	1, 2

	mAnimCmd4 

anim_note_block_variant_3:
	mGetPalette 0x68, 16, 0x50
	mGetTiles 0x1AFC5, 4
	.4byte	1, 3

	mAnimCmd4 

anim_note_block_variant_4:
	mGetPalette 0x68, 16, 0x50
	mGetTiles 0x1AFC9, 4
	.4byte	1, 4

	mAnimCmd4 

anim_note_block_variant_5:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1AFCD, 4
	.4byte	1, 5

	mAnimCmd4 

anim_note_block_variant_6:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1AFD1, 4
	.4byte	1, 6

	mAnimCmd4 

anim_note_block_variant_7:
	mGetPalette 0x6C, 16, 0x70
	mGetTiles 0x1AFD5, 6
	.4byte	1, 7

	mAnimCmd4 

anim_note_block_variant_8:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x1AFDB, 6
	.4byte	1, 8

	mAnimCmd4 

anim_note_block_variant_9:
	mGetPalette 0x6D, 16, 0xB0
	mGetTiles 0x1AFE1, 6
	.4byte	1, 9

	mAnimCmd4 

anim_note_block_variant_10:
	mGetPalette 0x6D, 16, 0xB0
	mGetTiles 0x1AFE7, 6
	.4byte	1, 10

	mAnimCmd4 

anim_note_block_variant_11:
	mGetPalette 0x68, 16, 0x50
	mGetTiles 0x1AFED, 6
	.4byte	1, 11

	mAnimCmd4 

anim_note_block_variant_12:
	mGetPalette 0x68, 16, 0x50
	mGetTiles 0x1AFF3, 6
	.4byte	1, 12

	mAnimCmd4 

anim_note_block_variant_13:
	mGetPalette 0x17, 16, 0x40
	mGetTiles 0x1AFF9, 6
	.4byte	1, 13

	mAnimCmd4 

anim_note_block_variant_14:
	mGetPalette 0x44, 16, 0x80
	mGetTiles 0x1AFFF, 6
	.4byte	1, 14

	mAnimCmd4 

anim_note_block_variant_15:
	mGetPalette 0x6C, 16, 0x70
	mGetTiles 0x1B005, 1
	.4byte	1, 15

	mAnimCmd4 


anim_note_block:
	.4byte anim_note_block_variant_0
	.4byte anim_note_block_variant_1
	.4byte anim_note_block_variant_2
	.4byte anim_note_block_variant_3
	.4byte anim_note_block_variant_4
	.4byte anim_note_block_variant_5
	.4byte anim_note_block_variant_6
	.4byte anim_note_block_variant_7
	.4byte anim_note_block_variant_8
	.4byte anim_note_block_variant_9
	.4byte anim_note_block_variant_10
	.4byte anim_note_block_variant_11
	.4byte anim_note_block_variant_12
	.4byte anim_note_block_variant_13
	.4byte anim_note_block_variant_14
	.4byte anim_note_block_variant_15
