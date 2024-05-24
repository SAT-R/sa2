

anim_multiplayer_unknown_variant_0:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28DC4, 46
	.4byte	1, 0

	mAnimCmd4 

anim_multiplayer_unknown_variant_1:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28DF2, 42
	.4byte	1, 1

	mAnimCmd4 

anim_multiplayer_unknown_variant_2:
	mGetPalette 0x2D1, 16, 0x10
	mGetTiles 0x28E1C, 12
	.4byte	1, 2

	mAnimCmd4 

anim_multiplayer_unknown_variant_3:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28E28, 18
	.4byte	1, 3

	mAnimCmd4 

anim_multiplayer_unknown_variant_4:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28E3A, 6
	.4byte	1, 4

	mAnimCmd4 

anim_multiplayer_unknown_variant_5:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28E40, 8
	.4byte	1, 5

	mAnimCmd4 

anim_multiplayer_unknown_variant_6:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28E48, 8
	.4byte	1, 6

	mAnimCmd4 

anim_multiplayer_unknown_variant_7:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28E50, 8
	.4byte	1, 7

	mAnimCmd4 

anim_multiplayer_unknown_variant_8:
	mGetPalette 0x2CE, 16, 0x0
	mGetTiles 0x28E58, 8
	.4byte	1, 8

	mAnimCmd4 

anim_multiplayer_unknown_variant_9:
	mGetPalette 0xA1, 16, 0x60
	mGetTiles 0x28E60, 1
	.4byte	4, 9

	mGetTiles 0x28E61, 1
	.4byte	4, 10

	mGetTiles 0x28E62, 1
	.4byte	4, 11

	mGetTiles 0x28E63, 1
	.4byte	4, 12

	mJumpBack 0x17

anim_multiplayer_unknown_variant_10:
	mGetPalette 0x2D1, 16, 0x10
	.4byte	1, -1

	mAnimCmd4 


anim_multiplayer_unknown:
	.4byte anim_multiplayer_unknown_variant_0
	.4byte anim_multiplayer_unknown_variant_1
	.4byte anim_multiplayer_unknown_variant_2
	.4byte anim_multiplayer_unknown_variant_3
	.4byte anim_multiplayer_unknown_variant_4
	.4byte anim_multiplayer_unknown_variant_5
	.4byte anim_multiplayer_unknown_variant_6
	.4byte anim_multiplayer_unknown_variant_7
	.4byte anim_multiplayer_unknown_variant_8
	.4byte anim_multiplayer_unknown_variant_9
	.4byte anim_multiplayer_unknown_variant_10
