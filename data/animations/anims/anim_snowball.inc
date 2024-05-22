

anim_snowball_variant_0:
	mGetPalette 0x70, 16, 0xB0
	mGetTiles 0x1B0A3, 16
	.4byte	1, 0

	mAnimCmd4 

anim_snowball_variant_1:
	mGetPalette 0x70, 16, 0xB0
	mGetTiles 0x1B0B3, 9
	.4byte	1, 1

	mAnimCmd4 

anim_snowball_variant_2:
	mGetPalette 0x70, 16, 0xB0
	mGetTiles 0x1B0BC, 4
	.4byte	1, 2

	mAnimCmd4 

anim_snowball_variant_3:
	mGetPalette 0x70, 16, 0xB0
	mGetTiles 0x1B0C0, 1
	.4byte	1, 3

	mAnimCmd4 

anim_snowball_variant_4:
	mGetPalette 0x70, 16, 0xB0
	mGetTiles 0x1B0C1, 1
	.4byte	1, 4

	mAnimCmd4 


anim_snowball:
	.4byte anim_snowball_variant_0
	.4byte anim_snowball_variant_1
	.4byte anim_snowball_variant_2
	.4byte anim_snowball_variant_3
	.4byte anim_snowball_variant_4
