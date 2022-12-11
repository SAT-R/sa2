

anim_mp_cheese_sitting_variant_0:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2A84C 48
	.4byte	1, 0

	mAnimCmd4 

anim_mp_cheese_sitting_variant_1:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2A87C 48
	.4byte	1, 1

	mAnimCmd4 

anim_mp_cheese_sitting_variant_2:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2A8AC 48
	.4byte	1, 2

	mAnimCmd4 

anim_mp_cheese_sitting_variant_3:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2A8DC 48
	.4byte	3, 3

	mGetTiles 0x2A90C 48
	.4byte	3, 4

	mGetTiles 0x2A93C 48
	.4byte	3, 5

	mGetTiles 0x2A96C 48
	.4byte	3, 6

	mAnimCmd4 

anim_mp_cheese_sitting_variant_4:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2A99C 48
	.4byte	3, 7

	mAnimCmd4 

anim_mp_cheese_sitting_variant_5:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2A9CC 48
	.4byte	3, 8

	mGetTiles 0x2A9FC 48
	.4byte	3, 9

	mGetTiles 0x2AA2C 48
	.4byte	3, 10

	mGetTiles 0x2AA5C 48
	.4byte	3, 11

	mAnimCmd4 

anim_mp_cheese_sitting_variant_6:
	mGetPalette 0x2D0 16 0x80
	mGetTiles 0x2AA8C 48
	.4byte	3, 12

	mAnimCmd4 


anim_mp_cheese_sitting:
	.4byte anim_mp_cheese_sitting_variant_0
	.4byte anim_mp_cheese_sitting_variant_1
	.4byte anim_mp_cheese_sitting_variant_2
	.4byte anim_mp_cheese_sitting_variant_3
	.4byte anim_mp_cheese_sitting_variant_4
	.4byte anim_mp_cheese_sitting_variant_5
	.4byte anim_mp_cheese_sitting_variant_6
